// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Lsu
// Git hash  : 31d2e4fcaa21bb96c876a441fb0fd37d83c0ee76

`timescale 1ns/1ps

module Lsu (
  input               flush,
  input               src_ports_valid,
  output reg          src_ports_ready,
  input      [63:0]   src_ports_payload_src1,
  input      [63:0]   src_ports_payload_src2,
  input      [63:0]   src_ports_payload_imm,
  input               src_ports_payload_micro_op_rd_wen,
  input               src_ports_payload_micro_op_src2_is_imm,
  input      [3:0]    src_ports_payload_micro_op_lsu_ctrl_op,
  input               src_ports_payload_micro_op_lsu_is_load,
  input               src_ports_payload_micro_op_lsu_is_store,
  input               src_ports_payload_rd_wen,
  input      [3:0]    src_ports_payload_rd_rob_ptr,
  output              dst_ports_valid,
  input               dst_ports_ready,
  output     [63:0]   dst_ports_payload_result,
  output              dst_ports_payload_rd_wen,
  output     [3:0]    dst_ports_payload_rd_rob_ptr,
  output              dcache_ports_cmd_valid,
  input               dcache_ports_cmd_ready,
  output     [63:0]   dcache_ports_cmd_payload_addr,
  output              dcache_ports_cmd_payload_wen,
  output     [63:0]   dcache_ports_cmd_payload_wdata,
  output     [7:0]    dcache_ports_cmd_payload_wstrb,
  output     [2:0]    dcache_ports_cmd_payload_size,
  input               dcache_ports_rsp_valid,
  input      [63:0]   dcache_ports_rsp_payload_data,
  input               clk,
  input               resetn
);
  localparam LsuCtrlEnum_IDLE = 4'd0;
  localparam LsuCtrlEnum_LB = 4'd1;
  localparam LsuCtrlEnum_LBU = 4'd2;
  localparam LsuCtrlEnum_LH = 4'd3;
  localparam LsuCtrlEnum_LHU = 4'd4;
  localparam LsuCtrlEnum_LW = 4'd5;
  localparam LsuCtrlEnum_LWU = 4'd6;
  localparam LsuCtrlEnum_LD = 4'd7;
  localparam LsuCtrlEnum_SB = 4'd8;
  localparam LsuCtrlEnum_SH = 4'd9;
  localparam LsuCtrlEnum_SW = 4'd10;
  localparam LsuCtrlEnum_SD = 4'd11;

  wire       [5:0]    tmp_dcache_rdata;
  wire                dcache_ports_stall;
  reg                 src_stream_valid;
  wire                src_stream_ready;
  wire       [63:0]   src_stream_payload_src1;
  wire       [63:0]   src_stream_payload_src2;
  wire       [63:0]   src_stream_payload_imm;
  wire                src_stream_payload_micro_op_rd_wen;
  wire                src_stream_payload_micro_op_src2_is_imm;
  wire       [3:0]    src_stream_payload_micro_op_lsu_ctrl_op;
  wire                src_stream_payload_micro_op_lsu_is_load;
  wire                src_stream_payload_micro_op_lsu_is_store;
  wire                src_stream_payload_rd_wen;
  wire       [3:0]    src_stream_payload_rd_rob_ptr;
  wire                dst_stream_valid;
  wire                dst_stream_ready;
  wire       [63:0]   dst_stream_payload_result;
  wire                dst_stream_payload_rd_wen;
  wire       [3:0]    dst_stream_payload_rd_rob_ptr;
  wire                dcache_cmd_stream_valid;
  reg                 dcache_cmd_stream_ready;
  wire       [63:0]   dcache_cmd_stream_payload_addr;
  wire                dcache_cmd_stream_payload_wen;
  wire       [63:0]   dcache_cmd_stream_payload_wdata;
  wire       [7:0]    dcache_cmd_stream_payload_wstrb;
  wire       [2:0]    dcache_cmd_stream_payload_size;
  wire                lsu_cen;
  wire       [63:0]   lsu_addr;
  wire       [2:0]    lsu_addr_offset;
  wire                lsu_addr_is_timer;
  wire                tmp_lsu_wdata_byte;
  reg        [55:0]   tmp_lsu_wdata_byte_1;
  wire       [63:0]   lsu_wdata_byte;
  wire                tmp_lsu_wdata_half;
  reg        [47:0]   tmp_lsu_wdata_half_1;
  wire       [63:0]   lsu_wdata_half;
  wire                tmp_lsu_wdata_word;
  reg        [31:0]   tmp_lsu_wdata_word_1;
  wire       [63:0]   lsu_wdata_word;
  reg        [63:0]   lsu_rdata;
  wire                dcache_cen;
  wire       [63:0]   dcache_addr;
  reg        [63:0]   dcache_wdata;
  reg        [7:0]    dcache_wstrb;
  reg        [2:0]    dcache_size;
  wire       [63:0]   dcache_rdata;
  wire                tmp_dcache_rdata_lb;
  reg        [55:0]   tmp_dcache_rdata_lb_1;
  wire       [63:0]   dcache_rdata_lb;
  reg        [55:0]   tmp_dcache_rdata_lbu;
  wire       [63:0]   dcache_rdata_lbu;
  wire                tmp_dcache_rdata_lh;
  reg        [47:0]   tmp_dcache_rdata_lh_1;
  wire       [63:0]   dcache_rdata_lh;
  reg        [47:0]   tmp_dcache_rdata_lhu;
  wire       [63:0]   dcache_rdata_lhu;
  wire                tmp_dcache_rdata_lw;
  reg        [31:0]   tmp_dcache_rdata_lw_1;
  wire       [63:0]   dcache_rdata_lw;
  reg        [31:0]   tmp_dcache_rdata_lwu;
  wire       [63:0]   dcache_rdata_lwu;
  reg        [7:0]    tmp_dcache_wstrb;
  reg        [7:0]    tmp_dcache_wstrb_1;
  reg        [7:0]    tmp_dcache_wstrb_2;
  wire       [7:0]    tmp_dcache_wstrb_3;
  wire                dcache_cmd_stream_m2sPipe_valid;
  wire                dcache_cmd_stream_m2sPipe_ready;
  wire       [63:0]   dcache_cmd_stream_m2sPipe_payload_addr;
  wire                dcache_cmd_stream_m2sPipe_payload_wen;
  wire       [63:0]   dcache_cmd_stream_m2sPipe_payload_wdata;
  wire       [7:0]    dcache_cmd_stream_m2sPipe_payload_wstrb;
  wire       [2:0]    dcache_cmd_stream_m2sPipe_payload_size;
  reg                 dcache_cmd_stream_rValid;
  reg        [63:0]   dcache_cmd_stream_rData_addr;
  reg                 dcache_cmd_stream_rData_wen;
  reg        [63:0]   dcache_cmd_stream_rData_wdata;
  reg        [7:0]    dcache_cmd_stream_rData_wstrb;
  reg        [2:0]    dcache_cmd_stream_rData_size;
  `ifndef SYNTHESIS
  reg [31:0] src_ports_payload_micro_op_lsu_ctrl_op_string;
  reg [31:0] src_stream_payload_micro_op_lsu_ctrl_op_string;
  `endif

  function [55:0] zz_tmp_dcache_rdata_lbu(input dummy);
    begin
      zz_tmp_dcache_rdata_lbu[55] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[54] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[53] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[52] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[51] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[50] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[49] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[48] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[47] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[46] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[45] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[44] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[43] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[42] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[41] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[40] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[39] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[38] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[37] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[36] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[35] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[34] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[33] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[32] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lbu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [55:0] tmp_1;
  function [47:0] zz_tmp_dcache_rdata_lhu(input dummy);
    begin
      zz_tmp_dcache_rdata_lhu[47] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[46] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[45] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[44] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[43] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[42] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[41] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[40] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[39] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[38] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[37] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[36] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[35] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[34] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[33] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[32] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lhu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [47:0] tmp_2;
  function [31:0] zz_tmp_dcache_rdata_lwu(input dummy);
    begin
      zz_tmp_dcache_rdata_lwu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_dcache_rdata_lwu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [31:0] tmp_3;
  function [7:0] zz_tmp_dcache_wstrb(input dummy);
    begin
      zz_tmp_dcache_wstrb = 8'h0; // @ BitVector.scala l492
      zz_tmp_dcache_wstrb[0] = 1'b1; // @ Literal.scala l83
    end
  endfunction
  wire [7:0] tmp_4;
  function [7:0] zz_tmp_dcache_wstrb_1(input dummy);
    begin
      zz_tmp_dcache_wstrb_1 = 8'h0; // @ BitVector.scala l492
      zz_tmp_dcache_wstrb_1[1 : 0] = 2'b11; // @ Literal.scala l88
    end
  endfunction
  wire [7:0] tmp_5;
  function [7:0] zz_tmp_dcache_wstrb_2(input dummy);
    begin
      zz_tmp_dcache_wstrb_2 = 8'h0; // @ BitVector.scala l492
      zz_tmp_dcache_wstrb_2[3 : 0] = 4'b1111; // @ Literal.scala l88
    end
  endfunction
  wire [7:0] tmp_6;

  assign tmp_dcache_rdata = ({3'd0,lsu_addr_offset} <<< 3);
  `ifndef SYNTHESIS
  always @(*) begin
    case(src_ports_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_IDLE : src_ports_payload_micro_op_lsu_ctrl_op_string = "IDLE";
      LsuCtrlEnum_LB : src_ports_payload_micro_op_lsu_ctrl_op_string = "LB  ";
      LsuCtrlEnum_LBU : src_ports_payload_micro_op_lsu_ctrl_op_string = "LBU ";
      LsuCtrlEnum_LH : src_ports_payload_micro_op_lsu_ctrl_op_string = "LH  ";
      LsuCtrlEnum_LHU : src_ports_payload_micro_op_lsu_ctrl_op_string = "LHU ";
      LsuCtrlEnum_LW : src_ports_payload_micro_op_lsu_ctrl_op_string = "LW  ";
      LsuCtrlEnum_LWU : src_ports_payload_micro_op_lsu_ctrl_op_string = "LWU ";
      LsuCtrlEnum_LD : src_ports_payload_micro_op_lsu_ctrl_op_string = "LD  ";
      LsuCtrlEnum_SB : src_ports_payload_micro_op_lsu_ctrl_op_string = "SB  ";
      LsuCtrlEnum_SH : src_ports_payload_micro_op_lsu_ctrl_op_string = "SH  ";
      LsuCtrlEnum_SW : src_ports_payload_micro_op_lsu_ctrl_op_string = "SW  ";
      LsuCtrlEnum_SD : src_ports_payload_micro_op_lsu_ctrl_op_string = "SD  ";
      default : src_ports_payload_micro_op_lsu_ctrl_op_string = "????";
    endcase
  end
  always @(*) begin
    case(src_stream_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_IDLE : src_stream_payload_micro_op_lsu_ctrl_op_string = "IDLE";
      LsuCtrlEnum_LB : src_stream_payload_micro_op_lsu_ctrl_op_string = "LB  ";
      LsuCtrlEnum_LBU : src_stream_payload_micro_op_lsu_ctrl_op_string = "LBU ";
      LsuCtrlEnum_LH : src_stream_payload_micro_op_lsu_ctrl_op_string = "LH  ";
      LsuCtrlEnum_LHU : src_stream_payload_micro_op_lsu_ctrl_op_string = "LHU ";
      LsuCtrlEnum_LW : src_stream_payload_micro_op_lsu_ctrl_op_string = "LW  ";
      LsuCtrlEnum_LWU : src_stream_payload_micro_op_lsu_ctrl_op_string = "LWU ";
      LsuCtrlEnum_LD : src_stream_payload_micro_op_lsu_ctrl_op_string = "LD  ";
      LsuCtrlEnum_SB : src_stream_payload_micro_op_lsu_ctrl_op_string = "SB  ";
      LsuCtrlEnum_SH : src_stream_payload_micro_op_lsu_ctrl_op_string = "SH  ";
      LsuCtrlEnum_SW : src_stream_payload_micro_op_lsu_ctrl_op_string = "SW  ";
      LsuCtrlEnum_SD : src_stream_payload_micro_op_lsu_ctrl_op_string = "SD  ";
      default : src_stream_payload_micro_op_lsu_ctrl_op_string = "????";
    endcase
  end
  `endif

  always @(*) begin
    src_stream_valid = src_ports_valid; // @ Stream.scala l294
    if(flush) begin
      src_stream_valid = 1'b0; // @ Stream.scala l439
    end
  end

  always @(*) begin
    src_ports_ready = src_stream_ready; // @ Stream.scala l295
    if(flush) begin
      src_ports_ready = 1'b1; // @ Stream.scala l440
    end
  end

  assign src_stream_payload_src1 = src_ports_payload_src1; // @ Stream.scala l296
  assign src_stream_payload_src2 = src_ports_payload_src2; // @ Stream.scala l296
  assign src_stream_payload_imm = src_ports_payload_imm; // @ Stream.scala l296
  assign src_stream_payload_micro_op_rd_wen = src_ports_payload_micro_op_rd_wen; // @ Stream.scala l296
  assign src_stream_payload_micro_op_src2_is_imm = src_ports_payload_micro_op_src2_is_imm; // @ Stream.scala l296
  assign src_stream_payload_micro_op_lsu_ctrl_op = src_ports_payload_micro_op_lsu_ctrl_op; // @ Stream.scala l296
  assign src_stream_payload_micro_op_lsu_is_load = src_ports_payload_micro_op_lsu_is_load; // @ Stream.scala l296
  assign src_stream_payload_micro_op_lsu_is_store = src_ports_payload_micro_op_lsu_is_store; // @ Stream.scala l296
  assign src_stream_payload_rd_wen = src_ports_payload_rd_wen; // @ Stream.scala l296
  assign src_stream_payload_rd_rob_ptr = src_ports_payload_rd_rob_ptr; // @ Stream.scala l296
  assign lsu_cen = (src_ports_payload_micro_op_lsu_is_load || src_ports_payload_micro_op_lsu_is_store); // @ BaseType.scala l305
  assign lsu_addr = (src_ports_payload_src1 + src_ports_payload_imm); // @ BaseType.scala l299
  assign lsu_addr_offset = lsu_addr[2 : 0]; // @ BaseType.scala l299
  assign lsu_addr_is_timer = ((lsu_addr == 64'h000000000200bff8) || (lsu_addr == 64'h0000000002004000)); // @ BaseType.scala l305
  assign tmp_lsu_wdata_byte = src_ports_payload_src2[7]; // @ BaseType.scala l305
  always @(*) begin
    tmp_lsu_wdata_byte_1[55] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[54] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[53] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[52] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[51] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[50] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[49] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[48] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[47] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[46] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[45] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[44] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[43] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[42] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[41] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[40] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[39] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[38] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[37] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[36] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[35] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[34] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[33] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[32] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[31] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[30] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[29] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[28] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[27] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[26] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[25] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[24] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[23] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[22] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[21] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[20] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[19] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[18] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[17] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[16] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[15] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[14] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[13] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[12] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[11] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[10] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[9] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[8] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[7] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[6] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[5] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[4] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[3] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[2] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[1] = tmp_lsu_wdata_byte; // @ Literal.scala l87
    tmp_lsu_wdata_byte_1[0] = tmp_lsu_wdata_byte; // @ Literal.scala l87
  end

  assign lsu_wdata_byte = {tmp_lsu_wdata_byte_1,src_ports_payload_src2[7 : 0]}; // @ BaseType.scala l299
  assign tmp_lsu_wdata_half = src_ports_payload_src2[15]; // @ BaseType.scala l305
  always @(*) begin
    tmp_lsu_wdata_half_1[47] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[46] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[45] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[44] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[43] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[42] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[41] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[40] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[39] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[38] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[37] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[36] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[35] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[34] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[33] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[32] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[31] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[30] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[29] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[28] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[27] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[26] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[25] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[24] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[23] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[22] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[21] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[20] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[19] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[18] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[17] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[16] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[15] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[14] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[13] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[12] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[11] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[10] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[9] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[8] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[7] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[6] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[5] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[4] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[3] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[2] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[1] = tmp_lsu_wdata_half; // @ Literal.scala l87
    tmp_lsu_wdata_half_1[0] = tmp_lsu_wdata_half; // @ Literal.scala l87
  end

  assign lsu_wdata_half = {tmp_lsu_wdata_half_1,src_ports_payload_src2[15 : 0]}; // @ BaseType.scala l299
  assign tmp_lsu_wdata_word = src_ports_payload_src2[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_lsu_wdata_word_1[31] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[30] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[29] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[28] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[27] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[26] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[25] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[24] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[23] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[22] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[21] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[20] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[19] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[18] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[17] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[16] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[15] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[14] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[13] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[12] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[11] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[10] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[9] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[8] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[7] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[6] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[5] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[4] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[3] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[2] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[1] = tmp_lsu_wdata_word; // @ Literal.scala l87
    tmp_lsu_wdata_word_1[0] = tmp_lsu_wdata_word; // @ Literal.scala l87
  end

  assign lsu_wdata_word = {tmp_lsu_wdata_word_1,src_ports_payload_src2[31 : 0]}; // @ BaseType.scala l299
  assign dcache_cen = ((! lsu_addr_is_timer) && lsu_cen); // @ BaseType.scala l305
  assign dcache_addr = lsu_addr; // @ Data.scala l450
  assign dcache_rdata = (dcache_ports_rsp_payload_data >>> tmp_dcache_rdata); // @ BaseType.scala l299
  assign tmp_dcache_rdata_lb = dcache_rdata[7]; // @ BaseType.scala l305
  always @(*) begin
    tmp_dcache_rdata_lb_1[55] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[54] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[53] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[52] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[51] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[50] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[49] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[48] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[47] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[46] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[45] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[44] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[43] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[42] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[41] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[40] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[39] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[38] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[37] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[36] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[35] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[34] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[33] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[32] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[31] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[30] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[29] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[28] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[27] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[26] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[25] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[24] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[23] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[22] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[21] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[20] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[19] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[18] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[17] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[16] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[15] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[14] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[13] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[12] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[11] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[10] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[9] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[8] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[7] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[6] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[5] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[4] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[3] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[2] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[1] = tmp_dcache_rdata_lb; // @ Literal.scala l87
    tmp_dcache_rdata_lb_1[0] = tmp_dcache_rdata_lb; // @ Literal.scala l87
  end

  assign dcache_rdata_lb = {tmp_dcache_rdata_lb_1,dcache_rdata[7 : 0]}; // @ BaseType.scala l299
  assign tmp_1 = zz_tmp_dcache_rdata_lbu(1'b0);
  always @(*) tmp_dcache_rdata_lbu = tmp_1;
  assign dcache_rdata_lbu = {tmp_dcache_rdata_lbu,dcache_rdata[7 : 0]}; // @ BaseType.scala l299
  assign tmp_dcache_rdata_lh = dcache_rdata[15]; // @ BaseType.scala l305
  always @(*) begin
    tmp_dcache_rdata_lh_1[47] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[46] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[45] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[44] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[43] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[42] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[41] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[40] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[39] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[38] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[37] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[36] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[35] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[34] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[33] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[32] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[31] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[30] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[29] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[28] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[27] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[26] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[25] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[24] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[23] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[22] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[21] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[20] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[19] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[18] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[17] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[16] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[15] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[14] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[13] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[12] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[11] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[10] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[9] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[8] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[7] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[6] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[5] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[4] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[3] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[2] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[1] = tmp_dcache_rdata_lh; // @ Literal.scala l87
    tmp_dcache_rdata_lh_1[0] = tmp_dcache_rdata_lh; // @ Literal.scala l87
  end

  assign dcache_rdata_lh = {tmp_dcache_rdata_lh_1,dcache_rdata[15 : 0]}; // @ BaseType.scala l299
  assign tmp_2 = zz_tmp_dcache_rdata_lhu(1'b0);
  always @(*) tmp_dcache_rdata_lhu = tmp_2;
  assign dcache_rdata_lhu = {tmp_dcache_rdata_lhu,dcache_rdata[15 : 0]}; // @ BaseType.scala l299
  assign tmp_dcache_rdata_lw = dcache_rdata[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_dcache_rdata_lw_1[31] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[30] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[29] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[28] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[27] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[26] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[25] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[24] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[23] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[22] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[21] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[20] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[19] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[18] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[17] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[16] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[15] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[14] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[13] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[12] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[11] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[10] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[9] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[8] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[7] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[6] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[5] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[4] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[3] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[2] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[1] = tmp_dcache_rdata_lw; // @ Literal.scala l87
    tmp_dcache_rdata_lw_1[0] = tmp_dcache_rdata_lw; // @ Literal.scala l87
  end

  assign dcache_rdata_lw = {tmp_dcache_rdata_lw_1,dcache_rdata[31 : 0]}; // @ BaseType.scala l299
  assign tmp_3 = zz_tmp_dcache_rdata_lwu(1'b0);
  always @(*) tmp_dcache_rdata_lwu = tmp_3;
  assign dcache_rdata_lwu = {tmp_dcache_rdata_lwu,dcache_rdata[31 : 0]}; // @ BaseType.scala l299
  always @(*) begin
    case(src_ports_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_LB : begin
        lsu_rdata = dcache_rdata_lb; // @ Lsu.scala l56
      end
      LsuCtrlEnum_LBU : begin
        lsu_rdata = dcache_rdata_lbu; // @ Lsu.scala l60
      end
      LsuCtrlEnum_LH : begin
        lsu_rdata = dcache_rdata_lh; // @ Lsu.scala l64
      end
      LsuCtrlEnum_LHU : begin
        lsu_rdata = dcache_rdata_lhu; // @ Lsu.scala l68
      end
      LsuCtrlEnum_LW : begin
        lsu_rdata = dcache_rdata_lw; // @ Lsu.scala l72
      end
      LsuCtrlEnum_LWU : begin
        lsu_rdata = dcache_rdata_lwu; // @ Lsu.scala l76
      end
      LsuCtrlEnum_LD : begin
        lsu_rdata = dcache_rdata; // @ Lsu.scala l80
      end
      default : begin
        lsu_rdata = 64'h0; // @ Lsu.scala l84
      end
    endcase
  end

  always @(*) begin
    case(src_ports_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_LB : begin
        dcache_size = 3'b000; // @ Lsu.scala l57
      end
      LsuCtrlEnum_LBU : begin
        dcache_size = 3'b000; // @ Lsu.scala l61
      end
      LsuCtrlEnum_LH : begin
        dcache_size = 3'b001; // @ Lsu.scala l65
      end
      LsuCtrlEnum_LHU : begin
        dcache_size = 3'b001; // @ Lsu.scala l69
      end
      LsuCtrlEnum_LW : begin
        dcache_size = 3'b010; // @ Lsu.scala l73
      end
      LsuCtrlEnum_LWU : begin
        dcache_size = 3'b010; // @ Lsu.scala l77
      end
      LsuCtrlEnum_LD : begin
        dcache_size = 3'b011; // @ Lsu.scala l81
      end
      default : begin
        dcache_size = 3'b000; // @ Lsu.scala l85
      end
    endcase
  end

  always @(*) begin
    case(src_ports_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_SB : begin
        dcache_wdata = lsu_wdata_byte; // @ Lsu.scala l91
      end
      LsuCtrlEnum_SH : begin
        dcache_wdata = lsu_wdata_half; // @ Lsu.scala l95
      end
      LsuCtrlEnum_SW : begin
        dcache_wdata = lsu_wdata_word; // @ Lsu.scala l99
      end
      LsuCtrlEnum_SD : begin
        dcache_wdata = src_ports_payload_src2; // @ Lsu.scala l103
      end
      default : begin
        dcache_wdata = 64'h0; // @ Lsu.scala l107
      end
    endcase
  end

  assign tmp_4 = zz_tmp_dcache_wstrb(1'b0);
  always @(*) tmp_dcache_wstrb = tmp_4;
  always @(*) begin
    case(src_ports_payload_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_SB : begin
        dcache_wstrb = tmp_dcache_wstrb; // @ Lsu.scala l92
      end
      LsuCtrlEnum_SH : begin
        dcache_wstrb = tmp_dcache_wstrb_1; // @ Lsu.scala l96
      end
      LsuCtrlEnum_SW : begin
        dcache_wstrb = tmp_dcache_wstrb_2; // @ Lsu.scala l100
      end
      LsuCtrlEnum_SD : begin
        dcache_wstrb = tmp_dcache_wstrb_3; // @ Lsu.scala l104
      end
      default : begin
        dcache_wstrb = 8'h0; // @ Lsu.scala l108
      end
    endcase
  end

  assign tmp_5 = zz_tmp_dcache_wstrb_1(1'b0);
  always @(*) tmp_dcache_wstrb_1 = tmp_5;
  assign tmp_6 = zz_tmp_dcache_wstrb_2(1'b0);
  always @(*) tmp_dcache_wstrb_2 = tmp_6;
  assign tmp_dcache_wstrb_3[7 : 0] = 8'hff; // @ Literal.scala l88
  assign dcache_cmd_stream_valid = src_stream_valid; // @ Lsu.scala l113
  assign dcache_cmd_stream_payload_addr = dcache_addr; // @ Lsu.scala l114
  assign dcache_cmd_stream_payload_wen = src_ports_payload_micro_op_lsu_is_store; // @ Lsu.scala l115
  assign dcache_cmd_stream_payload_wdata = dcache_wdata; // @ Lsu.scala l116
  assign dcache_cmd_stream_payload_wstrb = dcache_wstrb; // @ Lsu.scala l117
  assign dcache_cmd_stream_payload_size = dcache_size; // @ Lsu.scala l118
  always @(*) begin
    dcache_cmd_stream_ready = dcache_cmd_stream_m2sPipe_ready; // @ Stream.scala l367
    if((! dcache_cmd_stream_m2sPipe_valid)) begin
      dcache_cmd_stream_ready = 1'b1; // @ Stream.scala l368
    end
  end

  assign dcache_cmd_stream_m2sPipe_valid = dcache_cmd_stream_rValid; // @ Stream.scala l370
  assign dcache_cmd_stream_m2sPipe_payload_addr = dcache_cmd_stream_rData_addr; // @ Stream.scala l371
  assign dcache_cmd_stream_m2sPipe_payload_wen = dcache_cmd_stream_rData_wen; // @ Stream.scala l371
  assign dcache_cmd_stream_m2sPipe_payload_wdata = dcache_cmd_stream_rData_wdata; // @ Stream.scala l371
  assign dcache_cmd_stream_m2sPipe_payload_wstrb = dcache_cmd_stream_rData_wstrb; // @ Stream.scala l371
  assign dcache_cmd_stream_m2sPipe_payload_size = dcache_cmd_stream_rData_size; // @ Stream.scala l371
  assign dcache_ports_cmd_valid = dcache_cmd_stream_m2sPipe_valid; // @ Stream.scala l294
  assign dcache_cmd_stream_m2sPipe_ready = dcache_ports_cmd_ready; // @ Stream.scala l295
  assign dcache_ports_cmd_payload_addr = dcache_cmd_stream_m2sPipe_payload_addr; // @ Stream.scala l296
  assign dcache_ports_cmd_payload_wen = dcache_cmd_stream_m2sPipe_payload_wen; // @ Stream.scala l296
  assign dcache_ports_cmd_payload_wdata = dcache_cmd_stream_m2sPipe_payload_wdata; // @ Stream.scala l296
  assign dcache_ports_cmd_payload_wstrb = dcache_cmd_stream_m2sPipe_payload_wstrb; // @ Stream.scala l296
  assign dcache_ports_cmd_payload_size = dcache_cmd_stream_m2sPipe_payload_size; // @ Stream.scala l296
  assign src_stream_ready = dcache_cmd_stream_ready; // @ Lsu.scala l122
  assign dst_stream_valid = dcache_ports_rsp_valid; // @ Lsu.scala l123
  assign dst_stream_payload_result = lsu_rdata; // @ Lsu.scala l124
  assign dst_stream_payload_rd_wen = 1'b0; // @ Lsu.scala l125
  assign dst_stream_payload_rd_rob_ptr = 4'b0000; // @ Lsu.scala l126
  assign dst_ports_valid = dst_stream_valid; // @ Stream.scala l294
  assign dst_stream_ready = dst_ports_ready; // @ Stream.scala l295
  assign dst_ports_payload_result = dst_stream_payload_result; // @ Stream.scala l296
  assign dst_ports_payload_rd_wen = dst_stream_payload_rd_wen; // @ Stream.scala l296
  assign dst_ports_payload_rd_rob_ptr = dst_stream_payload_rd_rob_ptr; // @ Stream.scala l296
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      dcache_cmd_stream_rValid <= 1'b0; // @ Data.scala l400
    end else begin
      if(dcache_cmd_stream_ready) begin
        dcache_cmd_stream_rValid <= dcache_cmd_stream_valid; // @ Stream.scala l361
      end
    end
  end

  always @(posedge clk) begin
    if(dcache_cmd_stream_ready) begin
      dcache_cmd_stream_rData_addr <= dcache_cmd_stream_payload_addr; // @ Stream.scala l362
      dcache_cmd_stream_rData_wen <= dcache_cmd_stream_payload_wen; // @ Stream.scala l362
      dcache_cmd_stream_rData_wdata <= dcache_cmd_stream_payload_wdata; // @ Stream.scala l362
      dcache_cmd_stream_rData_wstrb <= dcache_cmd_stream_payload_wstrb; // @ Stream.scala l362
      dcache_cmd_stream_rData_size <= dcache_cmd_stream_payload_size; // @ Stream.scala l362
    end
  end


endmodule
