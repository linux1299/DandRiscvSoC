module uart_apb (
    input   wire        resetn
  , input   wire        clk
  , input   wire        in_psel
  , input   wire        in_penable
  , input   wire [2:0]  in_pprot
  , output              in_pready
  , output  wire        in_pslverr
  , input   wire [31:0] in_paddr
  , input   wire        in_pwrite
  , output  wire [31:0] in_prdata
  , input   wire [31:0] in_pwdata
  , input   wire [3:0]  in_pstrb
  , input   wire        uart_rx       // serial output
  , output  wire        uart_tx       // serial input
);

// parameter  CLK_FREQ = 14000000; // 14MHz
parameter  CLK_FREQ = 30000000; // 30MHz
// parameter  CLK_FREQ = 500000000; // 500MHz
// parameter  UART_BPS = 115200;
parameter  UART_BPS = 921600;

wire uart_recv_done;
wire [7:0] uart_recv_data;
wire       uart_send_en;  
wire [7:0] uart_send_data;
wire       uart_tx_busy;
wire apb_wen;
wire [7:0] apb_wdata;
// reg in_pready_tmp;
wire prep_apb_wen;
wire [7:0] prep_apb_wdata;
wire prep_apb_ready;
wire prep_apb_wen_o;
wire [7:0] prep_apb_wdata_o;

assign apb_wen = in_psel & in_pready & in_penable & in_pwrite;
assign apb_wdata = in_pwdata[7:0];

assign in_pslverr = 1'b0;
// assign in_pready = ~uart_tx_busy & in_pready_tmp;
assign in_pready = prep_apb_ready;

assign prep_apb_wen = apb_wen;
assign prep_apb_wdata = apb_wdata;

// always@(posedge clk or negedge resetn) begin
//   if(!resetn) begin
//     in_pready_tmp <= 1'b0;
//   end
//   else if (in_psel & ~in_pready_tmp) begin
//     in_pready_tmp <= 1'b1;
//   end
//   else begin
//     in_pready_tmp <= 1'b0;
//   end
// end


uart_recv #(                          
    .CLK_FREQ       (CLK_FREQ),
    .UART_BPS       (UART_BPS))
u_uart_recv(                 
    .sys_clk        (clk), 
    .sys_rst_n      (resetn),
    
    .uart_rxd       (uart_rx), // in
    .uart_done      (uart_recv_done), // out
    .uart_data      (uart_recv_data) // out
    );

uart_send_preprocess u_uart_send_preprocess(
    .sys_clk     ( clk     ),
    .sys_rst_n   ( resetn   ),
    .apb_wen     ( prep_apb_wen     ),
    .apb_wdata   ( prep_apb_wdata   ),
    .apb_ready   ( prep_apb_ready   ),
    .apb_wen_o   ( prep_apb_wen_o   ),
    .apb_wdata_o ( prep_apb_wdata_o ),
    .tx_busy     ( uart_tx_busy     )
);


uart_send_data u_uart_send_data(
    .sys_clk        (clk),             
    .sys_rst_n      (resetn),           
   
    .apb_wen        (prep_apb_wen_o),
    .apb_wdata      (prep_apb_wdata_o),
   
    .tx_busy        (uart_tx_busy),  
    .send_en        (uart_send_en),  
    .send_data      (uart_send_data) 
    );

uart_send #(                          
    .CLK_FREQ       (CLK_FREQ),
    .UART_BPS       (UART_BPS))
u_uart_send(                 
    .sys_clk        (clk),
    .sys_rst_n      (resetn),
     
    .uart_en        (uart_send_en),
    .uart_din       (uart_send_data),
    .uart_tx_busy   (uart_tx_busy),
    .uart_txd       (uart_tx)
    );



endmodule

