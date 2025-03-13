# ct_ifu_pcgen

## 接口信号列表

### 时钟和复位信号
|信号名|方向|位宽|说明|
|-|-|-|-|
|forever_cpuclk|input|1|CPU时钟信号|
|cpurst_b|input|1|CPU复位信号，低电平有效|
|cp0_yy_clk_en|input|1|CP0模块时钟使能信号|
|cp0_ifu_icg_en|input|1|IFU模块时钟门控使能|
|pad_yy_icg_scan_en|input|1|扫描时钟使能信号|

### PC更新信号
|group|信号名|方向|位宽|说明|
|-|-|-|-|-|
|HAD|had_ifu_pc|input|39|来自HAD模块的PC值|
|^|had_ifu_pcload|input|1|HAD模块PC加载使能|
|Vector|vector_pcgen_pc|input|39|向量处理单元PC值|
|^|vector_pcgen_pcload|input|1|向量处理单元PC加载使能|
|RTU|rtu_ifu_chgflw_pc|input|39|RTU模块PC跳转地址|
|^|rtu_ifu_chgflw_vld|input|1|RTU模块PC跳转有效|
|IU|iu_ifu_chgflw_pc|input|63|IU模块PC跳转地址|
|^|iu_ifu_chgflw_vld|input|1|IU模块PC跳转有效|
|Addrgen|addrgen_pcgen_pc|input|39|地址生成单元PC值|
|^|addrgen_pcgen_pcload|input|1|地址生成单元PC加载使能|
|IB_ChgFlw|ibctrl_pcgen_pc|input|39|指令缓冲控制PC值|
|^|ibctrl_pcgen_pcload|input|1|指令缓冲控制PC加载使能|
|IP_ChgFlw|ipctrl_pcgen_chgflw_pc|input|39|预取控制PC跳转地址|
|^|ipctrl_pcgen_chgflw_pcload|input|1|预取控制PC跳转加载|
|IP_Reissue|ipctrl_pcgen_reissue_pc|input|39|预取控制重发射PC值|
|^|ipctrl_pcgen_reissue_pcload|input|1|预取控制重发射加载|
|IF_ChgFlw|ifctrl_pcgen_chgflw_no_stall_mask|input|1|取指阶段无暂停掩码信号|
|^|ifctrl_pcgen_pcload_pc|input|39|取指控制PC加载值|
|IF_Stall|ifctrl_pcgen_stall|input|1|取指控制暂停信号|
|IF_INC|ifctrl_pcgen_reissue_pcload|input|1|取指控制重发射加载使能|

## way_pred更新信号

|信号名|方向|位宽|说明|
|-|-|-|-|
|ibctrl_pcgen_way_pred|input|2|指令缓冲控制路径预测|
|ipctrl_pcgen_chgflw_way_pred|input|2|预取控制PC跳转路径预测|
|ipctrl_pcgen_reissue_way_pred|input|2|预取控制重发射路径预测|
|ifctrl_pcgen_way_pred|input|2|取指控制路径预测|
|cp0_ifu_iwpe|input|1|CP0模块指令路径预测使能信号|
|ipctrl_pcgen_inner_way0|input|1|预取控制内部way0路径信号|
|ipctrl_pcgen_inner_way1|input|1|预取控制内部way1路径信号|
|ipctrl_pcgen_inner_way_pred|input|2|预取控制内部路径预测信号|

### 其他控制信号

|信号名|方向|位宽|说明|
|-|-|-|-|
|ifctrl_pcgen_chgflw_vld|input|1|取指阶段流变更有效信号|
|vector_pcgen_reset_on|input|1|向量处理单元复位使能|
|rtu_ifu_xx_dbgon|input|1|RTU模块调试使能|
|rtu_ifu_xx_expt_vld|input|1|RTU模块异常有效信号|
|ibctrl_pcgen_ip_stall|input|1|指令缓冲控制IP级暂停|
|ibctrl_pcgen_pcload_vld|input|1|指令缓冲控制PC加载有效|
|ifctrl_pcgen_ins_icache_inv_done|input|1|指令缓存失效完成信号|
|ifctrl_pcgen_stall_short|input|1|短暂暂停控制信号|
|ipctrl_pcgen_branch_mistaken|input|1|分支预测错误指示|
|ipctrl_pcgen_branch_taken|input|1|分支指令taken指示|
|ipctrl_pcgen_chk_err_reissue|input|1|检查错误重发射信号|
|ipctrl_pcgen_h0_vld|input|1|H0指令有效信号|
|ipctrl_pcgen_if_stall|input|1|IF级暂停信号|
|ipctrl_pcgen_taken_pc|input|39|分支taken的目标PC|
|lbuf_pcgen_active|input|1|循环缓冲区激活信号|
|lbuf_pcgen_vld_mask|input|1|循环缓冲区有效掩码|

