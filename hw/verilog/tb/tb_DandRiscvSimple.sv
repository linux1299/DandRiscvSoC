`include "./hw/verilog/axi/typedef.svh"
`include "./hw/verilog/axi/axi_pkg.sv"
`include "./hw/verilog/axi/assign.svh"
`include "./hw/verilog/axi/fifo_v3.sv"

`define	half_axi_clk_period			1

module tb_DandRiscvSimple();

parameter AddrWidth = 32;
parameter AxiAddrWidth = 32;
parameter DataWidth = 256;
parameter MaxRequests = 16;
parameter AxiProt = 3'b000;
parameter NumBanks = 1;

logic          clk_axi_in;
logic          rst_n;


logic ram_i_busy_o;
logic ram_d_busy_o;

logic                 [NumBanks-1:0]  ram_i_mem_req;
logic                 [NumBanks-1:0]  ram_i_mem_gnt = {NumBanks{1'b1}};
logic [AddrWidth-1:0] [NumBanks-1:0]  ram_i_mem_addr;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0]  ram_i_mem_wdata;
logic [DataWidth/NumBanks/8-1:0] [NumBanks-1:0]  ram_i_mem_strb;
logic                 [NumBanks-1:0]  ram_i_mem_we;
logic                 [NumBanks-1:0]  ram_i_mem_rvalid;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0]  ram_i_mem_rdata;
logic [NumBanks-1:0] ram_i_mem_rsp_valid;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0] ram_i_mem_rsp_rdata;

logic                 [NumBanks-1:0]  ram_d_mem_req;
logic                 [NumBanks-1:0]  ram_d_mem_gnt = {NumBanks{1'b1}};
logic [AddrWidth-1:0] [NumBanks-1:0]  ram_d_mem_addr;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0]  ram_d_mem_wdata;
logic [DataWidth/NumBanks/8-1:0] [NumBanks-1:0]  ram_d_mem_strb;
logic                 [NumBanks-1:0]  ram_d_mem_we;
logic                 [NumBanks-1:0]  ram_d_mem_rvalid;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0]  ram_d_mem_rdata;
logic [NumBanks-1:0] ram_d_mem_rsp_valid;
logic [DataWidth/NumBanks-1:0] [NumBanks-1:0] ram_d_mem_rsp_rdata;

//              (__name,         __addr_t,             __id_t,           __data_t,         __strb_t,                __user_t)
// `AXI_TYPEDEF_ALL(icache_axi, logic [AxiAddrWidth-1:0], logic [3:0], logic [DataWidth-1:0], logic [DataWidth/8-1:0], logic [3:0])
// icache_axi_req_t  icache_axi_req;
// icache_axi_rsp_t  icache_axi_rsp;

`AXI_TYPEDEF_ALL(axi, logic [AxiAddrWidth-1:0], logic [3:0], logic [DataWidth-1:0], logic [DataWidth/8-1:0], logic [3:0])
axi_req_t icache_axi_req;
axi_resp_t icache_axi_rsp;

//              (__name,         __addr_t,             __id_t,           __data_t,         __strb_t,                __user_t)
// `AXI_TYPEDEF_ALL(dcache_axi, logic [AxiAddrWidth-1:0], logic [3:0], logic [DataWidth-1:0], logic [DataWidth/8-1:0], logic [3:0])
// dcache_axi_req_t  dcache_axi_req;
// dcache_axi_rsp_t  dcache_axi_rsp;
axi_req_t dcache_axi_req;
axi_resp_t dcache_axi_rsp;

reg [DataWidth-1:0] ram_i [0:1023];
reg [DataWidth-1:0] ram_d [0:1023];
reg [DataWidth-1:0] ram_tmp [0:1023];
integer fd;
integer tmp;
integer i;
integer j;

