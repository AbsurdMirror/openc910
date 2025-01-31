import sys
import re
from collections import defaultdict
import json
import os

DEBUG = True

# 信号分组函数 输入整个未分组的信号列表
def signal_grouping(signal_list):
    result = {'name': "*"}
    for signal in signal_list:
        # print(f"[processing] {signal}")
        part_parent = result
        part_signal = signal
        while '_' in part_signal:
        # 找第一个_分割信号名称
            perfix, suffix = part_signal.split('_', 1)
            # print(f"[split] perfix: {perfix}, suffix: {suffix}")
            if perfix in part_parent:
                part_parent = part_parent[perfix]
                part_signal = suffix
                # print(f"[next level] {suffix}")
            else:
                remove_key = ""
                remove_from = False
                # 获取part_parent的key列表
                for key in list(part_parent.keys()):
                    if len(perfix) < len(key) and perfix+"_" == key[0:len(perfix)+1]:
                        # print(f"[regroup] {key}")

                        if "end" not in part_parent[key]:
                            with open('ERROR_signal_grouping.json', 'w', encoding='utf-8') as outfile:
                                json.dump(result, outfile, indent=4)
                            raise Exception(f"Error: signal grouping failed: {signal}, {perfix}, {suffix}, {key}")

                        part_parent[perfix] = {"name": part_parent['name'][:-1] + perfix + '_*'}
                        part_parent[perfix][key[len(perfix)+1:]] = {'name': part_parent[key]['name'], "end": True}
                        part_parent[perfix][suffix] = {}
                        remove_key = key
                        remove_from = part_parent

                        part_parent = part_parent[perfix][suffix]
                        part_signal = suffix
                        break
                if remove_from and remove_key:
                    del remove_from[remove_key]
                else:
                    # print(f"[new group] {part_signal}")
                    part_parent[part_signal] = {}
                    part_parent = part_parent[part_signal]
                break

        part_parent['name'] = signal
        part_parent['end'] = True
        # print(f"[final] {signal}")

        # if DEBUG:
        #     with open('DEBUG_signal_grouping.json', 'w', encoding='utf-8') as outfile:
        #         json.dump(result, outfile, indent=4)
        #     # 等待用户输入，以便查看当前的结果
        #     input("Press Enter to continue...")

        
        # parts = signal.split('_')
        
        # for part in parts:
        #     if part not in part_parent:
        #         # 剩余的part拼接

        #         part_parent[part] = {'name': part_parent['name'][:-1] + part + '_*'}
        #     part_parent = part_parent[part]
        # part_parent['name'] = signal
    return result

def process_file_inout(module, filename, signal_dict):
    # 定义正则表达式模式
    port_pattern = re.compile(r"(input|output)\s+(\[.+:.+\]\s+)?\s*(\w+)\s*;")

    signals = {
        "input": [],
        "output": []
    }

    try:
        with open(filename, "r", encoding="utf-8") as file:
            i = 0
            for line in file:
                i += 1
                # 去除行尾的换行符和可能的空白字符
                stripped_line = line.strip()

                # 使用正则表达式匹配函数模式
                if port_pattern.search(stripped_line):
                    match = port_pattern.search(stripped_line)
                    direction = match.group(1)
                    signal = match.group(3)
                    signals[direction].append(signal)
                    if signal not in signal_dict:
                        signal_dict[signal] = {
                            "src": False,
                            "dst": []
                        }

                    if direction == "output":
                        if signal_dict[signal]["src"]:
                            with open('ERROR_process_file_inout.json', 'w', encoding='utf-8') as outfile:
                                json.dump(signal_dict, outfile, indent=4)
                            raise Exception(f"Error: signal {module}.{signal} already has a source {signal_dict[signal]['src']}")
                        signal_dict[signal]["src"] = module
                    else:
                        signal_dict[signal]["dst"].append(module)


    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
        sys.exit(1)
    
    return signals["input"], signals["output"], signal_dict

def process_file(filename):

    # 定义正则表达式模式
    inst_start_pattern = re.compile(r"(\w+)\s+x_(\w+)\s\(")
    inst_end_pattern = re.compile(r"\s*\);\s*")
    inst_signal_pattern = re.compile(r"\.(\w+)\s*\((\w+)\)")

    inst_list = []
    inst = {}
    in_inst_code = False

    signal_dict = {}

    warning_msg = []

    try:
        with open(filename, "r", encoding="utf-8") as file:
            i = 0
            for line in file:
                i += 1
                # 去除行尾的换行符和可能的空白字符
                stripped_line = line.strip()

                # 使用正则表达式匹配函数模式
                if inst_start_pattern.search(stripped_line):
                    print("Find Function Start: ", stripped_line)
                    in_inst_code = True
                    match = inst_start_pattern.search(stripped_line)
                    inst = {
                        "module": match.group(1),
                        "inst": match.group(2),
                        "signals": [],
                        "signal_groups": None
                    }
                    continue

                if in_inst_code and inst_end_pattern.search(stripped_line):
                    print("Find Function End: ", stripped_line)
                    in_inst_code = False
                    # filename的目录路径
                    file_dir = os.path.dirname(filename)
                    inst_file_path = os.path.join(file_dir, inst["module"] + ".v")
                    input_signals, output_signals, signal_dict = process_file_inout(inst["module"] ,inst_file_path, signal_dict)
                    inst["input_signals"] = input_signals
                    inst["output_signals"] = output_signals
                    # inst["signal_groups"] = signal_grouping(inst["signals"])
                    inst["input_signal_groups"] = signal_grouping(inst["input_signals"])
                    inst["output_signal_groups"] = signal_grouping(inst["output_signals"])
                    inst_list.append(inst)
                    continue

                if in_inst_code and inst_signal_pattern.search(stripped_line):
                    print("In Instruction Code: ", stripped_line)
                    match = inst_signal_pattern.search(stripped_line)
                    inst["signals"].append(match.group(1))
                    if match.group(2) != match.group(1):
                        warning_msg.append(
                            f"Signal Inst Different Name: (Module {inst['module']}) (Line {i}) {stripped_line}"
                        )
                    continue

    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
        sys.exit(1)

    if DEBUG:
        with open('DEBUG_inst_list.json', 'w', encoding='utf-8') as outfile:
            json.dump(inst_list, outfile, indent=4)
        with open('DEBUG_signal_dict.json', 'w', encoding='utf-8') as outfile:
            json.dump(signal_dict, outfile, indent=4)
    
    for msg in warning_msg:
        # 黄色字体输出警告信息
        print("\033[93m{}\033[0m".format(msg))

    return inst_list

# 检查是否传入了文件名参数
if len(sys.argv) != 2:
    print("Usage: python script_name.py <filename>")
    sys.exit(1)

# 获取文件名参数
filename = sys.argv[1]

# 调用函数处理文件
process_file(filename)