### 输出信号

|信号名|方向|位宽|说明|
|-|-|-|-|
|ifu_mmu_abort|output|1|IFU向MMU发送的中止信号|
|ifu_mmu_va|output|63|IFU向MMU发送的虚拟地址|
|ifu_mmu_va_vld|output|1|IFU向MMU发送的虚拟地址有效信号|
|ifu_rtu_cur_pc|output|39|IFU向RTU发送的当前PC值|
|ifu_rtu_cur_pc_load|output|1|IFU向RTU发送的当前PC加载使能|
|pcgen_addrgen_cancel|output|1|PC生成器向地址生成单元发送的取消信号|
|pcgen_bht_chgflw|output|1|PC生成器向BHT发送的流变更信号|
|pcgen_bht_chgflw_short|output|1|PC生成器向BHT发送的短流变更信号|
|pcgen_bht_ifpc|output|7|PC生成器向BHT发送的IF阶段PC值|
|pcgen_bht_pcindex|output|10|PC生成器向BHT发送的PC索引|
|pcgen_bht_seq_read|output|1|PC生成器向BHT发送的顺序读取使能|
|pcgen_btb_chgflw|output|1|PC生成器向BTB发送的流变更信号|
|pcgen_btb_chgflw_higher_than_addrgen|output|1|高于地址生成单元优先级的BTB流变更|
|pcgen_btb_chgflw_higher_than_if|output|1|高于IF阶段优先级的BTB流变更|
|pcgen_btb_chgflw_higher_than_ip|output|1|高于IP阶段优先级的BTB流变更|
|pcgen_btb_chgflw_short|output|1|PC生成器向BTB发送的短流变更信号|
|pcgen_btb_index|output|10|PC生成器向BTB发送的索引值|
|pcgen_btb_stall|output|1|PC生成器向BTB发送的暂停信号|
|pcgen_btb_stall_short|output|1|PC生成器向BTB发送的短暂停信号|
|pcgen_debug_chgflw|output|1|调试用流变更信号|
|pcgen_debug_pcbus|output|14|调试用PC总线值|
|pcgen_ibctrl_bju_chgflw|output|1|向指令缓冲控制发送的BJU流变更|
|pcgen_ibctrl_cancel|output|1|向指令缓冲控制发送的取消信号|
|pcgen_ibctrl_ibuf_flush|output|1|向指令缓冲控制发送的缓冲区刷新信号|
|pcgen_ibctrl_lbuf_flush|output|1|向指令缓冲控制发送的循环缓冲区刷新信号|
|pcgen_icache_if_chgflw|output|1|向I-Cache发送的IF阶段流变更信号|
|pcgen_icache_if_chgflw_bank0|output|1|向I-Cache bank0发送的流变更信号|
|pcgen_icache_if_chgflw_bank1|output|1|向I-Cache bank1发送的流变更信号|
|pcgen_icache_if_chgflw_bank2|output|1|向I-Cache bank2发送的流变更信号|
|pcgen_icache_if_chgflw_bank3|output|1|向I-Cache bank3发送的流变更信号|
|pcgen_icache_if_chgflw_short|output|1|向I-Cache发送的短流变更信号|
|pcgen_icache_if_gateclk_en|output|1|I-Cache IF阶段时钟门控使能|
|pcgen_icache_if_index|output|16|向I-Cache发送的索引值|
|pcgen_icache_if_seq_data_req|output|1|向I-Cache发送的顺序数据请求|
|pcgen_icache_if_seq_data_req_short|output|1|向I-Cache发送的短顺序数据请求|
|pcgen_icache_if_seq_tag_req|output|1|向I-Cache发送的顺序标签请求|
|pcgen_icache_if_way_pred|output|2|向I-Cache发送的路径预测值|
|pcgen_ifctrl_cancel|output|1|向IF控制发送的取消信号|
|pcgen_ifctrl_pc|output|39|向IF控制发送的PC值|
|pcgen_ifctrl_pipe_cancel|output|1|向IF控制发送的流水线取消信号|
|pcgen_ifctrl_reissue|output|1|向IF控制发送的重发射信号|
|pcgen_ifctrl_way_pred|output|2|向IF控制发送的路径预测值|
|pcgen_ifctrl_way_pred_stall|output|1|向IF控制发送的路径预测暂停信号|
|pcgen_ifdp_inc_pc|output|39|向IF数据通路发送的增量PC值|
|pcgen_ifdp_pc|output|39|向IF数据通路发送的PC值|
|pcgen_ifdp_way_pred|output|2|向IF数据通路发送的路径预测值|
|pcgen_ipb_chgflw|output|1|向IP缓冲发送的流变更信号|
|pcgen_ipctrl_cancel|output|1|向IP控制发送的取消信号|
|pcgen_ipctrl_pipe_cancel|output|1|向IP控制发送的流水线取消信号|
|pcgen_l0_btb_chgflw_mask|output|1|向L0 BTB发送的流变更掩码|
|pcgen_l0_btb_chgflw_pc|output|15|向L0 BTB发送的流变更PC值|
|pcgen_l0_btb_chgflw_vld|output|1|向L0 BTB发送的流变更有效信号|
|pcgen_l0_btb_if_pc|output|39|向L0 BTB发送的IF阶段PC值|
|pcgen_l1_refill_chgflw|output|1|向L1缓存重填发送的流变更信号|
|pcgen_sfp_pc|output|17|向SFP发送的PC值|


