const fs = require('fs');
const path = require('path');
const process = require('process');

const DEBUG = true;

function signalGrouping(signalList) {
    const result = { name: "*" };
    for (const signal of signalList) {
        let partParent = result;
        let partSignal = signal;
        while (partSignal.includes('_')) {
            // const [prefix, suffix] = partSignal.split('_', 2);
            const index = partSignal.indexOf('_');
            var prefix, suffix;
            if (index === -1) {
                prefix = partSignal;
                suffix = "";
            }
            else {
                prefix = partSignal.substring(0, index);
                suffix = partSignal.substring(index + 1);
            }
            if (partParent.hasOwnProperty(prefix)) {
                partParent = partParent[prefix];
                partSignal = suffix;
            } else {
                let removeKey = "";
                let removeFrom = false;
                for (const key of Object.keys(partParent)) {
                    if (prefix.length < key.length && prefix + "_" === key.substring(0, prefix.length + 1)) {
                        if (!partParent[key].hasOwnProperty("end")) {
                            const fs = require('fs');
                            fs.writeFileSync('ERROR_signal_grouping.json', JSON.stringify(result, null, 4), 'utf-8');
                            throw new Error(`Error: signal grouping failed: ${signal}, ${prefix}, ${suffix}, ${key}`);
                        }

                        partParent[prefix] = { name: partParent['name'].slice(0, -1) + prefix + '_*' };
                        partParent[prefix][key.substring(prefix.length + 1)] = { name: partParent[key]['name'], end: true };
                        partParent[prefix][suffix] = {};
                        removeKey = key;
                        removeFrom = partParent;

                        partParent = partParent[prefix][suffix];
                        partSignal = suffix;
                        break;
                    }
                }
                if (removeFrom && removeKey) {
                    delete removeFrom[removeKey];
                } else {
                    partParent[partSignal] = {};
                    partParent = partParent[partSignal];
                }
                break;
            }
        }

        partParent['name'] = signal;
        partParent['end'] = true;
    }
    return result;
}

function processFileInput(module, filename, signalDict) {
    // Define regular expression pattern
    const portPattern = /(input|output)\s+(\[(.+):(.+)\]\s+)?\s*(\w+)\s*;/;

    const signals = {
        input: [],
        output: []
    };

    try {
        const fileContent = fs.readFileSync(filename, 'utf-8');
        const lines = fileContent.split('\n');

        for (let i = 0; i < lines.length; i++) {
            const strippedLine = lines[i].trim();

            // Use regular expression to match function pattern
            const match = portPattern.exec(strippedLine);
            if (match) {
                const direction = match[1];
                const signal = match[3];
                signals[direction].push(signal);
                if (!signalDict[signal]) {
                    signalDict[signal] = {
                        src: false,
                        dst: []
                    };
                }

                if (direction === "output") {
                    if (signalDict[signal].src) {
                        fs.writeFileSync('ERROR_process_file_inout.json', JSON.stringify(signalDict, null, 4), 'utf-8');
                        throw new Error(`Error: signal ${module}.${signal} already has a source ${signalDict[signal].src}`);
                    }
                    signalDict[signal].src = module;
                } else {
                    signalDict[signal].dst.push(module);
                }
            }
        }
    } catch (err) {
        if (err.code === 'ENOENT') {
            console.error(`Error: The file '${filename}' was not found.`);
            process.exit(1);
        } else {
            throw err;
        }
    }

    return [signals.input, signals.output, signalDict];
}

function processFile(filename) {
    // Define regular expression patterns
    const instStartPattern = /(\w+)\s+x_(\w+)\s\(/;
    const instEndPattern = /\s*\);\s*/;
    const instSignalPattern = /\.(\w+)\s*\((\w+)\)/;

    const instList = [];
    let inst = {};
    let inInstCode = false;

    const signalDict = {};

    const warningMsg = [];

    try {
        const fileContent = fs.readFileSync(filename, 'utf-8');
        const lines = fileContent.split('\n');
        for (let i = 0; i < lines.length; i++) {
            const line = lines[i];
            // Remove trailing newline and possible whitespace
            const strippedLine = line.trim();

            // Use regular expressions to match function patterns
            if (instStartPattern.test(strippedLine)) {
                console.log("Find Function Start: ", strippedLine);
                inInstCode = true;
                const match = instStartPattern.exec(strippedLine);
                inst = {
                    module: match[1],
                    inst: match[2],
                    signals: [],
                    signalGroups: null
                };
                continue;
            }

            if (inInstCode && instEndPattern.test(strippedLine)) {
                console.log("Find Function End: ", strippedLine);
                inInstCode = false;
                // Directory path of the filename
                const fileDir = path.dirname(filename);
                const instFilePath = path.join(fileDir, inst.module + '.v');
                const [inputSignals, outputSignals, updatedSignalDict] = processFileInput(inst.module, instFilePath, signalDict);
                inst.inputSignals = inputSignals;
                inst.outputSignals = outputSignals;
                // inst.signalGroups = signalGrouping(inst.signals);
                inst.inputSignalGroups = signalGrouping(inst.inputSignals);
                inst.outputSignalGroups = signalGrouping(inst.outputSignals);
                instList.push(inst);
                continue;
            }

            if (inInstCode && instSignalPattern.test(strippedLine)) {
                console.log("In Instruction Code: ", strippedLine);
                const match = instSignalPattern.exec(strippedLine);
                inst.signals.push(match[1]);
                if (match[2] !== match[1]) {
                    warningMsg.push(
                        `Signal Inst Different Name: (Module ${inst.module}) (Line ${i + 1}) ${strippedLine}`
                    );
                }
                continue;
            }
        }
    } catch (err) {
        if (err.code === 'ENOENT') {
            console.error(`Error: The file '${filename}' was not found.`);
            process.exit(1);
        } else {
            throw err;
        }
    }

    if (DEBUG) {
        fs.writeFileSync('DEBUG_inst_list.json', JSON.stringify(instList, null, 4), 'utf-8');
        fs.writeFileSync('DEBUG_signal_dict.json', JSON.stringify(signalDict, null, 4), 'utf-8');
    }

    for (const msg of warningMsg) {
        // Output warning messages in yellow font
        console.warn(`\x1b[33m${msg}\x1b[0m`);
    }

    return instList;
}

if (process.argv.length !== 3) {
    console.log("Usage: node script_name.js <filename>");
    process.exit(1);
}

// Get the filename argument
const filename = process.argv[2];

// Call the function to process the file
processFile(filename);

