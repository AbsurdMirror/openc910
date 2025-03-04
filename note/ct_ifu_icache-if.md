| **优先级**   | **条件**                          | **选择值 (`ifu_icache_index[15:0]`)**   |
| ------------ | --------------------------------- | --------------------------------------- |
| **优先级 1** | `ifctrl_icache_if_tag_req`        | `ifctrl_icache_if_index[15:0]`          |
| ^            | `ifctrl_icache_if_reset_req`      | ^                                       |
| ^            | `l1_refill_icache_if_wr`          | `l1_refill_icache_if_index[15:0]`       |
| ^            | `ipb_icache_if_req`               | `{ipb_icache_if_index[10:0], 5'b0}`     |
| ^            | `ifctrl_icache_if_read_req_data0` | `ifctrl_icache_if_read_req_index[15:0]` |
| ^            | `ifctrl_icache_if_read_req_data1` | ^                                       |
| ^            | `ifctrl_icache_if_read_req_tag`   | ^                                       |
| **优先级 0** | `icache_req_higher == 0`          | `pcgen_icache_if_index[15:0]`           |

- hpcp 代表的是高性能计数器（High-Performance Counter）

| **方向** | **位宽** | **信号**                           | **分组**         | **描述**                 |
| -------- | -------- | ---------------------------------- | ---------------- | ------------------------ |
| input    | -        | cp0_ifu_icache_en                  | 使能、复位、时钟 |
| input    | -        | cp0_ifu_icg_en                     | ^                |
| input    | -        | cp0_yy_clk_en                      | ^                |
| input    | -        | cpurst_b                           | ^                |
| input    | -        | forever_cpuclk                     | ^                |
| input    | -        | pad_yy_icg_scan_en                 | ^                |
| input    | -        | hpcp_ifu_cnt_en                    | 高性能计数器接口 |
| input    | -        | ifu_hpcp_icache_miss_pre           | ^                |
| output   | -        | ifu_hpcp_icache_access             | ^                |
| output   | -        | ifu_hpcp_icache_miss               | ^                |
| input    | [38 :0]  | ifctrl_icache_if_index             | ifctrl控制接口   |
| input    | -        | ifctrl_icache_if_inv_fifo          | ^                |
| input    | -        | ifctrl_icache_if_inv_on            | ^                |
| input    | -        | ifctrl_icache_if_read_req_data0    | ^                |
| input    | -        | ifctrl_icache_if_read_req_data1    | ^                |
| input    | [38 :0]  | ifctrl_icache_if_read_req_index    | ^                |
| input    | -        | ifctrl_icache_if_read_req_tag      | ^                |
| input    | -        | ifctrl_icache_if_reset_req         | ^                |
| input    | -        | ifctrl_icache_if_tag_req           | ^                |
| input    | [2  :0]  | ifctrl_icache_if_tag_wen           | ^                |
| output   | [127:0]  | icache_if_ifctrl_inst_data0        | ^                |
| output   | [127:0]  | icache_if_ifctrl_inst_data1        | ^                |
| output   | [28 :0]  | icache_if_ifctrl_tag_data0         | ^                |
| output   | [28 :0]  | icache_if_ifctrl_tag_data1         | ^                |
| input    | [33 :0]  | ipb_icache_if_index                | 预取模块接口     |
| input    | -        | ipb_icache_if_req                  | ^                |
| input    | -        | ipb_icache_if_req_for_gateclk      | ^                |
| output   | [28 :0]  | icache_if_ipb_tag_data0            | ^                |
| output   | [28 :0]  | icache_if_ipb_tag_data1            | ^                |
| input    | -        | l1_refill_icache_if_wr             | refill接口       | 重填使能信号             |
| input    | [38 :0]  | l1_refill_icache_if_index          | ^                | 重填的index              |
| input    | -        | l1_refill_icache_if_fifo           | ^                | 重填way信息              |
| input    | [127:0]  | l1_refill_icache_if_inst_data      | ^                | 重填data信息             |
| input    | [31 :0]  | l1_refill_icache_if_pre_code       | ^                | 重填precode信息          |
| input    | [27 :0]  | l1_refill_icache_if_ptag           | ^                | 重填tag信息              |
| input    | -        | l1_refill_icache_if_first          | ^                | 重填需要4拍，第1拍标识   |
| input    | -        | l1_refill_icache_if_last           | ^                | 重填需要4拍，最后1拍标识 |
| input    | -        | pcgen_icache_if_chgflw             | pcgen接口        | PC改变的重新取指 |
| input    | -        | pcgen_icache_if_chgflw_bank0       | ^                | PC改变，读data的bank0 |
| input    | -        | pcgen_icache_if_chgflw_bank1       | ^                | PC改变，读data的bank1 |
| input    | -        | pcgen_icache_if_chgflw_bank2       | ^                | PC改变，读data的bank2 |
| input    | -        | pcgen_icache_if_chgflw_bank3       | ^                | PC改变，读data的bank3 |
| input    | -        | pcgen_icache_if_chgflw_short       | ^                |
| input    | -        | pcgen_icache_if_gateclk_en         | ^                |
| input    | [15 :0]  | pcgen_icache_if_index              | ^                | 读cache的index |
| input    | -        | pcgen_icache_if_seq_data_req       | ^                | 正常取指，data的请求 |
| input    | -        | pcgen_icache_if_seq_data_req_short | ^                |
| input    | -        | pcgen_icache_if_seq_tag_req        | ^                | 正常取指，tag的请求 |
| input    | [1  :0]  | pcgen_icache_if_way_pred           | ^                | 路预测值 |
| output   | -        | icache_if_ifdp_fifo                | ifdp接口         |
| output   | [127:0]  | icache_if_ifdp_inst_data0          | ^                |
| output   | [127:0]  | icache_if_ifdp_inst_data1          | ^                |
| output   | [31 :0]  | icache_if_ifdp_precode0            | ^                |
| output   | [31 :0]  | icache_if_ifdp_precode1            | ^                |
| output   | [28 :0]  | icache_if_ifdp_tag_data0           | ^                |
| output   | [28 :0]  | icache_if_ifdp_tag_data1           | ^                |
