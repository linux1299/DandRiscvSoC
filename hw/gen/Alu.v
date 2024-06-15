// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Alu
// Git hash  : b42fa440e7a1abbd51dbed7262b08265330ea2ed

`timescale 1ns/1ps

module Alu (
  input               flush,
  input               stall,
  input               src_ports_valid,
  output              src_ports_ready,
  input      [63:0]   src_ports_payload_src1,
  input      [63:0]   src_ports_payload_src2,
  input               src_ports_payload_micro_op_rd_wen,
  input               src_ports_payload_micro_op_src2_is_imm,
  input      [4:0]    src_ports_payload_micro_op_alu_ctrl_op,
  input               src_ports_payload_micro_op_alu_is_word,
  input               src_ports_payload_rd_wen,
  input      [3:0]    src_ports_payload_rd_rob_ptr,
  output              dst_ports_valid,
  input               dst_ports_ready,
  output     [63:0]   dst_ports_payload_result,
  output              dst_ports_payload_rd_wen,
  output     [3:0]    dst_ports_payload_rd_rob_ptr,
  input               resetn,
  input               clk
);
  localparam AluCtrlEnum_IDLE = 5'd0;
  localparam AluCtrlEnum_ADD = 5'd1;
  localparam AluCtrlEnum_SUB = 5'd2;
  localparam AluCtrlEnum_SLT = 5'd3;
  localparam AluCtrlEnum_SLTU = 5'd4;
  localparam AluCtrlEnum_XOR_1 = 5'd5;
  localparam AluCtrlEnum_SLL_1 = 5'd6;
  localparam AluCtrlEnum_SRL_1 = 5'd7;
  localparam AluCtrlEnum_SRA_1 = 5'd8;
  localparam AluCtrlEnum_AND_1 = 5'd9;
  localparam AluCtrlEnum_OR_1 = 5'd10;
  localparam AluCtrlEnum_LUI = 5'd11;
  localparam AluCtrlEnum_MUL = 5'd12;
  localparam AluCtrlEnum_MULH = 5'd13;
  localparam AluCtrlEnum_MULHSU = 5'd14;
  localparam AluCtrlEnum_MULHU = 5'd15;
  localparam AluCtrlEnum_DIV = 5'd16;
  localparam AluCtrlEnum_DIVU = 5'd17;
  localparam AluCtrlEnum_REM_1 = 5'd18;
  localparam AluCtrlEnum_REMU = 5'd19;
  localparam AluCtrlEnum_MULW = 5'd20;
  localparam AluCtrlEnum_DIVW = 5'd21;
  localparam AluCtrlEnum_DIVUW = 5'd22;
  localparam AluCtrlEnum_REMW = 5'd23;
  localparam AluCtrlEnum_REMUW = 5'd24;

  wire                mul_io_src1_is_signed;
  wire                mul_io_src2_is_signed;
  wire                div_1_io_op_is_signed;
  wire       [63:0]   mul_io_result_high;
  wire       [63:0]   mul_io_result_low;
  wire                div_1_io_busy;
  wire                div_1_io_done_valid;
  wire       [63:0]   div_1_io_quotient;
  wire       [63:0]   div_1_io_remainder;
  wire       [63:0]   tmp_add_result;
  wire       [63:0]   tmp_add_result_1;
  wire       [63:0]   tmp_sub_result;
  wire       [63:0]   tmp_sub_result_1;
  wire       [63:0]   tmp_slt_result;
  wire       [63:0]   tmp_slt_result_1;
  wire       [63:0]   tmp_sra_result;
  wire       [31:0]   tmp_addw_result_2;
  wire       [31:0]   tmp_subw_result_2;
  wire       [31:0]   tmp_sraw_temp;
  wire       [31:0]   src1_word;
  wire       [31:0]   src2_word;
  wire       [5:0]    shift_bits;
  wire       [63:0]   add_result;
  wire       [63:0]   sub_result;
  wire                slt_result;
  wire                sltu_result;
  wire       [63:0]   xor_result;
  wire       [63:0]   sll_result;
  wire       [63:0]   srl_result;
  wire       [63:0]   sra_result;
  wire       [63:0]   and_result;
  wire       [63:0]   or_result;
  wire                tmp_addw_result;
  reg        [31:0]   tmp_addw_result_1;
  wire       [63:0]   addw_result;
  wire                tmp_subw_result;
  reg        [31:0]   tmp_subw_result_1;
  wire       [63:0]   subw_result;
  wire       [31:0]   sllw_temp;
  wire                tmp_sllw_result;
  reg        [31:0]   tmp_sllw_result_1;
  wire       [63:0]   sllw_result;
  wire       [31:0]   srlw_temp;
  wire                tmp_srlw_result;
  reg        [31:0]   tmp_srlw_result_1;
  wire       [63:0]   srlw_result;
  wire       [31:0]   sraw_temp;
  wire                tmp_sraw_result;
  reg        [31:0]   tmp_sraw_result_1;
  wire       [63:0]   sraw_result;
  reg        [63:0]   alu_result;
  wire                alu_is_mul;
  wire                alu_is_quo;
  wire                alu_is_rem;
  wire                alu_is_div;
  wire                tmp_src_ports_ready;
  reg                 tmp_src_ports_ready_1;
  wire       [4:0]    tmp_src_stream_payload_micro_op_alu_ctrl_op;
  reg                 src_stream_valid;
  wire                src_stream_ready;
  wire       [63:0]   src_stream_payload_src1;
  wire       [63:0]   src_stream_payload_src2;
  wire                src_stream_payload_micro_op_rd_wen;
  wire                src_stream_payload_micro_op_src2_is_imm;
  wire       [4:0]    src_stream_payload_micro_op_alu_ctrl_op;
  wire                src_stream_payload_micro_op_alu_is_word;
  wire                src_stream_payload_rd_wen;
  wire       [3:0]    src_stream_payload_rd_rob_ptr;
  wire                dst_stream_valid;
  reg                 dst_stream_ready;
  wire       [63:0]   dst_stream_payload_result;
  wire                dst_stream_payload_rd_wen;
  wire       [3:0]    dst_stream_payload_rd_rob_ptr;
  wire       [62:0]   tmp_alu_result;
  wire       [62:0]   tmp_alu_result_1;
  wire       [63:0]   mul_result;
  wire                tmp_mul_result;
  reg        [31:0]   tmp_mul_result_1;
  wire                src_stream_fire;
  wire                dst_stream_m2sPipe_valid;
  wire                dst_stream_m2sPipe_ready;
  wire       [63:0]   dst_stream_m2sPipe_payload_result;
  wire                dst_stream_m2sPipe_payload_rd_wen;
  wire       [3:0]    dst_stream_m2sPipe_payload_rd_rob_ptr;
  reg                 dst_stream_rValid;
  reg        [63:0]   dst_stream_rData_result;
  reg                 dst_stream_rData_rd_wen;
  reg        [3:0]    dst_stream_rData_rd_rob_ptr;
  `ifndef SYNTHESIS
  reg [47:0] src_ports_payload_micro_op_alu_ctrl_op_string;
  reg [47:0] tmp_src_stream_payload_micro_op_alu_ctrl_op_string;
  reg [47:0] src_stream_payload_micro_op_alu_ctrl_op_string;
  `endif


  assign tmp_add_result = src_ports_payload_src1;
  assign tmp_add_result_1 = src_ports_payload_src2;
  assign tmp_sub_result = src_ports_payload_src1;
  assign tmp_sub_result_1 = src_ports_payload_src2;
  assign tmp_slt_result = src_ports_payload_src1;
  assign tmp_slt_result_1 = src_ports_payload_src2;
  assign tmp_sra_result = src_ports_payload_src1;
  assign tmp_addw_result_2 = add_result[31 : 0];
  assign tmp_subw_result_2 = sub_result[31 : 0];
  assign tmp_sraw_temp = src1_word;
  Multiplier mul (
    .io_op_is_word     (src_ports_payload_micro_op_alu_is_word), //i
    .io_src1_is_signed (mul_io_src1_is_signed                 ), //i
    .io_src2_is_signed (mul_io_src2_is_signed                 ), //i
    .io_src1           (src_ports_payload_src1[63:0]          ), //i
    .io_src2           (src_ports_payload_src2[63:0]          ), //i
    .io_result_high    (mul_io_result_high[63:0]              ), //o
    .io_result_low     (mul_io_result_low[63:0]               )  //o
  );
  Divider div_1 (
    .io_flush        (flush                                 ), //i
    .io_start        (src_stream_fire                       ), //i
    .io_busy         (div_1_io_busy                         ), //o
    .io_done_valid   (div_1_io_done_valid                   ), //o
    .io_done_ready   (dst_stream_ready                      ), //i
    .io_op_is_word   (src_ports_payload_micro_op_alu_is_word), //i
    .io_op_is_signed (div_1_io_op_is_signed                 ), //i
    .io_dividend     (src_ports_payload_src1[63:0]          ), //i
    .io_divisor      (src_ports_payload_src2[63:0]          ), //i
    .io_quotient     (div_1_io_quotient[63:0]               ), //o
    .io_remainder    (div_1_io_remainder[63:0]              ), //o
    .resetn          (resetn                                ), //i
    .clk             (clk                                   )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(src_ports_payload_micro_op_alu_ctrl_op)
      AluCtrlEnum_IDLE : src_ports_payload_micro_op_alu_ctrl_op_string = "IDLE  ";
      AluCtrlEnum_ADD : src_ports_payload_micro_op_alu_ctrl_op_string = "ADD   ";
      AluCtrlEnum_SUB : src_ports_payload_micro_op_alu_ctrl_op_string = "SUB   ";
      AluCtrlEnum_SLT : src_ports_payload_micro_op_alu_ctrl_op_string = "SLT   ";
      AluCtrlEnum_SLTU : src_ports_payload_micro_op_alu_ctrl_op_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "AND_1 ";
      AluCtrlEnum_OR_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "OR_1  ";
      AluCtrlEnum_LUI : src_ports_payload_micro_op_alu_ctrl_op_string = "LUI   ";
      AluCtrlEnum_MUL : src_ports_payload_micro_op_alu_ctrl_op_string = "MUL   ";
      AluCtrlEnum_MULH : src_ports_payload_micro_op_alu_ctrl_op_string = "MULH  ";
      AluCtrlEnum_MULHSU : src_ports_payload_micro_op_alu_ctrl_op_string = "MULHSU";
      AluCtrlEnum_MULHU : src_ports_payload_micro_op_alu_ctrl_op_string = "MULHU ";
      AluCtrlEnum_DIV : src_ports_payload_micro_op_alu_ctrl_op_string = "DIV   ";
      AluCtrlEnum_DIVU : src_ports_payload_micro_op_alu_ctrl_op_string = "DIVU  ";
      AluCtrlEnum_REM_1 : src_ports_payload_micro_op_alu_ctrl_op_string = "REM_1 ";
      AluCtrlEnum_REMU : src_ports_payload_micro_op_alu_ctrl_op_string = "REMU  ";
      AluCtrlEnum_MULW : src_ports_payload_micro_op_alu_ctrl_op_string = "MULW  ";
      AluCtrlEnum_DIVW : src_ports_payload_micro_op_alu_ctrl_op_string = "DIVW  ";
      AluCtrlEnum_DIVUW : src_ports_payload_micro_op_alu_ctrl_op_string = "DIVUW ";
      AluCtrlEnum_REMW : src_ports_payload_micro_op_alu_ctrl_op_string = "REMW  ";
      AluCtrlEnum_REMUW : src_ports_payload_micro_op_alu_ctrl_op_string = "REMUW ";
      default : src_ports_payload_micro_op_alu_ctrl_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_src_stream_payload_micro_op_alu_ctrl_op)
      AluCtrlEnum_IDLE : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "REMUW ";
      default : tmp_src_stream_payload_micro_op_alu_ctrl_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(src_stream_payload_micro_op_alu_ctrl_op)
      AluCtrlEnum_IDLE : src_stream_payload_micro_op_alu_ctrl_op_string = "IDLE  ";
      AluCtrlEnum_ADD : src_stream_payload_micro_op_alu_ctrl_op_string = "ADD   ";
      AluCtrlEnum_SUB : src_stream_payload_micro_op_alu_ctrl_op_string = "SUB   ";
      AluCtrlEnum_SLT : src_stream_payload_micro_op_alu_ctrl_op_string = "SLT   ";
      AluCtrlEnum_SLTU : src_stream_payload_micro_op_alu_ctrl_op_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "AND_1 ";
      AluCtrlEnum_OR_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "OR_1  ";
      AluCtrlEnum_LUI : src_stream_payload_micro_op_alu_ctrl_op_string = "LUI   ";
      AluCtrlEnum_MUL : src_stream_payload_micro_op_alu_ctrl_op_string = "MUL   ";
      AluCtrlEnum_MULH : src_stream_payload_micro_op_alu_ctrl_op_string = "MULH  ";
      AluCtrlEnum_MULHSU : src_stream_payload_micro_op_alu_ctrl_op_string = "MULHSU";
      AluCtrlEnum_MULHU : src_stream_payload_micro_op_alu_ctrl_op_string = "MULHU ";
      AluCtrlEnum_DIV : src_stream_payload_micro_op_alu_ctrl_op_string = "DIV   ";
      AluCtrlEnum_DIVU : src_stream_payload_micro_op_alu_ctrl_op_string = "DIVU  ";
      AluCtrlEnum_REM_1 : src_stream_payload_micro_op_alu_ctrl_op_string = "REM_1 ";
      AluCtrlEnum_REMU : src_stream_payload_micro_op_alu_ctrl_op_string = "REMU  ";
      AluCtrlEnum_MULW : src_stream_payload_micro_op_alu_ctrl_op_string = "MULW  ";
      AluCtrlEnum_DIVW : src_stream_payload_micro_op_alu_ctrl_op_string = "DIVW  ";
      AluCtrlEnum_DIVUW : src_stream_payload_micro_op_alu_ctrl_op_string = "DIVUW ";
      AluCtrlEnum_REMW : src_stream_payload_micro_op_alu_ctrl_op_string = "REMW  ";
      AluCtrlEnum_REMUW : src_stream_payload_micro_op_alu_ctrl_op_string = "REMUW ";
      default : src_stream_payload_micro_op_alu_ctrl_op_string = "??????";
    endcase
  end
  `endif

  assign src1_word = src_ports_payload_src1[31 : 0]; // @ BaseType.scala l299
  assign src2_word = src_ports_payload_src2[31 : 0]; // @ BaseType.scala l299
  assign shift_bits = src_ports_payload_src2[5 : 0]; // @ BaseType.scala l318
  assign add_result = ($signed(tmp_add_result) + $signed(tmp_add_result_1)); // @ BaseType.scala l299
  assign sub_result = ($signed(tmp_sub_result) - $signed(tmp_sub_result_1)); // @ BaseType.scala l299
  assign slt_result = ($signed(tmp_slt_result) < $signed(tmp_slt_result_1)); // @ BaseType.scala l305
  assign sltu_result = (src_ports_payload_src1 < src_ports_payload_src2); // @ BaseType.scala l305
  assign xor_result = (src_ports_payload_src1 ^ src_ports_payload_src2); // @ BaseType.scala l299
  assign sll_result = (src_ports_payload_src1 <<< shift_bits); // @ BaseType.scala l299
  assign srl_result = (src_ports_payload_src1 >>> shift_bits); // @ BaseType.scala l299
  assign sra_result = ($signed(tmp_sra_result) >>> shift_bits); // @ BaseType.scala l299
  assign and_result = (src_ports_payload_src1 & src_ports_payload_src2); // @ BaseType.scala l299
  assign or_result = (src_ports_payload_src1 | src_ports_payload_src2); // @ BaseType.scala l299
  assign tmp_addw_result = add_result[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_addw_result_1[31] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[30] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[29] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[28] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[27] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[26] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[25] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[24] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[23] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[22] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[21] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[20] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[19] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[18] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[17] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[16] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[15] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[14] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[13] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[12] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[11] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[10] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[9] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[8] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[7] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[6] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[5] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[4] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[3] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[2] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[1] = tmp_addw_result; // @ Literal.scala l87
    tmp_addw_result_1[0] = tmp_addw_result; // @ Literal.scala l87
  end

  assign addw_result = {tmp_addw_result_1,tmp_addw_result_2}; // @ BaseType.scala l299
  assign tmp_subw_result = sub_result[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_subw_result_1[31] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[30] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[29] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[28] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[27] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[26] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[25] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[24] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[23] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[22] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[21] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[20] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[19] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[18] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[17] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[16] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[15] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[14] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[13] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[12] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[11] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[10] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[9] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[8] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[7] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[6] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[5] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[4] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[3] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[2] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[1] = tmp_subw_result; // @ Literal.scala l87
    tmp_subw_result_1[0] = tmp_subw_result; // @ Literal.scala l87
  end

  assign subw_result = {tmp_subw_result_1,tmp_subw_result_2}; // @ BaseType.scala l299
  assign sllw_temp = (src1_word <<< shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_sllw_result = sllw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_sllw_result_1[31] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[30] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[29] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[28] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[27] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[26] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[25] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[24] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[23] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[22] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[21] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[20] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[19] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[18] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[17] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[16] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[15] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[14] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[13] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[12] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[11] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[10] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[9] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[8] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[7] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[6] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[5] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[4] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[3] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[2] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[1] = tmp_sllw_result; // @ Literal.scala l87
    tmp_sllw_result_1[0] = tmp_sllw_result; // @ Literal.scala l87
  end

  assign sllw_result = {tmp_sllw_result_1,sllw_temp}; // @ BaseType.scala l299
  assign srlw_temp = (src1_word >>> shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_srlw_result = srlw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_srlw_result_1[31] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[30] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[29] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[28] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[27] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[26] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[25] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[24] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[23] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[22] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[21] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[20] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[19] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[18] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[17] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[16] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[15] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[14] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[13] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[12] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[11] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[10] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[9] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[8] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[7] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[6] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[5] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[4] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[3] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[2] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[1] = tmp_srlw_result; // @ Literal.scala l87
    tmp_srlw_result_1[0] = tmp_srlw_result; // @ Literal.scala l87
  end

  assign srlw_result = {tmp_srlw_result_1,srlw_temp}; // @ BaseType.scala l299
  assign sraw_temp = ($signed(tmp_sraw_temp) >>> shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_sraw_result = sraw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_sraw_result_1[31] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[30] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[29] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[28] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[27] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[26] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[25] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[24] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[23] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[22] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[21] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[20] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[19] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[18] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[17] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[16] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[15] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[14] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[13] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[12] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[11] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[10] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[9] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[8] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[7] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[6] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[5] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[4] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[3] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[2] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[1] = tmp_sraw_result; // @ Literal.scala l87
    tmp_sraw_result_1[0] = tmp_sraw_result; // @ Literal.scala l87
  end

  assign sraw_result = {tmp_sraw_result_1,sraw_temp}; // @ BaseType.scala l299
  assign alu_is_mul = (((((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MUL) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULH)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULHSU)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULHU)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULW)); // @ BaseType.scala l305
  assign alu_is_quo = ((((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIV) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIVU)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIVW)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIVUW)); // @ BaseType.scala l305
  assign alu_is_rem = ((((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REM_1) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REMU)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REMW)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REMUW)); // @ BaseType.scala l305
  assign alu_is_div = (alu_is_quo || alu_is_rem); // @ BaseType.scala l305
  assign tmp_src_ports_ready = (! stall); // @ BaseType.scala l299
  assign src_ports_ready = (tmp_src_ports_ready_1 && tmp_src_ports_ready); // @ Stream.scala l427
  assign tmp_src_stream_payload_micro_op_alu_ctrl_op = src_ports_payload_micro_op_alu_ctrl_op; // @ Stream.scala l428
  always @(*) begin
    src_stream_valid = (src_ports_valid && tmp_src_ports_ready); // @ Stream.scala l294
    if(flush) begin
      src_stream_valid = 1'b0; // @ Stream.scala l439
    end
  end

  always @(*) begin
    tmp_src_ports_ready_1 = src_stream_ready; // @ Stream.scala l295
    if(flush) begin
      tmp_src_ports_ready_1 = 1'b1; // @ Stream.scala l440
    end
  end

  assign src_stream_payload_src1 = src_ports_payload_src1; // @ Stream.scala l296
  assign src_stream_payload_src2 = src_ports_payload_src2; // @ Stream.scala l296
  assign src_stream_payload_micro_op_rd_wen = src_ports_payload_micro_op_rd_wen; // @ Stream.scala l296
  assign src_stream_payload_micro_op_src2_is_imm = src_ports_payload_micro_op_src2_is_imm; // @ Stream.scala l296
  assign src_stream_payload_micro_op_alu_ctrl_op = tmp_src_stream_payload_micro_op_alu_ctrl_op; // @ Stream.scala l296
  assign src_stream_payload_micro_op_alu_is_word = src_ports_payload_micro_op_alu_is_word; // @ Stream.scala l296
  assign src_stream_payload_rd_wen = src_ports_payload_rd_wen; // @ Stream.scala l296
  assign src_stream_payload_rd_rob_ptr = src_ports_payload_rd_rob_ptr; // @ Stream.scala l296
  always @(*) begin
    case(src_ports_payload_micro_op_alu_ctrl_op)
      AluCtrlEnum_ADD : begin
        if(src_ports_payload_micro_op_alu_is_word) begin
          alu_result = addw_result; // @ Alu.scala l74
        end else begin
          alu_result = add_result; // @ Alu.scala l76
        end
      end
      AluCtrlEnum_SUB : begin
        if(src_ports_payload_micro_op_alu_is_word) begin
          alu_result = subw_result; // @ Alu.scala l81
        end else begin
          alu_result = sub_result; // @ Alu.scala l83
        end
      end
      AluCtrlEnum_SLT : begin
        alu_result = {tmp_alu_result,slt_result}; // @ Alu.scala l87
      end
      AluCtrlEnum_SLTU : begin
        alu_result = {tmp_alu_result_1,sltu_result}; // @ Alu.scala l90
      end
      AluCtrlEnum_XOR_1 : begin
        alu_result = xor_result; // @ Alu.scala l93
      end
      AluCtrlEnum_SLL_1 : begin
        if(src_ports_payload_micro_op_alu_is_word) begin
          alu_result = sllw_result; // @ Alu.scala l97
        end else begin
          alu_result = sll_result; // @ Alu.scala l99
        end
      end
      AluCtrlEnum_SRL_1 : begin
        if(src_ports_payload_micro_op_alu_is_word) begin
          alu_result = srlw_result; // @ Alu.scala l104
        end else begin
          alu_result = srl_result; // @ Alu.scala l106
        end
      end
      AluCtrlEnum_SRA_1 : begin
        if(src_ports_payload_micro_op_alu_is_word) begin
          alu_result = sraw_result; // @ Alu.scala l111
        end else begin
          alu_result = sra_result; // @ Alu.scala l113
        end
      end
      AluCtrlEnum_AND_1 : begin
        alu_result = and_result; // @ Alu.scala l117
      end
      AluCtrlEnum_OR_1 : begin
        alu_result = or_result; // @ Alu.scala l120
      end
      AluCtrlEnum_LUI : begin
        alu_result = src_ports_payload_src2; // @ Alu.scala l123
      end
      default : begin
        alu_result = 64'h0; // @ Alu.scala l126
      end
    endcase
  end

  assign tmp_alu_result[62 : 0] = 63'h0; // @ Literal.scala l88
  assign tmp_alu_result_1[62 : 0] = 63'h0; // @ Literal.scala l88
  assign mul_io_src1_is_signed = (((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MUL) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULH)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULHSU)); // @ Alu.scala l133
  assign mul_io_src2_is_signed = ((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MUL) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULH)); // @ Alu.scala l137
  assign tmp_mul_result = mul_io_result_low[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_mul_result_1[31] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[30] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[29] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[28] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[27] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[26] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[25] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[24] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[23] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[22] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[21] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[20] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[19] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[18] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[17] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[16] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[15] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[14] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[13] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[12] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[11] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[10] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[9] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[8] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[7] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[6] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[5] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[4] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[3] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[2] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[1] = tmp_mul_result; // @ Literal.scala l87
    tmp_mul_result_1[0] = tmp_mul_result; // @ Literal.scala l87
  end

  assign mul_result = (src_ports_payload_micro_op_alu_is_word ? {tmp_mul_result_1,mul_io_result_low[31 : 0]} : (((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MUL) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_MULH)) ? mul_io_result_low : mul_io_result_high)); // @ Alu.scala l146
  assign src_stream_fire = (src_stream_valid && src_stream_ready); // @ BaseType.scala l305
  assign div_1_io_op_is_signed = ((((src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIV) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REM_1)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_DIVW)) || (src_ports_payload_micro_op_alu_ctrl_op == AluCtrlEnum_REMW)); // @ Alu.scala l157
  assign src_stream_ready = dst_stream_ready; // @ Alu.scala l167
  assign dst_stream_valid = ((((! alu_is_div) && (! div_1_io_busy)) && src_stream_valid) || div_1_io_done_valid); // @ Alu.scala l168
  assign dst_stream_payload_rd_wen = src_stream_payload_rd_wen; // @ Alu.scala l169
  assign dst_stream_payload_rd_rob_ptr = src_stream_payload_rd_rob_ptr; // @ Alu.scala l170
  assign dst_stream_payload_result = (alu_is_mul ? mul_result : (alu_is_quo ? div_1_io_quotient : (alu_is_rem ? div_1_io_remainder : alu_result))); // @ Alu.scala l171
  always @(*) begin
    dst_stream_ready = dst_stream_m2sPipe_ready; // @ Stream.scala l367
    if((! dst_stream_m2sPipe_valid)) begin
      dst_stream_ready = 1'b1; // @ Stream.scala l368
    end
  end

  assign dst_stream_m2sPipe_valid = dst_stream_rValid; // @ Stream.scala l370
  assign dst_stream_m2sPipe_payload_result = dst_stream_rData_result; // @ Stream.scala l371
  assign dst_stream_m2sPipe_payload_rd_wen = dst_stream_rData_rd_wen; // @ Stream.scala l371
  assign dst_stream_m2sPipe_payload_rd_rob_ptr = dst_stream_rData_rd_rob_ptr; // @ Stream.scala l371
  assign dst_ports_valid = dst_stream_m2sPipe_valid; // @ Stream.scala l294
  assign dst_stream_m2sPipe_ready = dst_ports_ready; // @ Stream.scala l295
  assign dst_ports_payload_result = dst_stream_m2sPipe_payload_result; // @ Stream.scala l296
  assign dst_ports_payload_rd_wen = dst_stream_m2sPipe_payload_rd_wen; // @ Stream.scala l296
  assign dst_ports_payload_rd_rob_ptr = dst_stream_m2sPipe_payload_rd_rob_ptr; // @ Stream.scala l296
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      dst_stream_rValid <= 1'b0; // @ Data.scala l400
    end else begin
      if(dst_stream_ready) begin
        dst_stream_rValid <= dst_stream_valid; // @ Stream.scala l361
      end
    end
  end

  always @(posedge clk) begin
    if(dst_stream_ready) begin
      dst_stream_rData_result <= dst_stream_payload_result; // @ Stream.scala l362
      dst_stream_rData_rd_wen <= dst_stream_payload_rd_wen; // @ Stream.scala l362
      dst_stream_rData_rd_rob_ptr <= dst_stream_payload_rd_rob_ptr; // @ Stream.scala l362
    end
  end


