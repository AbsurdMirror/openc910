# python3脚本

## 设定

- 语言：python3
- 输入：一个文件路径："C:\Users\dongzhengxiang\Desktop\study-note\openc910\C910_RTL_FACTORY\gen_rtl\ifu\rtl\ct_ifu_top.v"
- 输出：打印到JSON文件"./cf_ifu_top.json"

## 输入

一个verilog文件，内部是一个模块的代码，模块内部例化了多个子模块。

## 执行过程

1. 按行遍历文件内容：
    1. 识别出模块的ports：如果匹配到如下格式的内容，则为模块的port行，提取并记录
    ```verilog
    input [7 : 0] rtu_ifu_retire2_chk_idx;
    input rtu_ifu_retire2_condbr;
    output ifu_biu_r_ready;
    output [39 : 0] ifu_biu_rd_addr;
    ```
    2. 识别出子模块的例化：如果识别出如下格式的内容，则为子模块的例化行，提取并记录子模块名称，并且从该行之后识别子模块的port
    ```verilog
    ct_ifu_addrgen x_ct_ifu_addrgen (
    ```
    3. 识别出子模块：如果进入子模块的port识别，并且识别出如下格式的内容，则为子模块的port行，提取并记录子模块的port
    ```verilog
        .ipctrl_pcgen_reissue_pcload         (ipctrl_pcgen_reissue_pcload),
    ```
    4. 识别出子模块的结束：如果进入子模块的port识别，并且遇到`);`，子模块例化结束，该子模块识别完成

## 输出

- 模块的ports
- 各子模块及其ports
