module uart_rx #(
    parameter BAUD_RATE = 9600,
    parameter CLOCK_FREQ = 50000000
)(
    input wire clk,       
    input wire resetn,    
    input wire rx,        
    output reg [7:0] data,
    output reg data_valid 
);

localparam integer COUNT_MAX = CLOCK_FREQ / BAUD_RATE;
localparam integer MID_SAMPLE = COUNT_MAX / 2;

logic [15:0] sample_counter;  
logic sample_pulse;
logic [2:0] bit_index;
logic sampling;

logic [7:0] temp_data;                  

logic [3:0] cur_state;
logic [3:0] nxt_state;

localparam IDLE = 0;
localparam START = 1;
localparam DATA = 2;

logic rx_d1;
logic rx_neg;

// 0. rx start
assign rx_neg = rx_d1 && ~rx;
always @(posedge clk or negedge resetn) begin
  if (!resetn) begin
    rx_d1 <= 0;
  end
  else begin
    rx_d1 <= rx;
  end
end


// 1. count clock
assign sample_pulse = (sample_counter == 0) && resetn && sampling;

always @(posedge clk or negedge resetn) begin
  if (!resetn) begin
    sampling <= 0;
  end
  else if(rx_neg && cur_state==IDLE)
    sampling <= 1;
  // else if(sample_pulse && nxt_state==IDLE && cur_state==DATA)
  else if(data_valid)
    sampling <= 0;
end


always @(posedge clk or negedge resetn) begin
  if (!resetn) begin
    sample_counter <= MID_SAMPLE;
  end 
  else if (sampling) begin
    if (sample_pulse)
      sample_counter <= COUNT_MAX;
    else
      sample_counter <= sample_counter - 1;
  end
  else if (cur_state==IDLE)
    sample_counter <= MID_SAMPLE;
end

// 2. temp data
always @(posedge clk or negedge resetn) begin
  if (!resetn) begin
    bit_index <= 0;
    temp_data <= 0;
  end 
  else begin
    if (data_valid) begin
      bit_index <= 0;
      temp_data <= 0;
    end
    else if (nxt_state==DATA && sample_pulse) begin
      bit_index <= bit_index+1;
      temp_data[bit_index] <= rx;
    end
  end
end

always @(posedge clk or negedge resetn) begin
  if (!resetn) begin
    cur_state <= IDLE;
  end
  else begin
    cur_state <= nxt_state;
  end
end

endmodule