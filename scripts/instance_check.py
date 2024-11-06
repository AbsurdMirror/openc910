import sys
import re

def process_file(filename):
    # 初始化标志变量
    found_reg = False
    found_assign = False
    found_always = False

    # 定义正则表达式模式
    pattern = re.compile(r"\w+\s+x_\w+\s+\(")

    try:
        with open(filename, 'r', encoding='utf-8') as file:
            for line in file:
                # 去除行尾的换行符和可能的空白字符
                stripped_line = line.strip()
                
                # 检查是否包含字符串 "&Instance"
                if "&Instance" in stripped_line:
                    print(stripped_line)

                # 使用正则表达式匹配模式
                if pattern.search(stripped_line):
                    print(stripped_line)

                # 检查是否包含字符串 "reg"
                if "reg " in stripped_line:
                    found_reg = True

                # 检查是否包含字符串 "assign"
                if "assign " in stripped_line:
                    found_assign = True

                # 检查是否包含字符串 "always"
                if "always" in stripped_line:
                    found_always = True

    except FileNotFoundError:
        print(f"Error: The file '{filename}' was not found.")
        sys.exit(1)

    # 打印文件是否存在 "reg"
    if found_reg:
        print(f"The file contains 'reg'")
    else:
        print(f"The file does not contain 'reg'")

    # 打印文件是否存在 "assign"
    if found_assign:
        print(f"The file contains 'assign'")
    else:
        print(f"The file does not contain 'assign'")

    # 打印文件是否存在 "always"
    if found_always:
        print(f"The file contains 'always'")
    else:
        print(f"The file does not contain 'always'")

# 检查是否传入了文件名参数
if len(sys.argv) != 2:
    print("Usage: python script_name.py <filename>")
    sys.exit(1)

# 获取文件名参数
filename = sys.argv[1]

# 调用函数处理文件
process_file(filename)