// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Decode
// Git hash  : 18119d788dc0be80a01b6f7e3353d83903c3293f

`timescale 1ns/1ps

module Decode (
  input      [31:0]   pc,
  input      [31:0]   instr,
  output     [4:0]    rs1_addr,
  output     [4:0]    rs2_addr,
  output              rs1_ren,
  output              rs2_ren,
  input      [63:0]   rs1_val,
  input      [63:0]   rs2_val,
  output     [4:0]    rd_addr,
  output     [63:0]   imm,
  output              alu_micro_op_rd_wen,
  output              alu_micro_op_src2_is_imm,
  output     [4:0]    alu_micro_op_alu_ctrl_op,
  output              alu_micro_op_alu_is_word,
  output              lsu_micro_op_rd_wen,
  output              lsu_micro_op_src2_is_imm,
  output     [3:0]    lsu_micro_op_lsu_ctrl_op,
  output              lsu_micro_op_lsu_is_load,
  output              lsu_micro_op_lsu_is_store,
  output              bju_micro_op_rd_wen,
  output              bju_micro_op_src2_is_imm,
  output     [3:0]    bju_micro_op_bju_ctrl_op,
  output     [3:0]    bju_micro_op_exp_ctrl_op,
  output              bju_micro_op_bju_rd_eq_rs1,
  output              bju_micro_op_bju_rd_is_link,
  output              bju_micro_op_bju_rs1_is_link
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
  localparam BjuCtrlEnum_IDLE = 4'd0;
  localparam BjuCtrlEnum_AUIPC = 4'd1;
  localparam BjuCtrlEnum_JAL = 4'd2;
  localparam BjuCtrlEnum_JALR = 4'd3;
  localparam BjuCtrlEnum_BEQ = 4'd4;
  localparam BjuCtrlEnum_BNE = 4'd5;
  localparam BjuCtrlEnum_BLT = 4'd6;
  localparam BjuCtrlEnum_BGE = 4'd7;
  localparam BjuCtrlEnum_BLTU = 4'd8;
  localparam BjuCtrlEnum_BGEU = 4'd9;
  localparam BjuCtrlEnum_CSR = 4'd10;
  localparam ExpCtrlEnum_IDLE = 4'd0;
  localparam ExpCtrlEnum_ECALL = 4'd1;
  localparam ExpCtrlEnum_EBREAK = 4'd2;
  localparam ExpCtrlEnum_MRET = 4'd3;
  localparam ExpCtrlEnum_CSRRW = 4'd4;
  localparam ExpCtrlEnum_CSRRS = 4'd5;
  localparam ExpCtrlEnum_CSRRC = 4'd6;
  localparam ExpCtrlEnum_CSRRWI = 4'd7;
  localparam ExpCtrlEnum_CSRRSI = 4'd8;
  localparam ExpCtrlEnum_CSRRCI = 4'd9;

  wire       [31:0]   tmp_tmp_imm_data;
  wire       [19:0]   tmp_tmp_imm_data_2;
  wire       [11:0]   tmp_tmp_imm_data_4;
  wire       [11:0]   tmp_tmp_imm_data_6;
  wire       [19:0]   tmp_imm_data_10;
  wire       [11:0]   tmp_imm_data_11;
  wire       [19:0]   tmp_imm_data_12;
  wire                tmp_imm_data_13;
  wire       [7:0]    tmp_imm_data_14;
  wire       [3:0]    tmp_imm_data_15;
  wire                tmp_imm_type;
  wire                tmp_imm_type_1;
  wire       [6:0]    tmp_imm_type_2;
  wire       [6:0]    tmp_imm_type_3;
  wire       [6:0]    tmp_imm_type_4;
  wire       [6:0]    tmp_imm_type_5;
  wire       [6:0]    tmp_imm_type_6;
  wire       [6:0]    tmp_imm_type_7;
  wire       [63:0]   tmp_imm_6;
  wire       [0:0]    tmp_imm_7;
  wire       [61:0]   tmp_imm_8;
  wire       [0:0]    tmp_imm_9;
  wire       [58:0]   tmp_imm_10;
  wire       [0:0]    tmp_imm_11;
  wire       [55:0]   tmp_imm_12;
  wire       [0:0]    tmp_imm_13;
  wire       [52:0]   tmp_imm_14;
  wire       [0:0]    tmp_imm_15;
  wire       [49:0]   tmp_imm_16;
  wire       [0:0]    tmp_imm_17;
  wire       [46:0]   tmp_imm_18;
  wire       [0:0]    tmp_imm_19;
  wire       [43:0]   tmp_imm_20;
  wire       [0:0]    tmp_imm_21;
  wire       [40:0]   tmp_imm_22;
  wire       [0:0]    tmp_imm_23;
  wire       [37:0]   tmp_imm_24;
  wire       [0:0]    tmp_imm_25;
  wire       [34:0]   tmp_imm_26;
  wire       [0:0]    tmp_imm_27;
  wire       [31:0]   tmp_imm_28;
  wire       [0:0]    tmp_imm_29;
  wire       [28:0]   tmp_imm_30;
  wire       [0:0]    tmp_imm_31;
  wire       [25:0]   tmp_imm_32;
  wire       [0:0]    tmp_imm_33;
  wire       [22:0]   tmp_imm_34;
  wire       [0:0]    tmp_imm_35;
  wire       [19:0]   tmp_imm_36;
  wire       [0:0]    tmp_imm_37;
  wire       [16:0]   tmp_imm_38;
  wire       [0:0]    tmp_imm_39;
  wire       [13:0]   tmp_imm_40;
  wire       [0:0]    tmp_imm_41;
  wire       [10:0]   tmp_imm_42;
  wire       [0:0]    tmp_imm_43;
  wire       [7:0]    tmp_imm_44;
  wire       [0:0]    tmp_imm_45;
  wire       [4:0]    tmp_imm_46;
  wire       [63:0]   tmp_imm_47;
  wire       [0:0]    tmp_imm_48;
  wire       [61:0]   tmp_imm_49;
  wire       [0:0]    tmp_imm_50;
  wire       [58:0]   tmp_imm_51;
  wire       [0:0]    tmp_imm_52;
  wire       [55:0]   tmp_imm_53;
  wire       [0:0]    tmp_imm_54;
  wire       [52:0]   tmp_imm_55;
  wire       [0:0]    tmp_imm_56;
  wire       [49:0]   tmp_imm_57;
  wire       [0:0]    tmp_imm_58;
  wire       [46:0]   tmp_imm_59;
  wire       [0:0]    tmp_imm_60;
  wire       [43:0]   tmp_imm_61;
  wire       [0:0]    tmp_imm_62;
  wire       [40:0]   tmp_imm_63;
  wire       [0:0]    tmp_imm_64;
  wire       [37:0]   tmp_imm_65;
  wire       [0:0]    tmp_imm_66;
  wire       [34:0]   tmp_imm_67;
  wire       [0:0]    tmp_imm_68;
  wire       [31:0]   tmp_imm_69;
  wire       [0:0]    tmp_imm_70;
  wire       [28:0]   tmp_imm_71;
  wire       [0:0]    tmp_imm_72;
  wire       [25:0]   tmp_imm_73;
  wire       [0:0]    tmp_imm_74;
  wire       [22:0]   tmp_imm_75;
  wire       [0:0]    tmp_imm_76;
  wire       [19:0]   tmp_imm_77;
  wire       [0:0]    tmp_imm_78;
  wire       [16:0]   tmp_imm_79;
  wire       [0:0]    tmp_imm_80;
  wire       [13:0]   tmp_imm_81;
  wire       [0:0]    tmp_imm_82;
  wire       [10:0]   tmp_imm_83;
  wire       [0:0]    tmp_imm_84;
  wire       [7:0]    tmp_imm_85;
  wire       [0:0]    tmp_imm_86;
  wire       [4:0]    tmp_imm_87;
  wire       [63:0]   tmp_imm_88;
  wire       [63:0]   tmp_imm_89;
  wire       [0:0]    tmp_imm_90;
  wire       [60:0]   tmp_imm_91;
  wire       [0:0]    tmp_imm_92;
  wire       [57:0]   tmp_imm_93;
  wire       [0:0]    tmp_imm_94;
  wire       [54:0]   tmp_imm_95;
  wire       [0:0]    tmp_imm_96;
  wire       [51:0]   tmp_imm_97;
  wire       [0:0]    tmp_imm_98;
  wire       [48:0]   tmp_imm_99;
  wire       [0:0]    tmp_imm_100;
  wire       [45:0]   tmp_imm_101;
  wire       [0:0]    tmp_imm_102;
  wire       [42:0]   tmp_imm_103;
  wire       [0:0]    tmp_imm_104;
  wire       [39:0]   tmp_imm_105;
  wire       [0:0]    tmp_imm_106;
  wire       [36:0]   tmp_imm_107;
  wire       [0:0]    tmp_imm_108;
  wire       [33:0]   tmp_imm_109;
  wire       [0:0]    tmp_imm_110;
  wire       [30:0]   tmp_imm_111;
  wire       [0:0]    tmp_imm_112;
  wire       [27:0]   tmp_imm_113;
  wire       [0:0]    tmp_imm_114;
  wire       [24:0]   tmp_imm_115;
  wire       [0:0]    tmp_imm_116;
  wire       [21:0]   tmp_imm_117;
  wire       [0:0]    tmp_imm_118;
  wire       [18:0]   tmp_imm_119;
  wire       [0:0]    tmp_imm_120;
  wire       [15:0]   tmp_imm_121;
  wire       [0:0]    tmp_imm_122;
  wire       [12:0]   tmp_imm_123;
  wire       [0:0]    tmp_imm_124;
  wire       [9:0]    tmp_imm_125;
  wire       [0:0]    tmp_imm_126;
  wire       [6:0]    tmp_imm_127;
  wire       [0:0]    tmp_imm_128;
  wire       [3:0]    tmp_imm_129;
  wire       [0:0]    tmp_imm_130;
  wire       [62:0]   tmp_imm_131;
  wire       [0:0]    tmp_imm_132;
  wire       [59:0]   tmp_imm_133;
  wire       [0:0]    tmp_imm_134;
  wire       [56:0]   tmp_imm_135;
  wire       [0:0]    tmp_imm_136;
  wire       [53:0]   tmp_imm_137;
  wire       [0:0]    tmp_imm_138;
  wire       [50:0]   tmp_imm_139;
  wire       [0:0]    tmp_imm_140;
  wire       [47:0]   tmp_imm_141;
  wire       [0:0]    tmp_imm_142;
  wire       [44:0]   tmp_imm_143;
  wire       [0:0]    tmp_imm_144;
  wire       [41:0]   tmp_imm_145;
  wire       [0:0]    tmp_imm_146;
  wire       [38:0]   tmp_imm_147;
  wire       [0:0]    tmp_imm_148;
  wire       [35:0]   tmp_imm_149;
  wire       [0:0]    tmp_imm_150;
  wire       [32:0]   tmp_imm_151;
  wire       [0:0]    tmp_imm_152;
  wire       [29:0]   tmp_imm_153;
  wire       [0:0]    tmp_imm_154;
  wire       [26:0]   tmp_imm_155;
  wire       [0:0]    tmp_imm_156;
  wire       [23:0]   tmp_imm_157;
  wire       [0:0]    tmp_imm_158;
  wire       [20:0]   tmp_imm_159;
  wire       [0:0]    tmp_imm_160;
  wire       [17:0]   tmp_imm_161;
  wire       [0:0]    tmp_imm_162;
  wire       [14:0]   tmp_imm_163;
  wire       [0:0]    tmp_imm_164;
  wire       [11:0]   tmp_imm_165;
  wire       [0:0]    tmp_imm_166;
  wire       [8:0]    tmp_imm_167;
  wire       [0:0]    tmp_imm_168;
  wire       [5:0]    tmp_imm_169;
  wire       [0:0]    tmp_imm_170;
  wire       [2:0]    tmp_imm_171;
  wire       [0:0]    tmp_imm_172;
  wire       [61:0]   tmp_imm_173;
  wire       [0:0]    tmp_imm_174;
  wire       [58:0]   tmp_imm_175;
  wire       [0:0]    tmp_imm_176;
  wire       [55:0]   tmp_imm_177;
  wire       [0:0]    tmp_imm_178;
  wire       [52:0]   tmp_imm_179;
  wire       [0:0]    tmp_imm_180;
  wire       [49:0]   tmp_imm_181;
  wire       [0:0]    tmp_imm_182;
  wire       [46:0]   tmp_imm_183;
  wire       [0:0]    tmp_imm_184;
  wire       [43:0]   tmp_imm_185;
  wire       [0:0]    tmp_imm_186;
  wire       [40:0]   tmp_imm_187;
  wire       [0:0]    tmp_imm_188;
  wire       [37:0]   tmp_imm_189;
  wire       [0:0]    tmp_imm_190;
  wire       [34:0]   tmp_imm_191;
  wire       [0:0]    tmp_imm_192;
  wire       [31:0]   tmp_imm_193;
  wire       [0:0]    tmp_imm_194;
  wire       [28:0]   tmp_imm_195;
  wire       [0:0]    tmp_imm_196;
  wire       [25:0]   tmp_imm_197;
  wire       [0:0]    tmp_imm_198;
  wire       [22:0]   tmp_imm_199;
  wire       [0:0]    tmp_imm_200;
  wire       [19:0]   tmp_imm_201;
  wire       [0:0]    tmp_imm_202;
  wire       [16:0]   tmp_imm_203;
  wire       [0:0]    tmp_imm_204;
  wire       [13:0]   tmp_imm_205;
  wire       [0:0]    tmp_imm_206;
  wire       [10:0]   tmp_imm_207;
  wire       [0:0]    tmp_imm_208;
  wire       [7:0]    tmp_imm_209;
  wire       [0:0]    tmp_imm_210;
  wire       [4:0]    tmp_imm_211;
  wire       [0:0]    tmp_imm_212;
  wire       [1:0]    tmp_imm_213;
  wire       [0:0]    tmp_imm_214;
  wire       [60:0]   tmp_imm_215;
  wire       [0:0]    tmp_imm_216;
  wire       [57:0]   tmp_imm_217;
  wire       [0:0]    tmp_imm_218;
  wire       [54:0]   tmp_imm_219;
  wire       [0:0]    tmp_imm_220;
  wire       [51:0]   tmp_imm_221;
  wire       [0:0]    tmp_imm_222;
  wire       [48:0]   tmp_imm_223;
  wire       [0:0]    tmp_imm_224;
  wire       [45:0]   tmp_imm_225;
  wire       [0:0]    tmp_imm_226;
  wire       [42:0]   tmp_imm_227;
  wire       [0:0]    tmp_imm_228;
  wire       [39:0]   tmp_imm_229;
  wire       [0:0]    tmp_imm_230;
  wire       [36:0]   tmp_imm_231;
  wire       [0:0]    tmp_imm_232;
  wire       [33:0]   tmp_imm_233;
  wire       [0:0]    tmp_imm_234;
  wire       [30:0]   tmp_imm_235;
  wire       [0:0]    tmp_imm_236;
  wire       [27:0]   tmp_imm_237;
  wire       [0:0]    tmp_imm_238;
  wire       [24:0]   tmp_imm_239;
  wire       [0:0]    tmp_imm_240;
  wire       [21:0]   tmp_imm_241;
  wire       [0:0]    tmp_imm_242;
  wire       [18:0]   tmp_imm_243;
  wire       [0:0]    tmp_imm_244;
  wire       [15:0]   tmp_imm_245;
  wire       [0:0]    tmp_imm_246;
  wire       [12:0]   tmp_imm_247;
  wire       [0:0]    tmp_imm_248;
  wire       [9:0]    tmp_imm_249;
  wire       [0:0]    tmp_imm_250;
  wire       [6:0]    tmp_imm_251;
  wire       [0:0]    tmp_imm_252;
  wire       [3:0]    tmp_imm_253;
  wire       [0:0]    tmp_imm_254;
  wire       [0:0]    tmp_imm_255;
  wire       [12:0]   tmp_alu_ctrl_sel;
  wire       [1:0]    tmp_alu_ctrl_sel_1;
  wire       [0:0]    tmp_alu_ctrl_sel_2;
  wire       [0:0]    tmp_alu_ctrl_sel_3;
  wire       [64:0]   tmp_alu_ctrl_data_24;
  wire       [9:0]    tmp_alu_ctrl_data_25;
  wire       [4:0]    tmp_alu_ctrl_data_26;
  wire       [4:0]    tmp_alu_ctrl_data_27;
  wire       [4:0]    tmp_alu_ctrl_op_24;
  wire       [4:0]    tmp_alu_ctrl_op_25;
  wire       [4:0]    tmp_alu_ctrl_op_26;
  wire       [4:0]    tmp_alu_ctrl_op_27;
  wire       [4:0]    tmp_alu_ctrl_op_28;
  wire       [4:0]    tmp_alu_ctrl_op_29;
  wire       [4:0]    tmp_alu_ctrl_op_30;
  wire       [0:0]    tmp_alu_ctrl_op_31;
  wire       [2:0]    tmp_alu_ctrl_op_32;
  wire       [4:0]    tmp_alu_ctrl_op_33;
  wire       [0:0]    tmp_alu_ctrl_op_34;
  wire       [2:0]    tmp_alu_ctrl_op_35;
  wire       [4:0]    tmp_alu_ctrl_op_36;
  wire       [4:0]    tmp_alu_ctrl_op_37;
  wire       [0:0]    tmp_alu_ctrl_op_38;
  wire       [1:0]    tmp_alu_ctrl_op_39;
  wire       [0:0]    tmp_alu_ctrl_op_40;
  wire       [3:0]    tmp_alu_ctrl_op_41;
  wire       [0:0]    tmp_alu_ctrl_op_42;
  wire       [0:0]    tmp_alu_ctrl_op_43;
  wire       [4:0]    tmp_alu_ctrl_op_44;
  wire       [0:0]    tmp_alu_ctrl_op_45;
  wire       [2:0]    tmp_alu_ctrl_op_46;
  wire       [4:0]    tmp_alu_ctrl_op_47;
  wire       [4:0]    tmp_alu_ctrl_op_48;
  wire       [0:0]    tmp_alu_ctrl_op_49;
  wire       [1:0]    tmp_alu_ctrl_op_50;
  wire       [0:0]    tmp_alu_ctrl_op_51;
  wire       [3:0]    tmp_alu_ctrl_op_52;
  wire       [0:0]    tmp_alu_ctrl_op_53;
  wire       [0:0]    tmp_alu_ctrl_op_54;
  wire       [4:0]    tmp_alu_ctrl_op_55;
  wire       [0:0]    tmp_alu_ctrl_op_56;
  wire       [2:0]    tmp_alu_ctrl_op_57;
  wire       [4:0]    tmp_alu_ctrl_op_58;
  wire       [4:0]    tmp_alu_ctrl_op_59;
  wire       [0:0]    tmp_alu_ctrl_op_60;
  wire       [1:0]    tmp_alu_ctrl_op_61;
  wire       [0:0]    tmp_alu_ctrl_op_62;
  wire       [3:0]    tmp_alu_ctrl_op_63;
  wire       [0:0]    tmp_alu_ctrl_op_64;
  wire       [0:0]    tmp_alu_ctrl_op_65;
  wire       [4:0]    tmp_alu_ctrl_op_66;
  wire       [0:0]    tmp_alu_ctrl_op_67;
  wire       [2:0]    tmp_alu_ctrl_op_68;
  wire       [4:0]    tmp_alu_ctrl_op_69;
  wire       [4:0]    tmp_alu_ctrl_op_70;
  wire       [0:0]    tmp_alu_ctrl_op_71;
  wire       [1:0]    tmp_alu_ctrl_op_72;
  wire       [0:0]    tmp_alu_ctrl_op_73;
  wire       [3:0]    tmp_alu_ctrl_op_74;
  wire       [0:0]    tmp_alu_ctrl_op_75;
  wire       [0:0]    tmp_alu_ctrl_op_76;
  wire       [4:0]    tmp_alu_ctrl_op_77;
  wire       [0:0]    tmp_alu_ctrl_op_78;
  wire       [2:0]    tmp_alu_ctrl_op_79;
  wire       [4:0]    tmp_alu_ctrl_op_80;
  wire       [4:0]    tmp_alu_ctrl_op_81;
  wire       [0:0]    tmp_alu_ctrl_op_82;
  wire       [1:0]    tmp_alu_ctrl_op_83;
  wire       [0:0]    tmp_alu_ctrl_op_84;
  wire       [3:0]    tmp_alu_ctrl_op_85;
  wire       [0:0]    tmp_alu_ctrl_op_86;
  wire       [0:0]    tmp_alu_ctrl_op_87;
  wire       [4:0]    tmp_alu_ctrl_op_88;
  wire       [0:0]    tmp_alu_ctrl_op_89;
  wire       [2:0]    tmp_alu_ctrl_op_90;
  wire       [4:0]    tmp_alu_ctrl_op_91;
  wire       [4:0]    tmp_alu_ctrl_op_92;
  wire       [0:0]    tmp_alu_ctrl_op_93;
  wire       [1:0]    tmp_alu_ctrl_op_94;
  wire       [0:0]    tmp_alu_ctrl_op_95;
  wire       [3:0]    tmp_alu_ctrl_op_96;
  wire       [0:0]    tmp_alu_ctrl_op_97;
  wire       [0:0]    tmp_alu_ctrl_op_98;
  wire       [4:0]    tmp_alu_ctrl_op_99;
  wire       [0:0]    tmp_alu_ctrl_op_100;
  wire       [2:0]    tmp_alu_ctrl_op_101;
  wire       [4:0]    tmp_alu_ctrl_op_102;
  wire       [4:0]    tmp_alu_ctrl_op_103;
  wire       [0:0]    tmp_alu_ctrl_op_104;
  wire       [1:0]    tmp_alu_ctrl_op_105;
  wire       [0:0]    tmp_alu_ctrl_op_106;
  wire       [3:0]    tmp_alu_ctrl_op_107;
  wire       [0:0]    tmp_alu_ctrl_op_108;
  wire       [0:0]    tmp_alu_ctrl_op_109;
  wire       [0:0]    tmp_alu_ctrl_op_110;
  wire       [2:0]    tmp_alu_ctrl_op_111;
  wire       [0:0]    tmp_alu_ctrl_op_112;
  wire       [1:0]    tmp_alu_ctrl_op_113;
  wire       [3:0]    tmp_bju_ctrl_op_10;
  wire       [3:0]    tmp_bju_ctrl_op_11;
  wire       [0:0]    tmp_bju_ctrl_op_12;
  wire       [2:0]    tmp_bju_ctrl_op_13;
  wire       [0:0]    tmp_bju_ctrl_op_14;
  wire       [2:0]    tmp_bju_ctrl_op_15;
  wire       [3:0]    tmp_bju_ctrl_op_16;
  wire       [0:0]    tmp_bju_ctrl_op_17;
  wire       [1:0]    tmp_bju_ctrl_op_18;
  wire       [3:0]    tmp_bju_ctrl_op_19;
  wire       [3:0]    tmp_bju_ctrl_op_20;
  wire       [0:0]    tmp_bju_ctrl_op_21;
  wire       [0:0]    tmp_bju_ctrl_op_22;
  wire       [0:0]    tmp_bju_ctrl_op_23;
  wire       [2:0]    tmp_bju_ctrl_op_24;
  wire       [3:0]    tmp_bju_ctrl_op_25;
  wire       [0:0]    tmp_bju_ctrl_op_26;
  wire       [1:0]    tmp_bju_ctrl_op_27;
  wire       [3:0]    tmp_bju_ctrl_op_28;
  wire       [3:0]    tmp_bju_ctrl_op_29;
  wire       [0:0]    tmp_bju_ctrl_op_30;
  wire       [0:0]    tmp_bju_ctrl_op_31;
  wire       [0:0]    tmp_bju_ctrl_op_32;
  wire       [2:0]    tmp_bju_ctrl_op_33;
  wire       [0:0]    tmp_bju_ctrl_op_34;
  wire       [1:0]    tmp_bju_ctrl_op_35;
  wire       [0:0]    tmp_bju_ctrl_op_36;
  wire       [0:0]    tmp_bju_ctrl_op_37;
  wire       [3:0]    tmp_exp_ctrl_op_9;
  wire       [3:0]    tmp_exp_ctrl_op_10;
  wire       [0:0]    tmp_exp_ctrl_op_11;
  wire       [1:0]    tmp_exp_ctrl_op_12;
  wire       [3:0]    tmp_exp_ctrl_op_13;
  wire       [0:0]    tmp_exp_ctrl_op_14;
  wire       [1:0]    tmp_exp_ctrl_op_15;
  wire       [3:0]    tmp_exp_ctrl_op_16;
  wire       [3:0]    tmp_exp_ctrl_op_17;
  wire       [0:0]    tmp_exp_ctrl_op_18;
  wire       [0:0]    tmp_exp_ctrl_op_19;
  wire       [0:0]    tmp_exp_ctrl_op_20;
  wire       [2:0]    tmp_exp_ctrl_op_21;
  wire       [3:0]    tmp_exp_ctrl_op_22;
  wire       [0:0]    tmp_exp_ctrl_op_23;
  wire       [1:0]    tmp_exp_ctrl_op_24;
  wire       [3:0]    tmp_exp_ctrl_op_25;
  wire       [3:0]    tmp_exp_ctrl_op_26;
  wire       [0:0]    tmp_exp_ctrl_op_27;
  wire       [0:0]    tmp_exp_ctrl_op_28;
  wire       [0:0]    tmp_exp_ctrl_op_29;
  wire       [2:0]    tmp_exp_ctrl_op_30;
  wire       [0:0]    tmp_exp_ctrl_op_31;
  wire       [1:0]    tmp_exp_ctrl_op_32;
  wire       [0:0]    tmp_exp_ctrl_op_33;
  wire       [0:0]    tmp_exp_ctrl_op_34;
  wire       [3:0]    tmp_lsu_ctrl_op_11;
  wire       [3:0]    tmp_lsu_ctrl_op_12;
  wire       [3:0]    tmp_lsu_ctrl_op_13;
  wire       [3:0]    tmp_lsu_ctrl_op_14;
  wire       [3:0]    tmp_lsu_ctrl_op_15;
  wire       [3:0]    tmp_lsu_ctrl_op_16;
  wire       [0:0]    tmp_lsu_ctrl_op_17;
  wire       [2:0]    tmp_lsu_ctrl_op_18;
  wire       [3:0]    tmp_lsu_ctrl_op_19;
  wire       [0:0]    tmp_lsu_ctrl_op_20;
  wire       [1:0]    tmp_lsu_ctrl_op_21;
  wire       [3:0]    tmp_lsu_ctrl_op_22;
  wire       [3:0]    tmp_lsu_ctrl_op_23;
  wire       [0:0]    tmp_lsu_ctrl_op_24;
  wire       [0:0]    tmp_lsu_ctrl_op_25;
  wire       [0:0]    tmp_lsu_ctrl_op_26;
  wire       [2:0]    tmp_lsu_ctrl_op_27;
  wire       [3:0]    tmp_lsu_ctrl_op_28;
  wire       [0:0]    tmp_lsu_ctrl_op_29;
  wire       [1:0]    tmp_lsu_ctrl_op_30;
  wire       [3:0]    tmp_lsu_ctrl_op_31;
  wire       [3:0]    tmp_lsu_ctrl_op_32;
  wire       [0:0]    tmp_lsu_ctrl_op_33;
  wire       [0:0]    tmp_lsu_ctrl_op_34;
  wire       [0:0]    tmp_lsu_ctrl_op_35;
  wire       [2:0]    tmp_lsu_ctrl_op_36;
  wire       [0:0]    tmp_lsu_ctrl_op_37;
  wire       [1:0]    tmp_lsu_ctrl_op_38;
  wire       [0:0]    tmp_lsu_ctrl_op_39;
  wire       [0:0]    tmp_lsu_ctrl_op_40;
  wire       [6:0]    opcode;
  wire       [4:0]    rd;
  wire       [4:0]    rs1;
  wire       [4:0]    rs2;
  wire       [2:0]    func3;
  wire       [6:0]    func7;
  wire       [11:0]   csr;
  wire                op_is_imm;
  wire                op_is_alu;
  wire                op_is_load;
  wire                op_is_store;
  wire                op_is_jal;
  wire                op_is_jalr;
  wire                op_is_branch;
  wire                op_is_lui;
  wire                op_is_auipc;
  wire                op_is_fence;
  wire                op_is_sys;
  wire                op_is_word;
  wire                op_is_wordi;
  wire                func3_is_000;
  wire                func3_is_001;
  wire                func3_is_010;
  wire                func3_is_011;
  wire                func3_is_100;
  wire                func3_is_101;
  wire                func3_is_110;
  wire                func3_is_111;
  wire                func7_is_0000000;
  wire                func7_is_0100000;
  wire                func7_is_0011000;
  wire                func7_is_0000001;
  wire                instr_high_6bit_is_000000;
  wire                instr_high_6bit_is_010000;
  wire                add;
  wire                and_1;
  wire                or_1;
  wire                sll_1;
  wire                slt;
  wire                sltu;
  wire                sra_1;
  wire                srl_1;
  wire                sub;
  wire                xor_1;
  wire                subw;
  wire                srlw;
  wire                sraw;
  wire                addw;
  wire                sllw;
  wire                addi;
  wire                andi;
  wire                ori;
  wire                slli;
  wire                slti;
  wire                sltiu;
  wire                srai;
  wire                srli;
  wire                xori;
  wire                srliw;
  wire                sraiw;
  wire                addiw;
  wire                slliw;
  wire                mul;
  wire                mulh;
  wire                mulhsu;
  wire                mulhu;
  wire                div;
  wire                divu;
  wire                rem_1;
  wire                remu;
  wire                mulw;
  wire                divw;
  wire                divuw;
  wire                remw;
  wire                remuw;
  wire                alu_add;
  wire                alu_sub;
  wire                alu_slt;
  wire                alu_sltu;
  wire                alu_xor;
  wire                alu_sll;
  wire                alu_srl;
  wire                alu_sra;
  wire                alu_and;
  wire                alu_or;
  wire                lb;
  wire                lbu;
  wire                ld;
  wire                lh;
  wire                lhu;
  wire                lw;
  wire                lwu;
  wire                sb;
  wire                sd;
  wire                sh;
  wire                sw;
  wire                ebreak;
  wire                ecall;
  wire                mret;
  wire                csrrw;
  wire                csrrs;
  wire                csrrc;
  wire                csrrwi;
  wire                csrrsi;
  wire                csrrci;
  wire                csri;
  wire                csr_op;
  wire                beq;
  wire                bge;
  wire                bgeu;
  wire                blt;
  wire                bltu;
  wire                bne;
  wire       [63:0]   csr_imm;
  wire                tmp_imm_data;
  reg        [31:0]   tmp_imm_data_1;
  wire                tmp_imm_data_2;
  reg        [42:0]   tmp_imm_data_3;
  wire                tmp_imm_data_4;
  reg        [50:0]   tmp_imm_data_5;
  wire                tmp_imm_data_6;
  reg        [51:0]   tmp_imm_data_7;
  wire                tmp_imm_data_8;
  reg        [51:0]   tmp_imm_data_9;
  wire       [383:0]  imm_data;
  wire       [5:0]    imm_type;
  wire                tmp_imm;
  wire                tmp_imm_1;
  wire                tmp_imm_2;
  wire                tmp_imm_3;
  wire                tmp_imm_4;
  wire                tmp_imm_5;
  wire       [23:0]   alu_ctrl_sel;
  wire       [4:0]    tmp_alu_ctrl_data;
  wire       [4:0]    tmp_alu_ctrl_data_1;
  wire       [4:0]    tmp_alu_ctrl_data_2;
  wire       [4:0]    tmp_alu_ctrl_data_3;
  wire       [4:0]    tmp_alu_ctrl_data_4;
  wire       [4:0]    tmp_alu_ctrl_data_5;
  wire       [4:0]    tmp_alu_ctrl_data_6;
  wire       [4:0]    tmp_alu_ctrl_data_7;
  wire       [4:0]    tmp_alu_ctrl_data_8;
  wire       [4:0]    tmp_alu_ctrl_data_9;
  wire       [4:0]    tmp_alu_ctrl_data_10;
  wire       [4:0]    tmp_alu_ctrl_data_11;
  wire       [4:0]    tmp_alu_ctrl_data_12;
  wire       [4:0]    tmp_alu_ctrl_data_13;
  wire       [4:0]    tmp_alu_ctrl_data_14;
  wire       [4:0]    tmp_alu_ctrl_data_15;
  wire       [4:0]    tmp_alu_ctrl_data_16;
  wire       [4:0]    tmp_alu_ctrl_data_17;
  wire       [4:0]    tmp_alu_ctrl_data_18;
  wire       [4:0]    tmp_alu_ctrl_data_19;
  wire       [4:0]    tmp_alu_ctrl_data_20;
  wire       [4:0]    tmp_alu_ctrl_data_21;
  wire       [4:0]    tmp_alu_ctrl_data_22;
  wire       [4:0]    tmp_alu_ctrl_data_23;
  wire       [119:0]  alu_ctrl_data;
  wire                tmp_alu_ctrl_op;
  wire                tmp_alu_ctrl_op_1;
  wire                tmp_alu_ctrl_op_2;
  wire                tmp_alu_ctrl_op_3;
  wire                tmp_alu_ctrl_op_4;
  wire                tmp_alu_ctrl_op_5;
  wire                tmp_alu_ctrl_op_6;
  wire                tmp_alu_ctrl_op_7;
  wire                tmp_alu_ctrl_op_8;
  wire                tmp_alu_ctrl_op_9;
  wire                tmp_alu_ctrl_op_10;
  wire                tmp_alu_ctrl_op_11;
  wire                tmp_alu_ctrl_op_12;
  wire                tmp_alu_ctrl_op_13;
  wire                tmp_alu_ctrl_op_14;
  wire                tmp_alu_ctrl_op_15;
  wire                tmp_alu_ctrl_op_16;
  wire                tmp_alu_ctrl_op_17;
  wire                tmp_alu_ctrl_op_18;
  wire                tmp_alu_ctrl_op_19;
  wire                tmp_alu_ctrl_op_20;
  wire                tmp_alu_ctrl_op_21;
  wire                tmp_alu_ctrl_op_22;
  wire                tmp_alu_ctrl_op_23;
  wire       [4:0]    alu_ctrl_op;
  wire       [9:0]    bju_ctrl_sel;
  wire       [3:0]    tmp_bju_ctrl_data;
  wire       [3:0]    tmp_bju_ctrl_data_1;
  wire       [3:0]    tmp_bju_ctrl_data_2;
  wire       [3:0]    tmp_bju_ctrl_data_3;
  wire       [3:0]    tmp_bju_ctrl_data_4;
  wire       [3:0]    tmp_bju_ctrl_data_5;
  wire       [3:0]    tmp_bju_ctrl_data_6;
  wire       [3:0]    tmp_bju_ctrl_data_7;
  wire       [3:0]    tmp_bju_ctrl_data_8;
  wire       [3:0]    tmp_bju_ctrl_data_9;
  wire       [39:0]   bju_ctrl_data;
  wire                tmp_bju_ctrl_op;
  wire                tmp_bju_ctrl_op_1;
  wire                tmp_bju_ctrl_op_2;
  wire                tmp_bju_ctrl_op_3;
  wire                tmp_bju_ctrl_op_4;
  wire                tmp_bju_ctrl_op_5;
  wire                tmp_bju_ctrl_op_6;
  wire                tmp_bju_ctrl_op_7;
  wire                tmp_bju_ctrl_op_8;
  wire                tmp_bju_ctrl_op_9;
  wire       [3:0]    bju_ctrl_op;
  wire       [8:0]    exp_ctrl_sel;
  wire       [3:0]    tmp_exp_ctrl_data;
  wire       [3:0]    tmp_exp_ctrl_data_1;
  wire       [3:0]    tmp_exp_ctrl_data_2;
  wire       [3:0]    tmp_exp_ctrl_data_3;
  wire       [3:0]    tmp_exp_ctrl_data_4;
  wire       [3:0]    tmp_exp_ctrl_data_5;
  wire       [3:0]    tmp_exp_ctrl_data_6;
  wire       [3:0]    tmp_exp_ctrl_data_7;
  wire       [3:0]    tmp_exp_ctrl_data_8;
  wire       [35:0]   exp_ctrl_data;
  wire                tmp_exp_ctrl_op;
  wire                tmp_exp_ctrl_op_1;
  wire                tmp_exp_ctrl_op_2;
  wire                tmp_exp_ctrl_op_3;
  wire                tmp_exp_ctrl_op_4;
  wire                tmp_exp_ctrl_op_5;
  wire                tmp_exp_ctrl_op_6;
  wire                tmp_exp_ctrl_op_7;
  wire                tmp_exp_ctrl_op_8;
  wire       [3:0]    exp_ctrl_op;
  wire       [10:0]   lsu_ctrl_sel;
  wire       [3:0]    tmp_lsu_ctrl_data;
  wire       [3:0]    tmp_lsu_ctrl_data_1;
  wire       [3:0]    tmp_lsu_ctrl_data_2;
  wire       [3:0]    tmp_lsu_ctrl_data_3;
  wire       [3:0]    tmp_lsu_ctrl_data_4;
  wire       [3:0]    tmp_lsu_ctrl_data_5;
  wire       [3:0]    tmp_lsu_ctrl_data_6;
  wire       [3:0]    tmp_lsu_ctrl_data_7;
  wire       [3:0]    tmp_lsu_ctrl_data_8;
  wire       [3:0]    tmp_lsu_ctrl_data_9;
  wire       [3:0]    tmp_lsu_ctrl_data_10;
  wire       [43:0]   lsu_ctrl_data;
  wire                tmp_lsu_ctrl_op;
  wire                tmp_lsu_ctrl_op_1;
  wire                tmp_lsu_ctrl_op_2;
  wire                tmp_lsu_ctrl_op_3;
  wire                tmp_lsu_ctrl_op_4;
  wire                tmp_lsu_ctrl_op_5;
  wire                tmp_lsu_ctrl_op_6;
  wire                tmp_lsu_ctrl_op_7;
  wire                tmp_lsu_ctrl_op_8;
  wire                tmp_lsu_ctrl_op_9;
  wire                tmp_lsu_ctrl_op_10;
  wire       [3:0]    lsu_ctrl_op;
  wire                rd_wen;
  wire                src2_is_imm;
  wire       [4:0]    tmp_alu_micro_op_alu_ctrl_op;
  wire       [3:0]    tmp_lsu_micro_op_lsu_ctrl_op;
  wire       [3:0]    tmp_bju_micro_op_bju_ctrl_op;
  wire       [3:0]    tmp_bju_micro_op_exp_ctrl_op;
  `ifndef SYNTHESIS
  reg [47:0] alu_micro_op_alu_ctrl_op_string;
  reg [31:0] lsu_micro_op_lsu_ctrl_op_string;
  reg [39:0] bju_micro_op_bju_ctrl_op_string;
  reg [47:0] bju_micro_op_exp_ctrl_op_string;
  reg [47:0] tmp_alu_ctrl_data_string;
  reg [47:0] tmp_alu_ctrl_data_1_string;
  reg [47:0] tmp_alu_ctrl_data_2_string;
  reg [47:0] tmp_alu_ctrl_data_3_string;
  reg [47:0] tmp_alu_ctrl_data_4_string;
  reg [47:0] tmp_alu_ctrl_data_5_string;
  reg [47:0] tmp_alu_ctrl_data_6_string;
  reg [47:0] tmp_alu_ctrl_data_7_string;
  reg [47:0] tmp_alu_ctrl_data_8_string;
  reg [47:0] tmp_alu_ctrl_data_9_string;
  reg [47:0] tmp_alu_ctrl_data_10_string;
  reg [47:0] tmp_alu_ctrl_data_11_string;
  reg [47:0] tmp_alu_ctrl_data_12_string;
  reg [47:0] tmp_alu_ctrl_data_13_string;
  reg [47:0] tmp_alu_ctrl_data_14_string;
  reg [47:0] tmp_alu_ctrl_data_15_string;
  reg [47:0] tmp_alu_ctrl_data_16_string;
  reg [47:0] tmp_alu_ctrl_data_17_string;
  reg [47:0] tmp_alu_ctrl_data_18_string;
  reg [47:0] tmp_alu_ctrl_data_19_string;
  reg [47:0] tmp_alu_ctrl_data_20_string;
  reg [47:0] tmp_alu_ctrl_data_21_string;
  reg [47:0] tmp_alu_ctrl_data_22_string;
  reg [47:0] tmp_alu_ctrl_data_23_string;
  reg [39:0] tmp_bju_ctrl_data_string;
  reg [39:0] tmp_bju_ctrl_data_1_string;
  reg [39:0] tmp_bju_ctrl_data_2_string;
  reg [39:0] tmp_bju_ctrl_data_3_string;
  reg [39:0] tmp_bju_ctrl_data_4_string;
  reg [39:0] tmp_bju_ctrl_data_5_string;
  reg [39:0] tmp_bju_ctrl_data_6_string;
  reg [39:0] tmp_bju_ctrl_data_7_string;
  reg [39:0] tmp_bju_ctrl_data_8_string;
  reg [39:0] tmp_bju_ctrl_data_9_string;
  reg [47:0] tmp_exp_ctrl_data_string;
  reg [47:0] tmp_exp_ctrl_data_1_string;
  reg [47:0] tmp_exp_ctrl_data_2_string;
  reg [47:0] tmp_exp_ctrl_data_3_string;
  reg [47:0] tmp_exp_ctrl_data_4_string;
  reg [47:0] tmp_exp_ctrl_data_5_string;
  reg [47:0] tmp_exp_ctrl_data_6_string;
  reg [47:0] tmp_exp_ctrl_data_7_string;
  reg [47:0] tmp_exp_ctrl_data_8_string;
  reg [31:0] tmp_lsu_ctrl_data_string;
  reg [31:0] tmp_lsu_ctrl_data_1_string;
  reg [31:0] tmp_lsu_ctrl_data_2_string;
  reg [31:0] tmp_lsu_ctrl_data_3_string;
  reg [31:0] tmp_lsu_ctrl_data_4_string;
  reg [31:0] tmp_lsu_ctrl_data_5_string;
  reg [31:0] tmp_lsu_ctrl_data_6_string;
  reg [31:0] tmp_lsu_ctrl_data_7_string;
  reg [31:0] tmp_lsu_ctrl_data_8_string;
  reg [31:0] tmp_lsu_ctrl_data_9_string;
  reg [31:0] tmp_lsu_ctrl_data_10_string;
  reg [47:0] tmp_alu_micro_op_alu_ctrl_op_string;
  reg [31:0] tmp_lsu_micro_op_lsu_ctrl_op_string;
  reg [39:0] tmp_bju_micro_op_bju_ctrl_op_string;
  reg [47:0] tmp_bju_micro_op_exp_ctrl_op_string;
  `endif


  assign tmp_tmp_imm_data = {instr[31 : 12],12'h0};
  assign tmp_tmp_imm_data_2 = {{{instr[31],instr[19 : 12]},instr[20]},instr[30 : 21]};
  assign tmp_tmp_imm_data_4 = {{{instr[31],instr[7]},instr[30 : 25]},instr[11 : 8]};
  assign tmp_tmp_imm_data_6 = {instr[31 : 25],instr[11 : 7]};
  assign tmp_imm_data_10 = instr[31 : 12];
  assign tmp_imm_data_11 = 12'h0;
  assign tmp_imm_data_12 = {{{instr[31],instr[19 : 12]},instr[20]},instr[30 : 21]};
  assign tmp_imm_data_13 = 1'b0;
  assign tmp_imm_data_14 = {{instr[31],instr[7]},instr[30 : 25]};
  assign tmp_imm_data_15 = instr[11 : 8];
  assign tmp_imm_type = (instr[6 : 0] == 7'h37);
  assign tmp_imm_type_1 = (instr[6 : 0] == 7'h17);
  assign tmp_imm_type_2 = instr[6 : 0];
  assign tmp_imm_type_3 = 7'h6f;
  assign tmp_imm_type_4 = instr[6 : 0];
  assign tmp_imm_type_5 = 7'h13;
  assign tmp_imm_type_6 = instr[6 : 0];
  assign tmp_imm_type_7 = 7'h1b;
  assign tmp_imm_6 = (imm_data[63 : 0] & {tmp_imm,{tmp_imm_7,tmp_imm_8}});
  assign tmp_imm_47 = (imm_data[127 : 64] & {tmp_imm_1,{tmp_imm_48,tmp_imm_49}});
  assign tmp_imm_88 = imm_data[191 : 128];
  assign tmp_imm_89 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_90,tmp_imm_91}}};
  assign tmp_imm_130 = tmp_imm_3;
  assign tmp_imm_131 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_132,tmp_imm_133}}};
  assign tmp_imm_172 = tmp_imm_4;
  assign tmp_imm_173 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_174,tmp_imm_175}}};
  assign tmp_imm_214 = tmp_imm_5;
  assign tmp_imm_215 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_216,tmp_imm_217}}};
  assign tmp_imm_7 = tmp_imm;
  assign tmp_imm_8 = {tmp_imm,{tmp_imm,{tmp_imm_9,tmp_imm_10}}};
  assign tmp_imm_48 = tmp_imm_1;
  assign tmp_imm_49 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_50,tmp_imm_51}}};
  assign tmp_imm_90 = tmp_imm_2;
  assign tmp_imm_91 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_92,tmp_imm_93}}};
  assign tmp_imm_132 = tmp_imm_3;
  assign tmp_imm_133 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_134,tmp_imm_135}}};
  assign tmp_imm_174 = tmp_imm_4;
  assign tmp_imm_175 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_176,tmp_imm_177}}};
  assign tmp_imm_216 = tmp_imm_5;
  assign tmp_imm_217 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_218,tmp_imm_219}}};
  assign tmp_imm_9 = tmp_imm;
  assign tmp_imm_10 = {tmp_imm,{tmp_imm,{tmp_imm_11,tmp_imm_12}}};
  assign tmp_imm_50 = tmp_imm_1;
  assign tmp_imm_51 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_52,tmp_imm_53}}};
  assign tmp_imm_92 = tmp_imm_2;
  assign tmp_imm_93 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_94,tmp_imm_95}}};
  assign tmp_imm_134 = tmp_imm_3;
  assign tmp_imm_135 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_136,tmp_imm_137}}};
  assign tmp_imm_176 = tmp_imm_4;
  assign tmp_imm_177 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_178,tmp_imm_179}}};
  assign tmp_imm_218 = tmp_imm_5;
  assign tmp_imm_219 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_220,tmp_imm_221}}};
  assign tmp_imm_11 = tmp_imm;
  assign tmp_imm_12 = {tmp_imm,{tmp_imm,{tmp_imm_13,tmp_imm_14}}};
  assign tmp_imm_52 = tmp_imm_1;
  assign tmp_imm_53 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_54,tmp_imm_55}}};
  assign tmp_imm_94 = tmp_imm_2;
  assign tmp_imm_95 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_96,tmp_imm_97}}};
  assign tmp_imm_136 = tmp_imm_3;
  assign tmp_imm_137 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_138,tmp_imm_139}}};
  assign tmp_imm_178 = tmp_imm_4;
  assign tmp_imm_179 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_180,tmp_imm_181}}};
  assign tmp_imm_220 = tmp_imm_5;
  assign tmp_imm_221 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_222,tmp_imm_223}}};
  assign tmp_imm_13 = tmp_imm;
  assign tmp_imm_14 = {tmp_imm,{tmp_imm,{tmp_imm_15,tmp_imm_16}}};
  assign tmp_imm_54 = tmp_imm_1;
  assign tmp_imm_55 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_56,tmp_imm_57}}};
  assign tmp_imm_96 = tmp_imm_2;
  assign tmp_imm_97 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_98,tmp_imm_99}}};
  assign tmp_imm_138 = tmp_imm_3;
  assign tmp_imm_139 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_140,tmp_imm_141}}};
  assign tmp_imm_180 = tmp_imm_4;
  assign tmp_imm_181 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_182,tmp_imm_183}}};
  assign tmp_imm_222 = tmp_imm_5;
  assign tmp_imm_223 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_224,tmp_imm_225}}};
  assign tmp_imm_15 = tmp_imm;
  assign tmp_imm_16 = {tmp_imm,{tmp_imm,{tmp_imm_17,tmp_imm_18}}};
  assign tmp_imm_56 = tmp_imm_1;
  assign tmp_imm_57 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_58,tmp_imm_59}}};
  assign tmp_imm_98 = tmp_imm_2;
  assign tmp_imm_99 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_100,tmp_imm_101}}};
  assign tmp_imm_140 = tmp_imm_3;
  assign tmp_imm_141 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_142,tmp_imm_143}}};
  assign tmp_imm_182 = tmp_imm_4;
  assign tmp_imm_183 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_184,tmp_imm_185}}};
  assign tmp_imm_224 = tmp_imm_5;
  assign tmp_imm_225 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_226,tmp_imm_227}}};
  assign tmp_imm_17 = tmp_imm;
  assign tmp_imm_18 = {tmp_imm,{tmp_imm,{tmp_imm_19,tmp_imm_20}}};
  assign tmp_imm_58 = tmp_imm_1;
  assign tmp_imm_59 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_60,tmp_imm_61}}};
  assign tmp_imm_100 = tmp_imm_2;
  assign tmp_imm_101 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_102,tmp_imm_103}}};
  assign tmp_imm_142 = tmp_imm_3;
  assign tmp_imm_143 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_144,tmp_imm_145}}};
  assign tmp_imm_184 = tmp_imm_4;
  assign tmp_imm_185 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_186,tmp_imm_187}}};
  assign tmp_imm_226 = tmp_imm_5;
  assign tmp_imm_227 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_228,tmp_imm_229}}};
  assign tmp_imm_19 = tmp_imm;
  assign tmp_imm_20 = {tmp_imm,{tmp_imm,{tmp_imm_21,tmp_imm_22}}};
  assign tmp_imm_60 = tmp_imm_1;
  assign tmp_imm_61 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_62,tmp_imm_63}}};
  assign tmp_imm_102 = tmp_imm_2;
  assign tmp_imm_103 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_104,tmp_imm_105}}};
  assign tmp_imm_144 = tmp_imm_3;
  assign tmp_imm_145 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_146,tmp_imm_147}}};
  assign tmp_imm_186 = tmp_imm_4;
  assign tmp_imm_187 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_188,tmp_imm_189}}};
  assign tmp_imm_228 = tmp_imm_5;
  assign tmp_imm_229 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_230,tmp_imm_231}}};
  assign tmp_imm_21 = tmp_imm;
  assign tmp_imm_22 = {tmp_imm,{tmp_imm,{tmp_imm_23,tmp_imm_24}}};
  assign tmp_imm_62 = tmp_imm_1;
  assign tmp_imm_63 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_64,tmp_imm_65}}};
  assign tmp_imm_104 = tmp_imm_2;
  assign tmp_imm_105 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_106,tmp_imm_107}}};
  assign tmp_imm_146 = tmp_imm_3;
  assign tmp_imm_147 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_148,tmp_imm_149}}};
  assign tmp_imm_188 = tmp_imm_4;
  assign tmp_imm_189 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_190,tmp_imm_191}}};
  assign tmp_imm_230 = tmp_imm_5;
  assign tmp_imm_231 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_232,tmp_imm_233}}};
  assign tmp_imm_23 = tmp_imm;
  assign tmp_imm_24 = {tmp_imm,{tmp_imm,{tmp_imm_25,tmp_imm_26}}};
  assign tmp_imm_64 = tmp_imm_1;
  assign tmp_imm_65 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_66,tmp_imm_67}}};
  assign tmp_imm_106 = tmp_imm_2;
  assign tmp_imm_107 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_108,tmp_imm_109}}};
  assign tmp_imm_148 = tmp_imm_3;
  assign tmp_imm_149 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_150,tmp_imm_151}}};
  assign tmp_imm_190 = tmp_imm_4;
  assign tmp_imm_191 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_192,tmp_imm_193}}};
  assign tmp_imm_232 = tmp_imm_5;
  assign tmp_imm_233 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_234,tmp_imm_235}}};
  assign tmp_imm_25 = tmp_imm;
  assign tmp_imm_26 = {tmp_imm,{tmp_imm,{tmp_imm_27,tmp_imm_28}}};
  assign tmp_imm_66 = tmp_imm_1;
  assign tmp_imm_67 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_68,tmp_imm_69}}};
  assign tmp_imm_108 = tmp_imm_2;
  assign tmp_imm_109 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_110,tmp_imm_111}}};
  assign tmp_imm_150 = tmp_imm_3;
  assign tmp_imm_151 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_152,tmp_imm_153}}};
  assign tmp_imm_192 = tmp_imm_4;
  assign tmp_imm_193 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_194,tmp_imm_195}}};
  assign tmp_imm_234 = tmp_imm_5;
  assign tmp_imm_235 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_236,tmp_imm_237}}};
  assign tmp_imm_27 = tmp_imm;
  assign tmp_imm_28 = {tmp_imm,{tmp_imm,{tmp_imm_29,tmp_imm_30}}};
  assign tmp_imm_68 = tmp_imm_1;
  assign tmp_imm_69 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_70,tmp_imm_71}}};
  assign tmp_imm_110 = tmp_imm_2;
  assign tmp_imm_111 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_112,tmp_imm_113}}};
  assign tmp_imm_152 = tmp_imm_3;
  assign tmp_imm_153 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_154,tmp_imm_155}}};
  assign tmp_imm_194 = tmp_imm_4;
  assign tmp_imm_195 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_196,tmp_imm_197}}};
  assign tmp_imm_236 = tmp_imm_5;
  assign tmp_imm_237 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_238,tmp_imm_239}}};
  assign tmp_imm_29 = tmp_imm;
  assign tmp_imm_30 = {tmp_imm,{tmp_imm,{tmp_imm_31,tmp_imm_32}}};
  assign tmp_imm_70 = tmp_imm_1;
  assign tmp_imm_71 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_72,tmp_imm_73}}};
  assign tmp_imm_112 = tmp_imm_2;
  assign tmp_imm_113 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_114,tmp_imm_115}}};
  assign tmp_imm_154 = tmp_imm_3;
  assign tmp_imm_155 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_156,tmp_imm_157}}};
  assign tmp_imm_196 = tmp_imm_4;
  assign tmp_imm_197 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_198,tmp_imm_199}}};
  assign tmp_imm_238 = tmp_imm_5;
  assign tmp_imm_239 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_240,tmp_imm_241}}};
  assign tmp_imm_31 = tmp_imm;
  assign tmp_imm_32 = {tmp_imm,{tmp_imm,{tmp_imm_33,tmp_imm_34}}};
  assign tmp_imm_72 = tmp_imm_1;
  assign tmp_imm_73 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_74,tmp_imm_75}}};
  assign tmp_imm_114 = tmp_imm_2;
  assign tmp_imm_115 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_116,tmp_imm_117}}};
  assign tmp_imm_156 = tmp_imm_3;
  assign tmp_imm_157 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_158,tmp_imm_159}}};
  assign tmp_imm_198 = tmp_imm_4;
  assign tmp_imm_199 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_200,tmp_imm_201}}};
  assign tmp_imm_240 = tmp_imm_5;
  assign tmp_imm_241 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_242,tmp_imm_243}}};
  assign tmp_imm_33 = tmp_imm;
  assign tmp_imm_34 = {tmp_imm,{tmp_imm,{tmp_imm_35,tmp_imm_36}}};
  assign tmp_imm_74 = tmp_imm_1;
  assign tmp_imm_75 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_76,tmp_imm_77}}};
  assign tmp_imm_116 = tmp_imm_2;
  assign tmp_imm_117 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_118,tmp_imm_119}}};
  assign tmp_imm_158 = tmp_imm_3;
  assign tmp_imm_159 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_160,tmp_imm_161}}};
  assign tmp_imm_200 = tmp_imm_4;
  assign tmp_imm_201 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_202,tmp_imm_203}}};
  assign tmp_imm_242 = tmp_imm_5;
  assign tmp_imm_243 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_244,tmp_imm_245}}};
  assign tmp_imm_35 = tmp_imm;
  assign tmp_imm_36 = {tmp_imm,{tmp_imm,{tmp_imm_37,tmp_imm_38}}};
  assign tmp_imm_76 = tmp_imm_1;
  assign tmp_imm_77 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_78,tmp_imm_79}}};
  assign tmp_imm_118 = tmp_imm_2;
  assign tmp_imm_119 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_120,tmp_imm_121}}};
  assign tmp_imm_160 = tmp_imm_3;
  assign tmp_imm_161 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_162,tmp_imm_163}}};
  assign tmp_imm_202 = tmp_imm_4;
  assign tmp_imm_203 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_204,tmp_imm_205}}};
  assign tmp_imm_244 = tmp_imm_5;
  assign tmp_imm_245 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_246,tmp_imm_247}}};
  assign tmp_imm_37 = tmp_imm;
  assign tmp_imm_38 = {tmp_imm,{tmp_imm,{tmp_imm_39,tmp_imm_40}}};
  assign tmp_imm_78 = tmp_imm_1;
  assign tmp_imm_79 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_80,tmp_imm_81}}};
  assign tmp_imm_120 = tmp_imm_2;
  assign tmp_imm_121 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_122,tmp_imm_123}}};
  assign tmp_imm_162 = tmp_imm_3;
  assign tmp_imm_163 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_164,tmp_imm_165}}};
  assign tmp_imm_204 = tmp_imm_4;
  assign tmp_imm_205 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_206,tmp_imm_207}}};
  assign tmp_imm_246 = tmp_imm_5;
  assign tmp_imm_247 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_248,tmp_imm_249}}};
  assign tmp_imm_39 = tmp_imm;
  assign tmp_imm_40 = {tmp_imm,{tmp_imm,{tmp_imm_41,tmp_imm_42}}};
  assign tmp_imm_80 = tmp_imm_1;
  assign tmp_imm_81 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_82,tmp_imm_83}}};
  assign tmp_imm_122 = tmp_imm_2;
  assign tmp_imm_123 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_124,tmp_imm_125}}};
  assign tmp_imm_164 = tmp_imm_3;
  assign tmp_imm_165 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_166,tmp_imm_167}}};
  assign tmp_imm_206 = tmp_imm_4;
  assign tmp_imm_207 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_208,tmp_imm_209}}};
  assign tmp_imm_248 = tmp_imm_5;
  assign tmp_imm_249 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_250,tmp_imm_251}}};
  assign tmp_imm_41 = tmp_imm;
  assign tmp_imm_42 = {tmp_imm,{tmp_imm,{tmp_imm_43,tmp_imm_44}}};
  assign tmp_imm_82 = tmp_imm_1;
  assign tmp_imm_83 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_84,tmp_imm_85}}};
  assign tmp_imm_124 = tmp_imm_2;
  assign tmp_imm_125 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_126,tmp_imm_127}}};
  assign tmp_imm_166 = tmp_imm_3;
  assign tmp_imm_167 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_168,tmp_imm_169}}};
  assign tmp_imm_208 = tmp_imm_4;
  assign tmp_imm_209 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_210,tmp_imm_211}}};
  assign tmp_imm_250 = tmp_imm_5;
  assign tmp_imm_251 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_252,tmp_imm_253}}};
  assign tmp_imm_43 = tmp_imm;
  assign tmp_imm_44 = {tmp_imm,{tmp_imm,{tmp_imm_45,tmp_imm_46}}};
  assign tmp_imm_84 = tmp_imm_1;
  assign tmp_imm_85 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_86,tmp_imm_87}}};
  assign tmp_imm_126 = tmp_imm_2;
  assign tmp_imm_127 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_128,tmp_imm_129}}};
  assign tmp_imm_168 = tmp_imm_3;
  assign tmp_imm_169 = {tmp_imm_3,{tmp_imm_3,{tmp_imm_170,tmp_imm_171}}};
  assign tmp_imm_210 = tmp_imm_4;
  assign tmp_imm_211 = {tmp_imm_4,{tmp_imm_4,{tmp_imm_212,tmp_imm_213}}};
  assign tmp_imm_252 = tmp_imm_5;
  assign tmp_imm_253 = {tmp_imm_5,{tmp_imm_5,{tmp_imm_254,tmp_imm_255}}};
  assign tmp_imm_45 = tmp_imm;
  assign tmp_imm_46 = {tmp_imm,{tmp_imm,{tmp_imm,{tmp_imm,tmp_imm}}}};
  assign tmp_imm_86 = tmp_imm_1;
  assign tmp_imm_87 = {tmp_imm_1,{tmp_imm_1,{tmp_imm_1,{tmp_imm_1,tmp_imm_1}}}};
  assign tmp_imm_128 = tmp_imm_2;
  assign tmp_imm_129 = {tmp_imm_2,{tmp_imm_2,{tmp_imm_2,tmp_imm_2}}};
  assign tmp_imm_170 = tmp_imm_3;
  assign tmp_imm_171 = {tmp_imm_3,{tmp_imm_3,tmp_imm_3}};
  assign tmp_imm_212 = tmp_imm_4;
  assign tmp_imm_213 = {tmp_imm_4,tmp_imm_4};
  assign tmp_imm_254 = tmp_imm_5;
  assign tmp_imm_255 = tmp_imm_5;
  assign tmp_alu_ctrl_sel = {{{{{{{{{{{tmp_alu_ctrl_sel_1,tmp_alu_ctrl_sel_2},divw},mulw},remu},rem_1},divu},div},mulhu},mulhsu},mulh},mul};
  assign tmp_alu_ctrl_sel_3 = op_is_lui;
  assign tmp_alu_ctrl_sel_1 = {remuw,remw};
  assign tmp_alu_ctrl_sel_2 = divuw;
  assign tmp_alu_ctrl_data_24 = {{{{{{{{{{{tmp_alu_ctrl_data_25,tmp_alu_ctrl_data_26},tmp_alu_ctrl_data_3},tmp_alu_ctrl_data_4},tmp_alu_ctrl_data_5},tmp_alu_ctrl_data_6},tmp_alu_ctrl_data_7},tmp_alu_ctrl_data_8},tmp_alu_ctrl_data_9},tmp_alu_ctrl_data_10},tmp_alu_ctrl_data_11},tmp_alu_ctrl_data_12};
  assign tmp_alu_ctrl_data_27 = tmp_alu_ctrl_data_13;
  assign tmp_alu_ctrl_data_25 = {tmp_alu_ctrl_data,tmp_alu_ctrl_data_1};
  assign tmp_alu_ctrl_data_26 = tmp_alu_ctrl_data_2;
  assign tmp_alu_ctrl_op_24 = (((tmp_alu_ctrl_op_25 | tmp_alu_ctrl_op_88) | (tmp_alu_ctrl_op_91 & tmp_alu_ctrl_op_92)) | (alu_ctrl_data[94 : 90] & {tmp_alu_ctrl_op_95,tmp_alu_ctrl_op_96}));
  assign tmp_alu_ctrl_op_99 = (alu_ctrl_data[99 : 95] & {tmp_alu_ctrl_op_19,{tmp_alu_ctrl_op_100,tmp_alu_ctrl_op_101}});
  assign tmp_alu_ctrl_op_102 = alu_ctrl_data[104 : 100];
  assign tmp_alu_ctrl_op_103 = {tmp_alu_ctrl_op_20,{tmp_alu_ctrl_op_20,{tmp_alu_ctrl_op_104,tmp_alu_ctrl_op_105}}};
  assign tmp_alu_ctrl_op_106 = tmp_alu_ctrl_op_21;
  assign tmp_alu_ctrl_op_107 = {tmp_alu_ctrl_op_21,{tmp_alu_ctrl_op_21,{tmp_alu_ctrl_op_108,tmp_alu_ctrl_op_109}}};
  assign tmp_alu_ctrl_op_110 = tmp_alu_ctrl_op_22;
  assign tmp_alu_ctrl_op_111 = {tmp_alu_ctrl_op_22,{tmp_alu_ctrl_op_22,tmp_alu_ctrl_op_22}};
  assign tmp_alu_ctrl_op_112 = tmp_alu_ctrl_op_23;
  assign tmp_alu_ctrl_op_113 = {tmp_alu_ctrl_op_23,tmp_alu_ctrl_op_23};
  assign tmp_alu_ctrl_op_25 = (((tmp_alu_ctrl_op_26 | tmp_alu_ctrl_op_77) | (tmp_alu_ctrl_op_80 & tmp_alu_ctrl_op_81)) | (alu_ctrl_data[79 : 75] & {tmp_alu_ctrl_op_84,tmp_alu_ctrl_op_85}));
  assign tmp_alu_ctrl_op_88 = (alu_ctrl_data[84 : 80] & {tmp_alu_ctrl_op_16,{tmp_alu_ctrl_op_89,tmp_alu_ctrl_op_90}});
  assign tmp_alu_ctrl_op_91 = alu_ctrl_data[89 : 85];
  assign tmp_alu_ctrl_op_92 = {tmp_alu_ctrl_op_17,{tmp_alu_ctrl_op_17,{tmp_alu_ctrl_op_93,tmp_alu_ctrl_op_94}}};
  assign tmp_alu_ctrl_op_95 = tmp_alu_ctrl_op_18;
  assign tmp_alu_ctrl_op_96 = {tmp_alu_ctrl_op_18,{tmp_alu_ctrl_op_18,{tmp_alu_ctrl_op_97,tmp_alu_ctrl_op_98}}};
  assign tmp_alu_ctrl_op_100 = tmp_alu_ctrl_op_19;
  assign tmp_alu_ctrl_op_101 = {tmp_alu_ctrl_op_19,{tmp_alu_ctrl_op_19,tmp_alu_ctrl_op_19}};
  assign tmp_alu_ctrl_op_104 = tmp_alu_ctrl_op_20;
  assign tmp_alu_ctrl_op_105 = {tmp_alu_ctrl_op_20,tmp_alu_ctrl_op_20};
  assign tmp_alu_ctrl_op_108 = tmp_alu_ctrl_op_21;
  assign tmp_alu_ctrl_op_109 = tmp_alu_ctrl_op_21;
  assign tmp_alu_ctrl_op_26 = (((tmp_alu_ctrl_op_27 | tmp_alu_ctrl_op_66) | (tmp_alu_ctrl_op_69 & tmp_alu_ctrl_op_70)) | (alu_ctrl_data[64 : 60] & {tmp_alu_ctrl_op_73,tmp_alu_ctrl_op_74}));
  assign tmp_alu_ctrl_op_77 = (alu_ctrl_data[69 : 65] & {tmp_alu_ctrl_op_13,{tmp_alu_ctrl_op_78,tmp_alu_ctrl_op_79}});
  assign tmp_alu_ctrl_op_80 = alu_ctrl_data[74 : 70];
  assign tmp_alu_ctrl_op_81 = {tmp_alu_ctrl_op_14,{tmp_alu_ctrl_op_14,{tmp_alu_ctrl_op_82,tmp_alu_ctrl_op_83}}};
  assign tmp_alu_ctrl_op_84 = tmp_alu_ctrl_op_15;
  assign tmp_alu_ctrl_op_85 = {tmp_alu_ctrl_op_15,{tmp_alu_ctrl_op_15,{tmp_alu_ctrl_op_86,tmp_alu_ctrl_op_87}}};
  assign tmp_alu_ctrl_op_89 = tmp_alu_ctrl_op_16;
  assign tmp_alu_ctrl_op_90 = {tmp_alu_ctrl_op_16,{tmp_alu_ctrl_op_16,tmp_alu_ctrl_op_16}};
  assign tmp_alu_ctrl_op_93 = tmp_alu_ctrl_op_17;
  assign tmp_alu_ctrl_op_94 = {tmp_alu_ctrl_op_17,tmp_alu_ctrl_op_17};
  assign tmp_alu_ctrl_op_97 = tmp_alu_ctrl_op_18;
  assign tmp_alu_ctrl_op_98 = tmp_alu_ctrl_op_18;
  assign tmp_alu_ctrl_op_27 = (((tmp_alu_ctrl_op_28 | tmp_alu_ctrl_op_55) | (tmp_alu_ctrl_op_58 & tmp_alu_ctrl_op_59)) | (alu_ctrl_data[49 : 45] & {tmp_alu_ctrl_op_62,tmp_alu_ctrl_op_63}));
  assign tmp_alu_ctrl_op_66 = (alu_ctrl_data[54 : 50] & {tmp_alu_ctrl_op_10,{tmp_alu_ctrl_op_67,tmp_alu_ctrl_op_68}});
  assign tmp_alu_ctrl_op_69 = alu_ctrl_data[59 : 55];
  assign tmp_alu_ctrl_op_70 = {tmp_alu_ctrl_op_11,{tmp_alu_ctrl_op_11,{tmp_alu_ctrl_op_71,tmp_alu_ctrl_op_72}}};
  assign tmp_alu_ctrl_op_73 = tmp_alu_ctrl_op_12;
  assign tmp_alu_ctrl_op_74 = {tmp_alu_ctrl_op_12,{tmp_alu_ctrl_op_12,{tmp_alu_ctrl_op_75,tmp_alu_ctrl_op_76}}};
  assign tmp_alu_ctrl_op_78 = tmp_alu_ctrl_op_13;
  assign tmp_alu_ctrl_op_79 = {tmp_alu_ctrl_op_13,{tmp_alu_ctrl_op_13,tmp_alu_ctrl_op_13}};
  assign tmp_alu_ctrl_op_82 = tmp_alu_ctrl_op_14;
  assign tmp_alu_ctrl_op_83 = {tmp_alu_ctrl_op_14,tmp_alu_ctrl_op_14};
  assign tmp_alu_ctrl_op_86 = tmp_alu_ctrl_op_15;
  assign tmp_alu_ctrl_op_87 = tmp_alu_ctrl_op_15;
  assign tmp_alu_ctrl_op_28 = (((tmp_alu_ctrl_op_29 | tmp_alu_ctrl_op_44) | (tmp_alu_ctrl_op_47 & tmp_alu_ctrl_op_48)) | (alu_ctrl_data[34 : 30] & {tmp_alu_ctrl_op_51,tmp_alu_ctrl_op_52}));
  assign tmp_alu_ctrl_op_55 = (alu_ctrl_data[39 : 35] & {tmp_alu_ctrl_op_7,{tmp_alu_ctrl_op_56,tmp_alu_ctrl_op_57}});
  assign tmp_alu_ctrl_op_58 = alu_ctrl_data[44 : 40];
  assign tmp_alu_ctrl_op_59 = {tmp_alu_ctrl_op_8,{tmp_alu_ctrl_op_8,{tmp_alu_ctrl_op_60,tmp_alu_ctrl_op_61}}};
  assign tmp_alu_ctrl_op_62 = tmp_alu_ctrl_op_9;
  assign tmp_alu_ctrl_op_63 = {tmp_alu_ctrl_op_9,{tmp_alu_ctrl_op_9,{tmp_alu_ctrl_op_64,tmp_alu_ctrl_op_65}}};
  assign tmp_alu_ctrl_op_67 = tmp_alu_ctrl_op_10;
  assign tmp_alu_ctrl_op_68 = {tmp_alu_ctrl_op_10,{tmp_alu_ctrl_op_10,tmp_alu_ctrl_op_10}};
  assign tmp_alu_ctrl_op_71 = tmp_alu_ctrl_op_11;
  assign tmp_alu_ctrl_op_72 = {tmp_alu_ctrl_op_11,tmp_alu_ctrl_op_11};
  assign tmp_alu_ctrl_op_75 = tmp_alu_ctrl_op_12;
  assign tmp_alu_ctrl_op_76 = tmp_alu_ctrl_op_12;
  assign tmp_alu_ctrl_op_29 = (((tmp_alu_ctrl_op_30 | tmp_alu_ctrl_op_33) | (tmp_alu_ctrl_op_36 & tmp_alu_ctrl_op_37)) | (alu_ctrl_data[19 : 15] & {tmp_alu_ctrl_op_40,tmp_alu_ctrl_op_41}));
  assign tmp_alu_ctrl_op_44 = (alu_ctrl_data[24 : 20] & {tmp_alu_ctrl_op_4,{tmp_alu_ctrl_op_45,tmp_alu_ctrl_op_46}});
  assign tmp_alu_ctrl_op_47 = alu_ctrl_data[29 : 25];
  assign tmp_alu_ctrl_op_48 = {tmp_alu_ctrl_op_5,{tmp_alu_ctrl_op_5,{tmp_alu_ctrl_op_49,tmp_alu_ctrl_op_50}}};
  assign tmp_alu_ctrl_op_51 = tmp_alu_ctrl_op_6;
  assign tmp_alu_ctrl_op_52 = {tmp_alu_ctrl_op_6,{tmp_alu_ctrl_op_6,{tmp_alu_ctrl_op_53,tmp_alu_ctrl_op_54}}};
  assign tmp_alu_ctrl_op_56 = tmp_alu_ctrl_op_7;
  assign tmp_alu_ctrl_op_57 = {tmp_alu_ctrl_op_7,{tmp_alu_ctrl_op_7,tmp_alu_ctrl_op_7}};
  assign tmp_alu_ctrl_op_60 = tmp_alu_ctrl_op_8;
  assign tmp_alu_ctrl_op_61 = {tmp_alu_ctrl_op_8,tmp_alu_ctrl_op_8};
  assign tmp_alu_ctrl_op_64 = tmp_alu_ctrl_op_9;
  assign tmp_alu_ctrl_op_65 = tmp_alu_ctrl_op_9;
  assign tmp_alu_ctrl_op_30 = (alu_ctrl_data[4 : 0] & {tmp_alu_ctrl_op,{tmp_alu_ctrl_op_31,tmp_alu_ctrl_op_32}});
  assign tmp_alu_ctrl_op_33 = (alu_ctrl_data[9 : 5] & {tmp_alu_ctrl_op_1,{tmp_alu_ctrl_op_34,tmp_alu_ctrl_op_35}});
  assign tmp_alu_ctrl_op_36 = alu_ctrl_data[14 : 10];
  assign tmp_alu_ctrl_op_37 = {tmp_alu_ctrl_op_2,{tmp_alu_ctrl_op_2,{tmp_alu_ctrl_op_38,tmp_alu_ctrl_op_39}}};
  assign tmp_alu_ctrl_op_40 = tmp_alu_ctrl_op_3;
  assign tmp_alu_ctrl_op_41 = {tmp_alu_ctrl_op_3,{tmp_alu_ctrl_op_3,{tmp_alu_ctrl_op_42,tmp_alu_ctrl_op_43}}};
  assign tmp_alu_ctrl_op_45 = tmp_alu_ctrl_op_4;
  assign tmp_alu_ctrl_op_46 = {tmp_alu_ctrl_op_4,{tmp_alu_ctrl_op_4,tmp_alu_ctrl_op_4}};
  assign tmp_alu_ctrl_op_49 = tmp_alu_ctrl_op_5;
  assign tmp_alu_ctrl_op_50 = {tmp_alu_ctrl_op_5,tmp_alu_ctrl_op_5};
  assign tmp_alu_ctrl_op_53 = tmp_alu_ctrl_op_6;
  assign tmp_alu_ctrl_op_54 = tmp_alu_ctrl_op_6;
  assign tmp_alu_ctrl_op_31 = tmp_alu_ctrl_op;
  assign tmp_alu_ctrl_op_32 = {tmp_alu_ctrl_op,{tmp_alu_ctrl_op,tmp_alu_ctrl_op}};
  assign tmp_alu_ctrl_op_34 = tmp_alu_ctrl_op_1;
  assign tmp_alu_ctrl_op_35 = {tmp_alu_ctrl_op_1,{tmp_alu_ctrl_op_1,tmp_alu_ctrl_op_1}};
  assign tmp_alu_ctrl_op_38 = tmp_alu_ctrl_op_2;
  assign tmp_alu_ctrl_op_39 = {tmp_alu_ctrl_op_2,tmp_alu_ctrl_op_2};
  assign tmp_alu_ctrl_op_42 = tmp_alu_ctrl_op_3;
  assign tmp_alu_ctrl_op_43 = tmp_alu_ctrl_op_3;
  assign tmp_bju_ctrl_op_10 = (((tmp_bju_ctrl_op_11 | tmp_bju_ctrl_op_16) | (tmp_bju_ctrl_op_19 & tmp_bju_ctrl_op_20)) | (bju_ctrl_data[19 : 16] & {tmp_bju_ctrl_op_23,tmp_bju_ctrl_op_24}));
  assign tmp_bju_ctrl_op_25 = (bju_ctrl_data[23 : 20] & {tmp_bju_ctrl_op_5,{tmp_bju_ctrl_op_26,tmp_bju_ctrl_op_27}});
  assign tmp_bju_ctrl_op_28 = bju_ctrl_data[27 : 24];
  assign tmp_bju_ctrl_op_29 = {tmp_bju_ctrl_op_6,{tmp_bju_ctrl_op_6,{tmp_bju_ctrl_op_30,tmp_bju_ctrl_op_31}}};
  assign tmp_bju_ctrl_op_32 = tmp_bju_ctrl_op_7;
  assign tmp_bju_ctrl_op_33 = {tmp_bju_ctrl_op_7,{tmp_bju_ctrl_op_7,tmp_bju_ctrl_op_7}};
  assign tmp_bju_ctrl_op_34 = tmp_bju_ctrl_op_8;
  assign tmp_bju_ctrl_op_35 = {tmp_bju_ctrl_op_8,tmp_bju_ctrl_op_8};
  assign tmp_bju_ctrl_op_36 = tmp_bju_ctrl_op_9;
  assign tmp_bju_ctrl_op_37 = tmp_bju_ctrl_op_9;
  assign tmp_bju_ctrl_op_11 = ((bju_ctrl_data[3 : 0] & {tmp_bju_ctrl_op_12,tmp_bju_ctrl_op_13}) | (bju_ctrl_data[7 : 4] & {tmp_bju_ctrl_op_14,tmp_bju_ctrl_op_15}));
  assign tmp_bju_ctrl_op_16 = (bju_ctrl_data[11 : 8] & {tmp_bju_ctrl_op_2,{tmp_bju_ctrl_op_17,tmp_bju_ctrl_op_18}});
  assign tmp_bju_ctrl_op_19 = bju_ctrl_data[15 : 12];
  assign tmp_bju_ctrl_op_20 = {tmp_bju_ctrl_op_3,{tmp_bju_ctrl_op_3,{tmp_bju_ctrl_op_21,tmp_bju_ctrl_op_22}}};
  assign tmp_bju_ctrl_op_23 = tmp_bju_ctrl_op_4;
  assign tmp_bju_ctrl_op_24 = {tmp_bju_ctrl_op_4,{tmp_bju_ctrl_op_4,tmp_bju_ctrl_op_4}};
  assign tmp_bju_ctrl_op_26 = tmp_bju_ctrl_op_5;
  assign tmp_bju_ctrl_op_27 = {tmp_bju_ctrl_op_5,tmp_bju_ctrl_op_5};
  assign tmp_bju_ctrl_op_30 = tmp_bju_ctrl_op_6;
  assign tmp_bju_ctrl_op_31 = tmp_bju_ctrl_op_6;
  assign tmp_bju_ctrl_op_12 = tmp_bju_ctrl_op;
  assign tmp_bju_ctrl_op_13 = {tmp_bju_ctrl_op,{tmp_bju_ctrl_op,tmp_bju_ctrl_op}};
  assign tmp_bju_ctrl_op_14 = tmp_bju_ctrl_op_1;
  assign tmp_bju_ctrl_op_15 = {tmp_bju_ctrl_op_1,{tmp_bju_ctrl_op_1,tmp_bju_ctrl_op_1}};
  assign tmp_bju_ctrl_op_17 = tmp_bju_ctrl_op_2;
  assign tmp_bju_ctrl_op_18 = {tmp_bju_ctrl_op_2,tmp_bju_ctrl_op_2};
  assign tmp_bju_ctrl_op_21 = tmp_bju_ctrl_op_3;
  assign tmp_bju_ctrl_op_22 = tmp_bju_ctrl_op_3;
  assign tmp_exp_ctrl_op_9 = (((tmp_exp_ctrl_op_10 | tmp_exp_ctrl_op_13) | (tmp_exp_ctrl_op_16 & tmp_exp_ctrl_op_17)) | (exp_ctrl_data[15 : 12] & {tmp_exp_ctrl_op_20,tmp_exp_ctrl_op_21}));
  assign tmp_exp_ctrl_op_22 = (exp_ctrl_data[19 : 16] & {tmp_exp_ctrl_op_4,{tmp_exp_ctrl_op_23,tmp_exp_ctrl_op_24}});
  assign tmp_exp_ctrl_op_25 = exp_ctrl_data[23 : 20];
  assign tmp_exp_ctrl_op_26 = {tmp_exp_ctrl_op_5,{tmp_exp_ctrl_op_5,{tmp_exp_ctrl_op_27,tmp_exp_ctrl_op_28}}};
  assign tmp_exp_ctrl_op_29 = tmp_exp_ctrl_op_6;
  assign tmp_exp_ctrl_op_30 = {tmp_exp_ctrl_op_6,{tmp_exp_ctrl_op_6,tmp_exp_ctrl_op_6}};
  assign tmp_exp_ctrl_op_31 = tmp_exp_ctrl_op_7;
  assign tmp_exp_ctrl_op_32 = {tmp_exp_ctrl_op_7,tmp_exp_ctrl_op_7};
  assign tmp_exp_ctrl_op_33 = tmp_exp_ctrl_op_8;
  assign tmp_exp_ctrl_op_34 = tmp_exp_ctrl_op_8;
  assign tmp_exp_ctrl_op_10 = (exp_ctrl_data[3 : 0] & {tmp_exp_ctrl_op,{tmp_exp_ctrl_op_11,tmp_exp_ctrl_op_12}});
  assign tmp_exp_ctrl_op_13 = (exp_ctrl_data[7 : 4] & {tmp_exp_ctrl_op_1,{tmp_exp_ctrl_op_14,tmp_exp_ctrl_op_15}});
  assign tmp_exp_ctrl_op_16 = exp_ctrl_data[11 : 8];
  assign tmp_exp_ctrl_op_17 = {tmp_exp_ctrl_op_2,{tmp_exp_ctrl_op_2,{tmp_exp_ctrl_op_18,tmp_exp_ctrl_op_19}}};
  assign tmp_exp_ctrl_op_20 = tmp_exp_ctrl_op_3;
  assign tmp_exp_ctrl_op_21 = {tmp_exp_ctrl_op_3,{tmp_exp_ctrl_op_3,tmp_exp_ctrl_op_3}};
  assign tmp_exp_ctrl_op_23 = tmp_exp_ctrl_op_4;
  assign tmp_exp_ctrl_op_24 = {tmp_exp_ctrl_op_4,tmp_exp_ctrl_op_4};
  assign tmp_exp_ctrl_op_27 = tmp_exp_ctrl_op_5;
  assign tmp_exp_ctrl_op_28 = tmp_exp_ctrl_op_5;
  assign tmp_exp_ctrl_op_11 = tmp_exp_ctrl_op;
  assign tmp_exp_ctrl_op_12 = {tmp_exp_ctrl_op,tmp_exp_ctrl_op};
  assign tmp_exp_ctrl_op_14 = tmp_exp_ctrl_op_1;
  assign tmp_exp_ctrl_op_15 = {tmp_exp_ctrl_op_1,tmp_exp_ctrl_op_1};
  assign tmp_exp_ctrl_op_18 = tmp_exp_ctrl_op_2;
  assign tmp_exp_ctrl_op_19 = tmp_exp_ctrl_op_2;
  assign tmp_lsu_ctrl_op_11 = (((tmp_lsu_ctrl_op_12 | tmp_lsu_ctrl_op_19) | (tmp_lsu_ctrl_op_22 & tmp_lsu_ctrl_op_23)) | (lsu_ctrl_data[23 : 20] & {tmp_lsu_ctrl_op_26,tmp_lsu_ctrl_op_27}));
  assign tmp_lsu_ctrl_op_28 = (lsu_ctrl_data[27 : 24] & {tmp_lsu_ctrl_op_6,{tmp_lsu_ctrl_op_29,tmp_lsu_ctrl_op_30}});
  assign tmp_lsu_ctrl_op_31 = lsu_ctrl_data[31 : 28];
  assign tmp_lsu_ctrl_op_32 = {tmp_lsu_ctrl_op_7,{tmp_lsu_ctrl_op_7,{tmp_lsu_ctrl_op_33,tmp_lsu_ctrl_op_34}}};
  assign tmp_lsu_ctrl_op_35 = tmp_lsu_ctrl_op_8;
  assign tmp_lsu_ctrl_op_36 = {tmp_lsu_ctrl_op_8,{tmp_lsu_ctrl_op_8,tmp_lsu_ctrl_op_8}};
  assign tmp_lsu_ctrl_op_37 = tmp_lsu_ctrl_op_9;
  assign tmp_lsu_ctrl_op_38 = {tmp_lsu_ctrl_op_9,tmp_lsu_ctrl_op_9};
  assign tmp_lsu_ctrl_op_39 = tmp_lsu_ctrl_op_10;
  assign tmp_lsu_ctrl_op_40 = tmp_lsu_ctrl_op_10;
  assign tmp_lsu_ctrl_op_12 = (((tmp_lsu_ctrl_op_13 & tmp_lsu_ctrl_op_14) | (tmp_lsu_ctrl_op_15 & tmp_lsu_ctrl_op_16)) | (lsu_ctrl_data[11 : 8] & {tmp_lsu_ctrl_op_17,tmp_lsu_ctrl_op_18}));
  assign tmp_lsu_ctrl_op_19 = (lsu_ctrl_data[15 : 12] & {tmp_lsu_ctrl_op_3,{tmp_lsu_ctrl_op_20,tmp_lsu_ctrl_op_21}});
  assign tmp_lsu_ctrl_op_22 = lsu_ctrl_data[19 : 16];
  assign tmp_lsu_ctrl_op_23 = {tmp_lsu_ctrl_op_4,{tmp_lsu_ctrl_op_4,{tmp_lsu_ctrl_op_24,tmp_lsu_ctrl_op_25}}};
  assign tmp_lsu_ctrl_op_26 = tmp_lsu_ctrl_op_5;
  assign tmp_lsu_ctrl_op_27 = {tmp_lsu_ctrl_op_5,{tmp_lsu_ctrl_op_5,tmp_lsu_ctrl_op_5}};
  assign tmp_lsu_ctrl_op_29 = tmp_lsu_ctrl_op_6;
  assign tmp_lsu_ctrl_op_30 = {tmp_lsu_ctrl_op_6,tmp_lsu_ctrl_op_6};
  assign tmp_lsu_ctrl_op_33 = tmp_lsu_ctrl_op_7;
  assign tmp_lsu_ctrl_op_34 = tmp_lsu_ctrl_op_7;
  assign tmp_lsu_ctrl_op_13 = lsu_ctrl_data[3 : 0];
  assign tmp_lsu_ctrl_op_14 = {tmp_lsu_ctrl_op,{tmp_lsu_ctrl_op,{tmp_lsu_ctrl_op,tmp_lsu_ctrl_op}}};
  assign tmp_lsu_ctrl_op_15 = lsu_ctrl_data[7 : 4];
  assign tmp_lsu_ctrl_op_16 = {tmp_lsu_ctrl_op_1,{tmp_lsu_ctrl_op_1,{tmp_lsu_ctrl_op_1,tmp_lsu_ctrl_op_1}}};
  assign tmp_lsu_ctrl_op_17 = tmp_lsu_ctrl_op_2;
  assign tmp_lsu_ctrl_op_18 = {tmp_lsu_ctrl_op_2,{tmp_lsu_ctrl_op_2,tmp_lsu_ctrl_op_2}};
  assign tmp_lsu_ctrl_op_20 = tmp_lsu_ctrl_op_3;
  assign tmp_lsu_ctrl_op_21 = {tmp_lsu_ctrl_op_3,tmp_lsu_ctrl_op_3};
  assign tmp_lsu_ctrl_op_24 = tmp_lsu_ctrl_op_4;
  assign tmp_lsu_ctrl_op_25 = tmp_lsu_ctrl_op_4;
  `ifndef SYNTHESIS
  always @(*) begin
    case(alu_micro_op_alu_ctrl_op)
      AluCtrlEnum_IDLE : alu_micro_op_alu_ctrl_op_string = "IDLE  ";
      AluCtrlEnum_ADD : alu_micro_op_alu_ctrl_op_string = "ADD   ";
      AluCtrlEnum_SUB : alu_micro_op_alu_ctrl_op_string = "SUB   ";
      AluCtrlEnum_SLT : alu_micro_op_alu_ctrl_op_string = "SLT   ";
      AluCtrlEnum_SLTU : alu_micro_op_alu_ctrl_op_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : alu_micro_op_alu_ctrl_op_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : alu_micro_op_alu_ctrl_op_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : alu_micro_op_alu_ctrl_op_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : alu_micro_op_alu_ctrl_op_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : alu_micro_op_alu_ctrl_op_string = "AND_1 ";
      AluCtrlEnum_OR_1 : alu_micro_op_alu_ctrl_op_string = "OR_1  ";
      AluCtrlEnum_LUI : alu_micro_op_alu_ctrl_op_string = "LUI   ";
      AluCtrlEnum_MUL : alu_micro_op_alu_ctrl_op_string = "MUL   ";
      AluCtrlEnum_MULH : alu_micro_op_alu_ctrl_op_string = "MULH  ";
      AluCtrlEnum_MULHSU : alu_micro_op_alu_ctrl_op_string = "MULHSU";
      AluCtrlEnum_MULHU : alu_micro_op_alu_ctrl_op_string = "MULHU ";
      AluCtrlEnum_DIV : alu_micro_op_alu_ctrl_op_string = "DIV   ";
      AluCtrlEnum_DIVU : alu_micro_op_alu_ctrl_op_string = "DIVU  ";
      AluCtrlEnum_REM_1 : alu_micro_op_alu_ctrl_op_string = "REM_1 ";
      AluCtrlEnum_REMU : alu_micro_op_alu_ctrl_op_string = "REMU  ";
      AluCtrlEnum_MULW : alu_micro_op_alu_ctrl_op_string = "MULW  ";
      AluCtrlEnum_DIVW : alu_micro_op_alu_ctrl_op_string = "DIVW  ";
      AluCtrlEnum_DIVUW : alu_micro_op_alu_ctrl_op_string = "DIVUW ";
      AluCtrlEnum_REMW : alu_micro_op_alu_ctrl_op_string = "REMW  ";
      AluCtrlEnum_REMUW : alu_micro_op_alu_ctrl_op_string = "REMUW ";
      default : alu_micro_op_alu_ctrl_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(lsu_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_IDLE : lsu_micro_op_lsu_ctrl_op_string = "IDLE";
      LsuCtrlEnum_LB : lsu_micro_op_lsu_ctrl_op_string = "LB  ";
      LsuCtrlEnum_LBU : lsu_micro_op_lsu_ctrl_op_string = "LBU ";
      LsuCtrlEnum_LH : lsu_micro_op_lsu_ctrl_op_string = "LH  ";
      LsuCtrlEnum_LHU : lsu_micro_op_lsu_ctrl_op_string = "LHU ";
      LsuCtrlEnum_LW : lsu_micro_op_lsu_ctrl_op_string = "LW  ";
      LsuCtrlEnum_LWU : lsu_micro_op_lsu_ctrl_op_string = "LWU ";
      LsuCtrlEnum_LD : lsu_micro_op_lsu_ctrl_op_string = "LD  ";
      LsuCtrlEnum_SB : lsu_micro_op_lsu_ctrl_op_string = "SB  ";
      LsuCtrlEnum_SH : lsu_micro_op_lsu_ctrl_op_string = "SH  ";
      LsuCtrlEnum_SW : lsu_micro_op_lsu_ctrl_op_string = "SW  ";
      LsuCtrlEnum_SD : lsu_micro_op_lsu_ctrl_op_string = "SD  ";
      default : lsu_micro_op_lsu_ctrl_op_string = "????";
    endcase
  end
  always @(*) begin
    case(bju_micro_op_bju_ctrl_op)
      BjuCtrlEnum_IDLE : bju_micro_op_bju_ctrl_op_string = "IDLE ";
      BjuCtrlEnum_AUIPC : bju_micro_op_bju_ctrl_op_string = "AUIPC";
      BjuCtrlEnum_JAL : bju_micro_op_bju_ctrl_op_string = "JAL  ";
      BjuCtrlEnum_JALR : bju_micro_op_bju_ctrl_op_string = "JALR ";
      BjuCtrlEnum_BEQ : bju_micro_op_bju_ctrl_op_string = "BEQ  ";
      BjuCtrlEnum_BNE : bju_micro_op_bju_ctrl_op_string = "BNE  ";
      BjuCtrlEnum_BLT : bju_micro_op_bju_ctrl_op_string = "BLT  ";
      BjuCtrlEnum_BGE : bju_micro_op_bju_ctrl_op_string = "BGE  ";
      BjuCtrlEnum_BLTU : bju_micro_op_bju_ctrl_op_string = "BLTU ";
      BjuCtrlEnum_BGEU : bju_micro_op_bju_ctrl_op_string = "BGEU ";
      BjuCtrlEnum_CSR : bju_micro_op_bju_ctrl_op_string = "CSR  ";
      default : bju_micro_op_bju_ctrl_op_string = "?????";
    endcase
  end
  always @(*) begin
    case(bju_micro_op_exp_ctrl_op)
      ExpCtrlEnum_IDLE : bju_micro_op_exp_ctrl_op_string = "IDLE  ";
      ExpCtrlEnum_ECALL : bju_micro_op_exp_ctrl_op_string = "ECALL ";
      ExpCtrlEnum_EBREAK : bju_micro_op_exp_ctrl_op_string = "EBREAK";
      ExpCtrlEnum_MRET : bju_micro_op_exp_ctrl_op_string = "MRET  ";
      ExpCtrlEnum_CSRRW : bju_micro_op_exp_ctrl_op_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : bju_micro_op_exp_ctrl_op_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : bju_micro_op_exp_ctrl_op_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : bju_micro_op_exp_ctrl_op_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : bju_micro_op_exp_ctrl_op_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : bju_micro_op_exp_ctrl_op_string = "CSRRCI";
      default : bju_micro_op_exp_ctrl_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_string = "REMUW ";
      default : tmp_alu_ctrl_data_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_1)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_1_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_1_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_1_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_1_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_1_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_1_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_1_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_1_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_1_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_1_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_1_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_1_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_1_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_1_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_1_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_1_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_1_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_1_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_1_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_1_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_1_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_1_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_1_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_1_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_1_string = "REMUW ";
      default : tmp_alu_ctrl_data_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_2)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_2_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_2_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_2_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_2_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_2_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_2_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_2_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_2_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_2_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_2_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_2_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_2_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_2_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_2_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_2_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_2_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_2_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_2_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_2_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_2_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_2_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_2_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_2_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_2_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_2_string = "REMUW ";
      default : tmp_alu_ctrl_data_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_3)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_3_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_3_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_3_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_3_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_3_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_3_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_3_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_3_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_3_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_3_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_3_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_3_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_3_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_3_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_3_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_3_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_3_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_3_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_3_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_3_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_3_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_3_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_3_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_3_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_3_string = "REMUW ";
      default : tmp_alu_ctrl_data_3_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_4)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_4_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_4_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_4_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_4_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_4_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_4_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_4_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_4_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_4_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_4_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_4_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_4_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_4_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_4_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_4_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_4_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_4_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_4_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_4_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_4_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_4_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_4_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_4_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_4_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_4_string = "REMUW ";
      default : tmp_alu_ctrl_data_4_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_5)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_5_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_5_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_5_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_5_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_5_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_5_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_5_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_5_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_5_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_5_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_5_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_5_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_5_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_5_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_5_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_5_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_5_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_5_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_5_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_5_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_5_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_5_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_5_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_5_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_5_string = "REMUW ";
      default : tmp_alu_ctrl_data_5_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_6)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_6_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_6_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_6_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_6_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_6_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_6_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_6_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_6_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_6_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_6_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_6_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_6_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_6_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_6_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_6_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_6_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_6_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_6_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_6_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_6_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_6_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_6_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_6_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_6_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_6_string = "REMUW ";
      default : tmp_alu_ctrl_data_6_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_7)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_7_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_7_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_7_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_7_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_7_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_7_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_7_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_7_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_7_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_7_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_7_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_7_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_7_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_7_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_7_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_7_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_7_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_7_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_7_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_7_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_7_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_7_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_7_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_7_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_7_string = "REMUW ";
      default : tmp_alu_ctrl_data_7_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_8)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_8_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_8_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_8_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_8_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_8_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_8_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_8_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_8_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_8_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_8_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_8_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_8_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_8_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_8_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_8_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_8_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_8_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_8_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_8_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_8_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_8_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_8_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_8_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_8_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_8_string = "REMUW ";
      default : tmp_alu_ctrl_data_8_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_9)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_9_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_9_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_9_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_9_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_9_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_9_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_9_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_9_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_9_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_9_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_9_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_9_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_9_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_9_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_9_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_9_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_9_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_9_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_9_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_9_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_9_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_9_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_9_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_9_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_9_string = "REMUW ";
      default : tmp_alu_ctrl_data_9_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_10)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_10_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_10_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_10_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_10_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_10_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_10_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_10_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_10_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_10_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_10_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_10_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_10_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_10_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_10_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_10_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_10_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_10_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_10_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_10_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_10_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_10_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_10_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_10_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_10_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_10_string = "REMUW ";
      default : tmp_alu_ctrl_data_10_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_11)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_11_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_11_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_11_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_11_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_11_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_11_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_11_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_11_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_11_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_11_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_11_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_11_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_11_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_11_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_11_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_11_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_11_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_11_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_11_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_11_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_11_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_11_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_11_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_11_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_11_string = "REMUW ";
      default : tmp_alu_ctrl_data_11_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_12)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_12_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_12_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_12_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_12_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_12_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_12_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_12_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_12_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_12_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_12_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_12_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_12_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_12_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_12_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_12_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_12_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_12_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_12_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_12_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_12_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_12_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_12_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_12_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_12_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_12_string = "REMUW ";
      default : tmp_alu_ctrl_data_12_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_13)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_13_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_13_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_13_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_13_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_13_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_13_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_13_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_13_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_13_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_13_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_13_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_13_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_13_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_13_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_13_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_13_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_13_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_13_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_13_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_13_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_13_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_13_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_13_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_13_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_13_string = "REMUW ";
      default : tmp_alu_ctrl_data_13_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_14)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_14_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_14_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_14_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_14_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_14_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_14_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_14_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_14_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_14_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_14_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_14_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_14_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_14_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_14_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_14_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_14_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_14_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_14_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_14_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_14_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_14_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_14_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_14_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_14_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_14_string = "REMUW ";
      default : tmp_alu_ctrl_data_14_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_15)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_15_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_15_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_15_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_15_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_15_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_15_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_15_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_15_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_15_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_15_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_15_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_15_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_15_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_15_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_15_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_15_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_15_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_15_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_15_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_15_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_15_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_15_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_15_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_15_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_15_string = "REMUW ";
      default : tmp_alu_ctrl_data_15_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_16)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_16_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_16_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_16_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_16_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_16_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_16_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_16_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_16_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_16_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_16_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_16_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_16_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_16_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_16_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_16_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_16_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_16_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_16_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_16_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_16_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_16_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_16_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_16_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_16_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_16_string = "REMUW ";
      default : tmp_alu_ctrl_data_16_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_17)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_17_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_17_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_17_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_17_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_17_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_17_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_17_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_17_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_17_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_17_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_17_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_17_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_17_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_17_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_17_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_17_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_17_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_17_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_17_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_17_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_17_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_17_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_17_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_17_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_17_string = "REMUW ";
      default : tmp_alu_ctrl_data_17_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_18)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_18_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_18_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_18_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_18_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_18_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_18_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_18_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_18_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_18_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_18_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_18_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_18_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_18_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_18_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_18_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_18_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_18_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_18_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_18_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_18_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_18_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_18_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_18_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_18_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_18_string = "REMUW ";
      default : tmp_alu_ctrl_data_18_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_19)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_19_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_19_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_19_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_19_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_19_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_19_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_19_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_19_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_19_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_19_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_19_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_19_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_19_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_19_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_19_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_19_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_19_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_19_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_19_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_19_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_19_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_19_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_19_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_19_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_19_string = "REMUW ";
      default : tmp_alu_ctrl_data_19_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_20)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_20_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_20_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_20_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_20_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_20_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_20_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_20_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_20_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_20_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_20_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_20_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_20_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_20_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_20_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_20_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_20_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_20_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_20_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_20_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_20_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_20_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_20_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_20_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_20_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_20_string = "REMUW ";
      default : tmp_alu_ctrl_data_20_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_21)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_21_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_21_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_21_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_21_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_21_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_21_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_21_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_21_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_21_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_21_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_21_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_21_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_21_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_21_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_21_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_21_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_21_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_21_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_21_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_21_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_21_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_21_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_21_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_21_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_21_string = "REMUW ";
      default : tmp_alu_ctrl_data_21_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_22)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_22_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_22_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_22_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_22_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_22_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_22_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_22_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_22_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_22_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_22_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_22_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_22_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_22_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_22_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_22_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_22_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_22_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_22_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_22_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_22_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_22_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_22_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_22_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_22_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_22_string = "REMUW ";
      default : tmp_alu_ctrl_data_22_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_ctrl_data_23)
      AluCtrlEnum_IDLE : tmp_alu_ctrl_data_23_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_ctrl_data_23_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_ctrl_data_23_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_ctrl_data_23_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_ctrl_data_23_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_ctrl_data_23_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_ctrl_data_23_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_ctrl_data_23_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_ctrl_data_23_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_ctrl_data_23_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_ctrl_data_23_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_ctrl_data_23_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_ctrl_data_23_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_ctrl_data_23_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_ctrl_data_23_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_ctrl_data_23_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_ctrl_data_23_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_ctrl_data_23_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_ctrl_data_23_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_ctrl_data_23_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_ctrl_data_23_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_ctrl_data_23_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_ctrl_data_23_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_ctrl_data_23_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_ctrl_data_23_string = "REMUW ";
      default : tmp_alu_ctrl_data_23_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_string = "CSR  ";
      default : tmp_bju_ctrl_data_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_1)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_1_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_1_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_1_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_1_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_1_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_1_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_1_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_1_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_1_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_1_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_1_string = "CSR  ";
      default : tmp_bju_ctrl_data_1_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_2)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_2_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_2_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_2_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_2_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_2_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_2_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_2_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_2_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_2_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_2_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_2_string = "CSR  ";
      default : tmp_bju_ctrl_data_2_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_3)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_3_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_3_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_3_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_3_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_3_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_3_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_3_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_3_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_3_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_3_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_3_string = "CSR  ";
      default : tmp_bju_ctrl_data_3_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_4)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_4_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_4_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_4_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_4_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_4_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_4_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_4_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_4_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_4_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_4_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_4_string = "CSR  ";
      default : tmp_bju_ctrl_data_4_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_5)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_5_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_5_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_5_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_5_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_5_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_5_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_5_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_5_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_5_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_5_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_5_string = "CSR  ";
      default : tmp_bju_ctrl_data_5_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_6)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_6_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_6_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_6_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_6_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_6_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_6_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_6_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_6_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_6_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_6_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_6_string = "CSR  ";
      default : tmp_bju_ctrl_data_6_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_7)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_7_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_7_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_7_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_7_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_7_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_7_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_7_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_7_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_7_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_7_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_7_string = "CSR  ";
      default : tmp_bju_ctrl_data_7_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_8)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_8_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_8_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_8_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_8_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_8_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_8_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_8_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_8_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_8_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_8_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_8_string = "CSR  ";
      default : tmp_bju_ctrl_data_8_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_ctrl_data_9)
      BjuCtrlEnum_IDLE : tmp_bju_ctrl_data_9_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_ctrl_data_9_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_ctrl_data_9_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_ctrl_data_9_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_ctrl_data_9_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_ctrl_data_9_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_ctrl_data_9_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_ctrl_data_9_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_ctrl_data_9_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_ctrl_data_9_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_ctrl_data_9_string = "CSR  ";
      default : tmp_bju_ctrl_data_9_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_string = "CSRRCI";
      default : tmp_exp_ctrl_data_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_1)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_1_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_1_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_1_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_1_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_1_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_1_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_1_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_1_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_1_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_1_string = "CSRRCI";
      default : tmp_exp_ctrl_data_1_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_2)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_2_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_2_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_2_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_2_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_2_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_2_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_2_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_2_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_2_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_2_string = "CSRRCI";
      default : tmp_exp_ctrl_data_2_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_3)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_3_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_3_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_3_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_3_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_3_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_3_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_3_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_3_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_3_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_3_string = "CSRRCI";
      default : tmp_exp_ctrl_data_3_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_4)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_4_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_4_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_4_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_4_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_4_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_4_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_4_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_4_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_4_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_4_string = "CSRRCI";
      default : tmp_exp_ctrl_data_4_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_5)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_5_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_5_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_5_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_5_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_5_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_5_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_5_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_5_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_5_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_5_string = "CSRRCI";
      default : tmp_exp_ctrl_data_5_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_6)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_6_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_6_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_6_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_6_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_6_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_6_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_6_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_6_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_6_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_6_string = "CSRRCI";
      default : tmp_exp_ctrl_data_6_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_7)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_7_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_7_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_7_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_7_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_7_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_7_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_7_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_7_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_7_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_7_string = "CSRRCI";
      default : tmp_exp_ctrl_data_7_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_exp_ctrl_data_8)
      ExpCtrlEnum_IDLE : tmp_exp_ctrl_data_8_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_exp_ctrl_data_8_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_exp_ctrl_data_8_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_exp_ctrl_data_8_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_exp_ctrl_data_8_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_exp_ctrl_data_8_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_exp_ctrl_data_8_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_exp_ctrl_data_8_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_exp_ctrl_data_8_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_exp_ctrl_data_8_string = "CSRRCI";
      default : tmp_exp_ctrl_data_8_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_string = "SD  ";
      default : tmp_lsu_ctrl_data_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_1)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_1_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_1_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_1_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_1_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_1_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_1_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_1_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_1_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_1_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_1_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_1_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_1_string = "SD  ";
      default : tmp_lsu_ctrl_data_1_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_2)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_2_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_2_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_2_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_2_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_2_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_2_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_2_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_2_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_2_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_2_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_2_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_2_string = "SD  ";
      default : tmp_lsu_ctrl_data_2_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_3)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_3_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_3_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_3_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_3_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_3_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_3_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_3_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_3_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_3_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_3_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_3_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_3_string = "SD  ";
      default : tmp_lsu_ctrl_data_3_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_4)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_4_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_4_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_4_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_4_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_4_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_4_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_4_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_4_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_4_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_4_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_4_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_4_string = "SD  ";
      default : tmp_lsu_ctrl_data_4_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_5)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_5_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_5_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_5_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_5_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_5_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_5_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_5_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_5_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_5_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_5_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_5_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_5_string = "SD  ";
      default : tmp_lsu_ctrl_data_5_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_6)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_6_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_6_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_6_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_6_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_6_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_6_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_6_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_6_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_6_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_6_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_6_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_6_string = "SD  ";
      default : tmp_lsu_ctrl_data_6_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_7)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_7_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_7_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_7_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_7_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_7_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_7_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_7_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_7_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_7_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_7_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_7_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_7_string = "SD  ";
      default : tmp_lsu_ctrl_data_7_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_8)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_8_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_8_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_8_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_8_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_8_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_8_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_8_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_8_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_8_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_8_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_8_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_8_string = "SD  ";
      default : tmp_lsu_ctrl_data_8_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_9)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_9_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_9_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_9_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_9_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_9_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_9_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_9_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_9_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_9_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_9_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_9_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_9_string = "SD  ";
      default : tmp_lsu_ctrl_data_9_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_ctrl_data_10)
      LsuCtrlEnum_IDLE : tmp_lsu_ctrl_data_10_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_ctrl_data_10_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_ctrl_data_10_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_ctrl_data_10_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_ctrl_data_10_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_ctrl_data_10_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_ctrl_data_10_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_ctrl_data_10_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_ctrl_data_10_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_ctrl_data_10_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_ctrl_data_10_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_ctrl_data_10_string = "SD  ";
      default : tmp_lsu_ctrl_data_10_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_alu_micro_op_alu_ctrl_op)
      AluCtrlEnum_IDLE : tmp_alu_micro_op_alu_ctrl_op_string = "IDLE  ";
      AluCtrlEnum_ADD : tmp_alu_micro_op_alu_ctrl_op_string = "ADD   ";
      AluCtrlEnum_SUB : tmp_alu_micro_op_alu_ctrl_op_string = "SUB   ";
      AluCtrlEnum_SLT : tmp_alu_micro_op_alu_ctrl_op_string = "SLT   ";
      AluCtrlEnum_SLTU : tmp_alu_micro_op_alu_ctrl_op_string = "SLTU  ";
      AluCtrlEnum_XOR_1 : tmp_alu_micro_op_alu_ctrl_op_string = "XOR_1 ";
      AluCtrlEnum_SLL_1 : tmp_alu_micro_op_alu_ctrl_op_string = "SLL_1 ";
      AluCtrlEnum_SRL_1 : tmp_alu_micro_op_alu_ctrl_op_string = "SRL_1 ";
      AluCtrlEnum_SRA_1 : tmp_alu_micro_op_alu_ctrl_op_string = "SRA_1 ";
      AluCtrlEnum_AND_1 : tmp_alu_micro_op_alu_ctrl_op_string = "AND_1 ";
      AluCtrlEnum_OR_1 : tmp_alu_micro_op_alu_ctrl_op_string = "OR_1  ";
      AluCtrlEnum_LUI : tmp_alu_micro_op_alu_ctrl_op_string = "LUI   ";
      AluCtrlEnum_MUL : tmp_alu_micro_op_alu_ctrl_op_string = "MUL   ";
      AluCtrlEnum_MULH : tmp_alu_micro_op_alu_ctrl_op_string = "MULH  ";
      AluCtrlEnum_MULHSU : tmp_alu_micro_op_alu_ctrl_op_string = "MULHSU";
      AluCtrlEnum_MULHU : tmp_alu_micro_op_alu_ctrl_op_string = "MULHU ";
      AluCtrlEnum_DIV : tmp_alu_micro_op_alu_ctrl_op_string = "DIV   ";
      AluCtrlEnum_DIVU : tmp_alu_micro_op_alu_ctrl_op_string = "DIVU  ";
      AluCtrlEnum_REM_1 : tmp_alu_micro_op_alu_ctrl_op_string = "REM_1 ";
      AluCtrlEnum_REMU : tmp_alu_micro_op_alu_ctrl_op_string = "REMU  ";
      AluCtrlEnum_MULW : tmp_alu_micro_op_alu_ctrl_op_string = "MULW  ";
      AluCtrlEnum_DIVW : tmp_alu_micro_op_alu_ctrl_op_string = "DIVW  ";
      AluCtrlEnum_DIVUW : tmp_alu_micro_op_alu_ctrl_op_string = "DIVUW ";
      AluCtrlEnum_REMW : tmp_alu_micro_op_alu_ctrl_op_string = "REMW  ";
      AluCtrlEnum_REMUW : tmp_alu_micro_op_alu_ctrl_op_string = "REMUW ";
      default : tmp_alu_micro_op_alu_ctrl_op_string = "??????";
    endcase
  end
  always @(*) begin
    case(tmp_lsu_micro_op_lsu_ctrl_op)
      LsuCtrlEnum_IDLE : tmp_lsu_micro_op_lsu_ctrl_op_string = "IDLE";
      LsuCtrlEnum_LB : tmp_lsu_micro_op_lsu_ctrl_op_string = "LB  ";
      LsuCtrlEnum_LBU : tmp_lsu_micro_op_lsu_ctrl_op_string = "LBU ";
      LsuCtrlEnum_LH : tmp_lsu_micro_op_lsu_ctrl_op_string = "LH  ";
      LsuCtrlEnum_LHU : tmp_lsu_micro_op_lsu_ctrl_op_string = "LHU ";
      LsuCtrlEnum_LW : tmp_lsu_micro_op_lsu_ctrl_op_string = "LW  ";
      LsuCtrlEnum_LWU : tmp_lsu_micro_op_lsu_ctrl_op_string = "LWU ";
      LsuCtrlEnum_LD : tmp_lsu_micro_op_lsu_ctrl_op_string = "LD  ";
      LsuCtrlEnum_SB : tmp_lsu_micro_op_lsu_ctrl_op_string = "SB  ";
      LsuCtrlEnum_SH : tmp_lsu_micro_op_lsu_ctrl_op_string = "SH  ";
      LsuCtrlEnum_SW : tmp_lsu_micro_op_lsu_ctrl_op_string = "SW  ";
      LsuCtrlEnum_SD : tmp_lsu_micro_op_lsu_ctrl_op_string = "SD  ";
      default : tmp_lsu_micro_op_lsu_ctrl_op_string = "????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_micro_op_bju_ctrl_op)
      BjuCtrlEnum_IDLE : tmp_bju_micro_op_bju_ctrl_op_string = "IDLE ";
      BjuCtrlEnum_AUIPC : tmp_bju_micro_op_bju_ctrl_op_string = "AUIPC";
      BjuCtrlEnum_JAL : tmp_bju_micro_op_bju_ctrl_op_string = "JAL  ";
      BjuCtrlEnum_JALR : tmp_bju_micro_op_bju_ctrl_op_string = "JALR ";
      BjuCtrlEnum_BEQ : tmp_bju_micro_op_bju_ctrl_op_string = "BEQ  ";
      BjuCtrlEnum_BNE : tmp_bju_micro_op_bju_ctrl_op_string = "BNE  ";
      BjuCtrlEnum_BLT : tmp_bju_micro_op_bju_ctrl_op_string = "BLT  ";
      BjuCtrlEnum_BGE : tmp_bju_micro_op_bju_ctrl_op_string = "BGE  ";
      BjuCtrlEnum_BLTU : tmp_bju_micro_op_bju_ctrl_op_string = "BLTU ";
      BjuCtrlEnum_BGEU : tmp_bju_micro_op_bju_ctrl_op_string = "BGEU ";
      BjuCtrlEnum_CSR : tmp_bju_micro_op_bju_ctrl_op_string = "CSR  ";
      default : tmp_bju_micro_op_bju_ctrl_op_string = "?????";
    endcase
  end
  always @(*) begin
    case(tmp_bju_micro_op_exp_ctrl_op)
      ExpCtrlEnum_IDLE : tmp_bju_micro_op_exp_ctrl_op_string = "IDLE  ";
      ExpCtrlEnum_ECALL : tmp_bju_micro_op_exp_ctrl_op_string = "ECALL ";
      ExpCtrlEnum_EBREAK : tmp_bju_micro_op_exp_ctrl_op_string = "EBREAK";
      ExpCtrlEnum_MRET : tmp_bju_micro_op_exp_ctrl_op_string = "MRET  ";
      ExpCtrlEnum_CSRRW : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRW ";
      ExpCtrlEnum_CSRRS : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRS ";
      ExpCtrlEnum_CSRRC : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRC ";
      ExpCtrlEnum_CSRRWI : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRWI";
      ExpCtrlEnum_CSRRSI : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRSI";
      ExpCtrlEnum_CSRRCI : tmp_bju_micro_op_exp_ctrl_op_string = "CSRRCI";
      default : tmp_bju_micro_op_exp_ctrl_op_string = "??????";
    endcase
  end
  `endif

  assign opcode = instr[6 : 0]; // @ BaseType.scala l299
  assign rd = instr[11 : 7]; // @ BaseType.scala l299
  assign rs1 = instr[19 : 15]; // @ BaseType.scala l299
  assign rs2 = instr[24 : 20]; // @ BaseType.scala l299
  assign func3 = instr[14 : 12]; // @ BaseType.scala l299
  assign func7 = instr[31 : 25]; // @ BaseType.scala l299
  assign csr = instr[31 : 20]; // @ BaseType.scala l299
  assign op_is_imm = (opcode == 7'h13); // @ BaseType.scala l305
  assign op_is_alu = (opcode == 7'h33); // @ BaseType.scala l305
  assign op_is_load = (opcode == 7'h03); // @ BaseType.scala l305
  assign op_is_store = (opcode == 7'h23); // @ BaseType.scala l305
  assign op_is_jal = (opcode == 7'h6f); // @ BaseType.scala l305
  assign op_is_jalr = (opcode == 7'h67); // @ BaseType.scala l305
  assign op_is_branch = (opcode == 7'h63); // @ BaseType.scala l305
  assign op_is_lui = (opcode == 7'h37); // @ BaseType.scala l305
  assign op_is_auipc = (opcode == 7'h17); // @ BaseType.scala l305
  assign op_is_fence = (opcode == 7'h0f); // @ BaseType.scala l305
  assign op_is_sys = (opcode == 7'h73); // @ BaseType.scala l305
  assign op_is_word = (opcode == 7'h3b); // @ BaseType.scala l305
  assign op_is_wordi = (opcode == 7'h1b); // @ BaseType.scala l305
  assign func3_is_000 = (func3 == 3'b000); // @ BaseType.scala l305
  assign func3_is_001 = (func3 == 3'b001); // @ BaseType.scala l305
  assign func3_is_010 = (func3 == 3'b010); // @ BaseType.scala l305
  assign func3_is_011 = (func3 == 3'b011); // @ BaseType.scala l305
  assign func3_is_100 = (func3 == 3'b100); // @ BaseType.scala l305
  assign func3_is_101 = (func3 == 3'b101); // @ BaseType.scala l305
  assign func3_is_110 = (func3 == 3'b110); // @ BaseType.scala l305
  assign func3_is_111 = (func3 == 3'b111); // @ BaseType.scala l305
  assign func7_is_0000000 = (func7 == 7'h0); // @ BaseType.scala l305
  assign func7_is_0100000 = (func7 == 7'h20); // @ BaseType.scala l305
  assign func7_is_0011000 = (func7 == 7'h18); // @ BaseType.scala l305
  assign func7_is_0000001 = (func7 == 7'h01); // @ BaseType.scala l305
  assign instr_high_6bit_is_000000 = (instr[31 : 26] == 6'h0); // @ BaseType.scala l305
  assign instr_high_6bit_is_010000 = (instr[31 : 26] == 6'h10); // @ BaseType.scala l305
  assign add = ((op_is_alu && func3_is_000) && func7_is_0000000); // @ BaseType.scala l305
  assign and_1 = ((op_is_alu && func3_is_111) && func7_is_0000000); // @ BaseType.scala l305
  assign or_1 = ((op_is_alu && func3_is_110) && func7_is_0000000); // @ BaseType.scala l305
  assign sll_1 = ((op_is_alu && func3_is_001) && func7_is_0000000); // @ BaseType.scala l305
  assign slt = ((op_is_alu && func3_is_010) && func7_is_0000000); // @ BaseType.scala l305
  assign sltu = ((op_is_alu && func3_is_011) && func7_is_0000000); // @ BaseType.scala l305
  assign sra_1 = ((op_is_alu && func3_is_101) && func7_is_0100000); // @ BaseType.scala l305
  assign srl_1 = ((op_is_alu && func3_is_101) && func7_is_0000000); // @ BaseType.scala l305
  assign sub = ((op_is_alu && func3_is_000) && func7_is_0100000); // @ BaseType.scala l305
  assign xor_1 = ((op_is_alu && func3_is_100) && func7_is_0000000); // @ BaseType.scala l305
  assign subw = ((op_is_word && func3_is_000) && func7_is_0100000); // @ BaseType.scala l305
  assign srlw = ((op_is_word && func3_is_101) && func7_is_0000000); // @ BaseType.scala l305
  assign sraw = ((op_is_word && func3_is_101) && func7_is_0100000); // @ BaseType.scala l305
  assign addw = ((op_is_word && func3_is_000) && func7_is_0000000); // @ BaseType.scala l305
  assign sllw = ((op_is_word && func3_is_001) && func7_is_0000000); // @ BaseType.scala l305
  assign addi = (op_is_imm && func3_is_000); // @ BaseType.scala l305
  assign andi = (op_is_imm && func3_is_111); // @ BaseType.scala l305
  assign ori = (op_is_imm && func3_is_110); // @ BaseType.scala l305
  assign slli = ((op_is_imm && func3_is_001) && instr_high_6bit_is_000000); // @ BaseType.scala l305
  assign slti = (op_is_imm && func3_is_010); // @ BaseType.scala l305
  assign sltiu = (op_is_imm && func3_is_011); // @ BaseType.scala l305
  assign srai = ((op_is_imm && func3_is_101) && instr_high_6bit_is_010000); // @ BaseType.scala l305
  assign srli = ((op_is_imm && func3_is_101) && instr_high_6bit_is_000000); // @ BaseType.scala l305
  assign xori = (op_is_imm && func3_is_100); // @ BaseType.scala l305
  assign srliw = ((op_is_wordi && func3_is_101) && instr_high_6bit_is_000000); // @ BaseType.scala l305
  assign sraiw = ((op_is_wordi && func3_is_101) && instr_high_6bit_is_010000); // @ BaseType.scala l305
  assign addiw = (op_is_wordi && func3_is_000); // @ BaseType.scala l305
  assign slliw = ((op_is_wordi && func3_is_001) && instr_high_6bit_is_000000); // @ BaseType.scala l305
  assign mul = ((op_is_alu && func3_is_000) && func7_is_0000001); // @ BaseType.scala l305
  assign mulh = ((op_is_alu && func3_is_001) && func7_is_0000001); // @ BaseType.scala l305
  assign mulhsu = ((op_is_alu && func3_is_010) && func7_is_0000001); // @ BaseType.scala l305
  assign mulhu = ((op_is_alu && func3_is_011) && func7_is_0000001); // @ BaseType.scala l305
  assign div = ((op_is_alu && func3_is_100) && func7_is_0000001); // @ BaseType.scala l305
  assign divu = ((op_is_alu && func3_is_101) && func7_is_0000001); // @ BaseType.scala l305
  assign rem_1 = ((op_is_alu && func3_is_110) && func7_is_0000001); // @ BaseType.scala l305
  assign remu = ((op_is_alu && func3_is_111) && func7_is_0000001); // @ BaseType.scala l305
  assign mulw = ((op_is_word && func3_is_000) && func7_is_0000001); // @ BaseType.scala l305
  assign divw = ((op_is_word && func3_is_100) && func7_is_0000001); // @ BaseType.scala l305
  assign divuw = ((op_is_word && func3_is_101) && func7_is_0000001); // @ BaseType.scala l305
  assign remw = ((op_is_word && func3_is_110) && func7_is_0000001); // @ BaseType.scala l305
  assign remuw = ((op_is_word && func3_is_111) && func7_is_0000001); // @ BaseType.scala l305
  assign alu_add = (((add || addi) || addw) || addiw); // @ BaseType.scala l305
  assign alu_sub = (sub || subw); // @ BaseType.scala l305
  assign alu_slt = (slt || slti); // @ BaseType.scala l305
  assign alu_sltu = (sltu || slti); // @ BaseType.scala l305
  assign alu_xor = (xor_1 || xori); // @ BaseType.scala l305
  assign alu_sll = (((sll_1 || slli) || sllw) || slliw); // @ BaseType.scala l305
  assign alu_srl = (((srl_1 || srli) || srlw) || slliw); // @ BaseType.scala l305
  assign alu_sra = (((sra_1 || srai) || sraw) || sraiw); // @ BaseType.scala l305
  assign alu_and = (and_1 || andi); // @ BaseType.scala l305
  assign alu_or = (or_1 || ori); // @ BaseType.scala l305
  assign lb = (op_is_load && func3_is_000); // @ BaseType.scala l305
  assign lbu = (op_is_load && func3_is_100); // @ BaseType.scala l305
  assign ld = (op_is_load && func3_is_011); // @ BaseType.scala l305
  assign lh = (op_is_load && func3_is_001); // @ BaseType.scala l305
  assign lhu = (op_is_load && func3_is_101); // @ BaseType.scala l305
  assign lw = (op_is_load && func3_is_010); // @ BaseType.scala l305
  assign lwu = (op_is_load && func3_is_110); // @ BaseType.scala l305
  assign sb = (op_is_store && func3_is_000); // @ BaseType.scala l305
  assign sd = (op_is_store && func3_is_011); // @ BaseType.scala l305
  assign sh = (op_is_store && func3_is_001); // @ BaseType.scala l305
  assign sw = (op_is_store && func3_is_010); // @ BaseType.scala l305
  assign ebreak = (((op_is_sys && func3_is_000) && func7_is_0000000) && (rs2 == 5'h01)); // @ BaseType.scala l305
  assign ecall = (((op_is_sys && func3_is_000) && func7_is_0000000) && (rs2 == 5'h0)); // @ BaseType.scala l305
  assign mret = (((op_is_sys && func3_is_000) && func7_is_0011000) && (rs2 == 5'h02)); // @ BaseType.scala l305
  assign csrrw = (op_is_sys && func3_is_001); // @ BaseType.scala l305
  assign csrrs = (op_is_sys && func3_is_010); // @ BaseType.scala l305
  assign csrrc = (op_is_sys && func3_is_011); // @ BaseType.scala l305
  assign csrrwi = (op_is_sys && func3_is_101); // @ BaseType.scala l305
  assign csrrsi = (op_is_sys && func3_is_110); // @ BaseType.scala l305
  assign csrrci = (op_is_sys && func3_is_111); // @ BaseType.scala l305
  assign csri = ((csrrwi || csrrsi) || csrrci); // @ BaseType.scala l305
  assign csr_op = (((csri || csrrw) || csrrs) || csrrc); // @ BaseType.scala l305
  assign beq = (op_is_branch && func3_is_000); // @ BaseType.scala l305
  assign bge = (op_is_branch && func3_is_101); // @ BaseType.scala l305
  assign bgeu = (op_is_branch && func3_is_111); // @ BaseType.scala l305
  assign blt = (op_is_branch && func3_is_100); // @ BaseType.scala l305
  assign bltu = (op_is_branch && func3_is_110); // @ BaseType.scala l305
  assign bne = (op_is_branch && func3_is_001); // @ BaseType.scala l305
  assign csr_imm = {59'h0,rs1}; // @ BaseType.scala l299
  assign tmp_imm_data = tmp_tmp_imm_data[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_imm_data_1[31] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[30] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[29] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[28] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[27] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[26] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[25] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[24] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[23] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[22] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[21] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[20] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[19] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[18] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[17] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[16] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[15] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[14] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[13] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[12] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[11] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[10] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[9] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[8] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[7] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[6] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[5] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[4] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[3] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[2] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[1] = tmp_imm_data; // @ Literal.scala l87
    tmp_imm_data_1[0] = tmp_imm_data; // @ Literal.scala l87
  end

  assign tmp_imm_data_2 = tmp_tmp_imm_data_2[19]; // @ BaseType.scala l305
  always @(*) begin
    tmp_imm_data_3[42] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[41] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[40] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[39] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[38] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[37] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[36] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[35] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[34] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[33] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[32] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[31] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[30] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[29] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[28] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[27] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[26] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[25] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[24] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[23] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[22] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[21] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[20] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[19] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[18] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[17] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[16] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[15] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[14] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[13] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[12] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[11] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[10] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[9] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[8] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[7] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[6] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[5] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[4] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[3] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[2] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[1] = tmp_imm_data_2; // @ Literal.scala l87
    tmp_imm_data_3[0] = tmp_imm_data_2; // @ Literal.scala l87
  end

  assign tmp_imm_data_4 = tmp_tmp_imm_data_4[11]; // @ BaseType.scala l305
  always @(*) begin
    tmp_imm_data_5[50] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[49] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[48] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[47] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[46] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[45] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[44] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[43] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[42] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[41] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[40] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[39] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[38] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[37] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[36] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[35] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[34] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[33] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[32] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[31] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[30] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[29] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[28] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[27] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[26] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[25] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[24] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[23] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[22] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[21] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[20] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[19] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[18] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[17] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[16] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[15] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[14] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[13] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[12] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[11] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[10] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[9] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[8] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[7] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[6] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[5] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[4] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[3] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[2] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[1] = tmp_imm_data_4; // @ Literal.scala l87
    tmp_imm_data_5[0] = tmp_imm_data_4; // @ Literal.scala l87
  end

  assign tmp_imm_data_6 = tmp_tmp_imm_data_6[11]; // @ BaseType.scala l305
  always @(*) begin
    tmp_imm_data_7[51] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[50] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[49] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[48] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[47] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[46] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[45] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[44] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[43] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[42] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[41] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[40] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[39] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[38] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[37] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[36] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[35] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[34] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[33] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[32] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[31] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[30] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[29] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[28] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[27] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[26] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[25] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[24] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[23] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[22] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[21] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[20] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[19] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[18] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[17] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[16] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[15] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[14] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[13] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[12] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[11] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[10] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[9] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[8] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[7] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[6] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[5] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[4] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[3] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[2] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[1] = tmp_imm_data_6; // @ Literal.scala l87
    tmp_imm_data_7[0] = tmp_imm_data_6; // @ Literal.scala l87
  end

  assign tmp_imm_data_8 = instr[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_imm_data_9[51] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[50] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[49] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[48] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[47] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[46] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[45] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[44] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[43] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[42] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[41] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[40] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[39] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[38] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[37] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[36] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[35] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[34] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[33] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[32] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[31] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[30] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[29] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[28] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[27] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[26] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[25] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[24] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[23] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[22] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[21] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[20] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[19] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[18] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[17] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[16] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[15] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[14] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[13] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[12] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[11] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[10] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[9] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[8] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[7] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[6] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[5] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[4] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[3] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[2] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[1] = tmp_imm_data_8; // @ Literal.scala l87
    tmp_imm_data_9[0] = tmp_imm_data_8; // @ Literal.scala l87
  end

  assign imm_data = {{{{{{tmp_imm_data_1,{tmp_imm_data_10,tmp_imm_data_11}},{{tmp_imm_data_3,tmp_imm_data_12},tmp_imm_data_13}},{{tmp_imm_data_5,{tmp_imm_data_14,tmp_imm_data_15}},1'b0}},{tmp_imm_data_7,{instr[31 : 25],instr[11 : 7]}}},{tmp_imm_data_9,instr[31 : 20]}},csr_imm}; // @ BaseType.scala l299
  assign imm_type = {{{{{(tmp_imm_type || tmp_imm_type_1),(tmp_imm_type_2 == tmp_imm_type_3)},(instr[6 : 0] == 7'h63)},(instr[6 : 0] == 7'h23)},((((tmp_imm_type_4 == tmp_imm_type_5) || (tmp_imm_type_6 == tmp_imm_type_7)) || (instr[6 : 0] == 7'h03)) || (instr[6 : 0] == 7'h67))},csri}; // @ BaseType.scala l299
  assign tmp_imm = imm_type[0]; // @ BaseType.scala l305
  assign tmp_imm_1 = imm_type[1]; // @ BaseType.scala l305
  assign tmp_imm_2 = imm_type[2]; // @ BaseType.scala l305
  assign tmp_imm_3 = imm_type[3]; // @ BaseType.scala l305
  assign tmp_imm_4 = imm_type[4]; // @ BaseType.scala l305
  assign tmp_imm_5 = imm_type[5]; // @ BaseType.scala l305
  assign imm = (((((tmp_imm_6 | tmp_imm_47) | (tmp_imm_88 & tmp_imm_89)) | (imm_data[255 : 192] & {tmp_imm_130,tmp_imm_131})) | (imm_data[319 : 256] & {tmp_imm_4,{tmp_imm_172,tmp_imm_173}})) | (imm_data[383 : 320] & {tmp_imm_5,{tmp_imm_5,{tmp_imm_214,tmp_imm_215}}})); // @ Decode.scala l183
  assign alu_ctrl_sel = {{{{{{{{{{{tmp_alu_ctrl_sel,tmp_alu_ctrl_sel_3},alu_or},alu_and},alu_sra},alu_srl},alu_sll},alu_xor},alu_sltu},alu_slt},alu_sub},alu_add}; // @ BaseType.scala l299
  assign tmp_alu_ctrl_data = AluCtrlEnum_REMUW; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_1 = AluCtrlEnum_REMW; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_2 = AluCtrlEnum_DIVUW; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_3 = AluCtrlEnum_DIVW; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_4 = AluCtrlEnum_MULW; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_5 = AluCtrlEnum_REMU; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_6 = AluCtrlEnum_REM_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_7 = AluCtrlEnum_DIVU; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_8 = AluCtrlEnum_DIV; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_9 = AluCtrlEnum_MULHU; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_10 = AluCtrlEnum_MULHSU; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_11 = AluCtrlEnum_MULH; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_12 = AluCtrlEnum_MUL; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_13 = AluCtrlEnum_LUI; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_14 = AluCtrlEnum_OR_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_15 = AluCtrlEnum_AND_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_16 = AluCtrlEnum_SRA_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_17 = AluCtrlEnum_SRL_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_18 = AluCtrlEnum_SLL_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_19 = AluCtrlEnum_XOR_1; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_20 = AluCtrlEnum_SLTU; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_21 = AluCtrlEnum_SLT; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_22 = AluCtrlEnum_SUB; // @ Enum.scala l47
  assign tmp_alu_ctrl_data_23 = AluCtrlEnum_ADD; // @ Enum.scala l47
  assign alu_ctrl_data = {{{{{{{{{{{tmp_alu_ctrl_data_24,tmp_alu_ctrl_data_27},tmp_alu_ctrl_data_14},tmp_alu_ctrl_data_15},tmp_alu_ctrl_data_16},tmp_alu_ctrl_data_17},tmp_alu_ctrl_data_18},tmp_alu_ctrl_data_19},tmp_alu_ctrl_data_20},tmp_alu_ctrl_data_21},tmp_alu_ctrl_data_22},tmp_alu_ctrl_data_23}; // @ BaseType.scala l299
  assign tmp_alu_ctrl_op = alu_ctrl_sel[0]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_1 = alu_ctrl_sel[1]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_2 = alu_ctrl_sel[2]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_3 = alu_ctrl_sel[3]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_4 = alu_ctrl_sel[4]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_5 = alu_ctrl_sel[5]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_6 = alu_ctrl_sel[6]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_7 = alu_ctrl_sel[7]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_8 = alu_ctrl_sel[8]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_9 = alu_ctrl_sel[9]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_10 = alu_ctrl_sel[10]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_11 = alu_ctrl_sel[11]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_12 = alu_ctrl_sel[12]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_13 = alu_ctrl_sel[13]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_14 = alu_ctrl_sel[14]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_15 = alu_ctrl_sel[15]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_16 = alu_ctrl_sel[16]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_17 = alu_ctrl_sel[17]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_18 = alu_ctrl_sel[18]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_19 = alu_ctrl_sel[19]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_20 = alu_ctrl_sel[20]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_21 = alu_ctrl_sel[21]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_22 = alu_ctrl_sel[22]; // @ BaseType.scala l305
  assign tmp_alu_ctrl_op_23 = alu_ctrl_sel[23]; // @ BaseType.scala l305
  assign alu_ctrl_op = (((((tmp_alu_ctrl_op_24 | tmp_alu_ctrl_op_99) | (tmp_alu_ctrl_op_102 & tmp_alu_ctrl_op_103)) | (alu_ctrl_data[109 : 105] & {tmp_alu_ctrl_op_106,tmp_alu_ctrl_op_107})) | (alu_ctrl_data[114 : 110] & {tmp_alu_ctrl_op_22,{tmp_alu_ctrl_op_110,tmp_alu_ctrl_op_111}})) | (alu_ctrl_data[119 : 115] & {tmp_alu_ctrl_op_23,{tmp_alu_ctrl_op_23,{tmp_alu_ctrl_op_112,tmp_alu_ctrl_op_113}}})); // @ BaseType.scala l299
  assign bju_ctrl_sel = {{{{{{{{{csr_op,bgeu},bltu},bge},blt},bne},beq},op_is_jalr},op_is_jal},op_is_auipc}; // @ BaseType.scala l299
  assign tmp_bju_ctrl_data = BjuCtrlEnum_CSR; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_1 = BjuCtrlEnum_BGEU; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_2 = BjuCtrlEnum_BLTU; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_3 = BjuCtrlEnum_BGE; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_4 = BjuCtrlEnum_BLT; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_5 = BjuCtrlEnum_BNE; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_6 = BjuCtrlEnum_BEQ; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_7 = BjuCtrlEnum_JALR; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_8 = BjuCtrlEnum_JAL; // @ Enum.scala l47
  assign tmp_bju_ctrl_data_9 = BjuCtrlEnum_AUIPC; // @ Enum.scala l47
  assign bju_ctrl_data = {{{{{{{{{tmp_bju_ctrl_data,tmp_bju_ctrl_data_1},tmp_bju_ctrl_data_2},tmp_bju_ctrl_data_3},tmp_bju_ctrl_data_4},tmp_bju_ctrl_data_5},tmp_bju_ctrl_data_6},tmp_bju_ctrl_data_7},tmp_bju_ctrl_data_8},tmp_bju_ctrl_data_9}; // @ BaseType.scala l299
  assign tmp_bju_ctrl_op = bju_ctrl_sel[0]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_1 = bju_ctrl_sel[1]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_2 = bju_ctrl_sel[2]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_3 = bju_ctrl_sel[3]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_4 = bju_ctrl_sel[4]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_5 = bju_ctrl_sel[5]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_6 = bju_ctrl_sel[6]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_7 = bju_ctrl_sel[7]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_8 = bju_ctrl_sel[8]; // @ BaseType.scala l305
  assign tmp_bju_ctrl_op_9 = bju_ctrl_sel[9]; // @ BaseType.scala l305
  assign bju_ctrl_op = (((((tmp_bju_ctrl_op_10 | tmp_bju_ctrl_op_25) | (tmp_bju_ctrl_op_28 & tmp_bju_ctrl_op_29)) | (bju_ctrl_data[31 : 28] & {tmp_bju_ctrl_op_32,tmp_bju_ctrl_op_33})) | (bju_ctrl_data[35 : 32] & {tmp_bju_ctrl_op_8,{tmp_bju_ctrl_op_34,tmp_bju_ctrl_op_35}})) | (bju_ctrl_data[39 : 36] & {tmp_bju_ctrl_op_9,{tmp_bju_ctrl_op_9,{tmp_bju_ctrl_op_36,tmp_bju_ctrl_op_37}}})); // @ BaseType.scala l299
  assign exp_ctrl_sel = {{{{{{{{csrrci,csrrsi},csrrwi},csrrc},csrrs},csrrw},mret},ebreak},ecall}; // @ BaseType.scala l299
  assign tmp_exp_ctrl_data = ExpCtrlEnum_CSRRCI; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_1 = ExpCtrlEnum_CSRRSI; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_2 = ExpCtrlEnum_CSRRWI; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_3 = ExpCtrlEnum_CSRRC; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_4 = ExpCtrlEnum_CSRRS; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_5 = ExpCtrlEnum_CSRRW; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_6 = ExpCtrlEnum_MRET; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_7 = ExpCtrlEnum_EBREAK; // @ Enum.scala l47
  assign tmp_exp_ctrl_data_8 = ExpCtrlEnum_ECALL; // @ Enum.scala l47
  assign exp_ctrl_data = {{{{{{{{tmp_exp_ctrl_data,tmp_exp_ctrl_data_1},tmp_exp_ctrl_data_2},tmp_exp_ctrl_data_3},tmp_exp_ctrl_data_4},tmp_exp_ctrl_data_5},tmp_exp_ctrl_data_6},tmp_exp_ctrl_data_7},tmp_exp_ctrl_data_8}; // @ BaseType.scala l299
  assign tmp_exp_ctrl_op = exp_ctrl_sel[0]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_1 = exp_ctrl_sel[1]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_2 = exp_ctrl_sel[2]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_3 = exp_ctrl_sel[3]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_4 = exp_ctrl_sel[4]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_5 = exp_ctrl_sel[5]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_6 = exp_ctrl_sel[6]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_7 = exp_ctrl_sel[7]; // @ BaseType.scala l305
  assign tmp_exp_ctrl_op_8 = exp_ctrl_sel[8]; // @ BaseType.scala l305
  assign exp_ctrl_op = (((((tmp_exp_ctrl_op_9 | tmp_exp_ctrl_op_22) | (tmp_exp_ctrl_op_25 & tmp_exp_ctrl_op_26)) | (exp_ctrl_data[27 : 24] & {tmp_exp_ctrl_op_29,tmp_exp_ctrl_op_30})) | (exp_ctrl_data[31 : 28] & {tmp_exp_ctrl_op_7,{tmp_exp_ctrl_op_31,tmp_exp_ctrl_op_32}})) | (exp_ctrl_data[35 : 32] & {tmp_exp_ctrl_op_8,{tmp_exp_ctrl_op_8,{tmp_exp_ctrl_op_33,tmp_exp_ctrl_op_34}}})); // @ BaseType.scala l299
  assign lsu_ctrl_sel = {{{{{{{{{{sd,sw},sh},sb},ld},lwu},lw},lhu},lh},lbu},lb}; // @ BaseType.scala l299
  assign tmp_lsu_ctrl_data = LsuCtrlEnum_SD; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_1 = LsuCtrlEnum_SW; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_2 = LsuCtrlEnum_SH; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_3 = LsuCtrlEnum_SB; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_4 = LsuCtrlEnum_LD; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_5 = LsuCtrlEnum_LWU; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_6 = LsuCtrlEnum_LW; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_7 = LsuCtrlEnum_LHU; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_8 = LsuCtrlEnum_LH; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_9 = LsuCtrlEnum_LBU; // @ Enum.scala l47
  assign tmp_lsu_ctrl_data_10 = LsuCtrlEnum_LB; // @ Enum.scala l47
  assign lsu_ctrl_data = {{{{{{{{{{tmp_lsu_ctrl_data,tmp_lsu_ctrl_data_1},tmp_lsu_ctrl_data_2},tmp_lsu_ctrl_data_3},tmp_lsu_ctrl_data_4},tmp_lsu_ctrl_data_5},tmp_lsu_ctrl_data_6},tmp_lsu_ctrl_data_7},tmp_lsu_ctrl_data_8},tmp_lsu_ctrl_data_9},tmp_lsu_ctrl_data_10}; // @ BaseType.scala l299
  assign tmp_lsu_ctrl_op = lsu_ctrl_sel[0]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_1 = lsu_ctrl_sel[1]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_2 = lsu_ctrl_sel[2]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_3 = lsu_ctrl_sel[3]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_4 = lsu_ctrl_sel[4]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_5 = lsu_ctrl_sel[5]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_6 = lsu_ctrl_sel[6]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_7 = lsu_ctrl_sel[7]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_8 = lsu_ctrl_sel[8]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_9 = lsu_ctrl_sel[9]; // @ BaseType.scala l305
  assign tmp_lsu_ctrl_op_10 = lsu_ctrl_sel[10]; // @ BaseType.scala l305
  assign lsu_ctrl_op = (((((tmp_lsu_ctrl_op_11 | tmp_lsu_ctrl_op_28) | (tmp_lsu_ctrl_op_31 & tmp_lsu_ctrl_op_32)) | (lsu_ctrl_data[35 : 32] & {tmp_lsu_ctrl_op_35,tmp_lsu_ctrl_op_36})) | (lsu_ctrl_data[39 : 36] & {tmp_lsu_ctrl_op_9,{tmp_lsu_ctrl_op_37,tmp_lsu_ctrl_op_38}})) | (lsu_ctrl_data[43 : 40] & {tmp_lsu_ctrl_op_10,{tmp_lsu_ctrl_op_10,{tmp_lsu_ctrl_op_39,tmp_lsu_ctrl_op_40}}})); // @ BaseType.scala l299
  assign rs1_addr = rs1; // @ Decode.scala l234
  assign rs2_addr = rs2; // @ Decode.scala l235
  assign rs1_ren = (! (((instr[6 : 0] == 7'h37) || (instr[6 : 0] == 7'h17)) || (instr[6 : 0] == 7'h6f))); // @ Decode.scala l236
  assign rs2_ren = (! ((((instr[6 : 0] == 7'h37) || (instr[6 : 0] == 7'h17)) || (instr[6 : 0] == 7'h6f)) || ((((instr[6 : 0] == 7'h13) || (instr[6 : 0] == 7'h1b)) || (instr[6 : 0] == 7'h03)) || (instr[6 : 0] == 7'h67)))); // @ Decode.scala l237
  assign rd_wen = ((((((! (instr[6 : 0] == 7'h23)) && (! (instr[6 : 0] == 7'h63))) && (! ebreak)) && (! ecall)) && (! mret)) && (! op_is_fence)); // @ Decode.scala l238
  assign rd_addr = rd; // @ Decode.scala l244
  assign src2_is_imm = (((((((instr[6 : 0] == 7'h13) || (instr[6 : 0] == 7'h1b)) || (instr[6 : 0] == 7'h03)) || (instr[6 : 0] == 7'h67)) || (instr[6 : 0] == 7'h23)) || ((instr[6 : 0] == 7'h37) || (instr[6 : 0] == 7'h17))) || (instr[6 : 0] == 7'h6f)); // @ Decode.scala l245
  assign tmp_alu_micro_op_alu_ctrl_op = alu_ctrl_op; // @ Enum.scala l189
  assign alu_micro_op_alu_ctrl_op = tmp_alu_micro_op_alu_ctrl_op; // @ Enum.scala l191
  assign alu_micro_op_alu_is_word = (op_is_word || op_is_wordi); // @ Decode.scala l251
  assign alu_micro_op_src2_is_imm = src2_is_imm; // @ Decode.scala l252
  assign alu_micro_op_rd_wen = rd_wen; // @ Decode.scala l253
  assign tmp_lsu_micro_op_lsu_ctrl_op = lsu_ctrl_op; // @ Enum.scala l189
  assign lsu_micro_op_lsu_ctrl_op = tmp_lsu_micro_op_lsu_ctrl_op; // @ Enum.scala l191
  assign lsu_micro_op_lsu_is_load = op_is_load; // @ Decode.scala l256
  assign lsu_micro_op_lsu_is_store = op_is_store; // @ Decode.scala l257
  assign lsu_micro_op_src2_is_imm = src2_is_imm; // @ Decode.scala l258
  assign lsu_micro_op_rd_wen = rd_wen; // @ Decode.scala l259
  assign tmp_bju_micro_op_bju_ctrl_op = bju_ctrl_op; // @ Enum.scala l189
  assign bju_micro_op_bju_ctrl_op = tmp_bju_micro_op_bju_ctrl_op; // @ Enum.scala l191
  assign tmp_bju_micro_op_exp_ctrl_op = exp_ctrl_op; // @ Enum.scala l189
  assign bju_micro_op_exp_ctrl_op = tmp_bju_micro_op_exp_ctrl_op; // @ Enum.scala l191
  assign bju_micro_op_bju_rd_eq_rs1 = (rd == rs1); // @ Decode.scala l263
  assign bju_micro_op_bju_rd_is_link = ((rd == 5'h0) || (rd == 5'h05)); // @ Decode.scala l264
  assign bju_micro_op_bju_rs1_is_link = ((rs1 == 5'h0) || (rs1 == 5'h05)); // @ Decode.scala l265
  assign bju_micro_op_src2_is_imm = src2_is_imm; // @ Decode.scala l266
  assign bju_micro_op_rd_wen = rd_wen; // @ Decode.scala l267

endmodule
