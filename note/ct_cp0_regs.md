# ct_cp0_regs

## 寄存器

- MVENDORID Register
- MARCHID Register
- MIMPID Register
- MHARTID Register
- MSTATUS register
- MISA register
- MEDELEG register
- MIDELEG register
- MIE register
- MTVEC register
- MCNTEN register
- MSCRATCH register
- MEPC register
- MCAUSE register
- MTVAL register
- MIP register
- SSTATUS register
- SIE register
- STVEC register
- SCNTEN register
- SSCRATCH register
- SEPC register
- SCAUSE register
- STVAL register
- SIP register
- FRM register
- FFLAGS register
- FRM register
- FCSR register
- VSTART register
- VXSAT register
- VXRM register
- VTYPE register
- VL register
- VXRM register
- MXSTATUS register
- MHCR register
- MCOR register
- MHINT register
- MRVBR register
- MHINT2 register
- MHINT3 register
- MCNTWEN register
- MCER register
- MEICR register
- MCINS register
- MCINDEX register
- MCDATA0/1 register
- MCPUID register
- MAPBADDR register
- MWMSR register
- SXSTATUS register
- SHCR register
- SCER register
- FXCR register
- HSTATUS register
- HEDELEG register
- VSTATUS register

## 寄存器分类

| | M | S | F | V | H |
|:--:|:--:|:--:|:--:|:--:|:--:|
| *VENDORID* | MVENDORID | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *ARCHID*   | MARCHID   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *IMPID*    | MIMPID    | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *HARTID*   | MHARTID   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *STATUS*   | MSTATUS   | SSTATUS  | &nbsp; | VSTATUS | HSTATUS |
| *ISA*      | MISA      | &nbsp;   | &nbsp; | &nbsp;  | HEDELEG |
| *EDELEG*   | MEDELEG   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *IDELEG*   | MIDELEG   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *IE*       | MIE       | SIE      | &nbsp; | &nbsp;  | &nbsp;  |
| *TVEC*     | MTVEC     | STVEC    | &nbsp; | &nbsp;  | &nbsp;  |
| *CNTEN*    | MCNTEN    | SCNTEN   | &nbsp; | &nbsp;  | &nbsp;  |
| *SCRATCH*  | MSCRATCH  | SSCRATCH | &nbsp; | &nbsp;  | &nbsp;  |
| *EPC*      | MEPC      | SEPC     | &nbsp; | &nbsp;  | &nbsp;  |
| *CAUSE*    | MCAUSE    | SCAUSE   | &nbsp; | &nbsp;  | &nbsp;  |
| *TVAL*     | MTVAL     | STVAL    | &nbsp; | &nbsp;  | &nbsp;  |
| *IP*       | MIP       | SIP      | &nbsp; | &nbsp;  | &nbsp;  |
| *XSTATUS*  | MXSTATUS  | SXSTATUS | &nbsp; | &nbsp;  | &nbsp;  |
| *HCR*      | MHCR      | SHCR     | &nbsp; | &nbsp;  | &nbsp;  |
| *COR*      | MCOR      | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *HINT*     | MHINT     | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *RVBR*     | MRVBR     | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *HINT2*    | MHINT2    | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *HINT3*    | MHINT3    | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CNTWEN*   | MCNTWEN   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CER*      | MCER      | SCER     | &nbsp; | &nbsp;  | &nbsp;  |
| *EICR*     | MEICR     | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CINS*     | MCINS     | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CINDEX*   | MCINDEX   | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CDATA0* /1| MCDATA0/1 | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *CPUID*    | MCPUID    | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *APBADDR*  | MAPBADDR  | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *WMSR*     | MWMSR     | &nbsp;   | &nbsp; | &nbsp;  | &nbsp;  |
| *FLAGS*    | &nbsp;    | &nbsp;   | FFLAGS | &nbsp;  | &nbsp;  |
| *RM*       | &nbsp;    | &nbsp;   | FRM    | VXRM    | &nbsp;  |
| *CSR*      | &nbsp;    | &nbsp;   | FCSR   | &nbsp;  | &nbsp;  |
| *XCR*      | &nbsp;    | &nbsp;   | FXCR   | &nbsp;  | &nbsp;  |
| *XSAT*     | &nbsp;    | &nbsp;   | &nbsp; | VXSAT   | &nbsp;  |
| *TYPE*     | &nbsp;    | &nbsp;   | &nbsp; | VTYPE   | &nbsp;  |
| *L*        | &nbsp;    | &nbsp;   | &nbsp; | VL      | &nbsp;  |
| *LENB*     | &nbsp;    | &nbsp;   | &nbsp; | VLENB   | &nbsp;  |
