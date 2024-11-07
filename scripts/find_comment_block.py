import sys
import re

def find_code_blocks(file_path):
    # 读取文件内容
    with open(file_path, 'r') as file:
        lines = file.readlines()

    # 初始化变量
    code_blocks = []
    current_block = []
    block_started = False
    block_pattern = r'^\s*//=+$'
    comment_pattern = r'^\s*//.*$'

    # 遍历文件的每一行
    for i, line in enumerate(lines):
        stripped_line = line.strip()
        
        # 检查是否是代码块的开始或结束
        if re.match(block_pattern, stripped_line):
            if block_started:
                current_block.append((stripped_line, i + 1))  # 保存注释行及其行号
                # 结束当前代码块
                code_blocks.append((current_block, i + 2 - len(current_block)))  # 保存代码块及其起始行号
                current_block = []  # 重置当前代码块
                block_started = False
            else:
                # 开始一个新的代码块
                block_started = True
                if current_block:  # 确保不将前面的内容错误地添加到新块中
                    raise ValueError(f"Unexpected non-block content before block start at line {i + 1}")
                current_block.append((stripped_line, i + 1))  # 保存注释行及其行号

        # 如果当前块已启动，检查行是否是有效注释
        elif block_started and re.match(comment_pattern, stripped_line):
            current_block.append((stripped_line, i + 1))  # 保存注释行及其行号
        
        # 如果遇到不符合条件的内容且当前块已启动，则抛出错误（可选）
        # 可以根据需要改为忽略后续内容或其他处理方式
        elif block_started and not re.match(comment_pattern, stripped_line):
            raise ValueError(f"Unexpected non-comment content in block at line {i + 1}")

    # 处理文件末尾的代码块（如果有）
    if block_started and current_block:
        code_blocks.append((current_block, i + 1 - len(current_block) + 1))  # 保存代码块及其起始行号（调整以匹配文件末尾）

    return code_blocks

def print_code_blocks(code_blocks):
    for block, start_line in code_blocks:
        print(f"- Block starting at line {start_line}:\n```")
        for line, line_num in block:
            print(f"{line_num}: {line}")
        print(f"```")
        print()  # 空行分隔不同代码块

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python script.py <filename>")
        sys.exit(1)

    file_name = sys.argv[1]
    try:
        code_blocks = find_code_blocks(file_name)
        print_code_blocks(code_blocks)
    except FileNotFoundError:
        print(f"Error: File '{file_name}' not found.")
    except Exception as e:
        print(f"Exception Error: {e}")