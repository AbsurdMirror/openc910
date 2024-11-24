from collections import defaultdict

# 输入字符串列表
input_strings = [
    "addrgen_btb_index",
    "addrgen_btb_tag",
    "addrgen_btb_target_pc",
    "addrgen_btb_update_vld",
    "btb_ifctrl_inv_done",
    "btb_ifctrl_inv_on",
    "btb_ifdp_way0_pred",
    "btb_ifdp_way0_tag",
    "btb_ifdp_way0_target",
    "btb_ifdp_way0_vld",
    "btb_ifdp_way1_pred",
    "btb_ifdp_way1_tag",
    "btb_ifdp_way1_target",
    "btb_ifdp_way1_vld",
    "btb_ifdp_way2_pred",
    "btb_ifdp_way2_tag",
    "btb_ifdp_way2_target"
]

# 创建一个默认字典来存储结果
result = defaultdict(list)

# 遍历输入字符串列表
for string in input_strings:
    # 找到前缀和后缀
    parts = string.split('_', 2)
    prefix = '_'.join(parts[:2])
    suffix = parts[2] if len(parts) > 2 else ''
    
    # 将后缀添加到对应的前缀列表中
    result[prefix].append(suffix)

# 将defaultdict转换为普通字典并打印结果
result_dict = dict(result)
print(result_dict)