endmodule

module Divider (
  input               io_flush,
  input               io_start,
  output              io_busy,
  output              io_done_valid,
  input               io_done_ready,
  input               io_op_is_word,
  input               io_op_is_signed,
  input      [63:0]   io_dividend,
  input      [63:0]   io_divisor,
  output     [63:0]   io_quotient,
  output     [63:0]   io_remainder,
  input               resetn,
  input               clk
);

  wire                u_div_o_busy;
  wire                u_div_o_end_valid;
  wire       [63:0]   u_div_o_quotient;
  wire       [63:0]   u_div_o_remainder;

  div u_div (
    .i_clk       (clk                    ), //i
    .i_rst_n     (resetn                 ), //i
    .i_flush     (io_flush               ), //i
    .i_start     (io_start               ), //i
    .o_busy      (u_div_o_busy           ), //o
    .o_end_valid (u_div_o_end_valid      ), //o
    .i_end_ready (io_done_ready          ), //i
    .i_divw      (io_op_is_word          ), //i
    .i_signed    (io_op_is_signed        ), //i
    .i_dividend  (io_dividend[63:0]      ), //i
    .i_divisor   (io_divisor[63:0]       ), //i
    .o_quotient  (u_div_o_quotient[63:0] ), //o
    .o_remainder (u_div_o_remainder[63:0])  //o
  );
  assign io_busy = u_div_o_busy; // @ Div.scala l49
  assign io_done_valid = u_div_o_end_valid; // @ Div.scala l50
  assign io_quotient = u_div_o_quotient; // @ Div.scala l55
  assign io_remainder = u_div_o_remainder; // @ Div.scala l56

endmodule

module Multiplier (
  input               io_op_is_word,
  input               io_src1_is_signed,
  input               io_src2_is_signed,
  input      [63:0]   io_src1,
  input      [63:0]   io_src2,
  output     [63:0]   io_result_high,
  output     [63:0]   io_result_low
);

  wire       [63:0]   u_mult_o_hi_res;
  wire       [63:0]   u_mult_o_lw_res;

  mult u_mult (
    .i_mulw   (io_op_is_word        ), //i
    .i_x_sign (io_src1_is_signed    ), //i
    .i_y_sign (io_src2_is_signed    ), //i
    .i_x      (io_src1[63:0]        ), //i
    .i_y      (io_src2[63:0]        ), //i
    .o_hi_res (u_mult_o_hi_res[63:0]), //o
    .o_lw_res (u_mult_o_lw_res[63:0])  //o
  );
  assign io_result_high = u_mult_o_hi_res; // @ Mult.scala l44
  assign io_result_low = u_mult_o_lw_res; // @ Mult.scala l45

endmodule
