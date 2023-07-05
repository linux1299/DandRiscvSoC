// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : 969e650a6e4715ce9ad1ec671f8026582b643dce

`timescale 1ns/1ps

module DandRiscvSimple (
  input               clk,
  input               reset
);
  localparam AluCtrlEnum_ADD = 4'd0;
  localparam AluCtrlEnum_SUB = 4'd1;
  localparam AluCtrlEnum_SLT = 4'd2;
  localparam AluCtrlEnum_SLTU = 4'd3;
  localparam AluCtrlEnum_XOR_1 = 4'd4;
  localparam AluCtrlEnum_SLL_1 = 4'd5;
  localparam AluCtrlEnum_SRL_1 = 4'd6;
  localparam AluCtrlEnum_SRA_1 = 4'd7;
  localparam AluCtrlEnum_AND_1 = 4'd8;
  localparam AluCtrlEnum_OR_1 = 4'd9;
  localparam AluCtrlEnum_LUI = 4'd10;
  localparam AluCtrlEnum_AUIPC = 4'd11;
  localparam AluCtrlEnum_JAL = 4'd12;
  localparam AluCtrlEnum_JALR = 4'd13;
  localparam MemCtrlEnum_LB = 4'd0;
  localparam MemCtrlEnum_LBU = 4'd1;
  localparam MemCtrlEnum_LH = 4'd2;
  localparam MemCtrlEnum_LHU = 4'd3;
  localparam MemCtrlEnum_LW = 4'd4;
  localparam MemCtrlEnum_LWU = 4'd5;
  localparam MemCtrlEnum_LD = 4'd6;
  localparam MemCtrlEnum_SB = 4'd7;
  localparam MemCtrlEnum_SH = 4'd8;
  localparam MemCtrlEnum_SW = 4'd9;
  localparam MemCtrlEnum_SD = 4'd10;

  wire       [4:0]    decode_DecodePlugin_regfile_module_read_ports_rs1_addr;
  wire       [4:0]    decode_DecodePlugin_regfile_module_read_ports_rs2_addr;
  wire                decode_DecodePlugin_regfile_module_read_ports_rs1_req;
  wire                decode_DecodePlugin_regfile_module_read_ports_rs2_req;
  wire       [63:0]   decode_DecodePlugin_regfile_module_write_ports_rd_value;
  wire       [4:0]    decode_DecodePlugin_regfile_module_write_ports_rd_addr;
  wire                decode_DecodePlugin_regfile_module_write_ports_rd_wen;
  wire                iCache_1_flush;
  wire                iCache_1_next_level_cmd_ready;
  wire                iCache_1_next_level_rsp_valid;
  wire       [255:0]  iCache_1_next_level_rsp_payload_data;
  wire       [63:0]   decode_DecodePlugin_regfile_module_read_ports_rs1_value;
  wire       [63:0]   decode_DecodePlugin_regfile_module_read_ports_rs2_value;
  wire                iCache_1_cpu_cmd_ready;
  wire                iCache_1_cpu_rsp_valid;
  wire       [31:0]   iCache_1_cpu_rsp_payload_data;
  wire                iCache_1_sram_0_ports_cmd_valid;
  wire       [4:0]    iCache_1_sram_0_ports_cmd_payload_addr;
  wire                iCache_1_sram_0_ports_cmd_payload_wen;
  wire       [255:0]  iCache_1_sram_0_ports_cmd_payload_wdata;
  wire                iCache_1_sram_1_ports_cmd_valid;
  wire       [4:0]    iCache_1_sram_1_ports_cmd_payload_addr;
  wire                iCache_1_sram_1_ports_cmd_payload_wen;
  wire       [255:0]  iCache_1_sram_1_ports_cmd_payload_wdata;
  wire                iCache_1_sram_2_ports_cmd_valid;
  wire       [4:0]    iCache_1_sram_2_ports_cmd_payload_addr;
  wire                iCache_1_sram_2_ports_cmd_payload_wen;
  wire       [255:0]  iCache_1_sram_2_ports_cmd_payload_wdata;
  wire                iCache_1_sram_3_ports_cmd_valid;
  wire       [4:0]    iCache_1_sram_3_ports_cmd_payload_addr;
  wire                iCache_1_sram_3_ports_cmd_payload_wen;
  wire       [255:0]  iCache_1_sram_3_ports_cmd_payload_wdata;
  wire                iCache_1_next_level_cmd_valid;
  wire       [63:0]   iCache_1_next_level_cmd_payload_addr;
  wire       [3:0]    iCache_1_next_level_cmd_payload_len;
  wire                sramBanks_1_sram_0_ports_rsp_valid;
  wire       [255:0]  sramBanks_1_sram_0_ports_rsp_payload_data;
  wire                sramBanks_1_sram_1_ports_rsp_valid;
  wire       [255:0]  sramBanks_1_sram_1_ports_rsp_payload_data;
  wire                sramBanks_1_sram_2_ports_rsp_valid;
  wire       [255:0]  sramBanks_1_sram_2_ports_rsp_payload_data;
  wire                sramBanks_1_sram_3_ports_rsp_valid;
  wire       [255:0]  sramBanks_1_sram_3_ports_rsp_payload_data;
  wire       [11:0]   _zz__zz_decode_DecodePlugin_imm_2;
  wire       [11:0]   _zz__zz_decode_DecodePlugin_imm_4;
  wire       [19:0]   _zz__zz_decode_DecodePlugin_imm_6;
  wire       [31:0]   _zz__zz_decode_DecodePlugin_imm_8;
  wire       [6:0]    _zz_decode_DecodePlugin_rd_wen;
  wire       [6:0]    _zz_decode_DecodePlugin_rd_wen_1;
  wire       [6:0]    _zz_decode_DecodePlugin_rd_wen_2;
  wire       [6:0]    _zz_decode_DecodePlugin_rd_wen_3;
  wire       [31:0]   _zz_decode_DecodePlugin_rd_wen_4;
  wire       [63:0]   _zz_execute_ALUPlugin_add_result;
  wire       [63:0]   _zz_execute_ALUPlugin_add_result_1;
  wire       [63:0]   _zz_execute_ALUPlugin_sub_result;
  wire       [63:0]   _zz_execute_ALUPlugin_sub_result_1;
  wire       [63:0]   _zz_execute_ALUPlugin_slt_result;
  wire       [63:0]   _zz_execute_ALUPlugin_slt_result_1;
  wire       [63:0]   _zz_execute_ALUPlugin_sra_result;
  wire       [31:0]   _zz_execute_ALUPlugin_addw_result_2;
  wire       [31:0]   _zz_execute_ALUPlugin_subw_result_2;
  wire       [31:0]   _zz_execute_ALUPlugin_sraw_temp;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_1;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_2;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_3;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_4;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_5;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_6;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_7;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_8;
  wire       [31:0]   fetch_INSTRUCTION;
  wire       [63:0]   fetch_PC;
  wire       [63:0]   decode_RD;
  wire                decode_ALU_WORD;
  wire       [63:0]   decode_RS2;
  wire                decode_SRC2_IS_IMM;
  wire       [63:0]   decode_RS1;
  wire       [63:0]   decode_IMM;
  wire       [3:0]    decode_ALU_CTRL;
  wire       [63:0]   execute_IMM;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [63:0]   decode_PC;
  wire                fetch_arbitration_haltItself;
  wire                fetch_arbitration_haltByOther;
  reg                 fetch_arbitration_removeIt;
  wire                fetch_arbitration_flushIt;
  wire                fetch_arbitration_flushNext;
  wire                fetch_arbitration_isValid;
  wire                fetch_arbitration_isStuck;
  wire                fetch_arbitration_isStuckByOthers;
  wire                fetch_arbitration_isFlushed;
  wire                fetch_arbitration_isMoving;
  wire                fetch_arbitration_isFiring;
  wire                decode_arbitration_haltItself;
  wire                decode_arbitration_haltByOther;
  reg                 decode_arbitration_removeIt;
  wire                decode_arbitration_flushIt;
  wire                decode_arbitration_flushNext;
  reg                 decode_arbitration_isValid;
  wire                decode_arbitration_isStuck;
  wire                decode_arbitration_isStuckByOthers;
  wire                decode_arbitration_isFlushed;
  wire                decode_arbitration_isMoving;
  wire                decode_arbitration_isFiring;
  wire                execute_arbitration_haltItself;
  wire                execute_arbitration_haltByOther;
  reg                 execute_arbitration_removeIt;
  wire                execute_arbitration_flushIt;
  wire                execute_arbitration_flushNext;
  reg                 execute_arbitration_isValid;
  wire                execute_arbitration_isStuck;
  wire                execute_arbitration_isStuckByOthers;
  wire                execute_arbitration_isFlushed;
  wire                execute_arbitration_isMoving;
  wire                execute_arbitration_isFiring;
  wire                memaccess_arbitration_haltItself;
  wire                memaccess_arbitration_haltByOther;
  reg                 memaccess_arbitration_removeIt;
  wire                memaccess_arbitration_flushIt;
  wire                memaccess_arbitration_flushNext;
  reg                 memaccess_arbitration_isValid;
  wire                memaccess_arbitration_isStuck;
  wire                memaccess_arbitration_isStuckByOthers;
  wire                memaccess_arbitration_isFlushed;
  wire                memaccess_arbitration_isMoving;
  wire                memaccess_arbitration_isFiring;
  wire                writeback_arbitration_haltItself;
  wire                writeback_arbitration_haltByOther;
  reg                 writeback_arbitration_removeIt;
  wire                writeback_arbitration_flushIt;
  wire                writeback_arbitration_flushNext;
  reg                 writeback_arbitration_isValid;
  wire                writeback_arbitration_isStuck;
  wire                writeback_arbitration_isStuckByOthers;
  wire                writeback_arbitration_isFlushed;
  wire                writeback_arbitration_isMoving;
  wire                writeback_arbitration_isFiring;
  wire                _zz_when_InstructionFetchPlugin_l88;
  wire                _zz_when_InstructionFetchPlugin_l104;
  wire       [63:0]   _zz_ICachePlugin_icache_access_cmd_payload_addr;
  wire                _zz_when_InstructionFetchPlugin_l88_1;
  wire                _zz_1;
  wire       [63:0]   _zz_ICachePlugin_icache_access_cmd_payload_addr_1;
  wire                ICachePlugin_icache_access_cmd_valid;
  wire                ICachePlugin_icache_access_cmd_ready;
  wire       [63:0]   ICachePlugin_icache_access_cmd_payload_addr;
  wire       [2:0]    ICachePlugin_icache_access_cmd_payload_size;
  wire                ICachePlugin_icache_access_rsp_valid;
  wire       [31:0]   ICachePlugin_icache_access_rsp_payload_data;
  reg        [63:0]   _zz_ICachePlugin_icache_access_cmd_payload_addr_2;
  wire                ICachePlugin_icache_access_cmd_fire;
  reg        [63:0]   _zz_fetch_PC;
  reg                 _zz_ICachePlugin_icache_access_cmd_valid;
  reg        [63:0]   _zz_ICachePlugin_icache_access_cmd_payload_addr_3;
  reg                 when_InstructionFetchPlugin_l112;
  wire       [1:0]    _zz_when_InstructionFetchPlugin_l104_1;
  reg        [1:0]    _zz_when_InstructionFetchPlugin_l104_2;
  wire                when_InstructionFetchPlugin_l88;
  wire                ICachePlugin_icache_access_cmd_isStall;
  wire                ICachePlugin_icache_access_cmd_fire_1;
  wire                when_InstructionFetchPlugin_l104;
  wire                when_InstructionFetchPlugin_l111;
  wire                when_InstructionFetchPlugin_l124;
  reg        [63:0]   decode_DecodePlugin_imm;
  wire       [63:0]   decode_DecodePlugin_rs1;
  wire       [63:0]   decode_DecodePlugin_rs2;
  reg        [3:0]    decode_DecodePlugin_alu_ctrl;
  wire                decode_DecodePlugin_alu_word;
  wire                decode_DecodePlugin_src2_is_imm;
  reg        [3:0]    decode_DecodePlugin_mem_ctrl;
  wire                decode_DecodePlugin_rd_wen;
  wire       [4:0]    decode_DecodePlugin_rd_addr;
  wire                when_DecodePlugin_l92;
  wire                _zz_decode_DecodePlugin_imm;
  reg        [51:0]   _zz_decode_DecodePlugin_imm_1;
  wire                _zz_decode_DecodePlugin_imm_2;
  reg        [51:0]   _zz_decode_DecodePlugin_imm_3;
  wire                _zz_decode_DecodePlugin_imm_4;
  reg        [50:0]   _zz_decode_DecodePlugin_imm_5;
  wire                _zz_decode_DecodePlugin_imm_6;
  reg        [42:0]   _zz_decode_DecodePlugin_imm_7;
  wire                _zz_decode_DecodePlugin_imm_8;
  reg        [31:0]   _zz_decode_DecodePlugin_imm_9;
  wire                _zz_decode_DecodePlugin_imm_10;
  reg        [51:0]   _zz_decode_DecodePlugin_imm_11;
  wire                when_DecodePlugin_l94;
  wire                when_DecodePlugin_l96;
  wire                when_DecodePlugin_l98;
  wire                when_DecodePlugin_l100;
  reg        [63:0]   execute_ALUPlugin_src1;
  reg        [63:0]   execute_ALUPlugin_src2;
  wire       [31:0]   execute_ALUPlugin_src1_word;
  wire       [31:0]   execute_ALUPlugin_src2_word;
  wire       [5:0]    execute_ALUPlugin_shift_bits;
  wire       [63:0]   execute_ALUPlugin_add_result;
  wire       [63:0]   execute_ALUPlugin_sub_result;
  wire                execute_ALUPlugin_slt_result;
  wire                execute_ALUPlugin_sltu_result;
  wire       [63:0]   execute_ALUPlugin_xor_result;
  wire       [63:0]   execute_ALUPlugin_sll_result;
  wire       [63:0]   execute_ALUPlugin_srl_result;
  wire       [63:0]   execute_ALUPlugin_sra_result;
  wire       [63:0]   execute_ALUPlugin_and_result;
  wire       [63:0]   execute_ALUPlugin_or_result;
  reg        [63:0]   execute_ALUPlugin_pc_next;
  wire                _zz_execute_ALUPlugin_addw_result;
  reg        [31:0]   _zz_execute_ALUPlugin_addw_result_1;
  wire       [63:0]   execute_ALUPlugin_addw_result;
  wire                _zz_execute_ALUPlugin_subw_result;
  reg        [31:0]   _zz_execute_ALUPlugin_subw_result_1;
  wire       [63:0]   execute_ALUPlugin_subw_result;
  wire       [31:0]   execute_ALUPlugin_sllw_temp;
  wire                _zz_execute_ALUPlugin_sllw_result;
  reg        [31:0]   _zz_execute_ALUPlugin_sllw_result_1;
  wire       [63:0]   execute_ALUPlugin_sllw_result;
  wire       [31:0]   execute_ALUPlugin_srlw_temp;
  wire                _zz_execute_ALUPlugin_srlw_result;
  reg        [31:0]   _zz_execute_ALUPlugin_srlw_result_1;
  wire       [63:0]   execute_ALUPlugin_srlw_result;
  wire       [31:0]   execute_ALUPlugin_sraw_temp;
  wire                _zz_execute_ALUPlugin_sraw_result;
  reg        [31:0]   _zz_execute_ALUPlugin_sraw_result_1;
  wire       [63:0]   execute_ALUPlugin_sraw_result;
  reg        [63:0]   execute_ALUPlugin_rd_value;
  wire                execute_ALUPlugin_op_is_jump;
  wire                when_AluPlugin_l56;
  wire                when_AluPlugin_l62;
  wire                when_AluPlugin_l77;
  wire                when_AluPlugin_l84;
  wire       [62:0]   _zz_execute_ALUPlugin_rd_value;
  wire       [62:0]   _zz_execute_ALUPlugin_rd_value_1;
  wire                when_AluPlugin_l100;
  wire                when_AluPlugin_l107;
  wire                when_AluPlugin_l114;
  wire                when_Pipeline_l124;
  reg        [63:0]   fetch_to_decode_PC;
  wire                when_Pipeline_l124_1;
  reg        [31:0]   fetch_to_decode_INSTRUCTION;
  wire                when_Pipeline_l124_2;
  reg        [63:0]   decode_to_execute_IMM;
  wire                when_Pipeline_l151;
  wire                when_Pipeline_l154;
  wire                when_Pipeline_l151_1;
  wire                when_Pipeline_l154_1;
  wire                when_Pipeline_l151_2;
  wire                when_Pipeline_l154_2;
  wire                when_Pipeline_l151_3;
  wire                when_Pipeline_l154_3;

  assign _zz__zz_decode_DecodePlugin_imm_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz__zz_decode_DecodePlugin_imm_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_decode_DecodePlugin_imm_6 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_decode_DecodePlugin_imm_8 = {decode_INSTRUCTION[31 : 12],12'h0};
  assign _zz_execute_ALUPlugin_add_result = execute_ALUPlugin_src1;
  assign _zz_execute_ALUPlugin_add_result_1 = execute_ALUPlugin_src2;
  assign _zz_execute_ALUPlugin_sub_result = execute_ALUPlugin_src1;
  assign _zz_execute_ALUPlugin_sub_result_1 = execute_ALUPlugin_src2;
  assign _zz_execute_ALUPlugin_slt_result = execute_ALUPlugin_src1;
  assign _zz_execute_ALUPlugin_slt_result_1 = execute_ALUPlugin_src2;
  assign _zz_execute_ALUPlugin_sra_result = execute_ALUPlugin_src1;
  assign _zz_execute_ALUPlugin_addw_result_2 = execute_ALUPlugin_add_result[31 : 0];
  assign _zz_execute_ALUPlugin_subw_result_2 = execute_ALUPlugin_sub_result[31 : 0];
  assign _zz_execute_ALUPlugin_sraw_temp = execute_ALUPlugin_src1_word;
  assign _zz_execute_ALUPlugin_pc_next = (_zz_execute_ALUPlugin_pc_next_1 & _zz_execute_ALUPlugin_pc_next_4);
  assign _zz_execute_ALUPlugin_pc_next_1 = ($signed(_zz_execute_ALUPlugin_pc_next_2) + $signed(_zz_execute_ALUPlugin_pc_next_3));
  assign _zz_execute_ALUPlugin_pc_next_2 = execute_ALUPlugin_src1;
  assign _zz_execute_ALUPlugin_pc_next_3 = decode_IMM;
  assign _zz_execute_ALUPlugin_pc_next_4 = (~ _zz_execute_ALUPlugin_pc_next_5);
  assign _zz_execute_ALUPlugin_pc_next_5 = 64'h0000000000000001;
  assign _zz_execute_ALUPlugin_pc_next_6 = ($signed(_zz_execute_ALUPlugin_pc_next_7) + $signed(_zz_execute_ALUPlugin_pc_next_8));
  assign _zz_execute_ALUPlugin_pc_next_7 = decode_PC;
  assign _zz_execute_ALUPlugin_pc_next_8 = decode_IMM;
  assign _zz_decode_DecodePlugin_rd_wen = decode_INSTRUCTION[6 : 0];
  assign _zz_decode_DecodePlugin_rd_wen_1 = 7'h23;
  assign _zz_decode_DecodePlugin_rd_wen_2 = decode_INSTRUCTION[6 : 0];
  assign _zz_decode_DecodePlugin_rd_wen_3 = 7'h23;
  assign _zz_decode_DecodePlugin_rd_wen_4 = 32'hffffffff;
  RegFileModule decode_DecodePlugin_regfile_module (
    .read_ports_rs1_value (decode_DecodePlugin_regfile_module_read_ports_rs1_value[63:0]), //o
    .read_ports_rs2_value (decode_DecodePlugin_regfile_module_read_ports_rs2_value[63:0]), //o
    .read_ports_rs1_addr  (decode_DecodePlugin_regfile_module_read_ports_rs1_addr[4:0]  ), //i
    .read_ports_rs2_addr  (decode_DecodePlugin_regfile_module_read_ports_rs2_addr[4:0]  ), //i
    .read_ports_rs1_req   (decode_DecodePlugin_regfile_module_read_ports_rs1_req        ), //i
    .read_ports_rs2_req   (decode_DecodePlugin_regfile_module_read_ports_rs2_req        ), //i
    .write_ports_rd_value (decode_DecodePlugin_regfile_module_write_ports_rd_value[63:0]), //i
    .write_ports_rd_addr  (decode_DecodePlugin_regfile_module_write_ports_rd_addr[4:0]  ), //i
    .write_ports_rd_wen   (decode_DecodePlugin_regfile_module_write_ports_rd_wen        ), //i
    .clk                  (clk                                                          ), //i
    .reset                (reset                                                        )  //i
  );
  ICache iCache_1 (
    .flush                          (iCache_1_flush                                   ), //i
    .cpu_cmd_valid                  (ICachePlugin_icache_access_cmd_valid             ), //i
    .cpu_cmd_ready                  (iCache_1_cpu_cmd_ready                           ), //o
    .cpu_cmd_payload_addr           (ICachePlugin_icache_access_cmd_payload_addr[63:0]), //i
    .cpu_cmd_payload_size           (ICachePlugin_icache_access_cmd_payload_size[2:0] ), //i
    .cpu_rsp_valid                  (iCache_1_cpu_rsp_valid                           ), //o
    .cpu_rsp_payload_data           (iCache_1_cpu_rsp_payload_data[31:0]              ), //o
    .sram_0_ports_cmd_valid         (iCache_1_sram_0_ports_cmd_valid                  ), //o
    .sram_0_ports_cmd_payload_addr  (iCache_1_sram_0_ports_cmd_payload_addr[4:0]      ), //o
    .sram_0_ports_cmd_payload_wen   (iCache_1_sram_0_ports_cmd_payload_wen            ), //o
    .sram_0_ports_cmd_payload_wdata (iCache_1_sram_0_ports_cmd_payload_wdata[255:0]   ), //o
    .sram_0_ports_rsp_valid         (sramBanks_1_sram_0_ports_rsp_valid               ), //i
    .sram_0_ports_rsp_payload_data  (sramBanks_1_sram_0_ports_rsp_payload_data[255:0] ), //i
    .sram_1_ports_cmd_valid         (iCache_1_sram_1_ports_cmd_valid                  ), //o
    .sram_1_ports_cmd_payload_addr  (iCache_1_sram_1_ports_cmd_payload_addr[4:0]      ), //o
    .sram_1_ports_cmd_payload_wen   (iCache_1_sram_1_ports_cmd_payload_wen            ), //o
    .sram_1_ports_cmd_payload_wdata (iCache_1_sram_1_ports_cmd_payload_wdata[255:0]   ), //o
    .sram_1_ports_rsp_valid         (sramBanks_1_sram_1_ports_rsp_valid               ), //i
    .sram_1_ports_rsp_payload_data  (sramBanks_1_sram_1_ports_rsp_payload_data[255:0] ), //i
    .sram_2_ports_cmd_valid         (iCache_1_sram_2_ports_cmd_valid                  ), //o
    .sram_2_ports_cmd_payload_addr  (iCache_1_sram_2_ports_cmd_payload_addr[4:0]      ), //o
    .sram_2_ports_cmd_payload_wen   (iCache_1_sram_2_ports_cmd_payload_wen            ), //o
    .sram_2_ports_cmd_payload_wdata (iCache_1_sram_2_ports_cmd_payload_wdata[255:0]   ), //o
    .sram_2_ports_rsp_valid         (sramBanks_1_sram_2_ports_rsp_valid               ), //i
    .sram_2_ports_rsp_payload_data  (sramBanks_1_sram_2_ports_rsp_payload_data[255:0] ), //i
    .sram_3_ports_cmd_valid         (iCache_1_sram_3_ports_cmd_valid                  ), //o
    .sram_3_ports_cmd_payload_addr  (iCache_1_sram_3_ports_cmd_payload_addr[4:0]      ), //o
    .sram_3_ports_cmd_payload_wen   (iCache_1_sram_3_ports_cmd_payload_wen            ), //o
    .sram_3_ports_cmd_payload_wdata (iCache_1_sram_3_ports_cmd_payload_wdata[255:0]   ), //o
    .sram_3_ports_rsp_valid         (sramBanks_1_sram_3_ports_rsp_valid               ), //i
    .sram_3_ports_rsp_payload_data  (sramBanks_1_sram_3_ports_rsp_payload_data[255:0] ), //i
    .next_level_cmd_valid           (iCache_1_next_level_cmd_valid                    ), //o
    .next_level_cmd_ready           (iCache_1_next_level_cmd_ready                    ), //i
    .next_level_cmd_payload_addr    (iCache_1_next_level_cmd_payload_addr[63:0]       ), //o
    .next_level_cmd_payload_len     (iCache_1_next_level_cmd_payload_len[3:0]         ), //o
    .next_level_rsp_valid           (iCache_1_next_level_rsp_valid                    ), //i
    .next_level_rsp_payload_data    (iCache_1_next_level_rsp_payload_data[255:0]      ), //i
    .clk                            (clk                                              ), //i
    .reset                          (reset                                            )  //i
  );
  SramBanks sramBanks_1 (
    .sram_0_ports_cmd_valid         (iCache_1_sram_0_ports_cmd_valid                 ), //i
    .sram_0_ports_cmd_payload_addr  (iCache_1_sram_0_ports_cmd_payload_addr[4:0]     ), //i
    .sram_0_ports_cmd_payload_wen   (iCache_1_sram_0_ports_cmd_payload_wen           ), //i
    .sram_0_ports_cmd_payload_wdata (iCache_1_sram_0_ports_cmd_payload_wdata[255:0]  ), //i
    .sram_0_ports_rsp_valid         (sramBanks_1_sram_0_ports_rsp_valid              ), //o
    .sram_0_ports_rsp_payload_data  (sramBanks_1_sram_0_ports_rsp_payload_data[255:0]), //o
    .sram_1_ports_cmd_valid         (iCache_1_sram_1_ports_cmd_valid                 ), //i
    .sram_1_ports_cmd_payload_addr  (iCache_1_sram_1_ports_cmd_payload_addr[4:0]     ), //i
    .sram_1_ports_cmd_payload_wen   (iCache_1_sram_1_ports_cmd_payload_wen           ), //i
    .sram_1_ports_cmd_payload_wdata (iCache_1_sram_1_ports_cmd_payload_wdata[255:0]  ), //i
    .sram_1_ports_rsp_valid         (sramBanks_1_sram_1_ports_rsp_valid              ), //o
    .sram_1_ports_rsp_payload_data  (sramBanks_1_sram_1_ports_rsp_payload_data[255:0]), //o
    .sram_2_ports_cmd_valid         (iCache_1_sram_2_ports_cmd_valid                 ), //i
    .sram_2_ports_cmd_payload_addr  (iCache_1_sram_2_ports_cmd_payload_addr[4:0]     ), //i
    .sram_2_ports_cmd_payload_wen   (iCache_1_sram_2_ports_cmd_payload_wen           ), //i
    .sram_2_ports_cmd_payload_wdata (iCache_1_sram_2_ports_cmd_payload_wdata[255:0]  ), //i
    .sram_2_ports_rsp_valid         (sramBanks_1_sram_2_ports_rsp_valid              ), //o
    .sram_2_ports_rsp_payload_data  (sramBanks_1_sram_2_ports_rsp_payload_data[255:0]), //o
    .sram_3_ports_cmd_valid         (iCache_1_sram_3_ports_cmd_valid                 ), //i
    .sram_3_ports_cmd_payload_addr  (iCache_1_sram_3_ports_cmd_payload_addr[4:0]     ), //i
    .sram_3_ports_cmd_payload_wen   (iCache_1_sram_3_ports_cmd_payload_wen           ), //i
    .sram_3_ports_cmd_payload_wdata (iCache_1_sram_3_ports_cmd_payload_wdata[255:0]  ), //i
    .sram_3_ports_rsp_valid         (sramBanks_1_sram_3_ports_rsp_valid              ), //o
    .sram_3_ports_rsp_payload_data  (sramBanks_1_sram_3_ports_rsp_payload_data[255:0]), //o
    .clk                            (clk                                             ), //i
    .reset                          (reset                                           )  //i
  );
  assign fetch_INSTRUCTION = ICachePlugin_icache_access_rsp_payload_data;
  assign fetch_PC = _zz_fetch_PC;
  assign decode_RD = execute_ALUPlugin_rd_value;
  assign decode_ALU_WORD = decode_DecodePlugin_alu_word;
  assign decode_RS2 = decode_DecodePlugin_rs2;
  assign decode_SRC2_IS_IMM = decode_DecodePlugin_src2_is_imm;
  assign decode_RS1 = decode_DecodePlugin_rs1;
  assign decode_IMM = decode_DecodePlugin_imm;
  assign decode_ALU_CTRL = decode_DecodePlugin_alu_ctrl;
  assign execute_IMM = decode_to_execute_IMM;
  assign decode_INSTRUCTION = fetch_to_decode_INSTRUCTION;
  assign decode_PC = fetch_to_decode_PC;
  assign fetch_arbitration_haltItself = 1'b0;
  assign fetch_arbitration_haltByOther = 1'b0;
  always @(*) begin
    fetch_arbitration_removeIt = 1'b0;
    if(fetch_arbitration_isFlushed) begin
      fetch_arbitration_removeIt = 1'b1;
    end
  end

  assign fetch_arbitration_flushIt = 1'b0;
  assign fetch_arbitration_flushNext = 1'b0;
  assign decode_arbitration_haltItself = 1'b0;
  assign decode_arbitration_haltByOther = 1'b0;
  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushIt = 1'b0;
  assign decode_arbitration_flushNext = 1'b0;
  assign execute_arbitration_haltItself = 1'b0;
  assign execute_arbitration_haltByOther = 1'b0;
  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushIt = 1'b0;
  assign execute_arbitration_flushNext = 1'b0;
  assign memaccess_arbitration_haltItself = 1'b0;
  assign memaccess_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memaccess_arbitration_removeIt = 1'b0;
    if(memaccess_arbitration_isFlushed) begin
      memaccess_arbitration_removeIt = 1'b1;
    end
  end

  assign memaccess_arbitration_flushIt = 1'b0;
  assign memaccess_arbitration_flushNext = 1'b0;
  assign writeback_arbitration_haltItself = 1'b0;
  assign writeback_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeback_arbitration_removeIt = 1'b0;
    if(writeback_arbitration_isFlushed) begin
      writeback_arbitration_removeIt = 1'b1;
    end
  end

  assign writeback_arbitration_flushIt = 1'b0;
  assign writeback_arbitration_flushNext = 1'b0;
  assign ICachePlugin_icache_access_cmd_fire = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign when_InstructionFetchPlugin_l88 = (! (_zz_when_InstructionFetchPlugin_l88 || _zz_when_InstructionFetchPlugin_l88_1));
  assign ICachePlugin_icache_access_cmd_isStall = (ICachePlugin_icache_access_cmd_valid && (! ICachePlugin_icache_access_cmd_ready));
  assign ICachePlugin_icache_access_cmd_fire_1 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign when_InstructionFetchPlugin_l104 = (_zz_when_InstructionFetchPlugin_l104 && ((_zz_when_InstructionFetchPlugin_l104_2 == 2'b10) || (_zz_when_InstructionFetchPlugin_l104_1 == 2'b10)));
  assign when_InstructionFetchPlugin_l111 = (_zz_when_InstructionFetchPlugin_l104_1 == 2'b01);
  assign when_InstructionFetchPlugin_l124 = (_zz_when_InstructionFetchPlugin_l104_1 == 2'b01);
  assign ICachePlugin_icache_access_cmd_valid = _zz_ICachePlugin_icache_access_cmd_valid;
  assign ICachePlugin_icache_access_cmd_payload_addr = _zz_ICachePlugin_icache_access_cmd_payload_addr_2;
  assign decode_DecodePlugin_alu_word = (decode_INSTRUCTION[6 : 0] == 7'h3b);
  assign decode_DecodePlugin_src2_is_imm = (((((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67)) || (decode_INSTRUCTION[6 : 0] == 7'h23)) || ((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17))) || (decode_INSTRUCTION[6 : 0] == 7'h67));
  assign decode_DecodePlugin_rd_addr = decode_INSTRUCTION[11 : 7];
  assign when_DecodePlugin_l92 = ((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67));
  assign _zz_decode_DecodePlugin_imm = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_1[51] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[50] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[49] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[48] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[47] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[46] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[45] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[44] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[43] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[42] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[41] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[40] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[39] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[38] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[37] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[36] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[35] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[34] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[33] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[32] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[31] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[30] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[29] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[28] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[27] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[26] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[25] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[24] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[23] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[22] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[21] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[20] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[19] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[18] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[17] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[16] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[15] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[14] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[13] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[12] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[11] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[10] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[9] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[8] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[7] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[6] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[5] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[4] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[3] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[2] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[1] = _zz_decode_DecodePlugin_imm;
    _zz_decode_DecodePlugin_imm_1[0] = _zz_decode_DecodePlugin_imm;
  end

  always @(*) begin
    if(when_DecodePlugin_l92) begin
      decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_1,decode_INSTRUCTION[31 : 20]};
    end else begin
      if(when_DecodePlugin_l94) begin
        decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end else begin
        if(when_DecodePlugin_l96) begin
          decode_DecodePlugin_imm = {{_zz_decode_DecodePlugin_imm_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
        end else begin
          if(when_DecodePlugin_l98) begin
            decode_DecodePlugin_imm = {{_zz_decode_DecodePlugin_imm_7,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
          end else begin
            if(when_DecodePlugin_l100) begin
              decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_9,{decode_INSTRUCTION[31 : 12],12'h0}};
            end else begin
              decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_11,decode_INSTRUCTION[31 : 20]};
            end
          end
        end
      end
    end
  end

  assign _zz_decode_DecodePlugin_imm_2 = _zz__zz_decode_DecodePlugin_imm_2[11];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_3[51] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[50] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[49] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[48] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[47] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[46] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[45] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[44] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[43] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[42] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[41] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[40] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[39] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[38] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[37] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[36] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[35] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[34] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[33] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[32] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[31] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[30] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[29] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[28] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[27] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[26] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[25] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[24] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[23] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[22] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[21] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[20] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[19] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[18] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[17] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[16] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[15] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[14] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[13] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[12] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[11] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[10] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[9] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[8] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[7] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[6] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[5] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[4] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[3] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[2] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[1] = _zz_decode_DecodePlugin_imm_2;
    _zz_decode_DecodePlugin_imm_3[0] = _zz_decode_DecodePlugin_imm_2;
  end

  assign _zz_decode_DecodePlugin_imm_4 = _zz__zz_decode_DecodePlugin_imm_4[11];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_5[50] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[49] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[48] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[47] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[46] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[45] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[44] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[43] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[42] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[41] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[40] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[39] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[38] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[37] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[36] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[35] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[34] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[33] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[32] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[31] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[30] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[29] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[28] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[27] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[26] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[25] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[24] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[23] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[22] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[21] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[20] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[19] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[18] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[17] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[16] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[15] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[14] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[13] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[12] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[11] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[10] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[9] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[8] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[7] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[6] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[5] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[4] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[3] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[2] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[1] = _zz_decode_DecodePlugin_imm_4;
    _zz_decode_DecodePlugin_imm_5[0] = _zz_decode_DecodePlugin_imm_4;
  end

  assign _zz_decode_DecodePlugin_imm_6 = _zz__zz_decode_DecodePlugin_imm_6[19];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_7[42] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[41] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[40] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[39] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[38] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[37] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[36] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[35] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[34] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[33] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[32] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[31] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[30] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[29] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[28] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[27] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[26] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[25] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[24] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[23] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[22] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[21] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[20] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[19] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[18] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[17] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[16] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[15] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[14] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[13] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[12] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[11] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[10] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[9] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[8] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[7] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[6] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[5] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[4] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[3] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[2] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[1] = _zz_decode_DecodePlugin_imm_6;
    _zz_decode_DecodePlugin_imm_7[0] = _zz_decode_DecodePlugin_imm_6;
  end

  assign _zz_decode_DecodePlugin_imm_8 = _zz__zz_decode_DecodePlugin_imm_8[31];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_9[31] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[30] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[29] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[28] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[27] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[26] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[25] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[24] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[23] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[22] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[21] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[20] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[19] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[18] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[17] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[16] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[15] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[14] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[13] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[12] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[11] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[10] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[9] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[8] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[7] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[6] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[5] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[4] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[3] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[2] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[1] = _zz_decode_DecodePlugin_imm_8;
    _zz_decode_DecodePlugin_imm_9[0] = _zz_decode_DecodePlugin_imm_8;
  end

  assign _zz_decode_DecodePlugin_imm_10 = decode_INSTRUCTION[31];
  always @(*) begin
    _zz_decode_DecodePlugin_imm_11[51] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[50] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[49] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[48] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[47] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[46] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[45] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[44] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[43] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[42] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[41] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[40] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[39] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[38] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[37] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[36] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[35] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[34] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[33] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[32] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[31] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[30] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[29] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[28] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[27] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[26] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[25] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[24] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[23] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[22] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[21] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[20] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[19] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[18] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[17] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[16] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[15] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[14] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[13] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[12] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[11] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[10] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[9] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[8] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[7] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[6] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[5] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[4] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[3] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[2] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[1] = _zz_decode_DecodePlugin_imm_10;
    _zz_decode_DecodePlugin_imm_11[0] = _zz_decode_DecodePlugin_imm_10;
  end

  assign when_DecodePlugin_l94 = (decode_INSTRUCTION[6 : 0] == 7'h23);
  assign when_DecodePlugin_l96 = (decode_INSTRUCTION[6 : 0] == 7'h63);
  assign when_DecodePlugin_l98 = (decode_INSTRUCTION[6 : 0] == 7'h67);
  assign when_DecodePlugin_l100 = ((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17));
  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b0000000??????????000?????0110011, 32'b0000000??????????000?????0111011, 32'b?????????????????000?????0010011, 32'b?????????????????000?????0011011, 32'b?????????????????????????0010111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_ADD;
      end
      32'b0100000??????????000?????0110011, 32'b0100000??????????000?????0111011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SUB;
      end
      32'b0000000??????????010?????0110011, 32'b?????????????????010?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLT;
      end
      32'b0000000??????????011?????0110011, 32'b?????????????????011?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLTU;
      end
      32'b0000000??????????100?????0110011, 32'b?????????????????100?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_XOR_1;
      end
      32'b0000000??????????001?????0110011, 32'b0000000??????????001?????0010011, 32'b0000000??????????001?????0111011, 32'b0000000??????????001?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLL_1;
      end
      32'b0000000??????????101?????0110011, 32'b0000000??????????101?????0010011, 32'b0000000??????????101?????0111011, 32'b0000000??????????101?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SRL_1;
      end
      32'b0100000??????????101?????0110011, 32'b0100000??????????101?????0010011, 32'b0100000??????????101?????0111011, 32'b0100000??????????101?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SRA_1;
      end
      32'b0000000??????????111?????0110011, 32'b?????????????????111?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_AND_1;
      end
      32'b0000000??????????110?????0110011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_OR_1;
      end
      32'b?????????????????????????0110111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_LUI;
      end
      32'b?????????????????????????0010111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_AUIPC;
      end
      32'b??????????0??????????????1101111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_JAL;
      end
      32'b?????????????????000?????1100111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_JALR;
      end
      default : begin
        decode_DecodePlugin_alu_ctrl = 4'b0000;
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LB;
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LBU;
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LH;
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LHU;
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LW;
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LWU;
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LD;
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SB;
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SH;
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SW;
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SD;
      end
      default : begin
        decode_DecodePlugin_mem_ctrl = 4'b0000;
      end
    endcase
  end

  assign decode_DecodePlugin_regfile_module_read_ports_rs1_addr = decode_INSTRUCTION[19 : 15];
  assign decode_DecodePlugin_regfile_module_read_ports_rs2_addr = decode_INSTRUCTION[24 : 20];
  assign decode_DecodePlugin_regfile_module_read_ports_rs1_req = (! (((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h67)));
  assign decode_DecodePlugin_regfile_module_read_ports_rs2_req = (! ((((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h67)) || ((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67))));
  assign decode_DecodePlugin_rs1 = decode_DecodePlugin_regfile_module_read_ports_rs1_value;
  assign decode_DecodePlugin_rs2 = decode_DecodePlugin_regfile_module_read_ports_rs2_value;
  assign decode_DecodePlugin_rd_wen = (decode_arbitration_isValid && ((((((! (_zz_decode_DecodePlugin_rd_wen == _zz_decode_DecodePlugin_rd_wen_1)) && (! (_zz_decode_DecodePlugin_rd_wen_2 == _zz_decode_DecodePlugin_rd_wen_3))) && (! ((decode_INSTRUCTION & _zz_decode_DecodePlugin_rd_wen_4) == 32'h00100073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h30200073))) && (! (decode_INSTRUCTION[6 : 0] == 7'h0f))));
  assign execute_ALUPlugin_src1_word = execute_ALUPlugin_src1[31 : 0];
  assign execute_ALUPlugin_src2_word = execute_ALUPlugin_src2[31 : 0];
  assign execute_ALUPlugin_shift_bits = execute_ALUPlugin_src2[5 : 0];
  assign execute_ALUPlugin_add_result = ($signed(_zz_execute_ALUPlugin_add_result) + $signed(_zz_execute_ALUPlugin_add_result_1));
  assign execute_ALUPlugin_sub_result = ($signed(_zz_execute_ALUPlugin_sub_result) - $signed(_zz_execute_ALUPlugin_sub_result_1));
  assign execute_ALUPlugin_slt_result = ($signed(_zz_execute_ALUPlugin_slt_result) < $signed(_zz_execute_ALUPlugin_slt_result_1));
  assign execute_ALUPlugin_sltu_result = (execute_ALUPlugin_src1 < execute_ALUPlugin_src2);
  assign execute_ALUPlugin_xor_result = (execute_ALUPlugin_src1 ^ execute_ALUPlugin_src2);
  assign execute_ALUPlugin_sll_result = (execute_ALUPlugin_src1 <<< execute_ALUPlugin_shift_bits);
  assign execute_ALUPlugin_srl_result = (execute_ALUPlugin_src1 >>> execute_ALUPlugin_shift_bits);
  assign execute_ALUPlugin_sra_result = ($signed(_zz_execute_ALUPlugin_sra_result) >>> execute_ALUPlugin_shift_bits);
  assign execute_ALUPlugin_and_result = (execute_ALUPlugin_src1 & execute_ALUPlugin_src2);
  assign execute_ALUPlugin_or_result = (execute_ALUPlugin_src1 | execute_ALUPlugin_src2);
  assign _zz_execute_ALUPlugin_addw_result = execute_ALUPlugin_add_result[31];
  always @(*) begin
    _zz_execute_ALUPlugin_addw_result_1[31] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[30] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[29] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[28] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[27] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[26] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[25] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[24] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[23] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[22] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[21] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[20] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[19] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[18] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[17] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[16] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[15] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[14] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[13] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[12] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[11] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[10] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[9] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[8] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[7] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[6] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[5] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[4] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[3] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[2] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[1] = _zz_execute_ALUPlugin_addw_result;
    _zz_execute_ALUPlugin_addw_result_1[0] = _zz_execute_ALUPlugin_addw_result;
  end

  assign execute_ALUPlugin_addw_result = {_zz_execute_ALUPlugin_addw_result_1,_zz_execute_ALUPlugin_addw_result_2};
  assign _zz_execute_ALUPlugin_subw_result = execute_ALUPlugin_sub_result[31];
  always @(*) begin
    _zz_execute_ALUPlugin_subw_result_1[31] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[30] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[29] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[28] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[27] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[26] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[25] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[24] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[23] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[22] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[21] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[20] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[19] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[18] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[17] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[16] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[15] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[14] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[13] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[12] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[11] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[10] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[9] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[8] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[7] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[6] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[5] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[4] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[3] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[2] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[1] = _zz_execute_ALUPlugin_subw_result;
    _zz_execute_ALUPlugin_subw_result_1[0] = _zz_execute_ALUPlugin_subw_result;
  end

  assign execute_ALUPlugin_subw_result = {_zz_execute_ALUPlugin_subw_result_1,_zz_execute_ALUPlugin_subw_result_2};
  assign execute_ALUPlugin_sllw_temp = (execute_ALUPlugin_src1_word <<< execute_ALUPlugin_shift_bits[4 : 0]);
  assign _zz_execute_ALUPlugin_sllw_result = execute_ALUPlugin_sllw_temp[31];
  always @(*) begin
    _zz_execute_ALUPlugin_sllw_result_1[31] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[30] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[29] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[28] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[27] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[26] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[25] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[24] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[23] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[22] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[21] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[20] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[19] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[18] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[17] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[16] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[15] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[14] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[13] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[12] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[11] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[10] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[9] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[8] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[7] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[6] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[5] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[4] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[3] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[2] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[1] = _zz_execute_ALUPlugin_sllw_result;
    _zz_execute_ALUPlugin_sllw_result_1[0] = _zz_execute_ALUPlugin_sllw_result;
  end

  assign execute_ALUPlugin_sllw_result = {_zz_execute_ALUPlugin_sllw_result_1,execute_ALUPlugin_sllw_temp};
  assign execute_ALUPlugin_srlw_temp = (execute_ALUPlugin_src1_word >>> execute_ALUPlugin_shift_bits[4 : 0]);
  assign _zz_execute_ALUPlugin_srlw_result = execute_ALUPlugin_srlw_temp[31];
  always @(*) begin
    _zz_execute_ALUPlugin_srlw_result_1[31] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[30] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[29] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[28] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[27] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[26] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[25] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[24] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[23] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[22] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[21] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[20] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[19] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[18] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[17] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[16] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[15] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[14] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[13] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[12] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[11] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[10] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[9] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[8] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[7] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[6] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[5] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[4] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[3] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[2] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[1] = _zz_execute_ALUPlugin_srlw_result;
    _zz_execute_ALUPlugin_srlw_result_1[0] = _zz_execute_ALUPlugin_srlw_result;
  end

  assign execute_ALUPlugin_srlw_result = {_zz_execute_ALUPlugin_srlw_result_1,execute_ALUPlugin_srlw_temp};
  assign execute_ALUPlugin_sraw_temp = ($signed(_zz_execute_ALUPlugin_sraw_temp) >>> execute_ALUPlugin_shift_bits[4 : 0]);
  assign _zz_execute_ALUPlugin_sraw_result = execute_ALUPlugin_sraw_temp[31];
  always @(*) begin
    _zz_execute_ALUPlugin_sraw_result_1[31] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[30] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[29] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[28] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[27] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[26] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[25] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[24] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[23] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[22] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[21] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[20] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[19] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[18] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[17] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[16] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[15] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[14] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[13] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[12] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[11] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[10] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[9] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[8] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[7] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[6] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[5] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[4] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[3] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[2] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[1] = _zz_execute_ALUPlugin_sraw_result;
    _zz_execute_ALUPlugin_sraw_result_1[0] = _zz_execute_ALUPlugin_sraw_result;
  end

  assign execute_ALUPlugin_sraw_result = {_zz_execute_ALUPlugin_sraw_result_1,execute_ALUPlugin_sraw_temp};
  assign execute_ALUPlugin_op_is_jump = ((decode_ALU_CTRL == AluCtrlEnum_JAL) || (decode_ALU_CTRL == AluCtrlEnum_JALR));
  assign when_AluPlugin_l56 = (decode_ALU_CTRL == AluCtrlEnum_JALR);
  always @(*) begin
    if(when_AluPlugin_l56) begin
      execute_ALUPlugin_pc_next = _zz_execute_ALUPlugin_pc_next;
    end else begin
      execute_ALUPlugin_pc_next = _zz_execute_ALUPlugin_pc_next_6;
    end
  end

  assign when_AluPlugin_l62 = ((decode_ALU_CTRL == AluCtrlEnum_AUIPC) || execute_ALUPlugin_op_is_jump);
  always @(*) begin
    if(when_AluPlugin_l62) begin
      execute_ALUPlugin_src1 = decode_PC;
    end else begin
      execute_ALUPlugin_src1 = decode_RS1;
    end
  end

  always @(*) begin
    if(decode_SRC2_IS_IMM) begin
      execute_ALUPlugin_src2 = decode_IMM;
    end else begin
      if(execute_ALUPlugin_op_is_jump) begin
        execute_ALUPlugin_src2 = 64'h0000000000000004;
      end else begin
        execute_ALUPlugin_src2 = decode_RS2;
      end
    end
  end

  assign when_AluPlugin_l77 = (decode_ALU_WORD == 1'b1);
  always @(*) begin
    if((decode_ALU_CTRL == AluCtrlEnum_ADD) || (decode_ALU_CTRL == AluCtrlEnum_AUIPC)) begin
        if(when_AluPlugin_l77) begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_addw_result;
        end else begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_add_result;
        end
    end else if((decode_ALU_CTRL == AluCtrlEnum_SUB)) begin
        if(when_AluPlugin_l84) begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_subw_result;
        end else begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_sub_result;
        end
    end else if((decode_ALU_CTRL == AluCtrlEnum_SLT)) begin
        execute_ALUPlugin_rd_value = {_zz_execute_ALUPlugin_rd_value,execute_ALUPlugin_slt_result};
    end else if((decode_ALU_CTRL == AluCtrlEnum_SLTU)) begin
        execute_ALUPlugin_rd_value = {_zz_execute_ALUPlugin_rd_value_1,execute_ALUPlugin_sltu_result};
    end else if((decode_ALU_CTRL == AluCtrlEnum_XOR_1)) begin
        execute_ALUPlugin_rd_value = execute_ALUPlugin_xor_result;
    end else if((decode_ALU_CTRL == AluCtrlEnum_SLL_1)) begin
        if(when_AluPlugin_l100) begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_sllw_result;
        end else begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_sll_result;
        end
    end else if((decode_ALU_CTRL == AluCtrlEnum_SRL_1)) begin
        if(when_AluPlugin_l107) begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_srlw_result;
        end else begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_srl_result;
        end
    end else if((decode_ALU_CTRL == AluCtrlEnum_SRA_1)) begin
        if(when_AluPlugin_l114) begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_sraw_result;
        end else begin
          execute_ALUPlugin_rd_value = execute_ALUPlugin_sra_result;
        end
    end else if((decode_ALU_CTRL == AluCtrlEnum_AND_1)) begin
        execute_ALUPlugin_rd_value = execute_ALUPlugin_and_result;
    end else if((decode_ALU_CTRL == AluCtrlEnum_OR_1)) begin
        execute_ALUPlugin_rd_value = execute_ALUPlugin_or_result;
    end else if((decode_ALU_CTRL == AluCtrlEnum_LUI)) begin
        execute_ALUPlugin_rd_value = decode_IMM;
    end else begin
        execute_ALUPlugin_rd_value = 64'h0;
    end
  end

  assign when_AluPlugin_l84 = (decode_ALU_WORD == 1'b1);
  assign _zz_execute_ALUPlugin_rd_value[62 : 0] = 63'h0;
  assign _zz_execute_ALUPlugin_rd_value_1[62 : 0] = 63'h0;
  assign when_AluPlugin_l100 = (decode_ALU_WORD == 1'b1);
  assign when_AluPlugin_l107 = (decode_ALU_WORD == 1'b1);
  assign when_AluPlugin_l114 = (decode_ALU_WORD == 1'b1);
  assign ICachePlugin_icache_access_cmd_ready = iCache_1_cpu_cmd_ready;
  assign fetch_arbitration_isValid = 1'b1;
  assign when_Pipeline_l124 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l124_1 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l124_2 = (! execute_arbitration_isStuck);
  assign fetch_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,{decode_arbitration_flushIt,fetch_arbitration_flushIt}}}} != 5'h0));
  assign decode_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000));
  assign execute_arbitration_isFlushed = (({writeback_arbitration_flushNext,memaccess_arbitration_flushNext} != 2'b00) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000));
  assign memaccess_arbitration_isFlushed = ((writeback_arbitration_flushNext != 1'b0) || ({writeback_arbitration_flushIt,memaccess_arbitration_flushIt} != 2'b00));
  assign writeback_arbitration_isFlushed = (1'b0 || (writeback_arbitration_flushIt != 1'b0));
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((1'b0 || decode_arbitration_isStuck) || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers);
  assign fetch_arbitration_isMoving = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign fetch_arbitration_isFiring = ((fetch_arbitration_isValid && (! fetch_arbitration_isStuck)) && (! fetch_arbitration_removeIt));
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers);
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt));
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck));
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers);
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt));
  assign memaccess_arbitration_isStuckByOthers = (memaccess_arbitration_haltByOther || (1'b0 || writeback_arbitration_isStuck));
  assign memaccess_arbitration_isStuck = (memaccess_arbitration_haltItself || memaccess_arbitration_isStuckByOthers);
  assign memaccess_arbitration_isMoving = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt));
  assign memaccess_arbitration_isFiring = ((memaccess_arbitration_isValid && (! memaccess_arbitration_isStuck)) && (! memaccess_arbitration_removeIt));
  assign writeback_arbitration_isStuckByOthers = (writeback_arbitration_haltByOther || 1'b0);
  assign writeback_arbitration_isStuck = (writeback_arbitration_haltItself || writeback_arbitration_isStuckByOthers);
  assign writeback_arbitration_isMoving = ((! writeback_arbitration_isStuck) && (! writeback_arbitration_removeIt));
  assign writeback_arbitration_isFiring = ((writeback_arbitration_isValid && (! writeback_arbitration_isStuck)) && (! writeback_arbitration_removeIt));
  assign when_Pipeline_l151 = ((! decode_arbitration_isStuck) || decode_arbitration_removeIt);
  assign when_Pipeline_l154 = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign when_Pipeline_l151_1 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l154_1 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l151_2 = ((! memaccess_arbitration_isStuck) || memaccess_arbitration_removeIt);
  assign when_Pipeline_l154_2 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l151_3 = ((! writeback_arbitration_isStuck) || writeback_arbitration_removeIt);
  assign when_Pipeline_l154_3 = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      _zz_ICachePlugin_icache_access_cmd_payload_addr_2 <= 64'h0000000080000000;
      _zz_ICachePlugin_icache_access_cmd_valid <= 1'b0;
      _zz_ICachePlugin_icache_access_cmd_payload_addr_3 <= 64'h0;
      when_InstructionFetchPlugin_l112 <= 1'b0;
      _zz_when_InstructionFetchPlugin_l104_2 <= 2'b00;
      decode_arbitration_isValid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memaccess_arbitration_isValid <= 1'b0;
      writeback_arbitration_isValid <= 1'b0;
    end else begin
      _zz_when_InstructionFetchPlugin_l104_2 <= _zz_when_InstructionFetchPlugin_l104_1;
      case(_zz_when_InstructionFetchPlugin_l104_2)
        2'b00 : begin
          if(when_InstructionFetchPlugin_l88) begin
            _zz_when_InstructionFetchPlugin_l104_2 <= 2'b01;
          end
        end
        2'b01 : begin
          if(ICachePlugin_icache_access_cmd_isStall) begin
            _zz_when_InstructionFetchPlugin_l104_2 <= 2'b10;
          end
        end
        2'b10 : begin
          if(ICachePlugin_icache_access_cmd_fire_1) begin
            _zz_when_InstructionFetchPlugin_l104_2 <= 2'b01;
          end
        end
        default : begin
        end
      endcase
      if(when_InstructionFetchPlugin_l104) begin
        when_InstructionFetchPlugin_l112 <= 1'b1;
        _zz_ICachePlugin_icache_access_cmd_payload_addr_3 <= _zz_ICachePlugin_icache_access_cmd_payload_addr;
      end else begin
        if(ICachePlugin_icache_access_rsp_valid) begin
          when_InstructionFetchPlugin_l112 <= 1'b0;
        end
      end
      if(when_InstructionFetchPlugin_l111) begin
        if(when_InstructionFetchPlugin_l112) begin
          _zz_ICachePlugin_icache_access_cmd_payload_addr_2 <= _zz_ICachePlugin_icache_access_cmd_payload_addr_3;
        end
        if(_zz_when_InstructionFetchPlugin_l104) begin
          _zz_ICachePlugin_icache_access_cmd_payload_addr_2 <= _zz_ICachePlugin_icache_access_cmd_payload_addr;
        end else begin
          if(_zz_1) begin
            _zz_ICachePlugin_icache_access_cmd_payload_addr_2 <= _zz_ICachePlugin_icache_access_cmd_payload_addr_1;
          end else begin
            _zz_ICachePlugin_icache_access_cmd_payload_addr_2 <= (_zz_ICachePlugin_icache_access_cmd_payload_addr_2 + 64'h0000000000000004);
          end
        end
      end
      if(when_InstructionFetchPlugin_l124) begin
        _zz_ICachePlugin_icache_access_cmd_valid <= 1'b1;
      end
      if(when_Pipeline_l151) begin
        decode_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154) begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end
      if(when_Pipeline_l151_1) begin
        execute_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_1) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end
      if(when_Pipeline_l151_2) begin
        memaccess_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_2) begin
        memaccess_arbitration_isValid <= execute_arbitration_isValid;
      end
      if(when_Pipeline_l151_3) begin
        writeback_arbitration_isValid <= 1'b0;
      end
      if(when_Pipeline_l154_3) begin
        writeback_arbitration_isValid <= memaccess_arbitration_isValid;
      end
    end
  end

  always @(posedge clk) begin
    if(ICachePlugin_icache_access_cmd_fire) begin
      _zz_fetch_PC <= _zz_ICachePlugin_icache_access_cmd_payload_addr_2;
    end
    if(when_Pipeline_l124) begin
      fetch_to_decode_PC <= fetch_PC;
    end
    if(when_Pipeline_l124_1) begin
      fetch_to_decode_INSTRUCTION <= fetch_INSTRUCTION;
    end
    if(when_Pipeline_l124_2) begin
      decode_to_execute_IMM <= decode_IMM;
    end
  end


endmodule

module SramBanks (
  input               sram_0_ports_cmd_valid,
  input      [4:0]    sram_0_ports_cmd_payload_addr,
  input               sram_0_ports_cmd_payload_wen,
  input      [255:0]  sram_0_ports_cmd_payload_wdata,
  output              sram_0_ports_rsp_valid,
  output     [255:0]  sram_0_ports_rsp_payload_data,
  input               sram_1_ports_cmd_valid,
  input      [4:0]    sram_1_ports_cmd_payload_addr,
  input               sram_1_ports_cmd_payload_wen,
  input      [255:0]  sram_1_ports_cmd_payload_wdata,
  output              sram_1_ports_rsp_valid,
  output     [255:0]  sram_1_ports_rsp_payload_data,
  input               sram_2_ports_cmd_valid,
  input      [4:0]    sram_2_ports_cmd_payload_addr,
  input               sram_2_ports_cmd_payload_wen,
  input      [255:0]  sram_2_ports_cmd_payload_wdata,
  output              sram_2_ports_rsp_valid,
  output     [255:0]  sram_2_ports_rsp_payload_data,
  input               sram_3_ports_cmd_valid,
  input      [4:0]    sram_3_ports_cmd_payload_addr,
  input               sram_3_ports_cmd_payload_wen,
  input      [255:0]  sram_3_ports_cmd_payload_wdata,
  output              sram_3_ports_rsp_valid,
  output     [255:0]  sram_3_ports_rsp_payload_data,
  input               clk,
  input               reset
);

  reg        [255:0]  _zz_sram_0_banks_port1;
  reg        [255:0]  _zz_sram_1_banks_port1;
  reg        [255:0]  _zz_sram_2_banks_port1;
  reg        [255:0]  _zz_sram_3_banks_port1;
  reg                 sram_0_rsp_valid;
  reg                 sram_1_rsp_valid;
  reg                 sram_2_rsp_valid;
  reg                 sram_3_rsp_valid;
  reg [255:0] sram_0_banks [0:31];
  reg [255:0] sram_1_banks [0:31];
  reg [255:0] sram_2_banks [0:31];
  reg [255:0] sram_3_banks [0:31];

  always @(posedge clk) begin
    if(sram_0_ports_cmd_valid) begin
      sram_0_banks[sram_0_ports_cmd_payload_addr] <= sram_0_ports_cmd_payload_wdata;
    end
  end

  always @(posedge clk) begin
    if(sram_0_ports_cmd_valid) begin
      _zz_sram_0_banks_port1 <= sram_0_banks[sram_0_ports_cmd_payload_addr];
    end
  end

  always @(posedge clk) begin
    if(sram_1_ports_cmd_valid) begin
      sram_1_banks[sram_1_ports_cmd_payload_addr] <= sram_1_ports_cmd_payload_wdata;
    end
  end

  always @(posedge clk) begin
    if(sram_1_ports_cmd_valid) begin
      _zz_sram_1_banks_port1 <= sram_1_banks[sram_1_ports_cmd_payload_addr];
    end
  end

  always @(posedge clk) begin
    if(sram_2_ports_cmd_valid) begin
      sram_2_banks[sram_2_ports_cmd_payload_addr] <= sram_2_ports_cmd_payload_wdata;
    end
  end

  always @(posedge clk) begin
    if(sram_2_ports_cmd_valid) begin
      _zz_sram_2_banks_port1 <= sram_2_banks[sram_2_ports_cmd_payload_addr];
    end
  end

  always @(posedge clk) begin
    if(sram_3_ports_cmd_valid) begin
      sram_3_banks[sram_3_ports_cmd_payload_addr] <= sram_3_ports_cmd_payload_wdata;
    end
  end

  always @(posedge clk) begin
    if(sram_3_ports_cmd_valid) begin
      _zz_sram_3_banks_port1 <= sram_3_banks[sram_3_ports_cmd_payload_addr];
    end
  end

  assign sram_0_ports_rsp_payload_data = _zz_sram_0_banks_port1;
  assign sram_0_ports_rsp_valid = sram_0_rsp_valid;
  assign sram_1_ports_rsp_payload_data = _zz_sram_1_banks_port1;
  assign sram_1_ports_rsp_valid = sram_1_rsp_valid;
  assign sram_2_ports_rsp_payload_data = _zz_sram_2_banks_port1;
  assign sram_2_ports_rsp_valid = sram_2_rsp_valid;
  assign sram_3_ports_rsp_payload_data = _zz_sram_3_banks_port1;
  assign sram_3_ports_rsp_valid = sram_3_rsp_valid;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      sram_0_rsp_valid <= 1'b0;
      sram_1_rsp_valid <= 1'b0;
      sram_2_rsp_valid <= 1'b0;
      sram_3_rsp_valid <= 1'b0;
    end else begin
      if(sram_0_ports_cmd_valid) begin
        sram_0_rsp_valid <= 1'b1;
      end else begin
        sram_0_rsp_valid <= 1'b0;
      end
      if(sram_1_ports_cmd_valid) begin
        sram_1_rsp_valid <= 1'b1;
      end else begin
        sram_1_rsp_valid <= 1'b0;
      end
      if(sram_2_ports_cmd_valid) begin
        sram_2_rsp_valid <= 1'b1;
      end else begin
        sram_2_rsp_valid <= 1'b0;
      end
      if(sram_3_ports_cmd_valid) begin
        sram_3_rsp_valid <= 1'b1;
      end else begin
        sram_3_rsp_valid <= 1'b0;
      end
    end
  end


endmodule

module ICache (
  input               flush,
  input               cpu_cmd_valid,
  output              cpu_cmd_ready,
  input      [63:0]   cpu_cmd_payload_addr,
  input      [2:0]    cpu_cmd_payload_size,
  output              cpu_rsp_valid,
  output     [31:0]   cpu_rsp_payload_data,
  output reg          sram_0_ports_cmd_valid,
  output reg [4:0]    sram_0_ports_cmd_payload_addr,
  output reg          sram_0_ports_cmd_payload_wen,
  output reg [255:0]  sram_0_ports_cmd_payload_wdata,
  input               sram_0_ports_rsp_valid,
  input      [255:0]  sram_0_ports_rsp_payload_data,
  output reg          sram_1_ports_cmd_valid,
  output reg [4:0]    sram_1_ports_cmd_payload_addr,
  output reg          sram_1_ports_cmd_payload_wen,
  output reg [255:0]  sram_1_ports_cmd_payload_wdata,
  input               sram_1_ports_rsp_valid,
  input      [255:0]  sram_1_ports_rsp_payload_data,
  output reg          sram_2_ports_cmd_valid,
  output reg [4:0]    sram_2_ports_cmd_payload_addr,
  output reg          sram_2_ports_cmd_payload_wen,
  output reg [255:0]  sram_2_ports_cmd_payload_wdata,
  input               sram_2_ports_rsp_valid,
  input      [255:0]  sram_2_ports_rsp_payload_data,
  output reg          sram_3_ports_cmd_valid,
  output reg [4:0]    sram_3_ports_cmd_payload_addr,
  output reg          sram_3_ports_cmd_payload_wen,
  output reg [255:0]  sram_3_ports_cmd_payload_wdata,
  input               sram_3_ports_rsp_valid,
  input      [255:0]  sram_3_ports_rsp_payload_data,
  output              next_level_cmd_valid,
  input               next_level_cmd_ready,
  output     [63:0]   next_level_cmd_payload_addr,
  output     [3:0]    next_level_cmd_payload_len,
  input               next_level_rsp_valid,
  input      [255:0]  next_level_rsp_payload_data,
  input               clk,
  input               reset
);

  reg        [53:0]   _zz_icache_tag_0;
  reg                 _zz_icache_hit_0;
  reg                 _zz_icache_replace_info_0;
  reg                 _zz_icache_victim_0;
  reg        [53:0]   _zz_icache_tag_1;
  reg                 _zz_icache_hit_1;
  reg                 _zz_icache_replace_info_1;
  reg                 _zz_icache_victim_1;
  reg        [53:0]   _zz_icache_tag_2;
  reg                 _zz_icache_hit_2;
  reg                 _zz_icache_replace_info_2;
  reg                 _zz_icache_victim_2;
  reg        [53:0]   _zz_icache_tag_3;
  reg                 _zz_icache_hit_3;
  reg                 _zz_icache_replace_info_3;
  reg                 _zz_icache_victim_3;
  reg        [255:0]  _zz__zz_cpu_rsp_payload_data;
  reg        [31:0]   _zz_cpu_rsp_payload_data_1;
  reg                 _zz_cpu_rsp_valid;
  reg                 ways_0_metas_0_valid;
  reg        [53:0]   ways_0_metas_0_tag;
  reg                 ways_0_metas_0_replace_info;
  reg                 ways_0_metas_1_valid;
  reg        [53:0]   ways_0_metas_1_tag;
  reg                 ways_0_metas_1_replace_info;
  reg                 ways_0_metas_2_valid;
  reg        [53:0]   ways_0_metas_2_tag;
  reg                 ways_0_metas_2_replace_info;
  reg                 ways_0_metas_3_valid;
  reg        [53:0]   ways_0_metas_3_tag;
  reg                 ways_0_metas_3_replace_info;
  reg                 ways_0_metas_4_valid;
  reg        [53:0]   ways_0_metas_4_tag;
  reg                 ways_0_metas_4_replace_info;
  reg                 ways_0_metas_5_valid;
  reg        [53:0]   ways_0_metas_5_tag;
  reg                 ways_0_metas_5_replace_info;
  reg                 ways_0_metas_6_valid;
  reg        [53:0]   ways_0_metas_6_tag;
  reg                 ways_0_metas_6_replace_info;
  reg                 ways_0_metas_7_valid;
  reg        [53:0]   ways_0_metas_7_tag;
  reg                 ways_0_metas_7_replace_info;
  reg                 ways_0_metas_8_valid;
  reg        [53:0]   ways_0_metas_8_tag;
  reg                 ways_0_metas_8_replace_info;
  reg                 ways_0_metas_9_valid;
  reg        [53:0]   ways_0_metas_9_tag;
  reg                 ways_0_metas_9_replace_info;
  reg                 ways_0_metas_10_valid;
  reg        [53:0]   ways_0_metas_10_tag;
  reg                 ways_0_metas_10_replace_info;
  reg                 ways_0_metas_11_valid;
  reg        [53:0]   ways_0_metas_11_tag;
  reg                 ways_0_metas_11_replace_info;
  reg                 ways_0_metas_12_valid;
  reg        [53:0]   ways_0_metas_12_tag;
  reg                 ways_0_metas_12_replace_info;
  reg                 ways_0_metas_13_valid;
  reg        [53:0]   ways_0_metas_13_tag;
  reg                 ways_0_metas_13_replace_info;
  reg                 ways_0_metas_14_valid;
  reg        [53:0]   ways_0_metas_14_tag;
  reg                 ways_0_metas_14_replace_info;
  reg                 ways_0_metas_15_valid;
  reg        [53:0]   ways_0_metas_15_tag;
  reg                 ways_0_metas_15_replace_info;
  reg                 ways_1_metas_0_valid;
  reg        [53:0]   ways_1_metas_0_tag;
  reg                 ways_1_metas_0_replace_info;
  reg                 ways_1_metas_1_valid;
  reg        [53:0]   ways_1_metas_1_tag;
  reg                 ways_1_metas_1_replace_info;
  reg                 ways_1_metas_2_valid;
  reg        [53:0]   ways_1_metas_2_tag;
  reg                 ways_1_metas_2_replace_info;
  reg                 ways_1_metas_3_valid;
  reg        [53:0]   ways_1_metas_3_tag;
  reg                 ways_1_metas_3_replace_info;
  reg                 ways_1_metas_4_valid;
  reg        [53:0]   ways_1_metas_4_tag;
  reg                 ways_1_metas_4_replace_info;
  reg                 ways_1_metas_5_valid;
  reg        [53:0]   ways_1_metas_5_tag;
  reg                 ways_1_metas_5_replace_info;
  reg                 ways_1_metas_6_valid;
  reg        [53:0]   ways_1_metas_6_tag;
  reg                 ways_1_metas_6_replace_info;
  reg                 ways_1_metas_7_valid;
  reg        [53:0]   ways_1_metas_7_tag;
  reg                 ways_1_metas_7_replace_info;
  reg                 ways_1_metas_8_valid;
  reg        [53:0]   ways_1_metas_8_tag;
  reg                 ways_1_metas_8_replace_info;
  reg                 ways_1_metas_9_valid;
  reg        [53:0]   ways_1_metas_9_tag;
  reg                 ways_1_metas_9_replace_info;
  reg                 ways_1_metas_10_valid;
  reg        [53:0]   ways_1_metas_10_tag;
  reg                 ways_1_metas_10_replace_info;
  reg                 ways_1_metas_11_valid;
  reg        [53:0]   ways_1_metas_11_tag;
  reg                 ways_1_metas_11_replace_info;
  reg                 ways_1_metas_12_valid;
  reg        [53:0]   ways_1_metas_12_tag;
  reg                 ways_1_metas_12_replace_info;
  reg                 ways_1_metas_13_valid;
  reg        [53:0]   ways_1_metas_13_tag;
  reg                 ways_1_metas_13_replace_info;
  reg                 ways_1_metas_14_valid;
  reg        [53:0]   ways_1_metas_14_tag;
  reg                 ways_1_metas_14_replace_info;
  reg                 ways_1_metas_15_valid;
  reg        [53:0]   ways_1_metas_15_tag;
  reg                 ways_1_metas_15_replace_info;
  reg                 ways_2_metas_0_valid;
  reg        [53:0]   ways_2_metas_0_tag;
  reg                 ways_2_metas_0_replace_info;
  reg                 ways_2_metas_1_valid;
  reg        [53:0]   ways_2_metas_1_tag;
  reg                 ways_2_metas_1_replace_info;
  reg                 ways_2_metas_2_valid;
  reg        [53:0]   ways_2_metas_2_tag;
  reg                 ways_2_metas_2_replace_info;
  reg                 ways_2_metas_3_valid;
  reg        [53:0]   ways_2_metas_3_tag;
  reg                 ways_2_metas_3_replace_info;
  reg                 ways_2_metas_4_valid;
  reg        [53:0]   ways_2_metas_4_tag;
  reg                 ways_2_metas_4_replace_info;
  reg                 ways_2_metas_5_valid;
  reg        [53:0]   ways_2_metas_5_tag;
  reg                 ways_2_metas_5_replace_info;
  reg                 ways_2_metas_6_valid;
  reg        [53:0]   ways_2_metas_6_tag;
  reg                 ways_2_metas_6_replace_info;
  reg                 ways_2_metas_7_valid;
  reg        [53:0]   ways_2_metas_7_tag;
  reg                 ways_2_metas_7_replace_info;
  reg                 ways_2_metas_8_valid;
  reg        [53:0]   ways_2_metas_8_tag;
  reg                 ways_2_metas_8_replace_info;
  reg                 ways_2_metas_9_valid;
  reg        [53:0]   ways_2_metas_9_tag;
  reg                 ways_2_metas_9_replace_info;
  reg                 ways_2_metas_10_valid;
  reg        [53:0]   ways_2_metas_10_tag;
  reg                 ways_2_metas_10_replace_info;
  reg                 ways_2_metas_11_valid;
  reg        [53:0]   ways_2_metas_11_tag;
  reg                 ways_2_metas_11_replace_info;
  reg                 ways_2_metas_12_valid;
  reg        [53:0]   ways_2_metas_12_tag;
  reg                 ways_2_metas_12_replace_info;
  reg                 ways_2_metas_13_valid;
  reg        [53:0]   ways_2_metas_13_tag;
  reg                 ways_2_metas_13_replace_info;
  reg                 ways_2_metas_14_valid;
  reg        [53:0]   ways_2_metas_14_tag;
  reg                 ways_2_metas_14_replace_info;
  reg                 ways_2_metas_15_valid;
  reg        [53:0]   ways_2_metas_15_tag;
  reg                 ways_2_metas_15_replace_info;
  reg                 ways_3_metas_0_valid;
  reg        [53:0]   ways_3_metas_0_tag;
  reg                 ways_3_metas_0_replace_info;
  reg                 ways_3_metas_1_valid;
  reg        [53:0]   ways_3_metas_1_tag;
  reg                 ways_3_metas_1_replace_info;
  reg                 ways_3_metas_2_valid;
  reg        [53:0]   ways_3_metas_2_tag;
  reg                 ways_3_metas_2_replace_info;
  reg                 ways_3_metas_3_valid;
  reg        [53:0]   ways_3_metas_3_tag;
  reg                 ways_3_metas_3_replace_info;
  reg                 ways_3_metas_4_valid;
  reg        [53:0]   ways_3_metas_4_tag;
  reg                 ways_3_metas_4_replace_info;
  reg                 ways_3_metas_5_valid;
  reg        [53:0]   ways_3_metas_5_tag;
  reg                 ways_3_metas_5_replace_info;
  reg                 ways_3_metas_6_valid;
  reg        [53:0]   ways_3_metas_6_tag;
  reg                 ways_3_metas_6_replace_info;
  reg                 ways_3_metas_7_valid;
  reg        [53:0]   ways_3_metas_7_tag;
  reg                 ways_3_metas_7_replace_info;
  reg                 ways_3_metas_8_valid;
  reg        [53:0]   ways_3_metas_8_tag;
  reg                 ways_3_metas_8_replace_info;
  reg                 ways_3_metas_9_valid;
  reg        [53:0]   ways_3_metas_9_tag;
  reg                 ways_3_metas_9_replace_info;
  reg                 ways_3_metas_10_valid;
  reg        [53:0]   ways_3_metas_10_tag;
  reg                 ways_3_metas_10_replace_info;
  reg                 ways_3_metas_11_valid;
  reg        [53:0]   ways_3_metas_11_tag;
  reg                 ways_3_metas_11_replace_info;
  reg                 ways_3_metas_12_valid;
  reg        [53:0]   ways_3_metas_12_tag;
  reg                 ways_3_metas_12_replace_info;
  reg                 ways_3_metas_13_valid;
  reg        [53:0]   ways_3_metas_13_tag;
  reg                 ways_3_metas_13_replace_info;
  reg                 ways_3_metas_14_valid;
  reg        [53:0]   ways_3_metas_14_tag;
  reg                 ways_3_metas_14_replace_info;
  reg                 ways_3_metas_15_valid;
  reg        [53:0]   ways_3_metas_15_tag;
  reg                 ways_3_metas_15_replace_info;
  wire       [53:0]   icache_tag_0;
  wire       [53:0]   icache_tag_1;
  wire       [53:0]   icache_tag_2;
  wire       [53:0]   icache_tag_3;
  wire                icache_hit_0;
  wire                icache_hit_1;
  wire                icache_hit_2;
  wire                icache_hit_3;
  wire                icache_victim_0;
  reg                 icache_victim_1;
  reg                 icache_victim_2;
  reg                 icache_victim_3;
  wire                icache_replace_info_0;
  wire                icache_replace_info_1;
  wire                icache_replace_info_2;
  wire                icache_replace_info_3;
  wire       [1:0]    hit_way_id;
  wire                replace_info_full;
  wire                cpu_cmd_fire;
  wire                is_hit;
  wire                cpu_cmd_fire_1;
  wire                is_miss;
  wire       [53:0]   cpu_tag;
  wire       [3:0]    cpu_set;
  wire       [4:0]    cpu_bank_offset;
  wire       [4:0]    cpu_bank_addr;
  wire       [2:0]    cpu_bank_sel;
  reg        [63:0]   cpu_addr_d1;
  wire       [3:0]    cpu_set_d1;
  wire       [53:0]   cpu_tag_d1;
  reg                 cpu_cmd_ready_1;
  wire       [255:0]  sram_banks_data_0;
  wire       [255:0]  sram_banks_data_1;
  wire       [255:0]  sram_banks_data_2;
  wire       [255:0]  sram_banks_data_3;
  wire                sram_banks_valid_0;
  wire                sram_banks_valid_1;
  wire                sram_banks_valid_2;
  wire                sram_banks_valid_3;
  reg                 next_level_cmd_valid_1;
  reg                 next_level_data_cnt_willIncrement;
  reg                 next_level_data_cnt_willClear;
  reg        [0:0]    next_level_data_cnt_valueNext;
  reg        [0:0]    next_level_data_cnt_value;
  wire                next_level_data_cnt_willOverflowIfInc;
  wire                next_level_data_cnt_willOverflow;
  wire       [3:0]    next_level_bank_addr;
  wire                next_level_cmd_fire;
  wire                when_ICache_l115;
  wire                _zz_hit_way_id;
  wire                _zz_hit_way_id_1;
  wire       [15:0]   _zz_1;
  wire                _zz_2;
  wire                _zz_3;
  wire                _zz_4;
  wire                _zz_5;
  wire                _zz_6;
  wire                _zz_7;
  wire                _zz_8;
  wire                _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  wire                _zz_12;
  wire                _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  wire       [15:0]   _zz_18;
  wire                _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  wire                _zz_24;
  wire                _zz_25;
  wire                _zz_26;
  wire                _zz_27;
  wire                _zz_28;
  wire                _zz_29;
  wire                _zz_30;
  wire                _zz_31;
  wire                _zz_32;
  wire                _zz_33;
  wire                _zz_34;
  wire                cpu_cmd_fire_2;
  wire                when_ICache_l166;
  wire                when_ICache_l183;
  wire                when_ICache_l192;
  wire       [15:0]   _zz_35;
  wire                _zz_36;
  wire                _zz_37;
  wire                _zz_38;
  wire                _zz_39;
  wire                _zz_40;
  wire                _zz_41;
  wire                _zz_42;
  wire                _zz_43;
  wire                _zz_44;
  wire                _zz_45;
  wire                _zz_46;
  wire                _zz_47;
  wire                _zz_48;
  wire                _zz_49;
  wire                _zz_50;
  wire                _zz_51;
  wire       [15:0]   _zz_52;
  wire                _zz_53;
  wire                _zz_54;
  wire                _zz_55;
  wire                _zz_56;
  wire                _zz_57;
  wire                _zz_58;
  wire                _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  wire                _zz_62;
  wire                _zz_63;
  wire                _zz_64;
  wire                _zz_65;
  wire                _zz_66;
  wire                _zz_67;
  wire                _zz_68;
  wire                cpu_cmd_fire_3;
  wire                when_ICache_l166_1;
  wire                when_ICache_l183_1;
  wire                when_ICache_l192_1;
  wire       [15:0]   _zz_69;
  wire                _zz_70;
  wire                _zz_71;
  wire                _zz_72;
  wire                _zz_73;
  wire                _zz_74;
  wire                _zz_75;
  wire                _zz_76;
  wire                _zz_77;
  wire                _zz_78;
  wire                _zz_79;
  wire                _zz_80;
  wire                _zz_81;
  wire                _zz_82;
  wire                _zz_83;
  wire                _zz_84;
  wire                _zz_85;
  wire       [15:0]   _zz_86;
  wire                _zz_87;
  wire                _zz_88;
  wire                _zz_89;
  wire                _zz_90;
  wire                _zz_91;
  wire                _zz_92;
  wire                _zz_93;
  wire                _zz_94;
  wire                _zz_95;
  wire                _zz_96;
  wire                _zz_97;
  wire                _zz_98;
  wire                _zz_99;
  wire                _zz_100;
  wire                _zz_101;
  wire                _zz_102;
  wire                cpu_cmd_fire_4;
  wire                when_ICache_l166_2;
  wire                when_ICache_l183_2;
  wire                when_ICache_l192_2;
  wire       [15:0]   _zz_103;
  wire                _zz_104;
  wire                _zz_105;
  wire                _zz_106;
  wire                _zz_107;
  wire                _zz_108;
  wire                _zz_109;
  wire                _zz_110;
  wire                _zz_111;
  wire                _zz_112;
  wire                _zz_113;
  wire                _zz_114;
  wire                _zz_115;
  wire                _zz_116;
  wire                _zz_117;
  wire                _zz_118;
  wire                _zz_119;
  wire       [15:0]   _zz_120;
  wire                _zz_121;
  wire                _zz_122;
  wire                _zz_123;
  wire                _zz_124;
  wire                _zz_125;
  wire                _zz_126;
  wire                _zz_127;
  wire                _zz_128;
  wire                _zz_129;
  wire                _zz_130;
  wire                _zz_131;
  wire                _zz_132;
  wire                _zz_133;
  wire                _zz_134;
  wire                _zz_135;
  wire                _zz_136;
  wire                cpu_cmd_fire_5;
  wire                when_ICache_l166_3;
  wire                when_ICache_l183_3;
  wire                when_ICache_l192_3;
  wire       [255:0]  _zz_cpu_rsp_payload_data;

  always @(*) begin
    case(cpu_set)
      4'b0000 : begin
        _zz_icache_tag_0 = ways_0_metas_0_tag;
        _zz_icache_hit_0 = ways_0_metas_0_valid;
        _zz_icache_replace_info_0 = ways_0_metas_0_replace_info;
        _zz_icache_tag_1 = ways_1_metas_0_tag;
        _zz_icache_hit_1 = ways_1_metas_0_valid;
        _zz_icache_replace_info_1 = ways_1_metas_0_replace_info;
        _zz_icache_tag_2 = ways_2_metas_0_tag;
        _zz_icache_hit_2 = ways_2_metas_0_valid;
        _zz_icache_replace_info_2 = ways_2_metas_0_replace_info;
        _zz_icache_tag_3 = ways_3_metas_0_tag;
        _zz_icache_hit_3 = ways_3_metas_0_valid;
        _zz_icache_replace_info_3 = ways_3_metas_0_replace_info;
      end
      4'b0001 : begin
        _zz_icache_tag_0 = ways_0_metas_1_tag;
        _zz_icache_hit_0 = ways_0_metas_1_valid;
        _zz_icache_replace_info_0 = ways_0_metas_1_replace_info;
        _zz_icache_tag_1 = ways_1_metas_1_tag;
        _zz_icache_hit_1 = ways_1_metas_1_valid;
        _zz_icache_replace_info_1 = ways_1_metas_1_replace_info;
        _zz_icache_tag_2 = ways_2_metas_1_tag;
        _zz_icache_hit_2 = ways_2_metas_1_valid;
        _zz_icache_replace_info_2 = ways_2_metas_1_replace_info;
        _zz_icache_tag_3 = ways_3_metas_1_tag;
        _zz_icache_hit_3 = ways_3_metas_1_valid;
        _zz_icache_replace_info_3 = ways_3_metas_1_replace_info;
      end
      4'b0010 : begin
        _zz_icache_tag_0 = ways_0_metas_2_tag;
        _zz_icache_hit_0 = ways_0_metas_2_valid;
        _zz_icache_replace_info_0 = ways_0_metas_2_replace_info;
        _zz_icache_tag_1 = ways_1_metas_2_tag;
        _zz_icache_hit_1 = ways_1_metas_2_valid;
        _zz_icache_replace_info_1 = ways_1_metas_2_replace_info;
        _zz_icache_tag_2 = ways_2_metas_2_tag;
        _zz_icache_hit_2 = ways_2_metas_2_valid;
        _zz_icache_replace_info_2 = ways_2_metas_2_replace_info;
        _zz_icache_tag_3 = ways_3_metas_2_tag;
        _zz_icache_hit_3 = ways_3_metas_2_valid;
        _zz_icache_replace_info_3 = ways_3_metas_2_replace_info;
      end
      4'b0011 : begin
        _zz_icache_tag_0 = ways_0_metas_3_tag;
        _zz_icache_hit_0 = ways_0_metas_3_valid;
        _zz_icache_replace_info_0 = ways_0_metas_3_replace_info;
        _zz_icache_tag_1 = ways_1_metas_3_tag;
        _zz_icache_hit_1 = ways_1_metas_3_valid;
        _zz_icache_replace_info_1 = ways_1_metas_3_replace_info;
        _zz_icache_tag_2 = ways_2_metas_3_tag;
        _zz_icache_hit_2 = ways_2_metas_3_valid;
        _zz_icache_replace_info_2 = ways_2_metas_3_replace_info;
        _zz_icache_tag_3 = ways_3_metas_3_tag;
        _zz_icache_hit_3 = ways_3_metas_3_valid;
        _zz_icache_replace_info_3 = ways_3_metas_3_replace_info;
      end
      4'b0100 : begin
        _zz_icache_tag_0 = ways_0_metas_4_tag;
        _zz_icache_hit_0 = ways_0_metas_4_valid;
        _zz_icache_replace_info_0 = ways_0_metas_4_replace_info;
        _zz_icache_tag_1 = ways_1_metas_4_tag;
        _zz_icache_hit_1 = ways_1_metas_4_valid;
        _zz_icache_replace_info_1 = ways_1_metas_4_replace_info;
        _zz_icache_tag_2 = ways_2_metas_4_tag;
        _zz_icache_hit_2 = ways_2_metas_4_valid;
        _zz_icache_replace_info_2 = ways_2_metas_4_replace_info;
        _zz_icache_tag_3 = ways_3_metas_4_tag;
        _zz_icache_hit_3 = ways_3_metas_4_valid;
        _zz_icache_replace_info_3 = ways_3_metas_4_replace_info;
      end
      4'b0101 : begin
        _zz_icache_tag_0 = ways_0_metas_5_tag;
        _zz_icache_hit_0 = ways_0_metas_5_valid;
        _zz_icache_replace_info_0 = ways_0_metas_5_replace_info;
        _zz_icache_tag_1 = ways_1_metas_5_tag;
        _zz_icache_hit_1 = ways_1_metas_5_valid;
        _zz_icache_replace_info_1 = ways_1_metas_5_replace_info;
        _zz_icache_tag_2 = ways_2_metas_5_tag;
        _zz_icache_hit_2 = ways_2_metas_5_valid;
        _zz_icache_replace_info_2 = ways_2_metas_5_replace_info;
        _zz_icache_tag_3 = ways_3_metas_5_tag;
        _zz_icache_hit_3 = ways_3_metas_5_valid;
        _zz_icache_replace_info_3 = ways_3_metas_5_replace_info;
      end
      4'b0110 : begin
        _zz_icache_tag_0 = ways_0_metas_6_tag;
        _zz_icache_hit_0 = ways_0_metas_6_valid;
        _zz_icache_replace_info_0 = ways_0_metas_6_replace_info;
        _zz_icache_tag_1 = ways_1_metas_6_tag;
        _zz_icache_hit_1 = ways_1_metas_6_valid;
        _zz_icache_replace_info_1 = ways_1_metas_6_replace_info;
        _zz_icache_tag_2 = ways_2_metas_6_tag;
        _zz_icache_hit_2 = ways_2_metas_6_valid;
        _zz_icache_replace_info_2 = ways_2_metas_6_replace_info;
        _zz_icache_tag_3 = ways_3_metas_6_tag;
        _zz_icache_hit_3 = ways_3_metas_6_valid;
        _zz_icache_replace_info_3 = ways_3_metas_6_replace_info;
      end
      4'b0111 : begin
        _zz_icache_tag_0 = ways_0_metas_7_tag;
        _zz_icache_hit_0 = ways_0_metas_7_valid;
        _zz_icache_replace_info_0 = ways_0_metas_7_replace_info;
        _zz_icache_tag_1 = ways_1_metas_7_tag;
        _zz_icache_hit_1 = ways_1_metas_7_valid;
        _zz_icache_replace_info_1 = ways_1_metas_7_replace_info;
        _zz_icache_tag_2 = ways_2_metas_7_tag;
        _zz_icache_hit_2 = ways_2_metas_7_valid;
        _zz_icache_replace_info_2 = ways_2_metas_7_replace_info;
        _zz_icache_tag_3 = ways_3_metas_7_tag;
        _zz_icache_hit_3 = ways_3_metas_7_valid;
        _zz_icache_replace_info_3 = ways_3_metas_7_replace_info;
      end
      4'b1000 : begin
        _zz_icache_tag_0 = ways_0_metas_8_tag;
        _zz_icache_hit_0 = ways_0_metas_8_valid;
        _zz_icache_replace_info_0 = ways_0_metas_8_replace_info;
        _zz_icache_tag_1 = ways_1_metas_8_tag;
        _zz_icache_hit_1 = ways_1_metas_8_valid;
        _zz_icache_replace_info_1 = ways_1_metas_8_replace_info;
        _zz_icache_tag_2 = ways_2_metas_8_tag;
        _zz_icache_hit_2 = ways_2_metas_8_valid;
        _zz_icache_replace_info_2 = ways_2_metas_8_replace_info;
        _zz_icache_tag_3 = ways_3_metas_8_tag;
        _zz_icache_hit_3 = ways_3_metas_8_valid;
        _zz_icache_replace_info_3 = ways_3_metas_8_replace_info;
      end
      4'b1001 : begin
        _zz_icache_tag_0 = ways_0_metas_9_tag;
        _zz_icache_hit_0 = ways_0_metas_9_valid;
        _zz_icache_replace_info_0 = ways_0_metas_9_replace_info;
        _zz_icache_tag_1 = ways_1_metas_9_tag;
        _zz_icache_hit_1 = ways_1_metas_9_valid;
        _zz_icache_replace_info_1 = ways_1_metas_9_replace_info;
        _zz_icache_tag_2 = ways_2_metas_9_tag;
        _zz_icache_hit_2 = ways_2_metas_9_valid;
        _zz_icache_replace_info_2 = ways_2_metas_9_replace_info;
        _zz_icache_tag_3 = ways_3_metas_9_tag;
        _zz_icache_hit_3 = ways_3_metas_9_valid;
        _zz_icache_replace_info_3 = ways_3_metas_9_replace_info;
      end
      4'b1010 : begin
        _zz_icache_tag_0 = ways_0_metas_10_tag;
        _zz_icache_hit_0 = ways_0_metas_10_valid;
        _zz_icache_replace_info_0 = ways_0_metas_10_replace_info;
        _zz_icache_tag_1 = ways_1_metas_10_tag;
        _zz_icache_hit_1 = ways_1_metas_10_valid;
        _zz_icache_replace_info_1 = ways_1_metas_10_replace_info;
        _zz_icache_tag_2 = ways_2_metas_10_tag;
        _zz_icache_hit_2 = ways_2_metas_10_valid;
        _zz_icache_replace_info_2 = ways_2_metas_10_replace_info;
        _zz_icache_tag_3 = ways_3_metas_10_tag;
        _zz_icache_hit_3 = ways_3_metas_10_valid;
        _zz_icache_replace_info_3 = ways_3_metas_10_replace_info;
      end
      4'b1011 : begin
        _zz_icache_tag_0 = ways_0_metas_11_tag;
        _zz_icache_hit_0 = ways_0_metas_11_valid;
        _zz_icache_replace_info_0 = ways_0_metas_11_replace_info;
        _zz_icache_tag_1 = ways_1_metas_11_tag;
        _zz_icache_hit_1 = ways_1_metas_11_valid;
        _zz_icache_replace_info_1 = ways_1_metas_11_replace_info;
        _zz_icache_tag_2 = ways_2_metas_11_tag;
        _zz_icache_hit_2 = ways_2_metas_11_valid;
        _zz_icache_replace_info_2 = ways_2_metas_11_replace_info;
        _zz_icache_tag_3 = ways_3_metas_11_tag;
        _zz_icache_hit_3 = ways_3_metas_11_valid;
        _zz_icache_replace_info_3 = ways_3_metas_11_replace_info;
      end
      4'b1100 : begin
        _zz_icache_tag_0 = ways_0_metas_12_tag;
        _zz_icache_hit_0 = ways_0_metas_12_valid;
        _zz_icache_replace_info_0 = ways_0_metas_12_replace_info;
        _zz_icache_tag_1 = ways_1_metas_12_tag;
        _zz_icache_hit_1 = ways_1_metas_12_valid;
        _zz_icache_replace_info_1 = ways_1_metas_12_replace_info;
        _zz_icache_tag_2 = ways_2_metas_12_tag;
        _zz_icache_hit_2 = ways_2_metas_12_valid;
        _zz_icache_replace_info_2 = ways_2_metas_12_replace_info;
        _zz_icache_tag_3 = ways_3_metas_12_tag;
        _zz_icache_hit_3 = ways_3_metas_12_valid;
        _zz_icache_replace_info_3 = ways_3_metas_12_replace_info;
      end
      4'b1101 : begin
        _zz_icache_tag_0 = ways_0_metas_13_tag;
        _zz_icache_hit_0 = ways_0_metas_13_valid;
        _zz_icache_replace_info_0 = ways_0_metas_13_replace_info;
        _zz_icache_tag_1 = ways_1_metas_13_tag;
        _zz_icache_hit_1 = ways_1_metas_13_valid;
        _zz_icache_replace_info_1 = ways_1_metas_13_replace_info;
        _zz_icache_tag_2 = ways_2_metas_13_tag;
        _zz_icache_hit_2 = ways_2_metas_13_valid;
        _zz_icache_replace_info_2 = ways_2_metas_13_replace_info;
        _zz_icache_tag_3 = ways_3_metas_13_tag;
        _zz_icache_hit_3 = ways_3_metas_13_valid;
        _zz_icache_replace_info_3 = ways_3_metas_13_replace_info;
      end
      4'b1110 : begin
        _zz_icache_tag_0 = ways_0_metas_14_tag;
        _zz_icache_hit_0 = ways_0_metas_14_valid;
        _zz_icache_replace_info_0 = ways_0_metas_14_replace_info;
        _zz_icache_tag_1 = ways_1_metas_14_tag;
        _zz_icache_hit_1 = ways_1_metas_14_valid;
        _zz_icache_replace_info_1 = ways_1_metas_14_replace_info;
        _zz_icache_tag_2 = ways_2_metas_14_tag;
        _zz_icache_hit_2 = ways_2_metas_14_valid;
        _zz_icache_replace_info_2 = ways_2_metas_14_replace_info;
        _zz_icache_tag_3 = ways_3_metas_14_tag;
        _zz_icache_hit_3 = ways_3_metas_14_valid;
        _zz_icache_replace_info_3 = ways_3_metas_14_replace_info;
      end
      default : begin
        _zz_icache_tag_0 = ways_0_metas_15_tag;
        _zz_icache_hit_0 = ways_0_metas_15_valid;
        _zz_icache_replace_info_0 = ways_0_metas_15_replace_info;
        _zz_icache_tag_1 = ways_1_metas_15_tag;
        _zz_icache_hit_1 = ways_1_metas_15_valid;
        _zz_icache_replace_info_1 = ways_1_metas_15_replace_info;
        _zz_icache_tag_2 = ways_2_metas_15_tag;
        _zz_icache_hit_2 = ways_2_metas_15_valid;
        _zz_icache_replace_info_2 = ways_2_metas_15_replace_info;
        _zz_icache_tag_3 = ways_3_metas_15_tag;
        _zz_icache_hit_3 = ways_3_metas_15_valid;
        _zz_icache_replace_info_3 = ways_3_metas_15_replace_info;
      end
    endcase
  end

  always @(*) begin
    case(cpu_set_d1)
      4'b0000 : begin
        _zz_icache_victim_0 = ways_0_metas_0_valid;
        _zz_icache_victim_1 = ways_1_metas_0_valid;
        _zz_icache_victim_2 = ways_2_metas_0_valid;
        _zz_icache_victim_3 = ways_3_metas_0_valid;
      end
      4'b0001 : begin
        _zz_icache_victim_0 = ways_0_metas_1_valid;
        _zz_icache_victim_1 = ways_1_metas_1_valid;
        _zz_icache_victim_2 = ways_2_metas_1_valid;
        _zz_icache_victim_3 = ways_3_metas_1_valid;
      end
      4'b0010 : begin
        _zz_icache_victim_0 = ways_0_metas_2_valid;
        _zz_icache_victim_1 = ways_1_metas_2_valid;
        _zz_icache_victim_2 = ways_2_metas_2_valid;
        _zz_icache_victim_3 = ways_3_metas_2_valid;
      end
      4'b0011 : begin
        _zz_icache_victim_0 = ways_0_metas_3_valid;
        _zz_icache_victim_1 = ways_1_metas_3_valid;
        _zz_icache_victim_2 = ways_2_metas_3_valid;
        _zz_icache_victim_3 = ways_3_metas_3_valid;
      end
      4'b0100 : begin
        _zz_icache_victim_0 = ways_0_metas_4_valid;
        _zz_icache_victim_1 = ways_1_metas_4_valid;
        _zz_icache_victim_2 = ways_2_metas_4_valid;
        _zz_icache_victim_3 = ways_3_metas_4_valid;
      end
      4'b0101 : begin
        _zz_icache_victim_0 = ways_0_metas_5_valid;
        _zz_icache_victim_1 = ways_1_metas_5_valid;
        _zz_icache_victim_2 = ways_2_metas_5_valid;
        _zz_icache_victim_3 = ways_3_metas_5_valid;
      end
      4'b0110 : begin
        _zz_icache_victim_0 = ways_0_metas_6_valid;
        _zz_icache_victim_1 = ways_1_metas_6_valid;
        _zz_icache_victim_2 = ways_2_metas_6_valid;
        _zz_icache_victim_3 = ways_3_metas_6_valid;
      end
      4'b0111 : begin
        _zz_icache_victim_0 = ways_0_metas_7_valid;
        _zz_icache_victim_1 = ways_1_metas_7_valid;
        _zz_icache_victim_2 = ways_2_metas_7_valid;
        _zz_icache_victim_3 = ways_3_metas_7_valid;
      end
      4'b1000 : begin
        _zz_icache_victim_0 = ways_0_metas_8_valid;
        _zz_icache_victim_1 = ways_1_metas_8_valid;
        _zz_icache_victim_2 = ways_2_metas_8_valid;
        _zz_icache_victim_3 = ways_3_metas_8_valid;
      end
      4'b1001 : begin
        _zz_icache_victim_0 = ways_0_metas_9_valid;
        _zz_icache_victim_1 = ways_1_metas_9_valid;
        _zz_icache_victim_2 = ways_2_metas_9_valid;
        _zz_icache_victim_3 = ways_3_metas_9_valid;
      end
      4'b1010 : begin
        _zz_icache_victim_0 = ways_0_metas_10_valid;
        _zz_icache_victim_1 = ways_1_metas_10_valid;
        _zz_icache_victim_2 = ways_2_metas_10_valid;
        _zz_icache_victim_3 = ways_3_metas_10_valid;
      end
      4'b1011 : begin
        _zz_icache_victim_0 = ways_0_metas_11_valid;
        _zz_icache_victim_1 = ways_1_metas_11_valid;
        _zz_icache_victim_2 = ways_2_metas_11_valid;
        _zz_icache_victim_3 = ways_3_metas_11_valid;
      end
      4'b1100 : begin
        _zz_icache_victim_0 = ways_0_metas_12_valid;
        _zz_icache_victim_1 = ways_1_metas_12_valid;
        _zz_icache_victim_2 = ways_2_metas_12_valid;
        _zz_icache_victim_3 = ways_3_metas_12_valid;
      end
      4'b1101 : begin
        _zz_icache_victim_0 = ways_0_metas_13_valid;
        _zz_icache_victim_1 = ways_1_metas_13_valid;
        _zz_icache_victim_2 = ways_2_metas_13_valid;
        _zz_icache_victim_3 = ways_3_metas_13_valid;
      end
      4'b1110 : begin
        _zz_icache_victim_0 = ways_0_metas_14_valid;
        _zz_icache_victim_1 = ways_1_metas_14_valid;
        _zz_icache_victim_2 = ways_2_metas_14_valid;
        _zz_icache_victim_3 = ways_3_metas_14_valid;
      end
      default : begin
        _zz_icache_victim_0 = ways_0_metas_15_valid;
        _zz_icache_victim_1 = ways_1_metas_15_valid;
        _zz_icache_victim_2 = ways_2_metas_15_valid;
        _zz_icache_victim_3 = ways_3_metas_15_valid;
      end
    endcase
  end

  always @(*) begin
    case(hit_way_id)
      2'b00 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_0;
        _zz_cpu_rsp_valid = sram_banks_valid_0;
      end
      2'b01 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_1;
        _zz_cpu_rsp_valid = sram_banks_valid_1;
      end
      2'b10 : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_2;
        _zz_cpu_rsp_valid = sram_banks_valid_2;
      end
      default : begin
        _zz__zz_cpu_rsp_payload_data = sram_banks_data_3;
        _zz_cpu_rsp_valid = sram_banks_valid_3;
      end
    endcase
  end

  always @(*) begin
    case(cpu_bank_sel)
      3'b000 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[31 : 0];
      3'b001 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[63 : 32];
      3'b010 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[95 : 64];
      3'b011 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[127 : 96];
      3'b100 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[159 : 128];
      3'b101 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[191 : 160];
      3'b110 : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[223 : 192];
      default : _zz_cpu_rsp_payload_data_1 = _zz_cpu_rsp_payload_data[255 : 224];
    endcase
  end

  assign replace_info_full = (&{icache_replace_info_3,{icache_replace_info_2,{icache_replace_info_1,icache_replace_info_0}}});
  assign cpu_cmd_fire = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_hit = ((|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}}) && cpu_cmd_fire);
  assign cpu_cmd_fire_1 = (cpu_cmd_valid && cpu_cmd_ready);
  assign is_miss = ((! (|{icache_hit_3,{icache_hit_2,{icache_hit_1,icache_hit_0}}})) && cpu_cmd_fire_1);
  assign cpu_tag = cpu_cmd_payload_addr[63 : 10];
  assign cpu_set = cpu_cmd_payload_addr[9 : 6];
  assign cpu_bank_offset = cpu_cmd_payload_addr[4 : 0];
  assign cpu_bank_addr = cpu_cmd_payload_addr[9 : 5];
  assign cpu_bank_sel = cpu_cmd_payload_addr[4 : 2];
  assign cpu_set_d1 = cpu_addr_d1[9 : 6];
  assign cpu_tag_d1 = cpu_addr_d1[63 : 10];
  always @(*) begin
    next_level_data_cnt_willIncrement = 1'b0;
    if(!is_miss) begin
      if(!when_ICache_l115) begin
        if(next_level_rsp_valid) begin
          next_level_data_cnt_willIncrement = 1'b1;
        end
      end
    end
  end

  always @(*) begin
    next_level_data_cnt_willClear = 1'b0;
    if(is_miss) begin
      next_level_data_cnt_willClear = 1'b1;
    end else begin
      if(when_ICache_l115) begin
        next_level_data_cnt_willClear = 1'b1;
      end
    end
  end

  assign next_level_data_cnt_willOverflowIfInc = (next_level_data_cnt_value == 1'b1);
  assign next_level_data_cnt_willOverflow = (next_level_data_cnt_willOverflowIfInc && next_level_data_cnt_willIncrement);
  always @(*) begin
    next_level_data_cnt_valueNext = (next_level_data_cnt_value + next_level_data_cnt_willIncrement);
    if(next_level_data_cnt_willClear) begin
      next_level_data_cnt_valueNext = 1'b0;
    end
  end

  assign next_level_bank_addr = cpu_addr_d1[9 : 6];
  assign next_level_cmd_fire = (next_level_cmd_valid && next_level_cmd_ready);
  assign when_ICache_l115 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_hit_way_id = (icache_hit_1 || icache_hit_3);
  assign _zz_hit_way_id_1 = (icache_hit_2 || icache_hit_3);
  assign hit_way_id = {_zz_hit_way_id_1,_zz_hit_way_id};
  assign _zz_1 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_2 = _zz_1[0];
  assign _zz_3 = _zz_1[1];
  assign _zz_4 = _zz_1[2];
  assign _zz_5 = _zz_1[3];
  assign _zz_6 = _zz_1[4];
  assign _zz_7 = _zz_1[5];
  assign _zz_8 = _zz_1[6];
  assign _zz_9 = _zz_1[7];
  assign _zz_10 = _zz_1[8];
  assign _zz_11 = _zz_1[9];
  assign _zz_12 = _zz_1[10];
  assign _zz_13 = _zz_1[11];
  assign _zz_14 = _zz_1[12];
  assign _zz_15 = _zz_1[13];
  assign _zz_16 = _zz_1[14];
  assign _zz_17 = _zz_1[15];
  assign icache_tag_0 = _zz_icache_tag_0;
  assign icache_hit_0 = ((icache_tag_0 == cpu_tag) && _zz_icache_hit_0);
  assign icache_replace_info_0 = _zz_icache_replace_info_0;
  assign _zz_18 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_19 = _zz_18[0];
  assign _zz_20 = _zz_18[1];
  assign _zz_21 = _zz_18[2];
  assign _zz_22 = _zz_18[3];
  assign _zz_23 = _zz_18[4];
  assign _zz_24 = _zz_18[5];
  assign _zz_25 = _zz_18[6];
  assign _zz_26 = _zz_18[7];
  assign _zz_27 = _zz_18[8];
  assign _zz_28 = _zz_18[9];
  assign _zz_29 = _zz_18[10];
  assign _zz_30 = _zz_18[11];
  assign _zz_31 = _zz_18[12];
  assign _zz_32 = _zz_18[13];
  assign _zz_33 = _zz_18[14];
  assign _zz_34 = _zz_18[15];
  assign icache_victim_0 = (! _zz_icache_victim_0);
  assign sram_banks_data_0 = sram_0_ports_rsp_payload_data;
  assign sram_banks_valid_0 = sram_0_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_addr = (icache_hit_0 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_0_ports_cmd_payload_addr = 5'h0;
      end
    end
  end

  assign cpu_cmd_fire_2 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_valid = (icache_hit_0 && cpu_cmd_fire_2);
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_valid = 1'b1;
      end else begin
        sram_0_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_0_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_0_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_0_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_0_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l166 = (is_hit && replace_info_full);
  assign when_ICache_l183 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l192 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_35 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_36 = _zz_35[0];
  assign _zz_37 = _zz_35[1];
  assign _zz_38 = _zz_35[2];
  assign _zz_39 = _zz_35[3];
  assign _zz_40 = _zz_35[4];
  assign _zz_41 = _zz_35[5];
  assign _zz_42 = _zz_35[6];
  assign _zz_43 = _zz_35[7];
  assign _zz_44 = _zz_35[8];
  assign _zz_45 = _zz_35[9];
  assign _zz_46 = _zz_35[10];
  assign _zz_47 = _zz_35[11];
  assign _zz_48 = _zz_35[12];
  assign _zz_49 = _zz_35[13];
  assign _zz_50 = _zz_35[14];
  assign _zz_51 = _zz_35[15];
  assign icache_tag_1 = _zz_icache_tag_1;
  assign icache_hit_1 = ((icache_tag_1 == cpu_tag) && _zz_icache_hit_1);
  assign icache_replace_info_1 = _zz_icache_replace_info_1;
  always @(*) begin
    if(icache_victim_0) begin
      icache_victim_1 = 1'b0;
    end else begin
      icache_victim_1 = (! _zz_icache_victim_1);
    end
  end

  assign _zz_52 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_53 = _zz_52[0];
  assign _zz_54 = _zz_52[1];
  assign _zz_55 = _zz_52[2];
  assign _zz_56 = _zz_52[3];
  assign _zz_57 = _zz_52[4];
  assign _zz_58 = _zz_52[5];
  assign _zz_59 = _zz_52[6];
  assign _zz_60 = _zz_52[7];
  assign _zz_61 = _zz_52[8];
  assign _zz_62 = _zz_52[9];
  assign _zz_63 = _zz_52[10];
  assign _zz_64 = _zz_52[11];
  assign _zz_65 = _zz_52[12];
  assign _zz_66 = _zz_52[13];
  assign _zz_67 = _zz_52[14];
  assign _zz_68 = _zz_52[15];
  assign sram_banks_data_1 = sram_1_ports_rsp_payload_data;
  assign sram_banks_valid_1 = sram_1_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_addr = (icache_hit_1 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_1_ports_cmd_payload_addr = 5'h0;
      end
    end
  end

  assign cpu_cmd_fire_3 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_valid = (icache_hit_1 && cpu_cmd_fire_3);
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_valid = 1'b1;
      end else begin
        sram_1_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_1_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_1_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_1_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_1_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l166_1 = (is_hit && replace_info_full);
  assign when_ICache_l183_1 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l192_1 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_69 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_70 = _zz_69[0];
  assign _zz_71 = _zz_69[1];
  assign _zz_72 = _zz_69[2];
  assign _zz_73 = _zz_69[3];
  assign _zz_74 = _zz_69[4];
  assign _zz_75 = _zz_69[5];
  assign _zz_76 = _zz_69[6];
  assign _zz_77 = _zz_69[7];
  assign _zz_78 = _zz_69[8];
  assign _zz_79 = _zz_69[9];
  assign _zz_80 = _zz_69[10];
  assign _zz_81 = _zz_69[11];
  assign _zz_82 = _zz_69[12];
  assign _zz_83 = _zz_69[13];
  assign _zz_84 = _zz_69[14];
  assign _zz_85 = _zz_69[15];
  assign icache_tag_2 = _zz_icache_tag_2;
  assign icache_hit_2 = ((icache_tag_2 == cpu_tag) && _zz_icache_hit_2);
  assign icache_replace_info_2 = _zz_icache_replace_info_2;
  always @(*) begin
    if(icache_victim_1) begin
      icache_victim_2 = 1'b0;
    end else begin
      icache_victim_2 = (! _zz_icache_victim_2);
    end
  end

  assign _zz_86 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_87 = _zz_86[0];
  assign _zz_88 = _zz_86[1];
  assign _zz_89 = _zz_86[2];
  assign _zz_90 = _zz_86[3];
  assign _zz_91 = _zz_86[4];
  assign _zz_92 = _zz_86[5];
  assign _zz_93 = _zz_86[6];
  assign _zz_94 = _zz_86[7];
  assign _zz_95 = _zz_86[8];
  assign _zz_96 = _zz_86[9];
  assign _zz_97 = _zz_86[10];
  assign _zz_98 = _zz_86[11];
  assign _zz_99 = _zz_86[12];
  assign _zz_100 = _zz_86[13];
  assign _zz_101 = _zz_86[14];
  assign _zz_102 = _zz_86[15];
  assign sram_banks_data_2 = sram_2_ports_rsp_payload_data;
  assign sram_banks_valid_2 = sram_2_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_addr = (icache_hit_2 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_2_ports_cmd_payload_addr = 5'h0;
      end
    end
  end

  assign cpu_cmd_fire_4 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_valid = (icache_hit_2 && cpu_cmd_fire_4);
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_valid = 1'b1;
      end else begin
        sram_2_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_2_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_2_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_2_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_2_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l166_2 = (is_hit && replace_info_full);
  assign when_ICache_l183_2 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l192_2 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_103 = ({15'd0,1'b1} <<< cpu_set);
  assign _zz_104 = _zz_103[0];
  assign _zz_105 = _zz_103[1];
  assign _zz_106 = _zz_103[2];
  assign _zz_107 = _zz_103[3];
  assign _zz_108 = _zz_103[4];
  assign _zz_109 = _zz_103[5];
  assign _zz_110 = _zz_103[6];
  assign _zz_111 = _zz_103[7];
  assign _zz_112 = _zz_103[8];
  assign _zz_113 = _zz_103[9];
  assign _zz_114 = _zz_103[10];
  assign _zz_115 = _zz_103[11];
  assign _zz_116 = _zz_103[12];
  assign _zz_117 = _zz_103[13];
  assign _zz_118 = _zz_103[14];
  assign _zz_119 = _zz_103[15];
  assign icache_tag_3 = _zz_icache_tag_3;
  assign icache_hit_3 = ((icache_tag_3 == cpu_tag) && _zz_icache_hit_3);
  assign icache_replace_info_3 = _zz_icache_replace_info_3;
  always @(*) begin
    if(icache_victim_2) begin
      icache_victim_3 = 1'b0;
    end else begin
      icache_victim_3 = (! _zz_icache_victim_3);
    end
  end

  assign _zz_120 = ({15'd0,1'b1} <<< cpu_set_d1);
  assign _zz_121 = _zz_120[0];
  assign _zz_122 = _zz_120[1];
  assign _zz_123 = _zz_120[2];
  assign _zz_124 = _zz_120[3];
  assign _zz_125 = _zz_120[4];
  assign _zz_126 = _zz_120[5];
  assign _zz_127 = _zz_120[6];
  assign _zz_128 = _zz_120[7];
  assign _zz_129 = _zz_120[8];
  assign _zz_130 = _zz_120[9];
  assign _zz_131 = _zz_120[10];
  assign _zz_132 = _zz_120[11];
  assign _zz_133 = _zz_120[12];
  assign _zz_134 = _zz_120[13];
  assign _zz_135 = _zz_120[14];
  assign _zz_136 = _zz_120[15];
  assign sram_banks_data_3 = sram_3_ports_rsp_payload_data;
  assign sram_banks_valid_3 = sram_3_ports_rsp_valid;
  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_addr = (icache_hit_3 ? cpu_bank_addr : 5'h0);
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_addr = {next_level_bank_addr,next_level_data_cnt_value};
      end else begin
        sram_3_ports_cmd_payload_addr = 5'h0;
      end
    end
  end

  assign cpu_cmd_fire_5 = (cpu_cmd_valid && cpu_cmd_ready);
  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_valid = (icache_hit_3 && cpu_cmd_fire_5);
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_valid = 1'b1;
      end else begin
        sram_3_ports_cmd_valid = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_wen = 1'b0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_wen = 1'b1;
      end else begin
        sram_3_ports_cmd_payload_wen = 1'b0;
      end
    end
  end

  always @(*) begin
    if(is_hit) begin
      sram_3_ports_cmd_payload_wdata = 256'h0;
    end else begin
      if(next_level_rsp_valid) begin
        sram_3_ports_cmd_payload_wdata = next_level_rsp_payload_data;
      end else begin
        sram_3_ports_cmd_payload_wdata = 256'h0;
      end
    end
  end

  assign when_ICache_l166_3 = (is_hit && replace_info_full);
  assign when_ICache_l183_3 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign when_ICache_l192_3 = (next_level_rsp_valid && (next_level_data_cnt_value == 1'b1));
  assign _zz_cpu_rsp_payload_data = _zz__zz_cpu_rsp_payload_data;
  assign cpu_rsp_payload_data = _zz_cpu_rsp_payload_data_1;
  assign cpu_rsp_valid = _zz_cpu_rsp_valid;
  assign cpu_cmd_ready = cpu_cmd_ready_1;
  assign next_level_cmd_payload_addr = cpu_addr_d1;
  assign next_level_cmd_payload_len = 4'b0010;
  assign next_level_cmd_valid = next_level_cmd_valid_1;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      ways_0_metas_0_valid <= 1'b0;
      ways_0_metas_0_tag <= 54'h0;
      ways_0_metas_0_replace_info <= 1'b0;
      ways_0_metas_1_valid <= 1'b0;
      ways_0_metas_1_tag <= 54'h0;
      ways_0_metas_1_replace_info <= 1'b0;
      ways_0_metas_2_valid <= 1'b0;
      ways_0_metas_2_tag <= 54'h0;
      ways_0_metas_2_replace_info <= 1'b0;
      ways_0_metas_3_valid <= 1'b0;
      ways_0_metas_3_tag <= 54'h0;
      ways_0_metas_3_replace_info <= 1'b0;
      ways_0_metas_4_valid <= 1'b0;
      ways_0_metas_4_tag <= 54'h0;
      ways_0_metas_4_replace_info <= 1'b0;
      ways_0_metas_5_valid <= 1'b0;
      ways_0_metas_5_tag <= 54'h0;
      ways_0_metas_5_replace_info <= 1'b0;
      ways_0_metas_6_valid <= 1'b0;
      ways_0_metas_6_tag <= 54'h0;
      ways_0_metas_6_replace_info <= 1'b0;
      ways_0_metas_7_valid <= 1'b0;
      ways_0_metas_7_tag <= 54'h0;
      ways_0_metas_7_replace_info <= 1'b0;
      ways_0_metas_8_valid <= 1'b0;
      ways_0_metas_8_tag <= 54'h0;
      ways_0_metas_8_replace_info <= 1'b0;
      ways_0_metas_9_valid <= 1'b0;
      ways_0_metas_9_tag <= 54'h0;
      ways_0_metas_9_replace_info <= 1'b0;
      ways_0_metas_10_valid <= 1'b0;
      ways_0_metas_10_tag <= 54'h0;
      ways_0_metas_10_replace_info <= 1'b0;
      ways_0_metas_11_valid <= 1'b0;
      ways_0_metas_11_tag <= 54'h0;
      ways_0_metas_11_replace_info <= 1'b0;
      ways_0_metas_12_valid <= 1'b0;
      ways_0_metas_12_tag <= 54'h0;
      ways_0_metas_12_replace_info <= 1'b0;
      ways_0_metas_13_valid <= 1'b0;
      ways_0_metas_13_tag <= 54'h0;
      ways_0_metas_13_replace_info <= 1'b0;
      ways_0_metas_14_valid <= 1'b0;
      ways_0_metas_14_tag <= 54'h0;
      ways_0_metas_14_replace_info <= 1'b0;
      ways_0_metas_15_valid <= 1'b0;
      ways_0_metas_15_tag <= 54'h0;
      ways_0_metas_15_replace_info <= 1'b0;
      ways_1_metas_0_valid <= 1'b0;
      ways_1_metas_0_tag <= 54'h0;
      ways_1_metas_0_replace_info <= 1'b0;
      ways_1_metas_1_valid <= 1'b0;
      ways_1_metas_1_tag <= 54'h0;
      ways_1_metas_1_replace_info <= 1'b0;
      ways_1_metas_2_valid <= 1'b0;
      ways_1_metas_2_tag <= 54'h0;
      ways_1_metas_2_replace_info <= 1'b0;
      ways_1_metas_3_valid <= 1'b0;
      ways_1_metas_3_tag <= 54'h0;
      ways_1_metas_3_replace_info <= 1'b0;
      ways_1_metas_4_valid <= 1'b0;
      ways_1_metas_4_tag <= 54'h0;
      ways_1_metas_4_replace_info <= 1'b0;
      ways_1_metas_5_valid <= 1'b0;
      ways_1_metas_5_tag <= 54'h0;
      ways_1_metas_5_replace_info <= 1'b0;
      ways_1_metas_6_valid <= 1'b0;
      ways_1_metas_6_tag <= 54'h0;
      ways_1_metas_6_replace_info <= 1'b0;
      ways_1_metas_7_valid <= 1'b0;
      ways_1_metas_7_tag <= 54'h0;
      ways_1_metas_7_replace_info <= 1'b0;
      ways_1_metas_8_valid <= 1'b0;
      ways_1_metas_8_tag <= 54'h0;
      ways_1_metas_8_replace_info <= 1'b0;
      ways_1_metas_9_valid <= 1'b0;
      ways_1_metas_9_tag <= 54'h0;
      ways_1_metas_9_replace_info <= 1'b0;
      ways_1_metas_10_valid <= 1'b0;
      ways_1_metas_10_tag <= 54'h0;
      ways_1_metas_10_replace_info <= 1'b0;
      ways_1_metas_11_valid <= 1'b0;
      ways_1_metas_11_tag <= 54'h0;
      ways_1_metas_11_replace_info <= 1'b0;
      ways_1_metas_12_valid <= 1'b0;
      ways_1_metas_12_tag <= 54'h0;
      ways_1_metas_12_replace_info <= 1'b0;
      ways_1_metas_13_valid <= 1'b0;
      ways_1_metas_13_tag <= 54'h0;
      ways_1_metas_13_replace_info <= 1'b0;
      ways_1_metas_14_valid <= 1'b0;
      ways_1_metas_14_tag <= 54'h0;
      ways_1_metas_14_replace_info <= 1'b0;
      ways_1_metas_15_valid <= 1'b0;
      ways_1_metas_15_tag <= 54'h0;
      ways_1_metas_15_replace_info <= 1'b0;
      ways_2_metas_0_valid <= 1'b0;
      ways_2_metas_0_tag <= 54'h0;
      ways_2_metas_0_replace_info <= 1'b0;
      ways_2_metas_1_valid <= 1'b0;
      ways_2_metas_1_tag <= 54'h0;
      ways_2_metas_1_replace_info <= 1'b0;
      ways_2_metas_2_valid <= 1'b0;
      ways_2_metas_2_tag <= 54'h0;
      ways_2_metas_2_replace_info <= 1'b0;
      ways_2_metas_3_valid <= 1'b0;
      ways_2_metas_3_tag <= 54'h0;
      ways_2_metas_3_replace_info <= 1'b0;
      ways_2_metas_4_valid <= 1'b0;
      ways_2_metas_4_tag <= 54'h0;
      ways_2_metas_4_replace_info <= 1'b0;
      ways_2_metas_5_valid <= 1'b0;
      ways_2_metas_5_tag <= 54'h0;
      ways_2_metas_5_replace_info <= 1'b0;
      ways_2_metas_6_valid <= 1'b0;
      ways_2_metas_6_tag <= 54'h0;
      ways_2_metas_6_replace_info <= 1'b0;
      ways_2_metas_7_valid <= 1'b0;
      ways_2_metas_7_tag <= 54'h0;
      ways_2_metas_7_replace_info <= 1'b0;
      ways_2_metas_8_valid <= 1'b0;
      ways_2_metas_8_tag <= 54'h0;
      ways_2_metas_8_replace_info <= 1'b0;
      ways_2_metas_9_valid <= 1'b0;
      ways_2_metas_9_tag <= 54'h0;
      ways_2_metas_9_replace_info <= 1'b0;
      ways_2_metas_10_valid <= 1'b0;
      ways_2_metas_10_tag <= 54'h0;
      ways_2_metas_10_replace_info <= 1'b0;
      ways_2_metas_11_valid <= 1'b0;
      ways_2_metas_11_tag <= 54'h0;
      ways_2_metas_11_replace_info <= 1'b0;
      ways_2_metas_12_valid <= 1'b0;
      ways_2_metas_12_tag <= 54'h0;
      ways_2_metas_12_replace_info <= 1'b0;
      ways_2_metas_13_valid <= 1'b0;
      ways_2_metas_13_tag <= 54'h0;
      ways_2_metas_13_replace_info <= 1'b0;
      ways_2_metas_14_valid <= 1'b0;
      ways_2_metas_14_tag <= 54'h0;
      ways_2_metas_14_replace_info <= 1'b0;
      ways_2_metas_15_valid <= 1'b0;
      ways_2_metas_15_tag <= 54'h0;
      ways_2_metas_15_replace_info <= 1'b0;
      ways_3_metas_0_valid <= 1'b0;
      ways_3_metas_0_tag <= 54'h0;
      ways_3_metas_0_replace_info <= 1'b0;
      ways_3_metas_1_valid <= 1'b0;
      ways_3_metas_1_tag <= 54'h0;
      ways_3_metas_1_replace_info <= 1'b0;
      ways_3_metas_2_valid <= 1'b0;
      ways_3_metas_2_tag <= 54'h0;
      ways_3_metas_2_replace_info <= 1'b0;
      ways_3_metas_3_valid <= 1'b0;
      ways_3_metas_3_tag <= 54'h0;
      ways_3_metas_3_replace_info <= 1'b0;
      ways_3_metas_4_valid <= 1'b0;
      ways_3_metas_4_tag <= 54'h0;
      ways_3_metas_4_replace_info <= 1'b0;
      ways_3_metas_5_valid <= 1'b0;
      ways_3_metas_5_tag <= 54'h0;
      ways_3_metas_5_replace_info <= 1'b0;
      ways_3_metas_6_valid <= 1'b0;
      ways_3_metas_6_tag <= 54'h0;
      ways_3_metas_6_replace_info <= 1'b0;
      ways_3_metas_7_valid <= 1'b0;
      ways_3_metas_7_tag <= 54'h0;
      ways_3_metas_7_replace_info <= 1'b0;
      ways_3_metas_8_valid <= 1'b0;
      ways_3_metas_8_tag <= 54'h0;
      ways_3_metas_8_replace_info <= 1'b0;
      ways_3_metas_9_valid <= 1'b0;
      ways_3_metas_9_tag <= 54'h0;
      ways_3_metas_9_replace_info <= 1'b0;
      ways_3_metas_10_valid <= 1'b0;
      ways_3_metas_10_tag <= 54'h0;
      ways_3_metas_10_replace_info <= 1'b0;
      ways_3_metas_11_valid <= 1'b0;
      ways_3_metas_11_tag <= 54'h0;
      ways_3_metas_11_replace_info <= 1'b0;
      ways_3_metas_12_valid <= 1'b0;
      ways_3_metas_12_tag <= 54'h0;
      ways_3_metas_12_replace_info <= 1'b0;
      ways_3_metas_13_valid <= 1'b0;
      ways_3_metas_13_tag <= 54'h0;
      ways_3_metas_13_replace_info <= 1'b0;
      ways_3_metas_14_valid <= 1'b0;
      ways_3_metas_14_tag <= 54'h0;
      ways_3_metas_14_replace_info <= 1'b0;
      ways_3_metas_15_valid <= 1'b0;
      ways_3_metas_15_tag <= 54'h0;
      ways_3_metas_15_replace_info <= 1'b0;
      cpu_addr_d1 <= 64'h0;
      cpu_cmd_ready_1 <= 1'b1;
      next_level_cmd_valid_1 <= 1'b0;
      next_level_data_cnt_value <= 1'b0;
    end else begin
      if(is_miss) begin
        cpu_addr_d1 <= cpu_cmd_payload_addr;
      end
      next_level_data_cnt_value <= next_level_data_cnt_valueNext;
      if(is_miss) begin
        next_level_cmd_valid_1 <= 1'b1;
      end else begin
        if(next_level_cmd_fire) begin
          next_level_cmd_valid_1 <= 1'b0;
        end
      end
      if(flush) begin
        if(_zz_2) begin
          ways_0_metas_0_replace_info <= 1'b0;
        end
        if(_zz_3) begin
          ways_0_metas_1_replace_info <= 1'b0;
        end
        if(_zz_4) begin
          ways_0_metas_2_replace_info <= 1'b0;
        end
        if(_zz_5) begin
          ways_0_metas_3_replace_info <= 1'b0;
        end
        if(_zz_6) begin
          ways_0_metas_4_replace_info <= 1'b0;
        end
        if(_zz_7) begin
          ways_0_metas_5_replace_info <= 1'b0;
        end
        if(_zz_8) begin
          ways_0_metas_6_replace_info <= 1'b0;
        end
        if(_zz_9) begin
          ways_0_metas_7_replace_info <= 1'b0;
        end
        if(_zz_10) begin
          ways_0_metas_8_replace_info <= 1'b0;
        end
        if(_zz_11) begin
          ways_0_metas_9_replace_info <= 1'b0;
        end
        if(_zz_12) begin
          ways_0_metas_10_replace_info <= 1'b0;
        end
        if(_zz_13) begin
          ways_0_metas_11_replace_info <= 1'b0;
        end
        if(_zz_14) begin
          ways_0_metas_12_replace_info <= 1'b0;
        end
        if(_zz_15) begin
          ways_0_metas_13_replace_info <= 1'b0;
        end
        if(_zz_16) begin
          ways_0_metas_14_replace_info <= 1'b0;
        end
        if(_zz_17) begin
          ways_0_metas_15_replace_info <= 1'b0;
        end
        if(_zz_19) begin
          ways_0_metas_0_valid <= 1'b0;
        end
        if(_zz_20) begin
          ways_0_metas_1_valid <= 1'b0;
        end
        if(_zz_21) begin
          ways_0_metas_2_valid <= 1'b0;
        end
        if(_zz_22) begin
          ways_0_metas_3_valid <= 1'b0;
        end
        if(_zz_23) begin
          ways_0_metas_4_valid <= 1'b0;
        end
        if(_zz_24) begin
          ways_0_metas_5_valid <= 1'b0;
        end
        if(_zz_25) begin
          ways_0_metas_6_valid <= 1'b0;
        end
        if(_zz_26) begin
          ways_0_metas_7_valid <= 1'b0;
        end
        if(_zz_27) begin
          ways_0_metas_8_valid <= 1'b0;
        end
        if(_zz_28) begin
          ways_0_metas_9_valid <= 1'b0;
        end
        if(_zz_29) begin
          ways_0_metas_10_valid <= 1'b0;
        end
        if(_zz_30) begin
          ways_0_metas_11_valid <= 1'b0;
        end
        if(_zz_31) begin
          ways_0_metas_12_valid <= 1'b0;
        end
        if(_zz_32) begin
          ways_0_metas_13_valid <= 1'b0;
        end
        if(_zz_33) begin
          ways_0_metas_14_valid <= 1'b0;
        end
        if(_zz_34) begin
          ways_0_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l166) begin
          if(icache_hit_0) begin
            if(_zz_2) begin
              ways_0_metas_0_replace_info <= 1'b1;
            end
            if(_zz_3) begin
              ways_0_metas_1_replace_info <= 1'b1;
            end
            if(_zz_4) begin
              ways_0_metas_2_replace_info <= 1'b1;
            end
            if(_zz_5) begin
              ways_0_metas_3_replace_info <= 1'b1;
            end
            if(_zz_6) begin
              ways_0_metas_4_replace_info <= 1'b1;
            end
            if(_zz_7) begin
              ways_0_metas_5_replace_info <= 1'b1;
            end
            if(_zz_8) begin
              ways_0_metas_6_replace_info <= 1'b1;
            end
            if(_zz_9) begin
              ways_0_metas_7_replace_info <= 1'b1;
            end
            if(_zz_10) begin
              ways_0_metas_8_replace_info <= 1'b1;
            end
            if(_zz_11) begin
              ways_0_metas_9_replace_info <= 1'b1;
            end
            if(_zz_12) begin
              ways_0_metas_10_replace_info <= 1'b1;
            end
            if(_zz_13) begin
              ways_0_metas_11_replace_info <= 1'b1;
            end
            if(_zz_14) begin
              ways_0_metas_12_replace_info <= 1'b1;
            end
            if(_zz_15) begin
              ways_0_metas_13_replace_info <= 1'b1;
            end
            if(_zz_16) begin
              ways_0_metas_14_replace_info <= 1'b1;
            end
            if(_zz_17) begin
              ways_0_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_2) begin
              ways_0_metas_0_replace_info <= 1'b0;
            end
            if(_zz_3) begin
              ways_0_metas_1_replace_info <= 1'b0;
            end
            if(_zz_4) begin
              ways_0_metas_2_replace_info <= 1'b0;
            end
            if(_zz_5) begin
              ways_0_metas_3_replace_info <= 1'b0;
            end
            if(_zz_6) begin
              ways_0_metas_4_replace_info <= 1'b0;
            end
            if(_zz_7) begin
              ways_0_metas_5_replace_info <= 1'b0;
            end
            if(_zz_8) begin
              ways_0_metas_6_replace_info <= 1'b0;
            end
            if(_zz_9) begin
              ways_0_metas_7_replace_info <= 1'b0;
            end
            if(_zz_10) begin
              ways_0_metas_8_replace_info <= 1'b0;
            end
            if(_zz_11) begin
              ways_0_metas_9_replace_info <= 1'b0;
            end
            if(_zz_12) begin
              ways_0_metas_10_replace_info <= 1'b0;
            end
            if(_zz_13) begin
              ways_0_metas_11_replace_info <= 1'b0;
            end
            if(_zz_14) begin
              ways_0_metas_12_replace_info <= 1'b0;
            end
            if(_zz_15) begin
              ways_0_metas_13_replace_info <= 1'b0;
            end
            if(_zz_16) begin
              ways_0_metas_14_replace_info <= 1'b0;
            end
            if(_zz_17) begin
              ways_0_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_0) begin
              if(_zz_2) begin
                ways_0_metas_0_replace_info <= 1'b1;
              end
              if(_zz_3) begin
                ways_0_metas_1_replace_info <= 1'b1;
              end
              if(_zz_4) begin
                ways_0_metas_2_replace_info <= 1'b1;
              end
              if(_zz_5) begin
                ways_0_metas_3_replace_info <= 1'b1;
              end
              if(_zz_6) begin
                ways_0_metas_4_replace_info <= 1'b1;
              end
              if(_zz_7) begin
                ways_0_metas_5_replace_info <= 1'b1;
              end
              if(_zz_8) begin
                ways_0_metas_6_replace_info <= 1'b1;
              end
              if(_zz_9) begin
                ways_0_metas_7_replace_info <= 1'b1;
              end
              if(_zz_10) begin
                ways_0_metas_8_replace_info <= 1'b1;
              end
              if(_zz_11) begin
                ways_0_metas_9_replace_info <= 1'b1;
              end
              if(_zz_12) begin
                ways_0_metas_10_replace_info <= 1'b1;
              end
              if(_zz_13) begin
                ways_0_metas_11_replace_info <= 1'b1;
              end
              if(_zz_14) begin
                ways_0_metas_12_replace_info <= 1'b1;
              end
              if(_zz_15) begin
                ways_0_metas_13_replace_info <= 1'b1;
              end
              if(_zz_16) begin
                ways_0_metas_14_replace_info <= 1'b1;
              end
              if(_zz_17) begin
                ways_0_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_0) begin
                if(_zz_19) begin
                  ways_0_metas_0_valid <= 1'b1;
                end
                if(_zz_20) begin
                  ways_0_metas_1_valid <= 1'b1;
                end
                if(_zz_21) begin
                  ways_0_metas_2_valid <= 1'b1;
                end
                if(_zz_22) begin
                  ways_0_metas_3_valid <= 1'b1;
                end
                if(_zz_23) begin
                  ways_0_metas_4_valid <= 1'b1;
                end
                if(_zz_24) begin
                  ways_0_metas_5_valid <= 1'b1;
                end
                if(_zz_25) begin
                  ways_0_metas_6_valid <= 1'b1;
                end
                if(_zz_26) begin
                  ways_0_metas_7_valid <= 1'b1;
                end
                if(_zz_27) begin
                  ways_0_metas_8_valid <= 1'b1;
                end
                if(_zz_28) begin
                  ways_0_metas_9_valid <= 1'b1;
                end
                if(_zz_29) begin
                  ways_0_metas_10_valid <= 1'b1;
                end
                if(_zz_30) begin
                  ways_0_metas_11_valid <= 1'b1;
                end
                if(_zz_31) begin
                  ways_0_metas_12_valid <= 1'b1;
                end
                if(_zz_32) begin
                  ways_0_metas_13_valid <= 1'b1;
                end
                if(_zz_33) begin
                  ways_0_metas_14_valid <= 1'b1;
                end
                if(_zz_34) begin
                  ways_0_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l183) begin
        if(_zz_19) begin
          ways_0_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_20) begin
          ways_0_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_21) begin
          ways_0_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_22) begin
          ways_0_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_23) begin
          ways_0_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_24) begin
          ways_0_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_25) begin
          ways_0_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_26) begin
          ways_0_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_27) begin
          ways_0_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_28) begin
          ways_0_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_29) begin
          ways_0_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_30) begin
          ways_0_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_31) begin
          ways_0_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_32) begin
          ways_0_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_33) begin
          ways_0_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_34) begin
          ways_0_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l192) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_36) begin
          ways_1_metas_0_replace_info <= 1'b0;
        end
        if(_zz_37) begin
          ways_1_metas_1_replace_info <= 1'b0;
        end
        if(_zz_38) begin
          ways_1_metas_2_replace_info <= 1'b0;
        end
        if(_zz_39) begin
          ways_1_metas_3_replace_info <= 1'b0;
        end
        if(_zz_40) begin
          ways_1_metas_4_replace_info <= 1'b0;
        end
        if(_zz_41) begin
          ways_1_metas_5_replace_info <= 1'b0;
        end
        if(_zz_42) begin
          ways_1_metas_6_replace_info <= 1'b0;
        end
        if(_zz_43) begin
          ways_1_metas_7_replace_info <= 1'b0;
        end
        if(_zz_44) begin
          ways_1_metas_8_replace_info <= 1'b0;
        end
        if(_zz_45) begin
          ways_1_metas_9_replace_info <= 1'b0;
        end
        if(_zz_46) begin
          ways_1_metas_10_replace_info <= 1'b0;
        end
        if(_zz_47) begin
          ways_1_metas_11_replace_info <= 1'b0;
        end
        if(_zz_48) begin
          ways_1_metas_12_replace_info <= 1'b0;
        end
        if(_zz_49) begin
          ways_1_metas_13_replace_info <= 1'b0;
        end
        if(_zz_50) begin
          ways_1_metas_14_replace_info <= 1'b0;
        end
        if(_zz_51) begin
          ways_1_metas_15_replace_info <= 1'b0;
        end
        if(_zz_53) begin
          ways_1_metas_0_valid <= 1'b0;
        end
        if(_zz_54) begin
          ways_1_metas_1_valid <= 1'b0;
        end
        if(_zz_55) begin
          ways_1_metas_2_valid <= 1'b0;
        end
        if(_zz_56) begin
          ways_1_metas_3_valid <= 1'b0;
        end
        if(_zz_57) begin
          ways_1_metas_4_valid <= 1'b0;
        end
        if(_zz_58) begin
          ways_1_metas_5_valid <= 1'b0;
        end
        if(_zz_59) begin
          ways_1_metas_6_valid <= 1'b0;
        end
        if(_zz_60) begin
          ways_1_metas_7_valid <= 1'b0;
        end
        if(_zz_61) begin
          ways_1_metas_8_valid <= 1'b0;
        end
        if(_zz_62) begin
          ways_1_metas_9_valid <= 1'b0;
        end
        if(_zz_63) begin
          ways_1_metas_10_valid <= 1'b0;
        end
        if(_zz_64) begin
          ways_1_metas_11_valid <= 1'b0;
        end
        if(_zz_65) begin
          ways_1_metas_12_valid <= 1'b0;
        end
        if(_zz_66) begin
          ways_1_metas_13_valid <= 1'b0;
        end
        if(_zz_67) begin
          ways_1_metas_14_valid <= 1'b0;
        end
        if(_zz_68) begin
          ways_1_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l166_1) begin
          if(icache_hit_1) begin
            if(_zz_36) begin
              ways_1_metas_0_replace_info <= 1'b1;
            end
            if(_zz_37) begin
              ways_1_metas_1_replace_info <= 1'b1;
            end
            if(_zz_38) begin
              ways_1_metas_2_replace_info <= 1'b1;
            end
            if(_zz_39) begin
              ways_1_metas_3_replace_info <= 1'b1;
            end
            if(_zz_40) begin
              ways_1_metas_4_replace_info <= 1'b1;
            end
            if(_zz_41) begin
              ways_1_metas_5_replace_info <= 1'b1;
            end
            if(_zz_42) begin
              ways_1_metas_6_replace_info <= 1'b1;
            end
            if(_zz_43) begin
              ways_1_metas_7_replace_info <= 1'b1;
            end
            if(_zz_44) begin
              ways_1_metas_8_replace_info <= 1'b1;
            end
            if(_zz_45) begin
              ways_1_metas_9_replace_info <= 1'b1;
            end
            if(_zz_46) begin
              ways_1_metas_10_replace_info <= 1'b1;
            end
            if(_zz_47) begin
              ways_1_metas_11_replace_info <= 1'b1;
            end
            if(_zz_48) begin
              ways_1_metas_12_replace_info <= 1'b1;
            end
            if(_zz_49) begin
              ways_1_metas_13_replace_info <= 1'b1;
            end
            if(_zz_50) begin
              ways_1_metas_14_replace_info <= 1'b1;
            end
            if(_zz_51) begin
              ways_1_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_36) begin
              ways_1_metas_0_replace_info <= 1'b0;
            end
            if(_zz_37) begin
              ways_1_metas_1_replace_info <= 1'b0;
            end
            if(_zz_38) begin
              ways_1_metas_2_replace_info <= 1'b0;
            end
            if(_zz_39) begin
              ways_1_metas_3_replace_info <= 1'b0;
            end
            if(_zz_40) begin
              ways_1_metas_4_replace_info <= 1'b0;
            end
            if(_zz_41) begin
              ways_1_metas_5_replace_info <= 1'b0;
            end
            if(_zz_42) begin
              ways_1_metas_6_replace_info <= 1'b0;
            end
            if(_zz_43) begin
              ways_1_metas_7_replace_info <= 1'b0;
            end
            if(_zz_44) begin
              ways_1_metas_8_replace_info <= 1'b0;
            end
            if(_zz_45) begin
              ways_1_metas_9_replace_info <= 1'b0;
            end
            if(_zz_46) begin
              ways_1_metas_10_replace_info <= 1'b0;
            end
            if(_zz_47) begin
              ways_1_metas_11_replace_info <= 1'b0;
            end
            if(_zz_48) begin
              ways_1_metas_12_replace_info <= 1'b0;
            end
            if(_zz_49) begin
              ways_1_metas_13_replace_info <= 1'b0;
            end
            if(_zz_50) begin
              ways_1_metas_14_replace_info <= 1'b0;
            end
            if(_zz_51) begin
              ways_1_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_1) begin
              if(_zz_36) begin
                ways_1_metas_0_replace_info <= 1'b1;
              end
              if(_zz_37) begin
                ways_1_metas_1_replace_info <= 1'b1;
              end
              if(_zz_38) begin
                ways_1_metas_2_replace_info <= 1'b1;
              end
              if(_zz_39) begin
                ways_1_metas_3_replace_info <= 1'b1;
              end
              if(_zz_40) begin
                ways_1_metas_4_replace_info <= 1'b1;
              end
              if(_zz_41) begin
                ways_1_metas_5_replace_info <= 1'b1;
              end
              if(_zz_42) begin
                ways_1_metas_6_replace_info <= 1'b1;
              end
              if(_zz_43) begin
                ways_1_metas_7_replace_info <= 1'b1;
              end
              if(_zz_44) begin
                ways_1_metas_8_replace_info <= 1'b1;
              end
              if(_zz_45) begin
                ways_1_metas_9_replace_info <= 1'b1;
              end
              if(_zz_46) begin
                ways_1_metas_10_replace_info <= 1'b1;
              end
              if(_zz_47) begin
                ways_1_metas_11_replace_info <= 1'b1;
              end
              if(_zz_48) begin
                ways_1_metas_12_replace_info <= 1'b1;
              end
              if(_zz_49) begin
                ways_1_metas_13_replace_info <= 1'b1;
              end
              if(_zz_50) begin
                ways_1_metas_14_replace_info <= 1'b1;
              end
              if(_zz_51) begin
                ways_1_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_1) begin
                if(_zz_53) begin
                  ways_1_metas_0_valid <= 1'b1;
                end
                if(_zz_54) begin
                  ways_1_metas_1_valid <= 1'b1;
                end
                if(_zz_55) begin
                  ways_1_metas_2_valid <= 1'b1;
                end
                if(_zz_56) begin
                  ways_1_metas_3_valid <= 1'b1;
                end
                if(_zz_57) begin
                  ways_1_metas_4_valid <= 1'b1;
                end
                if(_zz_58) begin
                  ways_1_metas_5_valid <= 1'b1;
                end
                if(_zz_59) begin
                  ways_1_metas_6_valid <= 1'b1;
                end
                if(_zz_60) begin
                  ways_1_metas_7_valid <= 1'b1;
                end
                if(_zz_61) begin
                  ways_1_metas_8_valid <= 1'b1;
                end
                if(_zz_62) begin
                  ways_1_metas_9_valid <= 1'b1;
                end
                if(_zz_63) begin
                  ways_1_metas_10_valid <= 1'b1;
                end
                if(_zz_64) begin
                  ways_1_metas_11_valid <= 1'b1;
                end
                if(_zz_65) begin
                  ways_1_metas_12_valid <= 1'b1;
                end
                if(_zz_66) begin
                  ways_1_metas_13_valid <= 1'b1;
                end
                if(_zz_67) begin
                  ways_1_metas_14_valid <= 1'b1;
                end
                if(_zz_68) begin
                  ways_1_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l183_1) begin
        if(_zz_53) begin
          ways_1_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_54) begin
          ways_1_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_55) begin
          ways_1_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_56) begin
          ways_1_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_57) begin
          ways_1_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_58) begin
          ways_1_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_59) begin
          ways_1_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_60) begin
          ways_1_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_61) begin
          ways_1_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_62) begin
          ways_1_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_63) begin
          ways_1_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_64) begin
          ways_1_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_65) begin
          ways_1_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_66) begin
          ways_1_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_67) begin
          ways_1_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_68) begin
          ways_1_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l192_1) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_70) begin
          ways_2_metas_0_replace_info <= 1'b0;
        end
        if(_zz_71) begin
          ways_2_metas_1_replace_info <= 1'b0;
        end
        if(_zz_72) begin
          ways_2_metas_2_replace_info <= 1'b0;
        end
        if(_zz_73) begin
          ways_2_metas_3_replace_info <= 1'b0;
        end
        if(_zz_74) begin
          ways_2_metas_4_replace_info <= 1'b0;
        end
        if(_zz_75) begin
          ways_2_metas_5_replace_info <= 1'b0;
        end
        if(_zz_76) begin
          ways_2_metas_6_replace_info <= 1'b0;
        end
        if(_zz_77) begin
          ways_2_metas_7_replace_info <= 1'b0;
        end
        if(_zz_78) begin
          ways_2_metas_8_replace_info <= 1'b0;
        end
        if(_zz_79) begin
          ways_2_metas_9_replace_info <= 1'b0;
        end
        if(_zz_80) begin
          ways_2_metas_10_replace_info <= 1'b0;
        end
        if(_zz_81) begin
          ways_2_metas_11_replace_info <= 1'b0;
        end
        if(_zz_82) begin
          ways_2_metas_12_replace_info <= 1'b0;
        end
        if(_zz_83) begin
          ways_2_metas_13_replace_info <= 1'b0;
        end
        if(_zz_84) begin
          ways_2_metas_14_replace_info <= 1'b0;
        end
        if(_zz_85) begin
          ways_2_metas_15_replace_info <= 1'b0;
        end
        if(_zz_87) begin
          ways_2_metas_0_valid <= 1'b0;
        end
        if(_zz_88) begin
          ways_2_metas_1_valid <= 1'b0;
        end
        if(_zz_89) begin
          ways_2_metas_2_valid <= 1'b0;
        end
        if(_zz_90) begin
          ways_2_metas_3_valid <= 1'b0;
        end
        if(_zz_91) begin
          ways_2_metas_4_valid <= 1'b0;
        end
        if(_zz_92) begin
          ways_2_metas_5_valid <= 1'b0;
        end
        if(_zz_93) begin
          ways_2_metas_6_valid <= 1'b0;
        end
        if(_zz_94) begin
          ways_2_metas_7_valid <= 1'b0;
        end
        if(_zz_95) begin
          ways_2_metas_8_valid <= 1'b0;
        end
        if(_zz_96) begin
          ways_2_metas_9_valid <= 1'b0;
        end
        if(_zz_97) begin
          ways_2_metas_10_valid <= 1'b0;
        end
        if(_zz_98) begin
          ways_2_metas_11_valid <= 1'b0;
        end
        if(_zz_99) begin
          ways_2_metas_12_valid <= 1'b0;
        end
        if(_zz_100) begin
          ways_2_metas_13_valid <= 1'b0;
        end
        if(_zz_101) begin
          ways_2_metas_14_valid <= 1'b0;
        end
        if(_zz_102) begin
          ways_2_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l166_2) begin
          if(icache_hit_2) begin
            if(_zz_70) begin
              ways_2_metas_0_replace_info <= 1'b1;
            end
            if(_zz_71) begin
              ways_2_metas_1_replace_info <= 1'b1;
            end
            if(_zz_72) begin
              ways_2_metas_2_replace_info <= 1'b1;
            end
            if(_zz_73) begin
              ways_2_metas_3_replace_info <= 1'b1;
            end
            if(_zz_74) begin
              ways_2_metas_4_replace_info <= 1'b1;
            end
            if(_zz_75) begin
              ways_2_metas_5_replace_info <= 1'b1;
            end
            if(_zz_76) begin
              ways_2_metas_6_replace_info <= 1'b1;
            end
            if(_zz_77) begin
              ways_2_metas_7_replace_info <= 1'b1;
            end
            if(_zz_78) begin
              ways_2_metas_8_replace_info <= 1'b1;
            end
            if(_zz_79) begin
              ways_2_metas_9_replace_info <= 1'b1;
            end
            if(_zz_80) begin
              ways_2_metas_10_replace_info <= 1'b1;
            end
            if(_zz_81) begin
              ways_2_metas_11_replace_info <= 1'b1;
            end
            if(_zz_82) begin
              ways_2_metas_12_replace_info <= 1'b1;
            end
            if(_zz_83) begin
              ways_2_metas_13_replace_info <= 1'b1;
            end
            if(_zz_84) begin
              ways_2_metas_14_replace_info <= 1'b1;
            end
            if(_zz_85) begin
              ways_2_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_70) begin
              ways_2_metas_0_replace_info <= 1'b0;
            end
            if(_zz_71) begin
              ways_2_metas_1_replace_info <= 1'b0;
            end
            if(_zz_72) begin
              ways_2_metas_2_replace_info <= 1'b0;
            end
            if(_zz_73) begin
              ways_2_metas_3_replace_info <= 1'b0;
            end
            if(_zz_74) begin
              ways_2_metas_4_replace_info <= 1'b0;
            end
            if(_zz_75) begin
              ways_2_metas_5_replace_info <= 1'b0;
            end
            if(_zz_76) begin
              ways_2_metas_6_replace_info <= 1'b0;
            end
            if(_zz_77) begin
              ways_2_metas_7_replace_info <= 1'b0;
            end
            if(_zz_78) begin
              ways_2_metas_8_replace_info <= 1'b0;
            end
            if(_zz_79) begin
              ways_2_metas_9_replace_info <= 1'b0;
            end
            if(_zz_80) begin
              ways_2_metas_10_replace_info <= 1'b0;
            end
            if(_zz_81) begin
              ways_2_metas_11_replace_info <= 1'b0;
            end
            if(_zz_82) begin
              ways_2_metas_12_replace_info <= 1'b0;
            end
            if(_zz_83) begin
              ways_2_metas_13_replace_info <= 1'b0;
            end
            if(_zz_84) begin
              ways_2_metas_14_replace_info <= 1'b0;
            end
            if(_zz_85) begin
              ways_2_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_2) begin
              if(_zz_70) begin
                ways_2_metas_0_replace_info <= 1'b1;
              end
              if(_zz_71) begin
                ways_2_metas_1_replace_info <= 1'b1;
              end
              if(_zz_72) begin
                ways_2_metas_2_replace_info <= 1'b1;
              end
              if(_zz_73) begin
                ways_2_metas_3_replace_info <= 1'b1;
              end
              if(_zz_74) begin
                ways_2_metas_4_replace_info <= 1'b1;
              end
              if(_zz_75) begin
                ways_2_metas_5_replace_info <= 1'b1;
              end
              if(_zz_76) begin
                ways_2_metas_6_replace_info <= 1'b1;
              end
              if(_zz_77) begin
                ways_2_metas_7_replace_info <= 1'b1;
              end
              if(_zz_78) begin
                ways_2_metas_8_replace_info <= 1'b1;
              end
              if(_zz_79) begin
                ways_2_metas_9_replace_info <= 1'b1;
              end
              if(_zz_80) begin
                ways_2_metas_10_replace_info <= 1'b1;
              end
              if(_zz_81) begin
                ways_2_metas_11_replace_info <= 1'b1;
              end
              if(_zz_82) begin
                ways_2_metas_12_replace_info <= 1'b1;
              end
              if(_zz_83) begin
                ways_2_metas_13_replace_info <= 1'b1;
              end
              if(_zz_84) begin
                ways_2_metas_14_replace_info <= 1'b1;
              end
              if(_zz_85) begin
                ways_2_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_2) begin
                if(_zz_87) begin
                  ways_2_metas_0_valid <= 1'b1;
                end
                if(_zz_88) begin
                  ways_2_metas_1_valid <= 1'b1;
                end
                if(_zz_89) begin
                  ways_2_metas_2_valid <= 1'b1;
                end
                if(_zz_90) begin
                  ways_2_metas_3_valid <= 1'b1;
                end
                if(_zz_91) begin
                  ways_2_metas_4_valid <= 1'b1;
                end
                if(_zz_92) begin
                  ways_2_metas_5_valid <= 1'b1;
                end
                if(_zz_93) begin
                  ways_2_metas_6_valid <= 1'b1;
                end
                if(_zz_94) begin
                  ways_2_metas_7_valid <= 1'b1;
                end
                if(_zz_95) begin
                  ways_2_metas_8_valid <= 1'b1;
                end
                if(_zz_96) begin
                  ways_2_metas_9_valid <= 1'b1;
                end
                if(_zz_97) begin
                  ways_2_metas_10_valid <= 1'b1;
                end
                if(_zz_98) begin
                  ways_2_metas_11_valid <= 1'b1;
                end
                if(_zz_99) begin
                  ways_2_metas_12_valid <= 1'b1;
                end
                if(_zz_100) begin
                  ways_2_metas_13_valid <= 1'b1;
                end
                if(_zz_101) begin
                  ways_2_metas_14_valid <= 1'b1;
                end
                if(_zz_102) begin
                  ways_2_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l183_2) begin
        if(_zz_87) begin
          ways_2_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_88) begin
          ways_2_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_89) begin
          ways_2_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_90) begin
          ways_2_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_91) begin
          ways_2_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_92) begin
          ways_2_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_93) begin
          ways_2_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_94) begin
          ways_2_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_95) begin
          ways_2_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_96) begin
          ways_2_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_97) begin
          ways_2_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_98) begin
          ways_2_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_99) begin
          ways_2_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_100) begin
          ways_2_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_101) begin
          ways_2_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_102) begin
          ways_2_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l192_2) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
      if(flush) begin
        if(_zz_104) begin
          ways_3_metas_0_replace_info <= 1'b0;
        end
        if(_zz_105) begin
          ways_3_metas_1_replace_info <= 1'b0;
        end
        if(_zz_106) begin
          ways_3_metas_2_replace_info <= 1'b0;
        end
        if(_zz_107) begin
          ways_3_metas_3_replace_info <= 1'b0;
        end
        if(_zz_108) begin
          ways_3_metas_4_replace_info <= 1'b0;
        end
        if(_zz_109) begin
          ways_3_metas_5_replace_info <= 1'b0;
        end
        if(_zz_110) begin
          ways_3_metas_6_replace_info <= 1'b0;
        end
        if(_zz_111) begin
          ways_3_metas_7_replace_info <= 1'b0;
        end
        if(_zz_112) begin
          ways_3_metas_8_replace_info <= 1'b0;
        end
        if(_zz_113) begin
          ways_3_metas_9_replace_info <= 1'b0;
        end
        if(_zz_114) begin
          ways_3_metas_10_replace_info <= 1'b0;
        end
        if(_zz_115) begin
          ways_3_metas_11_replace_info <= 1'b0;
        end
        if(_zz_116) begin
          ways_3_metas_12_replace_info <= 1'b0;
        end
        if(_zz_117) begin
          ways_3_metas_13_replace_info <= 1'b0;
        end
        if(_zz_118) begin
          ways_3_metas_14_replace_info <= 1'b0;
        end
        if(_zz_119) begin
          ways_3_metas_15_replace_info <= 1'b0;
        end
        if(_zz_121) begin
          ways_3_metas_0_valid <= 1'b0;
        end
        if(_zz_122) begin
          ways_3_metas_1_valid <= 1'b0;
        end
        if(_zz_123) begin
          ways_3_metas_2_valid <= 1'b0;
        end
        if(_zz_124) begin
          ways_3_metas_3_valid <= 1'b0;
        end
        if(_zz_125) begin
          ways_3_metas_4_valid <= 1'b0;
        end
        if(_zz_126) begin
          ways_3_metas_5_valid <= 1'b0;
        end
        if(_zz_127) begin
          ways_3_metas_6_valid <= 1'b0;
        end
        if(_zz_128) begin
          ways_3_metas_7_valid <= 1'b0;
        end
        if(_zz_129) begin
          ways_3_metas_8_valid <= 1'b0;
        end
        if(_zz_130) begin
          ways_3_metas_9_valid <= 1'b0;
        end
        if(_zz_131) begin
          ways_3_metas_10_valid <= 1'b0;
        end
        if(_zz_132) begin
          ways_3_metas_11_valid <= 1'b0;
        end
        if(_zz_133) begin
          ways_3_metas_12_valid <= 1'b0;
        end
        if(_zz_134) begin
          ways_3_metas_13_valid <= 1'b0;
        end
        if(_zz_135) begin
          ways_3_metas_14_valid <= 1'b0;
        end
        if(_zz_136) begin
          ways_3_metas_15_valid <= 1'b0;
        end
      end else begin
        if(when_ICache_l166_3) begin
          if(icache_hit_3) begin
            if(_zz_104) begin
              ways_3_metas_0_replace_info <= 1'b1;
            end
            if(_zz_105) begin
              ways_3_metas_1_replace_info <= 1'b1;
            end
            if(_zz_106) begin
              ways_3_metas_2_replace_info <= 1'b1;
            end
            if(_zz_107) begin
              ways_3_metas_3_replace_info <= 1'b1;
            end
            if(_zz_108) begin
              ways_3_metas_4_replace_info <= 1'b1;
            end
            if(_zz_109) begin
              ways_3_metas_5_replace_info <= 1'b1;
            end
            if(_zz_110) begin
              ways_3_metas_6_replace_info <= 1'b1;
            end
            if(_zz_111) begin
              ways_3_metas_7_replace_info <= 1'b1;
            end
            if(_zz_112) begin
              ways_3_metas_8_replace_info <= 1'b1;
            end
            if(_zz_113) begin
              ways_3_metas_9_replace_info <= 1'b1;
            end
            if(_zz_114) begin
              ways_3_metas_10_replace_info <= 1'b1;
            end
            if(_zz_115) begin
              ways_3_metas_11_replace_info <= 1'b1;
            end
            if(_zz_116) begin
              ways_3_metas_12_replace_info <= 1'b1;
            end
            if(_zz_117) begin
              ways_3_metas_13_replace_info <= 1'b1;
            end
            if(_zz_118) begin
              ways_3_metas_14_replace_info <= 1'b1;
            end
            if(_zz_119) begin
              ways_3_metas_15_replace_info <= 1'b1;
            end
          end else begin
            if(_zz_104) begin
              ways_3_metas_0_replace_info <= 1'b0;
            end
            if(_zz_105) begin
              ways_3_metas_1_replace_info <= 1'b0;
            end
            if(_zz_106) begin
              ways_3_metas_2_replace_info <= 1'b0;
            end
            if(_zz_107) begin
              ways_3_metas_3_replace_info <= 1'b0;
            end
            if(_zz_108) begin
              ways_3_metas_4_replace_info <= 1'b0;
            end
            if(_zz_109) begin
              ways_3_metas_5_replace_info <= 1'b0;
            end
            if(_zz_110) begin
              ways_3_metas_6_replace_info <= 1'b0;
            end
            if(_zz_111) begin
              ways_3_metas_7_replace_info <= 1'b0;
            end
            if(_zz_112) begin
              ways_3_metas_8_replace_info <= 1'b0;
            end
            if(_zz_113) begin
              ways_3_metas_9_replace_info <= 1'b0;
            end
            if(_zz_114) begin
              ways_3_metas_10_replace_info <= 1'b0;
            end
            if(_zz_115) begin
              ways_3_metas_11_replace_info <= 1'b0;
            end
            if(_zz_116) begin
              ways_3_metas_12_replace_info <= 1'b0;
            end
            if(_zz_117) begin
              ways_3_metas_13_replace_info <= 1'b0;
            end
            if(_zz_118) begin
              ways_3_metas_14_replace_info <= 1'b0;
            end
            if(_zz_119) begin
              ways_3_metas_15_replace_info <= 1'b0;
            end
          end
        end else begin
          if(is_hit) begin
            if(icache_hit_3) begin
              if(_zz_104) begin
                ways_3_metas_0_replace_info <= 1'b1;
              end
              if(_zz_105) begin
                ways_3_metas_1_replace_info <= 1'b1;
              end
              if(_zz_106) begin
                ways_3_metas_2_replace_info <= 1'b1;
              end
              if(_zz_107) begin
                ways_3_metas_3_replace_info <= 1'b1;
              end
              if(_zz_108) begin
                ways_3_metas_4_replace_info <= 1'b1;
              end
              if(_zz_109) begin
                ways_3_metas_5_replace_info <= 1'b1;
              end
              if(_zz_110) begin
                ways_3_metas_6_replace_info <= 1'b1;
              end
              if(_zz_111) begin
                ways_3_metas_7_replace_info <= 1'b1;
              end
              if(_zz_112) begin
                ways_3_metas_8_replace_info <= 1'b1;
              end
              if(_zz_113) begin
                ways_3_metas_9_replace_info <= 1'b1;
              end
              if(_zz_114) begin
                ways_3_metas_10_replace_info <= 1'b1;
              end
              if(_zz_115) begin
                ways_3_metas_11_replace_info <= 1'b1;
              end
              if(_zz_116) begin
                ways_3_metas_12_replace_info <= 1'b1;
              end
              if(_zz_117) begin
                ways_3_metas_13_replace_info <= 1'b1;
              end
              if(_zz_118) begin
                ways_3_metas_14_replace_info <= 1'b1;
              end
              if(_zz_119) begin
                ways_3_metas_15_replace_info <= 1'b1;
              end
            end
          end else begin
            if(next_level_rsp_valid) begin
              if(icache_victim_3) begin
                if(_zz_121) begin
                  ways_3_metas_0_valid <= 1'b1;
                end
                if(_zz_122) begin
                  ways_3_metas_1_valid <= 1'b1;
                end
                if(_zz_123) begin
                  ways_3_metas_2_valid <= 1'b1;
                end
                if(_zz_124) begin
                  ways_3_metas_3_valid <= 1'b1;
                end
                if(_zz_125) begin
                  ways_3_metas_4_valid <= 1'b1;
                end
                if(_zz_126) begin
                  ways_3_metas_5_valid <= 1'b1;
                end
                if(_zz_127) begin
                  ways_3_metas_6_valid <= 1'b1;
                end
                if(_zz_128) begin
                  ways_3_metas_7_valid <= 1'b1;
                end
                if(_zz_129) begin
                  ways_3_metas_8_valid <= 1'b1;
                end
                if(_zz_130) begin
                  ways_3_metas_9_valid <= 1'b1;
                end
                if(_zz_131) begin
                  ways_3_metas_10_valid <= 1'b1;
                end
                if(_zz_132) begin
                  ways_3_metas_11_valid <= 1'b1;
                end
                if(_zz_133) begin
                  ways_3_metas_12_valid <= 1'b1;
                end
                if(_zz_134) begin
                  ways_3_metas_13_valid <= 1'b1;
                end
                if(_zz_135) begin
                  ways_3_metas_14_valid <= 1'b1;
                end
                if(_zz_136) begin
                  ways_3_metas_15_valid <= 1'b1;
                end
              end
            end
          end
        end
      end
      if(when_ICache_l183_3) begin
        if(_zz_121) begin
          ways_3_metas_0_tag <= cpu_tag_d1;
        end
        if(_zz_122) begin
          ways_3_metas_1_tag <= cpu_tag_d1;
        end
        if(_zz_123) begin
          ways_3_metas_2_tag <= cpu_tag_d1;
        end
        if(_zz_124) begin
          ways_3_metas_3_tag <= cpu_tag_d1;
        end
        if(_zz_125) begin
          ways_3_metas_4_tag <= cpu_tag_d1;
        end
        if(_zz_126) begin
          ways_3_metas_5_tag <= cpu_tag_d1;
        end
        if(_zz_127) begin
          ways_3_metas_6_tag <= cpu_tag_d1;
        end
        if(_zz_128) begin
          ways_3_metas_7_tag <= cpu_tag_d1;
        end
        if(_zz_129) begin
          ways_3_metas_8_tag <= cpu_tag_d1;
        end
        if(_zz_130) begin
          ways_3_metas_9_tag <= cpu_tag_d1;
        end
        if(_zz_131) begin
          ways_3_metas_10_tag <= cpu_tag_d1;
        end
        if(_zz_132) begin
          ways_3_metas_11_tag <= cpu_tag_d1;
        end
        if(_zz_133) begin
          ways_3_metas_12_tag <= cpu_tag_d1;
        end
        if(_zz_134) begin
          ways_3_metas_13_tag <= cpu_tag_d1;
        end
        if(_zz_135) begin
          ways_3_metas_14_tag <= cpu_tag_d1;
        end
        if(_zz_136) begin
          ways_3_metas_15_tag <= cpu_tag_d1;
        end
      end
      if(flush) begin
        cpu_cmd_ready_1 <= 1'b0;
      end else begin
        if(is_miss) begin
          cpu_cmd_ready_1 <= 1'b0;
        end else begin
          if(when_ICache_l192_3) begin
            cpu_cmd_ready_1 <= 1'b1;
          end
        end
      end
    end
  end


endmodule

module RegFileModule (
  output     [63:0]   read_ports_rs1_value,
  output     [63:0]   read_ports_rs2_value,
  input      [4:0]    read_ports_rs1_addr,
  input      [4:0]    read_ports_rs2_addr,
  input               read_ports_rs1_req,
  input               read_ports_rs2_req,
  input      [63:0]   write_ports_rd_value,
  input      [4:0]    write_ports_rd_addr,
  input               write_ports_rd_wen,
  input               clk,
  input               reset
);

  wire       [63:0]   _zz_reg_file_port1;
  wire       [63:0]   _zz_reg_file_port2;
  (* ram_style = "distributed" *) reg [63:0] reg_file [0:31];

  always @(posedge clk) begin
    if(write_ports_rd_wen) begin
      reg_file[write_ports_rd_addr] <= write_ports_rd_value;
    end
  end

  assign _zz_reg_file_port1 = reg_file[read_ports_rs1_addr];
  assign _zz_reg_file_port2 = reg_file[read_ports_rs2_addr];
  assign read_ports_rs1_value = _zz_reg_file_port1;
  assign read_ports_rs2_value = _zz_reg_file_port2;

endmodule
