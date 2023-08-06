`define	half_axi_clk_period			1

module tb_DandRiscvSmallest();


parameter DataWidth = 64;

logic          clk_axi_in;
logic          rst_n;

logic          icache_cmd_valid;
logic          icache_cmd_ready = 1'b1;
logic [63:0]   icache_cmd_payload_addr;
logic          icache_rsp_valid;
logic [31:0]   icache_rsp_payload_data;
logic          dcache_cmd_valid;
logic          dcache_cmd_ready = 1'b1;
logic [63:0]   dcache_cmd_payload_addr;
logic          dcache_cmd_payload_wen;
logic [63:0]   dcache_cmd_payload_wdata;
logic [7:0]    dcache_cmd_payload_wstrb;
logic [2:0]    dcache_cmd_payload_size;
logic          dcache_rsp_valid;
logic [63:0]   dcache_rsp_payload_data;

reg [DataWidth-1:0] ram_i   [0:1023];
reg [DataWidth-1:0] ram_d   [0:1023];
reg [7:0] ram_tmp [0:1024*DataWidth/8-1];
integer fd;
integer tmp;
integer i;
integer j;

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
  #20000
  $display("\n============== TimeOut ! Simulation finish ! ============\n");
  $finish;
end

// ============================== dump fsdb =============================
initial begin
	$display("\n================== Time:%d, Dump Start ================\n",$time);
	$fsdbDumpfile("./simWorkspace/tb_DandRiscvSmallest/tb_DandRiscvSmallest.fsdb");
	$fsdbDumpvars(0, "tb_DandRiscvSmallest", "+mda");
end

// ==================== initial program in ram =======================
initial begin

  // fd = $fopen ("./ysyx-workbench/am-kernels/tests/alu-tests/build/alutest-riscv64-nemu.bin", "rb");
  fd = $fopen ("../../oscpu/bin/non-output/cpu-tests/add-cpu-tests.bin", "rb");
  tmp = $fread(ram_tmp, fd);

  for (i = 0; i < 1024; i = i + 1) begin
    for (j = 0; j < DataWidth/8; j = j + 1) begin
      ram_i[i][j*8 +: 8] = ram_tmp[i*(DataWidth/8) + j][7:0];
      ram_d[i][j*8 +: 8] = ram_tmp[i*(DataWidth/8) + j][7:0];
    end
  end
end

// ================ read ram ====================
always@(posedge clk_axi_in) begin
  if(icache_cmd_valid) begin
    icache_rsp_valid <= 1'b1;
    icache_rsp_payload_data <= ram_i[icache_cmd_payload_addr[12:3]][icache_cmd_payload_addr[2]*32+:32];
  end
  else begin
    icache_rsp_valid <= 1'b0;
  end

  // if(dcache_cmd_valid) begin
  //   dcache_rsp_valid <= 1'b1;
  //   dcache_rsp_payload_data <= ram_d[dcache_cmd_payload_addr[12:3]];
  // end
  // else begin
  //   dcache_rsp_valid <= 1'b0;
  // end
end

always@(*) begin
  if(dcache_cmd_valid) begin
    dcache_rsp_valid = 1'b1;
    dcache_rsp_payload_data = ram_d[dcache_cmd_payload_addr[12:3]];
  end
  else begin
    dcache_rsp_valid = 1'b0;
  end
end

// ================== write ram ====================
logic [DataWidth-1:0] mask;
genvar  k;
for(k=0; k<DataWidth/8; k=k+1) begin: assign_mask
  assign mask[k*8+:8] = {8{dcache_cmd_payload_wstrb[k]}};
end
always @(posedge clk_axi_in) begin
  if (dcache_cmd_valid && dcache_cmd_payload_wen) begin
    ram_d[dcache_cmd_payload_addr[12:3]] <= (dcache_cmd_payload_wdata & mask) | (ram_d[dcache_cmd_payload_addr[12:3]] & ~mask);
  end
end

DandRiscvSimple u_DandRiscvSimple(
    .icache_cmd_valid         ( icache_cmd_valid         ),
    .icache_cmd_ready         ( icache_cmd_ready         ),
    .icache_cmd_payload_addr  ( icache_cmd_payload_addr  ),
    .icache_rsp_valid         ( icache_rsp_valid         ),
    .icache_rsp_payload_data  ( icache_rsp_payload_data  ),
    .dcache_cmd_valid         ( dcache_cmd_valid         ),
    .dcache_cmd_ready         ( dcache_cmd_ready         ),
    .dcache_cmd_payload_addr  ( dcache_cmd_payload_addr  ),
    .dcache_cmd_payload_wen   ( dcache_cmd_payload_wen   ),
    .dcache_cmd_payload_wdata ( dcache_cmd_payload_wdata ),
    .dcache_cmd_payload_wstrb ( dcache_cmd_payload_wstrb ),
    .dcache_cmd_payload_size  ( dcache_cmd_payload_size  ),
    .dcache_rsp_valid         ( dcache_rsp_valid         ),
    .dcache_rsp_payload_data  ( dcache_rsp_payload_data  ),
    .clk                      ( clk_axi_in               ),
    .reset                    ( !rst_n                   )
);



endmodule