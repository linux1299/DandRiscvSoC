// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : 6cac80190c7b528a7f431486cfe0b3a6c10eec09

`timescale 1ns/1ps

module DandRiscvSimple (
  output              icache_cmd_valid,
  input               icache_cmd_ready,
  output     [63:0]   icache_cmd_payload_addr,
  input               icache_rsp_valid,
  input      [31:0]   icache_rsp_payload_data,
  output              dcache_cmd_valid,
  input               dcache_cmd_ready,
  output     [63:0]   dcache_cmd_payload_addr,
  output              dcache_cmd_payload_wen,
  output     [63:0]   dcache_cmd_payload_wdata,
  output     [7:0]    dcache_cmd_payload_wstrb,
  output     [2:0]    dcache_cmd_payload_size,
  input               dcache_rsp_valid,
  input      [63:0]   dcache_rsp_payload_data,
  input               clk,
  input               reset
);
  localparam CsrCtrlEnum_IDLE = 4'd0;
  localparam CsrCtrlEnum_ECALL = 4'd1;
  localparam CsrCtrlEnum_EBREAK = 4'd2;
  localparam CsrCtrlEnum_MRET = 4'd3;
  localparam CsrCtrlEnum_CSRRW = 4'd4;
  localparam CsrCtrlEnum_CSRRS = 4'd5;
  localparam CsrCtrlEnum_CSRRC = 4'd6;
  localparam CsrCtrlEnum_CSRRWI = 4'd7;
  localparam CsrCtrlEnum_CSRRSI = 4'd8;
  localparam CsrCtrlEnum_CSRRCI = 4'd9;
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
  localparam AluCtrlEnum_AUIPC = 5'd12;
  localparam AluCtrlEnum_JAL = 5'd13;
  localparam AluCtrlEnum_JALR = 5'd14;
  localparam AluCtrlEnum_BEQ = 5'd15;
  localparam AluCtrlEnum_BNE = 5'd16;
  localparam AluCtrlEnum_BLT = 5'd17;
  localparam AluCtrlEnum_BGE = 5'd18;
  localparam AluCtrlEnum_BLTU = 5'd19;
  localparam AluCtrlEnum_BGEU = 5'd20;
  localparam AluCtrlEnum_CSR = 5'd21;
  localparam MemCtrlEnum_IDLE = 4'd0;
  localparam MemCtrlEnum_LB = 4'd1;
  localparam MemCtrlEnum_LBU = 4'd2;
  localparam MemCtrlEnum_LH = 4'd3;
  localparam MemCtrlEnum_LHU = 4'd4;
  localparam MemCtrlEnum_LW = 4'd5;
  localparam MemCtrlEnum_LWU = 4'd6;
  localparam MemCtrlEnum_LD = 4'd7;
  localparam MemCtrlEnum_SB = 4'd8;
  localparam MemCtrlEnum_SH = 4'd9;
  localparam MemCtrlEnum_SW = 4'd10;
  localparam MemCtrlEnum_SD = 4'd11;

  wire                regFileModule_1_write_ports_rd_wen;
  wire                clint_1_ecall;
  wire                clint_1_ebreak;
  wire                clint_1_mret;
  wire       [63:0]   timer_1_addr;
  wire                fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_valid;
  wire       [63:0]   fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload;
  wire                fetch_FetchPlugin_pc_stream_fifo_ports_s_ports_ready;
  wire       [63:0]   fetch_FetchPlugin_pc_stream_fifo_next_payload;
  wire                fetch_FetchPlugin_pc_stream_fifo_next_valid;
  wire                fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_valid;
  wire                fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_payload;
  wire                fetch_FetchPlugin_predict_taken_fifo_ports_s_ports_ready;
  wire                fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid;
  wire       [31:0]   fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload;
  wire                fetch_FetchPlugin_instruction_stream_fifo_ports_s_ports_ready;
  wire                gshare_predictor_1_predict_taken;
  wire       [6:0]    gshare_predictor_1_predict_history;
  wire       [63:0]   gshare_predictor_1_predict_pc_next;
  wire       [63:0]   regFileModule_1_read_ports_rs1_value;
  wire       [63:0]   regFileModule_1_read_ports_rs2_value;
  wire       [63:0]   csrRegfile_1_cpu_ports_rdata;
  wire       [63:0]   csrRegfile_1_clint_ports_mtvec;
  wire       [63:0]   csrRegfile_1_clint_ports_mepc;
  wire       [63:0]   csrRegfile_1_clint_ports_mstatus;
  wire                csrRegfile_1_clint_ports_global_int_en;
  wire                csrRegfile_1_clint_ports_mtime_int_en;
  wire                csrRegfile_1_clint_ports_mtime_int_pend;
  wire                clint_1_csr_ports_mepc_wen;
  wire       [63:0]   clint_1_csr_ports_mepc_wdata;
  wire                clint_1_csr_ports_mcause_wen;
  wire       [63:0]   clint_1_csr_ports_mcause_wdata;
  wire                clint_1_csr_ports_mstatus_wen;
  wire       [63:0]   clint_1_csr_ports_mstatus_wdata;
  wire                clint_1_int_en;
  wire       [63:0]   clint_1_int_pc;
  wire                clint_1_int_hold;
  wire       [63:0]   timer_1_rdata;
  wire                timer_1_timer_int;
  wire       [11:0]   tmp_tmp_decode_DecodePlugin_imm_2;
  wire       [11:0]   tmp_tmp_decode_DecodePlugin_imm_4;
  wire       [19:0]   tmp_tmp_decode_DecodePlugin_imm_6;
  wire       [31:0]   tmp_tmp_decode_DecodePlugin_imm_8;
  wire       [63:0]   tmp_execute_ALUPlugin_add_result;
  wire       [63:0]   tmp_execute_ALUPlugin_add_result_1;
  wire       [63:0]   tmp_execute_ALUPlugin_sub_result;
  wire       [63:0]   tmp_execute_ALUPlugin_sub_result_1;
  wire       [63:0]   tmp_execute_ALUPlugin_slt_result;
  wire       [63:0]   tmp_execute_ALUPlugin_slt_result_1;
  wire       [63:0]   tmp_execute_ALUPlugin_sra_result;
  wire       [31:0]   tmp_execute_ALUPlugin_addw_result_2;
  wire       [31:0]   tmp_execute_ALUPlugin_subw_result_2;
  wire       [31:0]   tmp_execute_ALUPlugin_sraw_temp;
  wire       [63:0]   tmp_execute_ALUPlugin_blt_result;
  wire       [63:0]   tmp_execute_ALUPlugin_blt_result_1;
  wire       [63:0]   tmp_execute_ALUPlugin_bge_result;
  wire       [63:0]   tmp_execute_ALUPlugin_bge_result_1;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_1;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_2;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_3;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_4;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_5;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_6;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_7;
  wire       [63:0]   tmp_execute_ALUPlugin_pc_next_8;
  wire                tmp_when;
  wire                tmp_when_1;
  wire       [5:0]    tmp_memaccess_LSUPlugin_dcache_rdata;
  wire       [5:0]    tmp_memaccess_LSUPlugin_lsu_wdata;
  wire       [63:0]   writeback_RD;
  wire                memaccess_LSU_HOLD;
  wire                memaccess_TIMER_CEN;
  wire       [63:0]   memaccess_LSU_WDATA;
  wire                execute_INT_HOLD;
  wire       [63:0]   execute_REDIRECT_PC_NEXT;
  wire                execute_REDIRECT_VALID;
  wire                execute_IS_RET;
  wire                execute_IS_CALL;
  wire                execute_IS_JMP;
  wire       [6:0]    execute_BRANCH_HISTORY;
  wire                execute_BRANCH_TAKEN;
  wire                execute_BRANCH_OR_JUMP;
  wire                execute_BRANCH_OR_JALR;
  wire       [63:0]   execute_MEM_WDATA;
  wire       [63:0]   execute_ALU_RESULT;
  wire       [63:0]   decode_CSR_RDATA;
  wire                execute_CSR_WEN;
  wire                decode_CSR_WEN;
  wire       [11:0]   execute_CSR_ADDR;
  wire       [11:0]   decode_CSR_ADDR;
  wire       [3:0]    decode_CSR_CTRL;
  wire                execute_IS_STORE;
  wire                decode_IS_STORE;
  wire                execute_IS_LOAD;
  wire                decode_IS_LOAD;
  wire       [4:0]    writeback_RD_ADDR;
  wire       [4:0]    memaccess_RD_ADDR;
  wire       [4:0]    decode_RD_ADDR;
  wire                writeback_RD_WEN;
  wire                memaccess_RD_WEN;
  wire                execute_RD_WEN;
  wire                decode_RD_WEN;
  wire       [3:0]    execute_MEM_CTRL;
  wire       [3:0]    decode_MEM_CTRL;
  wire                decode_SRC2_IS_IMM;
  wire                decode_ALU_WORD;
  wire       [4:0]    decode_ALU_CTRL;
  wire       [4:0]    execute_RS2_ADDR;
  wire       [4:0]    decode_RS2_ADDR;
  wire       [4:0]    decode_RS1_ADDR;
  wire       [63:0]   decode_RS2;
  wire       [63:0]   decode_RS1;
  wire       [63:0]   decode_IMM;
  wire       [63:0]   fetch_INT_PC;
  wire                fetch_INT_EN;
  wire       [63:0]   fetch_PREDICT_PC;
  wire                decode_PREDICT_TAKEN;
  wire                fetch_PREDICT_TAKEN;
  wire                fetch_PREDICT_VALID;
  wire       [31:0]   memaccess_INSTRUCTION;
  wire       [31:0]   execute_INSTRUCTION;
  wire       [31:0]   fetch_INSTRUCTION;
  wire       [63:0]   decode_PC_NEXT;
  wire       [63:0]   fetch_PC_NEXT;
  wire       [63:0]   memaccess_PC;
  wire       [63:0]   fetch_PC;
  wire       [31:0]   writeback_INSTRUCTION;
  wire       [63:0]   writeback_PC;
  wire       [63:0]   writeback_ALU_RESULT;
  wire       [63:0]   writeback_LSU_RDATA;
  wire                writeback_IS_LOAD;
  wire       [3:0]    memaccess_MEM_CTRL;
  wire       [63:0]   memaccess_MEM_WDATA;
  wire                memaccess_IS_STORE;
  wire                memaccess_IS_LOAD;
  wire       [3:0]    execute_CSR_CTRL;
  wire       [63:0]   execute_SRC1;
  wire       [3:0]    tmp_ecall;
  wire       [11:0]   tmp_decode_to_execute_CSR_ADDR;
  wire                tmp_memaccess_arbitration_haltItself;
  wire                tmp_DecodePlugin_hazard_ctrl_rs1_from_mem;
  wire       [4:0]    tmp_DecodePlugin_hazard_rs2_from_mem;
  wire                tmp_DecodePlugin_hazard_rs1_from_mem;
  wire       [4:0]    tmp_DecodePlugin_hazard_rs1_from_mem_1;
  wire       [4:0]    tmp_DecodePlugin_hazard_rs1_from_mem_2;
  wire                tmp_DecodePlugin_hazard_rs1_from_mem_3;
  wire       [63:0]   execute_PC_NEXT;
  wire                execute_PREDICT_TAKEN;
  wire       [63:0]   execute_CSR_RDATA;
  wire                execute_ALU_WORD;
  wire                execute_CTRL_RS2_FROM_WB;
  wire                execute_CTRL_RS2_FROM_LOAD;
  wire                execute_CTRL_RS2_FROM_MEM;
  wire                execute_CTRL_RS1_FROM_WB;
  wire       [63:0]   tmp_execute_MEM_WDATA;
  wire                execute_CTRL_RS1_FROM_LOAD;
  wire       [63:0]   tmp_execute_MEM_WDATA_1;
  wire                execute_CTRL_RS1_FROM_MEM;
  wire       [63:0]   execute_RS2;
  wire                execute_RS2_FROM_WB;
  wire                execute_RS2_FROM_LOAD;
  wire                execute_RS2_FROM_MEM;
  wire       [63:0]   execute_IMM;
  wire                execute_SRC2_IS_IMM;
  wire       [63:0]   execute_RS1;
  wire                execute_RS1_FROM_WB;
  wire       [63:0]   memaccess_LSU_RDATA;
  wire                execute_RS1_FROM_LOAD;
  wire       [63:0]   memaccess_ALU_RESULT;
  wire                execute_RS1_FROM_MEM;
  wire       [63:0]   execute_PC;
  wire       [4:0]    execute_RS1_ADDR;
  wire       [4:0]    execute_RD_ADDR;
  wire       [4:0]    execute_ALU_CTRL;
  wire       [63:0]   tmp_execute_MEM_WDATA_2;
  wire       [4:0]    tmp_DecodePlugin_hazard_rs1_from_wb;
  wire                tmp_DecodePlugin_hazard_rs1_from_wb_1;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [63:0]   decode_PC;
  wire       [63:0]   tmp_execute_to_memaccess_PC;
  wire       [63:0]   fetch_BPU_PC_NEXT;
  wire       [63:0]   tmp_pc_next;
  wire                tmp_fetch_arbitration_flushIt;
  wire                fetch_BPU_BRANCH_TAKEN;
  wire                tmp_fetch_arbitration_flushIt_1;
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
  wire                DecodePlugin_hazard_decode_rs1_req;
  wire                DecodePlugin_hazard_decode_rs2_req;
  wire       [4:0]    DecodePlugin_hazard_decode_rs1_addr;
  wire       [4:0]    DecodePlugin_hazard_decode_rs2_addr;
  wire                DecodePlugin_hazard_rs1_from_mem;
  wire                DecodePlugin_hazard_rs2_from_mem;
  wire                DecodePlugin_hazard_rs1_from_load;
  wire                DecodePlugin_hazard_rs2_from_load;
  wire                DecodePlugin_hazard_rs1_from_wb;
  wire                DecodePlugin_hazard_rs2_from_wb;
  wire                DecodePlugin_hazard_load_use;
  wire                DecodePlugin_hazard_ctrl_rs1_from_mem;
  wire                DecodePlugin_hazard_ctrl_rs2_from_mem;
  wire                DecodePlugin_hazard_ctrl_rs1_from_load;
  wire                DecodePlugin_hazard_ctrl_rs2_from_load;
  wire                DecodePlugin_hazard_ctrl_rs1_from_wb;
  wire                DecodePlugin_hazard_ctrl_rs2_from_wb;
  wire                DecodePlugin_hazard_ctrl_load_use;
  wire                ICachePlugin_icache_access_cmd_valid;
  wire                ICachePlugin_icache_access_cmd_ready;
  wire       [63:0]   ICachePlugin_icache_access_cmd_payload_addr;
  wire                ICachePlugin_icache_access_rsp_valid;
  wire       [31:0]   ICachePlugin_icache_access_rsp_payload_data;
  wire                DCachePlugin_dcache_access_cmd_valid;
  wire                DCachePlugin_dcache_access_cmd_ready;
  wire       [63:0]   DCachePlugin_dcache_access_cmd_payload_addr;
  wire                DCachePlugin_dcache_access_cmd_payload_wen;
  wire       [63:0]   DCachePlugin_dcache_access_cmd_payload_wdata;
  wire       [7:0]    DCachePlugin_dcache_access_cmd_payload_wstrb;
  wire       [2:0]    DCachePlugin_dcache_access_cmd_payload_size;
  wire                DCachePlugin_dcache_access_rsp_valid;
  wire       [63:0]   DCachePlugin_dcache_access_rsp_payload_data;
  wire                DCachePlugin_dcache_access_stall;
  reg        [63:0]   pc_next;
  reg                 fetch_valid;
  reg                 rsp_flush;
  wire                fetch_FetchPlugin_fetch_flush;
  wire                ICachePlugin_icache_access_cmd_fire;
  wire                fetch_FetchPlugin_bpu_predict_taken;
  wire                fetch_FetchPlugin_pc_in_stream_valid;
  wire                fetch_FetchPlugin_pc_in_stream_ready;
  wire       [63:0]   fetch_FetchPlugin_pc_in_stream_payload;
  wire                fetch_FetchPlugin_pc_out_stream_valid;
  wire                fetch_FetchPlugin_pc_out_stream_ready;
  wire       [63:0]   fetch_FetchPlugin_pc_out_stream_payload;
  wire                fetch_FetchPlugin_predict_taken_in_valid;
  wire                fetch_FetchPlugin_predict_taken_in_ready;
  wire                fetch_FetchPlugin_predict_taken_in_payload;
  wire                fetch_FetchPlugin_predict_taken_out_valid;
  wire                fetch_FetchPlugin_predict_taken_out_ready;
  wire                fetch_FetchPlugin_predict_taken_out_payload;
  wire                fetch_FetchPlugin_instruction_in_stream_valid;
  wire                fetch_FetchPlugin_instruction_in_stream_ready;
  wire       [31:0]   fetch_FetchPlugin_instruction_in_stream_payload;
  wire                fetch_FetchPlugin_instruction_out_stream_valid;
  wire                fetch_FetchPlugin_instruction_out_stream_ready;
  wire       [31:0]   fetch_FetchPlugin_instruction_out_stream_payload;
  wire                fetch_FetchPlugin_fifo_all_valid;
  wire       [1:0]    IDLE;
  wire       [1:0]    FETCH;
  wire       [1:0]    HALT;
  reg        [1:0]    fetch_state_next;
  reg        [1:0]    fetch_state;
  wire                ICachePlugin_icache_access_cmd_isStall;
  wire                ICachePlugin_icache_access_cmd_fire_1;
  wire                ICachePlugin_icache_access_cmd_fire_2;
  wire                ICachePlugin_icache_access_cmd_fire_3;
  wire                ICachePlugin_icache_access_cmd_fire_4;
  reg        [63:0]   decode_DecodePlugin_imm;
  wire       [63:0]   decode_DecodePlugin_rs1;
  wire       [63:0]   decode_DecodePlugin_rs2;
  wire                decode_DecodePlugin_rs1_req;
  wire                decode_DecodePlugin_rs2_req;
  wire       [4:0]    decode_DecodePlugin_rs1_addr;
  wire       [4:0]    decode_DecodePlugin_rs2_addr;
  wire                decode_DecodePlugin_rd_wen;
  wire       [4:0]    decode_DecodePlugin_rd_addr;
  reg        [4:0]    decode_DecodePlugin_alu_ctrl;
  wire                decode_DecodePlugin_alu_word;
  wire                decode_DecodePlugin_src2_is_imm;
  reg        [3:0]    decode_DecodePlugin_mem_ctrl;
  reg                 decode_DecodePlugin_is_load;
  reg                 decode_DecodePlugin_is_store;
  reg        [3:0]    decode_DecodePlugin_csr_ctrl;
  wire       [11:0]   decode_DecodePlugin_csr_addr;
  wire                decode_DecodePlugin_csr_wen;
  wire                tmp_decode_DecodePlugin_imm;
  reg        [51:0]   tmp_decode_DecodePlugin_imm_1;
  wire                tmp_decode_DecodePlugin_imm_2;
  reg        [51:0]   tmp_decode_DecodePlugin_imm_3;
  wire                tmp_decode_DecodePlugin_imm_4;
  reg        [50:0]   tmp_decode_DecodePlugin_imm_5;
  wire                tmp_decode_DecodePlugin_imm_6;
  reg        [42:0]   tmp_decode_DecodePlugin_imm_7;
  wire                tmp_decode_DecodePlugin_imm_8;
  reg        [31:0]   tmp_decode_DecodePlugin_imm_9;
  wire                tmp_decode_DecodePlugin_imm_10;
  reg        [51:0]   tmp_decode_DecodePlugin_imm_11;
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
  wire                tmp_execute_ALUPlugin_addw_result;
  reg        [31:0]   tmp_execute_ALUPlugin_addw_result_1;
  wire       [63:0]   execute_ALUPlugin_addw_result;
  wire                tmp_execute_ALUPlugin_subw_result;
  reg        [31:0]   tmp_execute_ALUPlugin_subw_result_1;
  wire       [63:0]   execute_ALUPlugin_subw_result;
  wire       [31:0]   execute_ALUPlugin_sllw_temp;
  wire                tmp_execute_ALUPlugin_sllw_result;
  reg        [31:0]   tmp_execute_ALUPlugin_sllw_result_1;
  wire       [63:0]   execute_ALUPlugin_sllw_result;
  wire       [31:0]   execute_ALUPlugin_srlw_temp;
  wire                tmp_execute_ALUPlugin_srlw_result;
  reg        [31:0]   tmp_execute_ALUPlugin_srlw_result_1;
  wire       [63:0]   execute_ALUPlugin_srlw_result;
  wire       [31:0]   execute_ALUPlugin_sraw_temp;
  wire                tmp_execute_ALUPlugin_sraw_result;
  reg        [31:0]   tmp_execute_ALUPlugin_sraw_result_1;
  wire       [63:0]   execute_ALUPlugin_sraw_result;
  reg        [63:0]   execute_ALUPlugin_alu_result;
  reg        [63:0]   execute_ALUPlugin_pc_next;
  wire                execute_ALUPlugin_jal;
  wire                execute_ALUPlugin_jalr;
  wire                execute_ALUPlugin_beq;
  wire                execute_ALUPlugin_bne;
  wire                execute_ALUPlugin_blt;
  wire                execute_ALUPlugin_bge;
  wire                execute_ALUPlugin_bltu;
  wire                execute_ALUPlugin_bgeu;
  wire                execute_ALUPlugin_branch_or_jalr;
  wire                execute_ALUPlugin_branch_or_jump;
  reg        [63:0]   execute_ALUPlugin_branch_src1;
  reg        [63:0]   execute_ALUPlugin_branch_src2;
  wire                execute_ALUPlugin_rd_is_link;
  wire                execute_ALUPlugin_rs1_is_link;
  reg                 execute_ALUPlugin_is_call;
  reg                 execute_ALUPlugin_is_ret;
  reg                 execute_ALUPlugin_is_jmp;
  reg        [63:0]   execute_ALUPlugin_redirect_pc_next;
  reg                 execute_ALUPlugin_redirect_valid;
  wire       [62:0]   tmp_execute_ALUPlugin_alu_result;
  wire       [62:0]   tmp_execute_ALUPlugin_alu_result_1;
  wire                execute_ALUPlugin_beq_result;
  wire                execute_ALUPlugin_bne_result;
  wire                execute_ALUPlugin_blt_result;
  wire                execute_ALUPlugin_bge_result;
  wire                execute_ALUPlugin_bltu_result;
  wire                execute_ALUPlugin_bgeu_result;
  wire                execute_ALUPlugin_branch_taken;
  reg        [6:0]    execute_ALUPlugin_branch_history;
  reg        [63:0]   execute_ExcepPlugin_csr_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrs_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrc_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrsi_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrci_wdata;
  wire       [63:0]   memaccess_LSUPlugin_cpu_addr;
  wire       [2:0]    memaccess_LSUPlugin_cpu_addr_offset;
  wire                memaccess_LSUPlugin_is_mem;
  wire                memaccess_LSUPlugin_is_timer;
  wire       [63:0]   memaccess_LSUPlugin_dcache_rdata;
  wire                tmp_memaccess_LSUPlugin_dcache_lb;
  reg        [55:0]   tmp_memaccess_LSUPlugin_dcache_lb_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lb;
  reg        [55:0]   tmp_memaccess_LSUPlugin_dcache_lbu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lbu;
  wire                tmp_memaccess_LSUPlugin_dcache_lh;
  reg        [47:0]   tmp_memaccess_LSUPlugin_dcache_lh_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lh;
  reg        [47:0]   tmp_memaccess_LSUPlugin_dcache_lhu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lhu;
  wire                tmp_memaccess_LSUPlugin_dcache_lw;
  reg        [31:0]   tmp_memaccess_LSUPlugin_dcache_lw_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lw;
  reg        [31:0]   tmp_memaccess_LSUPlugin_dcache_lwu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lwu;
  reg        [63:0]   memaccess_LSUPlugin_dcache_data_load;
  wire                tmp_memaccess_LSUPlugin_dcache_sb;
  reg        [55:0]   tmp_memaccess_LSUPlugin_dcache_sb_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sb;
  wire                tmp_memaccess_LSUPlugin_dcache_sh;
  reg        [47:0]   tmp_memaccess_LSUPlugin_dcache_sh_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sh;
  wire                tmp_memaccess_LSUPlugin_dcache_sw;
  reg        [31:0]   tmp_memaccess_LSUPlugin_dcache_sw_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sw;
  reg        [63:0]   memaccess_LSUPlugin_dcache_wdata;
  reg        [7:0]    memaccess_LSUPlugin_dcache_wstrb;
  wire                memaccess_LSUPlugin_lsu_ready;
  wire       [63:0]   memaccess_LSUPlugin_lsu_addr;
  wire       [63:0]   memaccess_LSUPlugin_lsu_rdata;
  wire       [63:0]   memaccess_LSUPlugin_lsu_wdata;
  wire                memaccess_LSUPlugin_lsu_wen;
  wire       [7:0]    memaccess_LSUPlugin_lsu_wstrb;
  reg        [2:0]    memaccess_LSUPlugin_lsu_size;
  reg        [7:0]    tmp_memaccess_LSUPlugin_dcache_wstrb;
  reg        [7:0]    tmp_memaccess_LSUPlugin_dcache_wstrb_1;
  reg        [7:0]    tmp_memaccess_LSUPlugin_dcache_wstrb_2;
  wire       [7:0]    tmp_memaccess_LSUPlugin_dcache_wstrb_3;
  wire                dcache_stall;
  reg        [63:0]   fetch_to_decode_PC;
  reg        [63:0]   decode_to_execute_PC;
  reg        [63:0]   execute_to_memaccess_PC;
  reg        [63:0]   memaccess_to_writeback_PC;
  reg        [63:0]   fetch_to_decode_PC_NEXT;
  reg        [63:0]   decode_to_execute_PC_NEXT;
  reg        [31:0]   fetch_to_decode_INSTRUCTION;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  reg        [31:0]   execute_to_memaccess_INSTRUCTION;
  reg        [31:0]   memaccess_to_writeback_INSTRUCTION;
  reg                 fetch_to_decode_PREDICT_TAKEN;
  reg                 decode_to_execute_PREDICT_TAKEN;
  reg        [63:0]   decode_to_execute_IMM;
  reg        [63:0]   decode_to_execute_RS1;
  reg        [63:0]   decode_to_execute_RS2;
  reg        [4:0]    decode_to_execute_RS1_ADDR;
  reg        [4:0]    decode_to_execute_RS2_ADDR;
  reg        [4:0]    decode_to_execute_ALU_CTRL;
  reg                 decode_to_execute_ALU_WORD;
  reg                 decode_to_execute_SRC2_IS_IMM;
  reg        [3:0]    decode_to_execute_MEM_CTRL;
  reg        [3:0]    execute_to_memaccess_MEM_CTRL;
  reg                 decode_to_execute_RD_WEN;
  reg                 execute_to_memaccess_RD_WEN;
  reg                 memaccess_to_writeback_RD_WEN;
  reg        [4:0]    decode_to_execute_RD_ADDR;
  reg        [4:0]    execute_to_memaccess_RD_ADDR;
  reg        [4:0]    memaccess_to_writeback_RD_ADDR;
  reg                 decode_to_execute_IS_LOAD;
  reg                 execute_to_memaccess_IS_LOAD;
  reg                 memaccess_to_writeback_IS_LOAD;
  reg                 decode_to_execute_IS_STORE;
  reg                 execute_to_memaccess_IS_STORE;
  reg        [3:0]    decode_to_execute_CSR_CTRL;
  reg        [11:0]   decode_to_execute_CSR_ADDR;
  reg                 decode_to_execute_CSR_WEN;
  reg        [63:0]   decode_to_execute_CSR_RDATA;
  reg        [63:0]   execute_to_memaccess_ALU_RESULT;
  reg        [63:0]   memaccess_to_writeback_ALU_RESULT;
  reg        [63:0]   execute_to_memaccess_MEM_WDATA;
  reg        [63:0]   memaccess_to_writeback_LSU_RDATA;
  function [55:0] zz_tmp_memaccess_LSUPlugin_dcache_lbu(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[55] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[54] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[53] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[52] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[51] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[50] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[49] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[48] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[47] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[46] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[45] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[44] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[43] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[42] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[41] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[40] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[39] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[38] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[37] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[36] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[35] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[34] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[33] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[32] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lbu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [55:0] tmp_1;
  function [47:0] zz_tmp_memaccess_LSUPlugin_dcache_lhu(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[47] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[46] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[45] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[44] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[43] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[42] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[41] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[40] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[39] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[38] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[37] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[36] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[35] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[34] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[33] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[32] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lhu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [47:0] tmp_2;
  function [31:0] zz_tmp_memaccess_LSUPlugin_dcache_lwu(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[31] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[30] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[29] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[28] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[27] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[26] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[25] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[24] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[23] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[22] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[21] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[20] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[19] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[18] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[17] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[16] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[15] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[14] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[13] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[12] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[11] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[10] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[9] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[8] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[7] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[6] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[5] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[4] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[3] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[2] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[1] = 1'b0; // @ Literal.scala l87
      zz_tmp_memaccess_LSUPlugin_dcache_lwu[0] = 1'b0; // @ Literal.scala l87
    end
  endfunction
  wire [31:0] tmp_3;
  function [7:0] zz_tmp_memaccess_LSUPlugin_dcache_wstrb(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb = 8'h0; // @ BitVector.scala l492
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb[0] = 1'b1; // @ Literal.scala l83
    end
  endfunction
  wire [7:0] tmp_4;
  function [7:0] zz_tmp_memaccess_LSUPlugin_dcache_wstrb_1(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb_1 = 8'h0; // @ BitVector.scala l492
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb_1[1 : 0] = 2'b11; // @ Literal.scala l88
    end
  endfunction
  wire [7:0] tmp_5;
  function [7:0] zz_tmp_memaccess_LSUPlugin_dcache_wstrb_2(input dummy);
    begin
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb_2 = 8'h0; // @ BitVector.scala l492
      zz_tmp_memaccess_LSUPlugin_dcache_wstrb_2[3 : 0] = 4'b1111; // @ Literal.scala l88
    end
  endfunction
  wire [7:0] tmp_6;

  assign tmp_when_1 = (execute_RD_ADDR == execute_RS1_ADDR);
  assign tmp_when = ((! execute_PREDICT_TAKEN) || (execute_PC_NEXT != execute_ALUPlugin_pc_next));
  assign tmp_tmp_decode_DecodePlugin_imm_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign tmp_tmp_decode_DecodePlugin_imm_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign tmp_tmp_decode_DecodePlugin_imm_6 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign tmp_tmp_decode_DecodePlugin_imm_8 = {decode_INSTRUCTION[31 : 12],12'h0};
  assign tmp_execute_ALUPlugin_add_result = execute_ALUPlugin_src1;
  assign tmp_execute_ALUPlugin_add_result_1 = execute_ALUPlugin_src2;
  assign tmp_execute_ALUPlugin_sub_result = execute_ALUPlugin_src1;
  assign tmp_execute_ALUPlugin_sub_result_1 = execute_ALUPlugin_src2;
  assign tmp_execute_ALUPlugin_slt_result = execute_ALUPlugin_src1;
  assign tmp_execute_ALUPlugin_slt_result_1 = execute_ALUPlugin_src2;
  assign tmp_execute_ALUPlugin_sra_result = execute_ALUPlugin_src1;
  assign tmp_execute_ALUPlugin_addw_result_2 = execute_ALUPlugin_add_result[31 : 0];
  assign tmp_execute_ALUPlugin_subw_result_2 = execute_ALUPlugin_sub_result[31 : 0];
  assign tmp_execute_ALUPlugin_sraw_temp = execute_ALUPlugin_src1_word;
  assign tmp_execute_ALUPlugin_blt_result = execute_ALUPlugin_branch_src1;
  assign tmp_execute_ALUPlugin_blt_result_1 = execute_ALUPlugin_branch_src2;
  assign tmp_execute_ALUPlugin_bge_result = execute_ALUPlugin_branch_src2;
  assign tmp_execute_ALUPlugin_bge_result_1 = execute_ALUPlugin_branch_src1;
  assign tmp_execute_ALUPlugin_pc_next = (tmp_execute_ALUPlugin_pc_next_1 & tmp_execute_ALUPlugin_pc_next_4);
  assign tmp_execute_ALUPlugin_pc_next_1 = ($signed(tmp_execute_ALUPlugin_pc_next_2) + $signed(tmp_execute_ALUPlugin_pc_next_3));
  assign tmp_execute_ALUPlugin_pc_next_2 = execute_ALUPlugin_branch_src1;
  assign tmp_execute_ALUPlugin_pc_next_3 = execute_IMM;
  assign tmp_execute_ALUPlugin_pc_next_4 = (~ tmp_execute_ALUPlugin_pc_next_5);
  assign tmp_execute_ALUPlugin_pc_next_5 = 64'h0000000000000001;
  assign tmp_execute_ALUPlugin_pc_next_6 = ($signed(tmp_execute_ALUPlugin_pc_next_7) + $signed(tmp_execute_ALUPlugin_pc_next_8));
  assign tmp_execute_ALUPlugin_pc_next_7 = execute_PC;
  assign tmp_execute_ALUPlugin_pc_next_8 = execute_IMM;
  assign tmp_memaccess_LSUPlugin_dcache_rdata = ({3'd0,memaccess_LSUPlugin_cpu_addr_offset} <<< 3);
  assign tmp_memaccess_LSUPlugin_lsu_wdata = ({3'd0,memaccess_LSUPlugin_cpu_addr_offset} <<< 3);
  FIFO fetch_FetchPlugin_pc_stream_fifo (
    .ports_s_ports_valid   (fetch_FetchPlugin_pc_in_stream_valid                        ), //i
    .ports_s_ports_ready   (fetch_FetchPlugin_pc_stream_fifo_ports_s_ports_ready        ), //o
    .ports_s_ports_payload (fetch_FetchPlugin_pc_in_stream_payload[63:0]                ), //i
    .ports_m_ports_valid   (fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_valid        ), //o
    .ports_m_ports_ready   (fetch_FetchPlugin_pc_out_stream_ready                       ), //i
    .ports_m_ports_payload (fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload[63:0]), //o
    .flush                 (fetch_FetchPlugin_fetch_flush                               ), //i
    .next_payload          (fetch_FetchPlugin_pc_stream_fifo_next_payload[63:0]         ), //o
    .next_valid            (fetch_FetchPlugin_pc_stream_fifo_next_valid                 ), //o
    .clk                   (clk                                                         ), //i
    .reset                 (reset                                                       )  //i
  );
  FIFO_1 fetch_FetchPlugin_predict_taken_fifo (
    .ports_s_ports_valid   (fetch_FetchPlugin_predict_taken_in_valid                  ), //i
    .ports_s_ports_ready   (fetch_FetchPlugin_predict_taken_fifo_ports_s_ports_ready  ), //o
    .ports_s_ports_payload (fetch_FetchPlugin_predict_taken_in_payload                ), //i
    .ports_m_ports_valid   (fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_valid  ), //o
    .ports_m_ports_ready   (fetch_FetchPlugin_predict_taken_out_ready                 ), //i
    .ports_m_ports_payload (fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_payload), //o
    .flush                 (fetch_FetchPlugin_fetch_flush                             ), //i
    .clk                   (clk                                                       ), //i
    .reset                 (reset                                                     )  //i
  );
  FIFO_2 fetch_FetchPlugin_instruction_stream_fifo (
    .ports_s_ports_valid   (fetch_FetchPlugin_instruction_in_stream_valid                        ), //i
    .ports_s_ports_ready   (fetch_FetchPlugin_instruction_stream_fifo_ports_s_ports_ready        ), //o
    .ports_s_ports_payload (fetch_FetchPlugin_instruction_in_stream_payload[31:0]                ), //i
    .ports_m_ports_valid   (fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid        ), //o
    .ports_m_ports_ready   (fetch_FetchPlugin_instruction_out_stream_ready                       ), //i
    .ports_m_ports_payload (fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload[31:0]), //o
    .flush                 (fetch_FetchPlugin_fetch_flush                                        ), //i
    .clk                   (clk                                                                  ), //i
    .reset                 (reset                                                                )  //i
  );
  gshare_predictor gshare_predictor_1 (
    .predict_pc         (fetch_PREDICT_PC[63:0]                  ), //i
    .predict_valid      (fetch_PREDICT_VALID                     ), //i
    .predict_taken      (gshare_predictor_1_predict_taken        ), //o
    .predict_history    (gshare_predictor_1_predict_history[6:0] ), //o
    .predict_pc_next    (gshare_predictor_1_predict_pc_next[63:0]), //o
    .train_valid        (execute_BRANCH_OR_JUMP                  ), //i
    .train_taken        (execute_BRANCH_TAKEN                    ), //i
    .train_mispredicted (tmp_fetch_arbitration_flushIt           ), //i
    .train_history      (execute_BRANCH_HISTORY[6:0]             ), //i
    .train_pc           (tmp_execute_to_memaccess_PC[63:0]       ), //i
    .train_pc_next      (tmp_pc_next[63:0]                       ), //i
    .train_is_call      (execute_IS_CALL                         ), //i
    .train_is_ret       (execute_IS_RET                          ), //i
    .train_is_jmp       (execute_IS_JMP                          ), //i
    .clk                (clk                                     ), //i
    .reset              (reset                                   )  //i
  );
  RegFileModule regFileModule_1 (
    .read_ports_rs1_value (regFileModule_1_read_ports_rs1_value[63:0]), //o
    .read_ports_rs2_value (regFileModule_1_read_ports_rs2_value[63:0]), //o
    .read_ports_rs1_addr  (decode_DecodePlugin_rs1_addr[4:0]         ), //i
    .read_ports_rs2_addr  (decode_DecodePlugin_rs2_addr[4:0]         ), //i
    .read_ports_rs1_req   (decode_DecodePlugin_rs1_req               ), //i
    .read_ports_rs2_req   (decode_DecodePlugin_rs2_req               ), //i
    .write_ports_rd_value (tmp_execute_MEM_WDATA_2[63:0]             ), //i
    .write_ports_rd_addr  (tmp_DecodePlugin_hazard_rs1_from_wb[4:0]  ), //i
    .write_ports_rd_wen   (regFileModule_1_write_ports_rd_wen        ), //i
    .clk                  (clk                                       ), //i
    .reset                (reset                                     )  //i
  );
  CsrRegfile csrRegfile_1 (
    .cpu_ports_waddr            (execute_CSR_ADDR[11:0]                 ), //i
    .cpu_ports_wen              (execute_CSR_WEN                        ), //i
    .cpu_ports_wdata            (execute_ExcepPlugin_csr_wdata[63:0]    ), //i
    .cpu_ports_raddr            (tmp_decode_to_execute_CSR_ADDR[11:0]   ), //i
    .cpu_ports_rdata            (csrRegfile_1_cpu_ports_rdata[63:0]     ), //o
    .clint_ports_mepc_wen       (clint_1_csr_ports_mepc_wen             ), //i
    .clint_ports_mepc_wdata     (clint_1_csr_ports_mepc_wdata[63:0]     ), //i
    .clint_ports_mcause_wen     (clint_1_csr_ports_mcause_wen           ), //i
    .clint_ports_mcause_wdata   (clint_1_csr_ports_mcause_wdata[63:0]   ), //i
    .clint_ports_mstatus_wen    (clint_1_csr_ports_mstatus_wen          ), //i
    .clint_ports_mstatus_wdata  (clint_1_csr_ports_mstatus_wdata[63:0]  ), //i
    .clint_ports_mtvec          (csrRegfile_1_clint_ports_mtvec[63:0]   ), //o
    .clint_ports_mepc           (csrRegfile_1_clint_ports_mepc[63:0]    ), //o
    .clint_ports_mstatus        (csrRegfile_1_clint_ports_mstatus[63:0] ), //o
    .clint_ports_global_int_en  (csrRegfile_1_clint_ports_global_int_en ), //o
    .clint_ports_mtime_int_en   (csrRegfile_1_clint_ports_mtime_int_en  ), //o
    .clint_ports_mtime_int_pend (csrRegfile_1_clint_ports_mtime_int_pend), //o
    .timer_int                  (timer_1_timer_int                      ), //i
    .clk                        (clk                                    ), //i
    .reset                      (reset                                  )  //i
  );
  Clint clint_1 (
    .pc                       (tmp_execute_to_memaccess_PC[63:0]      ), //i
    .pc_next                  (tmp_pc_next[63:0]                      ), //i
    .pc_next_valid            (tmp_fetch_arbitration_flushIt          ), //i
    .instruction_valid        (execute_arbitration_isValid            ), //i
    .csr_ports_mepc_wen       (clint_1_csr_ports_mepc_wen             ), //o
    .csr_ports_mepc_wdata     (clint_1_csr_ports_mepc_wdata[63:0]     ), //o
    .csr_ports_mcause_wen     (clint_1_csr_ports_mcause_wen           ), //o
    .csr_ports_mcause_wdata   (clint_1_csr_ports_mcause_wdata[63:0]   ), //o
    .csr_ports_mstatus_wen    (clint_1_csr_ports_mstatus_wen          ), //o
    .csr_ports_mstatus_wdata  (clint_1_csr_ports_mstatus_wdata[63:0]  ), //o
    .csr_ports_mtvec          (csrRegfile_1_clint_ports_mtvec[63:0]   ), //i
    .csr_ports_mepc           (csrRegfile_1_clint_ports_mepc[63:0]    ), //i
    .csr_ports_mstatus        (csrRegfile_1_clint_ports_mstatus[63:0] ), //i
    .csr_ports_global_int_en  (csrRegfile_1_clint_ports_global_int_en ), //i
    .csr_ports_mtime_int_en   (csrRegfile_1_clint_ports_mtime_int_en  ), //i
    .csr_ports_mtime_int_pend (csrRegfile_1_clint_ports_mtime_int_pend), //i
    .timer_int                (timer_1_timer_int                      ), //i
    .int_en                   (clint_1_int_en                         ), //o
    .int_pc                   (clint_1_int_pc[63:0]                   ), //o
    .int_hold                 (clint_1_int_hold                       ), //o
    .ecall                    (clint_1_ecall                          ), //i
    .ebreak                   (clint_1_ebreak                         ), //i
    .mret                     (clint_1_mret                           ), //i
    .clk                      (clk                                    ), //i
    .reset                    (reset                                  )  //i
  );
  Timer timer_1 (
    .cen       (memaccess_TIMER_CEN      ), //i
    .wen       (memaccess_IS_STORE       ), //i
    .addr      (timer_1_addr[63:0]       ), //i
    .wdata     (memaccess_LSU_WDATA[63:0]), //i
    .rdata     (timer_1_rdata[63:0]      ), //o
    .timer_int (timer_1_timer_int        ), //o
    .clk       (clk                      ), //i
    .reset     (reset                    )  //i
  );
  assign writeback_RD = (writeback_IS_LOAD ? writeback_LSU_RDATA : writeback_ALU_RESULT); // @ Stage.scala l30
  assign memaccess_LSU_HOLD = DCachePlugin_dcache_access_stall; // @ Stage.scala l30
  assign memaccess_TIMER_CEN = ((memaccess_LSUPlugin_is_timer && memaccess_LSUPlugin_is_mem) && memaccess_arbitration_isFiring); // @ Stage.scala l30
  assign memaccess_LSU_WDATA = memaccess_LSUPlugin_lsu_wdata; // @ Stage.scala l30
  assign execute_INT_HOLD = clint_1_int_hold; // @ Stage.scala l30
  assign execute_REDIRECT_PC_NEXT = execute_ALUPlugin_redirect_pc_next; // @ Stage.scala l30
  assign execute_REDIRECT_VALID = execute_ALUPlugin_redirect_valid; // @ Stage.scala l30
  assign execute_IS_RET = execute_ALUPlugin_is_ret; // @ Stage.scala l30
  assign execute_IS_CALL = execute_ALUPlugin_is_call; // @ Stage.scala l30
  assign execute_IS_JMP = execute_ALUPlugin_is_jmp; // @ Stage.scala l30
  assign execute_BRANCH_HISTORY = execute_ALUPlugin_branch_history; // @ Stage.scala l30
  assign execute_BRANCH_TAKEN = execute_ALUPlugin_branch_taken; // @ Stage.scala l30
  assign execute_BRANCH_OR_JUMP = (execute_ALUPlugin_branch_or_jump && execute_arbitration_isFiring); // @ Stage.scala l30
  assign execute_BRANCH_OR_JALR = execute_ALUPlugin_branch_or_jalr; // @ Stage.scala l30
  assign execute_MEM_WDATA = (execute_RS2_FROM_WB ? tmp_execute_MEM_WDATA_2 : (execute_RS2_FROM_MEM ? tmp_execute_MEM_WDATA_1 : (execute_RS2_FROM_LOAD ? tmp_execute_MEM_WDATA : execute_RS2))); // @ Stage.scala l30
  assign execute_ALU_RESULT = execute_ALUPlugin_alu_result; // @ Stage.scala l30
  assign decode_CSR_RDATA = csrRegfile_1_cpu_ports_rdata; // @ Stage.scala l30
  assign execute_CSR_WEN = decode_to_execute_CSR_WEN; // @ Stage.scala l30
  assign decode_CSR_WEN = decode_DecodePlugin_csr_wen; // @ Stage.scala l30
  assign execute_CSR_ADDR = decode_to_execute_CSR_ADDR; // @ Stage.scala l30
  assign decode_CSR_ADDR = decode_DecodePlugin_csr_addr; // @ Stage.scala l30
  assign decode_CSR_CTRL = decode_DecodePlugin_csr_ctrl; // @ Stage.scala l30
  assign execute_IS_STORE = decode_to_execute_IS_STORE; // @ Stage.scala l30
  assign decode_IS_STORE = decode_DecodePlugin_is_store; // @ Stage.scala l30
  assign execute_IS_LOAD = decode_to_execute_IS_LOAD; // @ Stage.scala l30
  assign decode_IS_LOAD = decode_DecodePlugin_is_load; // @ Stage.scala l30
  assign writeback_RD_ADDR = memaccess_to_writeback_RD_ADDR; // @ Stage.scala l30
  assign memaccess_RD_ADDR = execute_to_memaccess_RD_ADDR; // @ Stage.scala l30
  assign decode_RD_ADDR = decode_DecodePlugin_rd_addr; // @ Stage.scala l30
  assign writeback_RD_WEN = memaccess_to_writeback_RD_WEN; // @ Stage.scala l30
  assign memaccess_RD_WEN = execute_to_memaccess_RD_WEN; // @ Stage.scala l30
  assign execute_RD_WEN = decode_to_execute_RD_WEN; // @ Stage.scala l30
  assign decode_RD_WEN = decode_DecodePlugin_rd_wen; // @ Stage.scala l30
  assign execute_MEM_CTRL = decode_to_execute_MEM_CTRL; // @ Stage.scala l30
  assign decode_MEM_CTRL = decode_DecodePlugin_mem_ctrl; // @ Stage.scala l30
  assign decode_SRC2_IS_IMM = decode_DecodePlugin_src2_is_imm; // @ Stage.scala l30
  assign decode_ALU_WORD = decode_DecodePlugin_alu_word; // @ Stage.scala l30
  assign decode_ALU_CTRL = decode_DecodePlugin_alu_ctrl; // @ Stage.scala l30
  assign execute_RS2_ADDR = decode_to_execute_RS2_ADDR; // @ Stage.scala l30
  assign decode_RS2_ADDR = decode_DecodePlugin_rs2_addr; // @ Stage.scala l30
  assign decode_RS1_ADDR = decode_DecodePlugin_rs1_addr; // @ Stage.scala l30
  assign decode_RS2 = decode_DecodePlugin_rs2; // @ Stage.scala l30
  assign decode_RS1 = decode_DecodePlugin_rs1; // @ Stage.scala l30
  assign decode_IMM = decode_DecodePlugin_imm; // @ Stage.scala l30
  assign fetch_INT_PC = clint_1_int_pc; // @ Stage.scala l30
  assign fetch_INT_EN = clint_1_int_en; // @ Stage.scala l30
  assign fetch_PREDICT_PC = pc_next; // @ Stage.scala l30
  assign decode_PREDICT_TAKEN = fetch_to_decode_PREDICT_TAKEN; // @ Stage.scala l30
  assign fetch_PREDICT_TAKEN = fetch_FetchPlugin_predict_taken_out_payload; // @ Stage.scala l30
  assign fetch_PREDICT_VALID = ICachePlugin_icache_access_cmd_fire_4; // @ Stage.scala l30
  assign memaccess_INSTRUCTION = execute_to_memaccess_INSTRUCTION; // @ Stage.scala l30
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION; // @ Stage.scala l30
  assign fetch_INSTRUCTION = fetch_FetchPlugin_instruction_out_stream_payload; // @ Stage.scala l30
  assign decode_PC_NEXT = fetch_to_decode_PC_NEXT; // @ Stage.scala l30
  assign fetch_PC_NEXT = fetch_FetchPlugin_pc_stream_fifo_next_payload; // @ Stage.scala l30
  assign memaccess_PC = execute_to_memaccess_PC; // @ Stage.scala l30
  assign fetch_PC = fetch_FetchPlugin_pc_out_stream_payload; // @ Stage.scala l30
  assign writeback_INSTRUCTION = memaccess_to_writeback_INSTRUCTION; // @ Stage.scala l30
  assign writeback_PC = memaccess_to_writeback_PC; // @ Stage.scala l30
  assign writeback_ALU_RESULT = memaccess_to_writeback_ALU_RESULT; // @ Stage.scala l30
  assign writeback_LSU_RDATA = memaccess_to_writeback_LSU_RDATA; // @ Stage.scala l30
  assign writeback_IS_LOAD = memaccess_to_writeback_IS_LOAD; // @ Stage.scala l30
  assign memaccess_MEM_CTRL = execute_to_memaccess_MEM_CTRL; // @ Stage.scala l30
  assign memaccess_MEM_WDATA = execute_to_memaccess_MEM_WDATA; // @ Stage.scala l30
  assign memaccess_IS_STORE = execute_to_memaccess_IS_STORE; // @ Stage.scala l30
  assign memaccess_IS_LOAD = execute_to_memaccess_IS_LOAD; // @ Stage.scala l30
  assign execute_CSR_CTRL = decode_to_execute_CSR_CTRL; // @ Stage.scala l30
  assign execute_SRC1 = execute_ALUPlugin_src1; // @ Stage.scala l30
  assign tmp_ecall = execute_CSR_CTRL; // @ Stage.scala l39
  assign tmp_decode_to_execute_CSR_ADDR = decode_CSR_ADDR; // @ Stage.scala l39
  assign tmp_memaccess_arbitration_haltItself = memaccess_LSU_HOLD; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_ctrl_rs1_from_mem = execute_BRANCH_OR_JALR; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs2_from_mem = execute_RS2_ADDR; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_mem = memaccess_IS_LOAD; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_mem_1 = execute_RS1_ADDR; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_mem_2 = memaccess_RD_ADDR; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_mem_3 = memaccess_RD_WEN; // @ Stage.scala l39
  assign execute_PC_NEXT = decode_to_execute_PC_NEXT; // @ Stage.scala l30
  assign execute_PREDICT_TAKEN = decode_to_execute_PREDICT_TAKEN; // @ Stage.scala l30
  assign execute_CSR_RDATA = decode_to_execute_CSR_RDATA; // @ Stage.scala l30
  assign execute_ALU_WORD = decode_to_execute_ALU_WORD; // @ Stage.scala l30
  assign execute_CTRL_RS2_FROM_WB = DecodePlugin_hazard_ctrl_rs2_from_wb; // @ Stage.scala l30
  assign execute_CTRL_RS2_FROM_LOAD = DecodePlugin_hazard_ctrl_rs2_from_load; // @ Stage.scala l30
  assign execute_CTRL_RS2_FROM_MEM = DecodePlugin_hazard_ctrl_rs2_from_mem; // @ Stage.scala l30
  assign execute_CTRL_RS1_FROM_WB = DecodePlugin_hazard_ctrl_rs1_from_wb; // @ Stage.scala l30
  assign tmp_execute_MEM_WDATA = memaccess_LSU_RDATA; // @ Stage.scala l39
  assign execute_CTRL_RS1_FROM_LOAD = DecodePlugin_hazard_ctrl_rs1_from_load; // @ Stage.scala l30
  assign tmp_execute_MEM_WDATA_1 = memaccess_ALU_RESULT; // @ Stage.scala l39
  assign execute_CTRL_RS1_FROM_MEM = DecodePlugin_hazard_ctrl_rs1_from_mem; // @ Stage.scala l30
  assign execute_RS2 = decode_to_execute_RS2; // @ Stage.scala l30
  assign execute_RS2_FROM_WB = DecodePlugin_hazard_rs2_from_wb; // @ Stage.scala l30
  assign execute_RS2_FROM_LOAD = DecodePlugin_hazard_rs2_from_load; // @ Stage.scala l30
  assign execute_RS2_FROM_MEM = DecodePlugin_hazard_rs2_from_mem; // @ Stage.scala l30
  assign execute_IMM = decode_to_execute_IMM; // @ Stage.scala l30
  assign execute_SRC2_IS_IMM = decode_to_execute_SRC2_IS_IMM; // @ Stage.scala l30
  assign execute_RS1 = decode_to_execute_RS1; // @ Stage.scala l30
  assign execute_RS1_FROM_WB = DecodePlugin_hazard_rs1_from_wb; // @ Stage.scala l30
  assign memaccess_LSU_RDATA = memaccess_LSUPlugin_lsu_rdata; // @ Stage.scala l30
  assign execute_RS1_FROM_LOAD = DecodePlugin_hazard_rs1_from_load; // @ Stage.scala l30
  assign memaccess_ALU_RESULT = execute_to_memaccess_ALU_RESULT; // @ Stage.scala l30
  assign execute_RS1_FROM_MEM = DecodePlugin_hazard_rs1_from_mem; // @ Stage.scala l30
  assign execute_PC = decode_to_execute_PC; // @ Stage.scala l30
  assign execute_RS1_ADDR = decode_to_execute_RS1_ADDR; // @ Stage.scala l30
  assign execute_RD_ADDR = decode_to_execute_RD_ADDR; // @ Stage.scala l30
  assign execute_ALU_CTRL = decode_to_execute_ALU_CTRL; // @ Stage.scala l30
  assign tmp_execute_MEM_WDATA_2 = writeback_RD; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_wb = writeback_RD_ADDR; // @ Stage.scala l39
  assign tmp_DecodePlugin_hazard_rs1_from_wb_1 = writeback_RD_WEN; // @ Stage.scala l39
  assign decode_INSTRUCTION = fetch_to_decode_INSTRUCTION; // @ Stage.scala l30
  assign decode_PC = fetch_to_decode_PC; // @ Stage.scala l30
  assign tmp_execute_to_memaccess_PC = execute_PC; // @ Stage.scala l39
  assign fetch_BPU_PC_NEXT = gshare_predictor_1_predict_pc_next; // @ Stage.scala l30
  assign tmp_pc_next = execute_REDIRECT_PC_NEXT; // @ Stage.scala l39
  assign tmp_fetch_arbitration_flushIt = execute_REDIRECT_VALID; // @ Stage.scala l39
  assign fetch_BPU_BRANCH_TAKEN = gshare_predictor_1_predict_taken; // @ Stage.scala l30
  assign tmp_fetch_arbitration_flushIt_1 = fetch_INT_EN; // @ Stage.scala l39
  assign fetch_arbitration_haltByOther = 1'b0; // @ Stage.scala l51
  always @(*) begin
    fetch_arbitration_removeIt = 1'b0; // @ Stage.scala l52
    if(fetch_arbitration_isFlushed) begin
      fetch_arbitration_removeIt = 1'b1; // @ Pipeline.scala l138
    end
  end

  assign fetch_arbitration_flushNext = 1'b0; // @ Stage.scala l54
  assign decode_arbitration_haltByOther = 1'b0; // @ Stage.scala l51
  always @(*) begin
    decode_arbitration_removeIt = 1'b0; // @ Stage.scala l52
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1; // @ Pipeline.scala l138
    end
  end

  assign decode_arbitration_flushNext = 1'b0; // @ Stage.scala l54
  assign execute_arbitration_haltByOther = 1'b0; // @ Stage.scala l51
  always @(*) begin
    execute_arbitration_removeIt = 1'b0; // @ Stage.scala l52
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1; // @ Pipeline.scala l138
    end
  end

  assign execute_arbitration_flushNext = 1'b0; // @ Stage.scala l54
  assign memaccess_arbitration_haltByOther = 1'b0; // @ Stage.scala l51
  always @(*) begin
    memaccess_arbitration_removeIt = 1'b0; // @ Stage.scala l52
    if(memaccess_arbitration_isFlushed) begin
      memaccess_arbitration_removeIt = 1'b1; // @ Pipeline.scala l138
    end
  end

  assign memaccess_arbitration_flushNext = 1'b0; // @ Stage.scala l54
  assign writeback_arbitration_haltByOther = 1'b0; // @ Stage.scala l51
  always @(*) begin
    writeback_arbitration_removeIt = 1'b0; // @ Stage.scala l52
    if(writeback_arbitration_isFlushed) begin
      writeback_arbitration_removeIt = 1'b1; // @ Pipeline.scala l138
    end
  end

  assign writeback_arbitration_flushNext = 1'b0; // @ Stage.scala l54
  assign fetch_FetchPlugin_fetch_flush = (tmp_fetch_arbitration_flushIt_1 || fetch_arbitration_flushIt); // @ BaseType.scala l305
  assign ICachePlugin_icache_access_cmd_fire = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready); // @ BaseType.scala l305
  assign fetch_FetchPlugin_bpu_predict_taken = (fetch_BPU_BRANCH_TAKEN && ICachePlugin_icache_access_cmd_fire); // @ BaseType.scala l305
  assign fetch_FetchPlugin_fifo_all_valid = ((fetch_FetchPlugin_pc_out_stream_valid && fetch_FetchPlugin_instruction_out_stream_valid) && fetch_FetchPlugin_pc_stream_fifo_next_valid); // @ BaseType.scala l305
  assign IDLE = 2'b00; // @ Expression.scala l2353
  assign FETCH = 2'b01; // @ Expression.scala l2353
  assign HALT = 2'b11; // @ Expression.scala l2353
  always @(*) begin
    if((fetch_state == IDLE)) begin
        if((! fetch_arbitration_isStuck)) begin
          fetch_state_next = FETCH; // @ FetchPlugin.scala l65
        end else begin
          fetch_state_next = IDLE; // @ FetchPlugin.scala l68
        end
    end else if((fetch_state == FETCH)) begin
        if((ICachePlugin_icache_access_cmd_isStall || fetch_arbitration_isStuck)) begin
          fetch_state_next = HALT; // @ FetchPlugin.scala l73
        end else begin
          fetch_state_next = FETCH; // @ FetchPlugin.scala l76
        end
    end else if((fetch_state == HALT)) begin
        if((ICachePlugin_icache_access_cmd_ready && (! fetch_arbitration_isStuck))) begin
          fetch_state_next = FETCH; // @ FetchPlugin.scala l81
        end else begin
          fetch_state_next = HALT; // @ FetchPlugin.scala l84
        end
    end else begin
        fetch_state_next = IDLE; // @ FetchPlugin.scala l88
    end
  end

  assign ICachePlugin_icache_access_cmd_isStall = (ICachePlugin_icache_access_cmd_valid && (! ICachePlugin_icache_access_cmd_ready)); // @ BaseType.scala l305
  assign ICachePlugin_icache_access_cmd_fire_1 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready); // @ BaseType.scala l305
  assign ICachePlugin_icache_access_cmd_fire_2 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready); // @ BaseType.scala l305
  assign fetch_FetchPlugin_pc_in_stream_valid = ICachePlugin_icache_access_cmd_fire_2; // @ FetchPlugin.scala l132
  assign fetch_FetchPlugin_pc_in_stream_payload = pc_next; // @ FetchPlugin.scala l133
  assign fetch_FetchPlugin_pc_out_stream_ready = fetch_arbitration_isFiring; // @ FetchPlugin.scala l134
  assign fetch_FetchPlugin_pc_in_stream_ready = fetch_FetchPlugin_pc_stream_fifo_ports_s_ports_ready; // @ FetchPlugin.scala l135
  assign fetch_FetchPlugin_pc_out_stream_valid = fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_valid; // @ FetchPlugin.scala l136
  assign fetch_FetchPlugin_pc_out_stream_payload = fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload; // @ FetchPlugin.scala l136
  assign ICachePlugin_icache_access_cmd_fire_3 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready); // @ BaseType.scala l305
  assign fetch_FetchPlugin_predict_taken_in_valid = ICachePlugin_icache_access_cmd_fire_3; // @ FetchPlugin.scala l139
  assign fetch_FetchPlugin_predict_taken_in_payload = fetch_BPU_BRANCH_TAKEN; // @ FetchPlugin.scala l140
  assign fetch_FetchPlugin_predict_taken_out_ready = fetch_arbitration_isFiring; // @ FetchPlugin.scala l141
  assign fetch_FetchPlugin_predict_taken_in_ready = fetch_FetchPlugin_predict_taken_fifo_ports_s_ports_ready; // @ FetchPlugin.scala l142
  assign fetch_FetchPlugin_predict_taken_out_valid = fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_valid; // @ FetchPlugin.scala l143
  assign fetch_FetchPlugin_predict_taken_out_payload = fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_payload; // @ FetchPlugin.scala l143
  assign fetch_FetchPlugin_instruction_in_stream_valid = ((ICachePlugin_icache_access_rsp_valid && (! rsp_flush)) && (! fetch_FetchPlugin_fetch_flush)); // @ FetchPlugin.scala l146
  assign fetch_FetchPlugin_instruction_in_stream_payload = ICachePlugin_icache_access_rsp_payload_data; // @ FetchPlugin.scala l147
  assign fetch_FetchPlugin_instruction_out_stream_ready = fetch_arbitration_isFiring; // @ FetchPlugin.scala l148
  assign fetch_FetchPlugin_instruction_in_stream_ready = fetch_FetchPlugin_instruction_stream_fifo_ports_s_ports_ready; // @ FetchPlugin.scala l149
  assign fetch_FetchPlugin_instruction_out_stream_valid = fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid; // @ FetchPlugin.scala l150
  assign fetch_FetchPlugin_instruction_out_stream_payload = fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload; // @ FetchPlugin.scala l150
  assign ICachePlugin_icache_access_cmd_fire_4 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready); // @ BaseType.scala l305
  assign fetch_arbitration_isValid = ((fetch_FetchPlugin_fifo_all_valid && (! fetch_arbitration_isStuck)) && (! fetch_FetchPlugin_fetch_flush)); // @ FetchPlugin.scala l160
  assign ICachePlugin_icache_access_cmd_valid = (fetch_valid && (! fetch_FetchPlugin_fetch_flush)); // @ FetchPlugin.scala l163
  assign ICachePlugin_icache_access_cmd_payload_addr = pc_next; // @ FetchPlugin.scala l164
  assign decode_DecodePlugin_rs1_req = (! (((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h6f))); // @ BaseType.scala l299
  assign decode_DecodePlugin_rs2_req = (! ((((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h6f)) || ((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67)))); // @ BaseType.scala l299
  assign decode_DecodePlugin_rs1_addr = decode_INSTRUCTION[19 : 15]; // @ BaseType.scala l318
  assign decode_DecodePlugin_rs2_addr = decode_INSTRUCTION[24 : 20]; // @ BaseType.scala l318
  assign decode_DecodePlugin_rd_addr = decode_INSTRUCTION[11 : 7]; // @ BaseType.scala l318
  assign decode_DecodePlugin_alu_word = ((decode_INSTRUCTION[6 : 0] == 7'h3b) || (decode_INSTRUCTION[6 : 0] == 7'h1b)); // @ BaseType.scala l305
  assign decode_DecodePlugin_src2_is_imm = ((((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67)) || (decode_INSTRUCTION[6 : 0] == 7'h23)) || ((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17))); // @ BaseType.scala l305
  assign decode_DecodePlugin_csr_addr = decode_INSTRUCTION[31 : 20]; // @ BaseType.scala l318
  assign decode_DecodePlugin_csr_wen = (((decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRW) || (decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRS)) || (decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRC)); // @ BaseType.scala l305
  assign tmp_decode_DecodePlugin_imm = decode_INSTRUCTION[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_1[51] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[50] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[49] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[48] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[47] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[46] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[45] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[44] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[43] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[42] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[41] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[40] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[39] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[38] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[37] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[36] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[35] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[34] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[33] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[32] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[31] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[30] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[29] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[28] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[27] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[26] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[25] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[24] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[23] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[22] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[21] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[20] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[19] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[18] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[17] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[16] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[15] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[14] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[13] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[12] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[11] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[10] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[9] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[8] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[7] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[6] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[5] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[4] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[3] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[2] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[1] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_1[0] = tmp_decode_DecodePlugin_imm; // @ Literal.scala l87
  end

  always @(*) begin
    if(((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67))) begin
      decode_DecodePlugin_imm = {tmp_decode_DecodePlugin_imm_1,decode_INSTRUCTION[31 : 20]}; // @ DecodePlugin.scala l117
    end else begin
      if((decode_INSTRUCTION[6 : 0] == 7'h23)) begin
        decode_DecodePlugin_imm = {tmp_decode_DecodePlugin_imm_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}}; // @ DecodePlugin.scala l120
      end else begin
        if((decode_INSTRUCTION[6 : 0] == 7'h63)) begin
          decode_DecodePlugin_imm = {{tmp_decode_DecodePlugin_imm_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0}; // @ DecodePlugin.scala l123
        end else begin
          if((decode_INSTRUCTION[6 : 0] == 7'h6f)) begin
            decode_DecodePlugin_imm = {{tmp_decode_DecodePlugin_imm_7,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0}; // @ DecodePlugin.scala l126
          end else begin
            if(((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17))) begin
              decode_DecodePlugin_imm = {tmp_decode_DecodePlugin_imm_9,{decode_INSTRUCTION[31 : 12],12'h0}}; // @ DecodePlugin.scala l129
            end else begin
              decode_DecodePlugin_imm = {tmp_decode_DecodePlugin_imm_11,decode_INSTRUCTION[31 : 20]}; // @ DecodePlugin.scala l132
            end
          end
        end
      end
    end
  end

  assign tmp_decode_DecodePlugin_imm_2 = tmp_tmp_decode_DecodePlugin_imm_2[11]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_3[51] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[50] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[49] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[48] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[47] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[46] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[45] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[44] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[43] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[42] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[41] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[40] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[39] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[38] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[37] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[36] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[35] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[34] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[33] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[32] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[31] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[30] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[29] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[28] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[27] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[26] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[25] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[24] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[23] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[22] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[21] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[20] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[19] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[18] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[17] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[16] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[15] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[14] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[13] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[12] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[11] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[10] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[9] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[8] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[7] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[6] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[5] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[4] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[3] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[2] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[1] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_3[0] = tmp_decode_DecodePlugin_imm_2; // @ Literal.scala l87
  end

  assign tmp_decode_DecodePlugin_imm_4 = tmp_tmp_decode_DecodePlugin_imm_4[11]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_5[50] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[49] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[48] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[47] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[46] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[45] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[44] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[43] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[42] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[41] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[40] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[39] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[38] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[37] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[36] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[35] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[34] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[33] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[32] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[31] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[30] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[29] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[28] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[27] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[26] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[25] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[24] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[23] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[22] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[21] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[20] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[19] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[18] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[17] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[16] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[15] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[14] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[13] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[12] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[11] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[10] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[9] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[8] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[7] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[6] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[5] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[4] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[3] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[2] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[1] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_5[0] = tmp_decode_DecodePlugin_imm_4; // @ Literal.scala l87
  end

  assign tmp_decode_DecodePlugin_imm_6 = tmp_tmp_decode_DecodePlugin_imm_6[19]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_7[42] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[41] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[40] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[39] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[38] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[37] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[36] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[35] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[34] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[33] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[32] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[31] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[30] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[29] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[28] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[27] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[26] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[25] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[24] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[23] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[22] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[21] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[20] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[19] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[18] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[17] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[16] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[15] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[14] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[13] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[12] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[11] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[10] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[9] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[8] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[7] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[6] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[5] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[4] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[3] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[2] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[1] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_7[0] = tmp_decode_DecodePlugin_imm_6; // @ Literal.scala l87
  end

  assign tmp_decode_DecodePlugin_imm_8 = tmp_tmp_decode_DecodePlugin_imm_8[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_9[31] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[30] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[29] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[28] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[27] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[26] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[25] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[24] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[23] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[22] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[21] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[20] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[19] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[18] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[17] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[16] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[15] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[14] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[13] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[12] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[11] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[10] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[9] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[8] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[7] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[6] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[5] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[4] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[3] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[2] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[1] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_9[0] = tmp_decode_DecodePlugin_imm_8; // @ Literal.scala l87
  end

  assign tmp_decode_DecodePlugin_imm_10 = decode_INSTRUCTION[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_decode_DecodePlugin_imm_11[51] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[50] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[49] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[48] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[47] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[46] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[45] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[44] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[43] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[42] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[41] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[40] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[39] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[38] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[37] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[36] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[35] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[34] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[33] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[32] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[31] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[30] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[29] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[28] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[27] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[26] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[25] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[24] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[23] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[22] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[21] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[20] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[19] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[18] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[17] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[16] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[15] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[14] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[13] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[12] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[11] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[10] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[9] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[8] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[7] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[6] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[5] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[4] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[3] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[2] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[1] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
    tmp_decode_DecodePlugin_imm_11[0] = tmp_decode_DecodePlugin_imm_10; // @ Literal.scala l87
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b0000000??????????000?????0110011, 32'b0000000??????????000?????0111011, 32'b?????????????????000?????0010011, 32'b?????????????????000?????0011011, 32'b?????????????????000?????0100011, 32'b?????????????????001?????0100011, 32'b?????????????????010?????0100011, 32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_ADD; // @ DecodePlugin.scala l138
      end
      32'b0100000??????????000?????0110011, 32'b0100000??????????000?????0111011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SUB; // @ DecodePlugin.scala l141
      end
      32'b0000000??????????010?????0110011, 32'b?????????????????010?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLT; // @ DecodePlugin.scala l144
      end
      32'b0000000??????????011?????0110011, 32'b?????????????????011?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLTU; // @ DecodePlugin.scala l147
      end
      32'b0000000??????????100?????0110011, 32'b?????????????????100?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_XOR_1; // @ DecodePlugin.scala l150
      end
      32'b0000000??????????001?????0110011, 32'b000000???????????001?????0010011, 32'b0000000??????????001?????0111011, 32'b000000???????????001?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLL_1; // @ DecodePlugin.scala l153
      end
      32'b0000000??????????101?????0110011, 32'b000000???????????101?????0010011, 32'b0000000??????????101?????0111011, 32'b000000???????????101?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SRL_1; // @ DecodePlugin.scala l156
      end
      32'b0100000??????????101?????0110011, 32'b010000???????????101?????0010011, 32'b0100000??????????101?????0111011, 32'b010000???????????101?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SRA_1; // @ DecodePlugin.scala l159
      end
      32'b0000000??????????111?????0110011, 32'b?????????????????111?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_AND_1; // @ DecodePlugin.scala l162
      end
      32'b0000000??????????110?????0110011, 32'b?????????????????110?????0010011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_OR_1; // @ DecodePlugin.scala l165
      end
      32'b?????????????????????????0110111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_LUI; // @ DecodePlugin.scala l168
      end
      32'b?????????????????????????0010111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_AUIPC; // @ DecodePlugin.scala l171
      end
      32'b??????????0??????????????1101111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_JAL; // @ DecodePlugin.scala l174
      end
      32'b?????????????????000?????1100111 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_JALR; // @ DecodePlugin.scala l177
      end
      32'b?????????????????000???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BEQ; // @ DecodePlugin.scala l180
      end
      32'b?????????????????001???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BNE; // @ DecodePlugin.scala l183
      end
      32'b?????????????????100???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BLT; // @ DecodePlugin.scala l186
      end
      32'b?????????????????101???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BGE; // @ DecodePlugin.scala l189
      end
      32'b?????????????????110???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BLTU; // @ DecodePlugin.scala l192
      end
      32'b?????????????????111???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BGEU; // @ DecodePlugin.scala l195
      end
      32'b?????????????????001?????1110011, 32'b?????????????????010?????1110011, 32'b?????????????????011?????1110011, 32'b?????????????????101?????1110011, 32'b?????????????????110?????1110011, 32'b?????????????????111?????1110011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_CSR; // @ DecodePlugin.scala l198
      end
      default : begin
        decode_DecodePlugin_alu_ctrl = 5'h0; // @ DecodePlugin.scala l201
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LB; // @ DecodePlugin.scala l208
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LBU; // @ DecodePlugin.scala l213
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LH; // @ DecodePlugin.scala l218
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LHU; // @ DecodePlugin.scala l223
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LW; // @ DecodePlugin.scala l228
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LWU; // @ DecodePlugin.scala l233
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_LD; // @ DecodePlugin.scala l238
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SB; // @ DecodePlugin.scala l243
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SH; // @ DecodePlugin.scala l248
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SW; // @ DecodePlugin.scala l253
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_mem_ctrl = MemCtrlEnum_SD; // @ DecodePlugin.scala l258
      end
      default : begin
        decode_DecodePlugin_mem_ctrl = 4'b0000; // @ DecodePlugin.scala l263
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l209
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l214
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l219
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l224
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l229
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l234
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1; // @ DecodePlugin.scala l239
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0; // @ DecodePlugin.scala l244
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0; // @ DecodePlugin.scala l249
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0; // @ DecodePlugin.scala l254
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0; // @ DecodePlugin.scala l259
      end
      default : begin
        decode_DecodePlugin_is_load = 1'b0; // @ DecodePlugin.scala l264
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l210
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l215
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l220
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l225
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l230
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l235
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l240
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1; // @ DecodePlugin.scala l245
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1; // @ DecodePlugin.scala l250
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1; // @ DecodePlugin.scala l255
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1; // @ DecodePlugin.scala l260
      end
      default : begin
        decode_DecodePlugin_is_store = 1'b0; // @ DecodePlugin.scala l265
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b00000000000000000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_ECALL; // @ DecodePlugin.scala l272
      end
      32'b00000000000100000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_EBREAK; // @ DecodePlugin.scala l275
      end
      32'b00110000001000000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_MRET; // @ DecodePlugin.scala l278
      end
      32'b?????????????????001?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRW; // @ DecodePlugin.scala l281
      end
      32'b?????????????????010?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRS; // @ DecodePlugin.scala l284
      end
      32'b?????????????????011?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRC; // @ DecodePlugin.scala l287
      end
      32'b?????????????????101?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRWI; // @ DecodePlugin.scala l290
      end
      32'b?????????????????110?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRSI; // @ DecodePlugin.scala l293
      end
      32'b?????????????????111?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRCI; // @ DecodePlugin.scala l296
      end
      default : begin
        decode_DecodePlugin_csr_ctrl = 4'b0000; // @ DecodePlugin.scala l299
      end
    endcase
  end

  assign decode_DecodePlugin_rs1 = regFileModule_1_read_ports_rs1_value; // @ DecodePlugin.scala l308
  assign decode_DecodePlugin_rs2 = regFileModule_1_read_ports_rs2_value; // @ DecodePlugin.scala l309
  assign decode_DecodePlugin_rd_wen = ((((((! (decode_INSTRUCTION[6 : 0] == 7'h23)) && (! (decode_INSTRUCTION[6 : 0] == 7'h63))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h30200073))) && (decode_INSTRUCTION[6 : 0] != 7'h0f)); // @ DecodePlugin.scala l310
  assign DecodePlugin_hazard_decode_rs1_req = decode_DecodePlugin_rs1_req; // @ DecodePlugin.scala l337
  assign DecodePlugin_hazard_decode_rs2_req = decode_DecodePlugin_rs2_req; // @ DecodePlugin.scala l338
  assign DecodePlugin_hazard_decode_rs1_addr = decode_DecodePlugin_rs1_addr; // @ DecodePlugin.scala l339
  assign DecodePlugin_hazard_decode_rs2_addr = decode_DecodePlugin_rs2_addr; // @ DecodePlugin.scala l340
  assign regFileModule_1_write_ports_rd_wen = (writeback_arbitration_isFiring && tmp_DecodePlugin_hazard_rs1_from_wb_1); // @ DecodePlugin.scala l346
  assign execute_ALUPlugin_src1_word = execute_ALUPlugin_src1[31 : 0]; // @ BaseType.scala l299
  assign execute_ALUPlugin_src2_word = execute_ALUPlugin_src2[31 : 0]; // @ BaseType.scala l299
  assign execute_ALUPlugin_shift_bits = execute_ALUPlugin_src2[5 : 0]; // @ BaseType.scala l318
  assign execute_ALUPlugin_add_result = ($signed(tmp_execute_ALUPlugin_add_result) + $signed(tmp_execute_ALUPlugin_add_result_1)); // @ BaseType.scala l299
  assign execute_ALUPlugin_sub_result = ($signed(tmp_execute_ALUPlugin_sub_result) - $signed(tmp_execute_ALUPlugin_sub_result_1)); // @ BaseType.scala l299
  assign execute_ALUPlugin_slt_result = ($signed(tmp_execute_ALUPlugin_slt_result) < $signed(tmp_execute_ALUPlugin_slt_result_1)); // @ BaseType.scala l305
  assign execute_ALUPlugin_sltu_result = (execute_ALUPlugin_src1 < execute_ALUPlugin_src2); // @ BaseType.scala l305
  assign execute_ALUPlugin_xor_result = (execute_ALUPlugin_src1 ^ execute_ALUPlugin_src2); // @ BaseType.scala l299
  assign execute_ALUPlugin_sll_result = (execute_ALUPlugin_src1 <<< execute_ALUPlugin_shift_bits); // @ BaseType.scala l299
  assign execute_ALUPlugin_srl_result = (execute_ALUPlugin_src1 >>> execute_ALUPlugin_shift_bits); // @ BaseType.scala l299
  assign execute_ALUPlugin_sra_result = ($signed(tmp_execute_ALUPlugin_sra_result) >>> execute_ALUPlugin_shift_bits); // @ BaseType.scala l299
  assign execute_ALUPlugin_and_result = (execute_ALUPlugin_src1 & execute_ALUPlugin_src2); // @ BaseType.scala l299
  assign execute_ALUPlugin_or_result = (execute_ALUPlugin_src1 | execute_ALUPlugin_src2); // @ BaseType.scala l299
  assign tmp_execute_ALUPlugin_addw_result = execute_ALUPlugin_add_result[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_execute_ALUPlugin_addw_result_1[31] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[30] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[29] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[28] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[27] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[26] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[25] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[24] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[23] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[22] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[21] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[20] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[19] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[18] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[17] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[16] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[15] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[14] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[13] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[12] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[11] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[10] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[9] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[8] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[7] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[6] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[5] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[4] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[3] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[2] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[1] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_addw_result_1[0] = tmp_execute_ALUPlugin_addw_result; // @ Literal.scala l87
  end

  assign execute_ALUPlugin_addw_result = {tmp_execute_ALUPlugin_addw_result_1,tmp_execute_ALUPlugin_addw_result_2}; // @ BaseType.scala l299
  assign tmp_execute_ALUPlugin_subw_result = execute_ALUPlugin_sub_result[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_execute_ALUPlugin_subw_result_1[31] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[30] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[29] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[28] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[27] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[26] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[25] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[24] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[23] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[22] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[21] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[20] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[19] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[18] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[17] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[16] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[15] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[14] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[13] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[12] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[11] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[10] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[9] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[8] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[7] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[6] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[5] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[4] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[3] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[2] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[1] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_subw_result_1[0] = tmp_execute_ALUPlugin_subw_result; // @ Literal.scala l87
  end

  assign execute_ALUPlugin_subw_result = {tmp_execute_ALUPlugin_subw_result_1,tmp_execute_ALUPlugin_subw_result_2}; // @ BaseType.scala l299
  assign execute_ALUPlugin_sllw_temp = (execute_ALUPlugin_src1_word <<< execute_ALUPlugin_shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_execute_ALUPlugin_sllw_result = execute_ALUPlugin_sllw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_execute_ALUPlugin_sllw_result_1[31] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[30] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[29] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[28] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[27] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[26] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[25] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[24] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[23] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[22] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[21] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[20] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[19] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[18] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[17] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[16] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[15] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[14] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[13] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[12] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[11] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[10] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[9] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[8] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[7] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[6] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[5] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[4] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[3] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[2] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[1] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sllw_result_1[0] = tmp_execute_ALUPlugin_sllw_result; // @ Literal.scala l87
  end

  assign execute_ALUPlugin_sllw_result = {tmp_execute_ALUPlugin_sllw_result_1,execute_ALUPlugin_sllw_temp}; // @ BaseType.scala l299
  assign execute_ALUPlugin_srlw_temp = (execute_ALUPlugin_src1_word >>> execute_ALUPlugin_shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_execute_ALUPlugin_srlw_result = execute_ALUPlugin_srlw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_execute_ALUPlugin_srlw_result_1[31] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[30] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[29] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[28] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[27] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[26] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[25] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[24] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[23] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[22] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[21] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[20] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[19] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[18] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[17] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[16] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[15] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[14] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[13] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[12] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[11] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[10] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[9] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[8] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[7] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[6] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[5] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[4] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[3] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[2] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[1] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_srlw_result_1[0] = tmp_execute_ALUPlugin_srlw_result; // @ Literal.scala l87
  end

  assign execute_ALUPlugin_srlw_result = {tmp_execute_ALUPlugin_srlw_result_1,execute_ALUPlugin_srlw_temp}; // @ BaseType.scala l299
  assign execute_ALUPlugin_sraw_temp = ($signed(tmp_execute_ALUPlugin_sraw_temp) >>> execute_ALUPlugin_shift_bits[4 : 0]); // @ BaseType.scala l299
  assign tmp_execute_ALUPlugin_sraw_result = execute_ALUPlugin_sraw_temp[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_execute_ALUPlugin_sraw_result_1[31] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[30] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[29] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[28] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[27] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[26] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[25] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[24] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[23] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[22] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[21] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[20] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[19] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[18] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[17] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[16] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[15] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[14] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[13] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[12] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[11] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[10] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[9] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[8] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[7] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[6] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[5] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[4] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[3] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[2] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[1] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
    tmp_execute_ALUPlugin_sraw_result_1[0] = tmp_execute_ALUPlugin_sraw_result; // @ Literal.scala l87
  end

  assign execute_ALUPlugin_sraw_result = {tmp_execute_ALUPlugin_sraw_result_1,execute_ALUPlugin_sraw_temp}; // @ BaseType.scala l299
  assign execute_ALUPlugin_jal = (execute_ALU_CTRL == AluCtrlEnum_JAL); // @ BaseType.scala l305
  assign execute_ALUPlugin_jalr = (execute_ALU_CTRL == AluCtrlEnum_JALR); // @ BaseType.scala l305
  assign execute_ALUPlugin_beq = (execute_ALU_CTRL == AluCtrlEnum_BEQ); // @ BaseType.scala l305
  assign execute_ALUPlugin_bne = (execute_ALU_CTRL == AluCtrlEnum_BNE); // @ BaseType.scala l305
  assign execute_ALUPlugin_blt = (execute_ALU_CTRL == AluCtrlEnum_BLT); // @ BaseType.scala l305
  assign execute_ALUPlugin_bge = (execute_ALU_CTRL == AluCtrlEnum_BGE); // @ BaseType.scala l305
  assign execute_ALUPlugin_bltu = (execute_ALU_CTRL == AluCtrlEnum_BLTU); // @ BaseType.scala l305
  assign execute_ALUPlugin_bgeu = (execute_ALU_CTRL == AluCtrlEnum_BGEU); // @ BaseType.scala l305
  assign execute_ALUPlugin_branch_or_jalr = ((((((execute_ALUPlugin_jalr || execute_ALUPlugin_beq) || execute_ALUPlugin_bne) || execute_ALUPlugin_blt) || execute_ALUPlugin_bge) || execute_ALUPlugin_bltu) || execute_ALUPlugin_bgeu); // @ BaseType.scala l305
  assign execute_ALUPlugin_branch_or_jump = (execute_ALUPlugin_branch_or_jalr || execute_ALUPlugin_jal); // @ BaseType.scala l305
  assign execute_ALUPlugin_rd_is_link = ((execute_RD_ADDR == 5'h0) || (execute_RD_ADDR == 5'h05)); // @ BaseType.scala l305
  assign execute_ALUPlugin_rs1_is_link = ((execute_RS1_ADDR == 5'h0) || (execute_RS1_ADDR == 5'h05)); // @ BaseType.scala l305
  always @(*) begin
    execute_ALUPlugin_is_call = 1'b0; // @ AluPlugin.scala l69
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_call = 1'b1; // @ AluPlugin.scala l249
      end else begin
        execute_ALUPlugin_is_call = 1'b0; // @ AluPlugin.scala l253
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(execute_ALUPlugin_rd_is_link) begin
          if(execute_ALUPlugin_rs1_is_link) begin
            if(tmp_when_1) begin
              execute_ALUPlugin_is_call = 1'b1; // @ AluPlugin.scala l271
            end else begin
              execute_ALUPlugin_is_call = 1'b1; // @ AluPlugin.scala l273
            end
          end else begin
            execute_ALUPlugin_is_call = 1'b1; // @ AluPlugin.scala l277
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_is_ret = 1'b0; // @ AluPlugin.scala l70
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_ret = 1'b0; // @ AluPlugin.scala l250
      end else begin
        execute_ALUPlugin_is_ret = 1'b0; // @ AluPlugin.scala l254
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(execute_ALUPlugin_rd_is_link) begin
          if(execute_ALUPlugin_rs1_is_link) begin
            if(!tmp_when_1) begin
              execute_ALUPlugin_is_ret = 1'b1; // @ AluPlugin.scala l274
            end
          end
        end else begin
          if(execute_ALUPlugin_rs1_is_link) begin
            execute_ALUPlugin_is_ret = 1'b1; // @ AluPlugin.scala l281
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_is_jmp = 1'b0; // @ AluPlugin.scala l71
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_jmp = 1'b0; // @ AluPlugin.scala l251
      end else begin
        execute_ALUPlugin_is_jmp = 1'b1; // @ AluPlugin.scala l255
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(!execute_ALUPlugin_rd_is_link) begin
          if(!execute_ALUPlugin_rs1_is_link) begin
            execute_ALUPlugin_is_jmp = 1'b1; // @ AluPlugin.scala l283
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_redirect_pc_next = (execute_PC + 64'h0000000000000004); // @ BaseType.scala l299
    if(execute_ALUPlugin_branch_or_jump) begin
      if(execute_ALUPlugin_branch_taken) begin
        if(tmp_when) begin
          execute_ALUPlugin_redirect_pc_next = execute_ALUPlugin_pc_next; // @ AluPlugin.scala l236
        end
      end else begin
        if(execute_PREDICT_TAKEN) begin
          execute_ALUPlugin_redirect_pc_next = (execute_PC + 64'h0000000000000004); // @ AluPlugin.scala l242
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_redirect_valid = 1'b0; // @ AluPlugin.scala l74
    if(execute_ALUPlugin_branch_or_jump) begin
      if(execute_ALUPlugin_branch_taken) begin
        if(tmp_when) begin
          execute_ALUPlugin_redirect_valid = execute_arbitration_isFiring; // @ AluPlugin.scala l235
        end
      end else begin
        if(execute_PREDICT_TAKEN) begin
          execute_ALUPlugin_redirect_valid = execute_arbitration_isFiring; // @ AluPlugin.scala l241
        end
      end
    end
  end

  always @(*) begin
    if((((execute_ALU_CTRL == AluCtrlEnum_AUIPC) || execute_ALUPlugin_jal) || execute_ALUPlugin_jalr)) begin
      execute_ALUPlugin_src1 = execute_PC; // @ AluPlugin.scala l78
    end else begin
      if(execute_RS1_FROM_MEM) begin
        execute_ALUPlugin_src1 = memaccess_ALU_RESULT; // @ AluPlugin.scala l82
      end else begin
        if(execute_RS1_FROM_LOAD) begin
          execute_ALUPlugin_src1 = memaccess_LSU_RDATA; // @ AluPlugin.scala l85
        end else begin
          if(execute_RS1_FROM_WB) begin
            execute_ALUPlugin_src1 = tmp_execute_MEM_WDATA_2; // @ AluPlugin.scala l88
          end else begin
            execute_ALUPlugin_src1 = execute_RS1; // @ AluPlugin.scala l91
          end
        end
      end
    end
  end

  always @(*) begin
    if((execute_ALUPlugin_jal || execute_ALUPlugin_jalr)) begin
      execute_ALUPlugin_src2 = 64'h0000000000000004; // @ AluPlugin.scala l96
    end else begin
      if(execute_SRC2_IS_IMM) begin
        execute_ALUPlugin_src2 = execute_IMM; // @ AluPlugin.scala l99
      end else begin
        if(execute_RS2_FROM_MEM) begin
          execute_ALUPlugin_src2 = memaccess_ALU_RESULT; // @ AluPlugin.scala l103
        end else begin
          if(execute_RS2_FROM_LOAD) begin
            execute_ALUPlugin_src2 = memaccess_LSU_RDATA; // @ AluPlugin.scala l106
          end else begin
            if(execute_RS2_FROM_WB) begin
              execute_ALUPlugin_src2 = tmp_execute_MEM_WDATA_2; // @ AluPlugin.scala l109
            end else begin
              execute_ALUPlugin_src2 = execute_RS2; // @ AluPlugin.scala l112
            end
          end
        end
      end
    end
  end

  always @(*) begin
    if(execute_CTRL_RS1_FROM_MEM) begin
      execute_ALUPlugin_branch_src1 = tmp_execute_MEM_WDATA_1; // @ AluPlugin.scala l118
    end else begin
      if(execute_CTRL_RS1_FROM_LOAD) begin
        execute_ALUPlugin_branch_src1 = tmp_execute_MEM_WDATA; // @ AluPlugin.scala l121
      end else begin
        if(execute_CTRL_RS1_FROM_WB) begin
          execute_ALUPlugin_branch_src1 = tmp_execute_MEM_WDATA_2; // @ AluPlugin.scala l124
        end else begin
          execute_ALUPlugin_branch_src1 = execute_RS1; // @ AluPlugin.scala l127
        end
      end
    end
  end

  always @(*) begin
    if(execute_CTRL_RS2_FROM_MEM) begin
      execute_ALUPlugin_branch_src2 = tmp_execute_MEM_WDATA_1; // @ AluPlugin.scala l131
    end else begin
      if(execute_CTRL_RS2_FROM_LOAD) begin
        execute_ALUPlugin_branch_src2 = tmp_execute_MEM_WDATA; // @ AluPlugin.scala l134
      end else begin
        if(execute_CTRL_RS2_FROM_WB) begin
          execute_ALUPlugin_branch_src2 = tmp_execute_MEM_WDATA_2; // @ AluPlugin.scala l137
        end else begin
          execute_ALUPlugin_branch_src2 = execute_RS2; // @ AluPlugin.scala l140
        end
      end
    end
  end

  always @(*) begin
    if((execute_ALU_CTRL == AluCtrlEnum_ADD)) begin
        if((execute_ALU_WORD == 1'b1)) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_addw_result; // @ AluPlugin.scala l147
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result; // @ AluPlugin.scala l149
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SUB)) begin
        if((execute_ALU_WORD == 1'b1)) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_subw_result; // @ AluPlugin.scala l154
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sub_result; // @ AluPlugin.scala l156
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLT)) begin
        execute_ALUPlugin_alu_result = {tmp_execute_ALUPlugin_alu_result,execute_ALUPlugin_slt_result}; // @ AluPlugin.scala l160
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLTU)) begin
        execute_ALUPlugin_alu_result = {tmp_execute_ALUPlugin_alu_result_1,execute_ALUPlugin_sltu_result}; // @ AluPlugin.scala l163
    end else if((execute_ALU_CTRL == AluCtrlEnum_XOR_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_xor_result; // @ AluPlugin.scala l166
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLL_1)) begin
        if((execute_ALU_WORD == 1'b1)) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sllw_result; // @ AluPlugin.scala l170
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sll_result; // @ AluPlugin.scala l172
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SRL_1)) begin
        if((execute_ALU_WORD == 1'b1)) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_srlw_result; // @ AluPlugin.scala l177
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_srl_result; // @ AluPlugin.scala l179
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SRA_1)) begin
        if((execute_ALU_WORD == 1'b1)) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sraw_result; // @ AluPlugin.scala l184
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sra_result; // @ AluPlugin.scala l186
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_AND_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_and_result; // @ AluPlugin.scala l190
    end else if((execute_ALU_CTRL == AluCtrlEnum_OR_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_or_result; // @ AluPlugin.scala l193
    end else if((execute_ALU_CTRL == AluCtrlEnum_LUI)) begin
        execute_ALUPlugin_alu_result = execute_IMM; // @ AluPlugin.scala l196
    end else if((execute_ALU_CTRL == AluCtrlEnum_JAL) || (execute_ALU_CTRL == AluCtrlEnum_JALR) || (execute_ALU_CTRL == AluCtrlEnum_AUIPC)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result; // @ AluPlugin.scala l199
    end else if((execute_ALU_CTRL == AluCtrlEnum_CSR)) begin
        execute_ALUPlugin_alu_result = execute_CSR_RDATA; // @ AluPlugin.scala l202
    end else begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result; // @ AluPlugin.scala l205
    end
  end

  assign tmp_execute_ALUPlugin_alu_result[62 : 0] = 63'h0; // @ Literal.scala l88
  assign tmp_execute_ALUPlugin_alu_result_1[62 : 0] = 63'h0; // @ Literal.scala l88
  assign execute_ALUPlugin_beq_result = (execute_ALUPlugin_beq && (execute_ALUPlugin_branch_src1 == execute_ALUPlugin_branch_src2)); // @ BaseType.scala l305
  assign execute_ALUPlugin_bne_result = (execute_ALUPlugin_bne && (execute_ALUPlugin_branch_src1 != execute_ALUPlugin_branch_src2)); // @ BaseType.scala l305
  assign execute_ALUPlugin_blt_result = (execute_ALUPlugin_blt && ($signed(tmp_execute_ALUPlugin_blt_result) < $signed(tmp_execute_ALUPlugin_blt_result_1))); // @ BaseType.scala l305
  assign execute_ALUPlugin_bge_result = (execute_ALUPlugin_bge && ($signed(tmp_execute_ALUPlugin_bge_result) <= $signed(tmp_execute_ALUPlugin_bge_result_1))); // @ BaseType.scala l305
  assign execute_ALUPlugin_bltu_result = (execute_ALUPlugin_bltu && (execute_ALUPlugin_branch_src1 < execute_ALUPlugin_branch_src2)); // @ BaseType.scala l305
  assign execute_ALUPlugin_bgeu_result = (execute_ALUPlugin_bgeu && (execute_ALUPlugin_branch_src2 <= execute_ALUPlugin_branch_src1)); // @ BaseType.scala l305
  assign execute_ALUPlugin_branch_taken = (((((((execute_ALUPlugin_beq_result || execute_ALUPlugin_bne_result) || execute_ALUPlugin_blt_result) || execute_ALUPlugin_bge_result) || execute_ALUPlugin_bltu_result) || execute_ALUPlugin_bgeu_result) || execute_ALUPlugin_jal) || execute_ALUPlugin_jalr); // @ BaseType.scala l305
  always @(*) begin
    if((execute_ALU_CTRL == AluCtrlEnum_JALR)) begin
      execute_ALUPlugin_pc_next = tmp_execute_ALUPlugin_pc_next; // @ AluPlugin.scala l227
    end else begin
      execute_ALUPlugin_pc_next = tmp_execute_ALUPlugin_pc_next_6; // @ AluPlugin.scala l229
    end
  end

  assign DecodePlugin_hazard_rs1_from_mem = ((((memaccess_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_mem_3) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs1_from_mem_1)) && (! tmp_DecodePlugin_hazard_rs1_from_mem)); // @ ControlPlugin.scala l63
  assign DecodePlugin_hazard_rs2_from_mem = ((((memaccess_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_mem_3) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs2_from_mem)) && (! tmp_DecodePlugin_hazard_rs1_from_mem)); // @ ControlPlugin.scala l64
  assign DecodePlugin_hazard_rs1_from_load = ((((memaccess_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_mem_3) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs1_from_mem_1)) && tmp_DecodePlugin_hazard_rs1_from_mem); // @ ControlPlugin.scala l65
  assign DecodePlugin_hazard_rs2_from_load = ((((memaccess_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_mem_3) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs2_from_mem)) && tmp_DecodePlugin_hazard_rs1_from_mem); // @ ControlPlugin.scala l66
  assign DecodePlugin_hazard_rs1_from_wb = ((((writeback_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_wb_1) && (tmp_DecodePlugin_hazard_rs1_from_wb != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_wb == tmp_DecodePlugin_hazard_rs1_from_mem_1)) && (! (DecodePlugin_hazard_rs1_from_mem || DecodePlugin_hazard_rs1_from_load))); // @ ControlPlugin.scala l69
  assign DecodePlugin_hazard_rs2_from_wb = ((((writeback_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_wb_1) && (tmp_DecodePlugin_hazard_rs1_from_wb != 5'h0)) && (tmp_DecodePlugin_hazard_rs1_from_wb == tmp_DecodePlugin_hazard_rs2_from_mem)) && (! (DecodePlugin_hazard_rs2_from_mem || DecodePlugin_hazard_rs2_from_load))); // @ ControlPlugin.scala l70
  assign DecodePlugin_hazard_load_use = ((memaccess_arbitration_isValid && tmp_DecodePlugin_hazard_rs1_from_mem) && (((tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs1_from_mem_1) && (! DecodePlugin_hazard_rs1_from_wb)) || ((tmp_DecodePlugin_hazard_rs1_from_mem_2 == tmp_DecodePlugin_hazard_rs2_from_mem) && (! DecodePlugin_hazard_rs2_from_wb)))); // @ ControlPlugin.scala l71
  assign DecodePlugin_hazard_ctrl_rs1_from_mem = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs1_from_mem); // @ ControlPlugin.scala l74
  assign DecodePlugin_hazard_ctrl_rs2_from_mem = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs2_from_mem); // @ ControlPlugin.scala l75
  assign DecodePlugin_hazard_ctrl_rs1_from_load = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs1_from_load); // @ ControlPlugin.scala l76
  assign DecodePlugin_hazard_ctrl_rs2_from_load = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs2_from_load); // @ ControlPlugin.scala l77
  assign DecodePlugin_hazard_ctrl_rs1_from_wb = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs1_from_wb); // @ ControlPlugin.scala l78
  assign DecodePlugin_hazard_ctrl_rs2_from_wb = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs2_from_wb); // @ ControlPlugin.scala l79
  assign DecodePlugin_hazard_ctrl_load_use = ((execute_arbitration_isValid && tmp_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_load_use); // @ ControlPlugin.scala l80
  assign fetch_arbitration_haltItself = 1'b0; // @ ControlPlugin.scala l87
  assign fetch_arbitration_flushIt = (tmp_fetch_arbitration_flushIt || tmp_fetch_arbitration_flushIt_1); // @ ControlPlugin.scala l88
  assign decode_arbitration_haltItself = 1'b0; // @ ControlPlugin.scala l94
  assign decode_arbitration_flushIt = (tmp_fetch_arbitration_flushIt || tmp_fetch_arbitration_flushIt_1); // @ ControlPlugin.scala l95
  assign execute_arbitration_haltItself = execute_INT_HOLD; // @ ControlPlugin.scala l114
  assign execute_arbitration_flushIt = 1'b0; // @ ControlPlugin.scala l115
  assign memaccess_arbitration_haltItself = tmp_memaccess_arbitration_haltItself; // @ ControlPlugin.scala l122
  assign memaccess_arbitration_flushIt = 1'b0; // @ ControlPlugin.scala l123
  assign writeback_arbitration_haltItself = tmp_memaccess_arbitration_haltItself; // @ ControlPlugin.scala l130
  assign writeback_arbitration_flushIt = 1'b0; // @ ControlPlugin.scala l131
  assign clint_1_ecall = (execute_arbitration_isValid && (tmp_ecall == CsrCtrlEnum_ECALL)); // @ ExcepPlugin.scala l348
  assign clint_1_ebreak = (execute_arbitration_isValid && (tmp_ecall == CsrCtrlEnum_EBREAK)); // @ ExcepPlugin.scala l349
  assign clint_1_mret = (execute_arbitration_isValid && (tmp_ecall == CsrCtrlEnum_MRET)); // @ ExcepPlugin.scala l350
  assign execute_ExcepPlugin_csrrs_wdata = (execute_SRC1 | execute_CSR_RDATA); // @ BaseType.scala l299
  assign execute_ExcepPlugin_csrrc_wdata = ((~ execute_SRC1) & execute_CSR_RDATA); // @ BaseType.scala l299
  assign execute_ExcepPlugin_csrrsi_wdata = (execute_IMM | execute_CSR_RDATA); // @ BaseType.scala l299
  assign execute_ExcepPlugin_csrrci_wdata = ((~ execute_IMM) & execute_CSR_RDATA); // @ BaseType.scala l299
  always @(*) begin
    if((execute_CSR_CTRL == CsrCtrlEnum_CSRRW)) begin
        execute_ExcepPlugin_csr_wdata = execute_SRC1; // @ ExcepPlugin.scala l362
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRS)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrs_wdata; // @ ExcepPlugin.scala l365
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRC)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrc_wdata; // @ ExcepPlugin.scala l368
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRWI)) begin
        execute_ExcepPlugin_csr_wdata = execute_IMM; // @ ExcepPlugin.scala l371
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRSI)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrsi_wdata; // @ ExcepPlugin.scala l374
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRCI)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrci_wdata; // @ ExcepPlugin.scala l377
    end else begin
        execute_ExcepPlugin_csr_wdata = 64'h0; // @ ExcepPlugin.scala l380
    end
  end

  assign timer_1_addr = tmp_execute_MEM_WDATA_1; // @ ExcepPlugin.scala l399
  assign memaccess_LSUPlugin_cpu_addr = memaccess_ALU_RESULT; // @ BaseType.scala l318
  assign memaccess_LSUPlugin_cpu_addr_offset = memaccess_LSUPlugin_cpu_addr[2 : 0]; // @ BaseType.scala l299
  assign memaccess_LSUPlugin_is_mem = (memaccess_IS_LOAD || memaccess_IS_STORE); // @ BaseType.scala l305
  assign memaccess_LSUPlugin_is_timer = ((memaccess_LSUPlugin_cpu_addr == 64'h000000000200bff8) || (memaccess_LSUPlugin_cpu_addr == 64'h0000000002004000)); // @ BaseType.scala l305
  assign memaccess_LSUPlugin_dcache_rdata = (DCachePlugin_dcache_access_rsp_payload_data >>> tmp_memaccess_LSUPlugin_dcache_rdata); // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_lb = memaccess_LSUPlugin_dcache_rdata[7]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_lb_1[55] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[54] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[53] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[52] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[51] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[50] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[49] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[48] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[47] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[46] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[45] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[44] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[43] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[42] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[41] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[40] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[39] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[38] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[37] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[36] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[35] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[34] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[33] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[32] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[31] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[30] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[29] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[28] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[27] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[26] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[25] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[24] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[23] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[22] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[21] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[20] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[19] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[18] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[17] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[16] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[15] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[14] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[13] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[12] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[11] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[10] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[9] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[8] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[7] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[6] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[5] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[4] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[3] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[2] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[1] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lb_1[0] = tmp_memaccess_LSUPlugin_dcache_lb; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_lb = {tmp_memaccess_LSUPlugin_dcache_lb_1,memaccess_LSUPlugin_dcache_rdata[7 : 0]}; // @ BaseType.scala l299
  assign tmp_1 = zz_tmp_memaccess_LSUPlugin_dcache_lbu(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_lbu = tmp_1;
  assign memaccess_LSUPlugin_dcache_lbu = {tmp_memaccess_LSUPlugin_dcache_lbu,memaccess_LSUPlugin_dcache_rdata[7 : 0]}; // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_lh = memaccess_LSUPlugin_dcache_rdata[15]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_lh_1[47] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[46] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[45] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[44] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[43] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[42] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[41] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[40] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[39] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[38] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[37] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[36] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[35] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[34] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[33] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[32] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[31] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[30] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[29] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[28] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[27] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[26] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[25] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[24] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[23] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[22] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[21] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[20] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[19] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[18] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[17] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[16] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[15] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[14] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[13] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[12] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[11] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[10] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[9] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[8] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[7] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[6] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[5] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[4] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[3] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[2] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[1] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lh_1[0] = tmp_memaccess_LSUPlugin_dcache_lh; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_lh = {tmp_memaccess_LSUPlugin_dcache_lh_1,memaccess_LSUPlugin_dcache_rdata[15 : 0]}; // @ BaseType.scala l299
  assign tmp_2 = zz_tmp_memaccess_LSUPlugin_dcache_lhu(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_lhu = tmp_2;
  assign memaccess_LSUPlugin_dcache_lhu = {tmp_memaccess_LSUPlugin_dcache_lhu,memaccess_LSUPlugin_dcache_rdata[15 : 0]}; // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_lw = memaccess_LSUPlugin_dcache_rdata[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_lw_1[31] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[30] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[29] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[28] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[27] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[26] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[25] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[24] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[23] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[22] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[21] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[20] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[19] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[18] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[17] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[16] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[15] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[14] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[13] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[12] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[11] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[10] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[9] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[8] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[7] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[6] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[5] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[4] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[3] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[2] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[1] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_lw_1[0] = tmp_memaccess_LSUPlugin_dcache_lw; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_lw = {tmp_memaccess_LSUPlugin_dcache_lw_1,memaccess_LSUPlugin_dcache_rdata[31 : 0]}; // @ BaseType.scala l299
  assign tmp_3 = zz_tmp_memaccess_LSUPlugin_dcache_lwu(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_lwu = tmp_3;
  assign memaccess_LSUPlugin_dcache_lwu = {tmp_memaccess_LSUPlugin_dcache_lwu,memaccess_LSUPlugin_dcache_rdata[31 : 0]}; // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_sb = memaccess_MEM_WDATA[7]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_sb_1[55] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[54] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[53] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[52] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[51] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[50] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[49] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[48] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[47] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[46] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[45] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[44] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[43] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[42] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[41] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[40] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[39] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[38] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[37] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[36] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[35] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[34] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[33] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[32] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[31] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[30] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[29] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[28] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[27] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[26] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[25] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[24] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[23] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[22] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[21] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[20] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[19] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[18] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[17] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[16] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[15] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[14] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[13] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[12] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[11] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[10] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[9] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[8] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[7] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[6] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[5] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[4] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[3] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[2] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[1] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sb_1[0] = tmp_memaccess_LSUPlugin_dcache_sb; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_sb = {tmp_memaccess_LSUPlugin_dcache_sb_1,memaccess_MEM_WDATA[7 : 0]}; // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_sh = memaccess_MEM_WDATA[15]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_sh_1[47] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[46] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[45] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[44] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[43] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[42] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[41] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[40] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[39] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[38] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[37] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[36] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[35] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[34] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[33] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[32] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[31] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[30] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[29] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[28] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[27] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[26] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[25] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[24] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[23] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[22] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[21] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[20] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[19] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[18] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[17] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[16] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[15] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[14] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[13] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[12] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[11] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[10] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[9] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[8] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[7] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[6] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[5] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[4] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[3] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[2] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[1] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sh_1[0] = tmp_memaccess_LSUPlugin_dcache_sh; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_sh = {tmp_memaccess_LSUPlugin_dcache_sh_1,memaccess_MEM_WDATA[15 : 0]}; // @ BaseType.scala l299
  assign tmp_memaccess_LSUPlugin_dcache_sw = memaccess_MEM_WDATA[31]; // @ BaseType.scala l305
  always @(*) begin
    tmp_memaccess_LSUPlugin_dcache_sw_1[31] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[30] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[29] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[28] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[27] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[26] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[25] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[24] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[23] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[22] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[21] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[20] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[19] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[18] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[17] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[16] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[15] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[14] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[13] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[12] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[11] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[10] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[9] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[8] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[7] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[6] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[5] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[4] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[3] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[2] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[1] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
    tmp_memaccess_LSUPlugin_dcache_sw_1[0] = tmp_memaccess_LSUPlugin_dcache_sw; // @ Literal.scala l87
  end

  assign memaccess_LSUPlugin_dcache_sw = {tmp_memaccess_LSUPlugin_dcache_sw_1,memaccess_MEM_WDATA[31 : 0]}; // @ BaseType.scala l299
  assign memaccess_LSUPlugin_lsu_ready = 1'b1;
  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_LB)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lb; // @ LsuPlugin.scala l71
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LBU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lbu; // @ LsuPlugin.scala l75
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LH)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lh; // @ LsuPlugin.scala l79
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LHU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lhu; // @ LsuPlugin.scala l83
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LW)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lw; // @ LsuPlugin.scala l87
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LWU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lwu; // @ LsuPlugin.scala l91
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LD)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_rdata; // @ LsuPlugin.scala l95
    end else begin
        memaccess_LSUPlugin_dcache_data_load = 64'h0; // @ LsuPlugin.scala l99
    end
  end

  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_LB)) begin
        memaccess_LSUPlugin_lsu_size = 3'b000; // @ LsuPlugin.scala l72
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LBU)) begin
        memaccess_LSUPlugin_lsu_size = 3'b000; // @ LsuPlugin.scala l76
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LH)) begin
        memaccess_LSUPlugin_lsu_size = 3'b001; // @ LsuPlugin.scala l80
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LHU)) begin
        memaccess_LSUPlugin_lsu_size = 3'b001; // @ LsuPlugin.scala l84
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LW)) begin
        memaccess_LSUPlugin_lsu_size = 3'b010; // @ LsuPlugin.scala l88
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LWU)) begin
        memaccess_LSUPlugin_lsu_size = 3'b010; // @ LsuPlugin.scala l92
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LD)) begin
        memaccess_LSUPlugin_lsu_size = 3'b011; // @ LsuPlugin.scala l96
    end else begin
        memaccess_LSUPlugin_lsu_size = 3'b000; // @ LsuPlugin.scala l100
    end
  end

  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_SB)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sb; // @ LsuPlugin.scala l106
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SH)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sh; // @ LsuPlugin.scala l110
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SW)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sw; // @ LsuPlugin.scala l114
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SD)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_MEM_WDATA; // @ LsuPlugin.scala l118
    end else begin
        memaccess_LSUPlugin_dcache_wdata = 64'h0; // @ LsuPlugin.scala l122
    end
  end

  assign tmp_4 = zz_tmp_memaccess_LSUPlugin_dcache_wstrb(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_wstrb = tmp_4;
  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_SB)) begin
        memaccess_LSUPlugin_dcache_wstrb = tmp_memaccess_LSUPlugin_dcache_wstrb; // @ LsuPlugin.scala l107
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SH)) begin
        memaccess_LSUPlugin_dcache_wstrb = tmp_memaccess_LSUPlugin_dcache_wstrb_1; // @ LsuPlugin.scala l111
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SW)) begin
        memaccess_LSUPlugin_dcache_wstrb = tmp_memaccess_LSUPlugin_dcache_wstrb_2; // @ LsuPlugin.scala l115
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SD)) begin
        memaccess_LSUPlugin_dcache_wstrb = tmp_memaccess_LSUPlugin_dcache_wstrb_3; // @ LsuPlugin.scala l119
    end else begin
        memaccess_LSUPlugin_dcache_wstrb = 8'h0; // @ LsuPlugin.scala l123
    end
  end

  assign tmp_5 = zz_tmp_memaccess_LSUPlugin_dcache_wstrb_1(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_wstrb_1 = tmp_5;
  assign tmp_6 = zz_tmp_memaccess_LSUPlugin_dcache_wstrb_2(1'b0);
  always @(*) tmp_memaccess_LSUPlugin_dcache_wstrb_2 = tmp_6;
  assign tmp_memaccess_LSUPlugin_dcache_wstrb_3[7 : 0] = 8'hff; // @ Literal.scala l88
  assign memaccess_LSUPlugin_lsu_rdata = memaccess_LSUPlugin_dcache_data_load; // @ LsuPlugin.scala l138
  assign memaccess_LSUPlugin_lsu_wdata = (memaccess_LSUPlugin_dcache_wdata <<< tmp_memaccess_LSUPlugin_lsu_wdata); // @ LsuPlugin.scala l139
  assign memaccess_LSUPlugin_lsu_addr = memaccess_LSUPlugin_cpu_addr; // @ LsuPlugin.scala l140
  assign memaccess_LSUPlugin_lsu_wen = memaccess_IS_STORE; // @ LsuPlugin.scala l141
  assign memaccess_LSUPlugin_lsu_wstrb = (memaccess_LSUPlugin_dcache_wstrb <<< memaccess_LSUPlugin_cpu_addr_offset); // @ LsuPlugin.scala l142
  assign DCachePlugin_dcache_access_cmd_valid = (((! memaccess_LSUPlugin_is_timer) && memaccess_LSUPlugin_is_mem) && memaccess_arbitration_isValid); // @ LsuPlugin.scala l151
  assign DCachePlugin_dcache_access_cmd_payload_addr = memaccess_LSUPlugin_lsu_addr; // @ LsuPlugin.scala l152
  assign DCachePlugin_dcache_access_cmd_payload_wen = memaccess_LSUPlugin_lsu_wen; // @ LsuPlugin.scala l153
  assign DCachePlugin_dcache_access_cmd_payload_wdata = memaccess_LSUPlugin_lsu_wdata; // @ LsuPlugin.scala l154
  assign DCachePlugin_dcache_access_cmd_payload_wstrb = memaccess_LSUPlugin_lsu_wstrb; // @ LsuPlugin.scala l155
  assign DCachePlugin_dcache_access_cmd_payload_size = memaccess_LSUPlugin_lsu_size; // @ LsuPlugin.scala l156
  assign icache_cmd_valid = ICachePlugin_icache_access_cmd_valid; // @ ICachePlugin.scala l175
  assign ICachePlugin_icache_access_cmd_ready = icache_cmd_ready; // @ ICachePlugin.scala l175
  assign icache_cmd_payload_addr = ICachePlugin_icache_access_cmd_payload_addr; // @ ICachePlugin.scala l175
  assign ICachePlugin_icache_access_rsp_valid = icache_rsp_valid; // @ ICachePlugin.scala l176
  assign ICachePlugin_icache_access_rsp_payload_data = icache_rsp_payload_data; // @ ICachePlugin.scala l176
  assign dcache_cmd_valid = DCachePlugin_dcache_access_cmd_valid; // @ DCachePlugin.scala l378
  assign DCachePlugin_dcache_access_cmd_ready = dcache_cmd_ready; // @ DCachePlugin.scala l378
  assign dcache_cmd_payload_addr = DCachePlugin_dcache_access_cmd_payload_addr; // @ DCachePlugin.scala l378
  assign dcache_cmd_payload_wen = DCachePlugin_dcache_access_cmd_payload_wen; // @ DCachePlugin.scala l378
  assign dcache_cmd_payload_wdata = DCachePlugin_dcache_access_cmd_payload_wdata; // @ DCachePlugin.scala l378
  assign dcache_cmd_payload_wstrb = DCachePlugin_dcache_access_cmd_payload_wstrb; // @ DCachePlugin.scala l378
  assign dcache_cmd_payload_size = DCachePlugin_dcache_access_cmd_payload_size; // @ DCachePlugin.scala l378
  assign DCachePlugin_dcache_access_rsp_valid = dcache_rsp_valid; // @ DCachePlugin.scala l379
  assign DCachePlugin_dcache_access_rsp_payload_data = dcache_rsp_payload_data; // @ DCachePlugin.scala l379
  assign DCachePlugin_dcache_access_stall = 1'b0; // @ DCachePlugin.scala l380
  assign fetch_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,{execute_arbitration_flushNext,decode_arbitration_flushNext}}} != 4'b0000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,{decode_arbitration_flushIt,fetch_arbitration_flushIt}}}} != 5'h0)); // @ Pipeline.scala l136
  assign decode_arbitration_isFlushed = (({writeback_arbitration_flushNext,{memaccess_arbitration_flushNext,execute_arbitration_flushNext}} != 3'b000) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,{execute_arbitration_flushIt,decode_arbitration_flushIt}}} != 4'b0000)); // @ Pipeline.scala l136
  assign execute_arbitration_isFlushed = (({writeback_arbitration_flushNext,memaccess_arbitration_flushNext} != 2'b00) || ({writeback_arbitration_flushIt,{memaccess_arbitration_flushIt,execute_arbitration_flushIt}} != 3'b000)); // @ Pipeline.scala l136
  assign memaccess_arbitration_isFlushed = ((writeback_arbitration_flushNext != 1'b0) || ({writeback_arbitration_flushIt,memaccess_arbitration_flushIt} != 2'b00)); // @ Pipeline.scala l136
  assign writeback_arbitration_isFlushed = (1'b0 || (writeback_arbitration_flushIt != 1'b0)); // @ Pipeline.scala l136
  assign fetch_arbitration_isStuckByOthers = (fetch_arbitration_haltByOther || ((((1'b0 || decode_arbitration_isStuck) || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck)); // @ Pipeline.scala l145
  assign fetch_arbitration_isStuck = (fetch_arbitration_haltItself || fetch_arbitration_isStuckByOthers); // @ Pipeline.scala l146
  assign fetch_arbitration_isMoving = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt)); // @ Pipeline.scala l147
  assign fetch_arbitration_isFiring = ((fetch_arbitration_isValid && (! fetch_arbitration_isStuck)) && (! fetch_arbitration_removeIt)); // @ Pipeline.scala l148
  assign decode_arbitration_isStuckByOthers = (decode_arbitration_haltByOther || (((1'b0 || execute_arbitration_isStuck) || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck)); // @ Pipeline.scala l145
  assign decode_arbitration_isStuck = (decode_arbitration_haltItself || decode_arbitration_isStuckByOthers); // @ Pipeline.scala l146
  assign decode_arbitration_isMoving = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt)); // @ Pipeline.scala l147
  assign decode_arbitration_isFiring = ((decode_arbitration_isValid && (! decode_arbitration_isStuck)) && (! decode_arbitration_removeIt)); // @ Pipeline.scala l148
  assign execute_arbitration_isStuckByOthers = (execute_arbitration_haltByOther || ((1'b0 || memaccess_arbitration_isStuck) || writeback_arbitration_isStuck)); // @ Pipeline.scala l145
  assign execute_arbitration_isStuck = (execute_arbitration_haltItself || execute_arbitration_isStuckByOthers); // @ Pipeline.scala l146
  assign execute_arbitration_isMoving = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt)); // @ Pipeline.scala l147
  assign execute_arbitration_isFiring = ((execute_arbitration_isValid && (! execute_arbitration_isStuck)) && (! execute_arbitration_removeIt)); // @ Pipeline.scala l148
  assign memaccess_arbitration_isStuckByOthers = (memaccess_arbitration_haltByOther || (1'b0 || writeback_arbitration_isStuck)); // @ Pipeline.scala l145
  assign memaccess_arbitration_isStuck = (memaccess_arbitration_haltItself || memaccess_arbitration_isStuckByOthers); // @ Pipeline.scala l146
  assign memaccess_arbitration_isMoving = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt)); // @ Pipeline.scala l147
  assign memaccess_arbitration_isFiring = ((memaccess_arbitration_isValid && (! memaccess_arbitration_isStuck)) && (! memaccess_arbitration_removeIt)); // @ Pipeline.scala l148
  assign writeback_arbitration_isStuckByOthers = (writeback_arbitration_haltByOther || 1'b0); // @ Pipeline.scala l145
  assign writeback_arbitration_isStuck = (writeback_arbitration_haltItself || writeback_arbitration_isStuckByOthers); // @ Pipeline.scala l146
  assign writeback_arbitration_isMoving = ((! writeback_arbitration_isStuck) && (! writeback_arbitration_removeIt)); // @ Pipeline.scala l147
  assign writeback_arbitration_isFiring = ((writeback_arbitration_isValid && (! writeback_arbitration_isStuck)) && (! writeback_arbitration_removeIt)); // @ Pipeline.scala l148
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pc_next <= 64'h0000000080000000; // @ Data.scala l400
      fetch_valid <= 1'b0; // @ Data.scala l400
      rsp_flush <= 1'b0; // @ Data.scala l400
      fetch_state <= IDLE; // @ Data.scala l400
      execute_ALUPlugin_branch_history <= 7'h0; // @ Data.scala l400
      decode_arbitration_isValid <= 1'b0; // @ Data.scala l400
      execute_arbitration_isValid <= 1'b0; // @ Data.scala l400
      memaccess_arbitration_isValid <= 1'b0; // @ Data.scala l400
      writeback_arbitration_isValid <= 1'b0; // @ Data.scala l400
    end else begin
      fetch_state <= fetch_state_next; // @ Reg.scala l39
      if((! ICachePlugin_icache_access_cmd_ready)) begin
        if(tmp_fetch_arbitration_flushIt_1) begin
          rsp_flush <= 1'b1; // @ FetchPlugin.scala l95
        end else begin
          if(tmp_fetch_arbitration_flushIt) begin
            rsp_flush <= 1'b1; // @ FetchPlugin.scala l98
          end else begin
            if(fetch_FetchPlugin_bpu_predict_taken) begin
              rsp_flush <= 1'b1; // @ FetchPlugin.scala l101
            end
          end
        end
      end else begin
        if(ICachePlugin_icache_access_rsp_valid) begin
          rsp_flush <= 1'b0; // @ FetchPlugin.scala l105
        end
      end
      if((fetch_state_next == FETCH)) begin
        fetch_valid <= 1'b1; // @ FetchPlugin.scala l110
      end else begin
        fetch_valid <= 1'b0; // @ FetchPlugin.scala l113
      end
      if(tmp_fetch_arbitration_flushIt_1) begin
        pc_next <= fetch_INT_PC; // @ FetchPlugin.scala l117
      end else begin
        if(tmp_fetch_arbitration_flushIt) begin
          pc_next <= tmp_pc_next; // @ FetchPlugin.scala l120
        end else begin
          if(fetch_FetchPlugin_bpu_predict_taken) begin
            pc_next <= fetch_BPU_PC_NEXT; // @ FetchPlugin.scala l123
          end else begin
            if(ICachePlugin_icache_access_cmd_fire_1) begin
              pc_next <= (pc_next + 64'h0000000000000004); // @ FetchPlugin.scala l126
            end
          end
        end
      end
      if(execute_arbitration_isFiring) begin
        execute_ALUPlugin_branch_history <= {execute_ALUPlugin_branch_history[5 : 0],execute_ALUPlugin_branch_taken}; // @ AluPlugin.scala l221
      end
      if(((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt))) begin
        decode_arbitration_isValid <= fetch_arbitration_isValid; // @ Pipeline.scala l164
      end else begin
        if(((! decode_arbitration_isStuck) || decode_arbitration_removeIt)) begin
          decode_arbitration_isValid <= 1'b0; // @ Pipeline.scala l167
        end
      end
      if(((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt))) begin
        execute_arbitration_isValid <= decode_arbitration_isValid; // @ Pipeline.scala l164
      end else begin
        if(((! execute_arbitration_isStuck) || execute_arbitration_removeIt)) begin
          execute_arbitration_isValid <= 1'b0; // @ Pipeline.scala l167
        end
      end
      if(((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt))) begin
        memaccess_arbitration_isValid <= execute_arbitration_isValid; // @ Pipeline.scala l164
      end else begin
        if(((! memaccess_arbitration_isStuck) || memaccess_arbitration_removeIt)) begin
          memaccess_arbitration_isValid <= 1'b0; // @ Pipeline.scala l167
        end
      end
      if(((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt))) begin
        writeback_arbitration_isValid <= memaccess_arbitration_isValid; // @ Pipeline.scala l164
      end else begin
        if(((! writeback_arbitration_isStuck) || writeback_arbitration_removeIt)) begin
          writeback_arbitration_isValid <= 1'b0; // @ Pipeline.scala l167
        end
      end
    end
  end

  always @(posedge clk) begin
    if((! decode_arbitration_isStuck)) begin
      fetch_to_decode_PC <= fetch_PC; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_PC <= decode_PC; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_PC <= tmp_execute_to_memaccess_PC; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_PC <= memaccess_PC; // @ Pipeline.scala l127
    end
    if((! decode_arbitration_isStuck)) begin
      fetch_to_decode_PC_NEXT <= fetch_PC_NEXT; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_PC_NEXT <= decode_PC_NEXT; // @ Pipeline.scala l127
    end
    if((! decode_arbitration_isStuck)) begin
      fetch_to_decode_INSTRUCTION <= fetch_INSTRUCTION; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_INSTRUCTION <= execute_INSTRUCTION; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_INSTRUCTION <= memaccess_INSTRUCTION; // @ Pipeline.scala l127
    end
    if((! decode_arbitration_isStuck)) begin
      fetch_to_decode_PREDICT_TAKEN <= fetch_PREDICT_TAKEN; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_PREDICT_TAKEN <= decode_PREDICT_TAKEN; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_IMM <= decode_IMM; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RS1 <= decode_RS1; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RS2 <= decode_RS2; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RS1_ADDR <= decode_RS1_ADDR; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RS2_ADDR <= decode_RS2_ADDR; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_ALU_CTRL <= decode_ALU_CTRL; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_ALU_WORD <= decode_ALU_WORD; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_SRC2_IS_IMM <= decode_SRC2_IS_IMM; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_MEM_CTRL <= decode_MEM_CTRL; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_MEM_CTRL <= execute_MEM_CTRL; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RD_WEN <= decode_RD_WEN; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_RD_WEN <= execute_RD_WEN; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_RD_WEN <= tmp_DecodePlugin_hazard_rs1_from_mem_3; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_RD_ADDR <= decode_RD_ADDR; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_RD_ADDR <= execute_RD_ADDR; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_RD_ADDR <= tmp_DecodePlugin_hazard_rs1_from_mem_2; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_IS_LOAD <= decode_IS_LOAD; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_IS_LOAD <= execute_IS_LOAD; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_IS_LOAD <= tmp_DecodePlugin_hazard_rs1_from_mem; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_IS_STORE <= decode_IS_STORE; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_IS_STORE <= execute_IS_STORE; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_CSR_CTRL <= decode_CSR_CTRL; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_CSR_ADDR <= tmp_decode_to_execute_CSR_ADDR; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_CSR_WEN <= decode_CSR_WEN; // @ Pipeline.scala l127
    end
    if((! execute_arbitration_isStuck)) begin
      decode_to_execute_CSR_RDATA <= decode_CSR_RDATA; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_ALU_RESULT <= execute_ALU_RESULT; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_ALU_RESULT <= tmp_execute_MEM_WDATA_1; // @ Pipeline.scala l127
    end
    if((! memaccess_arbitration_isStuck)) begin
      execute_to_memaccess_MEM_WDATA <= execute_MEM_WDATA; // @ Pipeline.scala l127
    end
    if((! writeback_arbitration_isStuck)) begin
      memaccess_to_writeback_LSU_RDATA <= tmp_execute_MEM_WDATA; // @ Pipeline.scala l127
    end
  end


endmodule

module Timer (
  input               cen,
  input               wen,
  input      [63:0]   addr,
  input      [63:0]   wdata,
  output reg [63:0]   rdata,
  output              timer_int,
  input               clk,
  input               reset
);

  wire       [63:0]   tmp_mtime;
  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;

  assign tmp_mtime = (mtime + 64'h0000000000000001);
  always @(*) begin
    if((addr == 64'h000000000200bff8)) begin
      rdata = mtime; // @ ExcepPlugin.scala l291
    end else begin
      if((addr == 64'h0000000002004000)) begin
        rdata = mtimecmp; // @ ExcepPlugin.scala l293
      end else begin
        rdata = 64'h0; // @ ExcepPlugin.scala l295
      end
    end
  end

  assign timer_int = (mtimecmp <= mtime); // @ ExcepPlugin.scala l304
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mtime <= 64'h0; // @ Data.scala l400
      mtimecmp <= 64'hffffffffffffffff; // @ Data.scala l400
    end else begin
      if((wen && cen)) begin
        case(addr)
          64'h000000000200bff8 : begin
            mtime <= wdata; // @ ExcepPlugin.scala l280
          end
          64'h0000000002004000 : begin
            mtimecmp <= wdata; // @ ExcepPlugin.scala l283
          end
          default : begin
          end
        endcase
      end else begin
        mtime <= tmp_mtime; // @ ExcepPlugin.scala l287
      end
    end
  end


endmodule

module Clint (
  input      [63:0]   pc,
  input      [63:0]   pc_next,
  input               pc_next_valid,
  input               instruction_valid,
  output reg          csr_ports_mepc_wen,
  output reg [63:0]   csr_ports_mepc_wdata,
  output reg          csr_ports_mcause_wen,
  output reg [63:0]   csr_ports_mcause_wdata,
  output reg          csr_ports_mstatus_wen,
  output reg [63:0]   csr_ports_mstatus_wdata,
  input      [63:0]   csr_ports_mtvec,
  input      [63:0]   csr_ports_mepc,
  input      [63:0]   csr_ports_mstatus,
  input               csr_ports_global_int_en,
  input               csr_ports_mtime_int_en,
  input               csr_ports_mtime_int_pend,
  input               timer_int,
  output reg          int_en,
  output reg [63:0]   int_pc,
  output              int_hold,
  input               ecall,
  input               ebreak,
  input               mret,
  input               clk,
  input               reset
);
  localparam IntTypeEnum_IDLE = 2'd0;
  localparam IntTypeEnum_EXPT = 2'd1;
  localparam IntTypeEnum_TIME_1 = 2'd2;
  localparam IntTypeEnum_MRET = 2'd3;

  reg        [1:0]    int_state;
  reg        [63:0]   pc_next_d1;
  reg        [63:0]   mepc_wdata;
  reg        [63:0]   mcause_wdata;

  always @(*) begin
    if((ecall || ebreak)) begin
      int_state = IntTypeEnum_EXPT; // @ ExcepPlugin.scala l181
    end else begin
      if(((csr_ports_global_int_en && csr_ports_mtime_int_en) && timer_int)) begin
        int_state = IntTypeEnum_TIME_1; // @ ExcepPlugin.scala l183
      end else begin
        if(mret) begin
          int_state = IntTypeEnum_MRET; // @ ExcepPlugin.scala l185
        end else begin
          int_state = IntTypeEnum_IDLE; // @ ExcepPlugin.scala l187
        end
      end
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_TIME_1)) begin
      if(instruction_valid) begin
        mepc_wdata = pc_next; // @ ExcepPlugin.scala l193
      end else begin
        mepc_wdata = pc_next_d1; // @ ExcepPlugin.scala l196
      end
    end else begin
      if(instruction_valid) begin
        mepc_wdata = pc; // @ ExcepPlugin.scala l201
      end else begin
        mepc_wdata = pc_next_d1; // @ ExcepPlugin.scala l203
      end
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT)) begin
      if(ecall) begin
        mcause_wdata = 64'h000000000000000b; // @ ExcepPlugin.scala l210
      end else begin
        if(ebreak) begin
          mcause_wdata = 64'h0000000000000003; // @ ExcepPlugin.scala l212
        end else begin
          mcause_wdata = 64'h000000000000000a; // @ ExcepPlugin.scala l214
        end
      end
    end else begin
      if((int_state == IntTypeEnum_TIME_1)) begin
        mcause_wdata = 64'h8000000000000007; // @ ExcepPlugin.scala l217
      end else begin
        mcause_wdata = 64'h0; // @ ExcepPlugin.scala l219
      end
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        int_en = 1'b1; // @ ExcepPlugin.scala l225
    end else if((int_state == IntTypeEnum_MRET)) begin
        int_en = 1'b1; // @ ExcepPlugin.scala l236
    end else begin
        int_en = 1'b0; // @ ExcepPlugin.scala l247
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        int_pc = csr_ports_mtvec; // @ ExcepPlugin.scala l226
    end else if((int_state == IntTypeEnum_MRET)) begin
        int_pc = csr_ports_mepc; // @ ExcepPlugin.scala l237
    end else begin
        int_pc = 64'h0; // @ ExcepPlugin.scala l248
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mepc_wen = 1'b1; // @ ExcepPlugin.scala l227
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mepc_wen = 1'b0; // @ ExcepPlugin.scala l238
    end else begin
        csr_ports_mepc_wen = 1'b0; // @ ExcepPlugin.scala l249
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mcause_wen = 1'b1; // @ ExcepPlugin.scala l228
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mcause_wen = 1'b0; // @ ExcepPlugin.scala l239
    end else begin
        csr_ports_mcause_wen = 1'b0; // @ ExcepPlugin.scala l250
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mstatus_wen = 1'b1; // @ ExcepPlugin.scala l229
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mstatus_wen = 1'b1; // @ ExcepPlugin.scala l240
    end else begin
        csr_ports_mstatus_wen = 1'b0; // @ ExcepPlugin.scala l251
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mepc_wdata = mepc_wdata; // @ ExcepPlugin.scala l230
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mepc_wdata = 64'h0; // @ ExcepPlugin.scala l241
    end else begin
        csr_ports_mepc_wdata = 64'h0; // @ ExcepPlugin.scala l252
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mcause_wdata = mcause_wdata; // @ ExcepPlugin.scala l231
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mcause_wdata = 64'h0; // @ ExcepPlugin.scala l242
    end else begin
        csr_ports_mcause_wdata = 64'h0; // @ ExcepPlugin.scala l253
    end
  end

  always @(*) begin
    if((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1)) begin
        csr_ports_mstatus_wdata = {{{{csr_ports_mstatus[63 : 8],csr_ports_mstatus[3]},csr_ports_mstatus[6 : 4]},1'b0},csr_ports_mstatus[2 : 0]}; // @ ExcepPlugin.scala l232
    end else if((int_state == IntTypeEnum_MRET)) begin
        csr_ports_mstatus_wdata = {{{{csr_ports_mstatus[63 : 8],1'b1},csr_ports_mstatus[6 : 4]},csr_ports_mstatus[7]},csr_ports_mstatus[2 : 0]}; // @ ExcepPlugin.scala l243
    end else begin
        csr_ports_mstatus_wdata = 64'h0; // @ ExcepPlugin.scala l254
    end
  end

  assign int_hold = 1'b0; // @ ExcepPlugin.scala l260
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pc_next_d1 <= 64'h0; // @ Data.scala l400
    end else begin
      if(pc_next_valid) begin
        pc_next_d1 <= pc_next; // @ ExcepPlugin.scala l175
      end
    end
  end


endmodule

module CsrRegfile (
  input      [11:0]   cpu_ports_waddr,
  input               cpu_ports_wen,
  input      [63:0]   cpu_ports_wdata,
  input      [11:0]   cpu_ports_raddr,
  output reg [63:0]   cpu_ports_rdata,
  input               clint_ports_mepc_wen,
  input      [63:0]   clint_ports_mepc_wdata,
  input               clint_ports_mcause_wen,
  input      [63:0]   clint_ports_mcause_wdata,
  input               clint_ports_mstatus_wen,
  input      [63:0]   clint_ports_mstatus_wdata,
  output     [63:0]   clint_ports_mtvec,
  output     [63:0]   clint_ports_mepc,
  output     [63:0]   clint_ports_mstatus,
  output              clint_ports_global_int_en,
  output              clint_ports_mtime_int_en,
  output              clint_ports_mtime_int_pend,
  input               timer_int,
  input               clk,
  input               reset
);

  wire       [63:0]   tmp_mcycle;
  reg        [63:0]   mstatus;
  reg        [63:0]   mie;
  reg        [63:0]   mtvec;
  reg        [63:0]   mepc;
  reg        [63:0]   mcause;
  reg        [63:0]   mtval;
  reg        [63:0]   mip;
  reg        [63:0]   mcycle;
  reg        [63:0]   mhartid;
  reg        [63:0]   mscratch;

  assign tmp_mcycle = (mcycle + 64'h0000000000000001);
  always @(*) begin
    if((cpu_ports_wen && (cpu_ports_raddr == cpu_ports_waddr))) begin
      cpu_ports_rdata = cpu_ports_wdata; // @ ExcepPlugin.scala l107
    end else begin
      case(cpu_ports_raddr)
        12'h300 : begin
          cpu_ports_rdata = mstatus; // @ ExcepPlugin.scala l111
        end
        12'h304 : begin
          cpu_ports_rdata = mie; // @ ExcepPlugin.scala l114
        end
        12'h305 : begin
          cpu_ports_rdata = mtvec; // @ ExcepPlugin.scala l117
        end
        12'h341 : begin
          cpu_ports_rdata = mepc; // @ ExcepPlugin.scala l120
        end
        12'h342 : begin
          cpu_ports_rdata = mcause; // @ ExcepPlugin.scala l123
        end
        12'h343 : begin
          cpu_ports_rdata = mtval; // @ ExcepPlugin.scala l126
        end
        12'h344 : begin
          cpu_ports_rdata = mip; // @ ExcepPlugin.scala l129
        end
        12'hb00 : begin
          cpu_ports_rdata = mcycle; // @ ExcepPlugin.scala l132
        end
        12'hf14 : begin
          cpu_ports_rdata = mhartid; // @ ExcepPlugin.scala l135
        end
        default : begin
          cpu_ports_rdata = 64'h0; // @ ExcepPlugin.scala l138
        end
      endcase
    end
  end

  assign clint_ports_mtvec = mtvec; // @ ExcepPlugin.scala l144
  assign clint_ports_mepc = mepc; // @ ExcepPlugin.scala l145
  assign clint_ports_mstatus = mstatus; // @ ExcepPlugin.scala l146
  assign clint_ports_global_int_en = mstatus[3]; // @ ExcepPlugin.scala l147
  assign clint_ports_mtime_int_en = mie[7]; // @ ExcepPlugin.scala l148
  assign clint_ports_mtime_int_pend = mip[7]; // @ ExcepPlugin.scala l149
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mstatus <= {51'h0,13'h1880}; // @ Data.scala l400
      mie <= 64'h0; // @ Data.scala l400
      mtvec <= 64'h0; // @ Data.scala l400
      mepc <= 64'h0; // @ Data.scala l400
      mcause <= 64'h0; // @ Data.scala l400
      mtval <= 64'h0; // @ Data.scala l400
      mip <= 64'h0; // @ Data.scala l400
      mcycle <= 64'h0; // @ Data.scala l400
      mhartid <= 64'h0; // @ Data.scala l400
      mscratch <= 64'h0; // @ Data.scala l400
    end else begin
      mcycle <= tmp_mcycle; // @ ExcepPlugin.scala l61
      mip <= {{{{52'h0,1'b0},3'b000},timer_int},7'h0}; // @ ExcepPlugin.scala l62
      if(cpu_ports_wen) begin
        case(cpu_ports_waddr)
          12'h300 : begin
            mstatus <= {{{{{{{((cpu_ports_wdata[16 : 15] == 2'b11) || (cpu_ports_wdata[14 : 13] == 2'b11)),50'h0},2'b11},3'b000},cpu_ports_wdata[7]},3'b000},cpu_ports_wdata[3]},3'b000}; // @ ExcepPlugin.scala l67
          end
          12'h304 : begin
            mie <= {{{{{{52'h0,cpu_ports_wdata[11]},3'b000},cpu_ports_wdata[7]},3'b000},cpu_ports_wdata[3]},3'b000}; // @ ExcepPlugin.scala l71
          end
          12'h305 : begin
            mtvec <= cpu_ports_wdata; // @ ExcepPlugin.scala l74
          end
          12'h341 : begin
            mepc <= cpu_ports_wdata; // @ ExcepPlugin.scala l77
          end
          12'h342 : begin
            mcause <= cpu_ports_wdata; // @ ExcepPlugin.scala l80
          end
          12'h343 : begin
            mtval <= cpu_ports_wdata; // @ ExcepPlugin.scala l83
          end
          12'hf14 : begin
            mhartid <= cpu_ports_wdata; // @ ExcepPlugin.scala l86
          end
          12'h340 : begin
            mscratch <= cpu_ports_wdata; // @ ExcepPlugin.scala l89
          end
          default : begin
          end
        endcase
      end else begin
        if(clint_ports_mepc_wen) begin
          mepc <= clint_ports_mepc_wdata; // @ ExcepPlugin.scala l94
        end
        if(clint_ports_mcause_wen) begin
          mcause <= clint_ports_mcause_wdata; // @ ExcepPlugin.scala l97
        end
        if(clint_ports_mstatus_wen) begin
          mstatus <= clint_ports_mstatus_wdata; // @ ExcepPlugin.scala l100
        end
        mtvec <= {clint_ports_mtvec[63 : 2],2'b00}; // @ ExcepPlugin.scala l102
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

  reg        [63:0]   tmp_read_value_1;
  reg        [63:0]   tmp_read_value_2;
  reg        [63:0]   reg_file_0;
  reg        [63:0]   reg_file_1;
  reg        [63:0]   reg_file_2;
  reg        [63:0]   reg_file_3;
  reg        [63:0]   reg_file_4;
  reg        [63:0]   reg_file_5;
  reg        [63:0]   reg_file_6;
  reg        [63:0]   reg_file_7;
  reg        [63:0]   reg_file_8;
  reg        [63:0]   reg_file_9;
  reg        [63:0]   reg_file_10;
  reg        [63:0]   reg_file_11;
  reg        [63:0]   reg_file_12;
  reg        [63:0]   reg_file_13;
  reg        [63:0]   reg_file_14;
  reg        [63:0]   reg_file_15;
  reg        [63:0]   reg_file_16;
  reg        [63:0]   reg_file_17;
  reg        [63:0]   reg_file_18;
  reg        [63:0]   reg_file_19;
  reg        [63:0]   reg_file_20;
  reg        [63:0]   reg_file_21;
  reg        [63:0]   reg_file_22;
  reg        [63:0]   reg_file_23;
  reg        [63:0]   reg_file_24;
  reg        [63:0]   reg_file_25;
  reg        [63:0]   reg_file_26;
  reg        [63:0]   reg_file_27;
  reg        [63:0]   reg_file_28;
  reg        [63:0]   reg_file_29;
  reg        [63:0]   reg_file_30;
  reg        [63:0]   reg_file_31;
  wire       [63:0]   read_value_1;
  wire       [63:0]   read_value_2;
  wire       [31:0]   tmp_1;

  always @(*) begin
    case(read_ports_rs1_addr)
      5'b00000 : tmp_read_value_1 = reg_file_0;
      5'b00001 : tmp_read_value_1 = reg_file_1;
      5'b00010 : tmp_read_value_1 = reg_file_2;
      5'b00011 : tmp_read_value_1 = reg_file_3;
      5'b00100 : tmp_read_value_1 = reg_file_4;
      5'b00101 : tmp_read_value_1 = reg_file_5;
      5'b00110 : tmp_read_value_1 = reg_file_6;
      5'b00111 : tmp_read_value_1 = reg_file_7;
      5'b01000 : tmp_read_value_1 = reg_file_8;
      5'b01001 : tmp_read_value_1 = reg_file_9;
      5'b01010 : tmp_read_value_1 = reg_file_10;
      5'b01011 : tmp_read_value_1 = reg_file_11;
      5'b01100 : tmp_read_value_1 = reg_file_12;
      5'b01101 : tmp_read_value_1 = reg_file_13;
      5'b01110 : tmp_read_value_1 = reg_file_14;
      5'b01111 : tmp_read_value_1 = reg_file_15;
      5'b10000 : tmp_read_value_1 = reg_file_16;
      5'b10001 : tmp_read_value_1 = reg_file_17;
      5'b10010 : tmp_read_value_1 = reg_file_18;
      5'b10011 : tmp_read_value_1 = reg_file_19;
      5'b10100 : tmp_read_value_1 = reg_file_20;
      5'b10101 : tmp_read_value_1 = reg_file_21;
      5'b10110 : tmp_read_value_1 = reg_file_22;
      5'b10111 : tmp_read_value_1 = reg_file_23;
      5'b11000 : tmp_read_value_1 = reg_file_24;
      5'b11001 : tmp_read_value_1 = reg_file_25;
      5'b11010 : tmp_read_value_1 = reg_file_26;
      5'b11011 : tmp_read_value_1 = reg_file_27;
      5'b11100 : tmp_read_value_1 = reg_file_28;
      5'b11101 : tmp_read_value_1 = reg_file_29;
      5'b11110 : tmp_read_value_1 = reg_file_30;
      default : tmp_read_value_1 = reg_file_31;
    endcase
  end

  always @(*) begin
    case(read_ports_rs2_addr)
      5'b00000 : tmp_read_value_2 = reg_file_0;
      5'b00001 : tmp_read_value_2 = reg_file_1;
      5'b00010 : tmp_read_value_2 = reg_file_2;
      5'b00011 : tmp_read_value_2 = reg_file_3;
      5'b00100 : tmp_read_value_2 = reg_file_4;
      5'b00101 : tmp_read_value_2 = reg_file_5;
      5'b00110 : tmp_read_value_2 = reg_file_6;
      5'b00111 : tmp_read_value_2 = reg_file_7;
      5'b01000 : tmp_read_value_2 = reg_file_8;
      5'b01001 : tmp_read_value_2 = reg_file_9;
      5'b01010 : tmp_read_value_2 = reg_file_10;
      5'b01011 : tmp_read_value_2 = reg_file_11;
      5'b01100 : tmp_read_value_2 = reg_file_12;
      5'b01101 : tmp_read_value_2 = reg_file_13;
      5'b01110 : tmp_read_value_2 = reg_file_14;
      5'b01111 : tmp_read_value_2 = reg_file_15;
      5'b10000 : tmp_read_value_2 = reg_file_16;
      5'b10001 : tmp_read_value_2 = reg_file_17;
      5'b10010 : tmp_read_value_2 = reg_file_18;
      5'b10011 : tmp_read_value_2 = reg_file_19;
      5'b10100 : tmp_read_value_2 = reg_file_20;
      5'b10101 : tmp_read_value_2 = reg_file_21;
      5'b10110 : tmp_read_value_2 = reg_file_22;
      5'b10111 : tmp_read_value_2 = reg_file_23;
      5'b11000 : tmp_read_value_2 = reg_file_24;
      5'b11001 : tmp_read_value_2 = reg_file_25;
      5'b11010 : tmp_read_value_2 = reg_file_26;
      5'b11011 : tmp_read_value_2 = reg_file_27;
      5'b11100 : tmp_read_value_2 = reg_file_28;
      5'b11101 : tmp_read_value_2 = reg_file_29;
      5'b11110 : tmp_read_value_2 = reg_file_30;
      default : tmp_read_value_2 = reg_file_31;
    endcase
  end

  assign read_value_1 = tmp_read_value_1; // @ Vec.scala l202
  assign read_value_2 = tmp_read_value_2; // @ Vec.scala l202
  assign tmp_1 = ({31'd0,1'b1} <<< write_ports_rd_addr); // @ BaseType.scala l299
  assign read_ports_rs1_value = (((write_ports_rd_wen && ((write_ports_rd_addr == read_ports_rs1_addr) && (write_ports_rd_addr != 5'h0))) && read_ports_rs1_req) ? write_ports_rd_value : read_value_1); // @ DecodePlugin.scala l65
  assign read_ports_rs2_value = (((write_ports_rd_wen && ((write_ports_rd_addr == read_ports_rs2_addr) && (write_ports_rd_addr != 5'h0))) && read_ports_rs2_req) ? write_ports_rd_value : read_value_2); // @ DecodePlugin.scala l66
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_file_0 <= 64'h0; // @ Data.scala l400
      reg_file_1 <= 64'h0; // @ Data.scala l400
      reg_file_2 <= 64'h0; // @ Data.scala l400
      reg_file_3 <= 64'h0; // @ Data.scala l400
      reg_file_4 <= 64'h0; // @ Data.scala l400
      reg_file_5 <= 64'h0; // @ Data.scala l400
      reg_file_6 <= 64'h0; // @ Data.scala l400
      reg_file_7 <= 64'h0; // @ Data.scala l400
      reg_file_8 <= 64'h0; // @ Data.scala l400
      reg_file_9 <= 64'h0; // @ Data.scala l400
      reg_file_10 <= 64'h0; // @ Data.scala l400
      reg_file_11 <= 64'h0; // @ Data.scala l400
      reg_file_12 <= 64'h0; // @ Data.scala l400
      reg_file_13 <= 64'h0; // @ Data.scala l400
      reg_file_14 <= 64'h0; // @ Data.scala l400
      reg_file_15 <= 64'h0; // @ Data.scala l400
      reg_file_16 <= 64'h0; // @ Data.scala l400
      reg_file_17 <= 64'h0; // @ Data.scala l400
      reg_file_18 <= 64'h0; // @ Data.scala l400
      reg_file_19 <= 64'h0; // @ Data.scala l400
      reg_file_20 <= 64'h0; // @ Data.scala l400
      reg_file_21 <= 64'h0; // @ Data.scala l400
      reg_file_22 <= 64'h0; // @ Data.scala l400
      reg_file_23 <= 64'h0; // @ Data.scala l400
      reg_file_24 <= 64'h0; // @ Data.scala l400
      reg_file_25 <= 64'h0; // @ Data.scala l400
      reg_file_26 <= 64'h0; // @ Data.scala l400
      reg_file_27 <= 64'h0; // @ Data.scala l400
      reg_file_28 <= 64'h0; // @ Data.scala l400
      reg_file_29 <= 64'h0; // @ Data.scala l400
      reg_file_30 <= 64'h0; // @ Data.scala l400
      reg_file_31 <= 64'h0; // @ Data.scala l400
    end else begin
      if((write_ports_rd_wen && (write_ports_rd_addr != 5'h0))) begin
        if(tmp_1[0]) begin
          reg_file_0 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[1]) begin
          reg_file_1 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[2]) begin
          reg_file_2 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[3]) begin
          reg_file_3 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[4]) begin
          reg_file_4 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[5]) begin
          reg_file_5 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[6]) begin
          reg_file_6 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[7]) begin
          reg_file_7 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[8]) begin
          reg_file_8 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[9]) begin
          reg_file_9 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[10]) begin
          reg_file_10 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[11]) begin
          reg_file_11 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[12]) begin
          reg_file_12 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[13]) begin
          reg_file_13 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[14]) begin
          reg_file_14 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[15]) begin
          reg_file_15 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[16]) begin
          reg_file_16 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[17]) begin
          reg_file_17 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[18]) begin
          reg_file_18 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[19]) begin
          reg_file_19 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[20]) begin
          reg_file_20 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[21]) begin
          reg_file_21 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[22]) begin
          reg_file_22 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[23]) begin
          reg_file_23 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[24]) begin
          reg_file_24 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[25]) begin
          reg_file_25 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[26]) begin
          reg_file_26 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[27]) begin
          reg_file_27 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[28]) begin
          reg_file_28 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[29]) begin
          reg_file_29 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[30]) begin
          reg_file_30 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
        if(tmp_1[31]) begin
          reg_file_31 <= write_ports_rd_value; // @ DecodePlugin.scala l62
        end
      end
    end
  end


endmodule

module gshare_predictor (
  input      [63:0]   predict_pc,
  input               predict_valid,
  output              predict_taken,
  output     [6:0]    predict_history,
  output     [63:0]   predict_pc_next,
  input               train_valid,
  input               train_taken,
  input               train_mispredicted,
  input      [6:0]    train_history,
  input      [63:0]   train_pc,
  input      [63:0]   train_pc_next,
  input               train_is_call,
  input               train_is_ret,
  input               train_is_jmp,
  input               clk,
  input               reset
);

  reg        [1:0]    tmp_GSHARE_pht_predict_taken;
  reg        [1:0]    tmp_199;
  wire                tmp_when;
  wire                tmp_when_1;
  wire                tmp_when_2;
  wire                tmp_when_3;
  wire                tmp_when_4;
  wire                tmp_when_5;
  wire                tmp_when_6;
  wire                tmp_when_7;
  wire                tmp_when_8;
  wire                tmp_when_9;
  wire                tmp_when_10;
  wire                tmp_when_11;
  wire                tmp_when_12;
  wire                tmp_when_13;
  wire                tmp_when_14;
  wire                tmp_when_15;
  wire                tmp_when_16;
  wire                tmp_when_17;
  wire                tmp_when_18;
  wire                tmp_when_19;
  wire                tmp_when_20;
  wire                tmp_when_21;
  wire                tmp_when_22;
  wire                tmp_when_23;
  wire                tmp_when_24;
  wire                tmp_when_25;
  wire                tmp_when_26;
  wire                tmp_when_27;
  wire                tmp_when_28;
  wire                tmp_when_29;
  wire                tmp_when_30;
  wire                tmp_when_31;
  wire                tmp_when_32;
  wire                tmp_when_33;
  wire                tmp_when_34;
  wire                tmp_when_35;
  wire                tmp_when_36;
  wire                tmp_when_37;
  wire                tmp_when_38;
  wire                tmp_when_39;
  wire                tmp_when_40;
  wire                tmp_when_41;
  wire                tmp_when_42;
  wire                tmp_when_43;
  wire                tmp_when_44;
  wire                tmp_when_45;
  wire                tmp_when_46;
  wire                tmp_when_47;
  wire                tmp_when_48;
  wire                tmp_when_49;
  wire                tmp_when_50;
  wire                tmp_when_51;
  wire                tmp_when_52;
  wire                tmp_when_53;
  wire                tmp_when_54;
  wire                tmp_when_55;
  wire                tmp_when_56;
  wire                tmp_when_57;
  wire                tmp_when_58;
  wire                tmp_when_59;
  wire                tmp_when_60;
  wire                tmp_when_61;
  wire                tmp_when_62;
  wire                tmp_when_63;
  wire       [5:0]    tmp_BTB_btb_alloc_index_valueNext;
  wire       [0:0]    tmp_BTB_btb_alloc_index_valueNext_1;
  wire       [0:0]    tmp_BTB_btb_is_hit;
  wire       [52:0]   tmp_BTB_btb_is_hit_1;
  wire       [0:0]    tmp_BTB_btb_is_hit_2;
  wire       [41:0]   tmp_BTB_btb_is_hit_3;
  wire       [0:0]    tmp_BTB_btb_is_hit_4;
  wire       [30:0]   tmp_BTB_btb_is_hit_5;
  wire       [0:0]    tmp_BTB_btb_is_hit_6;
  wire       [19:0]   tmp_BTB_btb_is_hit_7;
  wire       [0:0]    tmp_BTB_btb_is_hit_8;
  wire       [8:0]    tmp_BTB_btb_is_hit_9;
  wire       [0:0]    tmp_BTB_btb_is_miss;
  wire       [52:0]   tmp_BTB_btb_is_miss_1;
  wire       [0:0]    tmp_BTB_btb_is_miss_2;
  wire       [41:0]   tmp_BTB_btb_is_miss_3;
  wire       [0:0]    tmp_BTB_btb_is_miss_4;
  wire       [30:0]   tmp_BTB_btb_is_miss_5;
  wire       [0:0]    tmp_BTB_btb_is_miss_6;
  wire       [19:0]   tmp_BTB_btb_is_miss_7;
  wire       [0:0]    tmp_BTB_btb_is_miss_8;
  wire       [8:0]    tmp_BTB_btb_is_miss_9;
  wire                tmp_when_64;
  wire                tmp_when_65;
  wire                tmp_when_66;
  wire                tmp_when_67;
  wire                tmp_when_68;
  wire                tmp_when_69;
  wire                tmp_when_70;
  wire                tmp_when_71;
  wire                tmp_when_72;
  wire                tmp_when_73;
  wire                tmp_when_74;
  wire                tmp_when_75;
  wire                tmp_when_76;
  wire                tmp_when_77;
  wire                tmp_when_78;
  wire                tmp_when_79;
  wire                tmp_when_80;
  wire                tmp_when_81;
  wire                tmp_when_82;
  wire                tmp_when_83;
  wire                tmp_when_84;
  wire                tmp_when_85;
  wire                tmp_when_86;
  wire                tmp_when_87;
  wire                tmp_when_88;
  wire                tmp_when_89;
  wire                tmp_when_90;
  wire                tmp_when_91;
  wire                tmp_when_92;
  wire                tmp_when_93;
  wire                tmp_when_94;
  wire                tmp_when_95;
  wire                tmp_when_96;
  wire                tmp_when_97;
  wire                tmp_when_98;
  wire                tmp_when_99;
  wire                tmp_when_100;
  wire                tmp_when_101;
  wire                tmp_when_102;
  wire                tmp_when_103;
  wire                tmp_when_104;
  wire                tmp_when_105;
  wire                tmp_when_106;
  wire                tmp_when_107;
  wire                tmp_when_108;
  wire                tmp_when_109;
  wire                tmp_when_110;
  wire                tmp_when_111;
  wire                tmp_when_112;
  wire                tmp_when_113;
  wire                tmp_when_114;
  wire                tmp_when_115;
  wire                tmp_when_116;
  wire                tmp_when_117;
  wire                tmp_when_118;
  wire                tmp_when_119;
  wire                tmp_when_120;
  wire                tmp_when_121;
  wire                tmp_when_122;
  wire                tmp_when_123;
  wire                tmp_when_124;
  wire                tmp_when_125;
  wire                tmp_when_126;
  wire                tmp_when_127;
  wire                tmp_tmp_BTB_btb_write_index;
  wire                tmp_tmp_BTB_btb_write_index_1;
  wire                tmp_tmp_BTB_btb_write_index_2;
  wire                tmp_tmp_BTB_btb_write_index_3;
  wire                tmp_tmp_BTB_btb_write_index_4;
  wire                tmp_tmp_BTB_btb_write_index_5;
  wire                tmp_when_128;
  reg        [63:0]   tmp_RAS_ras_predict_pc;
  wire       [63:0]   tmp_predict_pc_next;
  reg        [6:0]    GSHARE_global_branch_history;
  reg        [1:0]    GSHARE_PHT_0;
  reg        [1:0]    GSHARE_PHT_1;
  reg        [1:0]    GSHARE_PHT_2;
  reg        [1:0]    GSHARE_PHT_3;
  reg        [1:0]    GSHARE_PHT_4;
  reg        [1:0]    GSHARE_PHT_5;
  reg        [1:0]    GSHARE_PHT_6;
  reg        [1:0]    GSHARE_PHT_7;
  reg        [1:0]    GSHARE_PHT_8;
  reg        [1:0]    GSHARE_PHT_9;
  reg        [1:0]    GSHARE_PHT_10;
  reg        [1:0]    GSHARE_PHT_11;
  reg        [1:0]    GSHARE_PHT_12;
  reg        [1:0]    GSHARE_PHT_13;
  reg        [1:0]    GSHARE_PHT_14;
  reg        [1:0]    GSHARE_PHT_15;
  reg        [1:0]    GSHARE_PHT_16;
  reg        [1:0]    GSHARE_PHT_17;
  reg        [1:0]    GSHARE_PHT_18;
  reg        [1:0]    GSHARE_PHT_19;
  reg        [1:0]    GSHARE_PHT_20;
  reg        [1:0]    GSHARE_PHT_21;
  reg        [1:0]    GSHARE_PHT_22;
  reg        [1:0]    GSHARE_PHT_23;
  reg        [1:0]    GSHARE_PHT_24;
  reg        [1:0]    GSHARE_PHT_25;
  reg        [1:0]    GSHARE_PHT_26;
  reg        [1:0]    GSHARE_PHT_27;
  reg        [1:0]    GSHARE_PHT_28;
  reg        [1:0]    GSHARE_PHT_29;
  reg        [1:0]    GSHARE_PHT_30;
  reg        [1:0]    GSHARE_PHT_31;
  reg        [1:0]    GSHARE_PHT_32;
  reg        [1:0]    GSHARE_PHT_33;
  reg        [1:0]    GSHARE_PHT_34;
  reg        [1:0]    GSHARE_PHT_35;
  reg        [1:0]    GSHARE_PHT_36;
  reg        [1:0]    GSHARE_PHT_37;
  reg        [1:0]    GSHARE_PHT_38;
  reg        [1:0]    GSHARE_PHT_39;
  reg        [1:0]    GSHARE_PHT_40;
  reg        [1:0]    GSHARE_PHT_41;
  reg        [1:0]    GSHARE_PHT_42;
  reg        [1:0]    GSHARE_PHT_43;
  reg        [1:0]    GSHARE_PHT_44;
  reg        [1:0]    GSHARE_PHT_45;
  reg        [1:0]    GSHARE_PHT_46;
  reg        [1:0]    GSHARE_PHT_47;
  reg        [1:0]    GSHARE_PHT_48;
  reg        [1:0]    GSHARE_PHT_49;
  reg        [1:0]    GSHARE_PHT_50;
  reg        [1:0]    GSHARE_PHT_51;
  reg        [1:0]    GSHARE_PHT_52;
  reg        [1:0]    GSHARE_PHT_53;
  reg        [1:0]    GSHARE_PHT_54;
  reg        [1:0]    GSHARE_PHT_55;
  reg        [1:0]    GSHARE_PHT_56;
  reg        [1:0]    GSHARE_PHT_57;
  reg        [1:0]    GSHARE_PHT_58;
  reg        [1:0]    GSHARE_PHT_59;
  reg        [1:0]    GSHARE_PHT_60;
  reg        [1:0]    GSHARE_PHT_61;
  reg        [1:0]    GSHARE_PHT_62;
  reg        [1:0]    GSHARE_PHT_63;
  reg        [1:0]    GSHARE_PHT_64;
  reg        [1:0]    GSHARE_PHT_65;
  reg        [1:0]    GSHARE_PHT_66;
  reg        [1:0]    GSHARE_PHT_67;
  reg        [1:0]    GSHARE_PHT_68;
  reg        [1:0]    GSHARE_PHT_69;
  reg        [1:0]    GSHARE_PHT_70;
  reg        [1:0]    GSHARE_PHT_71;
  reg        [1:0]    GSHARE_PHT_72;
  reg        [1:0]    GSHARE_PHT_73;
  reg        [1:0]    GSHARE_PHT_74;
  reg        [1:0]    GSHARE_PHT_75;
  reg        [1:0]    GSHARE_PHT_76;
  reg        [1:0]    GSHARE_PHT_77;
  reg        [1:0]    GSHARE_PHT_78;
  reg        [1:0]    GSHARE_PHT_79;
  reg        [1:0]    GSHARE_PHT_80;
  reg        [1:0]    GSHARE_PHT_81;
  reg        [1:0]    GSHARE_PHT_82;
  reg        [1:0]    GSHARE_PHT_83;
  reg        [1:0]    GSHARE_PHT_84;
  reg        [1:0]    GSHARE_PHT_85;
  reg        [1:0]    GSHARE_PHT_86;
  reg        [1:0]    GSHARE_PHT_87;
  reg        [1:0]    GSHARE_PHT_88;
  reg        [1:0]    GSHARE_PHT_89;
  reg        [1:0]    GSHARE_PHT_90;
  reg        [1:0]    GSHARE_PHT_91;
  reg        [1:0]    GSHARE_PHT_92;
  reg        [1:0]    GSHARE_PHT_93;
  reg        [1:0]    GSHARE_PHT_94;
  reg        [1:0]    GSHARE_PHT_95;
  reg        [1:0]    GSHARE_PHT_96;
  reg        [1:0]    GSHARE_PHT_97;
  reg        [1:0]    GSHARE_PHT_98;
  reg        [1:0]    GSHARE_PHT_99;
  reg        [1:0]    GSHARE_PHT_100;
  reg        [1:0]    GSHARE_PHT_101;
  reg        [1:0]    GSHARE_PHT_102;
  reg        [1:0]    GSHARE_PHT_103;
  reg        [1:0]    GSHARE_PHT_104;
  reg        [1:0]    GSHARE_PHT_105;
  reg        [1:0]    GSHARE_PHT_106;
  reg        [1:0]    GSHARE_PHT_107;
  reg        [1:0]    GSHARE_PHT_108;
  reg        [1:0]    GSHARE_PHT_109;
  reg        [1:0]    GSHARE_PHT_110;
  reg        [1:0]    GSHARE_PHT_111;
  reg        [1:0]    GSHARE_PHT_112;
  reg        [1:0]    GSHARE_PHT_113;
  reg        [1:0]    GSHARE_PHT_114;
  reg        [1:0]    GSHARE_PHT_115;
  reg        [1:0]    GSHARE_PHT_116;
  reg        [1:0]    GSHARE_PHT_117;
  reg        [1:0]    GSHARE_PHT_118;
  reg        [1:0]    GSHARE_PHT_119;
  reg        [1:0]    GSHARE_PHT_120;
  reg        [1:0]    GSHARE_PHT_121;
  reg        [1:0]    GSHARE_PHT_122;
  reg        [1:0]    GSHARE_PHT_123;
  reg        [1:0]    GSHARE_PHT_124;
  reg        [1:0]    GSHARE_PHT_125;
  reg        [1:0]    GSHARE_PHT_126;
  reg        [1:0]    GSHARE_PHT_127;
  wire       [6:0]    GSHARE_predict_index;
  wire       [6:0]    GSHARE_train_index;
  wire                GSHARE_pht_predict_taken;
  wire       [127:0]  tmp_1;
  wire                tmp_2;
  wire                tmp_3;
  wire                tmp_4;
  wire                tmp_5;
  wire                tmp_6;
  wire                tmp_7;
  wire                tmp_8;
  wire                tmp_9;
  wire                tmp_10;
  wire                tmp_11;
  wire                tmp_12;
  wire                tmp_13;
  wire                tmp_14;
  wire                tmp_15;
  wire                tmp_16;
  wire                tmp_17;
  wire                tmp_18;
  wire                tmp_19;
  wire                tmp_20;
  wire                tmp_21;
  wire                tmp_22;
  wire                tmp_23;
  wire                tmp_24;
  wire                tmp_25;
  wire                tmp_26;
  wire                tmp_27;
  wire                tmp_28;
  wire                tmp_29;
  wire                tmp_30;
  wire                tmp_31;
  wire                tmp_32;
  wire                tmp_33;
  wire                tmp_34;
  wire                tmp_35;
  wire                tmp_36;
  wire                tmp_37;
  wire                tmp_38;
  wire                tmp_39;
  wire                tmp_40;
  wire                tmp_41;
  wire                tmp_42;
  wire                tmp_43;
  wire                tmp_44;
  wire                tmp_45;
  wire                tmp_46;
  wire                tmp_47;
  wire                tmp_48;
  wire                tmp_49;
  wire                tmp_50;
  wire                tmp_51;
  wire                tmp_52;
  wire                tmp_53;
  wire                tmp_54;
  wire                tmp_55;
  wire                tmp_56;
  wire                tmp_57;
  wire                tmp_58;
  wire                tmp_59;
  wire                tmp_60;
  wire                tmp_61;
  wire                tmp_62;
  wire                tmp_63;
  wire                tmp_64;
  wire                tmp_65;
  wire                tmp_66;
  wire                tmp_67;
  wire                tmp_68;
  wire                tmp_69;
  wire                tmp_70;
  wire                tmp_71;
  wire                tmp_72;
  wire                tmp_73;
  wire                tmp_74;
  wire                tmp_75;
  wire                tmp_76;
  wire                tmp_77;
  wire                tmp_78;
  wire                tmp_79;
  wire                tmp_80;
  wire                tmp_81;
  wire                tmp_82;
  wire                tmp_83;
  wire                tmp_84;
  wire                tmp_85;
  wire                tmp_86;
  wire                tmp_87;
  wire                tmp_88;
  wire                tmp_89;
  wire                tmp_90;
  wire                tmp_91;
  wire                tmp_92;
  wire                tmp_93;
  wire                tmp_94;
  wire                tmp_95;
  wire                tmp_96;
  wire                tmp_97;
  wire                tmp_98;
  wire                tmp_99;
  wire                tmp_100;
  wire                tmp_101;
  wire                tmp_102;
  wire                tmp_103;
  wire                tmp_104;
  wire                tmp_105;
  wire                tmp_106;
  wire                tmp_107;
  wire                tmp_108;
  wire                tmp_109;
  wire                tmp_110;
  wire                tmp_111;
  wire                tmp_112;
  wire                tmp_113;
  wire                tmp_114;
  wire                tmp_115;
  wire                tmp_116;
  wire                tmp_117;
  wire                tmp_118;
  wire                tmp_119;
  wire                tmp_120;
  wire                tmp_121;
  wire                tmp_122;
  wire                tmp_123;
  wire                tmp_124;
  wire                tmp_125;
  wire                tmp_126;
  wire                tmp_127;
  wire                tmp_128;
  wire                tmp_129;
  reg        [63:0]   BTB_valid;
  reg        [63:0]   BTB_source_pc_0;
  reg        [63:0]   BTB_source_pc_1;
  reg        [63:0]   BTB_source_pc_2;
  reg        [63:0]   BTB_source_pc_3;
  reg        [63:0]   BTB_source_pc_4;
  reg        [63:0]   BTB_source_pc_5;
  reg        [63:0]   BTB_source_pc_6;
  reg        [63:0]   BTB_source_pc_7;
  reg        [63:0]   BTB_source_pc_8;
  reg        [63:0]   BTB_source_pc_9;
  reg        [63:0]   BTB_source_pc_10;
  reg        [63:0]   BTB_source_pc_11;
  reg        [63:0]   BTB_source_pc_12;
  reg        [63:0]   BTB_source_pc_13;
  reg        [63:0]   BTB_source_pc_14;
  reg        [63:0]   BTB_source_pc_15;
  reg        [63:0]   BTB_source_pc_16;
  reg        [63:0]   BTB_source_pc_17;
  reg        [63:0]   BTB_source_pc_18;
  reg        [63:0]   BTB_source_pc_19;
  reg        [63:0]   BTB_source_pc_20;
  reg        [63:0]   BTB_source_pc_21;
  reg        [63:0]   BTB_source_pc_22;
  reg        [63:0]   BTB_source_pc_23;
  reg        [63:0]   BTB_source_pc_24;
  reg        [63:0]   BTB_source_pc_25;
  reg        [63:0]   BTB_source_pc_26;
  reg        [63:0]   BTB_source_pc_27;
  reg        [63:0]   BTB_source_pc_28;
  reg        [63:0]   BTB_source_pc_29;
  reg        [63:0]   BTB_source_pc_30;
  reg        [63:0]   BTB_source_pc_31;
  reg        [63:0]   BTB_source_pc_32;
  reg        [63:0]   BTB_source_pc_33;
  reg        [63:0]   BTB_source_pc_34;
  reg        [63:0]   BTB_source_pc_35;
  reg        [63:0]   BTB_source_pc_36;
  reg        [63:0]   BTB_source_pc_37;
  reg        [63:0]   BTB_source_pc_38;
  reg        [63:0]   BTB_source_pc_39;
  reg        [63:0]   BTB_source_pc_40;
  reg        [63:0]   BTB_source_pc_41;
  reg        [63:0]   BTB_source_pc_42;
  reg        [63:0]   BTB_source_pc_43;
  reg        [63:0]   BTB_source_pc_44;
  reg        [63:0]   BTB_source_pc_45;
  reg        [63:0]   BTB_source_pc_46;
  reg        [63:0]   BTB_source_pc_47;
  reg        [63:0]   BTB_source_pc_48;
  reg        [63:0]   BTB_source_pc_49;
  reg        [63:0]   BTB_source_pc_50;
  reg        [63:0]   BTB_source_pc_51;
  reg        [63:0]   BTB_source_pc_52;
  reg        [63:0]   BTB_source_pc_53;
  reg        [63:0]   BTB_source_pc_54;
  reg        [63:0]   BTB_source_pc_55;
  reg        [63:0]   BTB_source_pc_56;
  reg        [63:0]   BTB_source_pc_57;
  reg        [63:0]   BTB_source_pc_58;
  reg        [63:0]   BTB_source_pc_59;
  reg        [63:0]   BTB_source_pc_60;
  reg        [63:0]   BTB_source_pc_61;
  reg        [63:0]   BTB_source_pc_62;
  reg        [63:0]   BTB_source_pc_63;
  reg        [63:0]   BTB_call;
  reg        [63:0]   BTB_ret;
  reg        [63:0]   BTB_jmp;
  reg        [63:0]   BTB_target_pc_0;
  reg        [63:0]   BTB_target_pc_1;
  reg        [63:0]   BTB_target_pc_2;
  reg        [63:0]   BTB_target_pc_3;
  reg        [63:0]   BTB_target_pc_4;
  reg        [63:0]   BTB_target_pc_5;
  reg        [63:0]   BTB_target_pc_6;
  reg        [63:0]   BTB_target_pc_7;
  reg        [63:0]   BTB_target_pc_8;
  reg        [63:0]   BTB_target_pc_9;
  reg        [63:0]   BTB_target_pc_10;
  reg        [63:0]   BTB_target_pc_11;
  reg        [63:0]   BTB_target_pc_12;
  reg        [63:0]   BTB_target_pc_13;
  reg        [63:0]   BTB_target_pc_14;
  reg        [63:0]   BTB_target_pc_15;
  reg        [63:0]   BTB_target_pc_16;
  reg        [63:0]   BTB_target_pc_17;
  reg        [63:0]   BTB_target_pc_18;
  reg        [63:0]   BTB_target_pc_19;
  reg        [63:0]   BTB_target_pc_20;
  reg        [63:0]   BTB_target_pc_21;
  reg        [63:0]   BTB_target_pc_22;
  reg        [63:0]   BTB_target_pc_23;
  reg        [63:0]   BTB_target_pc_24;
  reg        [63:0]   BTB_target_pc_25;
  reg        [63:0]   BTB_target_pc_26;
  reg        [63:0]   BTB_target_pc_27;
  reg        [63:0]   BTB_target_pc_28;
  reg        [63:0]   BTB_target_pc_29;
  reg        [63:0]   BTB_target_pc_30;
  reg        [63:0]   BTB_target_pc_31;
  reg        [63:0]   BTB_target_pc_32;
  reg        [63:0]   BTB_target_pc_33;
  reg        [63:0]   BTB_target_pc_34;
  reg        [63:0]   BTB_target_pc_35;
  reg        [63:0]   BTB_target_pc_36;
  reg        [63:0]   BTB_target_pc_37;
  reg        [63:0]   BTB_target_pc_38;
  reg        [63:0]   BTB_target_pc_39;
  reg        [63:0]   BTB_target_pc_40;
  reg        [63:0]   BTB_target_pc_41;
  reg        [63:0]   BTB_target_pc_42;
  reg        [63:0]   BTB_target_pc_43;
  reg        [63:0]   BTB_target_pc_44;
  reg        [63:0]   BTB_target_pc_45;
  reg        [63:0]   BTB_target_pc_46;
  reg        [63:0]   BTB_target_pc_47;
  reg        [63:0]   BTB_target_pc_48;
  reg        [63:0]   BTB_target_pc_49;
  reg        [63:0]   BTB_target_pc_50;
  reg        [63:0]   BTB_target_pc_51;
  reg        [63:0]   BTB_target_pc_52;
  reg        [63:0]   BTB_target_pc_53;
  reg        [63:0]   BTB_target_pc_54;
  reg        [63:0]   BTB_target_pc_55;
  reg        [63:0]   BTB_target_pc_56;
  reg        [63:0]   BTB_target_pc_57;
  reg        [63:0]   BTB_target_pc_58;
  reg        [63:0]   BTB_target_pc_59;
  reg        [63:0]   BTB_target_pc_60;
  reg        [63:0]   BTB_target_pc_61;
  reg        [63:0]   BTB_target_pc_62;
  reg        [63:0]   BTB_target_pc_63;
  reg                 BTB_is_matched;
  reg                 BTB_is_call;
  reg                 BTB_is_ret;
  reg                 BTB_is_jmp;
  reg        [63:0]   BTB_target_pc_read;
  wire       [5:0]    BTB_btb_write_index;
  reg                 BTB_btb_alloc_index_willIncrement;
  reg                 BTB_btb_alloc_index_willClear;
  reg        [5:0]    BTB_btb_alloc_index_valueNext;
  reg        [5:0]    BTB_btb_alloc_index_value;
  wire                BTB_btb_alloc_index_willOverflowIfInc;
  wire                BTB_btb_alloc_index_willOverflow;
  reg                 BTB_btb_is_hit_vec_0;
  reg                 BTB_btb_is_hit_vec_1;
  reg                 BTB_btb_is_hit_vec_2;
  reg                 BTB_btb_is_hit_vec_3;
  reg                 BTB_btb_is_hit_vec_4;
  reg                 BTB_btb_is_hit_vec_5;
  reg                 BTB_btb_is_hit_vec_6;
  reg                 BTB_btb_is_hit_vec_7;
  reg                 BTB_btb_is_hit_vec_8;
  reg                 BTB_btb_is_hit_vec_9;
  reg                 BTB_btb_is_hit_vec_10;
  reg                 BTB_btb_is_hit_vec_11;
  reg                 BTB_btb_is_hit_vec_12;
  reg                 BTB_btb_is_hit_vec_13;
  reg                 BTB_btb_is_hit_vec_14;
  reg                 BTB_btb_is_hit_vec_15;
  reg                 BTB_btb_is_hit_vec_16;
  reg                 BTB_btb_is_hit_vec_17;
  reg                 BTB_btb_is_hit_vec_18;
  reg                 BTB_btb_is_hit_vec_19;
  reg                 BTB_btb_is_hit_vec_20;
  reg                 BTB_btb_is_hit_vec_21;
  reg                 BTB_btb_is_hit_vec_22;
  reg                 BTB_btb_is_hit_vec_23;
  reg                 BTB_btb_is_hit_vec_24;
  reg                 BTB_btb_is_hit_vec_25;
  reg                 BTB_btb_is_hit_vec_26;
  reg                 BTB_btb_is_hit_vec_27;
  reg                 BTB_btb_is_hit_vec_28;
  reg                 BTB_btb_is_hit_vec_29;
  reg                 BTB_btb_is_hit_vec_30;
  reg                 BTB_btb_is_hit_vec_31;
  reg                 BTB_btb_is_hit_vec_32;
  reg                 BTB_btb_is_hit_vec_33;
  reg                 BTB_btb_is_hit_vec_34;
  reg                 BTB_btb_is_hit_vec_35;
  reg                 BTB_btb_is_hit_vec_36;
  reg                 BTB_btb_is_hit_vec_37;
  reg                 BTB_btb_is_hit_vec_38;
  reg                 BTB_btb_is_hit_vec_39;
  reg                 BTB_btb_is_hit_vec_40;
  reg                 BTB_btb_is_hit_vec_41;
  reg                 BTB_btb_is_hit_vec_42;
  reg                 BTB_btb_is_hit_vec_43;
  reg                 BTB_btb_is_hit_vec_44;
  reg                 BTB_btb_is_hit_vec_45;
  reg                 BTB_btb_is_hit_vec_46;
  reg                 BTB_btb_is_hit_vec_47;
  reg                 BTB_btb_is_hit_vec_48;
  reg                 BTB_btb_is_hit_vec_49;
  reg                 BTB_btb_is_hit_vec_50;
  reg                 BTB_btb_is_hit_vec_51;
  reg                 BTB_btb_is_hit_vec_52;
  reg                 BTB_btb_is_hit_vec_53;
  reg                 BTB_btb_is_hit_vec_54;
  reg                 BTB_btb_is_hit_vec_55;
  reg                 BTB_btb_is_hit_vec_56;
  reg                 BTB_btb_is_hit_vec_57;
  reg                 BTB_btb_is_hit_vec_58;
  reg                 BTB_btb_is_hit_vec_59;
  reg                 BTB_btb_is_hit_vec_60;
  reg                 BTB_btb_is_hit_vec_61;
  reg                 BTB_btb_is_hit_vec_62;
  reg                 BTB_btb_is_hit_vec_63;
  reg                 BTB_btb_is_miss_vec_0;
  reg                 BTB_btb_is_miss_vec_1;
  reg                 BTB_btb_is_miss_vec_2;
  reg                 BTB_btb_is_miss_vec_3;
  reg                 BTB_btb_is_miss_vec_4;
  reg                 BTB_btb_is_miss_vec_5;
  reg                 BTB_btb_is_miss_vec_6;
  reg                 BTB_btb_is_miss_vec_7;
  reg                 BTB_btb_is_miss_vec_8;
  reg                 BTB_btb_is_miss_vec_9;
  reg                 BTB_btb_is_miss_vec_10;
  reg                 BTB_btb_is_miss_vec_11;
  reg                 BTB_btb_is_miss_vec_12;
  reg                 BTB_btb_is_miss_vec_13;
  reg                 BTB_btb_is_miss_vec_14;
  reg                 BTB_btb_is_miss_vec_15;
  reg                 BTB_btb_is_miss_vec_16;
  reg                 BTB_btb_is_miss_vec_17;
  reg                 BTB_btb_is_miss_vec_18;
  reg                 BTB_btb_is_miss_vec_19;
  reg                 BTB_btb_is_miss_vec_20;
  reg                 BTB_btb_is_miss_vec_21;
  reg                 BTB_btb_is_miss_vec_22;
  reg                 BTB_btb_is_miss_vec_23;
  reg                 BTB_btb_is_miss_vec_24;
  reg                 BTB_btb_is_miss_vec_25;
  reg                 BTB_btb_is_miss_vec_26;
  reg                 BTB_btb_is_miss_vec_27;
  reg                 BTB_btb_is_miss_vec_28;
  reg                 BTB_btb_is_miss_vec_29;
  reg                 BTB_btb_is_miss_vec_30;
  reg                 BTB_btb_is_miss_vec_31;
  reg                 BTB_btb_is_miss_vec_32;
  reg                 BTB_btb_is_miss_vec_33;
  reg                 BTB_btb_is_miss_vec_34;
  reg                 BTB_btb_is_miss_vec_35;
  reg                 BTB_btb_is_miss_vec_36;
  reg                 BTB_btb_is_miss_vec_37;
  reg                 BTB_btb_is_miss_vec_38;
  reg                 BTB_btb_is_miss_vec_39;
  reg                 BTB_btb_is_miss_vec_40;
  reg                 BTB_btb_is_miss_vec_41;
  reg                 BTB_btb_is_miss_vec_42;
  reg                 BTB_btb_is_miss_vec_43;
  reg                 BTB_btb_is_miss_vec_44;
  reg                 BTB_btb_is_miss_vec_45;
  reg                 BTB_btb_is_miss_vec_46;
  reg                 BTB_btb_is_miss_vec_47;
  reg                 BTB_btb_is_miss_vec_48;
  reg                 BTB_btb_is_miss_vec_49;
  reg                 BTB_btb_is_miss_vec_50;
  reg                 BTB_btb_is_miss_vec_51;
  reg                 BTB_btb_is_miss_vec_52;
  reg                 BTB_btb_is_miss_vec_53;
  reg                 BTB_btb_is_miss_vec_54;
  reg                 BTB_btb_is_miss_vec_55;
  reg                 BTB_btb_is_miss_vec_56;
  reg                 BTB_btb_is_miss_vec_57;
  reg                 BTB_btb_is_miss_vec_58;
  reg                 BTB_btb_is_miss_vec_59;
  reg                 BTB_btb_is_miss_vec_60;
  reg                 BTB_btb_is_miss_vec_61;
  reg                 BTB_btb_is_miss_vec_62;
  reg                 BTB_btb_is_miss_vec_63;
  wire                BTB_btb_is_hit;
  wire                BTB_btb_is_miss;
  wire                tmp_BTB_btb_write_index;
  wire                tmp_BTB_btb_write_index_1;
  wire                tmp_BTB_btb_write_index_2;
  wire                tmp_BTB_btb_write_index_3;
  wire                tmp_BTB_btb_write_index_4;
  wire                tmp_BTB_btb_write_index_5;
  wire       [63:0]   tmp_130;
  wire       [63:0]   tmp_131;
  wire       [63:0]   tmp_132;
  wire       [63:0]   tmp_133;
  reg        [63:0]   RAS_ras_regfile_0;
  reg        [63:0]   RAS_ras_regfile_1;
  reg        [63:0]   RAS_ras_regfile_2;
  reg        [63:0]   RAS_ras_regfile_3;
  reg        [63:0]   RAS_ras_regfile_4;
  reg        [63:0]   RAS_ras_regfile_5;
  reg        [63:0]   RAS_ras_regfile_6;
  reg        [63:0]   RAS_ras_regfile_7;
  reg        [63:0]   RAS_ras_regfile_8;
  reg        [63:0]   RAS_ras_regfile_9;
  reg        [63:0]   RAS_ras_regfile_10;
  reg        [63:0]   RAS_ras_regfile_11;
  reg        [63:0]   RAS_ras_regfile_12;
  reg        [63:0]   RAS_ras_regfile_13;
  reg        [63:0]   RAS_ras_regfile_14;
  reg        [63:0]   RAS_ras_regfile_15;
  reg        [63:0]   RAS_ras_regfile_16;
  reg        [63:0]   RAS_ras_regfile_17;
  reg        [63:0]   RAS_ras_regfile_18;
  reg        [63:0]   RAS_ras_regfile_19;
  reg        [63:0]   RAS_ras_regfile_20;
  reg        [63:0]   RAS_ras_regfile_21;
  reg        [63:0]   RAS_ras_regfile_22;
  reg        [63:0]   RAS_ras_regfile_23;
  reg        [63:0]   RAS_ras_regfile_24;
  reg        [63:0]   RAS_ras_regfile_25;
  reg        [63:0]   RAS_ras_regfile_26;
  reg        [63:0]   RAS_ras_regfile_27;
  reg        [63:0]   RAS_ras_regfile_28;
  reg        [63:0]   RAS_ras_regfile_29;
  reg        [63:0]   RAS_ras_regfile_30;
  reg        [63:0]   RAS_ras_regfile_31;
  reg        [63:0]   RAS_ras_regfile_32;
  reg        [63:0]   RAS_ras_regfile_33;
  reg        [63:0]   RAS_ras_regfile_34;
  reg        [63:0]   RAS_ras_regfile_35;
  reg        [63:0]   RAS_ras_regfile_36;
  reg        [63:0]   RAS_ras_regfile_37;
  reg        [63:0]   RAS_ras_regfile_38;
  reg        [63:0]   RAS_ras_regfile_39;
  reg        [63:0]   RAS_ras_regfile_40;
  reg        [63:0]   RAS_ras_regfile_41;
  reg        [63:0]   RAS_ras_regfile_42;
  reg        [63:0]   RAS_ras_regfile_43;
  reg        [63:0]   RAS_ras_regfile_44;
  reg        [63:0]   RAS_ras_regfile_45;
  reg        [63:0]   RAS_ras_regfile_46;
  reg        [63:0]   RAS_ras_regfile_47;
  reg        [63:0]   RAS_ras_regfile_48;
  reg        [63:0]   RAS_ras_regfile_49;
  reg        [63:0]   RAS_ras_regfile_50;
  reg        [63:0]   RAS_ras_regfile_51;
  reg        [63:0]   RAS_ras_regfile_52;
  reg        [63:0]   RAS_ras_regfile_53;
  reg        [63:0]   RAS_ras_regfile_54;
  reg        [63:0]   RAS_ras_regfile_55;
  reg        [63:0]   RAS_ras_regfile_56;
  reg        [63:0]   RAS_ras_regfile_57;
  reg        [63:0]   RAS_ras_regfile_58;
  reg        [63:0]   RAS_ras_regfile_59;
  reg        [63:0]   RAS_ras_regfile_60;
  reg        [63:0]   RAS_ras_regfile_61;
  reg        [63:0]   RAS_ras_regfile_62;
  reg        [63:0]   RAS_ras_regfile_63;
  reg        [5:0]    RAS_ras_next_index;
  reg        [5:0]    RAS_ras_curr_index;
  reg        [5:0]    RAS_ras_next_index_proven;
  reg        [5:0]    RAS_ras_curr_index_proven;
  wire       [63:0]   RAS_ras_predict_pc;
  wire                RAS_ras_call_matched;
  wire                RAS_ras_ret_matched;
  wire       [63:0]   tmp_134;
  wire                tmp_135;
  wire                tmp_136;
  wire                tmp_137;
  wire                tmp_138;
  wire                tmp_139;
  wire                tmp_140;
  wire                tmp_141;
  wire                tmp_142;
  wire                tmp_143;
  wire                tmp_144;
  wire                tmp_145;
  wire                tmp_146;
  wire                tmp_147;
  wire                tmp_148;
  wire                tmp_149;
  wire                tmp_150;
  wire                tmp_151;
  wire                tmp_152;
  wire                tmp_153;
  wire                tmp_154;
  wire                tmp_155;
  wire                tmp_156;
  wire                tmp_157;
  wire                tmp_158;
  wire                tmp_159;
  wire                tmp_160;
  wire                tmp_161;
  wire                tmp_162;
  wire                tmp_163;
  wire                tmp_164;
  wire                tmp_165;
  wire                tmp_166;
  wire                tmp_167;
  wire                tmp_168;
  wire                tmp_169;
  wire                tmp_170;
  wire                tmp_171;
  wire                tmp_172;
  wire                tmp_173;
  wire                tmp_174;
  wire                tmp_175;
  wire                tmp_176;
  wire                tmp_177;
  wire                tmp_178;
  wire                tmp_179;
  wire                tmp_180;
  wire                tmp_181;
  wire                tmp_182;
  wire                tmp_183;
  wire                tmp_184;
  wire                tmp_185;
  wire                tmp_186;
  wire                tmp_187;
  wire                tmp_188;
  wire                tmp_189;
  wire                tmp_190;
  wire                tmp_191;
  wire                tmp_192;
  wire                tmp_193;
  wire                tmp_194;
  wire                tmp_195;
  wire                tmp_196;
  wire                tmp_197;
  wire                tmp_198;
  wire       [63:0]   tmp_RAS_ras_regfile_0;
  wire       [63:0]   tmp_RAS_ras_regfile_0_1;

  assign tmp_when = ((BTB_source_pc_0 == predict_pc) && BTB_valid[0]);
  assign tmp_when_1 = ((BTB_source_pc_1 == predict_pc) && BTB_valid[1]);
  assign tmp_when_2 = ((BTB_source_pc_2 == predict_pc) && BTB_valid[2]);
  assign tmp_when_3 = ((BTB_source_pc_3 == predict_pc) && BTB_valid[3]);
  assign tmp_when_4 = ((BTB_source_pc_4 == predict_pc) && BTB_valid[4]);
  assign tmp_when_5 = ((BTB_source_pc_5 == predict_pc) && BTB_valid[5]);
  assign tmp_when_6 = ((BTB_source_pc_6 == predict_pc) && BTB_valid[6]);
  assign tmp_when_7 = ((BTB_source_pc_7 == predict_pc) && BTB_valid[7]);
  assign tmp_when_8 = ((BTB_source_pc_8 == predict_pc) && BTB_valid[8]);
  assign tmp_when_9 = ((BTB_source_pc_9 == predict_pc) && BTB_valid[9]);
  assign tmp_when_10 = ((BTB_source_pc_10 == predict_pc) && BTB_valid[10]);
  assign tmp_when_11 = ((BTB_source_pc_11 == predict_pc) && BTB_valid[11]);
  assign tmp_when_12 = ((BTB_source_pc_12 == predict_pc) && BTB_valid[12]);
  assign tmp_when_13 = ((BTB_source_pc_13 == predict_pc) && BTB_valid[13]);
  assign tmp_when_14 = ((BTB_source_pc_14 == predict_pc) && BTB_valid[14]);
  assign tmp_when_15 = ((BTB_source_pc_15 == predict_pc) && BTB_valid[15]);
  assign tmp_when_16 = ((BTB_source_pc_16 == predict_pc) && BTB_valid[16]);
  assign tmp_when_17 = ((BTB_source_pc_17 == predict_pc) && BTB_valid[17]);
  assign tmp_when_18 = ((BTB_source_pc_18 == predict_pc) && BTB_valid[18]);
  assign tmp_when_19 = ((BTB_source_pc_19 == predict_pc) && BTB_valid[19]);
  assign tmp_when_20 = ((BTB_source_pc_20 == predict_pc) && BTB_valid[20]);
  assign tmp_when_21 = ((BTB_source_pc_21 == predict_pc) && BTB_valid[21]);
  assign tmp_when_22 = ((BTB_source_pc_22 == predict_pc) && BTB_valid[22]);
  assign tmp_when_23 = ((BTB_source_pc_23 == predict_pc) && BTB_valid[23]);
  assign tmp_when_24 = ((BTB_source_pc_24 == predict_pc) && BTB_valid[24]);
  assign tmp_when_25 = ((BTB_source_pc_25 == predict_pc) && BTB_valid[25]);
  assign tmp_when_26 = ((BTB_source_pc_26 == predict_pc) && BTB_valid[26]);
  assign tmp_when_27 = ((BTB_source_pc_27 == predict_pc) && BTB_valid[27]);
  assign tmp_when_28 = ((BTB_source_pc_28 == predict_pc) && BTB_valid[28]);
  assign tmp_when_29 = ((BTB_source_pc_29 == predict_pc) && BTB_valid[29]);
  assign tmp_when_30 = ((BTB_source_pc_30 == predict_pc) && BTB_valid[30]);
  assign tmp_when_31 = ((BTB_source_pc_31 == predict_pc) && BTB_valid[31]);
  assign tmp_when_32 = ((BTB_source_pc_32 == predict_pc) && BTB_valid[32]);
  assign tmp_when_33 = ((BTB_source_pc_33 == predict_pc) && BTB_valid[33]);
  assign tmp_when_34 = ((BTB_source_pc_34 == predict_pc) && BTB_valid[34]);
  assign tmp_when_35 = ((BTB_source_pc_35 == predict_pc) && BTB_valid[35]);
  assign tmp_when_36 = ((BTB_source_pc_36 == predict_pc) && BTB_valid[36]);
  assign tmp_when_37 = ((BTB_source_pc_37 == predict_pc) && BTB_valid[37]);
  assign tmp_when_38 = ((BTB_source_pc_38 == predict_pc) && BTB_valid[38]);
  assign tmp_when_39 = ((BTB_source_pc_39 == predict_pc) && BTB_valid[39]);
  assign tmp_when_40 = ((BTB_source_pc_40 == predict_pc) && BTB_valid[40]);
  assign tmp_when_41 = ((BTB_source_pc_41 == predict_pc) && BTB_valid[41]);
  assign tmp_when_42 = ((BTB_source_pc_42 == predict_pc) && BTB_valid[42]);
  assign tmp_when_43 = ((BTB_source_pc_43 == predict_pc) && BTB_valid[43]);
  assign tmp_when_44 = ((BTB_source_pc_44 == predict_pc) && BTB_valid[44]);
  assign tmp_when_45 = ((BTB_source_pc_45 == predict_pc) && BTB_valid[45]);
  assign tmp_when_46 = ((BTB_source_pc_46 == predict_pc) && BTB_valid[46]);
  assign tmp_when_47 = ((BTB_source_pc_47 == predict_pc) && BTB_valid[47]);
  assign tmp_when_48 = ((BTB_source_pc_48 == predict_pc) && BTB_valid[48]);
  assign tmp_when_49 = ((BTB_source_pc_49 == predict_pc) && BTB_valid[49]);
  assign tmp_when_50 = ((BTB_source_pc_50 == predict_pc) && BTB_valid[50]);
  assign tmp_when_51 = ((BTB_source_pc_51 == predict_pc) && BTB_valid[51]);
  assign tmp_when_52 = ((BTB_source_pc_52 == predict_pc) && BTB_valid[52]);
  assign tmp_when_53 = ((BTB_source_pc_53 == predict_pc) && BTB_valid[53]);
  assign tmp_when_54 = ((BTB_source_pc_54 == predict_pc) && BTB_valid[54]);
  assign tmp_when_55 = ((BTB_source_pc_55 == predict_pc) && BTB_valid[55]);
  assign tmp_when_56 = ((BTB_source_pc_56 == predict_pc) && BTB_valid[56]);
  assign tmp_when_57 = ((BTB_source_pc_57 == predict_pc) && BTB_valid[57]);
  assign tmp_when_58 = ((BTB_source_pc_58 == predict_pc) && BTB_valid[58]);
  assign tmp_when_59 = ((BTB_source_pc_59 == predict_pc) && BTB_valid[59]);
  assign tmp_when_60 = ((BTB_source_pc_60 == predict_pc) && BTB_valid[60]);
  assign tmp_when_61 = ((BTB_source_pc_61 == predict_pc) && BTB_valid[61]);
  assign tmp_when_62 = ((BTB_source_pc_62 == predict_pc) && BTB_valid[62]);
  assign tmp_when_63 = ((BTB_source_pc_63 == predict_pc) && BTB_valid[63]);
  assign tmp_when_64 = (train_valid && train_taken);
  assign tmp_when_65 = (train_valid && train_taken);
  assign tmp_when_66 = (train_valid && train_taken);
  assign tmp_when_67 = (train_valid && train_taken);
  assign tmp_when_68 = (train_valid && train_taken);
  assign tmp_when_69 = (train_valid && train_taken);
  assign tmp_when_70 = (train_valid && train_taken);
  assign tmp_when_71 = (train_valid && train_taken);
  assign tmp_when_72 = (train_valid && train_taken);
  assign tmp_when_73 = (train_valid && train_taken);
  assign tmp_when_74 = (train_valid && train_taken);
  assign tmp_when_75 = (train_valid && train_taken);
  assign tmp_when_76 = (train_valid && train_taken);
  assign tmp_when_77 = (train_valid && train_taken);
  assign tmp_when_78 = (train_valid && train_taken);
  assign tmp_when_79 = (train_valid && train_taken);
  assign tmp_when_80 = (train_valid && train_taken);
  assign tmp_when_81 = (train_valid && train_taken);
  assign tmp_when_82 = (train_valid && train_taken);
  assign tmp_when_83 = (train_valid && train_taken);
  assign tmp_when_84 = (train_valid && train_taken);
  assign tmp_when_85 = (train_valid && train_taken);
  assign tmp_when_86 = (train_valid && train_taken);
  assign tmp_when_87 = (train_valid && train_taken);
  assign tmp_when_88 = (train_valid && train_taken);
  assign tmp_when_89 = (train_valid && train_taken);
  assign tmp_when_90 = (train_valid && train_taken);
  assign tmp_when_91 = (train_valid && train_taken);
  assign tmp_when_92 = (train_valid && train_taken);
  assign tmp_when_93 = (train_valid && train_taken);
  assign tmp_when_94 = (train_valid && train_taken);
  assign tmp_when_95 = (train_valid && train_taken);
  assign tmp_when_96 = (train_valid && train_taken);
  assign tmp_when_97 = (train_valid && train_taken);
  assign tmp_when_98 = (train_valid && train_taken);
  assign tmp_when_99 = (train_valid && train_taken);
  assign tmp_when_100 = (train_valid && train_taken);
  assign tmp_when_101 = (train_valid && train_taken);
  assign tmp_when_102 = (train_valid && train_taken);
  assign tmp_when_103 = (train_valid && train_taken);
  assign tmp_when_104 = (train_valid && train_taken);
  assign tmp_when_105 = (train_valid && train_taken);
  assign tmp_when_106 = (train_valid && train_taken);
  assign tmp_when_107 = (train_valid && train_taken);
  assign tmp_when_108 = (train_valid && train_taken);
  assign tmp_when_109 = (train_valid && train_taken);
  assign tmp_when_110 = (train_valid && train_taken);
  assign tmp_when_111 = (train_valid && train_taken);
  assign tmp_when_112 = (train_valid && train_taken);
  assign tmp_when_113 = (train_valid && train_taken);
  assign tmp_when_114 = (train_valid && train_taken);
  assign tmp_when_115 = (train_valid && train_taken);
  assign tmp_when_116 = (train_valid && train_taken);
  assign tmp_when_117 = (train_valid && train_taken);
  assign tmp_when_118 = (train_valid && train_taken);
  assign tmp_when_119 = (train_valid && train_taken);
  assign tmp_when_120 = (train_valid && train_taken);
  assign tmp_when_121 = (train_valid && train_taken);
  assign tmp_when_122 = (train_valid && train_taken);
  assign tmp_when_123 = (train_valid && train_taken);
  assign tmp_when_124 = (train_valid && train_taken);
  assign tmp_when_125 = (train_valid && train_taken);
  assign tmp_when_126 = (train_valid && train_taken);
  assign tmp_when_127 = (train_valid && train_taken);
  assign tmp_when_128 = ((train_mispredicted && train_valid) && train_is_call);
  assign tmp_BTB_btb_alloc_index_valueNext_1 = BTB_btb_alloc_index_willIncrement;
  assign tmp_BTB_btb_alloc_index_valueNext = {5'd0, tmp_BTB_btb_alloc_index_valueNext_1};
  assign tmp_predict_pc_next = (predict_pc + 64'h0000000000000004);
  assign tmp_BTB_btb_is_hit = BTB_btb_is_hit_vec_53;
  assign tmp_BTB_btb_is_hit_1 = {BTB_btb_is_hit_vec_52,{BTB_btb_is_hit_vec_51,{BTB_btb_is_hit_vec_50,{BTB_btb_is_hit_vec_49,{BTB_btb_is_hit_vec_48,{BTB_btb_is_hit_vec_47,{BTB_btb_is_hit_vec_46,{BTB_btb_is_hit_vec_45,{BTB_btb_is_hit_vec_44,{BTB_btb_is_hit_vec_43,{tmp_BTB_btb_is_hit_2,tmp_BTB_btb_is_hit_3}}}}}}}}}}};
  assign tmp_BTB_btb_is_hit_2 = BTB_btb_is_hit_vec_42;
  assign tmp_BTB_btb_is_hit_3 = {BTB_btb_is_hit_vec_41,{BTB_btb_is_hit_vec_40,{BTB_btb_is_hit_vec_39,{BTB_btb_is_hit_vec_38,{BTB_btb_is_hit_vec_37,{BTB_btb_is_hit_vec_36,{BTB_btb_is_hit_vec_35,{BTB_btb_is_hit_vec_34,{BTB_btb_is_hit_vec_33,{BTB_btb_is_hit_vec_32,{tmp_BTB_btb_is_hit_4,tmp_BTB_btb_is_hit_5}}}}}}}}}}};
  assign tmp_BTB_btb_is_hit_4 = BTB_btb_is_hit_vec_31;
  assign tmp_BTB_btb_is_hit_5 = {BTB_btb_is_hit_vec_30,{BTB_btb_is_hit_vec_29,{BTB_btb_is_hit_vec_28,{BTB_btb_is_hit_vec_27,{BTB_btb_is_hit_vec_26,{BTB_btb_is_hit_vec_25,{BTB_btb_is_hit_vec_24,{BTB_btb_is_hit_vec_23,{BTB_btb_is_hit_vec_22,{BTB_btb_is_hit_vec_21,{tmp_BTB_btb_is_hit_6,tmp_BTB_btb_is_hit_7}}}}}}}}}}};
  assign tmp_BTB_btb_is_hit_6 = BTB_btb_is_hit_vec_20;
  assign tmp_BTB_btb_is_hit_7 = {BTB_btb_is_hit_vec_19,{BTB_btb_is_hit_vec_18,{BTB_btb_is_hit_vec_17,{BTB_btb_is_hit_vec_16,{BTB_btb_is_hit_vec_15,{BTB_btb_is_hit_vec_14,{BTB_btb_is_hit_vec_13,{BTB_btb_is_hit_vec_12,{BTB_btb_is_hit_vec_11,{BTB_btb_is_hit_vec_10,{tmp_BTB_btb_is_hit_8,tmp_BTB_btb_is_hit_9}}}}}}}}}}};
  assign tmp_BTB_btb_is_hit_8 = BTB_btb_is_hit_vec_9;
  assign tmp_BTB_btb_is_hit_9 = {BTB_btb_is_hit_vec_8,{BTB_btb_is_hit_vec_7,{BTB_btb_is_hit_vec_6,{BTB_btb_is_hit_vec_5,{BTB_btb_is_hit_vec_4,{BTB_btb_is_hit_vec_3,{BTB_btb_is_hit_vec_2,{BTB_btb_is_hit_vec_1,BTB_btb_is_hit_vec_0}}}}}}}};
  assign tmp_BTB_btb_is_miss = BTB_btb_is_miss_vec_53;
  assign tmp_BTB_btb_is_miss_1 = {BTB_btb_is_miss_vec_52,{BTB_btb_is_miss_vec_51,{BTB_btb_is_miss_vec_50,{BTB_btb_is_miss_vec_49,{BTB_btb_is_miss_vec_48,{BTB_btb_is_miss_vec_47,{BTB_btb_is_miss_vec_46,{BTB_btb_is_miss_vec_45,{BTB_btb_is_miss_vec_44,{BTB_btb_is_miss_vec_43,{tmp_BTB_btb_is_miss_2,tmp_BTB_btb_is_miss_3}}}}}}}}}}};
  assign tmp_BTB_btb_is_miss_2 = BTB_btb_is_miss_vec_42;
  assign tmp_BTB_btb_is_miss_3 = {BTB_btb_is_miss_vec_41,{BTB_btb_is_miss_vec_40,{BTB_btb_is_miss_vec_39,{BTB_btb_is_miss_vec_38,{BTB_btb_is_miss_vec_37,{BTB_btb_is_miss_vec_36,{BTB_btb_is_miss_vec_35,{BTB_btb_is_miss_vec_34,{BTB_btb_is_miss_vec_33,{BTB_btb_is_miss_vec_32,{tmp_BTB_btb_is_miss_4,tmp_BTB_btb_is_miss_5}}}}}}}}}}};
  assign tmp_BTB_btb_is_miss_4 = BTB_btb_is_miss_vec_31;
  assign tmp_BTB_btb_is_miss_5 = {BTB_btb_is_miss_vec_30,{BTB_btb_is_miss_vec_29,{BTB_btb_is_miss_vec_28,{BTB_btb_is_miss_vec_27,{BTB_btb_is_miss_vec_26,{BTB_btb_is_miss_vec_25,{BTB_btb_is_miss_vec_24,{BTB_btb_is_miss_vec_23,{BTB_btb_is_miss_vec_22,{BTB_btb_is_miss_vec_21,{tmp_BTB_btb_is_miss_6,tmp_BTB_btb_is_miss_7}}}}}}}}}}};
  assign tmp_BTB_btb_is_miss_6 = BTB_btb_is_miss_vec_20;
  assign tmp_BTB_btb_is_miss_7 = {BTB_btb_is_miss_vec_19,{BTB_btb_is_miss_vec_18,{BTB_btb_is_miss_vec_17,{BTB_btb_is_miss_vec_16,{BTB_btb_is_miss_vec_15,{BTB_btb_is_miss_vec_14,{BTB_btb_is_miss_vec_13,{BTB_btb_is_miss_vec_12,{BTB_btb_is_miss_vec_11,{BTB_btb_is_miss_vec_10,{tmp_BTB_btb_is_miss_8,tmp_BTB_btb_is_miss_9}}}}}}}}}}};
  assign tmp_BTB_btb_is_miss_8 = BTB_btb_is_miss_vec_9;
  assign tmp_BTB_btb_is_miss_9 = {BTB_btb_is_miss_vec_8,{BTB_btb_is_miss_vec_7,{BTB_btb_is_miss_vec_6,{BTB_btb_is_miss_vec_5,{BTB_btb_is_miss_vec_4,{BTB_btb_is_miss_vec_3,{BTB_btb_is_miss_vec_2,{BTB_btb_is_miss_vec_1,BTB_btb_is_miss_vec_0}}}}}}}};
  assign tmp_tmp_BTB_btb_write_index = (((((((((((((((BTB_btb_is_hit_vec_1 || BTB_btb_is_hit_vec_3) || BTB_btb_is_hit_vec_5) || BTB_btb_is_hit_vec_7) || BTB_btb_is_hit_vec_9) || BTB_btb_is_hit_vec_11) || BTB_btb_is_hit_vec_13) || BTB_btb_is_hit_vec_15) || BTB_btb_is_hit_vec_17) || BTB_btb_is_hit_vec_19) || BTB_btb_is_hit_vec_21) || BTB_btb_is_hit_vec_23) || BTB_btb_is_hit_vec_25) || BTB_btb_is_hit_vec_27) || BTB_btb_is_hit_vec_29) || BTB_btb_is_hit_vec_31);
  assign tmp_tmp_BTB_btb_write_index_1 = ((((((((((((((BTB_btb_is_hit_vec_2 || BTB_btb_is_hit_vec_3) || BTB_btb_is_hit_vec_6) || BTB_btb_is_hit_vec_7) || BTB_btb_is_hit_vec_10) || BTB_btb_is_hit_vec_11) || BTB_btb_is_hit_vec_14) || BTB_btb_is_hit_vec_15) || BTB_btb_is_hit_vec_18) || BTB_btb_is_hit_vec_19) || BTB_btb_is_hit_vec_22) || BTB_btb_is_hit_vec_23) || BTB_btb_is_hit_vec_26) || BTB_btb_is_hit_vec_27) || BTB_btb_is_hit_vec_30);
  assign tmp_tmp_BTB_btb_write_index_2 = (((((((((((((((BTB_btb_is_hit_vec_4 || BTB_btb_is_hit_vec_5) || BTB_btb_is_hit_vec_6) || BTB_btb_is_hit_vec_7) || BTB_btb_is_hit_vec_12) || BTB_btb_is_hit_vec_13) || BTB_btb_is_hit_vec_14) || BTB_btb_is_hit_vec_15) || BTB_btb_is_hit_vec_20) || BTB_btb_is_hit_vec_21) || BTB_btb_is_hit_vec_22) || BTB_btb_is_hit_vec_23) || BTB_btb_is_hit_vec_28) || BTB_btb_is_hit_vec_29) || BTB_btb_is_hit_vec_30) || BTB_btb_is_hit_vec_31);
  assign tmp_tmp_BTB_btb_write_index_3 = (((((((((((((((BTB_btb_is_hit_vec_8 || BTB_btb_is_hit_vec_9) || BTB_btb_is_hit_vec_10) || BTB_btb_is_hit_vec_11) || BTB_btb_is_hit_vec_12) || BTB_btb_is_hit_vec_13) || BTB_btb_is_hit_vec_14) || BTB_btb_is_hit_vec_15) || BTB_btb_is_hit_vec_24) || BTB_btb_is_hit_vec_25) || BTB_btb_is_hit_vec_26) || BTB_btb_is_hit_vec_27) || BTB_btb_is_hit_vec_28) || BTB_btb_is_hit_vec_29) || BTB_btb_is_hit_vec_30) || BTB_btb_is_hit_vec_31);
  assign tmp_tmp_BTB_btb_write_index_4 = (((((((((((((((BTB_btb_is_hit_vec_16 || BTB_btb_is_hit_vec_17) || BTB_btb_is_hit_vec_18) || BTB_btb_is_hit_vec_19) || BTB_btb_is_hit_vec_20) || BTB_btb_is_hit_vec_21) || BTB_btb_is_hit_vec_22) || BTB_btb_is_hit_vec_23) || BTB_btb_is_hit_vec_24) || BTB_btb_is_hit_vec_25) || BTB_btb_is_hit_vec_26) || BTB_btb_is_hit_vec_27) || BTB_btb_is_hit_vec_28) || BTB_btb_is_hit_vec_29) || BTB_btb_is_hit_vec_30) || BTB_btb_is_hit_vec_31);
  assign tmp_tmp_BTB_btb_write_index_5 = ((((((((((((((BTB_btb_is_hit_vec_32 || BTB_btb_is_hit_vec_33) || BTB_btb_is_hit_vec_34) || BTB_btb_is_hit_vec_35) || BTB_btb_is_hit_vec_36) || BTB_btb_is_hit_vec_37) || BTB_btb_is_hit_vec_38) || BTB_btb_is_hit_vec_39) || BTB_btb_is_hit_vec_40) || BTB_btb_is_hit_vec_41) || BTB_btb_is_hit_vec_42) || BTB_btb_is_hit_vec_43) || BTB_btb_is_hit_vec_44) || BTB_btb_is_hit_vec_45) || BTB_btb_is_hit_vec_46);
  always @(*) begin
    case(GSHARE_predict_index)
      7'b0000000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_0;
      7'b0000001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_1;
      7'b0000010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_2;
      7'b0000011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_3;
      7'b0000100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_4;
      7'b0000101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_5;
      7'b0000110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_6;
      7'b0000111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_7;
      7'b0001000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_8;
      7'b0001001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_9;
      7'b0001010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_10;
      7'b0001011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_11;
      7'b0001100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_12;
      7'b0001101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_13;
      7'b0001110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_14;
      7'b0001111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_15;
      7'b0010000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_16;
      7'b0010001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_17;
      7'b0010010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_18;
      7'b0010011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_19;
      7'b0010100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_20;
      7'b0010101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_21;
      7'b0010110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_22;
      7'b0010111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_23;
      7'b0011000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_24;
      7'b0011001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_25;
      7'b0011010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_26;
      7'b0011011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_27;
      7'b0011100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_28;
      7'b0011101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_29;
      7'b0011110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_30;
      7'b0011111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_31;
      7'b0100000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_32;
      7'b0100001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_33;
      7'b0100010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_34;
      7'b0100011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_35;
      7'b0100100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_36;
      7'b0100101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_37;
      7'b0100110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_38;
      7'b0100111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_39;
      7'b0101000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_40;
      7'b0101001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_41;
      7'b0101010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_42;
      7'b0101011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_43;
      7'b0101100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_44;
      7'b0101101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_45;
      7'b0101110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_46;
      7'b0101111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_47;
      7'b0110000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_48;
      7'b0110001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_49;
      7'b0110010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_50;
      7'b0110011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_51;
      7'b0110100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_52;
      7'b0110101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_53;
      7'b0110110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_54;
      7'b0110111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_55;
      7'b0111000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_56;
      7'b0111001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_57;
      7'b0111010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_58;
      7'b0111011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_59;
      7'b0111100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_60;
      7'b0111101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_61;
      7'b0111110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_62;
      7'b0111111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_63;
      7'b1000000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_64;
      7'b1000001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_65;
      7'b1000010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_66;
      7'b1000011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_67;
      7'b1000100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_68;
      7'b1000101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_69;
      7'b1000110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_70;
      7'b1000111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_71;
      7'b1001000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_72;
      7'b1001001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_73;
      7'b1001010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_74;
      7'b1001011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_75;
      7'b1001100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_76;
      7'b1001101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_77;
      7'b1001110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_78;
      7'b1001111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_79;
      7'b1010000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_80;
      7'b1010001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_81;
      7'b1010010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_82;
      7'b1010011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_83;
      7'b1010100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_84;
      7'b1010101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_85;
      7'b1010110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_86;
      7'b1010111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_87;
      7'b1011000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_88;
      7'b1011001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_89;
      7'b1011010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_90;
      7'b1011011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_91;
      7'b1011100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_92;
      7'b1011101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_93;
      7'b1011110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_94;
      7'b1011111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_95;
      7'b1100000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_96;
      7'b1100001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_97;
      7'b1100010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_98;
      7'b1100011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_99;
      7'b1100100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_100;
      7'b1100101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_101;
      7'b1100110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_102;
      7'b1100111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_103;
      7'b1101000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_104;
      7'b1101001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_105;
      7'b1101010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_106;
      7'b1101011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_107;
      7'b1101100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_108;
      7'b1101101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_109;
      7'b1101110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_110;
      7'b1101111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_111;
      7'b1110000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_112;
      7'b1110001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_113;
      7'b1110010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_114;
      7'b1110011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_115;
      7'b1110100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_116;
      7'b1110101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_117;
      7'b1110110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_118;
      7'b1110111 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_119;
      7'b1111000 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_120;
      7'b1111001 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_121;
      7'b1111010 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_122;
      7'b1111011 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_123;
      7'b1111100 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_124;
      7'b1111101 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_125;
      7'b1111110 : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_126;
      default : tmp_GSHARE_pht_predict_taken = GSHARE_PHT_127;
    endcase
  end

  always @(*) begin
    case(GSHARE_train_index)
      7'b0000000 : tmp_199 = GSHARE_PHT_0;
      7'b0000001 : tmp_199 = GSHARE_PHT_1;
      7'b0000010 : tmp_199 = GSHARE_PHT_2;
      7'b0000011 : tmp_199 = GSHARE_PHT_3;
      7'b0000100 : tmp_199 = GSHARE_PHT_4;
      7'b0000101 : tmp_199 = GSHARE_PHT_5;
      7'b0000110 : tmp_199 = GSHARE_PHT_6;
      7'b0000111 : tmp_199 = GSHARE_PHT_7;
      7'b0001000 : tmp_199 = GSHARE_PHT_8;
      7'b0001001 : tmp_199 = GSHARE_PHT_9;
      7'b0001010 : tmp_199 = GSHARE_PHT_10;
      7'b0001011 : tmp_199 = GSHARE_PHT_11;
      7'b0001100 : tmp_199 = GSHARE_PHT_12;
      7'b0001101 : tmp_199 = GSHARE_PHT_13;
      7'b0001110 : tmp_199 = GSHARE_PHT_14;
      7'b0001111 : tmp_199 = GSHARE_PHT_15;
      7'b0010000 : tmp_199 = GSHARE_PHT_16;
      7'b0010001 : tmp_199 = GSHARE_PHT_17;
      7'b0010010 : tmp_199 = GSHARE_PHT_18;
      7'b0010011 : tmp_199 = GSHARE_PHT_19;
      7'b0010100 : tmp_199 = GSHARE_PHT_20;
      7'b0010101 : tmp_199 = GSHARE_PHT_21;
      7'b0010110 : tmp_199 = GSHARE_PHT_22;
      7'b0010111 : tmp_199 = GSHARE_PHT_23;
      7'b0011000 : tmp_199 = GSHARE_PHT_24;
      7'b0011001 : tmp_199 = GSHARE_PHT_25;
      7'b0011010 : tmp_199 = GSHARE_PHT_26;
      7'b0011011 : tmp_199 = GSHARE_PHT_27;
      7'b0011100 : tmp_199 = GSHARE_PHT_28;
      7'b0011101 : tmp_199 = GSHARE_PHT_29;
      7'b0011110 : tmp_199 = GSHARE_PHT_30;
      7'b0011111 : tmp_199 = GSHARE_PHT_31;
      7'b0100000 : tmp_199 = GSHARE_PHT_32;
      7'b0100001 : tmp_199 = GSHARE_PHT_33;
      7'b0100010 : tmp_199 = GSHARE_PHT_34;
      7'b0100011 : tmp_199 = GSHARE_PHT_35;
      7'b0100100 : tmp_199 = GSHARE_PHT_36;
      7'b0100101 : tmp_199 = GSHARE_PHT_37;
      7'b0100110 : tmp_199 = GSHARE_PHT_38;
      7'b0100111 : tmp_199 = GSHARE_PHT_39;
      7'b0101000 : tmp_199 = GSHARE_PHT_40;
      7'b0101001 : tmp_199 = GSHARE_PHT_41;
      7'b0101010 : tmp_199 = GSHARE_PHT_42;
      7'b0101011 : tmp_199 = GSHARE_PHT_43;
      7'b0101100 : tmp_199 = GSHARE_PHT_44;
      7'b0101101 : tmp_199 = GSHARE_PHT_45;
      7'b0101110 : tmp_199 = GSHARE_PHT_46;
      7'b0101111 : tmp_199 = GSHARE_PHT_47;
      7'b0110000 : tmp_199 = GSHARE_PHT_48;
      7'b0110001 : tmp_199 = GSHARE_PHT_49;
      7'b0110010 : tmp_199 = GSHARE_PHT_50;
      7'b0110011 : tmp_199 = GSHARE_PHT_51;
      7'b0110100 : tmp_199 = GSHARE_PHT_52;
      7'b0110101 : tmp_199 = GSHARE_PHT_53;
      7'b0110110 : tmp_199 = GSHARE_PHT_54;
      7'b0110111 : tmp_199 = GSHARE_PHT_55;
      7'b0111000 : tmp_199 = GSHARE_PHT_56;
      7'b0111001 : tmp_199 = GSHARE_PHT_57;
      7'b0111010 : tmp_199 = GSHARE_PHT_58;
      7'b0111011 : tmp_199 = GSHARE_PHT_59;
      7'b0111100 : tmp_199 = GSHARE_PHT_60;
      7'b0111101 : tmp_199 = GSHARE_PHT_61;
      7'b0111110 : tmp_199 = GSHARE_PHT_62;
      7'b0111111 : tmp_199 = GSHARE_PHT_63;
      7'b1000000 : tmp_199 = GSHARE_PHT_64;
      7'b1000001 : tmp_199 = GSHARE_PHT_65;
      7'b1000010 : tmp_199 = GSHARE_PHT_66;
      7'b1000011 : tmp_199 = GSHARE_PHT_67;
      7'b1000100 : tmp_199 = GSHARE_PHT_68;
      7'b1000101 : tmp_199 = GSHARE_PHT_69;
      7'b1000110 : tmp_199 = GSHARE_PHT_70;
      7'b1000111 : tmp_199 = GSHARE_PHT_71;
      7'b1001000 : tmp_199 = GSHARE_PHT_72;
      7'b1001001 : tmp_199 = GSHARE_PHT_73;
      7'b1001010 : tmp_199 = GSHARE_PHT_74;
      7'b1001011 : tmp_199 = GSHARE_PHT_75;
      7'b1001100 : tmp_199 = GSHARE_PHT_76;
      7'b1001101 : tmp_199 = GSHARE_PHT_77;
      7'b1001110 : tmp_199 = GSHARE_PHT_78;
      7'b1001111 : tmp_199 = GSHARE_PHT_79;
      7'b1010000 : tmp_199 = GSHARE_PHT_80;
      7'b1010001 : tmp_199 = GSHARE_PHT_81;
      7'b1010010 : tmp_199 = GSHARE_PHT_82;
      7'b1010011 : tmp_199 = GSHARE_PHT_83;
      7'b1010100 : tmp_199 = GSHARE_PHT_84;
      7'b1010101 : tmp_199 = GSHARE_PHT_85;
      7'b1010110 : tmp_199 = GSHARE_PHT_86;
      7'b1010111 : tmp_199 = GSHARE_PHT_87;
      7'b1011000 : tmp_199 = GSHARE_PHT_88;
      7'b1011001 : tmp_199 = GSHARE_PHT_89;
      7'b1011010 : tmp_199 = GSHARE_PHT_90;
      7'b1011011 : tmp_199 = GSHARE_PHT_91;
      7'b1011100 : tmp_199 = GSHARE_PHT_92;
      7'b1011101 : tmp_199 = GSHARE_PHT_93;
      7'b1011110 : tmp_199 = GSHARE_PHT_94;
      7'b1011111 : tmp_199 = GSHARE_PHT_95;
      7'b1100000 : tmp_199 = GSHARE_PHT_96;
      7'b1100001 : tmp_199 = GSHARE_PHT_97;
      7'b1100010 : tmp_199 = GSHARE_PHT_98;
      7'b1100011 : tmp_199 = GSHARE_PHT_99;
      7'b1100100 : tmp_199 = GSHARE_PHT_100;
      7'b1100101 : tmp_199 = GSHARE_PHT_101;
      7'b1100110 : tmp_199 = GSHARE_PHT_102;
      7'b1100111 : tmp_199 = GSHARE_PHT_103;
      7'b1101000 : tmp_199 = GSHARE_PHT_104;
      7'b1101001 : tmp_199 = GSHARE_PHT_105;
      7'b1101010 : tmp_199 = GSHARE_PHT_106;
      7'b1101011 : tmp_199 = GSHARE_PHT_107;
      7'b1101100 : tmp_199 = GSHARE_PHT_108;
      7'b1101101 : tmp_199 = GSHARE_PHT_109;
      7'b1101110 : tmp_199 = GSHARE_PHT_110;
      7'b1101111 : tmp_199 = GSHARE_PHT_111;
      7'b1110000 : tmp_199 = GSHARE_PHT_112;
      7'b1110001 : tmp_199 = GSHARE_PHT_113;
      7'b1110010 : tmp_199 = GSHARE_PHT_114;
      7'b1110011 : tmp_199 = GSHARE_PHT_115;
      7'b1110100 : tmp_199 = GSHARE_PHT_116;
      7'b1110101 : tmp_199 = GSHARE_PHT_117;
      7'b1110110 : tmp_199 = GSHARE_PHT_118;
      7'b1110111 : tmp_199 = GSHARE_PHT_119;
      7'b1111000 : tmp_199 = GSHARE_PHT_120;
      7'b1111001 : tmp_199 = GSHARE_PHT_121;
      7'b1111010 : tmp_199 = GSHARE_PHT_122;
      7'b1111011 : tmp_199 = GSHARE_PHT_123;
      7'b1111100 : tmp_199 = GSHARE_PHT_124;
      7'b1111101 : tmp_199 = GSHARE_PHT_125;
      7'b1111110 : tmp_199 = GSHARE_PHT_126;
      default : tmp_199 = GSHARE_PHT_127;
    endcase
  end

  always @(*) begin
    case(RAS_ras_curr_index)
      6'b000000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_0;
      6'b000001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_1;
      6'b000010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_2;
      6'b000011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_3;
      6'b000100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_4;
      6'b000101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_5;
      6'b000110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_6;
      6'b000111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_7;
      6'b001000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_8;
      6'b001001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_9;
      6'b001010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_10;
      6'b001011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_11;
      6'b001100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_12;
      6'b001101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_13;
      6'b001110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_14;
      6'b001111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_15;
      6'b010000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_16;
      6'b010001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_17;
      6'b010010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_18;
      6'b010011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_19;
      6'b010100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_20;
      6'b010101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_21;
      6'b010110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_22;
      6'b010111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_23;
      6'b011000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_24;
      6'b011001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_25;
      6'b011010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_26;
      6'b011011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_27;
      6'b011100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_28;
      6'b011101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_29;
      6'b011110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_30;
      6'b011111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_31;
      6'b100000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_32;
      6'b100001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_33;
      6'b100010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_34;
      6'b100011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_35;
      6'b100100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_36;
      6'b100101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_37;
      6'b100110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_38;
      6'b100111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_39;
      6'b101000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_40;
      6'b101001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_41;
      6'b101010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_42;
      6'b101011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_43;
      6'b101100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_44;
      6'b101101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_45;
      6'b101110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_46;
      6'b101111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_47;
      6'b110000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_48;
      6'b110001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_49;
      6'b110010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_50;
      6'b110011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_51;
      6'b110100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_52;
      6'b110101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_53;
      6'b110110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_54;
      6'b110111 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_55;
      6'b111000 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_56;
      6'b111001 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_57;
      6'b111010 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_58;
      6'b111011 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_59;
      6'b111100 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_60;
      6'b111101 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_61;
      6'b111110 : tmp_RAS_ras_predict_pc = RAS_ras_regfile_62;
      default : tmp_RAS_ras_predict_pc = RAS_ras_regfile_63;
    endcase
  end

  assign GSHARE_predict_index = (predict_pc[8 : 2] ^ GSHARE_global_branch_history); // @ BaseType.scala l299
  assign GSHARE_train_index = (train_pc[8 : 2] ^ train_history); // @ BaseType.scala l299
  assign GSHARE_pht_predict_taken = tmp_GSHARE_pht_predict_taken[1]; // @ BaseType.scala l305
  assign tmp_1 = ({127'd0,1'b1} <<< GSHARE_train_index); // @ BaseType.scala l299
  assign tmp_2 = tmp_1[0]; // @ BaseType.scala l305
  assign tmp_3 = tmp_1[1]; // @ BaseType.scala l305
  assign tmp_4 = tmp_1[2]; // @ BaseType.scala l305
  assign tmp_5 = tmp_1[3]; // @ BaseType.scala l305
  assign tmp_6 = tmp_1[4]; // @ BaseType.scala l305
  assign tmp_7 = tmp_1[5]; // @ BaseType.scala l305
  assign tmp_8 = tmp_1[6]; // @ BaseType.scala l305
  assign tmp_9 = tmp_1[7]; // @ BaseType.scala l305
  assign tmp_10 = tmp_1[8]; // @ BaseType.scala l305
  assign tmp_11 = tmp_1[9]; // @ BaseType.scala l305
  assign tmp_12 = tmp_1[10]; // @ BaseType.scala l305
  assign tmp_13 = tmp_1[11]; // @ BaseType.scala l305
  assign tmp_14 = tmp_1[12]; // @ BaseType.scala l305
  assign tmp_15 = tmp_1[13]; // @ BaseType.scala l305
  assign tmp_16 = tmp_1[14]; // @ BaseType.scala l305
  assign tmp_17 = tmp_1[15]; // @ BaseType.scala l305
  assign tmp_18 = tmp_1[16]; // @ BaseType.scala l305
  assign tmp_19 = tmp_1[17]; // @ BaseType.scala l305
  assign tmp_20 = tmp_1[18]; // @ BaseType.scala l305
  assign tmp_21 = tmp_1[19]; // @ BaseType.scala l305
  assign tmp_22 = tmp_1[20]; // @ BaseType.scala l305
  assign tmp_23 = tmp_1[21]; // @ BaseType.scala l305
  assign tmp_24 = tmp_1[22]; // @ BaseType.scala l305
  assign tmp_25 = tmp_1[23]; // @ BaseType.scala l305
  assign tmp_26 = tmp_1[24]; // @ BaseType.scala l305
  assign tmp_27 = tmp_1[25]; // @ BaseType.scala l305
  assign tmp_28 = tmp_1[26]; // @ BaseType.scala l305
  assign tmp_29 = tmp_1[27]; // @ BaseType.scala l305
  assign tmp_30 = tmp_1[28]; // @ BaseType.scala l305
  assign tmp_31 = tmp_1[29]; // @ BaseType.scala l305
  assign tmp_32 = tmp_1[30]; // @ BaseType.scala l305
  assign tmp_33 = tmp_1[31]; // @ BaseType.scala l305
  assign tmp_34 = tmp_1[32]; // @ BaseType.scala l305
  assign tmp_35 = tmp_1[33]; // @ BaseType.scala l305
  assign tmp_36 = tmp_1[34]; // @ BaseType.scala l305
  assign tmp_37 = tmp_1[35]; // @ BaseType.scala l305
  assign tmp_38 = tmp_1[36]; // @ BaseType.scala l305
  assign tmp_39 = tmp_1[37]; // @ BaseType.scala l305
  assign tmp_40 = tmp_1[38]; // @ BaseType.scala l305
  assign tmp_41 = tmp_1[39]; // @ BaseType.scala l305
  assign tmp_42 = tmp_1[40]; // @ BaseType.scala l305
  assign tmp_43 = tmp_1[41]; // @ BaseType.scala l305
  assign tmp_44 = tmp_1[42]; // @ BaseType.scala l305
  assign tmp_45 = tmp_1[43]; // @ BaseType.scala l305
  assign tmp_46 = tmp_1[44]; // @ BaseType.scala l305
  assign tmp_47 = tmp_1[45]; // @ BaseType.scala l305
  assign tmp_48 = tmp_1[46]; // @ BaseType.scala l305
  assign tmp_49 = tmp_1[47]; // @ BaseType.scala l305
  assign tmp_50 = tmp_1[48]; // @ BaseType.scala l305
  assign tmp_51 = tmp_1[49]; // @ BaseType.scala l305
  assign tmp_52 = tmp_1[50]; // @ BaseType.scala l305
  assign tmp_53 = tmp_1[51]; // @ BaseType.scala l305
  assign tmp_54 = tmp_1[52]; // @ BaseType.scala l305
  assign tmp_55 = tmp_1[53]; // @ BaseType.scala l305
  assign tmp_56 = tmp_1[54]; // @ BaseType.scala l305
  assign tmp_57 = tmp_1[55]; // @ BaseType.scala l305
  assign tmp_58 = tmp_1[56]; // @ BaseType.scala l305
  assign tmp_59 = tmp_1[57]; // @ BaseType.scala l305
  assign tmp_60 = tmp_1[58]; // @ BaseType.scala l305
  assign tmp_61 = tmp_1[59]; // @ BaseType.scala l305
  assign tmp_62 = tmp_1[60]; // @ BaseType.scala l305
  assign tmp_63 = tmp_1[61]; // @ BaseType.scala l305
  assign tmp_64 = tmp_1[62]; // @ BaseType.scala l305
  assign tmp_65 = tmp_1[63]; // @ BaseType.scala l305
  assign tmp_66 = tmp_1[64]; // @ BaseType.scala l305
  assign tmp_67 = tmp_1[65]; // @ BaseType.scala l305
  assign tmp_68 = tmp_1[66]; // @ BaseType.scala l305
  assign tmp_69 = tmp_1[67]; // @ BaseType.scala l305
  assign tmp_70 = tmp_1[68]; // @ BaseType.scala l305
  assign tmp_71 = tmp_1[69]; // @ BaseType.scala l305
  assign tmp_72 = tmp_1[70]; // @ BaseType.scala l305
  assign tmp_73 = tmp_1[71]; // @ BaseType.scala l305
  assign tmp_74 = tmp_1[72]; // @ BaseType.scala l305
  assign tmp_75 = tmp_1[73]; // @ BaseType.scala l305
  assign tmp_76 = tmp_1[74]; // @ BaseType.scala l305
  assign tmp_77 = tmp_1[75]; // @ BaseType.scala l305
  assign tmp_78 = tmp_1[76]; // @ BaseType.scala l305
  assign tmp_79 = tmp_1[77]; // @ BaseType.scala l305
  assign tmp_80 = tmp_1[78]; // @ BaseType.scala l305
  assign tmp_81 = tmp_1[79]; // @ BaseType.scala l305
  assign tmp_82 = tmp_1[80]; // @ BaseType.scala l305
  assign tmp_83 = tmp_1[81]; // @ BaseType.scala l305
  assign tmp_84 = tmp_1[82]; // @ BaseType.scala l305
  assign tmp_85 = tmp_1[83]; // @ BaseType.scala l305
  assign tmp_86 = tmp_1[84]; // @ BaseType.scala l305
  assign tmp_87 = tmp_1[85]; // @ BaseType.scala l305
  assign tmp_88 = tmp_1[86]; // @ BaseType.scala l305
  assign tmp_89 = tmp_1[87]; // @ BaseType.scala l305
  assign tmp_90 = tmp_1[88]; // @ BaseType.scala l305
  assign tmp_91 = tmp_1[89]; // @ BaseType.scala l305
  assign tmp_92 = tmp_1[90]; // @ BaseType.scala l305
  assign tmp_93 = tmp_1[91]; // @ BaseType.scala l305
  assign tmp_94 = tmp_1[92]; // @ BaseType.scala l305
  assign tmp_95 = tmp_1[93]; // @ BaseType.scala l305
  assign tmp_96 = tmp_1[94]; // @ BaseType.scala l305
  assign tmp_97 = tmp_1[95]; // @ BaseType.scala l305
  assign tmp_98 = tmp_1[96]; // @ BaseType.scala l305
  assign tmp_99 = tmp_1[97]; // @ BaseType.scala l305
  assign tmp_100 = tmp_1[98]; // @ BaseType.scala l305
  assign tmp_101 = tmp_1[99]; // @ BaseType.scala l305
  assign tmp_102 = tmp_1[100]; // @ BaseType.scala l305
  assign tmp_103 = tmp_1[101]; // @ BaseType.scala l305
  assign tmp_104 = tmp_1[102]; // @ BaseType.scala l305
  assign tmp_105 = tmp_1[103]; // @ BaseType.scala l305
  assign tmp_106 = tmp_1[104]; // @ BaseType.scala l305
  assign tmp_107 = tmp_1[105]; // @ BaseType.scala l305
  assign tmp_108 = tmp_1[106]; // @ BaseType.scala l305
  assign tmp_109 = tmp_1[107]; // @ BaseType.scala l305
  assign tmp_110 = tmp_1[108]; // @ BaseType.scala l305
  assign tmp_111 = tmp_1[109]; // @ BaseType.scala l305
  assign tmp_112 = tmp_1[110]; // @ BaseType.scala l305
  assign tmp_113 = tmp_1[111]; // @ BaseType.scala l305
  assign tmp_114 = tmp_1[112]; // @ BaseType.scala l305
  assign tmp_115 = tmp_1[113]; // @ BaseType.scala l305
  assign tmp_116 = tmp_1[114]; // @ BaseType.scala l305
  assign tmp_117 = tmp_1[115]; // @ BaseType.scala l305
  assign tmp_118 = tmp_1[116]; // @ BaseType.scala l305
  assign tmp_119 = tmp_1[117]; // @ BaseType.scala l305
  assign tmp_120 = tmp_1[118]; // @ BaseType.scala l305
  assign tmp_121 = tmp_1[119]; // @ BaseType.scala l305
  assign tmp_122 = tmp_1[120]; // @ BaseType.scala l305
  assign tmp_123 = tmp_1[121]; // @ BaseType.scala l305
  assign tmp_124 = tmp_1[122]; // @ BaseType.scala l305
  assign tmp_125 = tmp_1[123]; // @ BaseType.scala l305
  assign tmp_126 = tmp_1[124]; // @ BaseType.scala l305
  assign tmp_127 = tmp_1[125]; // @ BaseType.scala l305
  assign tmp_128 = tmp_1[126]; // @ BaseType.scala l305
  assign tmp_129 = tmp_1[127]; // @ BaseType.scala l305
  always @(*) begin
    BTB_is_matched = 1'b0; // @ Predictor.scala l87
    if(tmp_when) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_1) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_2) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_3) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_4) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_5) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_6) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_7) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_8) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_9) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_10) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_11) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_12) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_13) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_14) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_15) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_16) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_17) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_18) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_19) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_20) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_21) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_22) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_23) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_24) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_25) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_26) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_27) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_28) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_29) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_30) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_31) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_32) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_33) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_34) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_35) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_36) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_37) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_38) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_39) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_40) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_41) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_42) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_43) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_44) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_45) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_46) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_47) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_48) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_49) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_50) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_51) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_52) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_53) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_54) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_55) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_56) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_57) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_58) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_59) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_60) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_61) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_62) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
    if(tmp_when_63) begin
      BTB_is_matched = 1'b1; // @ Predictor.scala l96
    end
  end

  always @(*) begin
    BTB_is_call = 1'b0; // @ Predictor.scala l88
    if(tmp_when) begin
      BTB_is_call = BTB_call[0]; // @ Predictor.scala l97
    end
    if(tmp_when_1) begin
      BTB_is_call = BTB_call[1]; // @ Predictor.scala l97
    end
    if(tmp_when_2) begin
      BTB_is_call = BTB_call[2]; // @ Predictor.scala l97
    end
    if(tmp_when_3) begin
      BTB_is_call = BTB_call[3]; // @ Predictor.scala l97
    end
    if(tmp_when_4) begin
      BTB_is_call = BTB_call[4]; // @ Predictor.scala l97
    end
    if(tmp_when_5) begin
      BTB_is_call = BTB_call[5]; // @ Predictor.scala l97
    end
    if(tmp_when_6) begin
      BTB_is_call = BTB_call[6]; // @ Predictor.scala l97
    end
    if(tmp_when_7) begin
      BTB_is_call = BTB_call[7]; // @ Predictor.scala l97
    end
    if(tmp_when_8) begin
      BTB_is_call = BTB_call[8]; // @ Predictor.scala l97
    end
    if(tmp_when_9) begin
      BTB_is_call = BTB_call[9]; // @ Predictor.scala l97
    end
    if(tmp_when_10) begin
      BTB_is_call = BTB_call[10]; // @ Predictor.scala l97
    end
    if(tmp_when_11) begin
      BTB_is_call = BTB_call[11]; // @ Predictor.scala l97
    end
    if(tmp_when_12) begin
      BTB_is_call = BTB_call[12]; // @ Predictor.scala l97
    end
    if(tmp_when_13) begin
      BTB_is_call = BTB_call[13]; // @ Predictor.scala l97
    end
    if(tmp_when_14) begin
      BTB_is_call = BTB_call[14]; // @ Predictor.scala l97
    end
    if(tmp_when_15) begin
      BTB_is_call = BTB_call[15]; // @ Predictor.scala l97
    end
    if(tmp_when_16) begin
      BTB_is_call = BTB_call[16]; // @ Predictor.scala l97
    end
    if(tmp_when_17) begin
      BTB_is_call = BTB_call[17]; // @ Predictor.scala l97
    end
    if(tmp_when_18) begin
      BTB_is_call = BTB_call[18]; // @ Predictor.scala l97
    end
    if(tmp_when_19) begin
      BTB_is_call = BTB_call[19]; // @ Predictor.scala l97
    end
    if(tmp_when_20) begin
      BTB_is_call = BTB_call[20]; // @ Predictor.scala l97
    end
    if(tmp_when_21) begin
      BTB_is_call = BTB_call[21]; // @ Predictor.scala l97
    end
    if(tmp_when_22) begin
      BTB_is_call = BTB_call[22]; // @ Predictor.scala l97
    end
    if(tmp_when_23) begin
      BTB_is_call = BTB_call[23]; // @ Predictor.scala l97
    end
    if(tmp_when_24) begin
      BTB_is_call = BTB_call[24]; // @ Predictor.scala l97
    end
    if(tmp_when_25) begin
      BTB_is_call = BTB_call[25]; // @ Predictor.scala l97
    end
    if(tmp_when_26) begin
      BTB_is_call = BTB_call[26]; // @ Predictor.scala l97
    end
    if(tmp_when_27) begin
      BTB_is_call = BTB_call[27]; // @ Predictor.scala l97
    end
    if(tmp_when_28) begin
      BTB_is_call = BTB_call[28]; // @ Predictor.scala l97
    end
    if(tmp_when_29) begin
      BTB_is_call = BTB_call[29]; // @ Predictor.scala l97
    end
    if(tmp_when_30) begin
      BTB_is_call = BTB_call[30]; // @ Predictor.scala l97
    end
    if(tmp_when_31) begin
      BTB_is_call = BTB_call[31]; // @ Predictor.scala l97
    end
    if(tmp_when_32) begin
      BTB_is_call = BTB_call[32]; // @ Predictor.scala l97
    end
    if(tmp_when_33) begin
      BTB_is_call = BTB_call[33]; // @ Predictor.scala l97
    end
    if(tmp_when_34) begin
      BTB_is_call = BTB_call[34]; // @ Predictor.scala l97
    end
    if(tmp_when_35) begin
      BTB_is_call = BTB_call[35]; // @ Predictor.scala l97
    end
    if(tmp_when_36) begin
      BTB_is_call = BTB_call[36]; // @ Predictor.scala l97
    end
    if(tmp_when_37) begin
      BTB_is_call = BTB_call[37]; // @ Predictor.scala l97
    end
    if(tmp_when_38) begin
      BTB_is_call = BTB_call[38]; // @ Predictor.scala l97
    end
    if(tmp_when_39) begin
      BTB_is_call = BTB_call[39]; // @ Predictor.scala l97
    end
    if(tmp_when_40) begin
      BTB_is_call = BTB_call[40]; // @ Predictor.scala l97
    end
    if(tmp_when_41) begin
      BTB_is_call = BTB_call[41]; // @ Predictor.scala l97
    end
    if(tmp_when_42) begin
      BTB_is_call = BTB_call[42]; // @ Predictor.scala l97
    end
    if(tmp_when_43) begin
      BTB_is_call = BTB_call[43]; // @ Predictor.scala l97
    end
    if(tmp_when_44) begin
      BTB_is_call = BTB_call[44]; // @ Predictor.scala l97
    end
    if(tmp_when_45) begin
      BTB_is_call = BTB_call[45]; // @ Predictor.scala l97
    end
    if(tmp_when_46) begin
      BTB_is_call = BTB_call[46]; // @ Predictor.scala l97
    end
    if(tmp_when_47) begin
      BTB_is_call = BTB_call[47]; // @ Predictor.scala l97
    end
    if(tmp_when_48) begin
      BTB_is_call = BTB_call[48]; // @ Predictor.scala l97
    end
    if(tmp_when_49) begin
      BTB_is_call = BTB_call[49]; // @ Predictor.scala l97
    end
    if(tmp_when_50) begin
      BTB_is_call = BTB_call[50]; // @ Predictor.scala l97
    end
    if(tmp_when_51) begin
      BTB_is_call = BTB_call[51]; // @ Predictor.scala l97
    end
    if(tmp_when_52) begin
      BTB_is_call = BTB_call[52]; // @ Predictor.scala l97
    end
    if(tmp_when_53) begin
      BTB_is_call = BTB_call[53]; // @ Predictor.scala l97
    end
    if(tmp_when_54) begin
      BTB_is_call = BTB_call[54]; // @ Predictor.scala l97
    end
    if(tmp_when_55) begin
      BTB_is_call = BTB_call[55]; // @ Predictor.scala l97
    end
    if(tmp_when_56) begin
      BTB_is_call = BTB_call[56]; // @ Predictor.scala l97
    end
    if(tmp_when_57) begin
      BTB_is_call = BTB_call[57]; // @ Predictor.scala l97
    end
    if(tmp_when_58) begin
      BTB_is_call = BTB_call[58]; // @ Predictor.scala l97
    end
    if(tmp_when_59) begin
      BTB_is_call = BTB_call[59]; // @ Predictor.scala l97
    end
    if(tmp_when_60) begin
      BTB_is_call = BTB_call[60]; // @ Predictor.scala l97
    end
    if(tmp_when_61) begin
      BTB_is_call = BTB_call[61]; // @ Predictor.scala l97
    end
    if(tmp_when_62) begin
      BTB_is_call = BTB_call[62]; // @ Predictor.scala l97
    end
    if(tmp_when_63) begin
      BTB_is_call = BTB_call[63]; // @ Predictor.scala l97
    end
  end

  always @(*) begin
    BTB_is_ret = 1'b0; // @ Predictor.scala l89
    if(tmp_when) begin
      BTB_is_ret = BTB_ret[0]; // @ Predictor.scala l98
    end
    if(tmp_when_1) begin
      BTB_is_ret = BTB_ret[1]; // @ Predictor.scala l98
    end
    if(tmp_when_2) begin
      BTB_is_ret = BTB_ret[2]; // @ Predictor.scala l98
    end
    if(tmp_when_3) begin
      BTB_is_ret = BTB_ret[3]; // @ Predictor.scala l98
    end
    if(tmp_when_4) begin
      BTB_is_ret = BTB_ret[4]; // @ Predictor.scala l98
    end
    if(tmp_when_5) begin
      BTB_is_ret = BTB_ret[5]; // @ Predictor.scala l98
    end
    if(tmp_when_6) begin
      BTB_is_ret = BTB_ret[6]; // @ Predictor.scala l98
    end
    if(tmp_when_7) begin
      BTB_is_ret = BTB_ret[7]; // @ Predictor.scala l98
    end
    if(tmp_when_8) begin
      BTB_is_ret = BTB_ret[8]; // @ Predictor.scala l98
    end
    if(tmp_when_9) begin
      BTB_is_ret = BTB_ret[9]; // @ Predictor.scala l98
    end
    if(tmp_when_10) begin
      BTB_is_ret = BTB_ret[10]; // @ Predictor.scala l98
    end
    if(tmp_when_11) begin
      BTB_is_ret = BTB_ret[11]; // @ Predictor.scala l98
    end
    if(tmp_when_12) begin
      BTB_is_ret = BTB_ret[12]; // @ Predictor.scala l98
    end
    if(tmp_when_13) begin
      BTB_is_ret = BTB_ret[13]; // @ Predictor.scala l98
    end
    if(tmp_when_14) begin
      BTB_is_ret = BTB_ret[14]; // @ Predictor.scala l98
    end
    if(tmp_when_15) begin
      BTB_is_ret = BTB_ret[15]; // @ Predictor.scala l98
    end
    if(tmp_when_16) begin
      BTB_is_ret = BTB_ret[16]; // @ Predictor.scala l98
    end
    if(tmp_when_17) begin
      BTB_is_ret = BTB_ret[17]; // @ Predictor.scala l98
    end
    if(tmp_when_18) begin
      BTB_is_ret = BTB_ret[18]; // @ Predictor.scala l98
    end
    if(tmp_when_19) begin
      BTB_is_ret = BTB_ret[19]; // @ Predictor.scala l98
    end
    if(tmp_when_20) begin
      BTB_is_ret = BTB_ret[20]; // @ Predictor.scala l98
    end
    if(tmp_when_21) begin
      BTB_is_ret = BTB_ret[21]; // @ Predictor.scala l98
    end
    if(tmp_when_22) begin
      BTB_is_ret = BTB_ret[22]; // @ Predictor.scala l98
    end
    if(tmp_when_23) begin
      BTB_is_ret = BTB_ret[23]; // @ Predictor.scala l98
    end
    if(tmp_when_24) begin
      BTB_is_ret = BTB_ret[24]; // @ Predictor.scala l98
    end
    if(tmp_when_25) begin
      BTB_is_ret = BTB_ret[25]; // @ Predictor.scala l98
    end
    if(tmp_when_26) begin
      BTB_is_ret = BTB_ret[26]; // @ Predictor.scala l98
    end
    if(tmp_when_27) begin
      BTB_is_ret = BTB_ret[27]; // @ Predictor.scala l98
    end
    if(tmp_when_28) begin
      BTB_is_ret = BTB_ret[28]; // @ Predictor.scala l98
    end
    if(tmp_when_29) begin
      BTB_is_ret = BTB_ret[29]; // @ Predictor.scala l98
    end
    if(tmp_when_30) begin
      BTB_is_ret = BTB_ret[30]; // @ Predictor.scala l98
    end
    if(tmp_when_31) begin
      BTB_is_ret = BTB_ret[31]; // @ Predictor.scala l98
    end
    if(tmp_when_32) begin
      BTB_is_ret = BTB_ret[32]; // @ Predictor.scala l98
    end
    if(tmp_when_33) begin
      BTB_is_ret = BTB_ret[33]; // @ Predictor.scala l98
    end
    if(tmp_when_34) begin
      BTB_is_ret = BTB_ret[34]; // @ Predictor.scala l98
    end
    if(tmp_when_35) begin
      BTB_is_ret = BTB_ret[35]; // @ Predictor.scala l98
    end
    if(tmp_when_36) begin
      BTB_is_ret = BTB_ret[36]; // @ Predictor.scala l98
    end
    if(tmp_when_37) begin
      BTB_is_ret = BTB_ret[37]; // @ Predictor.scala l98
    end
    if(tmp_when_38) begin
      BTB_is_ret = BTB_ret[38]; // @ Predictor.scala l98
    end
    if(tmp_when_39) begin
      BTB_is_ret = BTB_ret[39]; // @ Predictor.scala l98
    end
    if(tmp_when_40) begin
      BTB_is_ret = BTB_ret[40]; // @ Predictor.scala l98
    end
    if(tmp_when_41) begin
      BTB_is_ret = BTB_ret[41]; // @ Predictor.scala l98
    end
    if(tmp_when_42) begin
      BTB_is_ret = BTB_ret[42]; // @ Predictor.scala l98
    end
    if(tmp_when_43) begin
      BTB_is_ret = BTB_ret[43]; // @ Predictor.scala l98
    end
    if(tmp_when_44) begin
      BTB_is_ret = BTB_ret[44]; // @ Predictor.scala l98
    end
    if(tmp_when_45) begin
      BTB_is_ret = BTB_ret[45]; // @ Predictor.scala l98
    end
    if(tmp_when_46) begin
      BTB_is_ret = BTB_ret[46]; // @ Predictor.scala l98
    end
    if(tmp_when_47) begin
      BTB_is_ret = BTB_ret[47]; // @ Predictor.scala l98
    end
    if(tmp_when_48) begin
      BTB_is_ret = BTB_ret[48]; // @ Predictor.scala l98
    end
    if(tmp_when_49) begin
      BTB_is_ret = BTB_ret[49]; // @ Predictor.scala l98
    end
    if(tmp_when_50) begin
      BTB_is_ret = BTB_ret[50]; // @ Predictor.scala l98
    end
    if(tmp_when_51) begin
      BTB_is_ret = BTB_ret[51]; // @ Predictor.scala l98
    end
    if(tmp_when_52) begin
      BTB_is_ret = BTB_ret[52]; // @ Predictor.scala l98
    end
    if(tmp_when_53) begin
      BTB_is_ret = BTB_ret[53]; // @ Predictor.scala l98
    end
    if(tmp_when_54) begin
      BTB_is_ret = BTB_ret[54]; // @ Predictor.scala l98
    end
    if(tmp_when_55) begin
      BTB_is_ret = BTB_ret[55]; // @ Predictor.scala l98
    end
    if(tmp_when_56) begin
      BTB_is_ret = BTB_ret[56]; // @ Predictor.scala l98
    end
    if(tmp_when_57) begin
      BTB_is_ret = BTB_ret[57]; // @ Predictor.scala l98
    end
    if(tmp_when_58) begin
      BTB_is_ret = BTB_ret[58]; // @ Predictor.scala l98
    end
    if(tmp_when_59) begin
      BTB_is_ret = BTB_ret[59]; // @ Predictor.scala l98
    end
    if(tmp_when_60) begin
      BTB_is_ret = BTB_ret[60]; // @ Predictor.scala l98
    end
    if(tmp_when_61) begin
      BTB_is_ret = BTB_ret[61]; // @ Predictor.scala l98
    end
    if(tmp_when_62) begin
      BTB_is_ret = BTB_ret[62]; // @ Predictor.scala l98
    end
    if(tmp_when_63) begin
      BTB_is_ret = BTB_ret[63]; // @ Predictor.scala l98
    end
  end

  always @(*) begin
    BTB_is_jmp = 1'b0; // @ Predictor.scala l90
    if(tmp_when) begin
      BTB_is_jmp = BTB_jmp[0]; // @ Predictor.scala l99
    end
    if(tmp_when_1) begin
      BTB_is_jmp = BTB_jmp[1]; // @ Predictor.scala l99
    end
    if(tmp_when_2) begin
      BTB_is_jmp = BTB_jmp[2]; // @ Predictor.scala l99
    end
    if(tmp_when_3) begin
      BTB_is_jmp = BTB_jmp[3]; // @ Predictor.scala l99
    end
    if(tmp_when_4) begin
      BTB_is_jmp = BTB_jmp[4]; // @ Predictor.scala l99
    end
    if(tmp_when_5) begin
      BTB_is_jmp = BTB_jmp[5]; // @ Predictor.scala l99
    end
    if(tmp_when_6) begin
      BTB_is_jmp = BTB_jmp[6]; // @ Predictor.scala l99
    end
    if(tmp_when_7) begin
      BTB_is_jmp = BTB_jmp[7]; // @ Predictor.scala l99
    end
    if(tmp_when_8) begin
      BTB_is_jmp = BTB_jmp[8]; // @ Predictor.scala l99
    end
    if(tmp_when_9) begin
      BTB_is_jmp = BTB_jmp[9]; // @ Predictor.scala l99
    end
    if(tmp_when_10) begin
      BTB_is_jmp = BTB_jmp[10]; // @ Predictor.scala l99
    end
    if(tmp_when_11) begin
      BTB_is_jmp = BTB_jmp[11]; // @ Predictor.scala l99
    end
    if(tmp_when_12) begin
      BTB_is_jmp = BTB_jmp[12]; // @ Predictor.scala l99
    end
    if(tmp_when_13) begin
      BTB_is_jmp = BTB_jmp[13]; // @ Predictor.scala l99
    end
    if(tmp_when_14) begin
      BTB_is_jmp = BTB_jmp[14]; // @ Predictor.scala l99
    end
    if(tmp_when_15) begin
      BTB_is_jmp = BTB_jmp[15]; // @ Predictor.scala l99
    end
    if(tmp_when_16) begin
      BTB_is_jmp = BTB_jmp[16]; // @ Predictor.scala l99
    end
    if(tmp_when_17) begin
      BTB_is_jmp = BTB_jmp[17]; // @ Predictor.scala l99
    end
    if(tmp_when_18) begin
      BTB_is_jmp = BTB_jmp[18]; // @ Predictor.scala l99
    end
    if(tmp_when_19) begin
      BTB_is_jmp = BTB_jmp[19]; // @ Predictor.scala l99
    end
    if(tmp_when_20) begin
      BTB_is_jmp = BTB_jmp[20]; // @ Predictor.scala l99
    end
    if(tmp_when_21) begin
      BTB_is_jmp = BTB_jmp[21]; // @ Predictor.scala l99
    end
    if(tmp_when_22) begin
      BTB_is_jmp = BTB_jmp[22]; // @ Predictor.scala l99
    end
    if(tmp_when_23) begin
      BTB_is_jmp = BTB_jmp[23]; // @ Predictor.scala l99
    end
    if(tmp_when_24) begin
      BTB_is_jmp = BTB_jmp[24]; // @ Predictor.scala l99
    end
    if(tmp_when_25) begin
      BTB_is_jmp = BTB_jmp[25]; // @ Predictor.scala l99
    end
    if(tmp_when_26) begin
      BTB_is_jmp = BTB_jmp[26]; // @ Predictor.scala l99
    end
    if(tmp_when_27) begin
      BTB_is_jmp = BTB_jmp[27]; // @ Predictor.scala l99
    end
    if(tmp_when_28) begin
      BTB_is_jmp = BTB_jmp[28]; // @ Predictor.scala l99
    end
    if(tmp_when_29) begin
      BTB_is_jmp = BTB_jmp[29]; // @ Predictor.scala l99
    end
    if(tmp_when_30) begin
      BTB_is_jmp = BTB_jmp[30]; // @ Predictor.scala l99
    end
    if(tmp_when_31) begin
      BTB_is_jmp = BTB_jmp[31]; // @ Predictor.scala l99
    end
    if(tmp_when_32) begin
      BTB_is_jmp = BTB_jmp[32]; // @ Predictor.scala l99
    end
    if(tmp_when_33) begin
      BTB_is_jmp = BTB_jmp[33]; // @ Predictor.scala l99
    end
    if(tmp_when_34) begin
      BTB_is_jmp = BTB_jmp[34]; // @ Predictor.scala l99
    end
    if(tmp_when_35) begin
      BTB_is_jmp = BTB_jmp[35]; // @ Predictor.scala l99
    end
    if(tmp_when_36) begin
      BTB_is_jmp = BTB_jmp[36]; // @ Predictor.scala l99
    end
    if(tmp_when_37) begin
      BTB_is_jmp = BTB_jmp[37]; // @ Predictor.scala l99
    end
    if(tmp_when_38) begin
      BTB_is_jmp = BTB_jmp[38]; // @ Predictor.scala l99
    end
    if(tmp_when_39) begin
      BTB_is_jmp = BTB_jmp[39]; // @ Predictor.scala l99
    end
    if(tmp_when_40) begin
      BTB_is_jmp = BTB_jmp[40]; // @ Predictor.scala l99
    end
    if(tmp_when_41) begin
      BTB_is_jmp = BTB_jmp[41]; // @ Predictor.scala l99
    end
    if(tmp_when_42) begin
      BTB_is_jmp = BTB_jmp[42]; // @ Predictor.scala l99
    end
    if(tmp_when_43) begin
      BTB_is_jmp = BTB_jmp[43]; // @ Predictor.scala l99
    end
    if(tmp_when_44) begin
      BTB_is_jmp = BTB_jmp[44]; // @ Predictor.scala l99
    end
    if(tmp_when_45) begin
      BTB_is_jmp = BTB_jmp[45]; // @ Predictor.scala l99
    end
    if(tmp_when_46) begin
      BTB_is_jmp = BTB_jmp[46]; // @ Predictor.scala l99
    end
    if(tmp_when_47) begin
      BTB_is_jmp = BTB_jmp[47]; // @ Predictor.scala l99
    end
    if(tmp_when_48) begin
      BTB_is_jmp = BTB_jmp[48]; // @ Predictor.scala l99
    end
    if(tmp_when_49) begin
      BTB_is_jmp = BTB_jmp[49]; // @ Predictor.scala l99
    end
    if(tmp_when_50) begin
      BTB_is_jmp = BTB_jmp[50]; // @ Predictor.scala l99
    end
    if(tmp_when_51) begin
      BTB_is_jmp = BTB_jmp[51]; // @ Predictor.scala l99
    end
    if(tmp_when_52) begin
      BTB_is_jmp = BTB_jmp[52]; // @ Predictor.scala l99
    end
    if(tmp_when_53) begin
      BTB_is_jmp = BTB_jmp[53]; // @ Predictor.scala l99
    end
    if(tmp_when_54) begin
      BTB_is_jmp = BTB_jmp[54]; // @ Predictor.scala l99
    end
    if(tmp_when_55) begin
      BTB_is_jmp = BTB_jmp[55]; // @ Predictor.scala l99
    end
    if(tmp_when_56) begin
      BTB_is_jmp = BTB_jmp[56]; // @ Predictor.scala l99
    end
    if(tmp_when_57) begin
      BTB_is_jmp = BTB_jmp[57]; // @ Predictor.scala l99
    end
    if(tmp_when_58) begin
      BTB_is_jmp = BTB_jmp[58]; // @ Predictor.scala l99
    end
    if(tmp_when_59) begin
      BTB_is_jmp = BTB_jmp[59]; // @ Predictor.scala l99
    end
    if(tmp_when_60) begin
      BTB_is_jmp = BTB_jmp[60]; // @ Predictor.scala l99
    end
    if(tmp_when_61) begin
      BTB_is_jmp = BTB_jmp[61]; // @ Predictor.scala l99
    end
    if(tmp_when_62) begin
      BTB_is_jmp = BTB_jmp[62]; // @ Predictor.scala l99
    end
    if(tmp_when_63) begin
      BTB_is_jmp = BTB_jmp[63]; // @ Predictor.scala l99
    end
  end

  always @(*) begin
    BTB_target_pc_read = 64'h0; // @ Expression.scala l2353
    if(tmp_when) begin
      BTB_target_pc_read = BTB_target_pc_0; // @ Predictor.scala l100
    end
    if(tmp_when_1) begin
      BTB_target_pc_read = BTB_target_pc_1; // @ Predictor.scala l100
    end
    if(tmp_when_2) begin
      BTB_target_pc_read = BTB_target_pc_2; // @ Predictor.scala l100
    end
    if(tmp_when_3) begin
      BTB_target_pc_read = BTB_target_pc_3; // @ Predictor.scala l100
    end
    if(tmp_when_4) begin
      BTB_target_pc_read = BTB_target_pc_4; // @ Predictor.scala l100
    end
    if(tmp_when_5) begin
      BTB_target_pc_read = BTB_target_pc_5; // @ Predictor.scala l100
    end
    if(tmp_when_6) begin
      BTB_target_pc_read = BTB_target_pc_6; // @ Predictor.scala l100
    end
    if(tmp_when_7) begin
      BTB_target_pc_read = BTB_target_pc_7; // @ Predictor.scala l100
    end
    if(tmp_when_8) begin
      BTB_target_pc_read = BTB_target_pc_8; // @ Predictor.scala l100
    end
    if(tmp_when_9) begin
      BTB_target_pc_read = BTB_target_pc_9; // @ Predictor.scala l100
    end
    if(tmp_when_10) begin
      BTB_target_pc_read = BTB_target_pc_10; // @ Predictor.scala l100
    end
    if(tmp_when_11) begin
      BTB_target_pc_read = BTB_target_pc_11; // @ Predictor.scala l100
    end
    if(tmp_when_12) begin
      BTB_target_pc_read = BTB_target_pc_12; // @ Predictor.scala l100
    end
    if(tmp_when_13) begin
      BTB_target_pc_read = BTB_target_pc_13; // @ Predictor.scala l100
    end
    if(tmp_when_14) begin
      BTB_target_pc_read = BTB_target_pc_14; // @ Predictor.scala l100
    end
    if(tmp_when_15) begin
      BTB_target_pc_read = BTB_target_pc_15; // @ Predictor.scala l100
    end
    if(tmp_when_16) begin
      BTB_target_pc_read = BTB_target_pc_16; // @ Predictor.scala l100
    end
    if(tmp_when_17) begin
      BTB_target_pc_read = BTB_target_pc_17; // @ Predictor.scala l100
    end
    if(tmp_when_18) begin
      BTB_target_pc_read = BTB_target_pc_18; // @ Predictor.scala l100
    end
    if(tmp_when_19) begin
      BTB_target_pc_read = BTB_target_pc_19; // @ Predictor.scala l100
    end
    if(tmp_when_20) begin
      BTB_target_pc_read = BTB_target_pc_20; // @ Predictor.scala l100
    end
    if(tmp_when_21) begin
      BTB_target_pc_read = BTB_target_pc_21; // @ Predictor.scala l100
    end
    if(tmp_when_22) begin
      BTB_target_pc_read = BTB_target_pc_22; // @ Predictor.scala l100
    end
    if(tmp_when_23) begin
      BTB_target_pc_read = BTB_target_pc_23; // @ Predictor.scala l100
    end
    if(tmp_when_24) begin
      BTB_target_pc_read = BTB_target_pc_24; // @ Predictor.scala l100
    end
    if(tmp_when_25) begin
      BTB_target_pc_read = BTB_target_pc_25; // @ Predictor.scala l100
    end
    if(tmp_when_26) begin
      BTB_target_pc_read = BTB_target_pc_26; // @ Predictor.scala l100
    end
    if(tmp_when_27) begin
      BTB_target_pc_read = BTB_target_pc_27; // @ Predictor.scala l100
    end
    if(tmp_when_28) begin
      BTB_target_pc_read = BTB_target_pc_28; // @ Predictor.scala l100
    end
    if(tmp_when_29) begin
      BTB_target_pc_read = BTB_target_pc_29; // @ Predictor.scala l100
    end
    if(tmp_when_30) begin
      BTB_target_pc_read = BTB_target_pc_30; // @ Predictor.scala l100
    end
    if(tmp_when_31) begin
      BTB_target_pc_read = BTB_target_pc_31; // @ Predictor.scala l100
    end
    if(tmp_when_32) begin
      BTB_target_pc_read = BTB_target_pc_32; // @ Predictor.scala l100
    end
    if(tmp_when_33) begin
      BTB_target_pc_read = BTB_target_pc_33; // @ Predictor.scala l100
    end
    if(tmp_when_34) begin
      BTB_target_pc_read = BTB_target_pc_34; // @ Predictor.scala l100
    end
    if(tmp_when_35) begin
      BTB_target_pc_read = BTB_target_pc_35; // @ Predictor.scala l100
    end
    if(tmp_when_36) begin
      BTB_target_pc_read = BTB_target_pc_36; // @ Predictor.scala l100
    end
    if(tmp_when_37) begin
      BTB_target_pc_read = BTB_target_pc_37; // @ Predictor.scala l100
    end
    if(tmp_when_38) begin
      BTB_target_pc_read = BTB_target_pc_38; // @ Predictor.scala l100
    end
    if(tmp_when_39) begin
      BTB_target_pc_read = BTB_target_pc_39; // @ Predictor.scala l100
    end
    if(tmp_when_40) begin
      BTB_target_pc_read = BTB_target_pc_40; // @ Predictor.scala l100
    end
    if(tmp_when_41) begin
      BTB_target_pc_read = BTB_target_pc_41; // @ Predictor.scala l100
    end
    if(tmp_when_42) begin
      BTB_target_pc_read = BTB_target_pc_42; // @ Predictor.scala l100
    end
    if(tmp_when_43) begin
      BTB_target_pc_read = BTB_target_pc_43; // @ Predictor.scala l100
    end
    if(tmp_when_44) begin
      BTB_target_pc_read = BTB_target_pc_44; // @ Predictor.scala l100
    end
    if(tmp_when_45) begin
      BTB_target_pc_read = BTB_target_pc_45; // @ Predictor.scala l100
    end
    if(tmp_when_46) begin
      BTB_target_pc_read = BTB_target_pc_46; // @ Predictor.scala l100
    end
    if(tmp_when_47) begin
      BTB_target_pc_read = BTB_target_pc_47; // @ Predictor.scala l100
    end
    if(tmp_when_48) begin
      BTB_target_pc_read = BTB_target_pc_48; // @ Predictor.scala l100
    end
    if(tmp_when_49) begin
      BTB_target_pc_read = BTB_target_pc_49; // @ Predictor.scala l100
    end
    if(tmp_when_50) begin
      BTB_target_pc_read = BTB_target_pc_50; // @ Predictor.scala l100
    end
    if(tmp_when_51) begin
      BTB_target_pc_read = BTB_target_pc_51; // @ Predictor.scala l100
    end
    if(tmp_when_52) begin
      BTB_target_pc_read = BTB_target_pc_52; // @ Predictor.scala l100
    end
    if(tmp_when_53) begin
      BTB_target_pc_read = BTB_target_pc_53; // @ Predictor.scala l100
    end
    if(tmp_when_54) begin
      BTB_target_pc_read = BTB_target_pc_54; // @ Predictor.scala l100
    end
    if(tmp_when_55) begin
      BTB_target_pc_read = BTB_target_pc_55; // @ Predictor.scala l100
    end
    if(tmp_when_56) begin
      BTB_target_pc_read = BTB_target_pc_56; // @ Predictor.scala l100
    end
    if(tmp_when_57) begin
      BTB_target_pc_read = BTB_target_pc_57; // @ Predictor.scala l100
    end
    if(tmp_when_58) begin
      BTB_target_pc_read = BTB_target_pc_58; // @ Predictor.scala l100
    end
    if(tmp_when_59) begin
      BTB_target_pc_read = BTB_target_pc_59; // @ Predictor.scala l100
    end
    if(tmp_when_60) begin
      BTB_target_pc_read = BTB_target_pc_60; // @ Predictor.scala l100
    end
    if(tmp_when_61) begin
      BTB_target_pc_read = BTB_target_pc_61; // @ Predictor.scala l100
    end
    if(tmp_when_62) begin
      BTB_target_pc_read = BTB_target_pc_62; // @ Predictor.scala l100
    end
    if(tmp_when_63) begin
      BTB_target_pc_read = BTB_target_pc_63; // @ Predictor.scala l100
    end
  end

  always @(*) begin
    BTB_btb_alloc_index_willIncrement = 1'b0; // @ Utils.scala l536
    if(BTB_btb_is_miss) begin
      if(!BTB_btb_alloc_index_willOverflowIfInc) begin
        BTB_btb_alloc_index_willIncrement = 1'b1; // @ Utils.scala l540
      end
    end
  end

  always @(*) begin
    BTB_btb_alloc_index_willClear = 1'b0; // @ Utils.scala l537
    if(BTB_btb_is_miss) begin
      if(BTB_btb_alloc_index_willOverflowIfInc) begin
        BTB_btb_alloc_index_willClear = 1'b1; // @ Utils.scala l539
      end
    end
  end

  assign BTB_btb_alloc_index_willOverflowIfInc = (BTB_btb_alloc_index_value == 6'h3f); // @ BaseType.scala l305
  assign BTB_btb_alloc_index_willOverflow = (BTB_btb_alloc_index_willOverflowIfInc && BTB_btb_alloc_index_willIncrement); // @ BaseType.scala l305
  always @(*) begin
    BTB_btb_alloc_index_valueNext = (BTB_btb_alloc_index_value + tmp_BTB_btb_alloc_index_valueNext); // @ Utils.scala l548
    if(BTB_btb_alloc_index_willClear) begin
      BTB_btb_alloc_index_valueNext = 6'h0; // @ Utils.scala l558
    end
  end

  assign BTB_btb_is_hit = (|{BTB_btb_is_hit_vec_63,{BTB_btb_is_hit_vec_62,{BTB_btb_is_hit_vec_61,{BTB_btb_is_hit_vec_60,{BTB_btb_is_hit_vec_59,{BTB_btb_is_hit_vec_58,{BTB_btb_is_hit_vec_57,{BTB_btb_is_hit_vec_56,{BTB_btb_is_hit_vec_55,{BTB_btb_is_hit_vec_54,{tmp_BTB_btb_is_hit,tmp_BTB_btb_is_hit_1}}}}}}}}}}}); // @ BaseType.scala l312
  assign BTB_btb_is_miss = (|{BTB_btb_is_miss_vec_63,{BTB_btb_is_miss_vec_62,{BTB_btb_is_miss_vec_61,{BTB_btb_is_miss_vec_60,{BTB_btb_is_miss_vec_59,{BTB_btb_is_miss_vec_58,{BTB_btb_is_miss_vec_57,{BTB_btb_is_miss_vec_56,{BTB_btb_is_miss_vec_55,{BTB_btb_is_miss_vec_54,{tmp_BTB_btb_is_miss,tmp_BTB_btb_is_miss_1}}}}}}}}}}}); // @ BaseType.scala l312
  always @(*) begin
    if(tmp_when_64) begin
      if(((BTB_source_pc_0 == train_pc) && BTB_valid[0])) begin
        BTB_btb_is_hit_vec_0 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_0 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_0 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_64) begin
      if(((BTB_source_pc_0 != train_pc) || (! BTB_valid[0]))) begin
        BTB_btb_is_miss_vec_0 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_0 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_0 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_65) begin
      if(((BTB_source_pc_1 == train_pc) && BTB_valid[1])) begin
        BTB_btb_is_hit_vec_1 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_1 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_1 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_65) begin
      if(((BTB_source_pc_1 != train_pc) || (! BTB_valid[1]))) begin
        BTB_btb_is_miss_vec_1 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_1 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_1 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_66) begin
      if(((BTB_source_pc_2 == train_pc) && BTB_valid[2])) begin
        BTB_btb_is_hit_vec_2 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_2 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_2 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_66) begin
      if(((BTB_source_pc_2 != train_pc) || (! BTB_valid[2]))) begin
        BTB_btb_is_miss_vec_2 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_2 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_2 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_67) begin
      if(((BTB_source_pc_3 == train_pc) && BTB_valid[3])) begin
        BTB_btb_is_hit_vec_3 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_3 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_3 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_67) begin
      if(((BTB_source_pc_3 != train_pc) || (! BTB_valid[3]))) begin
        BTB_btb_is_miss_vec_3 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_3 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_3 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_68) begin
      if(((BTB_source_pc_4 == train_pc) && BTB_valid[4])) begin
        BTB_btb_is_hit_vec_4 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_4 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_4 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_68) begin
      if(((BTB_source_pc_4 != train_pc) || (! BTB_valid[4]))) begin
        BTB_btb_is_miss_vec_4 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_4 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_4 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_69) begin
      if(((BTB_source_pc_5 == train_pc) && BTB_valid[5])) begin
        BTB_btb_is_hit_vec_5 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_5 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_5 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_69) begin
      if(((BTB_source_pc_5 != train_pc) || (! BTB_valid[5]))) begin
        BTB_btb_is_miss_vec_5 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_5 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_5 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_70) begin
      if(((BTB_source_pc_6 == train_pc) && BTB_valid[6])) begin
        BTB_btb_is_hit_vec_6 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_6 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_6 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_70) begin
      if(((BTB_source_pc_6 != train_pc) || (! BTB_valid[6]))) begin
        BTB_btb_is_miss_vec_6 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_6 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_6 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_71) begin
      if(((BTB_source_pc_7 == train_pc) && BTB_valid[7])) begin
        BTB_btb_is_hit_vec_7 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_7 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_7 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_71) begin
      if(((BTB_source_pc_7 != train_pc) || (! BTB_valid[7]))) begin
        BTB_btb_is_miss_vec_7 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_7 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_7 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_72) begin
      if(((BTB_source_pc_8 == train_pc) && BTB_valid[8])) begin
        BTB_btb_is_hit_vec_8 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_8 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_8 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_72) begin
      if(((BTB_source_pc_8 != train_pc) || (! BTB_valid[8]))) begin
        BTB_btb_is_miss_vec_8 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_8 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_8 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_73) begin
      if(((BTB_source_pc_9 == train_pc) && BTB_valid[9])) begin
        BTB_btb_is_hit_vec_9 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_9 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_9 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_73) begin
      if(((BTB_source_pc_9 != train_pc) || (! BTB_valid[9]))) begin
        BTB_btb_is_miss_vec_9 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_9 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_9 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_74) begin
      if(((BTB_source_pc_10 == train_pc) && BTB_valid[10])) begin
        BTB_btb_is_hit_vec_10 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_10 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_10 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_74) begin
      if(((BTB_source_pc_10 != train_pc) || (! BTB_valid[10]))) begin
        BTB_btb_is_miss_vec_10 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_10 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_10 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_75) begin
      if(((BTB_source_pc_11 == train_pc) && BTB_valid[11])) begin
        BTB_btb_is_hit_vec_11 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_11 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_11 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_75) begin
      if(((BTB_source_pc_11 != train_pc) || (! BTB_valid[11]))) begin
        BTB_btb_is_miss_vec_11 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_11 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_11 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_76) begin
      if(((BTB_source_pc_12 == train_pc) && BTB_valid[12])) begin
        BTB_btb_is_hit_vec_12 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_12 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_12 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_76) begin
      if(((BTB_source_pc_12 != train_pc) || (! BTB_valid[12]))) begin
        BTB_btb_is_miss_vec_12 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_12 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_12 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_77) begin
      if(((BTB_source_pc_13 == train_pc) && BTB_valid[13])) begin
        BTB_btb_is_hit_vec_13 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_13 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_13 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_77) begin
      if(((BTB_source_pc_13 != train_pc) || (! BTB_valid[13]))) begin
        BTB_btb_is_miss_vec_13 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_13 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_13 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_78) begin
      if(((BTB_source_pc_14 == train_pc) && BTB_valid[14])) begin
        BTB_btb_is_hit_vec_14 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_14 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_14 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_78) begin
      if(((BTB_source_pc_14 != train_pc) || (! BTB_valid[14]))) begin
        BTB_btb_is_miss_vec_14 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_14 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_14 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_79) begin
      if(((BTB_source_pc_15 == train_pc) && BTB_valid[15])) begin
        BTB_btb_is_hit_vec_15 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_15 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_15 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_79) begin
      if(((BTB_source_pc_15 != train_pc) || (! BTB_valid[15]))) begin
        BTB_btb_is_miss_vec_15 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_15 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_15 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_80) begin
      if(((BTB_source_pc_16 == train_pc) && BTB_valid[16])) begin
        BTB_btb_is_hit_vec_16 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_16 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_16 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_80) begin
      if(((BTB_source_pc_16 != train_pc) || (! BTB_valid[16]))) begin
        BTB_btb_is_miss_vec_16 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_16 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_16 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_81) begin
      if(((BTB_source_pc_17 == train_pc) && BTB_valid[17])) begin
        BTB_btb_is_hit_vec_17 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_17 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_17 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_81) begin
      if(((BTB_source_pc_17 != train_pc) || (! BTB_valid[17]))) begin
        BTB_btb_is_miss_vec_17 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_17 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_17 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_82) begin
      if(((BTB_source_pc_18 == train_pc) && BTB_valid[18])) begin
        BTB_btb_is_hit_vec_18 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_18 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_18 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_82) begin
      if(((BTB_source_pc_18 != train_pc) || (! BTB_valid[18]))) begin
        BTB_btb_is_miss_vec_18 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_18 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_18 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_83) begin
      if(((BTB_source_pc_19 == train_pc) && BTB_valid[19])) begin
        BTB_btb_is_hit_vec_19 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_19 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_19 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_83) begin
      if(((BTB_source_pc_19 != train_pc) || (! BTB_valid[19]))) begin
        BTB_btb_is_miss_vec_19 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_19 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_19 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_84) begin
      if(((BTB_source_pc_20 == train_pc) && BTB_valid[20])) begin
        BTB_btb_is_hit_vec_20 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_20 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_20 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_84) begin
      if(((BTB_source_pc_20 != train_pc) || (! BTB_valid[20]))) begin
        BTB_btb_is_miss_vec_20 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_20 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_20 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_85) begin
      if(((BTB_source_pc_21 == train_pc) && BTB_valid[21])) begin
        BTB_btb_is_hit_vec_21 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_21 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_21 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_85) begin
      if(((BTB_source_pc_21 != train_pc) || (! BTB_valid[21]))) begin
        BTB_btb_is_miss_vec_21 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_21 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_21 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_86) begin
      if(((BTB_source_pc_22 == train_pc) && BTB_valid[22])) begin
        BTB_btb_is_hit_vec_22 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_22 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_22 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_86) begin
      if(((BTB_source_pc_22 != train_pc) || (! BTB_valid[22]))) begin
        BTB_btb_is_miss_vec_22 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_22 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_22 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_87) begin
      if(((BTB_source_pc_23 == train_pc) && BTB_valid[23])) begin
        BTB_btb_is_hit_vec_23 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_23 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_23 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_87) begin
      if(((BTB_source_pc_23 != train_pc) || (! BTB_valid[23]))) begin
        BTB_btb_is_miss_vec_23 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_23 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_23 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_88) begin
      if(((BTB_source_pc_24 == train_pc) && BTB_valid[24])) begin
        BTB_btb_is_hit_vec_24 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_24 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_24 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_88) begin
      if(((BTB_source_pc_24 != train_pc) || (! BTB_valid[24]))) begin
        BTB_btb_is_miss_vec_24 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_24 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_24 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_89) begin
      if(((BTB_source_pc_25 == train_pc) && BTB_valid[25])) begin
        BTB_btb_is_hit_vec_25 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_25 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_25 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_89) begin
      if(((BTB_source_pc_25 != train_pc) || (! BTB_valid[25]))) begin
        BTB_btb_is_miss_vec_25 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_25 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_25 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_90) begin
      if(((BTB_source_pc_26 == train_pc) && BTB_valid[26])) begin
        BTB_btb_is_hit_vec_26 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_26 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_26 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_90) begin
      if(((BTB_source_pc_26 != train_pc) || (! BTB_valid[26]))) begin
        BTB_btb_is_miss_vec_26 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_26 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_26 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_91) begin
      if(((BTB_source_pc_27 == train_pc) && BTB_valid[27])) begin
        BTB_btb_is_hit_vec_27 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_27 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_27 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_91) begin
      if(((BTB_source_pc_27 != train_pc) || (! BTB_valid[27]))) begin
        BTB_btb_is_miss_vec_27 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_27 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_27 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_92) begin
      if(((BTB_source_pc_28 == train_pc) && BTB_valid[28])) begin
        BTB_btb_is_hit_vec_28 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_28 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_28 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_92) begin
      if(((BTB_source_pc_28 != train_pc) || (! BTB_valid[28]))) begin
        BTB_btb_is_miss_vec_28 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_28 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_28 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_93) begin
      if(((BTB_source_pc_29 == train_pc) && BTB_valid[29])) begin
        BTB_btb_is_hit_vec_29 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_29 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_29 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_93) begin
      if(((BTB_source_pc_29 != train_pc) || (! BTB_valid[29]))) begin
        BTB_btb_is_miss_vec_29 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_29 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_29 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_94) begin
      if(((BTB_source_pc_30 == train_pc) && BTB_valid[30])) begin
        BTB_btb_is_hit_vec_30 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_30 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_30 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_94) begin
      if(((BTB_source_pc_30 != train_pc) || (! BTB_valid[30]))) begin
        BTB_btb_is_miss_vec_30 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_30 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_30 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_95) begin
      if(((BTB_source_pc_31 == train_pc) && BTB_valid[31])) begin
        BTB_btb_is_hit_vec_31 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_31 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_31 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_95) begin
      if(((BTB_source_pc_31 != train_pc) || (! BTB_valid[31]))) begin
        BTB_btb_is_miss_vec_31 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_31 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_31 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_96) begin
      if(((BTB_source_pc_32 == train_pc) && BTB_valid[32])) begin
        BTB_btb_is_hit_vec_32 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_32 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_32 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_96) begin
      if(((BTB_source_pc_32 != train_pc) || (! BTB_valid[32]))) begin
        BTB_btb_is_miss_vec_32 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_32 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_32 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_97) begin
      if(((BTB_source_pc_33 == train_pc) && BTB_valid[33])) begin
        BTB_btb_is_hit_vec_33 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_33 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_33 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_97) begin
      if(((BTB_source_pc_33 != train_pc) || (! BTB_valid[33]))) begin
        BTB_btb_is_miss_vec_33 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_33 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_33 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_98) begin
      if(((BTB_source_pc_34 == train_pc) && BTB_valid[34])) begin
        BTB_btb_is_hit_vec_34 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_34 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_34 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_98) begin
      if(((BTB_source_pc_34 != train_pc) || (! BTB_valid[34]))) begin
        BTB_btb_is_miss_vec_34 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_34 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_34 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_99) begin
      if(((BTB_source_pc_35 == train_pc) && BTB_valid[35])) begin
        BTB_btb_is_hit_vec_35 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_35 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_35 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_99) begin
      if(((BTB_source_pc_35 != train_pc) || (! BTB_valid[35]))) begin
        BTB_btb_is_miss_vec_35 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_35 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_35 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_100) begin
      if(((BTB_source_pc_36 == train_pc) && BTB_valid[36])) begin
        BTB_btb_is_hit_vec_36 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_36 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_36 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_100) begin
      if(((BTB_source_pc_36 != train_pc) || (! BTB_valid[36]))) begin
        BTB_btb_is_miss_vec_36 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_36 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_36 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_101) begin
      if(((BTB_source_pc_37 == train_pc) && BTB_valid[37])) begin
        BTB_btb_is_hit_vec_37 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_37 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_37 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_101) begin
      if(((BTB_source_pc_37 != train_pc) || (! BTB_valid[37]))) begin
        BTB_btb_is_miss_vec_37 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_37 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_37 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_102) begin
      if(((BTB_source_pc_38 == train_pc) && BTB_valid[38])) begin
        BTB_btb_is_hit_vec_38 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_38 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_38 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_102) begin
      if(((BTB_source_pc_38 != train_pc) || (! BTB_valid[38]))) begin
        BTB_btb_is_miss_vec_38 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_38 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_38 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_103) begin
      if(((BTB_source_pc_39 == train_pc) && BTB_valid[39])) begin
        BTB_btb_is_hit_vec_39 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_39 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_39 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_103) begin
      if(((BTB_source_pc_39 != train_pc) || (! BTB_valid[39]))) begin
        BTB_btb_is_miss_vec_39 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_39 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_39 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_104) begin
      if(((BTB_source_pc_40 == train_pc) && BTB_valid[40])) begin
        BTB_btb_is_hit_vec_40 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_40 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_40 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_104) begin
      if(((BTB_source_pc_40 != train_pc) || (! BTB_valid[40]))) begin
        BTB_btb_is_miss_vec_40 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_40 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_40 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_105) begin
      if(((BTB_source_pc_41 == train_pc) && BTB_valid[41])) begin
        BTB_btb_is_hit_vec_41 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_41 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_41 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_105) begin
      if(((BTB_source_pc_41 != train_pc) || (! BTB_valid[41]))) begin
        BTB_btb_is_miss_vec_41 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_41 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_41 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_106) begin
      if(((BTB_source_pc_42 == train_pc) && BTB_valid[42])) begin
        BTB_btb_is_hit_vec_42 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_42 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_42 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_106) begin
      if(((BTB_source_pc_42 != train_pc) || (! BTB_valid[42]))) begin
        BTB_btb_is_miss_vec_42 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_42 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_42 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_107) begin
      if(((BTB_source_pc_43 == train_pc) && BTB_valid[43])) begin
        BTB_btb_is_hit_vec_43 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_43 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_43 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_107) begin
      if(((BTB_source_pc_43 != train_pc) || (! BTB_valid[43]))) begin
        BTB_btb_is_miss_vec_43 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_43 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_43 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_108) begin
      if(((BTB_source_pc_44 == train_pc) && BTB_valid[44])) begin
        BTB_btb_is_hit_vec_44 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_44 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_44 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_108) begin
      if(((BTB_source_pc_44 != train_pc) || (! BTB_valid[44]))) begin
        BTB_btb_is_miss_vec_44 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_44 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_44 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_109) begin
      if(((BTB_source_pc_45 == train_pc) && BTB_valid[45])) begin
        BTB_btb_is_hit_vec_45 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_45 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_45 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_109) begin
      if(((BTB_source_pc_45 != train_pc) || (! BTB_valid[45]))) begin
        BTB_btb_is_miss_vec_45 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_45 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_45 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_110) begin
      if(((BTB_source_pc_46 == train_pc) && BTB_valid[46])) begin
        BTB_btb_is_hit_vec_46 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_46 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_46 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_110) begin
      if(((BTB_source_pc_46 != train_pc) || (! BTB_valid[46]))) begin
        BTB_btb_is_miss_vec_46 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_46 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_46 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_111) begin
      if(((BTB_source_pc_47 == train_pc) && BTB_valid[47])) begin
        BTB_btb_is_hit_vec_47 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_47 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_47 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_111) begin
      if(((BTB_source_pc_47 != train_pc) || (! BTB_valid[47]))) begin
        BTB_btb_is_miss_vec_47 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_47 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_47 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_112) begin
      if(((BTB_source_pc_48 == train_pc) && BTB_valid[48])) begin
        BTB_btb_is_hit_vec_48 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_48 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_48 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_112) begin
      if(((BTB_source_pc_48 != train_pc) || (! BTB_valid[48]))) begin
        BTB_btb_is_miss_vec_48 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_48 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_48 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_113) begin
      if(((BTB_source_pc_49 == train_pc) && BTB_valid[49])) begin
        BTB_btb_is_hit_vec_49 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_49 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_49 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_113) begin
      if(((BTB_source_pc_49 != train_pc) || (! BTB_valid[49]))) begin
        BTB_btb_is_miss_vec_49 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_49 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_49 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_114) begin
      if(((BTB_source_pc_50 == train_pc) && BTB_valid[50])) begin
        BTB_btb_is_hit_vec_50 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_50 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_50 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_114) begin
      if(((BTB_source_pc_50 != train_pc) || (! BTB_valid[50]))) begin
        BTB_btb_is_miss_vec_50 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_50 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_50 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_115) begin
      if(((BTB_source_pc_51 == train_pc) && BTB_valid[51])) begin
        BTB_btb_is_hit_vec_51 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_51 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_51 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_115) begin
      if(((BTB_source_pc_51 != train_pc) || (! BTB_valid[51]))) begin
        BTB_btb_is_miss_vec_51 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_51 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_51 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_116) begin
      if(((BTB_source_pc_52 == train_pc) && BTB_valid[52])) begin
        BTB_btb_is_hit_vec_52 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_52 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_52 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_116) begin
      if(((BTB_source_pc_52 != train_pc) || (! BTB_valid[52]))) begin
        BTB_btb_is_miss_vec_52 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_52 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_52 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_117) begin
      if(((BTB_source_pc_53 == train_pc) && BTB_valid[53])) begin
        BTB_btb_is_hit_vec_53 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_53 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_53 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_117) begin
      if(((BTB_source_pc_53 != train_pc) || (! BTB_valid[53]))) begin
        BTB_btb_is_miss_vec_53 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_53 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_53 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_118) begin
      if(((BTB_source_pc_54 == train_pc) && BTB_valid[54])) begin
        BTB_btb_is_hit_vec_54 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_54 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_54 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_118) begin
      if(((BTB_source_pc_54 != train_pc) || (! BTB_valid[54]))) begin
        BTB_btb_is_miss_vec_54 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_54 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_54 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_119) begin
      if(((BTB_source_pc_55 == train_pc) && BTB_valid[55])) begin
        BTB_btb_is_hit_vec_55 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_55 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_55 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_119) begin
      if(((BTB_source_pc_55 != train_pc) || (! BTB_valid[55]))) begin
        BTB_btb_is_miss_vec_55 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_55 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_55 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_120) begin
      if(((BTB_source_pc_56 == train_pc) && BTB_valid[56])) begin
        BTB_btb_is_hit_vec_56 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_56 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_56 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_120) begin
      if(((BTB_source_pc_56 != train_pc) || (! BTB_valid[56]))) begin
        BTB_btb_is_miss_vec_56 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_56 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_56 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_121) begin
      if(((BTB_source_pc_57 == train_pc) && BTB_valid[57])) begin
        BTB_btb_is_hit_vec_57 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_57 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_57 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_121) begin
      if(((BTB_source_pc_57 != train_pc) || (! BTB_valid[57]))) begin
        BTB_btb_is_miss_vec_57 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_57 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_57 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_122) begin
      if(((BTB_source_pc_58 == train_pc) && BTB_valid[58])) begin
        BTB_btb_is_hit_vec_58 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_58 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_58 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_122) begin
      if(((BTB_source_pc_58 != train_pc) || (! BTB_valid[58]))) begin
        BTB_btb_is_miss_vec_58 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_58 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_58 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_123) begin
      if(((BTB_source_pc_59 == train_pc) && BTB_valid[59])) begin
        BTB_btb_is_hit_vec_59 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_59 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_59 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_123) begin
      if(((BTB_source_pc_59 != train_pc) || (! BTB_valid[59]))) begin
        BTB_btb_is_miss_vec_59 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_59 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_59 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_124) begin
      if(((BTB_source_pc_60 == train_pc) && BTB_valid[60])) begin
        BTB_btb_is_hit_vec_60 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_60 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_60 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_124) begin
      if(((BTB_source_pc_60 != train_pc) || (! BTB_valid[60]))) begin
        BTB_btb_is_miss_vec_60 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_60 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_60 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_125) begin
      if(((BTB_source_pc_61 == train_pc) && BTB_valid[61])) begin
        BTB_btb_is_hit_vec_61 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_61 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_61 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_125) begin
      if(((BTB_source_pc_61 != train_pc) || (! BTB_valid[61]))) begin
        BTB_btb_is_miss_vec_61 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_61 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_61 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_126) begin
      if(((BTB_source_pc_62 == train_pc) && BTB_valid[62])) begin
        BTB_btb_is_hit_vec_62 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_62 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_62 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_126) begin
      if(((BTB_source_pc_62 != train_pc) || (! BTB_valid[62]))) begin
        BTB_btb_is_miss_vec_62 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_62 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_62 = 1'b0; // @ Predictor.scala l126
    end
  end

  always @(*) begin
    if(tmp_when_127) begin
      if(((BTB_source_pc_63 == train_pc) && BTB_valid[63])) begin
        BTB_btb_is_hit_vec_63 = 1'b1; // @ Predictor.scala l115
      end else begin
        BTB_btb_is_hit_vec_63 = 1'b0; // @ Predictor.scala l117
      end
    end else begin
      BTB_btb_is_hit_vec_63 = 1'b0; // @ Predictor.scala l125
    end
  end

  always @(*) begin
    if(tmp_when_127) begin
      if(((BTB_source_pc_63 != train_pc) || (! BTB_valid[63]))) begin
        BTB_btb_is_miss_vec_63 = 1'b1; // @ Predictor.scala l120
      end else begin
        BTB_btb_is_miss_vec_63 = 1'b0; // @ Predictor.scala l122
      end
    end else begin
      BTB_btb_is_miss_vec_63 = 1'b0; // @ Predictor.scala l126
    end
  end

  assign tmp_BTB_btb_write_index = ((((((((((((((((tmp_tmp_BTB_btb_write_index || BTB_btb_is_hit_vec_33) || BTB_btb_is_hit_vec_35) || BTB_btb_is_hit_vec_37) || BTB_btb_is_hit_vec_39) || BTB_btb_is_hit_vec_41) || BTB_btb_is_hit_vec_43) || BTB_btb_is_hit_vec_45) || BTB_btb_is_hit_vec_47) || BTB_btb_is_hit_vec_49) || BTB_btb_is_hit_vec_51) || BTB_btb_is_hit_vec_53) || BTB_btb_is_hit_vec_55) || BTB_btb_is_hit_vec_57) || BTB_btb_is_hit_vec_59) || BTB_btb_is_hit_vec_61) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign tmp_BTB_btb_write_index_1 = (((((((((((((((((tmp_tmp_BTB_btb_write_index_1 || BTB_btb_is_hit_vec_31) || BTB_btb_is_hit_vec_34) || BTB_btb_is_hit_vec_35) || BTB_btb_is_hit_vec_38) || BTB_btb_is_hit_vec_39) || BTB_btb_is_hit_vec_42) || BTB_btb_is_hit_vec_43) || BTB_btb_is_hit_vec_46) || BTB_btb_is_hit_vec_47) || BTB_btb_is_hit_vec_50) || BTB_btb_is_hit_vec_51) || BTB_btb_is_hit_vec_54) || BTB_btb_is_hit_vec_55) || BTB_btb_is_hit_vec_58) || BTB_btb_is_hit_vec_59) || BTB_btb_is_hit_vec_62) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign tmp_BTB_btb_write_index_2 = ((((((((((((((((tmp_tmp_BTB_btb_write_index_2 || BTB_btb_is_hit_vec_36) || BTB_btb_is_hit_vec_37) || BTB_btb_is_hit_vec_38) || BTB_btb_is_hit_vec_39) || BTB_btb_is_hit_vec_44) || BTB_btb_is_hit_vec_45) || BTB_btb_is_hit_vec_46) || BTB_btb_is_hit_vec_47) || BTB_btb_is_hit_vec_52) || BTB_btb_is_hit_vec_53) || BTB_btb_is_hit_vec_54) || BTB_btb_is_hit_vec_55) || BTB_btb_is_hit_vec_60) || BTB_btb_is_hit_vec_61) || BTB_btb_is_hit_vec_62) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign tmp_BTB_btb_write_index_3 = ((((((((((((((((tmp_tmp_BTB_btb_write_index_3 || BTB_btb_is_hit_vec_40) || BTB_btb_is_hit_vec_41) || BTB_btb_is_hit_vec_42) || BTB_btb_is_hit_vec_43) || BTB_btb_is_hit_vec_44) || BTB_btb_is_hit_vec_45) || BTB_btb_is_hit_vec_46) || BTB_btb_is_hit_vec_47) || BTB_btb_is_hit_vec_56) || BTB_btb_is_hit_vec_57) || BTB_btb_is_hit_vec_58) || BTB_btb_is_hit_vec_59) || BTB_btb_is_hit_vec_60) || BTB_btb_is_hit_vec_61) || BTB_btb_is_hit_vec_62) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign tmp_BTB_btb_write_index_4 = ((((((((((((((((tmp_tmp_BTB_btb_write_index_4 || BTB_btb_is_hit_vec_48) || BTB_btb_is_hit_vec_49) || BTB_btb_is_hit_vec_50) || BTB_btb_is_hit_vec_51) || BTB_btb_is_hit_vec_52) || BTB_btb_is_hit_vec_53) || BTB_btb_is_hit_vec_54) || BTB_btb_is_hit_vec_55) || BTB_btb_is_hit_vec_56) || BTB_btb_is_hit_vec_57) || BTB_btb_is_hit_vec_58) || BTB_btb_is_hit_vec_59) || BTB_btb_is_hit_vec_60) || BTB_btb_is_hit_vec_61) || BTB_btb_is_hit_vec_62) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign tmp_BTB_btb_write_index_5 = (((((((((((((((((tmp_tmp_BTB_btb_write_index_5 || BTB_btb_is_hit_vec_47) || BTB_btb_is_hit_vec_48) || BTB_btb_is_hit_vec_49) || BTB_btb_is_hit_vec_50) || BTB_btb_is_hit_vec_51) || BTB_btb_is_hit_vec_52) || BTB_btb_is_hit_vec_53) || BTB_btb_is_hit_vec_54) || BTB_btb_is_hit_vec_55) || BTB_btb_is_hit_vec_56) || BTB_btb_is_hit_vec_57) || BTB_btb_is_hit_vec_58) || BTB_btb_is_hit_vec_59) || BTB_btb_is_hit_vec_60) || BTB_btb_is_hit_vec_61) || BTB_btb_is_hit_vec_62) || BTB_btb_is_hit_vec_63); // @ BaseType.scala l305
  assign BTB_btb_write_index = {tmp_BTB_btb_write_index_5,{tmp_BTB_btb_write_index_4,{tmp_BTB_btb_write_index_3,{tmp_BTB_btb_write_index_2,{tmp_BTB_btb_write_index_1,tmp_BTB_btb_write_index}}}}}; // @ Predictor.scala l129
  assign tmp_130 = ({63'd0,1'b1} <<< BTB_btb_write_index); // @ BaseType.scala l299
  assign tmp_131 = ({63'd0,1'b1} <<< BTB_btb_write_index); // @ BaseType.scala l299
  assign tmp_132 = ({63'd0,1'b1} <<< BTB_btb_alloc_index_value); // @ BaseType.scala l299
  assign tmp_133 = ({63'd0,1'b1} <<< BTB_btb_alloc_index_value); // @ BaseType.scala l299
  assign RAS_ras_call_matched = (BTB_is_matched && BTB_is_call); // @ BaseType.scala l305
  assign RAS_ras_ret_matched = (BTB_is_matched && BTB_is_ret); // @ BaseType.scala l305
  always @(*) begin
    if((train_valid && train_is_call)) begin
      RAS_ras_next_index_proven = (RAS_ras_curr_index_proven + 6'h01); // @ Predictor.scala l170
    end else begin
      if((train_valid && train_is_ret)) begin
        RAS_ras_next_index_proven = (RAS_ras_curr_index_proven - 6'h01); // @ Predictor.scala l173
      end else begin
        RAS_ras_next_index_proven = RAS_ras_curr_index_proven; // @ Predictor.scala l176
      end
    end
  end

  always @(*) begin
    if(((train_mispredicted && train_valid) && train_is_call)) begin
      RAS_ras_next_index = (RAS_ras_curr_index_proven + 6'h01); // @ Predictor.scala l181
    end else begin
      if(((train_mispredicted && train_valid) && train_is_ret)) begin
        RAS_ras_next_index = (RAS_ras_curr_index_proven - 6'h01); // @ Predictor.scala l184
      end else begin
        if(RAS_ras_call_matched) begin
          RAS_ras_next_index = (RAS_ras_curr_index + 6'h01); // @ Predictor.scala l187
        end else begin
          if(RAS_ras_ret_matched) begin
            RAS_ras_next_index = (RAS_ras_curr_index - 6'h01); // @ Predictor.scala l190
          end else begin
            RAS_ras_next_index = RAS_ras_curr_index; // @ Predictor.scala l193
          end
        end
      end
    end
  end

  assign tmp_134 = ({63'd0,1'b1} <<< RAS_ras_next_index); // @ BaseType.scala l299
  assign tmp_135 = tmp_134[0]; // @ BaseType.scala l305
  assign tmp_136 = tmp_134[1]; // @ BaseType.scala l305
  assign tmp_137 = tmp_134[2]; // @ BaseType.scala l305
  assign tmp_138 = tmp_134[3]; // @ BaseType.scala l305
  assign tmp_139 = tmp_134[4]; // @ BaseType.scala l305
  assign tmp_140 = tmp_134[5]; // @ BaseType.scala l305
  assign tmp_141 = tmp_134[6]; // @ BaseType.scala l305
  assign tmp_142 = tmp_134[7]; // @ BaseType.scala l305
  assign tmp_143 = tmp_134[8]; // @ BaseType.scala l305
  assign tmp_144 = tmp_134[9]; // @ BaseType.scala l305
  assign tmp_145 = tmp_134[10]; // @ BaseType.scala l305
  assign tmp_146 = tmp_134[11]; // @ BaseType.scala l305
  assign tmp_147 = tmp_134[12]; // @ BaseType.scala l305
  assign tmp_148 = tmp_134[13]; // @ BaseType.scala l305
  assign tmp_149 = tmp_134[14]; // @ BaseType.scala l305
  assign tmp_150 = tmp_134[15]; // @ BaseType.scala l305
  assign tmp_151 = tmp_134[16]; // @ BaseType.scala l305
  assign tmp_152 = tmp_134[17]; // @ BaseType.scala l305
  assign tmp_153 = tmp_134[18]; // @ BaseType.scala l305
  assign tmp_154 = tmp_134[19]; // @ BaseType.scala l305
  assign tmp_155 = tmp_134[20]; // @ BaseType.scala l305
  assign tmp_156 = tmp_134[21]; // @ BaseType.scala l305
  assign tmp_157 = tmp_134[22]; // @ BaseType.scala l305
  assign tmp_158 = tmp_134[23]; // @ BaseType.scala l305
  assign tmp_159 = tmp_134[24]; // @ BaseType.scala l305
  assign tmp_160 = tmp_134[25]; // @ BaseType.scala l305
  assign tmp_161 = tmp_134[26]; // @ BaseType.scala l305
  assign tmp_162 = tmp_134[27]; // @ BaseType.scala l305
  assign tmp_163 = tmp_134[28]; // @ BaseType.scala l305
  assign tmp_164 = tmp_134[29]; // @ BaseType.scala l305
  assign tmp_165 = tmp_134[30]; // @ BaseType.scala l305
  assign tmp_166 = tmp_134[31]; // @ BaseType.scala l305
  assign tmp_167 = tmp_134[32]; // @ BaseType.scala l305
  assign tmp_168 = tmp_134[33]; // @ BaseType.scala l305
  assign tmp_169 = tmp_134[34]; // @ BaseType.scala l305
  assign tmp_170 = tmp_134[35]; // @ BaseType.scala l305
  assign tmp_171 = tmp_134[36]; // @ BaseType.scala l305
  assign tmp_172 = tmp_134[37]; // @ BaseType.scala l305
  assign tmp_173 = tmp_134[38]; // @ BaseType.scala l305
  assign tmp_174 = tmp_134[39]; // @ BaseType.scala l305
  assign tmp_175 = tmp_134[40]; // @ BaseType.scala l305
  assign tmp_176 = tmp_134[41]; // @ BaseType.scala l305
  assign tmp_177 = tmp_134[42]; // @ BaseType.scala l305
  assign tmp_178 = tmp_134[43]; // @ BaseType.scala l305
  assign tmp_179 = tmp_134[44]; // @ BaseType.scala l305
  assign tmp_180 = tmp_134[45]; // @ BaseType.scala l305
  assign tmp_181 = tmp_134[46]; // @ BaseType.scala l305
  assign tmp_182 = tmp_134[47]; // @ BaseType.scala l305
  assign tmp_183 = tmp_134[48]; // @ BaseType.scala l305
  assign tmp_184 = tmp_134[49]; // @ BaseType.scala l305
  assign tmp_185 = tmp_134[50]; // @ BaseType.scala l305
  assign tmp_186 = tmp_134[51]; // @ BaseType.scala l305
  assign tmp_187 = tmp_134[52]; // @ BaseType.scala l305
  assign tmp_188 = tmp_134[53]; // @ BaseType.scala l305
  assign tmp_189 = tmp_134[54]; // @ BaseType.scala l305
  assign tmp_190 = tmp_134[55]; // @ BaseType.scala l305
  assign tmp_191 = tmp_134[56]; // @ BaseType.scala l305
  assign tmp_192 = tmp_134[57]; // @ BaseType.scala l305
  assign tmp_193 = tmp_134[58]; // @ BaseType.scala l305
  assign tmp_194 = tmp_134[59]; // @ BaseType.scala l305
  assign tmp_195 = tmp_134[60]; // @ BaseType.scala l305
  assign tmp_196 = tmp_134[61]; // @ BaseType.scala l305
  assign tmp_197 = tmp_134[62]; // @ BaseType.scala l305
  assign tmp_198 = tmp_134[63]; // @ BaseType.scala l305
  assign tmp_RAS_ras_regfile_0 = (train_pc + 64'h0000000000000004); // @ BaseType.scala l299
  assign tmp_RAS_ras_regfile_0_1 = (predict_pc + 64'h0000000000000004); // @ BaseType.scala l299
  assign RAS_ras_predict_pc = tmp_RAS_ras_predict_pc; // @ Predictor.scala l213
  assign predict_history = GSHARE_global_branch_history; // @ Predictor.scala l218
  assign predict_taken = (BTB_is_matched && (((GSHARE_pht_predict_taken || BTB_is_jmp) || BTB_is_call) || BTB_is_ret)); // @ Predictor.scala l219
  assign predict_pc_next = (RAS_ras_ret_matched ? RAS_ras_predict_pc : ((BTB_is_matched && ((GSHARE_pht_predict_taken || BTB_is_jmp) || BTB_is_call)) ? BTB_target_pc_read : tmp_predict_pc_next)); // @ Predictor.scala l220
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      GSHARE_global_branch_history <= 7'h0; // @ Data.scala l400
      GSHARE_PHT_0 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_1 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_2 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_3 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_4 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_5 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_6 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_7 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_8 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_9 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_10 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_11 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_12 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_13 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_14 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_15 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_16 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_17 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_18 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_19 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_20 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_21 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_22 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_23 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_24 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_25 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_26 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_27 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_28 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_29 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_30 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_31 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_32 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_33 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_34 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_35 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_36 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_37 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_38 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_39 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_40 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_41 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_42 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_43 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_44 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_45 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_46 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_47 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_48 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_49 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_50 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_51 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_52 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_53 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_54 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_55 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_56 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_57 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_58 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_59 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_60 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_61 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_62 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_63 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_64 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_65 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_66 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_67 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_68 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_69 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_70 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_71 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_72 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_73 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_74 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_75 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_76 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_77 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_78 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_79 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_80 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_81 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_82 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_83 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_84 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_85 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_86 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_87 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_88 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_89 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_90 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_91 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_92 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_93 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_94 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_95 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_96 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_97 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_98 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_99 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_100 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_101 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_102 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_103 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_104 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_105 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_106 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_107 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_108 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_109 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_110 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_111 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_112 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_113 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_114 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_115 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_116 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_117 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_118 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_119 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_120 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_121 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_122 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_123 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_124 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_125 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_126 <= 2'b01; // @ Data.scala l400
      GSHARE_PHT_127 <= 2'b01; // @ Data.scala l400
      BTB_valid <= 64'h0; // @ Data.scala l400
      BTB_source_pc_0 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_1 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_2 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_3 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_4 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_5 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_6 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_7 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_8 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_9 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_10 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_11 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_12 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_13 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_14 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_15 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_16 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_17 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_18 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_19 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_20 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_21 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_22 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_23 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_24 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_25 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_26 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_27 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_28 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_29 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_30 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_31 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_32 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_33 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_34 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_35 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_36 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_37 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_38 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_39 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_40 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_41 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_42 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_43 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_44 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_45 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_46 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_47 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_48 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_49 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_50 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_51 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_52 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_53 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_54 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_55 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_56 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_57 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_58 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_59 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_60 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_61 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_62 <= 64'h0; // @ Data.scala l400
      BTB_source_pc_63 <= 64'h0; // @ Data.scala l400
      BTB_call <= 64'h0; // @ Data.scala l400
      BTB_ret <= 64'h0; // @ Data.scala l400
      BTB_jmp <= 64'h0; // @ Data.scala l400
      BTB_target_pc_0 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_1 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_2 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_3 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_4 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_5 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_6 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_7 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_8 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_9 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_10 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_11 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_12 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_13 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_14 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_15 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_16 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_17 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_18 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_19 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_20 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_21 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_22 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_23 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_24 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_25 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_26 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_27 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_28 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_29 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_30 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_31 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_32 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_33 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_34 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_35 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_36 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_37 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_38 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_39 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_40 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_41 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_42 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_43 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_44 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_45 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_46 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_47 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_48 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_49 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_50 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_51 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_52 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_53 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_54 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_55 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_56 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_57 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_58 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_59 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_60 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_61 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_62 <= 64'h0; // @ Data.scala l400
      BTB_target_pc_63 <= 64'h0; // @ Data.scala l400
      BTB_btb_alloc_index_value <= 6'h0; // @ Data.scala l400
      RAS_ras_curr_index <= 6'h0; // @ Data.scala l400
      RAS_ras_curr_index_proven <= 6'h0; // @ Data.scala l400
    end else begin
      if(train_valid) begin
        case(tmp_199)
          2'b00 : begin
            if(train_taken) begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b01; // @ Predictor.scala l41
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b01; // @ Predictor.scala l41
              end
            end else begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b00; // @ Predictor.scala l43
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b00; // @ Predictor.scala l43
              end
            end
          end
          2'b01 : begin
            if(train_taken) begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b10; // @ Predictor.scala l48
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b10; // @ Predictor.scala l48
              end
            end else begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b00; // @ Predictor.scala l50
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b00; // @ Predictor.scala l50
              end
            end
          end
          2'b10 : begin
            if(train_taken) begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b11; // @ Predictor.scala l55
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b11; // @ Predictor.scala l55
              end
            end else begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b00; // @ Predictor.scala l57
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b00; // @ Predictor.scala l57
              end
            end
          end
          default : begin
            if((! train_taken)) begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b10; // @ Predictor.scala l62
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b10; // @ Predictor.scala l62
              end
            end else begin
              if(tmp_2) begin
                GSHARE_PHT_0 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_3) begin
                GSHARE_PHT_1 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_4) begin
                GSHARE_PHT_2 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_5) begin
                GSHARE_PHT_3 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_6) begin
                GSHARE_PHT_4 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_7) begin
                GSHARE_PHT_5 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_8) begin
                GSHARE_PHT_6 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_9) begin
                GSHARE_PHT_7 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_10) begin
                GSHARE_PHT_8 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_11) begin
                GSHARE_PHT_9 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_12) begin
                GSHARE_PHT_10 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_13) begin
                GSHARE_PHT_11 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_14) begin
                GSHARE_PHT_12 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_15) begin
                GSHARE_PHT_13 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_16) begin
                GSHARE_PHT_14 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_17) begin
                GSHARE_PHT_15 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_18) begin
                GSHARE_PHT_16 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_19) begin
                GSHARE_PHT_17 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_20) begin
                GSHARE_PHT_18 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_21) begin
                GSHARE_PHT_19 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_22) begin
                GSHARE_PHT_20 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_23) begin
                GSHARE_PHT_21 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_24) begin
                GSHARE_PHT_22 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_25) begin
                GSHARE_PHT_23 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_26) begin
                GSHARE_PHT_24 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_27) begin
                GSHARE_PHT_25 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_28) begin
                GSHARE_PHT_26 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_29) begin
                GSHARE_PHT_27 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_30) begin
                GSHARE_PHT_28 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_31) begin
                GSHARE_PHT_29 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_32) begin
                GSHARE_PHT_30 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_33) begin
                GSHARE_PHT_31 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_34) begin
                GSHARE_PHT_32 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_35) begin
                GSHARE_PHT_33 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_36) begin
                GSHARE_PHT_34 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_37) begin
                GSHARE_PHT_35 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_38) begin
                GSHARE_PHT_36 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_39) begin
                GSHARE_PHT_37 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_40) begin
                GSHARE_PHT_38 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_41) begin
                GSHARE_PHT_39 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_42) begin
                GSHARE_PHT_40 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_43) begin
                GSHARE_PHT_41 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_44) begin
                GSHARE_PHT_42 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_45) begin
                GSHARE_PHT_43 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_46) begin
                GSHARE_PHT_44 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_47) begin
                GSHARE_PHT_45 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_48) begin
                GSHARE_PHT_46 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_49) begin
                GSHARE_PHT_47 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_50) begin
                GSHARE_PHT_48 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_51) begin
                GSHARE_PHT_49 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_52) begin
                GSHARE_PHT_50 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_53) begin
                GSHARE_PHT_51 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_54) begin
                GSHARE_PHT_52 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_55) begin
                GSHARE_PHT_53 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_56) begin
                GSHARE_PHT_54 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_57) begin
                GSHARE_PHT_55 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_58) begin
                GSHARE_PHT_56 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_59) begin
                GSHARE_PHT_57 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_60) begin
                GSHARE_PHT_58 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_61) begin
                GSHARE_PHT_59 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_62) begin
                GSHARE_PHT_60 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_63) begin
                GSHARE_PHT_61 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_64) begin
                GSHARE_PHT_62 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_65) begin
                GSHARE_PHT_63 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_66) begin
                GSHARE_PHT_64 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_67) begin
                GSHARE_PHT_65 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_68) begin
                GSHARE_PHT_66 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_69) begin
                GSHARE_PHT_67 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_70) begin
                GSHARE_PHT_68 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_71) begin
                GSHARE_PHT_69 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_72) begin
                GSHARE_PHT_70 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_73) begin
                GSHARE_PHT_71 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_74) begin
                GSHARE_PHT_72 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_75) begin
                GSHARE_PHT_73 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_76) begin
                GSHARE_PHT_74 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_77) begin
                GSHARE_PHT_75 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_78) begin
                GSHARE_PHT_76 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_79) begin
                GSHARE_PHT_77 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_80) begin
                GSHARE_PHT_78 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_81) begin
                GSHARE_PHT_79 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_82) begin
                GSHARE_PHT_80 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_83) begin
                GSHARE_PHT_81 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_84) begin
                GSHARE_PHT_82 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_85) begin
                GSHARE_PHT_83 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_86) begin
                GSHARE_PHT_84 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_87) begin
                GSHARE_PHT_85 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_88) begin
                GSHARE_PHT_86 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_89) begin
                GSHARE_PHT_87 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_90) begin
                GSHARE_PHT_88 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_91) begin
                GSHARE_PHT_89 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_92) begin
                GSHARE_PHT_90 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_93) begin
                GSHARE_PHT_91 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_94) begin
                GSHARE_PHT_92 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_95) begin
                GSHARE_PHT_93 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_96) begin
                GSHARE_PHT_94 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_97) begin
                GSHARE_PHT_95 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_98) begin
                GSHARE_PHT_96 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_99) begin
                GSHARE_PHT_97 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_100) begin
                GSHARE_PHT_98 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_101) begin
                GSHARE_PHT_99 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_102) begin
                GSHARE_PHT_100 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_103) begin
                GSHARE_PHT_101 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_104) begin
                GSHARE_PHT_102 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_105) begin
                GSHARE_PHT_103 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_106) begin
                GSHARE_PHT_104 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_107) begin
                GSHARE_PHT_105 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_108) begin
                GSHARE_PHT_106 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_109) begin
                GSHARE_PHT_107 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_110) begin
                GSHARE_PHT_108 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_111) begin
                GSHARE_PHT_109 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_112) begin
                GSHARE_PHT_110 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_113) begin
                GSHARE_PHT_111 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_114) begin
                GSHARE_PHT_112 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_115) begin
                GSHARE_PHT_113 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_116) begin
                GSHARE_PHT_114 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_117) begin
                GSHARE_PHT_115 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_118) begin
                GSHARE_PHT_116 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_119) begin
                GSHARE_PHT_117 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_120) begin
                GSHARE_PHT_118 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_121) begin
                GSHARE_PHT_119 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_122) begin
                GSHARE_PHT_120 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_123) begin
                GSHARE_PHT_121 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_124) begin
                GSHARE_PHT_122 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_125) begin
                GSHARE_PHT_123 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_126) begin
                GSHARE_PHT_124 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_127) begin
                GSHARE_PHT_125 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_128) begin
                GSHARE_PHT_126 <= 2'b11; // @ Predictor.scala l64
              end
              if(tmp_129) begin
                GSHARE_PHT_127 <= 2'b11; // @ Predictor.scala l64
              end
            end
          end
        endcase
      end
      if((train_valid && train_mispredicted)) begin
        GSHARE_global_branch_history <= {train_history[5 : 0],train_taken}; // @ Predictor.scala l71
      end else begin
        if(predict_valid) begin
          GSHARE_global_branch_history <= {GSHARE_global_branch_history[5 : 0],predict_taken}; // @ Predictor.scala l74
        end
      end
      BTB_btb_alloc_index_value <= BTB_btb_alloc_index_valueNext; // @ Reg.scala l39
      if(BTB_btb_is_hit) begin
        if(tmp_130[0]) begin
          BTB_source_pc_0 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[1]) begin
          BTB_source_pc_1 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[2]) begin
          BTB_source_pc_2 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[3]) begin
          BTB_source_pc_3 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[4]) begin
          BTB_source_pc_4 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[5]) begin
          BTB_source_pc_5 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[6]) begin
          BTB_source_pc_6 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[7]) begin
          BTB_source_pc_7 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[8]) begin
          BTB_source_pc_8 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[9]) begin
          BTB_source_pc_9 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[10]) begin
          BTB_source_pc_10 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[11]) begin
          BTB_source_pc_11 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[12]) begin
          BTB_source_pc_12 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[13]) begin
          BTB_source_pc_13 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[14]) begin
          BTB_source_pc_14 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[15]) begin
          BTB_source_pc_15 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[16]) begin
          BTB_source_pc_16 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[17]) begin
          BTB_source_pc_17 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[18]) begin
          BTB_source_pc_18 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[19]) begin
          BTB_source_pc_19 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[20]) begin
          BTB_source_pc_20 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[21]) begin
          BTB_source_pc_21 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[22]) begin
          BTB_source_pc_22 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[23]) begin
          BTB_source_pc_23 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[24]) begin
          BTB_source_pc_24 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[25]) begin
          BTB_source_pc_25 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[26]) begin
          BTB_source_pc_26 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[27]) begin
          BTB_source_pc_27 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[28]) begin
          BTB_source_pc_28 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[29]) begin
          BTB_source_pc_29 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[30]) begin
          BTB_source_pc_30 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[31]) begin
          BTB_source_pc_31 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[32]) begin
          BTB_source_pc_32 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[33]) begin
          BTB_source_pc_33 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[34]) begin
          BTB_source_pc_34 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[35]) begin
          BTB_source_pc_35 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[36]) begin
          BTB_source_pc_36 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[37]) begin
          BTB_source_pc_37 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[38]) begin
          BTB_source_pc_38 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[39]) begin
          BTB_source_pc_39 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[40]) begin
          BTB_source_pc_40 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[41]) begin
          BTB_source_pc_41 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[42]) begin
          BTB_source_pc_42 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[43]) begin
          BTB_source_pc_43 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[44]) begin
          BTB_source_pc_44 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[45]) begin
          BTB_source_pc_45 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[46]) begin
          BTB_source_pc_46 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[47]) begin
          BTB_source_pc_47 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[48]) begin
          BTB_source_pc_48 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[49]) begin
          BTB_source_pc_49 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[50]) begin
          BTB_source_pc_50 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[51]) begin
          BTB_source_pc_51 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[52]) begin
          BTB_source_pc_52 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[53]) begin
          BTB_source_pc_53 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[54]) begin
          BTB_source_pc_54 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[55]) begin
          BTB_source_pc_55 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[56]) begin
          BTB_source_pc_56 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[57]) begin
          BTB_source_pc_57 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[58]) begin
          BTB_source_pc_58 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[59]) begin
          BTB_source_pc_59 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[60]) begin
          BTB_source_pc_60 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[61]) begin
          BTB_source_pc_61 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[62]) begin
          BTB_source_pc_62 <= train_pc; // @ Predictor.scala l141
        end
        if(tmp_130[63]) begin
          BTB_source_pc_63 <= train_pc; // @ Predictor.scala l141
        end
        BTB_call[BTB_btb_write_index] <= train_is_call; // @ Predictor.scala l142
        BTB_ret[BTB_btb_write_index] <= train_is_ret; // @ Predictor.scala l143
        BTB_jmp[BTB_btb_write_index] <= train_is_jmp; // @ Predictor.scala l144
        if(tmp_131[0]) begin
          BTB_target_pc_0 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[1]) begin
          BTB_target_pc_1 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[2]) begin
          BTB_target_pc_2 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[3]) begin
          BTB_target_pc_3 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[4]) begin
          BTB_target_pc_4 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[5]) begin
          BTB_target_pc_5 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[6]) begin
          BTB_target_pc_6 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[7]) begin
          BTB_target_pc_7 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[8]) begin
          BTB_target_pc_8 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[9]) begin
          BTB_target_pc_9 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[10]) begin
          BTB_target_pc_10 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[11]) begin
          BTB_target_pc_11 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[12]) begin
          BTB_target_pc_12 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[13]) begin
          BTB_target_pc_13 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[14]) begin
          BTB_target_pc_14 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[15]) begin
          BTB_target_pc_15 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[16]) begin
          BTB_target_pc_16 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[17]) begin
          BTB_target_pc_17 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[18]) begin
          BTB_target_pc_18 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[19]) begin
          BTB_target_pc_19 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[20]) begin
          BTB_target_pc_20 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[21]) begin
          BTB_target_pc_21 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[22]) begin
          BTB_target_pc_22 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[23]) begin
          BTB_target_pc_23 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[24]) begin
          BTB_target_pc_24 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[25]) begin
          BTB_target_pc_25 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[26]) begin
          BTB_target_pc_26 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[27]) begin
          BTB_target_pc_27 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[28]) begin
          BTB_target_pc_28 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[29]) begin
          BTB_target_pc_29 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[30]) begin
          BTB_target_pc_30 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[31]) begin
          BTB_target_pc_31 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[32]) begin
          BTB_target_pc_32 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[33]) begin
          BTB_target_pc_33 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[34]) begin
          BTB_target_pc_34 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[35]) begin
          BTB_target_pc_35 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[36]) begin
          BTB_target_pc_36 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[37]) begin
          BTB_target_pc_37 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[38]) begin
          BTB_target_pc_38 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[39]) begin
          BTB_target_pc_39 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[40]) begin
          BTB_target_pc_40 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[41]) begin
          BTB_target_pc_41 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[42]) begin
          BTB_target_pc_42 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[43]) begin
          BTB_target_pc_43 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[44]) begin
          BTB_target_pc_44 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[45]) begin
          BTB_target_pc_45 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[46]) begin
          BTB_target_pc_46 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[47]) begin
          BTB_target_pc_47 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[48]) begin
          BTB_target_pc_48 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[49]) begin
          BTB_target_pc_49 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[50]) begin
          BTB_target_pc_50 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[51]) begin
          BTB_target_pc_51 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[52]) begin
          BTB_target_pc_52 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[53]) begin
          BTB_target_pc_53 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[54]) begin
          BTB_target_pc_54 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[55]) begin
          BTB_target_pc_55 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[56]) begin
          BTB_target_pc_56 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[57]) begin
          BTB_target_pc_57 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[58]) begin
          BTB_target_pc_58 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[59]) begin
          BTB_target_pc_59 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[60]) begin
          BTB_target_pc_60 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[61]) begin
          BTB_target_pc_61 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[62]) begin
          BTB_target_pc_62 <= train_pc_next; // @ Predictor.scala l145
        end
        if(tmp_131[63]) begin
          BTB_target_pc_63 <= train_pc_next; // @ Predictor.scala l145
        end
      end else begin
        if(BTB_btb_is_miss) begin
          BTB_valid[BTB_btb_alloc_index_value] <= 1'b1; // @ Predictor.scala l148
          if(tmp_132[0]) begin
            BTB_source_pc_0 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[1]) begin
            BTB_source_pc_1 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[2]) begin
            BTB_source_pc_2 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[3]) begin
            BTB_source_pc_3 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[4]) begin
            BTB_source_pc_4 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[5]) begin
            BTB_source_pc_5 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[6]) begin
            BTB_source_pc_6 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[7]) begin
            BTB_source_pc_7 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[8]) begin
            BTB_source_pc_8 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[9]) begin
            BTB_source_pc_9 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[10]) begin
            BTB_source_pc_10 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[11]) begin
            BTB_source_pc_11 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[12]) begin
            BTB_source_pc_12 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[13]) begin
            BTB_source_pc_13 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[14]) begin
            BTB_source_pc_14 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[15]) begin
            BTB_source_pc_15 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[16]) begin
            BTB_source_pc_16 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[17]) begin
            BTB_source_pc_17 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[18]) begin
            BTB_source_pc_18 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[19]) begin
            BTB_source_pc_19 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[20]) begin
            BTB_source_pc_20 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[21]) begin
            BTB_source_pc_21 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[22]) begin
            BTB_source_pc_22 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[23]) begin
            BTB_source_pc_23 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[24]) begin
            BTB_source_pc_24 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[25]) begin
            BTB_source_pc_25 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[26]) begin
            BTB_source_pc_26 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[27]) begin
            BTB_source_pc_27 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[28]) begin
            BTB_source_pc_28 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[29]) begin
            BTB_source_pc_29 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[30]) begin
            BTB_source_pc_30 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[31]) begin
            BTB_source_pc_31 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[32]) begin
            BTB_source_pc_32 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[33]) begin
            BTB_source_pc_33 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[34]) begin
            BTB_source_pc_34 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[35]) begin
            BTB_source_pc_35 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[36]) begin
            BTB_source_pc_36 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[37]) begin
            BTB_source_pc_37 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[38]) begin
            BTB_source_pc_38 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[39]) begin
            BTB_source_pc_39 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[40]) begin
            BTB_source_pc_40 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[41]) begin
            BTB_source_pc_41 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[42]) begin
            BTB_source_pc_42 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[43]) begin
            BTB_source_pc_43 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[44]) begin
            BTB_source_pc_44 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[45]) begin
            BTB_source_pc_45 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[46]) begin
            BTB_source_pc_46 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[47]) begin
            BTB_source_pc_47 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[48]) begin
            BTB_source_pc_48 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[49]) begin
            BTB_source_pc_49 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[50]) begin
            BTB_source_pc_50 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[51]) begin
            BTB_source_pc_51 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[52]) begin
            BTB_source_pc_52 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[53]) begin
            BTB_source_pc_53 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[54]) begin
            BTB_source_pc_54 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[55]) begin
            BTB_source_pc_55 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[56]) begin
            BTB_source_pc_56 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[57]) begin
            BTB_source_pc_57 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[58]) begin
            BTB_source_pc_58 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[59]) begin
            BTB_source_pc_59 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[60]) begin
            BTB_source_pc_60 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[61]) begin
            BTB_source_pc_61 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[62]) begin
            BTB_source_pc_62 <= train_pc; // @ Predictor.scala l149
          end
          if(tmp_132[63]) begin
            BTB_source_pc_63 <= train_pc; // @ Predictor.scala l149
          end
          BTB_call[BTB_btb_alloc_index_value] <= train_is_call; // @ Predictor.scala l150
          BTB_ret[BTB_btb_alloc_index_value] <= train_is_ret; // @ Predictor.scala l151
          BTB_jmp[BTB_btb_alloc_index_value] <= train_is_jmp; // @ Predictor.scala l152
          if(tmp_133[0]) begin
            BTB_target_pc_0 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[1]) begin
            BTB_target_pc_1 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[2]) begin
            BTB_target_pc_2 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[3]) begin
            BTB_target_pc_3 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[4]) begin
            BTB_target_pc_4 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[5]) begin
            BTB_target_pc_5 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[6]) begin
            BTB_target_pc_6 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[7]) begin
            BTB_target_pc_7 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[8]) begin
            BTB_target_pc_8 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[9]) begin
            BTB_target_pc_9 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[10]) begin
            BTB_target_pc_10 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[11]) begin
            BTB_target_pc_11 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[12]) begin
            BTB_target_pc_12 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[13]) begin
            BTB_target_pc_13 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[14]) begin
            BTB_target_pc_14 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[15]) begin
            BTB_target_pc_15 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[16]) begin
            BTB_target_pc_16 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[17]) begin
            BTB_target_pc_17 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[18]) begin
            BTB_target_pc_18 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[19]) begin
            BTB_target_pc_19 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[20]) begin
            BTB_target_pc_20 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[21]) begin
            BTB_target_pc_21 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[22]) begin
            BTB_target_pc_22 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[23]) begin
            BTB_target_pc_23 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[24]) begin
            BTB_target_pc_24 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[25]) begin
            BTB_target_pc_25 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[26]) begin
            BTB_target_pc_26 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[27]) begin
            BTB_target_pc_27 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[28]) begin
            BTB_target_pc_28 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[29]) begin
            BTB_target_pc_29 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[30]) begin
            BTB_target_pc_30 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[31]) begin
            BTB_target_pc_31 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[32]) begin
            BTB_target_pc_32 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[33]) begin
            BTB_target_pc_33 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[34]) begin
            BTB_target_pc_34 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[35]) begin
            BTB_target_pc_35 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[36]) begin
            BTB_target_pc_36 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[37]) begin
            BTB_target_pc_37 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[38]) begin
            BTB_target_pc_38 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[39]) begin
            BTB_target_pc_39 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[40]) begin
            BTB_target_pc_40 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[41]) begin
            BTB_target_pc_41 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[42]) begin
            BTB_target_pc_42 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[43]) begin
            BTB_target_pc_43 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[44]) begin
            BTB_target_pc_44 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[45]) begin
            BTB_target_pc_45 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[46]) begin
            BTB_target_pc_46 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[47]) begin
            BTB_target_pc_47 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[48]) begin
            BTB_target_pc_48 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[49]) begin
            BTB_target_pc_49 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[50]) begin
            BTB_target_pc_50 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[51]) begin
            BTB_target_pc_51 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[52]) begin
            BTB_target_pc_52 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[53]) begin
            BTB_target_pc_53 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[54]) begin
            BTB_target_pc_54 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[55]) begin
            BTB_target_pc_55 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[56]) begin
            BTB_target_pc_56 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[57]) begin
            BTB_target_pc_57 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[58]) begin
            BTB_target_pc_58 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[59]) begin
            BTB_target_pc_59 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[60]) begin
            BTB_target_pc_60 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[61]) begin
            BTB_target_pc_61 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[62]) begin
            BTB_target_pc_62 <= train_pc_next; // @ Predictor.scala l153
          end
          if(tmp_133[63]) begin
            BTB_target_pc_63 <= train_pc_next; // @ Predictor.scala l153
          end
        end
      end
      RAS_ras_curr_index_proven <= RAS_ras_next_index; // @ Reg.scala l39
      if(tmp_when_128) begin
        RAS_ras_curr_index <= RAS_ras_next_index; // @ Predictor.scala l199
      end else begin
        if(RAS_ras_call_matched) begin
          RAS_ras_curr_index <= RAS_ras_next_index; // @ Predictor.scala l203
        end else begin
          if(((train_mispredicted && train_valid) && train_is_ret)) begin
            RAS_ras_curr_index <= RAS_ras_next_index; // @ Predictor.scala l206
          end else begin
            if(RAS_ras_ret_matched) begin
              RAS_ras_curr_index <= RAS_ras_next_index; // @ Predictor.scala l209
            end
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(tmp_when_128) begin
      if(tmp_135) begin
        RAS_ras_regfile_0 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_136) begin
        RAS_ras_regfile_1 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_137) begin
        RAS_ras_regfile_2 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_138) begin
        RAS_ras_regfile_3 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_139) begin
        RAS_ras_regfile_4 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_140) begin
        RAS_ras_regfile_5 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_141) begin
        RAS_ras_regfile_6 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_142) begin
        RAS_ras_regfile_7 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_143) begin
        RAS_ras_regfile_8 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_144) begin
        RAS_ras_regfile_9 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_145) begin
        RAS_ras_regfile_10 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_146) begin
        RAS_ras_regfile_11 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_147) begin
        RAS_ras_regfile_12 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_148) begin
        RAS_ras_regfile_13 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_149) begin
        RAS_ras_regfile_14 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_150) begin
        RAS_ras_regfile_15 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_151) begin
        RAS_ras_regfile_16 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_152) begin
        RAS_ras_regfile_17 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_153) begin
        RAS_ras_regfile_18 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_154) begin
        RAS_ras_regfile_19 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_155) begin
        RAS_ras_regfile_20 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_156) begin
        RAS_ras_regfile_21 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_157) begin
        RAS_ras_regfile_22 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_158) begin
        RAS_ras_regfile_23 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_159) begin
        RAS_ras_regfile_24 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_160) begin
        RAS_ras_regfile_25 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_161) begin
        RAS_ras_regfile_26 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_162) begin
        RAS_ras_regfile_27 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_163) begin
        RAS_ras_regfile_28 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_164) begin
        RAS_ras_regfile_29 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_165) begin
        RAS_ras_regfile_30 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_166) begin
        RAS_ras_regfile_31 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_167) begin
        RAS_ras_regfile_32 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_168) begin
        RAS_ras_regfile_33 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_169) begin
        RAS_ras_regfile_34 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_170) begin
        RAS_ras_regfile_35 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_171) begin
        RAS_ras_regfile_36 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_172) begin
        RAS_ras_regfile_37 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_173) begin
        RAS_ras_regfile_38 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_174) begin
        RAS_ras_regfile_39 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_175) begin
        RAS_ras_regfile_40 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_176) begin
        RAS_ras_regfile_41 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_177) begin
        RAS_ras_regfile_42 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_178) begin
        RAS_ras_regfile_43 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_179) begin
        RAS_ras_regfile_44 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_180) begin
        RAS_ras_regfile_45 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_181) begin
        RAS_ras_regfile_46 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_182) begin
        RAS_ras_regfile_47 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_183) begin
        RAS_ras_regfile_48 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_184) begin
        RAS_ras_regfile_49 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_185) begin
        RAS_ras_regfile_50 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_186) begin
        RAS_ras_regfile_51 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_187) begin
        RAS_ras_regfile_52 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_188) begin
        RAS_ras_regfile_53 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_189) begin
        RAS_ras_regfile_54 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_190) begin
        RAS_ras_regfile_55 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_191) begin
        RAS_ras_regfile_56 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_192) begin
        RAS_ras_regfile_57 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_193) begin
        RAS_ras_regfile_58 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_194) begin
        RAS_ras_regfile_59 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_195) begin
        RAS_ras_regfile_60 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_196) begin
        RAS_ras_regfile_61 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_197) begin
        RAS_ras_regfile_62 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
      if(tmp_198) begin
        RAS_ras_regfile_63 <= tmp_RAS_ras_regfile_0; // @ Predictor.scala l198
      end
    end else begin
      if(RAS_ras_call_matched) begin
        if(tmp_135) begin
          RAS_ras_regfile_0 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_136) begin
          RAS_ras_regfile_1 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_137) begin
          RAS_ras_regfile_2 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_138) begin
          RAS_ras_regfile_3 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_139) begin
          RAS_ras_regfile_4 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_140) begin
          RAS_ras_regfile_5 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_141) begin
          RAS_ras_regfile_6 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_142) begin
          RAS_ras_regfile_7 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_143) begin
          RAS_ras_regfile_8 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_144) begin
          RAS_ras_regfile_9 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_145) begin
          RAS_ras_regfile_10 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_146) begin
          RAS_ras_regfile_11 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_147) begin
          RAS_ras_regfile_12 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_148) begin
          RAS_ras_regfile_13 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_149) begin
          RAS_ras_regfile_14 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_150) begin
          RAS_ras_regfile_15 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_151) begin
          RAS_ras_regfile_16 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_152) begin
          RAS_ras_regfile_17 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_153) begin
          RAS_ras_regfile_18 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_154) begin
          RAS_ras_regfile_19 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_155) begin
          RAS_ras_regfile_20 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_156) begin
          RAS_ras_regfile_21 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_157) begin
          RAS_ras_regfile_22 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_158) begin
          RAS_ras_regfile_23 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_159) begin
          RAS_ras_regfile_24 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_160) begin
          RAS_ras_regfile_25 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_161) begin
          RAS_ras_regfile_26 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_162) begin
          RAS_ras_regfile_27 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_163) begin
          RAS_ras_regfile_28 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_164) begin
          RAS_ras_regfile_29 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_165) begin
          RAS_ras_regfile_30 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_166) begin
          RAS_ras_regfile_31 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_167) begin
          RAS_ras_regfile_32 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_168) begin
          RAS_ras_regfile_33 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_169) begin
          RAS_ras_regfile_34 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_170) begin
          RAS_ras_regfile_35 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_171) begin
          RAS_ras_regfile_36 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_172) begin
          RAS_ras_regfile_37 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_173) begin
          RAS_ras_regfile_38 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_174) begin
          RAS_ras_regfile_39 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_175) begin
          RAS_ras_regfile_40 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_176) begin
          RAS_ras_regfile_41 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_177) begin
          RAS_ras_regfile_42 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_178) begin
          RAS_ras_regfile_43 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_179) begin
          RAS_ras_regfile_44 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_180) begin
          RAS_ras_regfile_45 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_181) begin
          RAS_ras_regfile_46 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_182) begin
          RAS_ras_regfile_47 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_183) begin
          RAS_ras_regfile_48 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_184) begin
          RAS_ras_regfile_49 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_185) begin
          RAS_ras_regfile_50 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_186) begin
          RAS_ras_regfile_51 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_187) begin
          RAS_ras_regfile_52 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_188) begin
          RAS_ras_regfile_53 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_189) begin
          RAS_ras_regfile_54 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_190) begin
          RAS_ras_regfile_55 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_191) begin
          RAS_ras_regfile_56 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_192) begin
          RAS_ras_regfile_57 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_193) begin
          RAS_ras_regfile_58 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_194) begin
          RAS_ras_regfile_59 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_195) begin
          RAS_ras_regfile_60 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_196) begin
          RAS_ras_regfile_61 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_197) begin
          RAS_ras_regfile_62 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
        if(tmp_198) begin
          RAS_ras_regfile_63 <= tmp_RAS_ras_regfile_0_1; // @ Predictor.scala l202
        end
      end
    end
  end


endmodule

module FIFO_2 (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input      [31:0]   ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output     [31:0]   ports_m_ports_payload,
  input               flush,
  input               clk,
  input               reset
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
  assign ports_s_ports_ready = (! fifo_full); // @ FIFO.scala l48
  assign ports_m_ports_valid = (! fifo_empty); // @ FIFO.scala l49
  assign ports_m_ports_payload = tmp_ports_m_ports_payload; // @ FIFO.scala l50
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000; // @ Data.scala l400
      write_ptr <= 3'b000; // @ Data.scala l400
    end else begin
      if(flush) begin
        read_ptr <= 3'b000; // @ FIFO.scala l35
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001); // @ FIFO.scala l38
        end
      end
      if(flush) begin
        write_ptr <= 3'b000; // @ FIFO.scala l41
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001); // @ FIFO.scala l44
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(tmp_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
      end
    end
  end


endmodule

module FIFO_1 (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input               ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output              ports_m_ports_payload,
  input               flush,
  input               clk,
  input               reset
);

  reg                 tmp_ports_m_ports_payload;
  reg        [2:0]    read_ptr;
  reg        [2:0]    write_ptr;
  wire       [1:0]    read_addr;
  wire       [1:0]    next_read_addr;
  wire       [1:0]    write_addr;
  wire                fifo_empty;
  wire                fifo_full;
  reg                 fifo_ram_0;
  reg                 fifo_ram_1;
  reg                 fifo_ram_2;
  reg                 fifo_ram_3;
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
  assign ports_s_ports_ready = (! fifo_full); // @ FIFO.scala l48
  assign ports_m_ports_valid = (! fifo_empty); // @ FIFO.scala l49
  assign ports_m_ports_payload = tmp_ports_m_ports_payload; // @ FIFO.scala l50
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000; // @ Data.scala l400
      write_ptr <= 3'b000; // @ Data.scala l400
    end else begin
      if(flush) begin
        read_ptr <= 3'b000; // @ FIFO.scala l35
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001); // @ FIFO.scala l38
        end
      end
      if(flush) begin
        write_ptr <= 3'b000; // @ FIFO.scala l41
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001); // @ FIFO.scala l44
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(tmp_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
      end
    end
  end


endmodule

module FIFO (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input      [63:0]   ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output     [63:0]   ports_m_ports_payload,
  input               flush,
  output     [63:0]   next_payload,
  output              next_valid,
  input               clk,
  input               reset
);

  reg        [63:0]   tmp_ports_m_ports_payload;
  reg        [63:0]   tmp_next_payload;
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
  reg        [2:0]    fifo_cnt;
  wire                ports_s_ports_fire_1;
  wire                ports_m_ports_fire_1;
  wire                ports_s_ports_fire_2;
  wire                ports_m_ports_fire_2;

  always @(*) begin
    case(read_addr)
      2'b00 : tmp_ports_m_ports_payload = fifo_ram_0;
      2'b01 : tmp_ports_m_ports_payload = fifo_ram_1;
      2'b10 : tmp_ports_m_ports_payload = fifo_ram_2;
      default : tmp_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  always @(*) begin
    case(next_read_addr)
      2'b00 : tmp_next_payload = fifo_ram_0;
      2'b01 : tmp_next_payload = fifo_ram_1;
      2'b10 : tmp_next_payload = fifo_ram_2;
      default : tmp_next_payload = fifo_ram_3;
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
  assign ports_s_ports_ready = (! fifo_full); // @ FIFO.scala l48
  assign ports_m_ports_valid = (! fifo_empty); // @ FIFO.scala l49
  assign ports_m_ports_payload = tmp_ports_m_ports_payload; // @ FIFO.scala l50
  assign next_payload = tmp_next_payload; // @ FIFO.scala l57
  assign ports_s_ports_fire_1 = (ports_s_ports_valid && ports_s_ports_ready); // @ BaseType.scala l305
  assign ports_m_ports_fire_1 = (ports_m_ports_valid && ports_m_ports_ready); // @ BaseType.scala l305
  assign ports_s_ports_fire_2 = (ports_s_ports_valid && ports_s_ports_ready); // @ BaseType.scala l305
  assign ports_m_ports_fire_2 = (ports_m_ports_valid && ports_m_ports_ready); // @ BaseType.scala l305
  assign next_valid = (3'b010 <= fifo_cnt); // @ FIFO.scala l69
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000; // @ Data.scala l400
      write_ptr <= 3'b000; // @ Data.scala l400
      fifo_cnt <= 3'b000; // @ Data.scala l400
    end else begin
      if(flush) begin
        read_ptr <= 3'b000; // @ FIFO.scala l35
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001); // @ FIFO.scala l38
        end
      end
      if(flush) begin
        write_ptr <= 3'b000; // @ FIFO.scala l41
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001); // @ FIFO.scala l44
        end
      end
      if(flush) begin
        fifo_cnt <= 3'b000; // @ FIFO.scala l59
      end else begin
        if((ports_s_ports_fire_1 && (! ports_m_ports_fire_1))) begin
          fifo_cnt <= (fifo_cnt + 3'b001); // @ FIFO.scala l62
        end else begin
          if(((! ports_s_ports_fire_2) && ports_m_ports_fire_2)) begin
            fifo_cnt <= (fifo_cnt - 3'b001); // @ FIFO.scala l65
          end
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(tmp_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
        if(tmp_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload; // @ FIFO.scala l45
        end
      end
    end
  end


endmodule