logic          icache_ar_valid           ; 
logic          icache_ar_ready           ; 
logic [63:0]   icache_ar_payload_addr    ; 
logic [3:0]    icache_ar_payload_id      ; 
logic [7:0]    icache_ar_payload_len     ; 
logic [2:0]    icache_ar_payload_size    ; 
logic [1:0]    icache_ar_payload_burst   ; 
logic          icache_r_valid            ; 
logic          icache_r_ready            ; 
logic [255:0]  icache_r_payload_data     ; 
logic [3:0]    icache_r_payload_id       ; 
logic [1:0]    icache_r_payload_resp     ; 
logic          icache_r_payload_last     ; 
logic          dcache_ar_valid           ; 
logic          dcache_ar_ready           ; 
logic [63:0]   dcache_ar_payload_addr    ; 
logic [3:0]    dcache_ar_payload_id      ; 
logic [7:0]    dcache_ar_payload_len     ; 
logic [2:0]    dcache_ar_payload_size    ; 
logic [1:0]    dcache_ar_payload_burst   ; 
logic          dcache_r_valid            ; 
logic          dcache_r_ready            ; 
logic [255:0]  dcache_r_payload_data     ; 
logic [3:0]    dcache_r_payload_id       ; 
logic [1:0]    dcache_r_payload_resp     ; 
logic          dcache_r_payload_last     ; 
logic          dcache_aw_valid           ; 
logic          dcache_aw_ready           ; 
logic [63:0]   dcache_aw_payload_addr    ; 
logic [3:0]    dcache_aw_payload_id      ; 
logic [7:0]    dcache_aw_payload_len     ; 
logic [2:0]    dcache_aw_payload_size    ; 
logic [1:0]    dcache_aw_payload_burst   ; 
logic          dcache_w_valid            ; 
logic          dcache_w_ready            ; 
logic [255:0]  dcache_w_payload_data     ; 
logic [31:0]   dcache_w_payload_strb     ; 
logic          dcache_w_payload_last     ; 
logic          dcache_b_valid            ; 
logic          dcache_b_ready            ; 
logic [3:0]    dcache_b_payload_id       ; 
logic [1:0]    dcache_b_payload_resp     ; 

// ============================== dunp fsdb =============================
initial begin
	$display("\n================== Time:%d, Dump Start ================\n",$time);
	$fsdbDumpfile("./simWorkspace/tb_DandRiscvSimple/tb_DandRiscvSimple.fsdb");
	$fsdbDumpvars(0, "tb_DandRiscvSimple", "+mda");
end

// ==================== initial program in ram =======================
initial begin
  fd = $fopen ("./ysyx-workbench/am-kernels/tests/alu-tests/build/alutest-riscv64-nemu.bin", "rb");
  tmp = $fread(ram_tmp, fd);
  for (i = 0; i < 65536; i = i + 1) begin
    for (j = 0; j < 8; j = j + 1) begin
      ram_i[i][j*8 +: 8] = ram_tmp[i][(DataWidth/8-j)*8 +: 8];
      ram_d[i][j*8 +: 8] = ram_tmp[i][(DataWidth/8-j)*8 +: 8];
    end
  end
end
always@(posedge clk_axi_in) begin
  if(ram_i_mem_req) begin
    ram_i_mem_rsp_valid <= 1'b1;
    ram_i_mem_rsp_rdata <= ram_i[ram_i_mem_addr];
  end
  else begin
    ram_i_mem_rsp_valid <= 1'b0;
  end

  if(ram_d_mem_req) begin
    ram_d_mem_rsp_valid <= 1'b1;
    ram_d_mem_rsp_rdata <= ram_d[ram_d_mem_addr];
  end
  else begin
    ram_d_mem_rsp_valid <= 1'b0;
  end
end

// ========================== axi clk and reset =============================	 
initial begin
  clk_axi_in = 'b0     ;  
  # 50;
  forever begin
    #`half_axi_clk_period 
    clk_axi_in = ~clk_axi_in ;
  end
end
initial begin
  rst_n = 1'b0;
  # 50
  rst_n = 1'b1;
end

// ========================== Time out =============================
initial begin
  #2000000
  $display("\n============== TimeOut ! Simulation finish ! ============\n");
  $finish;
end


