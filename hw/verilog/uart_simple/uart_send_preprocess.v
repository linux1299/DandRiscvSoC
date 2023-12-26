module uart_send_preprocess(
    input	           sys_clk,  
    input            sys_rst_n,
     
    input            apb_wen,  
    input      [7:0] apb_wdata,
    output           apb_ready,
     
    output           apb_wen_o,  
    output     [7:0] apb_wdata_o,
    input            tx_busy
    );

parameter tx_latency = 5;

reg read;
reg [3:0] read_cnt;

wire write, fifo_empty, fifo_full;
wire [7:0] fifo_out;

assign apb_ready = !fifo_full;
assign write = apb_wen && apb_ready;
assign apb_wen_o = read;
assign apb_wdata_o = fifo_out;

always@(posedge sys_clk or negedge sys_rst_n)begin
  if(~sys_rst_n)begin
    read_cnt <= 4'b0;
  end
  else begin
    if (read_cnt == tx_latency)
      read_cnt <= 4'b0;
    else if (read || read_cnt!=4'b0)
      read_cnt <= read_cnt + 1'b1;
  end
end

always@(posedge sys_clk or negedge sys_rst_n)begin
  if(~sys_rst_n)begin
    read <= 1'b0;
  end
  else begin
    if (read)
      read <= 1'b0;
    else if (~tx_busy && ~fifo_empty && read_cnt==4'b0)
      read <= 1'b1;
  end
end

fifo_sync#(
    .PTR_WIDTH  ( 6 ),
    .FIFO_DEPTH ( 64 ),
    .FIFO_WIDTH ( 8 )
)u_fifo_sync(
    .clk        ( sys_clk    ),
    .rst_n      ( sys_rst_n  ),
    .read       ( read       ),
    .write      ( write      ),
    .fifo_in    ( apb_wdata    ),
    .fifo_out   ( fifo_out   ),
    .fifo_empty ( fifo_empty ),
    .fifo_full  ( fifo_full  )
);

endmodule