## Change Flow场景分析

|场景|说明|
|-|-|
|HAD Change Flow|来自HAD（Hardware Debug）模块的PC跳转，具有最高优先级，用于调试和硬件控制|
|Vector Change Flow|来自向量处理单元的PC跳转，用于处理向量指令的执行流程|
|RTU Change Flow|来自RTU（Retire Unit）的PC跳转，处理指令提交阶段的控制流变化|
|IU Change Flow|来自IU（Integer Unit）的PC跳转，处理整数运算单元产生的分支跳转|
|Addrgen Change Flow|来自地址生成单元的PC跳转，处理指令预取和地址计算相关的跳转|
|IB Stage Change Flow|来自指令缓冲阶段的PC跳转，包括RAS、间接BTB和LBUF产生的跳转|
|IP Stage Reissue|来自指令预取阶段的重新发射，处理缓存缺失或预测错误的重新取指|
|IP Stage Change Flow|来自指令预取阶段的PC跳转，处理预取阶段发现的控制流变化|
|IF Stage Reissue|来自指令获取阶段的重新发射，处理取指阶段的异常或重新取指需求|
|PC Increase|正常的PC递增，当没有跳转发生时，PC按顺序递增|


## Change Flow优先级和PC来源

|场景|优先级|PC来源|
|-|-|-|
|HAD Change Flow|1|来自had_ifu_pc[PC_WIDTH-2:0]，直接使用硬件调试模块提供的PC值|
|Vector Change Flow|2|来自vector_pcgen_pc[PC_WIDTH-2:0]，使用向量处理单元计算的目标PC|
|RTU Change Flow|3|来自rtu_ifu_chgflw_pc[PC_WIDTH-2:0]，使用指令提交单元提供的PC值|
|IU Change Flow|4|来自iu_ifu_chgflw_pc[PC_WIDTH-2:0]，使用整数运算单元计算的分支目标地址|
|Addrgen Change Flow|5|来自addrgen_pcgen_pc[PC_WIDTH-2:0]，使用地址生成单元计算的目标PC|
|IB Stage Change Flow|6|来自ibctrl_pcgen_pc[PC_WIDTH-2:0]，可能来源：<br>- RAS：函数返回地址栈保存的返回地址<br>- 间接BTB：间接跳转的目标地址<br>- LBUF：循环缓冲区的跳转地址|
|IP Stage Reissue|7|来自ipctrl_pcgen_reissue_pc[PC_WIDTH-2:0]，使用需要重新取指的PC地址|
|IP Stage Change Flow|8|来自ipctrl_pcgen_chgflw_pc[PC_WIDTH-2:0]，使用指令预取阶段检测到的跳转目标地址|
|IF Stage Reissue|9|来自ifctrl_pcgen_pcload_pc[PC_WIDTH-2:0]，使用取指阶段需要重新取指的PC地址|
|PC Increase|10|来自inc_pc[PC_WIDTH-2:0]，通过当前PC值加上指令长度计算得到|

