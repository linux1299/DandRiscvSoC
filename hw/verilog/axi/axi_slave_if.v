module axi_slave_if #(
  //AXI-4
  parameter AXI_DATA_WIDTH      = 64,
  parameter AXI_ADDR_WIDTH      = 64,
  parameter AXI_ID_WIDTH        = 4,
  parameter AXI_STRB_WIDTH      = 8,
  parameter AXI_USER_WIDTH      = 1,

  //Buffer Size
  parameter WRITE_BUFFER_SIZE   = 32,  //KB
  parameter READ_BUFFER_SIZE    = 32   //KB
)
(
  //AXI-4 Slave Signals
  input wire                        clk,
  input wire                        rst_n,

  input wire [AXI_ADDR_WIDTH-1:0]   aw_addr,
  input wire [2:0]                  aw_prot,
  input wire [3:0]                  aw_region,
  input wire [7:0]                  aw_len,
  input wire [2:0]                  aw_size,
  input wire [1:0]                  aw_burst,
  input wire                        aw_lock,
  input wire [3:0]                  aw_cache,
  input wire [3:0]                  aw_qos,
  input wire [AXI_ID_WIDTH-1:0]     aw_id,
  input wire [AXI_USER_WIDTH-1:0]   aw_user,
  output wire                       aw_ready,
  input wire                        aw_valid,

  input wire [AXI_ADDR_WIDTH-1:0]   ar_addr,
  input wire [2:0]                  ar_prot,
  input wire [3:0]                  ar_region,
  input wire [7:0]                  ar_len,
  input wire [2:0]                  ar_size,
  input wire [1:0]                  ar_burst,
  input wire                        ar_lock,
  input wire [3:0]                  ar_cache,
  input wire [3:0]                  ar_qos,
  input wire [AXI_ID_WIDTH-1:0]     ar_id,
  input wire [AXI_USER_WIDTH-1:0]   ar_user,
  output wire                       ar_ready,
  input wire                        ar_valid,

  input wire                        w_valid,
  input wire [AXI_DATA_WIDTH-1:0]   w_data,
  input wire [AXI_STRB_WIDTH-1:0]   w_strb,
  input wire [AXI_USER_WIDTH-1:0]   w_user,
  input wire                        w_last,
  output wire                       w_ready,

  output wire [AXI_DATA_WIDTH-1:0]  r_data,
  output wire [1:0]                 r_resp,
  output wire                       r_last,
  output wire [AXI_ID_WIDTH-1:0]    r_id,
  output wire [AXI_USER_WIDTH-1:0]  r_user,
  input wire                        r_ready,
  output wire                       r_valid,

  output wire [1:0]                 b_resp,
  output wire [AXI_ID_WIDTH-1:0]    b_id,
  output wire [AXI_USER_WIDTH-1:0]  b_user,
  input wire                        b_ready,
  output wire                       b_valid
);

  //AXI4 signals
  reg [AXI_ADDR_WIDTH-1:0] sig_aw_addr;
  reg                      sig_aw_ready;
  reg [1:0]                sig_aw_burst;
  reg [7:0]                sig_aw_len;
  reg                      sig_w_ready;
  reg [1:0]                sig_b_resp;
  reg [AXI_USER_WIDTH-1:0] sig_b_user;
  reg                      sig_b_valid;
  reg [AXI_ADDR_WIDTH-1:0] sig_ar_addr;
  reg                      sig_ar_ready;
  reg [1:0]                sig_ar_burst;
  reg [7:0]                sig_ar_len;
  reg [AXI_DATA_WIDTH-1:0] sig_r_data;
  reg [1:0]                sig_r_resp;
  reg                      sig_r_last;
  reg [AXI_USER_WIDTH-1:0] sig_r_user;
  reg                      sig_r_valid;

  wire aw_wrap_en, ar_wrap_en;  //determines wrap boundary and enables wrapping
  wire [31:0] aw_wrap_size, ar_wrap_size; //the size of write/read transfer
  reg axi_awv_awr_flag, axi_arv_arr_flag; //marks the presence of write/read address valid
  reg [7:0] aw_len_cntr, ar_len_cntr; //to keep track of beats in a burst transaction

  // I/O Connections assignments
  assign aw_ready = sig_aw_ready;
  assign w_ready  = sig_w_ready;
  assign b_resp   = sig_b_resp;
  assign b_user   = sig_b_user;
  assign b_valid  = sig_b_valid;
  assign ar_ready = sig_ar_ready;
  //assign r_data   = sig_r_data;
  assign r_resp   = sig_r_resp;
  assign r_last   = sig_r_last;
  assign r_user   = sig_r_user;
  assign r_valid  = sig_r_valid;
  assign b_id     = aw_id;
  assign r_id     = ar_id;
  //could be optimized
  assign aw_wrap_size = (AXI_DATA_WIDTH/8 * (aw_len));
  assign ar_wrap_size = (AXI_DATA_WIDTH/8 * (ar_len));
  assign aw_wrap_en   = ((sig_aw_addr & aw_wrap_size) == aw_wrap_size) ? 1'b1 : 1'b0;
  assign ar_wrap_en   = ((sig_ar_addr & ar_wrap_size) == ar_wrap_size) ? 1'b1 : 1'b0;

  //function for calculating log2
  function integer clogb2 (input integer depth);
    begin
      depth = depth - 1;
      for (clogb2=0; depth>0; clogb2=clogb2+1)
        depth = depth >>1;
      end
  endfunction

  localparam integer ADDR_LSB = clogb2(AXI_DATA_WIDTH/8); // 3
  localparam integer AXI_WR_ADDR_BITS = clogb2(WRITE_BUFFER_SIZE) + 7; // 32KB = 2^12*64bit
  localparam integer AXI_RD_ADDR_BITS = clogb2(READ_BUFFER_SIZE) + 7;

  //Implement aw_ready generation
  //aw_ready is asserted for one clk clock cycle when both
  //aw_valid and w_valid are asserted.
  //aw_ready is de-asserted when reset is low.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_aw_ready <= 1'b0;
      axi_awv_awr_flag <= 1'b0;
    end else begin
      if (~sig_aw_ready && aw_valid && ~axi_awv_awr_flag && ~axi_arv_arr_flag) begin
        sig_aw_ready <= 1'b1;
        axi_awv_awr_flag <= 1'b1;
      end else if (w_last && sig_w_ready) begin
        axi_awv_awr_flag <= 1'b0;
      end else begin
        sig_aw_ready <= 1'b0;
      end
    end
  end

  //Implement aw_addr latching
  //This process is used to latch the address when both
  //aw_valid and  w_valid are valid.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_aw_addr <= 0;
      aw_len_cntr <= 0;
      sig_aw_burst <= 0;
      sig_aw_len <= 0;
    end else begin
      if (~sig_aw_ready && aw_valid && ~axi_awv_awr_flag) begin
        sig_aw_addr <= aw_addr[AXI_ADDR_WIDTH-1:0];
        sig_aw_burst <= aw_burst;
        sig_aw_len <= aw_len;
        aw_len_cntr <= 0;
      end else if ((aw_len_cntr <= sig_aw_len) && sig_w_ready && w_valid) begin
        aw_len_cntr <= aw_len_cntr + 1;
        case (sig_aw_burst)
          2'b00:  //fixed burst
            begin
              sig_aw_addr <= sig_aw_addr;
            end
          2'b01:  //incremental burst
            begin
              sig_aw_addr[AXI_ADDR_WIDTH-1:ADDR_LSB]  <= sig_aw_addr[AXI_ADDR_WIDTH-1:ADDR_LSB];
              sig_aw_addr[ADDR_LSB-1:0] <= {ADDR_LSB{1'b0}};
            end
          2'b10:  //wrapping burst
            begin
              if (aw_wrap_en) begin
                sig_aw_addr <= (sig_aw_addr - aw_wrap_size);
              end else begin
                sig_aw_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] <= sig_aw_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] + 1;
                sig_aw_addr[ADDR_LSB-1:0] <= {ADDR_LSB{1'b0}};
              end
            end
          default:  //reserved
           begin
             sig_aw_addr <= sig_aw_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] + 1;
           end
        endcase
      end
    end
  end

  //Implement w_ready generation
  //w_ready is asserted for one clk clock cycle when both
  //aw_valid and w_valid are asserted.
  //w_ready is de-asserted when reset is low.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_w_ready <= 1'b0;
    end else begin
      if (~sig_w_ready && w_valid && axi_awv_awr_flag) begin
        sig_w_ready <= 1'b1;
      end else if (w_last && sig_w_ready) begin
        sig_w_ready <= 1'b0;
      end
    end
  end

  //Implement write response logic generation
  //The write response and response valid signals are
  //asserted by the slave.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_b_valid <= 0;
      sig_b_resp <= 2'b0;
      sig_b_user <= 0;
    end else begin
      if (axi_awv_awr_flag && sig_w_ready && w_valid && ~sig_b_valid && w_last) begin
        sig_b_valid <= 1'b1;
        sig_b_resp <= 2'b0;
      end else begin
        if(b_ready && sig_b_valid) begin
          sig_b_valid <= 1'b0;
        end
      end
    end
  end

  //Implement ar_ready generation
  //ar_ready is asserted for one clk clock cycle when
  //ar_valid is asserted.
  //The read address is also latched when ar_valid is
  //asserted. ar_addr is reset to zero on reset assertion.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_ar_ready <= 1'b0;
      axi_arv_arr_flag <= 1'b0;
    end else begin
      if (~sig_ar_ready && ar_valid && ~axi_awv_awr_flag && ~axi_arv_arr_flag) begin
        sig_ar_ready <= 1'b1;
        axi_arv_arr_flag <= 1'b1;
      end else if (sig_r_valid && r_ready && ar_len_cntr == sig_ar_len) begin
        axi_arv_arr_flag <= 1'b0;
      end else begin
        sig_ar_ready <= 1'b0;
      end
    end
  end

  //Implement ar_addr latching
  //This process is used to latch the address when both
  //ar_vaild and r_valid are valid.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_ar_addr <= 0;
      ar_len_cntr <= 0;
      sig_ar_burst <= 0;
      sig_ar_len <= 0;
      sig_r_last <= 1'b0;
      sig_r_user <= 0;
    end else begin
      if (~sig_ar_ready && ar_valid && ~axi_arv_arr_flag) begin
        sig_ar_addr <= ar_addr[AXI_ADDR_WIDTH-1:0];
        sig_ar_burst <= ar_burst;
        sig_ar_len <= ar_len;
        ar_len_cntr <= 0;
        sig_r_last <= 1'b0;
        sig_r_user <= 0;
      end else begin
        if (sig_ar_ready && ar_valid && ~axi_arv_arr_flag) begin
          sig_ar_addr <= ar_addr[AXI_ADDR_WIDTH-1:0];
          sig_ar_burst <= ar_burst;
          sig_ar_len <= ar_len;
          ar_len_cntr <= 0;
          sig_r_last <= 1'b0;
        end else if ((ar_len_cntr <= sig_ar_len) && sig_r_valid && r_ready) begin
          ar_len_cntr <= ar_len_cntr + 1;
          sig_r_last <= 1'b0;
          case (sig_ar_burst)
            2'b00:  //fixed burst
             begin
               sig_ar_addr <= sig_ar_addr;
             end
            2'b01:  //incremental burst
              begin
                sig_ar_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] <= sig_ar_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] + 1;
                sig_ar_addr[ADDR_LSB-1:0] <= {ADDR_LSB{1'b0}};
              end
            2'b10:  //Wrapping burst
              begin
                if (ar_wrap_en) begin
                  sig_ar_addr <= (sig_ar_addr - ar_wrap_size);
                end else begin
                  sig_ar_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] <= sig_ar_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] + 1;
                  sig_ar_addr[ADDR_LSB-1:0] <= {ADDR_LSB{1'b0}};
                end
              end
            default:  //reserved
              begin
                sig_ar_addr <= sig_ar_addr[AXI_ADDR_WIDTH-1:ADDR_LSB] + 1;
              end
          endcase
        end else if ((ar_len_cntr == sig_ar_len) && ~sig_r_last && axi_arv_arr_flag) begin
          sig_r_last <= 1'b1;
        end else if (r_ready) begin
          sig_r_last <= 1'b0;
        end
      end
    end
  end

  //Implement r_valid generation
  //r_valid is asserted for one clk clock cycle when both
  //ar_valid and ar_ready are asserted.

  always @ (posedge clk) begin
    if (rst_n == 1'b0) begin
      sig_r_valid <= 0;
      sig_r_resp <= 0;
    end else begin
      if (axi_arv_arr_flag && ~sig_r_valid) begin
        sig_r_valid <= 1'b1;
        sig_r_resp <= 2'b0;
      end else if (sig_r_valid && r_ready) begin
        sig_r_valid <= 1'b0;
      end
    end
  end

  //W/R Buffer Interface Signals
  wire [AXI_WR_ADDR_BITS-1:0] axi_mem_wraddr;
  wire [AXI_RD_ADDR_BITS-1:0] axi_mem_rdaddr;
  wire                        axi_mem_rden;
  wire                        axi_mem_wren;
  wire [7:0]                  axi_mem_wmask;

  //Buffer Interface Singals Generation
  assign axi_mem_wraddr = sig_aw_addr[AXI_WR_ADDR_BITS+ADDR_LSB-1:ADDR_LSB];
  assign axi_mem_rdaddr = sig_ar_addr[AXI_RD_ADDR_BITS+ADDR_LSB-1:ADDR_LSB];
  assign axi_mem_wren   = sig_w_ready && w_valid;
  assign axi_mem_rden   = axi_arv_arr_flag;
  assign axi_mem_wmask  = w_strb;

  ram u_ram(
    .clk  (clk),
    .rst_n(rst_n),

    .wr_data(w_data),
    .wr_addr(axi_mem_wraddr),
    .wr_en(axi_mem_wren),
    .wr_mask(axi_mem_wmask),

    .rd_addr(axi_mem_rdaddr),
    .rd_data(r_data)

  );

endmodule