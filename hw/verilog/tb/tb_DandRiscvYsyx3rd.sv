`define	half_axi_clk_period			1

module tb_DandRiscvYsyx3rd();

parameter AddrWidth = 32;
parameter AxiAddrWidth = 32;
parameter DataWidth = 64;
parameter AxiProt = 3'b000;
parameter AxiRegion = 4'b0000;
parameter AxiCache = 4'b0000;
parameter AxiQos = 4'b0000;
parameter size = 17;

logic          clk_axi_in;
logic          rst_n;

logic                   ram_mem_read;
logic [AddrWidth-1:0]   ram_mem_raddr;
logic [AddrWidth-1:0]   ram_mem_waddr;
logic [DataWidth-1:0]   ram_mem_wdata;
logic [DataWidth/8-1:0] ram_mem_strb;
logic                   ram_mem_write;
logic                   ram_mem_rvalid;
logic [DataWidth-1:0]   ram_mem_rdata;
logic                   ram_mem_rsp_valid;
logic [DataWidth-1:0]   ram_mem_rsp_rdata;

reg [DataWidth-1:0] ram   [0:(1<<size)-1];
reg [7:0] ram_tmp [0:(1<<size)*DataWidth/8-1];
integer fd;
integer tmp;
integer i;
integer j;

wire              io_interrupt;
wire              io_master_awready;
wire              io_master_awvalid;
wire     [31:0]   io_master_awaddr;
wire     [3:0]    io_master_awid;
wire     [7:0]    io_master_awlen;
wire     [2:0]    io_master_awsize;
wire     [1:0]    io_master_awburst;
wire              io_master_wready;
wire              io_master_wvalid;
wire     [63:0]   io_master_wdata;
wire     [7:0]    io_master_wstrb;
wire              io_master_wlast;
wire              io_master_bready;
wire              io_master_bvalid;
wire     [1:0]    io_master_bresp;
wire     [3:0]    io_master_bid;
wire              io_master_arready;
wire              io_master_arvalid;
wire     [31:0]   io_master_araddr;
wire     [3:0]    io_master_arid;
wire     [7:0]    io_master_arlen;
wire     [2:0]    io_master_arsize;
wire     [1:0]    io_master_arburst;
wire              io_master_rready;
wire              io_master_rvalid;
wire     [1:0]    io_master_rresp;
wire     [63:0]   io_master_rdata;
wire              io_master_rlast;
wire     [3:0]    io_master_rid;
wire              io_slave_awready;
wire              io_slave_awvalid;
wire     [31:0]   io_slave_awaddr;
wire     [3:0]    io_slave_awid;
wire     [7:0]    io_slave_awlen;
wire     [2:0]    io_slave_awsize;
wire     [1:0]    io_slave_awburst;
wire              io_slave_wready;
wire              io_slave_wvalid;
wire     [63:0]   io_slave_wdata;
wire     [7:0]    io_slave_wstrb;
wire              io_slave_wlast;
wire              io_slave_bready;
wire              io_slave_bvalid;
wire     [1:0]    io_slave_bresp;
wire     [3:0]    io_slave_bid;
wire              io_slave_arready;
wire              io_slave_arvalid;
wire     [31:0]   io_slave_araddr;
wire     [3:0]    io_slave_arid;
wire     [7:0]    io_slave_arlen;
wire     [2:0]    io_slave_arsize;
wire     [1:0]    io_slave_arburst;
wire              io_slave_rready;
wire              io_slave_rvalid;
wire     [1:0]    io_slave_rresp;
wire     [63:0]   io_slave_rdata;
wire              io_slave_rlast;
wire     [3:0]    io_slave_rid;

// ============================== dump fsdb =============================
initial begin
	$display("\n================== Time:%d, Dump Start ================\n",$time);
	$fsdbDumpfile("./simWorkspace/tb_DandRiscvYsyx3rd/tb_DandRiscvYsyx3rd.fsdb");
	$fsdbDumpvars(0, "tb_DandRiscvYsyx3rd", "+mda");
end

// ==================== initial program in ram =======================
initial begin

  // fd = $fopen ("../../oscpu/bin/non-output/coremark/coremark.bin", "rb");
  fd = $fopen ("../../oscpu/bin/custom-output/mario/fceux-mario.bin", "rb");
  // fd = $fopen ("../../oscpu/bin/non-output/dhrystone/dhrystone.bin", "rb");
  // fd = $fopen ("./ysyx-workbench/am-kernels/tests/cpu-tests/build/add-longlong-riscv64-nemu.bin", "rb");
  tmp = $fread(ram_tmp, fd);

  for (i = 0; i < (1<<size); i = i + 1) begin
    for (j = 0; j < DataWidth/8; j = j + 1) begin
      ram[i][j*8 +: 8] = ram_tmp[i*(DataWidth/8) + j][7:0];
    end
  end
end

// ================== read ram ====================
always@(*) begin
  if(ram_mem_read) begin
    ram_mem_rsp_valid = 1'b1;
  end
  else begin
    ram_mem_rsp_valid = 1'b0;
  end
  ram_mem_rsp_rdata = ram[ram_mem_raddr];
end

// ================== write ram ====================
logic [DataWidth-1:0] mask;
genvar  k;
for(k=0; k<DataWidth/8; k=k+1) begin: assign_mask
  assign mask[k*8+:8] = {8{ram_mem_strb[k]}};
end
always @(posedge clk_axi_in) begin
  if (ram_mem_write) begin
    ram[ram_mem_waddr] <= (ram_mem_wdata & mask) | (ram[ram_mem_waddr] & ~mask);
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
  #55000
  $display("\n============== TimeOut ! Simulation finish ! ============\n");
  $finish;
end


ysyx_210238 u_ysyx_210238(
    .clock             ( clk_axi_in        ),
    .reset             ( !rst_n            ),
    .io_interrupt      ( io_interrupt      ),
    .io_master_awready ( io_master_awready ),
    .io_master_awvalid ( io_master_awvalid ),
    .io_master_awaddr  ( io_master_awaddr  ),
    .io_master_awid    ( io_master_awid    ),
    .io_master_awlen   ( io_master_awlen   ),
    .io_master_awsize  ( io_master_awsize  ),
    .io_master_awburst ( io_master_awburst ),
    .io_master_wready  ( io_master_wready  ),
    .io_master_wvalid  ( io_master_wvalid  ),
    .io_master_wdata   ( io_master_wdata   ),
    .io_master_wstrb   ( io_master_wstrb   ),
    .io_master_wlast   ( io_master_wlast   ),
    .io_master_bready  ( io_master_bready  ),
    .io_master_bvalid  ( io_master_bvalid  ),
    .io_master_bresp   ( io_master_bresp   ),
    .io_master_bid     ( io_master_bid     ),
    .io_master_arready ( io_master_arready ),
    .io_master_arvalid ( io_master_arvalid ),
    .io_master_araddr  ( io_master_araddr  ),
    .io_master_arid    ( io_master_arid    ),
    .io_master_arlen   ( io_master_arlen   ),
    .io_master_arsize  ( io_master_arsize  ),
    .io_master_arburst ( io_master_arburst ),
    .io_master_rready  ( io_master_rready  ),
    .io_master_rvalid  ( io_master_rvalid  ),
    .io_master_rresp   ( io_master_rresp   ),
    .io_master_rdata   ( io_master_rdata   ),
    .io_master_rlast   ( io_master_rlast   ),
    .io_master_rid     ( io_master_rid     ),
    .io_slave_awready  ( io_slave_awready  ),
    .io_slave_awvalid  ( io_slave_awvalid  ),
    .io_slave_awaddr   ( io_slave_awaddr   ),
    .io_slave_awid     ( io_slave_awid     ),
    .io_slave_awlen    ( io_slave_awlen    ),
    .io_slave_awsize   ( io_slave_awsize   ),
    .io_slave_awburst  ( io_slave_awburst  ),
    .io_slave_wready   ( io_slave_wready   ),
    .io_slave_wvalid   ( io_slave_wvalid   ),
    .io_slave_wdata    ( io_slave_wdata    ),
    .io_slave_wstrb    ( io_slave_wstrb    ),
    .io_slave_wlast    ( io_slave_wlast    ),
    .io_slave_bready   ( io_slave_bready   ),
    .io_slave_bvalid   ( io_slave_bvalid   ),
    .io_slave_bresp    ( io_slave_bresp    ),
    .io_slave_bid      ( io_slave_bid      ),
    .io_slave_arready  ( io_slave_arready  ),
    .io_slave_arvalid  ( io_slave_arvalid  ),
    .io_slave_araddr   ( io_slave_araddr   ),
    .io_slave_arid     ( io_slave_arid     ),
    .io_slave_arlen    ( io_slave_arlen    ),
    .io_slave_arsize   ( io_slave_arsize   ),
    .io_slave_arburst  ( io_slave_arburst  ),
    .io_slave_rready   ( io_slave_rready   ),
    .io_slave_rvalid   ( io_slave_rvalid   ),
    .io_slave_rresp    ( io_slave_rresp    ),
    .io_slave_rdata    ( io_slave_rdata    ),
    .io_slave_rlast    ( io_slave_rlast    ),
    .io_slave_rid      ( io_slave_rid      )
);

// ----------------- ram ------------------
axi_slave_mem#(
    .AXI_DATA_WIDTH    ( DataWidth ),
    .AXI_ADDR_WIDTH    ( AxiAddrWidth ),
    .AXI_ID_WIDTH      ( 4 ),
    .AXI_STRB_WIDTH    ( DataWidth/8 ),
    .AXI_USER_WIDTH    ( 1 ),
    .WRITE_BUFFER_SIZE ( 2*1024*1024 ),
    .READ_BUFFER_SIZE  ( 2*1024*1024 )
)u_axi_slave_mem(
    .clk               ( clk_axi_in               ),
    .rst_n             ( rst_n             ),
    .aw_addr           ( io_master_awaddr    ),
    .aw_prot           ( AxiProt    ),
    .aw_region         ( AxiRegion    ),
    .aw_len            ( io_master_awlen    ),
    .aw_size           ( io_master_awsize    ),
    .aw_burst          ( io_master_awburst    ),
    .aw_lock           ( 1'b0    ),
    .aw_cache          ( AxiCache    ),
    .aw_qos            ( AxiQos    ),
    .aw_id             ( io_master_awid    ),
    .aw_user           ( 1'b0    ),
    .aw_ready          ( io_master_awready    ),
    .aw_valid          ( io_master_awvalid  ),
    .ar_addr           ( io_master_araddr    ),
    .ar_prot           ( AxiProt    ),
    .ar_region         ( AxiRegion    ),
    .ar_len            ( io_master_arlen    ),
    .ar_size           ( io_master_arsize    ),
    .ar_burst          ( io_master_arburst    ),
    .ar_lock           ( 1'b0    ),
    .ar_cache          ( AxiCache    ),
    .ar_qos            ( AxiQos    ),
    .ar_id             ( io_master_arid    ),
    .ar_user           ( 1'b0    ),
    .ar_ready          ( io_master_arready    ),
    .ar_valid          ( io_master_arvalid    ),
    .w_valid           ( io_master_wvalid    ),
    .w_data            ( io_master_wdata    ),
    .w_strb            ( io_master_wstrb    ),
    .w_user            ( 1'b0    ),
    .w_last            ( io_master_wlast    ),
    .w_ready           ( io_master_wready    ),
    .r_data            ( io_master_rdata    ),
    .r_resp            ( io_master_rresp    ),
    .r_last            ( io_master_rlast    ),
    .r_id              ( io_master_rid    ),
    .r_user            (     ),
    .r_ready           ( io_master_rready    ),
    .r_valid           ( io_master_rvalid    ),
    .b_resp            ( io_master_bresp    ),
    .b_id              ( io_master_bid    ),
    .b_user            (     ),
    .b_ready           ( io_master_bready    ),
    .b_valid           ( io_master_bvalid    ),
    .axi_mem_wraddr    ( ram_mem_waddr    ),
    .axi_mem_rdaddr    ( ram_mem_raddr    ),
    .axi_mem_rden      ( ram_mem_read  ),
    .axi_mem_wren      ( ram_mem_write    ),
    .axi_mem_wmask     ( ram_mem_strb    ),
    .axi_mem_wdata     ( ram_mem_wdata    ),
    .axi_mem_rdata     ( ram_mem_rsp_rdata)
);


logic [31:0] instrCnt = 0;
always@(posedge clk_axi_in) begin
  if(u_ysyx_210238.core_cpu.writeback_arbitration_isFiring)
    instrCnt <= instrCnt+1;
end

endmodule