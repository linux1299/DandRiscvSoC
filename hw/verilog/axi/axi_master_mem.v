module axi_master_mem # (
  parameter RW_DATA_WIDTH     = 64,
  parameter RW_ADDR_WIDTH     = 64,
  parameter AXI_DATA_WIDTH    = 64,
  parameter AXI_ADDR_WIDTH    = 64,
  parameter AXI_ID_WIDTH      = 4,
  parameter AXI_USER_WIDTH    = 1
)(
  input                               clk,
  input                               rst_n,

  // mem port
  input                               rw_cen_i,
  input                               rw_wen_i,
  input  [RW_ADDR_WIDTH-1:0]          rw_addr_i,
  input  [2:0]                        rw_size_i,
  input  [RW_DATA_WIDTH-1:0]          rw_wdata_i,
  input  [AXI_DATA_WIDTH/8-1:0]       rw_wmask_i,
  output                              rw_ready_o,
  output [RW_DATA_WIDTH-1:0]          rw_rdata_o,
  output                              rw_rvalid_o,
  output [1:0]                        rw_resp_o,

  //------------AXI port-------------------------
  // write address channel
  output [AXI_ID_WIDTH-1:0]           axi_aw_id_o,
  output [AXI_ADDR_WIDTH-1:0]         axi_aw_addr_o,
  output [7:0]                        axi_aw_len_o,
  output [2:0]                        axi_aw_size_o,
  output [1:0]                        axi_aw_burst_o,
  output                              axi_aw_lock_o,
  output [3:0]                        axi_aw_cache_o,
  output [2:0]                        axi_aw_prot_o,
  output [3:0]                        axi_aw_qos_o,
  output [3:0]                        axi_aw_region_o,
  output [AXI_USER_WIDTH-1:0]         axi_aw_user_o,
  output                              axi_aw_valid_o,
  input                               axi_aw_ready_i,

  // write data channel
  input                               axi_w_ready_i,
  output                              axi_w_valid_o,
  output [AXI_DATA_WIDTH-1:0]         axi_w_data_o,
  output [AXI_DATA_WIDTH/8-1:0]       axi_w_strb_o,
  output                              axi_w_last_o,
  output [AXI_USER_WIDTH-1:0]         axi_w_user_o,

  // write response channel
  output                              axi_b_ready_o,
  input                               axi_b_valid_i,
  input  [1:0]                        axi_b_resp_i,
  input  [AXI_ID_WIDTH-1:0]           axi_b_id_i,
  input  [AXI_USER_WIDTH-1:0]         axi_b_user_i,

  // read address channel
  input                               axi_ar_ready_i,
  output                              axi_ar_valid_o,
  output [AXI_ADDR_WIDTH-1:0]         axi_ar_addr_o,
  output [2:0]                        axi_ar_prot_o,
  output [AXI_ID_WIDTH-1:0]           axi_ar_id_o,
  output [AXI_USER_WIDTH-1:0]         axi_ar_user_o,
  output [7:0]                        axi_ar_len_o,
  output [2:0]                        axi_ar_size_o,
  output [1:0]                        axi_ar_burst_o,
  output                              axi_ar_lock_o,
  output [3:0]                        axi_ar_cache_o,
  output [3:0]                        axi_ar_qos_o,
  output [3:0]                        axi_ar_region_o,

  // read data channel
  output                              axi_r_ready_o,
  input                               axi_r_valid_i,
  input  [1:0]                        axi_r_resp_i,
  input  [AXI_DATA_WIDTH-1:0]         axi_r_data_i,
  input                               axi_r_last_i,
  input  [AXI_ID_WIDTH-1:0]           axi_r_id_i,
  input  [AXI_USER_WIDTH-1:0]         axi_r_user_i
);

assign axi_ar_region_o = 4'd0;

wire w_trans    = rw_wen_i;
wire r_trans    = ~rw_wen_i;
wire w_valid    = rw_cen_i & w_trans;
wire r_valid    = rw_cen_i & r_trans;

// handshake
wire aw_hs      = axi_aw_ready_i & axi_aw_valid_o;
wire w_hs       = axi_w_ready_i  & axi_w_valid_o;
wire b_hs       = axi_b_ready_o  & axi_b_valid_i;
wire ar_hs      = axi_ar_ready_i & axi_ar_valid_o;
wire r_hs       = axi_r_ready_o  & axi_r_valid_i;

wire w_done     = w_hs & axi_w_last_o;
wire r_done     = r_hs & axi_r_last_i;
wire trans_done = w_trans ? b_hs : r_done;


// ------------------State Machine------------------
localparam [1:0] AW_STATE_IDLE  = 2'b00;
localparam [1:0] AW_STATE_ADDR  = 2'b01;
localparam [1:0] AW_STATE_RESP  = 2'b10;
localparam [1:0] AW_STATE_DONE  = 2'b11;

localparam [1:0] W_STATE_IDLE  = 2'b00;
localparam [1:0] W_STATE_WRITE = 2'b01;
localparam [1:0] W_STATE_RESP  = 2'b10;
localparam [1:0] W_STATE_DONE  = 2'b11;