## Change Flow场景下的pc_bus取值

|场景|pc_bus[15:0]|说明|
|-|-|-|
|HAD Change Flow|inc_pc[15:0]|使用硬件调试模块提供的PC值，优先级最高|
|Vector Change Flow|^|使用向量处理单元计算的目标PC值|
|RTU Change Flow|^|使用指令提交单元提供的PC值|
|IU Change Flow|iu_ifu_chgflw_pc[15:0]|使用整数运算单元计算的分支目标地址，当iu_ifu_chgflw_vld有效时选择|
|Addrgen Change Flow|addrgen_pcgen_pc[15:0]|使用地址生成单元计算的目标PC，当addrgen_pcgen_pcload有效时选择|
|IB Stage Change Flow|ibctrl_pcgen_pc[15:0]|使用指令缓冲阶段提供的PC值，当ibctrl_pcgen_pcload有效时选择|
|IP Stage Reissue|ipctrl_pcgen_reissue_pc[15:0]|使用需要重新取指的PC地址，当ipctrl_pcgen_reissue_pcload有效时选择|
|IP Stage Change Flow|ipctrl_pcgen_chgflw_pc[15:0]|使用指令预取阶段检测到的跳转目标地址，当ipctrl_pcgen_chgflw_pcload有效时选择|
|IF Stage Reissue|ifctrl_pcgen_pcload_pc[15:0]|使用取指阶段需要重新取指的PC地址，当ifctrl_pcgen_chgflw_no_stall_mask有效时选择|
|PC Increase|inc_pc[15:0]|当以上所有条件都不满足时，使用PC递增后的值|

## Cancel 场景分析

### IF 阶段取消（pcgen_ifctrl_cancel）
IF 阶段的取消信号会在以下情况触发：
- 当发生不包含 L0 BTB 的程序流变更时（pcgen_chgflw_without_l0_btb）
  - 原因：确保高优先级的程序流变更（如异常、中断等）能够立即生效，避免 L0 BTB 的预测干扰
- RTU 模块发出异常有效信号时（rtu_ifu_xx_expt_vld）
  - 原因：处理器发生异常时需要立即停止当前指令流的执行，转向异常处理程序
- 调试模式切换时（dbg_cancel）
  - 原因：进入调试模式时需要停止正常指令流的执行，确保调试器能够完全控制处理器状态

IF 阶段的流水线专用取消信号（pcgen_ifctrl_pipe_cancel）处理以下情况：
- IP 阶段取消时
  - 原因：IP 阶段的取消需要传递到 IF 阶段，确保流水线的一致性
- 循环缓冲区有效掩码生效时（lbuf_pcgen_vld_mask）
  - 原因：循环缓冲区激活时需要停止常规取指流程，转而从循环缓冲区获取指令
- IP 阶段检查错误需要重发射时（ipctrl_pcgen_chk_err_reissue）
  - 原因：指令预取阶段检测到错误（如缓存错误）时需要重新取指
- IP 阶段发生程序流变更且 IP 阶段未停顿时
  - 原因：确保 IP 阶段的程序流变更能够及时反映到 IF 阶段，避免取错指令

### IP 阶段取消（pcgen_ipctrl_cancel）
IP 阶段的取消信号在以下情况下触发：
- HAD 调试模块加载 PC 时
  - 原因：调试器接管处理器控制时需要停止当前的指令预取
- 向量处理单元加载 PC 时
  - 原因：处理向量指令时需要切换到新的指令流
- RTU 模块发生程序流变更时
  - 原因：指令提交阶段发现需要改变执行流（如异常返回、中断返回等）
- IU 模块发生程序流变更时
  - 原因：分支指令或跳转指令的实际执行结果与预测不符
