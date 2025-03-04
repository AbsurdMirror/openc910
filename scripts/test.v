module moduleName (    
    input clk,
    input rst_n,
//
    input  [   1-1:0] xpuio_mesh_cf_siu_awvalid,
    input  [  48-1:0] xpuio_mesh_cf_siu_awaddr,
    input  [   8-1:0] xpuio_mesh_cf_siu_awid,
    input  [   4-1:0] xpuio_mesh_cf_siu_awlen,
    input  [   3-1:0] xpuio_mesh_cf_siu_awsize,
    input  [   2-1:0] xpuio_mesh_cf_siu_awburst,
    input  [   1-1:0] xpuio_mesh_cf_siu_awlock,
    input  [   4-1:0] xpuio_mesh_cf_siu_awcache,
    input  [   3-1:0] xpuio_mesh_cf_siu_awprot,
    output [   1-1:0] xpuio_mesh_cf_siu_awready,
//
    input  [   1-1:0] xpuio_mesh_cf_siu_wvalid,
    input  [  32-1:0] xpuio_mesh_cf_siu_wdata,
    input  [   4-1:0] xpuio_mesh_cf_siu_wstrb,
    input  [   1-1:0] xpuio_mesh_cf_siu_wlast,
    output [   1-1:0] xpuio_mesh_cf_siu_wready,
//
    input  [   1-1:0] xpuio_mesh_cf_siu_arvalid,
    input  [   8-1:0] xpuio_mesh_cf_siu_arid,
    input  [  48-1:0] xpuio_mesh_cf_siu_araddr,
    input  [   4-1:0] xpuio_mesh_cf_siu_arlen,
    input  [   3-1:0] xpuio_mesh_cf_siu_arsize,
    input  [   2-1:0] xpuio_mesh_cf_siu_arburst,
    input  [   1-1:0] xpuio_mesh_cf_siu_arlock,
    input  [   4-1:0] xpuio_mesh_cf_siu_arcache,
    input  [   3-1:0] xpuio_mesh_cf_siu_arprot,
    output [   1-1:0] xpuio_mesh_cf_siu_arready,
//
    input  [   1-1:0] xpuio_hdc0_data_bvalid,
    input  [   8-1:0] xpuio_hdc0_data_bid,
    input  [   2-1:0] xpuio_hdc0_data_bresp,
    output [   1-1:0] xpuio_hdc0_data_bready,
//
    input  [   1-1:0] xpuio_hdc0_data_rvalid,
    input  [   8-1:0] xpuio_hdc0_data_rid,
    input  [1024-1:0] xpuio_hdc0_data_rdata,
    input  [   1-1:0] xpuio_hdc0_data_rlast,
    input  [   2-1:0] xpuio_hdc0_data_rresp,
    output [   1-1:0] xpuio_hdc0_data_rready,
    output [   5-1:0] xpuio_hdc0_data_awuser,
    input  [   5-1:0] xpuio_hdc0_data_buser,
//
    input  [   1-1:0] xpuio_hdc1_data_bvalid,
    input  [   8-1:0] xpuio_hdc1_data_bid,
    input  [   2-1:0] xpuio_hdc1_data_bresp,
    output [   1-1:0] xpuio_hdc1_data_bready,
//
    input  [   1-1:0] xpuio_hdc1_data_rvalid,
    input  [   8-1:0] xpuio_hdc1_data_rid,
    input  [1024-1:0] xpuio_hdc1_data_rdata,
    input  [   1-1:0] xpuio_hdc1_data_rlast,
    input  [   2-1:0] xpuio_hdc1_data_rresp,
    output [   1-1:0] xpuio_hdc1_data_rready,
    output [   5-1:0] xpuio_hdc1_data_awuser,
    input  [   5-1:0] xpuio_hdc1_data_buser,
//
    input  [   1-1:0] xpuio_hdc2_data_bvalid,
    input  [   8-1:0] xpuio_hdc2_data_bid,
    input  [   2-1:0] xpuio_hdc2_data_bresp,
    output [   1-1:0] xpuio_hdc2_data_bready,
//
    input  [   1-1:0] xpuio_hdc2_data_rvalid,
    input  [   8-1:0] xpuio_hdc2_data_rid,
    input  [1024-1:0] xpuio_hdc2_data_rdata,
    input  [   1-1:0] xpuio_hdc2_data_rlast,
    input  [   2-1:0] xpuio_hdc2_data_rresp,
    output [   1-1:0] xpuio_hdc2_data_rready,
    output [   5-1:0] xpuio_hdc2_data_awuser,
    input  [   5-1:0] xpuio_hdc2_data_buser,
//
    input  [   1-1:0] xpuio_hdc3_data_bvalid,
    input  [   8-1:0] xpuio_hdc3_data_bid,
    input  [   2-1:0] xpuio_hdc3_data_bresp,
    output [   1-1:0] xpuio_hdc3_data_bready,
//
    input  [   1-1:0] xpuio_hdc3_data_rvalid,
    input  [   8-1:0] xpuio_hdc3_data_rid,
    input  [1024-1:0] xpuio_hdc3_data_rdata,
    input  [   1-1:0] xpuio_hdc3_data_rlast,
    input  [   2-1:0] xpuio_hdc3_data_rresp,
    output [   1-1:0] xpuio_hdc3_data_rready,
    output [   5-1:0] xpuio_hdc3_data_awuser,
    input  [   5-1:0] xpuio_hdc3_data_buser,
//
    input  [   1-1:0] xpuio_data_sram_bvalid,
    input  [   8-1:0] xpuio_data_sram_bid,
    input  [   2-1:0] xpuio_data_sram_bresp,
    output [   1-1:0] xpuio_data_sram_bready,
//
    input  [   1-1:0] xpuio_data_sram_rvalid,
    input  [   8-1:0] xpuio_data_sram_rid,
    input  [1024-1:0] xpuio_data_sram_rdata,
    input  [   1-1:0] xpuio_data_sram_rlast,
    input  [   2-1:0] xpuio_data_sram_rresp,
    output [   1-1:0] xpuio_data_sram_rready,
    output [   7-1:0] xpuio_data_sram_awuser,
//
    input  [   1-1:0] xpuio_mesh_cf_miu_bvalid,
    input  [   8-1:0] xpuio_mesh_cf_miu_bid,
    input  [   2-1:0] xpuio_mesh_cf_miu_bresp,
    output [   1-1:0] xpuio_mesh_cf_miu_bready,
//
    output [   1-1:0] xpuio_mesh_cf_siu_awvalid_pipe,
    output [  48-1:0] xpuio_mesh_cf_siu_awaddr_pipe,
    output [   8-1:0] xpuio_mesh_cf_siu_awid_pipe,
    output [   4-1:0] xpuio_mesh_cf_siu_awlen_pipe,
    output [   3-1:0] xpuio_mesh_cf_siu_awsize_pipe,
    output [   2-1:0] xpuio_mesh_cf_siu_awburst_pipe,
    output [   1-1:0] xpuio_mesh_cf_siu_awlock_pipe,
    output [   4-1:0] xpuio_mesh_cf_siu_awcache_pipe,
    output [   3-1:0] xpuio_mesh_cf_siu_awprot_pipe,
    input  [   1-1:0] xpuio_mesh_cf_siu_awready_pipe,
//
    output [   1-1:0] xpuio_mesh_cf_siu_wvalid_pipe,
    output [  32-1:0] xpuio_mesh_cf_siu_wdata_pipe,
    output [   4-1:0] xpuio_mesh_cf_siu_wstrb_pipe,
    output [   1-1:0] xpuio_mesh_cf_siu_wlast_pipe,
    input  [   1-1:0] xpuio_mesh_cf_siu_wready_pipe,
//
    output [   1-1:0] xpuio_mesh_cf_siu_arvalid_pipe,
    output [   8-1:0] xpuio_mesh_cf_siu_arid_pipe,
    output [  48-1:0] xpuio_mesh_cf_siu_araddr_pipe,
    output [   4-1:0] xpuio_mesh_cf_siu_arlen_pipe,
    output [   3-1:0] xpuio_mesh_cf_siu_arsize_pipe,
    output [   2-1:0] xpuio_mesh_cf_siu_arburst_pipe,
    output [   1-1:0] xpuio_mesh_cf_siu_arlock_pipe,
    output [   4-1:0] xpuio_mesh_cf_siu_arcache_pipe,
    output [   3-1:0] xpuio_mesh_cf_siu_arprot_pipe,
    input  [   1-1:0] xpuio_mesh_cf_siu_arready_pipe,
//
    output [   1-1:0] xpuio_hdc0_data_bvalid_pipe,
    output [   8-1:0] xpuio_hdc0_data_bid_pipe,
    output [   2-1:0] xpuio_hdc0_data_bresp_pipe,
    input  [   1-1:0] xpuio_hdc0_data_bready_pipe,
//
    output [   1-1:0] xpuio_hdc0_data_rvalid_pipe,
    output [   8-1:0] xpuio_hdc0_data_rid_pipe,
    output [1024-1:0] xpuio_hdc0_data_rdata_pipe,
    output [   1-1:0] xpuio_hdc0_data_rlast_pipe,
    output [   2-1:0] xpuio_hdc0_data_rresp_pipe,
    input  [   1-1:0] xpuio_hdc0_data_rready_pipe,
    input  [   5-1:0] xpuio_hdc0_data_awuser_pipe,
    output [   5-1:0] xpuio_hdc0_data_buser_pipe,
//
    output [   1-1:0] xpuio_hdc1_data_bvalid_pipe,
    output [   8-1:0] xpuio_hdc1_data_bid_pipe,
    output [   2-1:0] xpuio_hdc1_data_bresp_pipe,
    input  [   1-1:0] xpuio_hdc1_data_bready_pipe,
//
    output [   1-1:0] xpuio_hdc1_data_rvalid_pipe,
    output [   8-1:0] xpuio_hdc1_data_rid_pipe,
    output [1024-1:0] xpuio_hdc1_data_rdata_pipe,
    output [   1-1:0] xpuio_hdc1_data_rlast_pipe,
    output [   2-1:0] xpuio_hdc1_data_rresp_pipe,
    input  [   1-1:0] xpuio_hdc1_data_rready_pipe,
    input  [   5-1:0] xpuio_hdc1_data_awuser_pipe,
    output [   5-1:0] xpuio_hdc1_data_buser_pipe,
//
    output [   1-1:0] xpuio_hdc2_data_bvalid_pipe,
    output [   8-1:0] xpuio_hdc2_data_bid_pipe,
    output [   2-1:0] xpuio_hdc2_data_bresp_pipe,
    input  [   1-1:0] xpuio_hdc2_data_bready_pipe,
//
    output [   1-1:0] xpuio_hdc2_data_rvalid_pipe,
    output [   8-1:0] xpuio_hdc2_data_rid_pipe,
    output [1024-1:0] xpuio_hdc2_data_rdata_pipe,
    output [   1-1:0] xpuio_hdc2_data_rlast_pipe,
    output [   2-1:0] xpuio_hdc2_data_rresp_pipe,
    input  [   1-1:0] xpuio_hdc2_data_rready_pipe,
    input  [   5-1:0] xpuio_hdc2_data_awuser_pipe,
    output [   5-1:0] xpuio_hdc2_data_buser_pipe,
//
    output [   1-1:0] xpuio_hdc3_data_bvalid_pipe,
    output [   8-1:0] xpuio_hdc3_data_bid_pipe,
    output [   2-1:0] xpuio_hdc3_data_bresp_pipe,
    input  [   1-1:0] xpuio_hdc3_data_bready_pipe,
//
    output [   1-1:0] xpuio_hdc3_data_rvalid_pipe,
    output [   8-1:0] xpuio_hdc3_data_rid_pipe,
    output [1024-1:0] xpuio_hdc3_data_rdata_pipe,
    output [   1-1:0] xpuio_hdc3_data_rlast_pipe,
    output [   2-1:0] xpuio_hdc3_data_rresp_pipe,
    input  [   1-1:0] xpuio_hdc3_data_rready_pipe,
    input  [   5-1:0] xpuio_hdc3_data_awuser_pipe,
    output [   5-1:0] xpuio_hdc3_data_buser_pipe,
//
    output [   1-1:0] xpuio_data_sram_bvalid_pipe,
    output [   8-1:0] xpuio_data_sram_bid_pipe,
    output [   2-1:0] xpuio_data_sram_bresp_pipe,
    input  [   1-1:0] xpuio_data_sram_bready_pipe,
//
    output [   1-1:0] xpuio_data_sram_rvalid_pipe,
    output [   8-1:0] xpuio_data_sram_rid_pipe,
    output [1024-1:0] xpuio_data_sram_rdata_pipe,
    output [   1-1:0] xpuio_data_sram_rlast_pipe,
    output [   2-1:0] xpuio_data_sram_rresp_pipe,
    input  [   1-1:0] xpuio_data_sram_rready_pipe,
    input  [   7-1:0] xpuio_data_sram_awuser_pipe,
//
    output [   1-1:0] xpuio_mesh_cf_miu_bvalid_pipe,
    output [   8-1:0] xpuio_mesh_cf_miu_bid_pipe,
    output [   2-1:0] xpuio_mesh_cf_miu_bresp_pipe,
    input  [   1-1:0] xpuio_mesh_cf_miu_bready_pipe,
//
    output [   1-1:0] xpuio_mesh_cf_miu_rvalid_pipe,
    output [   8-1:0] xpuio_mesh_cf_miu_rid_pipe,
    output [  32-1:0] xpuio_mesh_cf_miu_rdata_pipe,
    output [   1-1:0] xpuio_mesh_cf_miu_rlast_pipe,
    output [   2-1:0] xpuio_mesh_cf_miu_rresp_pipe,
    input  [   1-1:0] xpuio_mesh_cf_miu_rready_pipe,
    input  [   8-1:0] xpuio_mesh_cf_miu_awuser_pipe,
    input  [   8-1:0] xpuio_mesh_cf_miu_wuser_pipe,
    output [  64-1:0] xpuio_mesh_cf_miu_buser_pipe,
    output [   8-1:0] xpuio_mesh_cf_miu_ruser_pipe,
    input  [   1-1:0] xpuio_tdma_ctrl_bready_pipe,
    output [   2-1:0] xpuio_tdma_ctrl_bresp_pipe,
    output [   1-1:0] xpuio_tdma_ctrl_bvalid_pipe,
//
    output [  64-1:0] xpuio_tdma_ctrl_rdata_pipe,
    input  [   1-1:0] xpuio_tdma_ctrl_rready_pipe,
    output [   2-1:0] xpuio_tdma_ctrl_rresp_pipe,
    output [   1-1:0] xpuio_tdma_ctrl_rvalid_pipe,
//
    output [   1-1:0] xpuio_tpu_ctrl_bvalid_pipe,
    output [   2-1:0] xpuio_tpu_ctrl_bresp_pipe,
    input  [   1-1:0] xpuio_tpu_ctrl_bready_pipe,
//
    output [   1-1:0] xpuio_tpu_ctrl_rvalid_pipe,
    output [  64-1:0] xpuio_tpu_ctrl_rdata_pipe,
    output [   2-1:0] xpuio_tpu_ctrl_rresp_pipe,
    input  [   1-1:0] xpuio_tpu_ctrl_rready_pipe,
//
    input  [   1-1:0] xpuio_ioreg_bready_pipe,
    output [   2-1:0] xpuio_ioreg_bresp_pipe,
    output [   1-1:0] xpuio_ioreg_bvalid_pipe,
//
    output [  64-1:0] xpuio_ioreg_rdata_pipe,
    input  [   1-1:0] xpuio_ioreg_rready_pipe,
    output [   2-1:0] xpuio_ioreg_rresp_pipe,
    output [   1-1:0] xpuio_ioreg_rvalid_pipe
);

    input  [   1-1:0] xpuio_mesh_cf_siu_awvalid,
    input  [  48-1:0] xpuio_mesh_cf_siu_awaddr,
    input  [   8-1:0] xpuio_mesh_cf_siu_awid,
    input  [   4-1:0] xpuio_mesh_cf_siu_awlen,
    input  [   3-1:0] xpuio_mesh_cf_siu_awsize,
    input  [   2-1:0] xpuio_mesh_cf_siu_awburst,
    input  [   1-1:0] xpuio_mesh_cf_siu_awlock,
    input  [   4-1:0] xpuio_mesh_cf_siu_awcache,
    input  [   3-1:0] xpuio_mesh_cf_siu_awprot,
    output [   1-1:0] xpuio_mesh_cf_siu_awready,
    xpu_pipe_DW_axi_rs_tpi #(
        .TMO  (2),
        .PLD_W(48+ 8+ 4+ 3+ 2+ 1+ 4+ 3)
    ) u_mesh_cf_siu_aw_pipe (
        .aclk_i   (clk),
        .aresetn_i(rst_n),
        .valid_i  (xpuio_mesh_cf_siu_awvalid),
        .ready_o  (xpuio_mesh_cf_siu_awready),
        .payload_i({
            xpuio_mesh_cf_siu_awaddr,
            xpuio_mesh_cf_siu_awid,
            xpuio_mesh_cf_siu_awlen,
            xpuio_mesh_cf_siu_awsize,
            xpuio_mesh_cf_siu_awburst,
            xpuio_mesh_cf_siu_awlock,
            xpuio_mesh_cf_siu_awcache,
            xpuio_mesh_cf_siu_awprot
        }),
        .valid_o  (xpuio_mesh_cf_siu_awvalid),
        .ready_i  (xpuio_mesh_cf_siu_awready),
        .payload_o({
            xpuio_mesh_cf_siu_awaddr_pipe,
            xpuio_mesh_cf_siu_awid_pipe,
            xpuio_mesh_cf_siu_awlen_pipe,
            xpuio_mesh_cf_siu_awsize_pipe,
            xpuio_mesh_cf_siu_awburst_pipe,
            xpuio_mesh_cf_siu_awlock_pipe,
            xpuio_mesh_cf_siu_awcache_pipe,
            xpuio_mesh_cf_siu_awprot_pipe
        })
    );


endmodule