localparam [1:0] R_STATE_IDLE  = 2'b00;
localparam [1:0] R_STATE_ADDR  = 2'b01;
localparam [1:0] R_STATE_READ  = 2'b10;
localparam [1:0] R_STATE_DONE  = 2'b11;

reg [1:0] aw_state;
reg [1:0] w_state;
reg [1:0] r_state;

wire aw_state_idle  = aw_state == AW_STATE_IDLE;
wire aw_state_addr  = aw_state == AW_STATE_ADDR;
wire aw_state_resp  = aw_state == AW_STATE_RESP;
wire aw_state_done  = aw_state == AW_STATE_DONE;

wire w_state_idle  = w_state == W_STATE_IDLE;
wire w_state_write = w_state == W_STATE_WRITE;
wire w_state_resp  = w_state == W_STATE_RESP;
wire w_state_done  = w_state == W_STATE_DONE;

wire r_state_idle  = r_state == R_STATE_IDLE;
wire r_state_addr  = r_state == R_STATE_ADDR;
wire r_state_read  = r_state == R_STATE_READ;
wire r_state_done  = r_state == R_STATE_DONE;

// ------------ Wirte State Machine (AW)--------------
always @(posedge clk or negedge rst_n) begin
  if (~rst_n) begin
    aw_state <= AW_STATE_IDLE;
  end
  else begin
    if (w_valid) begin
      case (aw_state)
        AW_STATE_IDLE:               aw_state <= AW_STATE_ADDR;
        AW_STATE_ADDR:  if (aw_hs)   aw_state <= AW_STATE_RESP;
        AW_STATE_RESP:  if (b_hs)    aw_state <= AW_STATE_DONE;
        AW_STATE_DONE:               aw_state <= AW_STATE_IDLE;
        default     :                aw_state <= aw_state;
      endcase
    end
  end
end

// ------------ Wirte State Machine (W)--------------
always @(posedge clk or negedge rst_n) begin
  if (~rst_n) begin
    w_state <= W_STATE_IDLE;
  end
  else begin
    if (w_valid) begin
      case (w_state)
        W_STATE_IDLE:               w_state <= W_STATE_WRITE;
        W_STATE_WRITE: if (w_done)  w_state <= W_STATE_RESP;
        W_STATE_RESP:  if (b_hs)    w_state <= W_STATE_DONE;
        W_STATE_DONE:               w_state <= W_STATE_IDLE;
        default     :               w_state <= w_state;
      endcase
    end
  end
end

// ----------------- Read State Machine ----------------
always @(posedge clk or negedge rst_n) begin
  if (~rst_n) begin
    r_state <= R_STATE_IDLE;
  end
  else begin
    if (r_valid) begin
      case (r_state)
        R_STATE_IDLE:               r_state <= R_STATE_ADDR;
        R_STATE_ADDR: if (ar_hs)    r_state <= R_STATE_READ;
        R_STATE_READ: if (r_done)   r_state <= R_STATE_DONE;
        R_STATE_DONE:               r_state <= R_STATE_IDLE;
        default     :               r_state <= r_state;
      endcase
    end
  end
end




// ------------------Write Transaction------------------
// Write address channel signals
wire [AXI_ID_WIDTH-1:0]   axi_id   = {AXI_ID_WIDTH{1'b0}};
wire [AXI_USER_WIDTH-1:0] axi_user = {AXI_USER_WIDTH{1'b0}};
assign axi_aw_id_o      = axi_id;
assign axi_aw_addr_o    = rw_addr_i;
assign axi_aw_len_o     = 8'd0;
assign axi_aw_size_o    = rw_size_i;
assign axi_aw_burst_o   = 2'b0;
assign axi_aw_lock_o    = 1'b0;
assign axi_aw_cache_o   = 'b0;
assign axi_aw_prot_o    = 3'b0;
assign axi_aw_qos_o     = 4'h0;
assign axi_aw_region_o  = 4'h0;
assign axi_aw_user_o    = axi_user;
assign axi_aw_valid_o   = aw_state_addr;

// Write data channel signals
assign axi_w_valid_o    = w_state_write;
assign axi_w_data_o     = rw_wdata_i;
assign axi_w_strb_o     = rw_wmask_i;
assign axi_w_last_o     = w_state_write;
assign axi_w_user_o     = axi_user;

// Write resp channel signals
assign axi_b_ready_o    = aw_state_resp && w_state_resp;


// ------------------Read Transaction------------------
// Read address channel signals
assign axi_ar_valid_o   = r_state_addr;
assign axi_ar_addr_o    = rw_addr_i;
assign axi_ar_prot_o    = 3'b0;
assign axi_ar_id_o      = axi_id;
assign axi_ar_user_o    = axi_user;
assign axi_ar_len_o     = 8'd0;
assign axi_ar_size_o    = rw_size_i;
assign axi_ar_burst_o   = 2'b0;
assign axi_ar_lock_o    = 1'b0;
assign axi_ar_cache_o   = 4'b0;
assign axi_ar_qos_o     = 4'h0;

// Read data channel signals
assign axi_r_ready_o    = r_state_read;


// ------------------User Ports------------------
assign rw_rdata_o = axi_r_data_i;
assign rw_rvalid_o= axi_r_valid_i;

assign rw_ready_o = trans_done;

assign rw_resp_o = 2'b00;


endmodule
