// 引入同目录下的parser.js文件的SimpleCodeParser类
const fs = require('fs');
const SimpleCodeParser = require('./parser');

import { Low } from 'lowdb'
import { JSONFile } from 'lowdb/node'

const rules = [
    {
        type: 'port',
        pattern: /(input|output)\s+(\[(.+):(.+)\]\s+)?\s*(\w+)\s*;/,
        callback: (match) => {
            return {
                type: 'port',
                direction: match[1],
                width_begin: match[3] ? match[3] : '0',
                width_end: match[4] ? match[4] : '0',
                name: match[5],
            };
        }
    },
    {
        type: 'module',
        pattern: /module\s+(\w+)\s*/,
        callback: (match) => {
            return { type: 'module', module_name: match[1] };
        }
    },
    {
        type: 'endmodule',
        pattern: /endmodule/,
        callback: (match) => {
            return { type: 'endmodule' };
        }
    }
];

const submodule_parser = new SimpleCodeParser(rules);

function parse_submodule(module, filename, signalDict) {

    const adapter = new JSONFile<Data>(`${module}.json`, { data: [] })

    // db 设置为数组
    db.defaults({ data: [] }).write();

    const signals = {
        input: [],
        output: []
    };

    const parsed_code = [];

    let module_begin = false;
    let module_end = false;

    try {
        const fileContent = fs.readFileSync(filename, 'utf-8');
        const lines = fileContent.split('\n');

        for (let i = 0; i < lines.length; i++) {
            const strippedLine = lines[i].trim();
            const result = submodule_parser.parse(strippedLine);
            // console.log(result);
            if (result) {
                result['line'] = i + 1;

                switch (result.type) {
                    case 'module':
                        if (result.module_name === module) {
                            parsed_code.push(result);
                            module_begin = true;
                        }
                        break;
                    case 'endmodule':
                        module_end = true;
                        parsed_code.push(result);
                        break;
                    case 'port':
                        parsed_code.push(result);
                        signals[result.direction] = {
                            name: result.name,
                            width_begin: result.width_begin,
                            width_end: result.width_end
                        };
                    default:
                        break;
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

    return [signals, signalDict, parsed_code];
}

test = parse_submodule(
    'ct_ifu_top',
    'C:/Users/dongzhengxiang/Desktop/study-note/openc910/C910_RTL_FACTORY/gen_rtl/ifu/rtl/ct_ifu_top.v',
    {}
);

// json打印test
console.log(JSON.stringify(test));
