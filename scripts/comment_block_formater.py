import sys
import re

def comment_block_formater(file_path):
    # 读取文件内容
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # 初始化变量
    block_pattern = r'^\s*//=+$'
    comment_pattern = r'^\s*//.*$'
    signal_def_comment_pattern = r'^\/\/ &(Ports|Regs|Wires|ModuleEnd); @\d+$'
    signal_def_pattern = r'^(reg|wire|input|output|inout).*$'
    module_def_pattern = r'^(module \w+\()|(endmodule)$'

    in_comment_block = False

    # 遍历文件的每一行
    for i, line in enumerate(lines):
        stripped_line = line.strip()
        #移除最后的\n
        line = line.rstrip()
        
        # 如果是空行直接输出
        if not stripped_line:
            print("")
        elif re.match(block_pattern, signal_def_pattern):
            print(f"  {line}")
        elif re.match(signal_def_comment_pattern, stripped_line):
            print(line)
        elif re.match(module_def_pattern, stripped_line):
            print(line)
        elif re.match(block_pattern, stripped_line):
            print(line)
            in_comment_block = not in_comment_block
        elif re.match(comment_pattern, stripped_line) and in_comment_block:
            print(line)
        else:
            print(f"  {line}")

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <filename>")
        sys.exit(1)

    file_name = sys.argv[1]
    try:
        comment_block_formater(file_name)
    except FileNotFoundError:
        print(f"Error: File '{file_name}' not found.")
    except Exception as e:
        print(f"Exception Error: {e}")