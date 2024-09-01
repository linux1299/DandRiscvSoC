// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Fetch
// Git hash  : 96e23ba2340787f8407edd1027003c1275008066

`timescale 1ns/1ps

module Fetch (
  input               flush,
  input               stall,
  input               interrupt_vld,
  input      [31:0]   interrupt_pc,
  input               redirect_vld,
  input      [31:0]   redirect_pc,
  output              icache_ports_cmd_valid,
  input               icache_ports_cmd_ready,
  output     [31:0]   icache_ports_cmd_payload_addr,
  input               icache_ports_rsp_valid,
  input      [63:0]   icache_ports_rsp_payload_data,
  output     [31:0]   bpu_predict_pc,
  output              bpu_predict_valid,
  input               bpu_predict_taken,
  input      [31:0]   bpu_target_pc,
  output              dst_ports_valid,
  input               dst_ports_ready,
  output     [31:0]   dst_ports_payload_pc,
  output     [63:0]   dst_ports_payload_instruction,
  input               clk,
  input               resetn
);
  localparam FetchEnum_IDLE = 2'd0;
  localparam FetchEnum_FETCH = 2'd1;
  localparam FetchEnum_HALT = 2'd2;

  wire                pc_stream_fifo_ports_m_ports_valid;
  wire       [31:0]   pc_stream_fifo_ports_m_ports_payload;
  wire                pc_stream_fifo_ports_s_ports_ready;
  wire                instr_stream_fifo_ports_m_ports_valid;
  wire       [63:0]   instr_stream_fifo_ports_m_ports_payload;
  wire                instr_stream_fifo_ports_s_ports_ready;
  reg        [31:0]   pc;
  reg                 fetch_valid;
  reg                 rsp_flush;
  wire                pc_in_stream_valid;
  wire                pc_in_stream_ready;
  wire       [31:0]   pc_in_stream_payload;
  wire                pc_out_stream_valid;
  wire                pc_out_stream_ready;
  wire       [31:0]   pc_out_stream_payload;
  wire                instr_in_stream_valid;
  wire                instr_in_stream_ready;
  wire       [63:0]   instr_in_stream_payload;
  wire                instr_out_stream_valid;
  wire                instr_out_stream_ready;
  wire       [63:0]   instr_out_stream_payload;
  wire                fifo_all_valid;
  reg        [1:0]    fetchFSM_state_next;
  reg        [1:0]    fetchFSM_state_curr;
  wire                dst_ports_isStall;
  wire                icache_ports_cmd_isStall;
  wire                dst_ports_isStall_1;
  wire                dst_ports_isStall_2;
  wire                icache_ports_cmd_fire;
  wire                icache_ports_cmd_fire_1;
  wire                dst_ports_fire;
  wire                dst_ports_fire_1;
  wire                icache_ports_cmd_fire_2;
  `ifndef SYNTHESIS
  reg [39:0] fetchFSM_state_next_string;
  reg [39:0] fetchFSM_state_curr_string;
  `endif


  FIFO pc_stream_fifo (
    .ports_s_ports_valid   (pc_in_stream_valid                        ), //i
    .ports_s_ports_ready   (pc_stream_fifo_ports_s_ports_ready        ), //o
    .ports_s_ports_payload (pc_in_stream_payload[31:0]                ), //i
    .ports_m_ports_valid   (pc_stream_fifo_ports_m_ports_valid        ), //o
    .ports_m_ports_ready   (pc_out_stream_ready                       ), //i
    .ports_m_ports_payload (pc_stream_fifo_ports_m_ports_payload[31:0]), //o
    .flush                 (flush                                     ), //i
    .clk                   (clk                                       ), //i
    .resetn                (resetn                                    )  //i
  );
  FIFO_1 instr_stream_fifo (
    .ports_s_ports_valid   (instr_in_stream_valid                        ), //i
    .ports_s_ports_ready   (instr_stream_fifo_ports_s_ports_ready        ), //o
    .ports_s_ports_payload (instr_in_stream_payload[63:0]                ), //i
    .ports_m_ports_valid   (instr_stream_fifo_ports_m_ports_valid        ), //o
    .ports_m_ports_ready   (instr_out_stream_ready                       ), //i
    .ports_m_ports_payload (instr_stream_fifo_ports_m_ports_payload[63:0]), //o
    .flush                 (flush                                        ), //i
    .clk                   (clk                                          ), //i
    .resetn                (resetn                                       )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fetchFSM_state_next)
      FetchEnum_IDLE : fetchFSM_state_next_string = "IDLE ";
      FetchEnum_FETCH : fetchFSM_state_next_string = "FETCH";
      FetchEnum_HALT : fetchFSM_state_next_string = "HALT ";
      default : fetchFSM_state_next_string = "?????";
    endcase
  end
  always @(*) begin
    case(fetchFSM_state_curr)
      FetchEnum_IDLE : fetchFSM_state_curr_string = "IDLE ";
      FetchEnum_FETCH : fetchFSM_state_curr_string = "FETCH";
      FetchEnum_HALT : fetchFSM_state_curr_string = "HALT ";
      default : fetchFSM_state_curr_string = "?????";
    endcase
  end
  `endif

  assign fifo_all_valid = (pc_out_stream_valid && instr_out_stream_valid); // @ BaseType.scala l305
  assign dst_ports_isStall = (dst_ports_valid && (! dst_ports_ready)); // @ BaseType.scala l305
  always @(*) begin
    case(fetchFSM_state_curr)
      FetchEnum_IDLE : begin
        if((! dst_ports_isStall)) begin
          fetchFSM_state_next = FetchEnum_FETCH; // @ Enum.scala l151
        end else begin
          fetchFSM_state_next = FetchEnum_IDLE; // @ Enum.scala l151
        end
      end
      FetchEnum_FETCH : begin
        if((icache_ports_cmd_isStall || dst_ports_isStall_1)) begin
          fetchFSM_state_next = FetchEnum_HALT; // @ Enum.scala l151
        end else begin
          fetchFSM_state_next = FetchEnum_FETCH; // @ Enum.scala l151
        end
      end
      default : begin
        if((icache_ports_cmd_ready && (! dst_ports_isStall_2))) begin
          fetchFSM_state_next = FetchEnum_FETCH; // @ Enum.scala l151
        end else begin
          fetchFSM_state_next = FetchEnum_HALT; // @ Enum.scala l151
        end
      end
    endcase
  end

  assign icache_ports_cmd_isStall = (icache_ports_cmd_valid && (! icache_ports_cmd_ready)); // @ BaseType.scala l305
  assign dst_ports_isStall_1 = (dst_ports_valid && (! dst_ports_ready)); // @ BaseType.scala l305
  assign dst_ports_isStall_2 = (dst_ports_valid && (! dst_ports_ready)); // @ BaseType.scala l305
  assign icache_ports_cmd_fire = (icache_ports_cmd_valid && icache_ports_cmd_ready); // @ BaseType.scala l305
  assign icache_ports_cmd_fire_1 = (icache_ports_cmd_valid && icache_ports_cmd_ready); // @ BaseType.scala l305
  assign pc_in_stream_valid = icache_ports_cmd_fire_1; // @ Fetch.scala l118
  assign pc_in_stream_payload = pc; // @ Fetch.scala l119
  assign dst_ports_fire = (dst_ports_valid && dst_ports_ready); // @ BaseType.scala l305
  assign pc_out_stream_ready = dst_ports_fire; // @ Fetch.scala l120
  assign pc_in_stream_ready = pc_stream_fifo_ports_s_ports_ready; // @ Fetch.scala l121
  assign pc_out_stream_valid = pc_stream_fifo_ports_m_ports_valid; // @ Fetch.scala l122
  assign pc_out_stream_payload = pc_stream_fifo_ports_m_ports_payload; // @ Fetch.scala l122
  assign instr_in_stream_valid = ((icache_ports_rsp_valid && (! rsp_flush)) && (! flush)); // @ Fetch.scala l125
  assign instr_in_stream_payload = icache_ports_rsp_payload_data; // @ Fetch.scala l126
  assign dst_ports_fire_1 = (dst_ports_valid && dst_ports_ready); // @ BaseType.scala l305
  assign instr_out_stream_ready = dst_ports_fire_1; // @ Fetch.scala l127
  assign instr_in_stream_ready = instr_stream_fifo_ports_s_ports_ready; // @ Fetch.scala l128
  assign instr_out_stream_valid = instr_stream_fifo_ports_m_ports_valid; // @ Fetch.scala l129
  assign instr_out_stream_payload = instr_stream_fifo_ports_m_ports_payload; // @ Fetch.scala l129
  assign dst_ports_payload_pc = pc_out_stream_payload; // @ Fetch.scala l133
  assign dst_ports_payload_instruction = instr_out_stream_payload; // @ Fetch.scala l134
  assign icache_ports_cmd_fire_2 = (icache_ports_cmd_valid && icache_ports_cmd_ready); // @ BaseType.scala l305
  assign bpu_predict_valid = icache_ports_cmd_fire_2; // @ Fetch.scala l135
  assign bpu_predict_pc = pc; // @ Fetch.scala l136
  assign dst_ports_valid = (fifo_all_valid && (! flush)); // @ Fetch.scala l137
  assign icache_ports_cmd_valid = (fetch_valid && (! flush)); // @ Fetch.scala l140
  assign icache_ports_cmd_payload_addr = pc; // @ Fetch.scala l141
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      pc <= 32'h30000000; // @ Data.scala l400
      fetch_valid <= 1'b0; // @ Data.scala l400
      rsp_flush <= 1'b0; // @ Data.scala l400
      fetchFSM_state_curr <= FetchEnum_IDLE; // @ Data.scala l400
    end else begin
      fetchFSM_state_curr <= fetchFSM_state_next; // @ Reg.scala l39
      if((! icache_ports_cmd_ready)) begin
        if(interrupt_vld) begin
          rsp_flush <= 1'b1; // @ Fetch.scala l81
        end else begin
          if(redirect_vld) begin
            rsp_flush <= 1'b1; // @ Fetch.scala l84
          end else begin
            if(bpu_predict_taken) begin
              rsp_flush <= 1'b1; // @ Fetch.scala l87
            end
          end
        end
      end else begin
        if(icache_ports_rsp_valid) begin
          rsp_flush <= 1'b0; // @ Fetch.scala l91
        end
      end
      if((fetchFSM_state_next == FetchEnum_FETCH)) begin
        fetch_valid <= 1'b1; // @ Fetch.scala l96
      end else begin
        fetch_valid <= 1'b0; // @ Fetch.scala l99
      end
      if(interrupt_vld) begin
        pc <= interrupt_pc; // @ Fetch.scala l103
      end else begin
        if(redirect_vld) begin
          pc <= redirect_pc; // @ Fetch.scala l106
        end else begin
          if(bpu_predict_taken) begin
            pc <= bpu_target_pc; // @ Fetch.scala l109
          end else begin
            if(icache_ports_cmd_fire) begin
              pc <= (pc + 32'h00000004); // @ Fetch.scala l112
            end
          end
        end
      end
    end
  end


endmodule

module FIFO_1 (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input      [63:0]   ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output     [63:0]   ports_m_ports_payload,
  input               flush,
  input               clk,
  input               resetn
);

  reg        [63:0]   tmp_ports_m_ports_payload;
  reg        [2:0]    read_ptr;
  reg        [2:0]    write_ptr;
  wire       [1:0]    read_addr;
  wire       [1:0]    next_read_addr;
  wire       [1:0]    write_addr;
  wire                fifo_empty;
  wire                fifo_full;
  reg        [63:0]   fifo_ram_0;
  reg        [63:0]   fifo_ram_1;
  reg        [63:0]   fifo_ram_2;
  reg        [63:0]   fifo_ram_3;
  wire                ports_m_ports_fire;
  wire       [3:0]    tmp_1;
  wire                ports_s_ports_fire;

  always @(*) begin
    case(read_addr)
      2'b00 : tmp_ports_m_ports_payload = fifo_ram_0;
      2'b01 : tmp_ports_m_ports_payload = fifo_ram_1;
      2'b10 : tmp_ports_m_ports_payload = fifo_ram_2;
      default : tmp_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0]; // @ BaseType.scala l299
  assign next_read_addr = (read_addr + 2'b01); // @ BaseType.scala l299
  assign write_addr = write_ptr[1 : 0]; // @ BaseType.scala l299
  assign fifo_empty = (read_ptr == write_ptr); // @ BaseType.scala l305
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2])); // @ BaseType.scala l305
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready); // @ BaseType.scala l305
  assign tmp_1 = ({3'd0,1'b1} <<< write_addr); // @ BaseType.scala l299
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready); // @ BaseType.scala l305
  assign ports_s_ports_ready = (! fifo_full); // @ FIFO.scala l46
  assign ports_m_ports_valid = (! fifo_empty); // @ FIFO.scala l47
  assign ports_m_ports_payload = tmp_ports_m_ports_payload; // @ FIFO.scala l48
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      read_ptr <= 3'b000; // @ Data.scala l400
      write_ptr <= 3'b000; // @ Data.scala l400
    end else begin
      if(flush) begin
        read_ptr <= 3'b000; // @ FIFO.scala l33
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001); // @ FIFO.scala l36
        end
      end
      if(flush) begin
        write_ptr <= 3'b000; // @ FIFO.scala l39
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001); // @ FIFO.scala l42
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(tmp_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
      end
    end
  end


endmodule

module FIFO (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input      [31:0]   ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output     [31:0]   ports_m_ports_payload,
  input               flush,
  input               clk,
  input               resetn
);

  reg        [31:0]   tmp_ports_m_ports_payload;
  reg        [2:0]    read_ptr;
  reg        [2:0]    write_ptr;
  wire       [1:0]    read_addr;
  wire       [1:0]    next_read_addr;
  wire       [1:0]    write_addr;
  wire                fifo_empty;
  wire                fifo_full;
  reg        [31:0]   fifo_ram_0;
  reg        [31:0]   fifo_ram_1;
  reg        [31:0]   fifo_ram_2;
  reg        [31:0]   fifo_ram_3;
  wire                ports_m_ports_fire;
  wire       [3:0]    tmp_1;
  wire                ports_s_ports_fire;

  always @(*) begin
    case(read_addr)
      2'b00 : tmp_ports_m_ports_payload = fifo_ram_0;
      2'b01 : tmp_ports_m_ports_payload = fifo_ram_1;
      2'b10 : tmp_ports_m_ports_payload = fifo_ram_2;
      default : tmp_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0]; // @ BaseType.scala l299
  assign next_read_addr = (read_addr + 2'b01); // @ BaseType.scala l299
  assign write_addr = write_ptr[1 : 0]; // @ BaseType.scala l299
  assign fifo_empty = (read_ptr == write_ptr); // @ BaseType.scala l305
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2])); // @ BaseType.scala l305
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready); // @ BaseType.scala l305
  assign tmp_1 = ({3'd0,1'b1} <<< write_addr); // @ BaseType.scala l299
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready); // @ BaseType.scala l305
  assign ports_s_ports_ready = (! fifo_full); // @ FIFO.scala l46
  assign ports_m_ports_valid = (! fifo_empty); // @ FIFO.scala l47
  assign ports_m_ports_payload = tmp_ports_m_ports_payload; // @ FIFO.scala l48
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      read_ptr <= 3'b000; // @ Data.scala l400
      write_ptr <= 3'b000; // @ Data.scala l400
    end else begin
      if(flush) begin
        read_ptr <= 3'b000; // @ FIFO.scala l33
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001); // @ FIFO.scala l36
        end
      end
      if(flush) begin
        write_ptr <= 3'b000; // @ FIFO.scala l39
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001); // @ FIFO.scala l42
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(tmp_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
        if(tmp_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload; // @ FIFO.scala l43
        end
      end
    end
  end


endmodule
