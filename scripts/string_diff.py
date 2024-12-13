import difflib
 
def mask_differences(str1, str2):
    # 使用SequenceMatcher找到两个字符串之间的差异
    sequence_matcher = difflib.SequenceMatcher(None, str1, str2)
    opcodes = sequence_matcher.get_opcodes()
    
    # 初始化结果字符串
    result = []
    
    # 遍历操作码，并根据操作码构建结果字符串
    for tag, i1, i2, j1, j2 in opcodes:
        if tag == "replace":
            # 对于"replace"操作，我们用星号替换不同部分
            # 注意：这里我们简单地用与替换长度相同的星号串替换，
            # 但也可以根据需要调整替换策略，比如只替换不同的字符。
            result.append('*' * (j2 - j1))
        elif tag == "delete":
            # 对于"delete"操作（只在str1中有），我们用星号替换
            result.append('*' * (i2 - i1))
        elif tag == "insert":
            # 对于"insert"操作（只在str2中有），我们用星号替换（但在结果中这部分是多余的，
            # 因为我们是基于str1构建结果的，所以这里实际上不需要添加任何内容，
            # 但为了保持结果长度一致，我们可以选择添加空格或保持原样（即不添加任何内容，
            # 因为后面的"equal"部分会覆盖这里）。然而，由于我们要用星号表示不同，
            # 并且考虑到后续"equal"部分可能不存在，我们还是添加相应长度的星号。）
            # 注意：这里的处理可能需要根据实际需求调整。
            result.append('*' * (j2 - j1))
        elif tag == "equal":
            # 对于"equal"操作，我们直接添加str1中的相应部分
            result.append(str1[i1:i2])
    
    # 将结果列表转换为字符串并返回
    # 注意：由于我们可能添加了额外的星号（特别是在"insert"操作中），
    # 所以结果字符串的长度可能会比原始字符串长。
    # 如果需要严格保持与较长字符串相同的长度，并且不介意在"equal"部分之后有额外的星号，
    # 可以不做处理；否则，可能需要进一步调整算法来避免这种情况。
    return ''.join(result)

def calculate_similarity(str1, str2):
    # 使用SequenceMatcher计算相似度
    sequence_matcher = difflib.SequenceMatcher(None, str1, str2)
    similarity_ratio = sequence_matcher.ratio()
    return similarity_ratio

# 示例字符串
str1 = "hello world"
str2 = "heo worlx"
 
# 调用函数并打印结果
masked_result = mask_differences(str1, str2)
# 由于我们的算法可能在"insert"操作中添加了额外的星号，我们需要截断结果
# 以匹配较长字符串的长度，或者我们可以选择不这样做并接受可能更长的结果。
# 这里我们选择截断结果以匹配较长字符串的长度（但不超过它）。
print(f"相同部分表示为（可能较长）: {masked_result}")
masked_result = masked_result[:max(len(str1), len(str2))]
print(f"相同部分表示为（截断以匹配较长字符串长度）: {masked_result}")
 

print(f"相似度为: {calculate_similarity(str1, str2)}")