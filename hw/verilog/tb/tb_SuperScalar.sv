`define	half_axi_clk_period			1

module tb_SuperScalar();

parameter AddrWidth = 32;
parameter AxiAddrWidth = 32;
parameter DataWidth = 64;
parameter AxiProt = 3'b000;
parameter AxiRegion = 4'b0000;
parameter AxiCache = 4'b0000;
parameter AxiQos = 4'b0000;
parameter size = 22;

logic          clk_axi_in;
logic          rst_n;


logic ram_i_busy_o;
logic ram_d_busy_o;

logic                   ram_i_mem_read;
logic [AddrWidth-1:0]   ram_i_mem_raddr;
logic [AddrWidth-1:0]   ram_i_mem_waddr;
logic [DataWidth-1:0]   ram_i_mem_wdata;
logic [DataWidth/8-1:0] ram_i_mem_strb;
logic                   ram_i_mem_write;
logic                   ram_i_mem_rvalid;
logic [DataWidth-1:0]   ram_i_mem_rdata;
logic                   ram_i_mem_rsp_valid;
logic [DataWidth-1:0]   ram_i_mem_rsp_rdata;

logic                   ram_d_mem_read;
logic [AddrWidth-1:0]   ram_d_mem_raddr;
logic [AddrWidth-1:0]   ram_d_mem_waddr;
logic [DataWidth-1:0]   ram_d_mem_wdata;
logic [DataWidth/8-1:0] ram_d_mem_strb;
logic                   ram_d_mem_write;
logic                   ram_d_mem_rvalid;
logic [DataWidth-1:0]   ram_d_mem_rdata;
logic                   ram_d_mem_rsp_valid;
logic [DataWidth-1:0]   ram_d_mem_rsp_rdata;

reg [DataWidth-1:0] ram_i   [0:(1<<size)-1];
reg [DataWidth-1:0] ram_d   [0:(1<<size)-1];
reg [7:0] ram_tmp [0:(1<<size)*8-1];
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
logic [63 :0]  icache_r_payload_data     ; 
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
logic [63 :0]  dcache_r_payload_data     ; 
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
logic [63 :0]  dcache_w_payload_data     ; 
logic [31:0]   dcache_w_payload_strb     ; 
logic          dcache_w_payload_last     ; 
logic          dcache_b_valid            ; 
logic          dcache_b_ready            ; 
logic [3:0]    dcache_b_payload_id       ; 
logic [1:0]    dcache_b_payload_resp     ; 
logic          de_rob_a_ready            ; 
logic          de_rob_b_ready            ; 
// ============================== dump fsdb =============================
initial begin
	$display("\n================== Time:%d, Dump Start ================\n",$time);
	$fsdbDumpfile("./simWorkspace/tb_SuperScalar/tb_SuperScalar.fsdb");
	$fsdbDumpvars(0, "tb_SuperScalar", "+mda");
end

// ==================== initial program in ram =======================
initial begin

  fd = $fopen ("/home/lin/oscpu/bin/tests/coremark/coremark-riscv64-nemu.bin", "rb");
  // fd = $fopen ("/home/lin/oscpu/bin/non-output/coremark/coremark.bin", "rb");
  tmp = $fread(ram_tmp, fd);

  for (i = 0; i < (1<<size); i = i + 1) begin
    for (j = 0; j < DataWidth/8; j = j + 1) begin
      ram_i[i][j*8 +: 8] = ram_tmp[i*(DataWidth/8) + j][7:0];
      ram_d[i][j*8 +: 8] = ram_tmp[i*(DataWidth/8) + j][7:0];
    end
  end

  // for (i = 0; i < 131072; i = i + 1) begin
  //   tb_SuperScalar.u_SuperScalar.icache.sram_3.mem_symbol0[i] = ram_tmp[i*(32/8) + 0][7:0];
  //   tb_SuperScalar.u_SuperScalar.icache.sram_3.mem_symbol1[i] = ram_tmp[i*(32/8) + 1][7:0];
  //   tb_SuperScalar.u_SuperScalar.icache.sram_3.mem_symbol2[i] = ram_tmp[i*(32/8) + 2][7:0];
  //   tb_SuperScalar.u_SuperScalar.icache.sram_3.mem_symbol3[i] = ram_tmp[i*(32/8) + 3][7:0];
  // end

end



always@(posedge clk_axi_in) begin
  if(ram_i_mem_read) begin
    ram_i_mem_rsp_valid <= 1'b1;
    ram_i_mem_rsp_rdata = ram_i[ram_i_mem_raddr];
  end
  else begin
    ram_i_mem_rsp_valid <= 1'b0;
  end
end
always@(*) begin
  if(ram_d_mem_read) begin
    ram_d_mem_rsp_valid = 1'b1;
  end
  else begin
    ram_d_mem_rsp_valid = 1'b0;
  end
  ram_d_mem_rsp_rdata = ram_d[ram_d_mem_raddr];
end

// ================== write ram ====================
logic [DataWidth-1:0] mask;
genvar  k;
for(k=0; k<DataWidth/8; k=k+1) begin: assign_mask
  assign mask[k*8+:8] = {8{ram_d_mem_strb[k]}};
end
always @(posedge clk_axi_in) begin
  if (ram_d_mem_write) begin
    ram_d[ram_d_mem_waddr] <= (ram_d_mem_wdata & mask) | (ram_d[ram_d_mem_waddr] & ~mask);
  end
end


// ========================== axi clk and reset =============================	 
initial begin
  clk_axi_in = 'b0     ;  
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
  #600000
  $display("\n============== TimeOut ! Simulation finish ! ============\n");
  $finish;
end

wire[31:0] writeback_pc;
wire       writeback_wen;
wire[31:0] writeback_inst;
wire       writeback_valid;
wire[4:0]  writeback_addr;
wire[63:0] writeback_data;

// assign writeback_wen   = u_SuperScalar.rob.arf_1.write_ports_a_rd_wen || u_SuperScalar.rob.arf_1.write_ports_b_rd_wen;
// assign writeback_pc    = u_SuperScalar.rob.de_rob_a_fire ? u_SuperScalar.rob.de_rob_a_payload_pc : u_SuperScalar.rob.de_rob_b_payload_pc;
// assign writeback_inst  = u_SuperScalar.rob.de_rob_a_fire ? u_SuperScalar.rob.de_rob_a_payload_instruction : u_SuperScalar.rob.de_rob_b_payload_instruction;
// assign writeback_valid = u_SuperScalar.rob.de_rob_a_fire || u_SuperScalar.rob.de_rob_b_fire;
// assign writeback_addr  = u_SuperScalar.rob.arf_1.write_ports_a_rd_wen ? u_SuperScalar.rob.arf_1.write_ports_a_rd_addr : u_SuperScalar.rob.arf_1.write_ports_b_rd_addr;
// assign writeback_data  = u_SuperScalar.rob.arf_1.write_ports_a_rd_wen ? u_SuperScalar.rob.arf_1.write_ports_a_rd_data : u_SuperScalar.rob.arf_1.write_ports_b_rd_data;

// assign writeback_wen   = u_SuperScalar.rob.arf_1.write_ports_rd_wen;
// assign writeback_pc    = u_SuperScalar.rob.de_rob_payload_pc;
// assign writeback_inst  = u_SuperScalar.rob.de_rob_payload_instruction;
// assign writeback_valid = u_SuperScalar.rob.de_rob_fire;
// assign writeback_addr  = u_SuperScalar.rob.arf_1.write_ports_rd_addr;
// assign writeback_data  = u_SuperScalar.rob.arf_1.write_ports_rd_data;

assign writeback_wen   = u_SuperScalar.control_1.write_back_payload_rd_wen;
assign writeback_pc    = u_SuperScalar.control_1.write_back_payload_pc;
assign writeback_inst  = u_SuperScalar.control_1.write_back_payload_instruction;
assign writeback_valid = u_SuperScalar.control_1.write_back_fire;
assign writeback_addr  = u_SuperScalar.control_1.write_back_payload_rd_addr;
assign writeback_data  = u_SuperScalar.control_1.write_back_payload_rd_data;

always@(posedge clk_axi_in) begin
  if(!rst_n) begin
    de_rob_a_ready <= 1'b1;
    de_rob_b_ready <= 1'b0;
  end
  else begin
    // de_rob_a_ready <= ~de_rob_a_ready;
    // de_rob_b_ready <= ~de_rob_b_ready;
  end
end

// SuperScalar u_SuperScalar(
DandMaxFreq u_SuperScalar(
    .icache_ar_valid         ( icache_ar_valid                ),
    .icache_ar_ready         ( icache_ar_ready                ),
    .icache_ar_payload_addr  ( icache_ar_payload_addr         ),
    .icache_ar_payload_id    ( icache_ar_payload_id           ),
    .icache_ar_payload_len   ( icache_ar_payload_len          ),
    .icache_ar_payload_size  ( icache_ar_payload_size         ),
    .icache_ar_payload_burst ( icache_ar_payload_burst        ),
    .icache_r_valid          ( icache_r_valid                 ),
    .icache_r_ready          ( icache_r_ready                 ),
    .icache_r_payload_data   ( icache_r_payload_data          ),
    .icache_r_payload_id     ( icache_r_payload_id            ),
    .icache_r_payload_resp   ( icache_r_payload_resp          ),
    .icache_r_payload_last   ( icache_r_payload_last          ),
    .dcache_ar_valid         ( dcache_ar_valid                ),
    .dcache_ar_ready         ( dcache_ar_ready                ),
    .dcache_ar_payload_addr  ( dcache_ar_payload_addr         ),
    .dcache_ar_payload_id    ( dcache_ar_payload_id           ),
    .dcache_ar_payload_len   ( dcache_ar_payload_len          ),
    .dcache_ar_payload_size  ( dcache_ar_payload_size         ),
    .dcache_ar_payload_burst ( dcache_ar_payload_burst        ),
    .dcache_r_valid          ( dcache_r_valid                 ),
    .dcache_r_ready          ( dcache_r_ready                 ),
    .dcache_r_payload_data   ( dcache_r_payload_data          ),
    .dcache_r_payload_id     ( dcache_r_payload_id            ),
    .dcache_r_payload_resp   ( dcache_r_payload_resp          ),
    .dcache_r_payload_last   ( dcache_r_payload_last          ),
    .dcache_aw_valid         ( dcache_aw_valid                ),
    .dcache_aw_ready         ( dcache_aw_ready                ),
    .dcache_aw_payload_addr  ( dcache_aw_payload_addr         ),
    .dcache_aw_payload_id    ( dcache_aw_payload_id           ),
    .dcache_aw_payload_len   ( dcache_aw_payload_len          ),
    .dcache_aw_payload_size  ( dcache_aw_payload_size         ),
    .dcache_aw_payload_burst ( dcache_aw_payload_burst        ),
    .dcache_w_valid          ( dcache_w_valid                 ),
    .dcache_w_ready          ( dcache_w_ready                 ),
    .dcache_w_payload_data   ( dcache_w_payload_data          ),
    .dcache_w_payload_strb   ( dcache_w_payload_strb          ),
    .dcache_w_payload_last   ( dcache_w_payload_last          ),
    .dcache_b_valid          ( dcache_b_valid                 ),
    .dcache_b_ready          ( dcache_b_ready                 ),
    .dcache_b_payload_id     ( dcache_b_payload_id            ),
    .dcache_b_payload_resp   ( dcache_b_payload_resp          ),
    // .de_rob_a_ready          ( de_rob_a_ready                 ),
    // .de_rob_b_ready          ( de_rob_b_ready                 ),
    .clk                     ( clk_axi_in                     ),
    .resetn                  ( rst_n                          )
);

axi_slave_mem#(
    .AXI_DATA_WIDTH    ( DataWidth ),
    .AXI_ADDR_WIDTH    ( AxiAddrWidth ),
    .AXI_ID_WIDTH      ( 4 ),
    .AXI_STRB_WIDTH    ( DataWidth/8 ),
    .AXI_USER_WIDTH    ( 1 ),
    .WRITE_BUFFER_SIZE ( 2*1024*1024 ),
    .READ_BUFFER_SIZE  ( 2*1024*1024 )
)u_axi_slave_mem_i(
    .clk               ( clk_axi_in               ),
    .rst_n             ( rst_n             ),
    .aw_addr           ( 'b0    ),
    .aw_prot           ( AxiProt    ),
    .aw_region         ( AxiRegion    ),
    .aw_len            ( 'b0  ),
    .aw_size           ( 'b0   ),
    .aw_burst          ( 'b0    ),
    .aw_lock           ( 1'b0    ),
    .aw_cache          ( AxiCache    ),
    .aw_qos            ( AxiQos    ),
    .aw_id             ( 'b0    ),
    .aw_user           ( 1'b0    ),
    .aw_ready          (      ),
    .aw_valid          ( 'b0    ),
    .ar_addr           ( icache_ar_payload_addr    ),
    .ar_prot           ( AxiProt    ),
    .ar_region         ( AxiRegion    ),
    .ar_len            ( icache_ar_payload_len    ),
    .ar_size           ( icache_ar_payload_size    ),
    .ar_burst          ( icache_ar_payload_burst    ),
    .ar_lock           ( 1'b0    ),
    .ar_cache          ( AxiCache    ),
    .ar_qos            ( AxiQos    ),
    .ar_id             ( icache_ar_payload_id    ),
    .ar_user           ( 1'b0    ),
    .ar_ready          ( icache_ar_ready    ),
    .ar_valid          ( icache_ar_valid    ),
    .w_valid           ( 'b0    ),
    .w_data            ( 'b0    ),
    .w_strb            ( 'b0    ),
    .w_user            ( 1'b0    ),
    .w_last            ( 'b0    ),
    .w_ready           (     ),
    .r_data            ( icache_r_payload_data    ),
    .r_resp            ( icache_r_payload_resp    ),
    .r_last            ( icache_r_payload_last    ),
    .r_id              ( icache_r_payload_id    ),
    .r_user            (      ),
    .r_ready           ( icache_r_ready    ),
    .r_valid           ( icache_r_valid    ),
    .b_resp            (     ),
    .b_id              (     ),
    .b_user            (     ),
    .b_ready           ( 'b0    ),
    .b_valid           (     ),
    .axi_mem_wraddr    ( ram_i_mem_waddr    ),
    .axi_mem_rdaddr    ( ram_i_mem_raddr    ),
    .axi_mem_rden      ( ram_i_mem_read  ),
    .axi_mem_wren      ( ram_i_mem_write    ),
    .axi_mem_wmask     ( ram_i_mem_strb    ),
    .axi_mem_wdata     ( ram_i_mem_wdata    ),
    .axi_mem_rdata     ( ram_i_mem_rsp_rdata )
);


axi_slave_mem#(
    .AXI_DATA_WIDTH    ( DataWidth ),
    .AXI_ADDR_WIDTH    ( AxiAddrWidth ),
    .AXI_ID_WIDTH      ( 4 ),
    .AXI_STRB_WIDTH    ( DataWidth/8 ),
    .AXI_USER_WIDTH    ( 1 ),
    .WRITE_BUFFER_SIZE ( 2*1024*1024 ),
    .READ_BUFFER_SIZE  ( 2*1024*1024 )
)u_axi_slave_mem_d(
    .clk               ( clk_axi_in               ),
    .rst_n             ( rst_n             ),
    .aw_addr           ( dcache_aw_payload_addr    ),
    .aw_prot           ( AxiProt    ),
    .aw_region         ( AxiRegion    ),
    .aw_len            ( dcache_aw_payload_len    ),
    .aw_size           ( dcache_aw_payload_size    ),
    .aw_burst          ( dcache_aw_payload_burst    ),
    .aw_lock           ( 1'b0    ),
    .aw_cache          ( AxiCache    ),
    .aw_qos            ( AxiQos    ),
    .aw_id             ( dcache_aw_payload_id    ),
    .aw_user           ( 1'b0    ),
    .aw_ready          ( dcache_aw_ready    ),
    .aw_valid          ( dcache_aw_valid    ),
    .ar_addr           ( dcache_ar_payload_addr    ),
    .ar_prot           ( AxiProt    ),
    .ar_region         ( AxiRegion    ),
    .ar_len            ( dcache_ar_payload_len    ),
    .ar_size           ( dcache_ar_payload_size    ),
    .ar_burst          ( dcache_ar_payload_burst    ),
    .ar_lock           ( 1'b0    ),
    .ar_cache          ( AxiCache    ),
    .ar_qos            ( AxiQos    ),
    .ar_id             ( dcache_ar_payload_id    ),
    .ar_user           ( 1'b0    ),
    .ar_ready          ( dcache_ar_ready    ),
    .ar_valid          ( dcache_ar_valid    ),
    .w_valid           ( dcache_w_valid    ),
    .w_data            ( dcache_w_payload_data    ),
    .w_strb            ( dcache_w_payload_strb    ),
    .w_user            ( 1'b0    ),
    .w_last            ( dcache_w_payload_last    ),
    .w_ready           ( dcache_w_ready    ),
    .r_data            ( dcache_r_payload_data    ),
    .r_resp            ( dcache_r_payload_resp    ),
    .r_last            ( dcache_r_payload_last    ),
    .r_id              ( dcache_r_payload_id    ),
    .r_user            (      ),
    .r_ready           ( dcache_r_ready    ),
    .r_valid           ( dcache_r_valid    ),
    .b_resp            ( dcache_b_payload_resp    ),
    .b_id              ( dcache_b_payload_id    ),
    .b_user            (     ),
    .b_ready           ( dcache_b_ready    ),
    .b_valid           ( dcache_b_valid    ),
    .axi_mem_wraddr    ( ram_d_mem_waddr    ),
    .axi_mem_rdaddr    ( ram_d_mem_raddr    ),
    .axi_mem_rden      ( ram_d_mem_read  ),
    .axi_mem_wren      ( ram_d_mem_write    ),
    .axi_mem_wmask     ( ram_d_mem_strb    ),
    .axi_mem_wdata     ( ram_d_mem_wdata    ),
    .axi_mem_rdata     ( ram_d_mem_rsp_rdata)
);

logic [31:0] instrCnt = 0;
always@(posedge clk_axi_in) begin
  // if(u_SuperScalar.rob.de_rob_a_fire || u_SuperScalar.rob.de_rob_b_fire)
  // if(u_SuperScalar.rob.de_rob_fire)
  if(u_SuperScalar.control_1.write_back_fire)
    instrCnt <= instrCnt+1;
end

always@(posedge clk_axi_in) begin
  if (writeback_valid) begin
    $display("pc:%h, inst:%h, cmt_wen:%b rd_addr:%h, rd_data:%h", writeback_pc, writeback_inst, writeback_wen, writeback_addr, writeback_data);
  end
end

endmodule