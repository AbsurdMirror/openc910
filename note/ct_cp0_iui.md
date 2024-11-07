# ct_cp0_iui

## 模块分析

1. CSR寄存器地址

2. CP0操作
    - WFI
    - SRET
    - MRET
    - CSRRW
    - CSRRS
    - CSRRC
    - CSRRWI
    - CSRRSI
    - CSRRCI

    ```verilog
    //==========================================================
    //                Handling the CP0 operations
    //==========================================================
    //CP0 need to flop insctuction type signals and source operands
    //for use of both ex1 and ex2 stages
    // CP0 funcs from idu rf stage
    // WFI:    5'b01001
    // SRET:   5'b01000
    // MRET:   5'b01010
    // CSRRW:  5'b10000
    // CSRRS:  5'b10001
    // CSRRC:  5'b10010
    // CSRRWI: 5'b10011
    // CSRRSI: 5'b10100
    // CSRRCI: 5'b10101
    ```

## 代码注释块及分析

@import "./ct_cp0_iui_code_comment_block.md"

## 代码注释块分析