- 地址生成单元加载 PC 时
  - 原因：新的取指地址生成后需要取消当前的预取操作
- 指令缓冲控制加载 PC 时
  - 原因：指令缓冲区控制逻辑决定改变取指地址（如间接跳转目标确定）
- RTU 模块发出异常有效信号时
  - 原因：发生异常时需要立即停止指令预取
- 调试模式切换时
  - 原因：进入调试模式时需要停止所有正常的指令预取活动

IP 阶段的流水线取消信号还包括：
- 循环缓冲区有效掩码生效时
  - 原因：需要从循环缓冲区而不是 I-Cache 获取指令
- 指令缓冲控制加载且 IP 阶段未停顿时
  - 原因：确保新的取指地址能够立即生效

### IB 阶段取消（pcgen_ibctrl_cancel）
IB 阶段的取消条件包括：
- HAD 调试模块加载 PC 时
  - 原因：调试器接管控制时需要清空指令缓冲
- 向量处理单元加载 PC 时
  - 原因：切换到向量处理模式时需要清空普通指令
- RTU 模块发生程序流变更时
  - 原因：指令提交阶段的流程改变使得缓冲区中的指令失效
- IU 模块发生程序流变更时
  - 原因：分支预测错误导致缓冲的指令无效
- RTU 模块发出异常有效信号时
  - 原因：发生异常时缓冲区中的指令都不应继续执行
- 调试模式切换时
  - 原因：进入调试模式时需要清空所有缓冲的指令

### 地址生成阶段取消（pcgen_addrgen_cancel）
地址生成阶段在以下高优先级事件发生时取消：
- HAD 调试模块加载 PC 时
  - 原因：调试器提供的地址优先级最高
- 向量处理单元加载 PC 时
  - 原因：向量处理的地址计算需要特殊处理
- RTU 模块发生程序流变更时
  - 原因：提交阶段的流程改变优先级高于地址生成
- IU 模块发生程序流变更时
  - 原因：分支跳转的实际目标地址已确定
- 地址生成单元本身加载 PC 时
  - 原因：新的地址计算结果需要取消旧的计算过程

### 特殊取消信号

#### BJU 程序流变更（pcgen_ibctrl_bju_chgflw）
- 仅在 IU 模块发生程序流变更时触发
  - 原因：分支跳转单元需要知道确切的跳转结果以更新预测器

#### 循环缓冲区刷新（pcgen_ibctrl_lbuf_flush）
循环缓冲区在以下情况需要刷新：
- HAD 调试模块加载 PC 时
  - 原因：调试操作可能改变程序流程
- 向量处理单元加载 PC 时
  - 原因：向量指令不使用循环缓冲区
- 指令缓存失效完成且循环缓冲区未激活时
  - 原因：缓存内容变化可能影响循环缓冲区的有效性
- RTU 模块发生程序流变更时
  - 原因：程序流改变使得缓存的循环失效
- RTU 模块发出异常有效信号时
  - 原因：异常处理需要清空所有缓存的状态
- 调试模式切换时
  - 原因：调试模式下不使用循环缓冲机制

#### 指令缓冲区刷新（pcgen_ibctrl_ibuf_flush）
指令缓冲区在以下情况需要刷新：
- HAD 调试模块加载 PC 时
  - 原因：调试操作可能改变执行环境
- 向量处理单元加载 PC 时
  - 原因：向量指令需要清空普通指令缓冲
- RTU 模块发生程序流变更时
  - 原因：程序流改变使得缓冲的指令无效
- IU 模块发生程序流变更时
  - 原因：分支预测错误导致缓冲指令无效
- RTU 模块发出异常有效信号时
  - 原因：异常处理需要清空所有未执行的指令
- 调试模式切换时
  - 原因：调试模式需要完全控制指令执行

### 调试取消信号（dbg_cancel）
调试取消信号的生成机制：
- 使用专门的时钟门控单元（gated_clk_cell）
  - 原因：确保调试信号的时序正确性
- 记录上一周期的调试状态（dbg_dly_reg）
  - 原因：用于检测调试模式的变化
- 检测调试模式从 0 变为 1 的上升沿
  - 原因：仅在进入调试模式时触发取消，避免重复取消

