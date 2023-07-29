`include "./hw/verilog/axi/typedef.svh"
`include "./hw/verilog/axi/axi_pkg.sv"
`include "./hw/verilog/axi/assign.svh"
`include "./hw/verilog/axi/fifo_v3.sv"

`define	half_axi_clk_period			1

module tb_DandRiscvSimple();

parameter MemAddrWidth = 32;
parameter AxiAddrWidth = 32;
parameter DataWidth = 256;
parameter MaxRequests = 16;
parameter AxiProt = 3'b000;

logic          clk_axi_in;
logic          rst_n;
logic          icache_ar_valid;
logic          icache_ar_ready;
logic [63:0]   icache_ar_payload_addr;
logic [3:0]    icache_ar_payload_id;
logic [7:0]    icache_ar_payload_len;
logic [2:0]    icache_ar_payload_size;
logic [1:0]    icache_ar_payload_burst;
logic          icache_r_valid;
logic          icache_r_ready;
logic [255:0]  icache_r_payload_data;
logic [3:0]    icache_r_payload_id;
logic [1:0]    icache_r_payload_resp;
logic          icache_r_payload_last;
logic          dcache_ar_valid;
logic          dcache_ar_ready;
logic [63:0]   dcache_ar_payload_addr;
logic [3:0]    dcache_ar_payload_id;
logic [7:0]    dcache_ar_payload_len;
logic [2:0]    dcache_ar_payload_size;
logic [1:0]    dcache_ar_payload_burst;
logic          dcache_r_valid;
logic          dcache_r_ready;
logic [255:0]  dcache_r_payload_data;
logic [3:0]    dcache_r_payload_id;
logic [1:0]    dcache_r_payload_resp;
logic          dcache_r_payload_last;
logic          dcache_aw_valid;
logic          dcache_aw_ready;
logic [63:0]   dcache_aw_payload_addr;
logic [3:0]    dcache_aw_payload_id;
logic [7:0]    dcache_aw_payload_len;
logic [2:0]    dcache_aw_payload_size;
logic [1:0]    dcache_aw_payload_burst;
logic          dcache_w_valid;
logic          dcache_w_ready;
logic [255:0]  dcache_w_payload_data;
logic [31:0]   dcache_w_payload_strb;
logic          dcache_w_payload_last;
logic          dcache_b_valid;
logic          dcache_b_ready;
logic [3:0]    dcache_b_payload_id;
logic [1:0]    dcache_b_payload_resp;

`AXI_TYPEDEF_ALL(axi, logic [AxiAddrWidth-1:0], logic [3:0], logic [DataWidth-1:0], logic [DataWidth/8-1:0], logic [3:0])
axi_req_t axi_req;
axi_resp_t axi_rsp;

reg [63:0] ram [0:65535];
reg [63:0] ram_tmp [0:65535];
integer fd;
integer tmp;
integer i;
integer j;


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
      ram[i][j*8 +: 8] = ram_tmp[i][(7-j)*8 +: 8];
    end
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
  rst_n = 'b0;
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
    .icache_ar_valid         ( icache_ar_valid         ),
    .icache_ar_ready         ( icache_ar_ready         ),
    .icache_ar_payload_addr  ( icache_ar_payload_addr  ),
    .icache_ar_payload_id    ( icache_ar_payload_id    ),
    .icache_ar_payload_len   ( icache_ar_payload_len   ),
    .icache_ar_payload_size  ( icache_ar_payload_size  ),
    .icache_ar_payload_burst ( icache_ar_payload_burst ),
    .icache_r_valid          ( icache_r_valid          ),
    .icache_r_ready          ( icache_r_ready          ),
    .icache_r_payload_data   ( icache_r_payload_data   ),
    .icache_r_payload_id     ( icache_r_payload_id     ),
    .icache_r_payload_resp   ( icache_r_payload_resp   ),
    .icache_r_payload_last   ( icache_r_payload_last   ),
    .dcache_ar_valid         ( dcache_ar_valid         ),
    .dcache_ar_ready         ( dcache_ar_ready         ),
    .dcache_ar_payload_addr  ( dcache_ar_payload_addr  ),
    .dcache_ar_payload_id    ( dcache_ar_payload_id    ),
    .dcache_ar_payload_len   ( dcache_ar_payload_len   ),
    .dcache_ar_payload_size  ( dcache_ar_payload_size  ),
    .dcache_ar_payload_burst ( dcache_ar_payload_burst ),
    .dcache_r_valid          ( dcache_r_valid          ),
    .dcache_r_ready          ( dcache_r_ready          ),
    .dcache_r_payload_data   ( dcache_r_payload_data   ),
    .dcache_r_payload_id     ( dcache_r_payload_id     ),
    .dcache_r_payload_resp   ( dcache_r_payload_resp   ),
    .dcache_r_payload_last   ( dcache_r_payload_last   ),
    .dcache_aw_valid         ( dcache_aw_valid         ),
    .dcache_aw_ready         ( dcache_aw_ready         ),
    .dcache_aw_payload_addr  ( dcache_aw_payload_addr  ),
    .dcache_aw_payload_id    ( dcache_aw_payload_id    ),
    .dcache_aw_payload_len   ( dcache_aw_payload_len   ),
    .dcache_aw_payload_size  ( dcache_aw_payload_size  ),
    .dcache_aw_payload_burst ( dcache_aw_payload_burst ),
    .dcache_w_valid          ( dcache_w_valid          ),
    .dcache_w_ready          ( dcache_w_ready          ),
    .dcache_w_payload_data   ( dcache_w_payload_data   ),
    .dcache_w_payload_strb   ( dcache_w_payload_strb   ),
    .dcache_w_payload_last   ( dcache_w_payload_last   ),
    .dcache_b_valid          ( dcache_b_valid          ),
    .dcache_b_ready          ( dcache_b_ready          ),
    .dcache_b_payload_id     ( dcache_b_payload_id     ),
    .dcache_b_payload_resp   ( dcache_b_payload_resp   ),
    .clk                     ( clk_axi_in              ),
    .reset                   ( !rst_n                  )
);





endmodule