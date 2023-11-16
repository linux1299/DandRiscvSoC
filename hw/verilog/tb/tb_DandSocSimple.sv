`define	half_axi_clk_period			1

module tb_DandSocSimple();

logic          clk_axi_in;
logic          rst_n;



DandSocSimple u_DandSocSimple(
    .io_asyncResetn  (      rst_n ),
    .io_axiClk     ( clk_axi_in    ),
    .io_uart_txd   ( io_uart_txd   ),
    .io_uart_rxd   ( io_uart_rxd   )
);

// ============================== dump fsdb =============================
initial begin
	$display("\n================== Time:%d, Dump Start ================\n",$time);
	$fsdbDumpfile("./simWorkspace/tb_DandSocSimple/tb_DandSocSimple.fsdb");
	$fsdbDumpvars(0, "tb_DandSocSimple", "+mda");
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

  #10000
  rst_n = 1'b0;
  # 5000
  rst_n = 1'b1;
end

// ========================== Time out =============================
initial begin
  #55000
  $display("\n============== TimeOut ! Simulation finish ! ============\n");
  $finish;
end

logic [31:0] instrCnt = 0;
always@(posedge clk_axi_in) begin
  if(tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_arbitration_isFiring)
    instrCnt <= instrCnt+1;
end

// always@(posedge clk_axi_in) begin
//   if (tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_arbitration_isFiring)
//     $display("wb_pc is %h, pc_cnt is %d", tb_DandSocSimple.u_DandSocSimple.core_cpu.writeback_PC[63:0], instrCnt);
// end

endmodule