DandRiscvSimple u_DandRiscvSimple(
    .icache_ar_valid         ( icache_axi_req.ar_valid        ),
    .icache_ar_ready         ( icache_axi_rsp.ar_ready        ),
    .icache_ar_payload_addr  ( icache_axi_req.ar.addr         ),
    .icache_ar_payload_id    ( icache_axi_req.ar.id           ),
    .icache_ar_payload_len   ( icache_axi_req.ar.len          ),
    .icache_ar_payload_size  ( icache_axi_req.ar.size         ),
    .icache_ar_payload_burst ( icache_axi_req.ar.burst        ),
    .icache_r_valid          ( icache_axi_rsp.r_valid         ),
    .icache_r_ready          ( icache_axi_req.r_ready         ),
    .icache_r_payload_data   ( icache_axi_rsp.r.data          ),
    .icache_r_payload_id     ( icache_axi_rsp.r.id            ),
    .icache_r_payload_resp   ( icache_axi_rsp.r.resp          ),
    .icache_r_payload_last   ( icache_axi_rsp.r.last          ),
    .dcache_ar_valid         ( dcache_axi_req.ar_valid        ),
    .dcache_ar_ready         ( dcache_axi_rsp.ar_ready        ),
    .dcache_ar_payload_addr  ( dcache_axi_req.ar.addr         ),
    .dcache_ar_payload_id    ( dcache_axi_req.ar.id           ),
    .dcache_ar_payload_len   ( dcache_axi_req.ar.len          ),
    .dcache_ar_payload_size  ( dcache_axi_req.ar.size         ),
    .dcache_ar_payload_burst ( dcache_axi_req.ar.burst        ),
    .dcache_r_valid          ( dcache_axi_rsp.r_valid         ),
    .dcache_r_ready          ( dcache_axi_req.r_ready         ),
    .dcache_r_payload_data   ( dcache_axi_rsp.r.data          ),
    .dcache_r_payload_id     ( dcache_axi_rsp.r.id            ),
    .dcache_r_payload_resp   ( dcache_axi_rsp.r.resp          ),
    .dcache_r_payload_last   ( dcache_axi_rsp.r.last          ),
    .dcache_aw_valid         ( dcache_axi_req.aw_valid        ),
    .dcache_aw_ready         ( dcache_axi_rsp.aw_ready        ),
    .dcache_aw_payload_addr  ( dcache_axi_req.aw.addr         ),
    .dcache_aw_payload_id    ( dcache_axi_req.aw.id           ),
    .dcache_aw_payload_len   ( dcache_axi_req.aw.len          ),
    .dcache_aw_payload_size  ( dcache_axi_req.aw.size         ),
    .dcache_aw_payload_burst ( dcache_axi_req.aw.burst        ),
    .dcache_w_valid          ( dcache_axi_req.w_valid         ),
    .dcache_w_ready          ( dcache_axi_rsp.w_ready         ),
    .dcache_w_payload_data   ( dcache_axi_req.w.data          ),
    .dcache_w_payload_strb   ( dcache_axi_req.w.strb          ),
    .dcache_w_payload_last   ( dcache_axi_req.w.last          ),
    .dcache_b_valid          ( dcache_axi_rsp.b_valid         ),
    .dcache_b_ready          ( dcache_axi_req.b_ready         ),
    .dcache_b_payload_id     ( dcache_axi_rsp.b.id            ),
    .dcache_b_payload_resp   ( dcache_axi_rsp.b.resp          ),
    .clk                     ( clk_axi_in                     ),
    .reset                   ( !rst_n                         )
);


axi_to_mem#(
    .axi_req_t             ( axi_req_t),
    .axi_resp_t            ( axi_resp_t),
    .AddrWidth             ( AddrWidth    ),
    .DataWidth             ( DataWidth ),
    .IdWidth               ( 4  ),
    .NumBanks              ( NumBanks ) 
)icache_axi_to_mem(
    .clk_i                 ( clk_axi_in          ),
    .rst_ni                ( rst_n               ),
    .busy_o                ( ram_i_busy_o        ),
    .axi_req_i             ( icache_axi_req      ),
    .axi_resp_o            ( icache_axi_rsp      ),
    .mem_req_o             ( ram_i_mem_req       ),
    .mem_gnt_i             ( ram_i_mem_gnt       ),
    .mem_addr_o            ( ram_i_mem_addr      ),
    .mem_wdata_o           ( ram_i_mem_wdata     ),
    .mem_strb_o            ( ram_i_mem_strb      ),
    .mem_atop_o            (       ),
    .mem_we_o              ( ram_i_mem_we        ),
    .mem_rvalid_i          ( ram_i_mem_rsp_valid ),
    .mem_rdata_i           ( ram_i_mem_rsp_rdata )
);

axi_to_mem#(
    .axi_req_t             ( axi_req_t),
    .axi_resp_t            ( axi_resp_t),
    .AddrWidth             ( AddrWidth    ),
    .DataWidth             ( DataWidth ),
    .IdWidth               ( 4  ),
    .NumBanks              ( NumBanks ) 
)dcache_axi_to_mem(
    .clk_i                 ( clk_axi_in          ),
    .rst_ni                ( rst_n               ),
    .busy_o                ( ram_d_busy_o        ),
    .axi_req_i             ( dcache_axi_req      ),
    .axi_resp_o            ( dcache_axi_rsp      ),
    .mem_req_o             ( ram_d_mem_req       ),
    .mem_gnt_i             ( ram_d_mem_gnt       ),
    .mem_addr_o            ( ram_d_mem_addr      ),
    .mem_wdata_o           ( ram_d_mem_wdata     ),
    .mem_strb_o            ( ram_d_mem_strb      ),
    .mem_atop_o            (       ),
    .mem_we_o              ( ram_d_mem_we        ),
    .mem_rvalid_i          ( ram_d_mem_rsp_valid ),
    .mem_rdata_i           ( ram_d_mem_rsp_rdata )
);

endmodule