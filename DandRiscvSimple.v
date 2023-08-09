// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : DandRiscvSimple
// Git hash  : 2632c2df1b302908bc7fe3dded5c2a79426541fc

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
  wire                static_predictor_1_predict_taken;
  wire       [63:0]   static_predictor_1_predict_pc_next;
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
  wire                _zz_fetch_FETCH_DEC_IMM_5;
  wire                _zz_fetch_FETCH_DEC_IMM_6;
  wire                _zz_fetch_FETCH_DEC_IMM_7;
  wire       [11:0]   _zz__zz_decode_DecodePlugin_imm_2;
  wire       [11:0]   _zz__zz_decode_DecodePlugin_imm_4;
  wire       [19:0]   _zz__zz_decode_DecodePlugin_imm_6;
  wire       [31:0]   _zz__zz_decode_DecodePlugin_imm_8;
  wire       [11:0]   _zz__zz_fetch_FETCH_DEC_IMM_1;
  wire       [19:0]   _zz__zz_fetch_FETCH_DEC_IMM_3;
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
  wire       [63:0]   _zz_execute_ALUPlugin_blt_result;
  wire       [63:0]   _zz_execute_ALUPlugin_blt_result_1;
  wire       [63:0]   _zz_execute_ALUPlugin_bge_result;
  wire       [63:0]   _zz_execute_ALUPlugin_bge_result_1;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_1;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_2;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_3;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_4;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_5;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_6;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_7;
  wire       [63:0]   _zz_execute_ALUPlugin_pc_next_8;
  wire       [63:0]   writeback_RD;
  wire                memaccess_LSU_HOLD;
  wire                memaccess_TIMER_CEN;
  wire       [63:0]   memaccess_LSU_WDATA;
  wire       [63:0]   memaccess_LSU_RDATA;
  wire                execute_INT_HOLD;
  wire       [63:0]   execute_REDIRECT_PC_NEXT;
  wire                execute_REDIRECT_VALID;
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
  wire       [63:0]   fetch_FETCH_DEC_IMM;
  wire                fetch_FETCH_DEC_BRANCH;
  wire                fetch_FETCH_DEC_JAL;
  wire                decode_PREDICT_TAKEN;
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
  wire                memaccess_IS_LOAD;
  wire                memaccess_IS_STORE;
  wire       [63:0]   memaccess_MEM_WDATA;
  wire       [3:0]    execute_CSR_CTRL;
  wire       [63:0]   execute_CSR_RDATA;
  wire       [3:0]    _zz_decode_to_execute_CSR_CTRL;
  wire       [11:0]   _zz_decode_to_execute_CSR_ADDR;
  wire       [63:0]   _zz_fetch_to_decode_PC;
  wire                _zz_DecodePlugin_hazard_ctrl_rs1_from_mem;
  wire       [4:0]    _zz_DecodePlugin_hazard_rs2_from_mem;
  wire                _zz_DecodePlugin_hazard_rs1_from_mem;
  wire       [4:0]    _zz_DecodePlugin_hazard_rs1_from_mem_1;
  wire       [4:0]    _zz_DecodePlugin_hazard_rs1_from_mem_2;
  wire                _zz_DecodePlugin_hazard_rs1_from_mem_3;
  wire       [63:0]   execute_PC_NEXT;
  wire                execute_PREDICT_TAKEN;
  wire                execute_ALU_WORD;
  wire                execute_CTRL_RS2_FROM_WB;
  wire                execute_CTRL_RS2_FROM_MEM;
  wire                execute_CTRL_RS1_FROM_WB;
  wire       [63:0]   _zz_execute_MEM_WDATA;
  wire                execute_CTRL_RS1_FROM_MEM;
  wire       [63:0]   execute_RS2;
  wire                execute_RS2_FROM_WB;
  wire                execute_RS2_FROM_MEM;
  wire       [63:0]   execute_IMM;
  wire                execute_SRC2_IS_IMM;
  wire       [63:0]   execute_RS1;
  wire                execute_RS1_FROM_WB;
  wire       [63:0]   memaccess_ALU_RESULT;
  wire                execute_RS1_FROM_MEM;
  wire       [63:0]   execute_PC;
  wire       [4:0]    execute_RS1_ADDR;
  wire       [4:0]    execute_RD_ADDR;
  wire       [4:0]    execute_ALU_CTRL;
  wire       [63:0]   _zz_execute_MEM_WDATA_1;
  wire       [4:0]    _zz_DecodePlugin_hazard_rs1_from_wb;
  wire                _zz_DecodePlugin_hazard_rs1_from_wb_1;
  wire       [31:0]   _zz_fetch_FETCH_DEC_IMM;
  wire       [31:0]   decode_INSTRUCTION;
  wire       [63:0]   decode_PC;
  wire       [63:0]   _zz_fetch_to_decode_PC_NEXT;
  wire                fetch_PREDICT_TAKEN;
  wire       [63:0]   fetch_BPU_PC_NEXT;
  wire                fetch_BPU_BRANCH_TAKEN;
  wire       [63:0]   _zz_pc_next;
  wire                when_FetchPlugin_l119;
  wire       [63:0]   _zz_pc_next_1;
  wire                when_FetchPlugin_l116;
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
  wire                DecodePlugin_hazard_rs1_from_wb;
  wire                DecodePlugin_hazard_rs2_from_wb;
  wire                DecodePlugin_hazard_load_use;
  wire                DecodePlugin_hazard_ctrl_rs1_from_mem;
  wire                DecodePlugin_hazard_ctrl_rs2_from_mem;
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
  wire                DCachePlugin_dcache_access_rsp_valid;
  wire       [63:0]   DCachePlugin_dcache_access_rsp_payload_data;
  reg        [63:0]   pc_next;
  reg                 fetch_valid;
  reg        [63:0]   int_pc_reg;
  reg                 int_en_reg;
  wire                fetch_FetchPlugin_fetch_flush;
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
  wire       [1:0]    BUSY;
  wire       [1:0]    HALT;
  reg        [1:0]    fetch_state_next;
  reg        [1:0]    fetch_state;
  wire                when_FetchPlugin_l64;
  wire                ICachePlugin_icache_access_cmd_isStall;
  wire                ICachePlugin_icache_access_cmd_fire;
  wire                when_FetchPlugin_l94;
  wire                when_FetchPlugin_l107;
  wire                ICachePlugin_icache_access_cmd_fire_1;
  wire                when_FetchPlugin_l134;
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
  wire                when_DecodePlugin_l116;
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
  wire                when_DecodePlugin_l119;
  wire                when_DecodePlugin_l122;
  wire                when_DecodePlugin_l125;
  wire                when_DecodePlugin_l128;
  wire                _zz_fetch_FETCH_DEC_IMM_1;
  reg        [50:0]   _zz_fetch_FETCH_DEC_IMM_2;
  wire                _zz_fetch_FETCH_DEC_IMM_3;
  reg        [42:0]   _zz_fetch_FETCH_DEC_IMM_4;
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
  wire                when_AluPlugin_l76;
  wire                when_AluPlugin_l97;
  wire                when_AluPlugin_l145;
  wire                when_AluPlugin_l152;
  wire       [62:0]   _zz_execute_ALUPlugin_alu_result;
  wire       [62:0]   _zz_execute_ALUPlugin_alu_result_1;
  wire                when_AluPlugin_l168;
  wire                when_AluPlugin_l175;
  wire                when_AluPlugin_l182;
  wire                execute_ALUPlugin_beq_result;
  wire                execute_ALUPlugin_bne_result;
  wire                execute_ALUPlugin_blt_result;
  wire                execute_ALUPlugin_bge_result;
  wire                execute_ALUPlugin_bltu_result;
  wire                execute_ALUPlugin_bgeu_result;
  wire                execute_ALUPlugin_branch_taken;
  reg        [6:0]    execute_ALUPlugin_branch_history;
  wire                when_AluPlugin_l222;
  wire                when_AluPlugin_l230;
  wire                when_AluPlugin_l265;
  reg        [63:0]   execute_ExcepPlugin_csr_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrs_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrc_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrsi_wdata;
  wire       [63:0]   execute_ExcepPlugin_csrrci_wdata;
  wire                _zz_memaccess_LSUPlugin_dcache_lb;
  reg        [55:0]   _zz_memaccess_LSUPlugin_dcache_lb_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lb;
  reg        [55:0]   _zz_memaccess_LSUPlugin_dcache_lbu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lbu;
  wire                _zz_memaccess_LSUPlugin_dcache_lh;
  reg        [47:0]   _zz_memaccess_LSUPlugin_dcache_lh_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lh;
  reg        [47:0]   _zz_memaccess_LSUPlugin_dcache_lhu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lhu;
  wire                _zz_memaccess_LSUPlugin_dcache_lw;
  reg        [31:0]   _zz_memaccess_LSUPlugin_dcache_lw_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lw;
  reg        [31:0]   _zz_memaccess_LSUPlugin_dcache_lwu;
  wire       [63:0]   memaccess_LSUPlugin_dcache_lwu;
  reg        [63:0]   memaccess_LSUPlugin_dcache_data_load;
  wire                _zz_memaccess_LSUPlugin_dcache_sb;
  reg        [55:0]   _zz_memaccess_LSUPlugin_dcache_sb_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sb;
  wire                _zz_memaccess_LSUPlugin_dcache_sh;
  reg        [47:0]   _zz_memaccess_LSUPlugin_dcache_sh_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sh;
  wire                _zz_memaccess_LSUPlugin_dcache_sw;
  reg        [31:0]   _zz_memaccess_LSUPlugin_dcache_sw_1;
  wire       [63:0]   memaccess_LSUPlugin_dcache_sw;
  reg        [63:0]   memaccess_LSUPlugin_dcache_wdata;
  reg        [7:0]    memaccess_LSUPlugin_dcache_wstrb;
  wire       [63:0]   memaccess_LSUPlugin_cpu_addr;
  wire                memaccess_LSUPlugin_is_mem;
  wire                memaccess_LSUPlugin_is_timer;
  wire                memaccess_LSUPlugin_lsu_ready;
  wire       [63:0]   memaccess_LSUPlugin_lsu_addr;
  wire       [63:0]   memaccess_LSUPlugin_lsu_rdata;
  wire       [63:0]   memaccess_LSUPlugin_lsu_wdata;
  wire                memaccess_LSUPlugin_lsu_wen;
  wire       [7:0]    memaccess_LSUPlugin_lsu_wstrb;
  reg        [7:0]    _zz_memaccess_LSUPlugin_dcache_wstrb;
  reg        [7:0]    _zz_memaccess_LSUPlugin_dcache_wstrb_1;
  reg        [7:0]    _zz_memaccess_LSUPlugin_dcache_wstrb_2;
  wire       [7:0]    _zz_memaccess_LSUPlugin_dcache_wstrb_3;
  wire                when_Pipeline_l127;
  reg        [63:0]   fetch_to_decode_PC;
  wire                when_Pipeline_l127_1;
  reg        [63:0]   decode_to_execute_PC;
  wire                when_Pipeline_l127_2;
  reg        [63:0]   execute_to_memaccess_PC;
  wire                when_Pipeline_l127_3;
  reg        [63:0]   memaccess_to_writeback_PC;
  wire                when_Pipeline_l127_4;
  reg        [63:0]   fetch_to_decode_PC_NEXT;
  wire                when_Pipeline_l127_5;
  reg        [63:0]   decode_to_execute_PC_NEXT;
  wire                when_Pipeline_l127_6;
  reg        [31:0]   fetch_to_decode_INSTRUCTION;
  wire                when_Pipeline_l127_7;
  reg        [31:0]   decode_to_execute_INSTRUCTION;
  wire                when_Pipeline_l127_8;
  reg        [31:0]   execute_to_memaccess_INSTRUCTION;
  wire                when_Pipeline_l127_9;
  reg        [31:0]   memaccess_to_writeback_INSTRUCTION;
  wire                when_Pipeline_l127_10;
  reg                 fetch_to_decode_PREDICT_TAKEN;
  wire                when_Pipeline_l127_11;
  reg                 decode_to_execute_PREDICT_TAKEN;
  wire                when_Pipeline_l127_12;
  reg        [63:0]   decode_to_execute_IMM;
  wire                when_Pipeline_l127_13;
  reg        [63:0]   decode_to_execute_RS1;
  wire                when_Pipeline_l127_14;
  reg        [63:0]   decode_to_execute_RS2;
  wire                when_Pipeline_l127_15;
  reg        [4:0]    decode_to_execute_RS1_ADDR;
  wire                when_Pipeline_l127_16;
  reg        [4:0]    decode_to_execute_RS2_ADDR;
  wire                when_Pipeline_l127_17;
  reg        [4:0]    decode_to_execute_ALU_CTRL;
  wire                when_Pipeline_l127_18;
  reg                 decode_to_execute_ALU_WORD;
  wire                when_Pipeline_l127_19;
  reg                 decode_to_execute_SRC2_IS_IMM;
  wire                when_Pipeline_l127_20;
  reg        [3:0]    decode_to_execute_MEM_CTRL;
  wire                when_Pipeline_l127_21;
  reg        [3:0]    execute_to_memaccess_MEM_CTRL;
  wire                when_Pipeline_l127_22;
  reg                 decode_to_execute_RD_WEN;
  wire                when_Pipeline_l127_23;
  reg                 execute_to_memaccess_RD_WEN;
  wire                when_Pipeline_l127_24;
  reg                 memaccess_to_writeback_RD_WEN;
  wire                when_Pipeline_l127_25;
  reg        [4:0]    decode_to_execute_RD_ADDR;
  wire                when_Pipeline_l127_26;
  reg        [4:0]    execute_to_memaccess_RD_ADDR;
  wire                when_Pipeline_l127_27;
  reg        [4:0]    memaccess_to_writeback_RD_ADDR;
  wire                when_Pipeline_l127_28;
  reg                 decode_to_execute_IS_LOAD;
  wire                when_Pipeline_l127_29;
  reg                 execute_to_memaccess_IS_LOAD;
  wire                when_Pipeline_l127_30;
  reg                 memaccess_to_writeback_IS_LOAD;
  wire                when_Pipeline_l127_31;
  reg                 decode_to_execute_IS_STORE;
  wire                when_Pipeline_l127_32;
  reg                 execute_to_memaccess_IS_STORE;
  wire                when_Pipeline_l127_33;
  reg        [3:0]    decode_to_execute_CSR_CTRL;
  wire                when_Pipeline_l127_34;
  reg        [11:0]   decode_to_execute_CSR_ADDR;
  wire                when_Pipeline_l127_35;
  reg                 decode_to_execute_CSR_WEN;
  wire                when_Pipeline_l127_36;
  reg        [63:0]   decode_to_execute_CSR_RDATA;
  wire                when_Pipeline_l127_37;
  reg        [63:0]   execute_to_memaccess_ALU_RESULT;
  wire                when_Pipeline_l127_38;
  reg        [63:0]   memaccess_to_writeback_ALU_RESULT;
  wire                when_Pipeline_l127_39;
  reg        [63:0]   execute_to_memaccess_MEM_WDATA;
  wire                when_Pipeline_l127_40;
  reg        [63:0]   memaccess_to_writeback_LSU_RDATA;
  wire                when_Pipeline_l163;
  wire                when_Pipeline_l166;
  wire                when_Pipeline_l163_1;
  wire                when_Pipeline_l166_1;
  wire                when_Pipeline_l163_2;
  wire                when_Pipeline_l166_2;
  wire                when_Pipeline_l163_3;
  wire                when_Pipeline_l166_3;
  function [55:0] zz__zz_memaccess_LSUPlugin_dcache_lbu(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_lbu[55] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[54] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[53] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[52] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[51] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[50] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[49] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[48] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[47] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[46] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[45] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[44] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[43] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[42] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[41] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[40] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[39] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[38] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[37] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[36] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[35] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[34] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[33] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[32] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[31] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[30] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[29] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[28] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[27] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[26] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[25] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[24] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[23] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[22] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[21] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[20] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[19] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[18] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[17] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[16] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[15] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[14] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[13] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[12] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[11] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[10] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[9] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[8] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[7] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[6] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[5] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[4] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[3] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[2] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[1] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lbu[0] = 1'b0;
    end
  endfunction
  wire [55:0] _zz_1;
  function [47:0] zz__zz_memaccess_LSUPlugin_dcache_lhu(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_lhu[47] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[46] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[45] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[44] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[43] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[42] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[41] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[40] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[39] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[38] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[37] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[36] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[35] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[34] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[33] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[32] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[31] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[30] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[29] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[28] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[27] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[26] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[25] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[24] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[23] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[22] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[21] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[20] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[19] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[18] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[17] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[16] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[15] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[14] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[13] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[12] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[11] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[10] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[9] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[8] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[7] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[6] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[5] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[4] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[3] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[2] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[1] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lhu[0] = 1'b0;
    end
  endfunction
  wire [47:0] _zz_2;
  function [31:0] zz__zz_memaccess_LSUPlugin_dcache_lwu(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_lwu[31] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[30] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[29] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[28] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[27] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[26] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[25] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[24] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[23] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[22] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[21] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[20] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[19] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[18] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[17] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[16] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[15] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[14] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[13] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[12] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[11] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[10] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[9] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[8] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[7] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[6] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[5] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[4] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[3] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[2] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[1] = 1'b0;
      zz__zz_memaccess_LSUPlugin_dcache_lwu[0] = 1'b0;
    end
  endfunction
  wire [31:0] _zz_3;
  function [7:0] zz__zz_memaccess_LSUPlugin_dcache_wstrb(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_wstrb = 8'h0;
      zz__zz_memaccess_LSUPlugin_dcache_wstrb[0] = 1'b1;
    end
  endfunction
  wire [7:0] _zz_4;
  function [7:0] zz__zz_memaccess_LSUPlugin_dcache_wstrb_1(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_wstrb_1 = 8'h0;
      zz__zz_memaccess_LSUPlugin_dcache_wstrb_1[1 : 0] = 2'b11;
    end
  endfunction
  wire [7:0] _zz_5;
  function [7:0] zz__zz_memaccess_LSUPlugin_dcache_wstrb_2(input dummy);
    begin
      zz__zz_memaccess_LSUPlugin_dcache_wstrb_2 = 8'h0;
      zz__zz_memaccess_LSUPlugin_dcache_wstrb_2[3 : 0] = 4'b1111;
    end
  endfunction
  wire [7:0] _zz_6;

  assign _zz__zz_decode_DecodePlugin_imm_2 = {decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]};
  assign _zz__zz_decode_DecodePlugin_imm_4 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]};
  assign _zz__zz_decode_DecodePlugin_imm_6 = {{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]};
  assign _zz__zz_decode_DecodePlugin_imm_8 = {decode_INSTRUCTION[31 : 12],12'h0};
  assign _zz__zz_fetch_FETCH_DEC_IMM_1 = {{{_zz_fetch_FETCH_DEC_IMM[31],_zz_fetch_FETCH_DEC_IMM[7]},_zz_fetch_FETCH_DEC_IMM[30 : 25]},_zz_fetch_FETCH_DEC_IMM[11 : 8]};
  assign _zz__zz_fetch_FETCH_DEC_IMM_3 = {{{_zz_fetch_FETCH_DEC_IMM[31],_zz_fetch_FETCH_DEC_IMM[19 : 12]},_zz_fetch_FETCH_DEC_IMM[20]},_zz_fetch_FETCH_DEC_IMM[30 : 21]};
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
  assign _zz_execute_ALUPlugin_blt_result = execute_ALUPlugin_branch_src1;
  assign _zz_execute_ALUPlugin_blt_result_1 = execute_ALUPlugin_branch_src2;
  assign _zz_execute_ALUPlugin_bge_result = execute_ALUPlugin_branch_src2;
  assign _zz_execute_ALUPlugin_bge_result_1 = execute_ALUPlugin_branch_src1;
  assign _zz_execute_ALUPlugin_pc_next = (_zz_execute_ALUPlugin_pc_next_1 & _zz_execute_ALUPlugin_pc_next_4);
  assign _zz_execute_ALUPlugin_pc_next_1 = ($signed(_zz_execute_ALUPlugin_pc_next_2) + $signed(_zz_execute_ALUPlugin_pc_next_3));
  assign _zz_execute_ALUPlugin_pc_next_2 = execute_ALUPlugin_branch_src1;
  assign _zz_execute_ALUPlugin_pc_next_3 = execute_IMM;
  assign _zz_execute_ALUPlugin_pc_next_4 = (~ _zz_execute_ALUPlugin_pc_next_5);
  assign _zz_execute_ALUPlugin_pc_next_5 = 64'h0000000000000001;
  assign _zz_execute_ALUPlugin_pc_next_6 = ($signed(_zz_execute_ALUPlugin_pc_next_7) + $signed(_zz_execute_ALUPlugin_pc_next_8));
  assign _zz_execute_ALUPlugin_pc_next_7 = execute_PC;
  assign _zz_execute_ALUPlugin_pc_next_8 = execute_IMM;
  assign _zz_fetch_FETCH_DEC_IMM_5 = _zz_fetch_FETCH_DEC_IMM[31];
  assign _zz_fetch_FETCH_DEC_IMM_6 = _zz_fetch_FETCH_DEC_IMM[7];
  assign _zz_fetch_FETCH_DEC_IMM_7 = _zz_fetch_FETCH_DEC_IMM[31];
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
  static_predictor static_predictor_1 (
    .predict_pc      (_zz_fetch_to_decode_PC_NEXT[63:0]       ), //i
    .predict_imm     (fetch_FETCH_DEC_IMM[63:0]               ), //i
    .predict_valid   (fetch_PREDICT_VALID                     ), //i
    .predict_jal     (fetch_FETCH_DEC_JAL                     ), //i
    .predict_branch  (fetch_FETCH_DEC_BRANCH                  ), //i
    .predict_taken   (static_predictor_1_predict_taken        ), //o
    .predict_pc_next (static_predictor_1_predict_pc_next[63:0])  //o
  );
  RegFileModule regFileModule_1 (
    .read_ports_rs1_value (regFileModule_1_read_ports_rs1_value[63:0]), //o
    .read_ports_rs2_value (regFileModule_1_read_ports_rs2_value[63:0]), //o
    .read_ports_rs1_addr  (decode_DecodePlugin_rs1_addr[4:0]         ), //i
    .read_ports_rs2_addr  (decode_DecodePlugin_rs2_addr[4:0]         ), //i
    .read_ports_rs1_req   (decode_DecodePlugin_rs1_req               ), //i
    .read_ports_rs2_req   (decode_DecodePlugin_rs2_req               ), //i
    .write_ports_rd_value (_zz_execute_MEM_WDATA_1[63:0]             ), //i
    .write_ports_rd_addr  (_zz_DecodePlugin_hazard_rs1_from_wb[4:0]  ), //i
    .write_ports_rd_wen   (regFileModule_1_write_ports_rd_wen        ), //i
    .clk                  (clk                                       ), //i
    .reset                (reset                                     )  //i
  );
  CsrRegfile csrRegfile_1 (
    .cpu_ports_waddr            (execute_CSR_ADDR[11:0]                 ), //i
    .cpu_ports_wen              (execute_CSR_WEN                        ), //i
    .cpu_ports_wdata            (execute_ExcepPlugin_csr_wdata[63:0]    ), //i
    .cpu_ports_raddr            (_zz_decode_to_execute_CSR_ADDR[11:0]   ), //i
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
    .pc                       (_zz_fetch_to_decode_PC[63:0]           ), //i
    .pc_next                  (_zz_pc_next[63:0]                      ), //i
    .pc_next_valid            (when_FetchPlugin_l119                  ), //i
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
  assign writeback_RD = (writeback_IS_LOAD ? writeback_LSU_RDATA : writeback_ALU_RESULT);
  assign memaccess_LSU_HOLD = (! DCachePlugin_dcache_access_cmd_ready);
  assign memaccess_TIMER_CEN = ((memaccess_LSUPlugin_is_timer && memaccess_LSUPlugin_is_mem) && memaccess_arbitration_isFiring);
  assign memaccess_LSU_WDATA = memaccess_LSUPlugin_lsu_wdata;
  assign memaccess_LSU_RDATA = memaccess_LSUPlugin_lsu_rdata;
  assign execute_INT_HOLD = clint_1_int_hold;
  assign execute_REDIRECT_PC_NEXT = execute_ALUPlugin_redirect_pc_next;
  assign execute_REDIRECT_VALID = execute_ALUPlugin_redirect_valid;
  assign execute_BRANCH_OR_JALR = execute_ALUPlugin_branch_or_jalr;
  assign execute_MEM_WDATA = (execute_RS2_FROM_WB ? _zz_execute_MEM_WDATA_1 : (execute_RS2_FROM_MEM ? _zz_execute_MEM_WDATA : execute_RS2));
  assign execute_ALU_RESULT = execute_ALUPlugin_alu_result;
  assign decode_CSR_RDATA = csrRegfile_1_cpu_ports_rdata;
  assign execute_CSR_WEN = decode_to_execute_CSR_WEN;
  assign decode_CSR_WEN = decode_DecodePlugin_csr_wen;
  assign execute_CSR_ADDR = decode_to_execute_CSR_ADDR;
  assign decode_CSR_ADDR = decode_DecodePlugin_csr_addr;
  assign decode_CSR_CTRL = decode_DecodePlugin_csr_ctrl;
  assign execute_IS_STORE = decode_to_execute_IS_STORE;
  assign decode_IS_STORE = decode_DecodePlugin_is_store;
  assign execute_IS_LOAD = decode_to_execute_IS_LOAD;
  assign decode_IS_LOAD = decode_DecodePlugin_is_load;
  assign writeback_RD_ADDR = memaccess_to_writeback_RD_ADDR;
  assign memaccess_RD_ADDR = execute_to_memaccess_RD_ADDR;
  assign decode_RD_ADDR = decode_DecodePlugin_rd_addr;
  assign writeback_RD_WEN = memaccess_to_writeback_RD_WEN;
  assign memaccess_RD_WEN = execute_to_memaccess_RD_WEN;
  assign execute_RD_WEN = decode_to_execute_RD_WEN;
  assign decode_RD_WEN = decode_DecodePlugin_rd_wen;
  assign execute_MEM_CTRL = decode_to_execute_MEM_CTRL;
  assign decode_MEM_CTRL = decode_DecodePlugin_mem_ctrl;
  assign decode_SRC2_IS_IMM = decode_DecodePlugin_src2_is_imm;
  assign decode_ALU_WORD = decode_DecodePlugin_alu_word;
  assign decode_ALU_CTRL = decode_DecodePlugin_alu_ctrl;
  assign execute_RS2_ADDR = decode_to_execute_RS2_ADDR;
  assign decode_RS2_ADDR = decode_DecodePlugin_rs2_addr;
  assign decode_RS1_ADDR = decode_DecodePlugin_rs1_addr;
  assign decode_RS2 = decode_DecodePlugin_rs2;
  assign decode_RS1 = decode_DecodePlugin_rs1;
  assign decode_IMM = decode_DecodePlugin_imm;
  assign fetch_INT_PC = clint_1_int_pc;
  assign fetch_INT_EN = clint_1_int_en;
  assign fetch_FETCH_DEC_IMM = ((_zz_fetch_FETCH_DEC_IMM[6 : 0] == 7'h63) ? {{_zz_fetch_FETCH_DEC_IMM_2,{{{_zz_fetch_FETCH_DEC_IMM_5,_zz_fetch_FETCH_DEC_IMM_6},_zz_fetch_FETCH_DEC_IMM[30 : 25]},_zz_fetch_FETCH_DEC_IMM[11 : 8]}},1'b0} : {{_zz_fetch_FETCH_DEC_IMM_4,{{{_zz_fetch_FETCH_DEC_IMM_7,_zz_fetch_FETCH_DEC_IMM[19 : 12]},_zz_fetch_FETCH_DEC_IMM[20]},_zz_fetch_FETCH_DEC_IMM[30 : 21]}},1'b0});
  assign fetch_FETCH_DEC_BRANCH = (_zz_fetch_FETCH_DEC_IMM[6 : 0] == 7'h63);
  assign fetch_FETCH_DEC_JAL = (_zz_fetch_FETCH_DEC_IMM[6 : 0] == 7'h6f);
  assign decode_PREDICT_TAKEN = fetch_to_decode_PREDICT_TAKEN;
  assign fetch_PREDICT_VALID = ICachePlugin_icache_access_cmd_fire_4;
  assign memaccess_INSTRUCTION = execute_to_memaccess_INSTRUCTION;
  assign execute_INSTRUCTION = decode_to_execute_INSTRUCTION;
  assign fetch_INSTRUCTION = fetch_FetchPlugin_instruction_out_stream_payload;
  assign decode_PC_NEXT = fetch_to_decode_PC_NEXT;
  assign fetch_PC_NEXT = fetch_FetchPlugin_pc_stream_fifo_next_payload;
  assign memaccess_PC = execute_to_memaccess_PC;
  assign fetch_PC = fetch_FetchPlugin_pc_out_stream_payload;
  assign writeback_INSTRUCTION = memaccess_to_writeback_INSTRUCTION;
  assign writeback_PC = memaccess_to_writeback_PC;
  assign writeback_ALU_RESULT = memaccess_to_writeback_ALU_RESULT;
  assign writeback_LSU_RDATA = memaccess_to_writeback_LSU_RDATA;
  assign writeback_IS_LOAD = memaccess_to_writeback_IS_LOAD;
  assign memaccess_MEM_CTRL = execute_to_memaccess_MEM_CTRL;
  assign memaccess_IS_LOAD = execute_to_memaccess_IS_LOAD;
  assign memaccess_IS_STORE = execute_to_memaccess_IS_STORE;
  assign memaccess_MEM_WDATA = execute_to_memaccess_MEM_WDATA;
  assign execute_CSR_CTRL = decode_to_execute_CSR_CTRL;
  assign execute_CSR_RDATA = decode_to_execute_CSR_RDATA;
  assign _zz_decode_to_execute_CSR_CTRL = decode_CSR_CTRL;
  assign _zz_decode_to_execute_CSR_ADDR = decode_CSR_ADDR;
  assign _zz_fetch_to_decode_PC = fetch_PC;
  assign _zz_DecodePlugin_hazard_ctrl_rs1_from_mem = execute_BRANCH_OR_JALR;
  assign _zz_DecodePlugin_hazard_rs2_from_mem = execute_RS2_ADDR;
  assign _zz_DecodePlugin_hazard_rs1_from_mem = memaccess_IS_LOAD;
  assign _zz_DecodePlugin_hazard_rs1_from_mem_1 = execute_RS1_ADDR;
  assign _zz_DecodePlugin_hazard_rs1_from_mem_2 = memaccess_RD_ADDR;
  assign _zz_DecodePlugin_hazard_rs1_from_mem_3 = memaccess_RD_WEN;
  assign execute_PC_NEXT = decode_to_execute_PC_NEXT;
  assign execute_PREDICT_TAKEN = decode_to_execute_PREDICT_TAKEN;
  assign execute_ALU_WORD = decode_to_execute_ALU_WORD;
  assign execute_CTRL_RS2_FROM_WB = DecodePlugin_hazard_ctrl_rs2_from_wb;
  assign execute_CTRL_RS2_FROM_MEM = DecodePlugin_hazard_ctrl_rs2_from_mem;
  assign execute_CTRL_RS1_FROM_WB = DecodePlugin_hazard_ctrl_rs1_from_wb;
  assign _zz_execute_MEM_WDATA = memaccess_ALU_RESULT;
  assign execute_CTRL_RS1_FROM_MEM = DecodePlugin_hazard_ctrl_rs1_from_mem;
  assign execute_RS2 = decode_to_execute_RS2;
  assign execute_RS2_FROM_WB = DecodePlugin_hazard_rs2_from_wb;
  assign execute_RS2_FROM_MEM = DecodePlugin_hazard_rs2_from_mem;
  assign execute_IMM = decode_to_execute_IMM;
  assign execute_SRC2_IS_IMM = decode_to_execute_SRC2_IS_IMM;
  assign execute_RS1 = decode_to_execute_RS1;
  assign execute_RS1_FROM_WB = DecodePlugin_hazard_rs1_from_wb;
  assign memaccess_ALU_RESULT = execute_to_memaccess_ALU_RESULT;
  assign execute_RS1_FROM_MEM = DecodePlugin_hazard_rs1_from_mem;
  assign execute_PC = decode_to_execute_PC;
  assign execute_RS1_ADDR = decode_to_execute_RS1_ADDR;
  assign execute_RD_ADDR = decode_to_execute_RD_ADDR;
  assign execute_ALU_CTRL = decode_to_execute_ALU_CTRL;
  assign _zz_execute_MEM_WDATA_1 = writeback_RD;
  assign _zz_DecodePlugin_hazard_rs1_from_wb = writeback_RD_ADDR;
  assign _zz_DecodePlugin_hazard_rs1_from_wb_1 = writeback_RD_WEN;
  assign _zz_fetch_FETCH_DEC_IMM = fetch_INSTRUCTION;
  assign decode_INSTRUCTION = fetch_to_decode_INSTRUCTION;
  assign decode_PC = fetch_to_decode_PC;
  assign _zz_fetch_to_decode_PC_NEXT = fetch_PC_NEXT;
  assign fetch_PREDICT_TAKEN = fetch_FetchPlugin_predict_taken_out_payload;
  assign fetch_BPU_PC_NEXT = static_predictor_1_predict_pc_next;
  assign fetch_BPU_BRANCH_TAKEN = static_predictor_1_predict_taken;
  assign _zz_pc_next = execute_REDIRECT_PC_NEXT;
  assign when_FetchPlugin_l119 = execute_REDIRECT_VALID;
  assign _zz_pc_next_1 = fetch_INT_PC;
  assign when_FetchPlugin_l116 = fetch_INT_EN;
  assign fetch_arbitration_haltByOther = 1'b0;
  always @(*) begin
    fetch_arbitration_removeIt = 1'b0;
    if(fetch_arbitration_isFlushed) begin
      fetch_arbitration_removeIt = 1'b1;
    end
  end

  assign fetch_arbitration_flushNext = 1'b0;
  assign decode_arbitration_haltByOther = 1'b0;
  always @(*) begin
    decode_arbitration_removeIt = 1'b0;
    if(decode_arbitration_isFlushed) begin
      decode_arbitration_removeIt = 1'b1;
    end
  end

  assign decode_arbitration_flushNext = 1'b0;
  assign execute_arbitration_haltByOther = 1'b0;
  always @(*) begin
    execute_arbitration_removeIt = 1'b0;
    if(execute_arbitration_isFlushed) begin
      execute_arbitration_removeIt = 1'b1;
    end
  end

  assign execute_arbitration_flushNext = 1'b0;
  assign memaccess_arbitration_haltByOther = 1'b0;
  always @(*) begin
    memaccess_arbitration_removeIt = 1'b0;
    if(memaccess_arbitration_isFlushed) begin
      memaccess_arbitration_removeIt = 1'b1;
    end
  end

  assign memaccess_arbitration_flushNext = 1'b0;
  assign writeback_arbitration_haltByOther = 1'b0;
  always @(*) begin
    writeback_arbitration_removeIt = 1'b0;
    if(writeback_arbitration_isFlushed) begin
      writeback_arbitration_removeIt = 1'b1;
    end
  end

  assign writeback_arbitration_flushNext = 1'b0;
  assign fetch_FetchPlugin_fetch_flush = ((when_FetchPlugin_l116 || int_en_reg) || fetch_arbitration_flushIt);
  assign fetch_FetchPlugin_fifo_all_valid = ((fetch_FetchPlugin_pc_out_stream_valid && fetch_FetchPlugin_instruction_out_stream_valid) && fetch_FetchPlugin_pc_stream_fifo_next_valid);
  assign IDLE = 2'b00;
  assign FETCH = 2'b01;
  assign BUSY = 2'b10;
  assign HALT = 2'b11;
  assign when_FetchPlugin_l64 = (! fetch_arbitration_isStuck);
  always @(*) begin
    if((fetch_state == IDLE)) begin
        if(when_FetchPlugin_l64) begin
          fetch_state_next = FETCH;
        end else begin
          fetch_state_next = IDLE;
        end
    end else if((fetch_state == FETCH)) begin
        if(ICachePlugin_icache_access_cmd_isStall) begin
          fetch_state_next = BUSY;
        end else begin
          if(fetch_arbitration_isStuck) begin
            fetch_state_next = HALT;
          end else begin
            fetch_state_next = FETCH;
          end
        end
    end else if((fetch_state == BUSY)) begin
        if(fetch_arbitration_isStuck) begin
          fetch_state_next = BUSY;
        end else begin
          if(ICachePlugin_icache_access_cmd_fire) begin
            fetch_state_next = FETCH;
          end else begin
            fetch_state_next = BUSY;
          end
        end
    end else if((fetch_state == HALT)) begin
        if(when_FetchPlugin_l94) begin
          fetch_state_next = FETCH;
        end else begin
          fetch_state_next = HALT;
        end
    end else begin
        fetch_state_next = IDLE;
    end
  end

  assign ICachePlugin_icache_access_cmd_isStall = (ICachePlugin_icache_access_cmd_valid && (! ICachePlugin_icache_access_cmd_ready));
  assign ICachePlugin_icache_access_cmd_fire = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign when_FetchPlugin_l94 = (! fetch_arbitration_isStuck);
  assign when_FetchPlugin_l107 = (when_FetchPlugin_l116 && ((fetch_state == BUSY) || (fetch_state_next == BUSY)));
  assign ICachePlugin_icache_access_cmd_fire_1 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign when_FetchPlugin_l134 = ((fetch_state_next == FETCH) || (fetch_state_next == BUSY));
  assign ICachePlugin_icache_access_cmd_fire_2 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign fetch_FetchPlugin_pc_in_stream_valid = ICachePlugin_icache_access_cmd_fire_2;
  assign fetch_FetchPlugin_pc_in_stream_payload = pc_next;
  assign fetch_FetchPlugin_pc_out_stream_ready = fetch_arbitration_isFiring;
  assign fetch_FetchPlugin_pc_in_stream_ready = fetch_FetchPlugin_pc_stream_fifo_ports_s_ports_ready;
  assign fetch_FetchPlugin_pc_out_stream_valid = fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_valid;
  assign fetch_FetchPlugin_pc_out_stream_payload = fetch_FetchPlugin_pc_stream_fifo_ports_m_ports_payload;
  assign ICachePlugin_icache_access_cmd_fire_3 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign fetch_FetchPlugin_predict_taken_in_valid = ICachePlugin_icache_access_cmd_fire_3;
  assign fetch_FetchPlugin_predict_taken_in_payload = fetch_PREDICT_TAKEN;
  assign fetch_FetchPlugin_predict_taken_out_ready = fetch_arbitration_isFiring;
  assign fetch_FetchPlugin_predict_taken_in_ready = fetch_FetchPlugin_predict_taken_fifo_ports_s_ports_ready;
  assign fetch_FetchPlugin_predict_taken_out_valid = fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_valid;
  assign fetch_FetchPlugin_predict_taken_out_payload = fetch_FetchPlugin_predict_taken_fifo_ports_m_ports_payload;
  assign fetch_FetchPlugin_instruction_in_stream_valid = ICachePlugin_icache_access_rsp_valid;
  assign fetch_FetchPlugin_instruction_in_stream_payload = ICachePlugin_icache_access_rsp_payload_data;
  assign fetch_FetchPlugin_instruction_out_stream_ready = fetch_arbitration_isFiring;
  assign fetch_FetchPlugin_instruction_in_stream_ready = fetch_FetchPlugin_instruction_stream_fifo_ports_s_ports_ready;
  assign fetch_FetchPlugin_instruction_out_stream_valid = fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_valid;
  assign fetch_FetchPlugin_instruction_out_stream_payload = fetch_FetchPlugin_instruction_stream_fifo_ports_m_ports_payload;
  assign ICachePlugin_icache_access_cmd_fire_4 = (ICachePlugin_icache_access_cmd_valid && ICachePlugin_icache_access_cmd_ready);
  assign fetch_arbitration_isValid = ((fetch_FetchPlugin_fifo_all_valid && (! fetch_arbitration_isStuck)) && (! fetch_FetchPlugin_fetch_flush));
  assign ICachePlugin_icache_access_cmd_valid = (fetch_valid && (! fetch_FetchPlugin_fetch_flush));
  assign ICachePlugin_icache_access_cmd_payload_addr = pc_next;
  assign decode_DecodePlugin_rs1_req = (! (((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h6f)));
  assign decode_DecodePlugin_rs2_req = (! ((((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)) || (decode_INSTRUCTION[6 : 0] == 7'h6f)) || ((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67))));
  assign decode_DecodePlugin_rs1_addr = decode_INSTRUCTION[19 : 15];
  assign decode_DecodePlugin_rs2_addr = decode_INSTRUCTION[24 : 20];
  assign decode_DecodePlugin_rd_addr = decode_INSTRUCTION[11 : 7];
  assign decode_DecodePlugin_alu_word = (decode_INSTRUCTION[6 : 0] == 7'h3b);
  assign decode_DecodePlugin_src2_is_imm = ((((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67)) || (decode_INSTRUCTION[6 : 0] == 7'h23)) || ((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17)));
  assign decode_DecodePlugin_csr_addr = decode_INSTRUCTION[31 : 20];
  assign decode_DecodePlugin_csr_wen = (((decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRW) || (decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRS)) || (decode_DecodePlugin_csr_ctrl == CsrCtrlEnum_CSRRC));
  assign when_DecodePlugin_l116 = ((((decode_INSTRUCTION[6 : 0] == 7'h13) || (decode_INSTRUCTION[6 : 0] == 7'h1b)) || (decode_INSTRUCTION[6 : 0] == 7'h03)) || (decode_INSTRUCTION[6 : 0] == 7'h67));
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
    if(when_DecodePlugin_l116) begin
      decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_1,decode_INSTRUCTION[31 : 20]};
    end else begin
      if(when_DecodePlugin_l119) begin
        decode_DecodePlugin_imm = {_zz_decode_DecodePlugin_imm_3,{decode_INSTRUCTION[31 : 25],decode_INSTRUCTION[11 : 7]}};
      end else begin
        if(when_DecodePlugin_l122) begin
          decode_DecodePlugin_imm = {{_zz_decode_DecodePlugin_imm_5,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[7]},decode_INSTRUCTION[30 : 25]},decode_INSTRUCTION[11 : 8]}},1'b0};
        end else begin
          if(when_DecodePlugin_l125) begin
            decode_DecodePlugin_imm = {{_zz_decode_DecodePlugin_imm_7,{{{decode_INSTRUCTION[31],decode_INSTRUCTION[19 : 12]},decode_INSTRUCTION[20]},decode_INSTRUCTION[30 : 21]}},1'b0};
          end else begin
            if(when_DecodePlugin_l128) begin
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

  assign when_DecodePlugin_l119 = (decode_INSTRUCTION[6 : 0] == 7'h23);
  assign when_DecodePlugin_l122 = (decode_INSTRUCTION[6 : 0] == 7'h63);
  assign when_DecodePlugin_l125 = (decode_INSTRUCTION[6 : 0] == 7'h6f);
  assign when_DecodePlugin_l128 = ((decode_INSTRUCTION[6 : 0] == 7'h37) || (decode_INSTRUCTION[6 : 0] == 7'h17));
  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b0000000??????????000?????0110011, 32'b0000000??????????000?????0111011, 32'b?????????????????000?????0010011, 32'b?????????????????000?????0011011, 32'b?????????????????000?????0100011, 32'b?????????????????001?????0100011, 32'b?????????????????010?????0100011, 32'b?????????????????011?????0100011 : begin
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
      32'b0000000??????????001?????0110011, 32'b000000???????????001?????0010011, 32'b0000000??????????001?????0111011, 32'b000000???????????001?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SLL_1;
      end
      32'b0000000??????????101?????0110011, 32'b000000???????????101?????0010011, 32'b0000000??????????101?????0111011, 32'b000000???????????101?????0011011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_SRL_1;
      end
      32'b0100000??????????101?????0110011, 32'b010000???????????101?????0010011, 32'b0100000??????????101?????0111011, 32'b010000???????????101?????0011011 : begin
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
      32'b?????????????????000???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BEQ;
      end
      32'b?????????????????001???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BNE;
      end
      32'b?????????????????100???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BNE;
      end
      32'b?????????????????101???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BGE;
      end
      32'b?????????????????110???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BLTU;
      end
      32'b?????????????????111???0?1100011 : begin
        decode_DecodePlugin_alu_ctrl = AluCtrlEnum_BGEU;
      end
      default : begin
        decode_DecodePlugin_alu_ctrl = 5'h0;
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

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_is_load = 1'b1;
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0;
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0;
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0;
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_is_load = 1'b0;
      end
      default : begin
        decode_DecodePlugin_is_load = 1'b0;
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b?????????????????000?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????100?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????001?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????101?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????010?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????110?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????011?????0000011 : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
      32'b?????????????????000?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1;
      end
      32'b?????????????????001?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1;
      end
      32'b?????????????????010?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1;
      end
      32'b?????????????????011?????0100011 : begin
        decode_DecodePlugin_is_store = 1'b1;
      end
      default : begin
        decode_DecodePlugin_is_store = 1'b0;
      end
    endcase
  end

  always @(*) begin
    casez(decode_INSTRUCTION)
      32'b00000000000000000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_ECALL;
      end
      32'b00000000000100000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_EBREAK;
      end
      32'b00110000001000000000000001110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_MRET;
      end
      32'b?????????????????001?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRW;
      end
      32'b?????????????????010?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRS;
      end
      32'b?????????????????011?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRC;
      end
      32'b?????????????????101?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRWI;
      end
      32'b?????????????????110?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRSI;
      end
      32'b?????????????????111?????1110011 : begin
        decode_DecodePlugin_csr_ctrl = CsrCtrlEnum_CSRRCI;
      end
      default : begin
        decode_DecodePlugin_csr_ctrl = 4'b0000;
      end
    endcase
  end

  assign decode_DecodePlugin_rs1 = regFileModule_1_read_ports_rs1_value;
  assign decode_DecodePlugin_rs2 = regFileModule_1_read_ports_rs2_value;
  assign decode_DecodePlugin_rd_wen = ((((((! (decode_INSTRUCTION[6 : 0] == 7'h23)) && (! (decode_INSTRUCTION[6 : 0] == 7'h63))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h00100073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h00000073))) && (! ((decode_INSTRUCTION & 32'hffffffff) == 32'h30200073))) && (decode_INSTRUCTION[6 : 0] != 7'h0f));
  assign _zz_fetch_FETCH_DEC_IMM_1 = _zz__zz_fetch_FETCH_DEC_IMM_1[11];
  always @(*) begin
    _zz_fetch_FETCH_DEC_IMM_2[50] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[49] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[48] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[47] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[46] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[45] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[44] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[43] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[42] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[41] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[40] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[39] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[38] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[37] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[36] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[35] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[34] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[33] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[32] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[31] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[30] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[29] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[28] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[27] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[26] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[25] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[24] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[23] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[22] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[21] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[20] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[19] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[18] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[17] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[16] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[15] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[14] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[13] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[12] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[11] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[10] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[9] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[8] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[7] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[6] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[5] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[4] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[3] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[2] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[1] = _zz_fetch_FETCH_DEC_IMM_1;
    _zz_fetch_FETCH_DEC_IMM_2[0] = _zz_fetch_FETCH_DEC_IMM_1;
  end

  assign _zz_fetch_FETCH_DEC_IMM_3 = _zz__zz_fetch_FETCH_DEC_IMM_3[19];
  always @(*) begin
    _zz_fetch_FETCH_DEC_IMM_4[42] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[41] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[40] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[39] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[38] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[37] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[36] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[35] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[34] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[33] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[32] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[31] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[30] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[29] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[28] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[27] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[26] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[25] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[24] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[23] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[22] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[21] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[20] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[19] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[18] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[17] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[16] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[15] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[14] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[13] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[12] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[11] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[10] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[9] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[8] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[7] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[6] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[5] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[4] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[3] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[2] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[1] = _zz_fetch_FETCH_DEC_IMM_3;
    _zz_fetch_FETCH_DEC_IMM_4[0] = _zz_fetch_FETCH_DEC_IMM_3;
  end

  assign DecodePlugin_hazard_decode_rs1_req = decode_DecodePlugin_rs1_req;
  assign DecodePlugin_hazard_decode_rs2_req = decode_DecodePlugin_rs2_req;
  assign DecodePlugin_hazard_decode_rs1_addr = decode_DecodePlugin_rs1_addr;
  assign DecodePlugin_hazard_decode_rs2_addr = decode_DecodePlugin_rs2_addr;
  assign regFileModule_1_write_ports_rd_wen = (writeback_arbitration_isFiring && _zz_DecodePlugin_hazard_rs1_from_wb_1);
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
  assign execute_ALUPlugin_jal = (execute_ALU_CTRL == AluCtrlEnum_JAL);
  assign execute_ALUPlugin_jalr = (execute_ALU_CTRL == AluCtrlEnum_JALR);
  assign execute_ALUPlugin_beq = (execute_ALU_CTRL == AluCtrlEnum_BEQ);
  assign execute_ALUPlugin_bne = (execute_ALU_CTRL == AluCtrlEnum_BNE);
  assign execute_ALUPlugin_blt = (execute_ALU_CTRL == AluCtrlEnum_BLT);
  assign execute_ALUPlugin_bge = (execute_ALU_CTRL == AluCtrlEnum_BGE);
  assign execute_ALUPlugin_bltu = (execute_ALU_CTRL == AluCtrlEnum_BLTU);
  assign execute_ALUPlugin_bgeu = (execute_ALU_CTRL == AluCtrlEnum_BGEU);
  assign execute_ALUPlugin_branch_or_jalr = ((((((execute_ALUPlugin_jalr || execute_ALUPlugin_beq) || execute_ALUPlugin_bne) || execute_ALUPlugin_blt) || execute_ALUPlugin_bge) || execute_ALUPlugin_bltu) || execute_ALUPlugin_bgeu);
  assign execute_ALUPlugin_branch_or_jump = (execute_ALUPlugin_branch_or_jalr || execute_ALUPlugin_jal);
  assign execute_ALUPlugin_rd_is_link = ((execute_RD_ADDR == 5'h0) || (execute_RD_ADDR == 5'h05));
  assign execute_ALUPlugin_rs1_is_link = ((execute_RS1_ADDR == 5'h0) || (execute_RS1_ADDR == 5'h05));
  always @(*) begin
    execute_ALUPlugin_is_call = 1'b0;
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_call = 1'b1;
      end else begin
        execute_ALUPlugin_is_call = 1'b0;
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(execute_ALUPlugin_rd_is_link) begin
          if(execute_ALUPlugin_rs1_is_link) begin
            if(when_AluPlugin_l265) begin
              execute_ALUPlugin_is_call = 1'b1;
            end else begin
              execute_ALUPlugin_is_call = 1'b1;
            end
          end else begin
            execute_ALUPlugin_is_call = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_is_ret = 1'b0;
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_ret = 1'b0;
      end else begin
        execute_ALUPlugin_is_ret = 1'b0;
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(execute_ALUPlugin_rd_is_link) begin
          if(execute_ALUPlugin_rs1_is_link) begin
            if(!when_AluPlugin_l265) begin
              execute_ALUPlugin_is_ret = 1'b1;
            end
          end
        end else begin
          if(execute_ALUPlugin_rs1_is_link) begin
            execute_ALUPlugin_is_ret = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_is_jmp = 1'b0;
    if(execute_ALUPlugin_jal) begin
      if(execute_ALUPlugin_rd_is_link) begin
        execute_ALUPlugin_is_jmp = 1'b0;
      end else begin
        execute_ALUPlugin_is_jmp = 1'b1;
      end
    end else begin
      if(execute_ALUPlugin_jalr) begin
        if(!execute_ALUPlugin_rd_is_link) begin
          if(!execute_ALUPlugin_rs1_is_link) begin
            execute_ALUPlugin_is_jmp = 1'b1;
          end
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_redirect_pc_next = 64'h0;
    if(execute_ALUPlugin_branch_or_jump) begin
      if(execute_ALUPlugin_branch_taken) begin
        if(when_AluPlugin_l230) begin
          execute_ALUPlugin_redirect_pc_next = execute_ALUPlugin_pc_next;
        end
      end else begin
        if(execute_PREDICT_TAKEN) begin
          execute_ALUPlugin_redirect_pc_next = (execute_PC + 64'h0000000000000004);
        end
      end
    end
  end

  always @(*) begin
    execute_ALUPlugin_redirect_valid = 1'b0;
    if(execute_ALUPlugin_branch_or_jump) begin
      if(execute_ALUPlugin_branch_taken) begin
        if(when_AluPlugin_l230) begin
          execute_ALUPlugin_redirect_valid = execute_arbitration_isFiring;
        end
      end else begin
        if(execute_PREDICT_TAKEN) begin
          execute_ALUPlugin_redirect_valid = execute_arbitration_isFiring;
        end
      end
    end
  end

  assign when_AluPlugin_l76 = (((execute_ALU_CTRL == AluCtrlEnum_AUIPC) || execute_ALUPlugin_jal) || execute_ALUPlugin_jalr);
  always @(*) begin
    if(when_AluPlugin_l76) begin
      execute_ALUPlugin_src1 = execute_PC;
    end else begin
      if(execute_RS1_FROM_MEM) begin
        execute_ALUPlugin_src1 = memaccess_ALU_RESULT;
      end else begin
        if(execute_RS1_FROM_WB) begin
          execute_ALUPlugin_src1 = _zz_execute_MEM_WDATA_1;
        end else begin
          execute_ALUPlugin_src1 = execute_RS1;
        end
      end
    end
  end

  always @(*) begin
    if(execute_SRC2_IS_IMM) begin
      execute_ALUPlugin_src2 = execute_IMM;
    end else begin
      if(when_AluPlugin_l97) begin
        execute_ALUPlugin_src2 = 64'h0000000000000004;
      end else begin
        if(execute_RS2_FROM_MEM) begin
          execute_ALUPlugin_src2 = memaccess_ALU_RESULT;
        end else begin
          if(execute_RS2_FROM_WB) begin
            execute_ALUPlugin_src2 = _zz_execute_MEM_WDATA_1;
          end else begin
            execute_ALUPlugin_src2 = execute_RS2;
          end
        end
      end
    end
  end

  assign when_AluPlugin_l97 = (execute_ALUPlugin_jal || execute_ALUPlugin_jalr);
  always @(*) begin
    if(execute_CTRL_RS1_FROM_MEM) begin
      execute_ALUPlugin_branch_src1 = _zz_execute_MEM_WDATA;
    end else begin
      if(execute_CTRL_RS1_FROM_WB) begin
        execute_ALUPlugin_branch_src1 = _zz_execute_MEM_WDATA_1;
      end else begin
        execute_ALUPlugin_branch_src1 = execute_RS1;
      end
    end
  end

  always @(*) begin
    if(execute_CTRL_RS2_FROM_MEM) begin
      execute_ALUPlugin_branch_src2 = _zz_execute_MEM_WDATA;
    end else begin
      if(execute_CTRL_RS2_FROM_WB) begin
        execute_ALUPlugin_branch_src2 = _zz_execute_MEM_WDATA_1;
      end else begin
        execute_ALUPlugin_branch_src2 = execute_RS2;
      end
    end
  end

  assign when_AluPlugin_l145 = (execute_ALU_WORD == 1'b1);
  always @(*) begin
    if((execute_ALU_CTRL == AluCtrlEnum_ADD)) begin
        if(when_AluPlugin_l145) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_addw_result;
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result;
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SUB)) begin
        if(when_AluPlugin_l152) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_subw_result;
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sub_result;
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLT)) begin
        execute_ALUPlugin_alu_result = {_zz_execute_ALUPlugin_alu_result,execute_ALUPlugin_slt_result};
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLTU)) begin
        execute_ALUPlugin_alu_result = {_zz_execute_ALUPlugin_alu_result_1,execute_ALUPlugin_sltu_result};
    end else if((execute_ALU_CTRL == AluCtrlEnum_XOR_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_xor_result;
    end else if((execute_ALU_CTRL == AluCtrlEnum_SLL_1)) begin
        if(when_AluPlugin_l168) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sllw_result;
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sll_result;
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SRL_1)) begin
        if(when_AluPlugin_l175) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_srlw_result;
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_srl_result;
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_SRA_1)) begin
        if(when_AluPlugin_l182) begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sraw_result;
        end else begin
          execute_ALUPlugin_alu_result = execute_ALUPlugin_sra_result;
        end
    end else if((execute_ALU_CTRL == AluCtrlEnum_AND_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_and_result;
    end else if((execute_ALU_CTRL == AluCtrlEnum_OR_1)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_or_result;
    end else if((execute_ALU_CTRL == AluCtrlEnum_LUI)) begin
        execute_ALUPlugin_alu_result = execute_IMM;
    end else if((execute_ALU_CTRL == AluCtrlEnum_JAL) || (execute_ALU_CTRL == AluCtrlEnum_JALR) || (execute_ALU_CTRL == AluCtrlEnum_AUIPC)) begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result;
    end else begin
        execute_ALUPlugin_alu_result = execute_ALUPlugin_add_result;
    end
  end

  assign when_AluPlugin_l152 = (execute_ALU_WORD == 1'b1);
  assign _zz_execute_ALUPlugin_alu_result[62 : 0] = 63'h0;
  assign _zz_execute_ALUPlugin_alu_result_1[62 : 0] = 63'h0;
  assign when_AluPlugin_l168 = (execute_ALU_WORD == 1'b1);
  assign when_AluPlugin_l175 = (execute_ALU_WORD == 1'b1);
  assign when_AluPlugin_l182 = (execute_ALU_WORD == 1'b1);
  assign execute_ALUPlugin_beq_result = (execute_ALUPlugin_beq && (execute_ALUPlugin_branch_src1 == execute_ALUPlugin_branch_src2));
  assign execute_ALUPlugin_bne_result = (execute_ALUPlugin_bne && (execute_ALUPlugin_branch_src1 != execute_ALUPlugin_branch_src2));
  assign execute_ALUPlugin_blt_result = (execute_ALUPlugin_blt && ($signed(_zz_execute_ALUPlugin_blt_result) < $signed(_zz_execute_ALUPlugin_blt_result_1)));
  assign execute_ALUPlugin_bge_result = (execute_ALUPlugin_bge && ($signed(_zz_execute_ALUPlugin_bge_result) <= $signed(_zz_execute_ALUPlugin_bge_result_1)));
  assign execute_ALUPlugin_bltu_result = (execute_ALUPlugin_bltu && (execute_ALUPlugin_branch_src1 < execute_ALUPlugin_branch_src2));
  assign execute_ALUPlugin_bgeu_result = (execute_ALUPlugin_bgeu && (execute_ALUPlugin_branch_src2 <= execute_ALUPlugin_branch_src1));
  assign execute_ALUPlugin_branch_taken = (((((((execute_ALUPlugin_beq_result || execute_ALUPlugin_bne_result) || execute_ALUPlugin_blt_result) || execute_ALUPlugin_bge_result) || execute_ALUPlugin_bltu_result) || execute_ALUPlugin_bgeu_result) || execute_ALUPlugin_jal) || execute_ALUPlugin_jalr);
  assign when_AluPlugin_l222 = (execute_ALU_CTRL == AluCtrlEnum_JALR);
  always @(*) begin
    if(when_AluPlugin_l222) begin
      execute_ALUPlugin_pc_next = _zz_execute_ALUPlugin_pc_next;
    end else begin
      execute_ALUPlugin_pc_next = _zz_execute_ALUPlugin_pc_next_6;
    end
  end

  assign when_AluPlugin_l230 = ((! execute_PREDICT_TAKEN) || (execute_PC_NEXT != execute_ALUPlugin_pc_next));
  assign when_AluPlugin_l265 = (execute_RD_ADDR == execute_RS1_ADDR);
  assign DecodePlugin_hazard_rs1_from_mem = ((((memaccess_arbitration_isValid && _zz_DecodePlugin_hazard_rs1_from_mem_3) && (_zz_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (_zz_DecodePlugin_hazard_rs1_from_mem_2 == _zz_DecodePlugin_hazard_rs1_from_mem_1)) && (! _zz_DecodePlugin_hazard_rs1_from_mem));
  assign DecodePlugin_hazard_rs2_from_mem = ((((memaccess_arbitration_isValid && _zz_DecodePlugin_hazard_rs1_from_mem_3) && (_zz_DecodePlugin_hazard_rs1_from_mem_2 != 5'h0)) && (_zz_DecodePlugin_hazard_rs1_from_mem_2 == _zz_DecodePlugin_hazard_rs2_from_mem)) && (! _zz_DecodePlugin_hazard_rs1_from_mem));
  assign DecodePlugin_hazard_rs1_from_wb = ((((writeback_arbitration_isValid && _zz_DecodePlugin_hazard_rs1_from_wb_1) && (_zz_DecodePlugin_hazard_rs1_from_wb != 5'h0)) && (_zz_DecodePlugin_hazard_rs1_from_wb == _zz_DecodePlugin_hazard_rs1_from_mem_1)) && ((_zz_DecodePlugin_hazard_rs1_from_mem_2 != _zz_DecodePlugin_hazard_rs1_from_mem_1) || (! memaccess_arbitration_isValid)));
  assign DecodePlugin_hazard_rs2_from_wb = ((((writeback_arbitration_isValid && _zz_DecodePlugin_hazard_rs1_from_wb_1) && (_zz_DecodePlugin_hazard_rs1_from_wb != 5'h0)) && (_zz_DecodePlugin_hazard_rs1_from_wb == _zz_DecodePlugin_hazard_rs2_from_mem)) && ((_zz_DecodePlugin_hazard_rs1_from_mem_2 != _zz_DecodePlugin_hazard_rs2_from_mem) || (! memaccess_arbitration_isValid)));
  assign DecodePlugin_hazard_load_use = ((memaccess_arbitration_isValid && _zz_DecodePlugin_hazard_rs1_from_mem) && (((_zz_DecodePlugin_hazard_rs1_from_mem_2 == _zz_DecodePlugin_hazard_rs1_from_mem_1) && (! DecodePlugin_hazard_rs1_from_wb)) || ((_zz_DecodePlugin_hazard_rs1_from_mem_2 == _zz_DecodePlugin_hazard_rs2_from_mem) && (! DecodePlugin_hazard_rs2_from_wb))));
  assign DecodePlugin_hazard_ctrl_rs1_from_mem = ((execute_arbitration_isValid && _zz_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs1_from_mem);
  assign DecodePlugin_hazard_ctrl_rs2_from_mem = ((execute_arbitration_isValid && _zz_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs2_from_mem);
  assign DecodePlugin_hazard_ctrl_rs1_from_wb = ((execute_arbitration_isValid && _zz_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs1_from_wb);
  assign DecodePlugin_hazard_ctrl_rs2_from_wb = ((execute_arbitration_isValid && _zz_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_rs2_from_wb);
  assign DecodePlugin_hazard_ctrl_load_use = ((execute_arbitration_isValid && _zz_DecodePlugin_hazard_ctrl_rs1_from_mem) && DecodePlugin_hazard_load_use);
  assign fetch_arbitration_haltItself = 1'b0;
  assign fetch_arbitration_flushIt = when_FetchPlugin_l119;
  assign decode_arbitration_haltItself = 1'b0;
  assign decode_arbitration_flushIt = when_FetchPlugin_l119;
  assign execute_arbitration_haltItself = ((DecodePlugin_hazard_load_use || DecodePlugin_hazard_ctrl_load_use) || execute_INT_HOLD);
  assign execute_arbitration_flushIt = 1'b0;
  assign memaccess_arbitration_haltItself = memaccess_LSU_HOLD;
  assign memaccess_arbitration_flushIt = 1'b0;
  assign writeback_arbitration_haltItself = 1'b0;
  assign writeback_arbitration_flushIt = 1'b0;
  assign clint_1_ecall = (decode_arbitration_isValid && (_zz_decode_to_execute_CSR_CTRL == CsrCtrlEnum_ECALL));
  assign clint_1_ebreak = (decode_arbitration_isValid && (_zz_decode_to_execute_CSR_CTRL == CsrCtrlEnum_EBREAK));
  assign clint_1_mret = (decode_arbitration_isValid && (_zz_decode_to_execute_CSR_CTRL == CsrCtrlEnum_MRET));
  assign execute_ExcepPlugin_csrrs_wdata = (execute_RS1 | execute_CSR_RDATA);
  assign execute_ExcepPlugin_csrrc_wdata = ((~ execute_RS1) & execute_CSR_RDATA);
  assign execute_ExcepPlugin_csrrsi_wdata = (execute_IMM | execute_CSR_RDATA);
  assign execute_ExcepPlugin_csrrci_wdata = ((~ execute_IMM) & execute_CSR_RDATA);
  always @(*) begin
    if((execute_CSR_CTRL == CsrCtrlEnum_CSRRW)) begin
        execute_ExcepPlugin_csr_wdata = execute_RS1;
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRS)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrs_wdata;
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRC)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrc_wdata;
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRWI)) begin
        execute_ExcepPlugin_csr_wdata = execute_IMM;
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRSI)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrsi_wdata;
    end else if((execute_CSR_CTRL == CsrCtrlEnum_CSRRCI)) begin
        execute_ExcepPlugin_csr_wdata = execute_ExcepPlugin_csrrci_wdata;
    end else begin
        execute_ExcepPlugin_csr_wdata = 64'h0;
    end
  end

  assign timer_1_addr = _zz_execute_MEM_WDATA;
  assign _zz_memaccess_LSUPlugin_dcache_lb = DCachePlugin_dcache_access_rsp_payload_data[7];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_lb_1[55] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[54] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[53] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[52] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[51] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[50] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[49] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[48] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[47] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[46] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[45] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[44] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[43] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[42] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[41] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[40] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[39] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[38] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[37] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[36] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[35] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[34] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[33] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[32] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[31] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[30] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[29] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[28] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[27] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[26] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[25] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[24] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[23] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[22] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[21] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[20] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[19] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[18] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[17] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[16] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[15] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[14] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[13] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[12] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[11] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[10] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[9] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[8] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[7] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[6] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[5] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[4] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[3] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[2] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[1] = _zz_memaccess_LSUPlugin_dcache_lb;
    _zz_memaccess_LSUPlugin_dcache_lb_1[0] = _zz_memaccess_LSUPlugin_dcache_lb;
  end

  assign memaccess_LSUPlugin_dcache_lb = {_zz_memaccess_LSUPlugin_dcache_lb_1,DCachePlugin_dcache_access_rsp_payload_data[7 : 0]};
  assign _zz_1 = zz__zz_memaccess_LSUPlugin_dcache_lbu(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_lbu = _zz_1;
  assign memaccess_LSUPlugin_dcache_lbu = {_zz_memaccess_LSUPlugin_dcache_lbu,DCachePlugin_dcache_access_rsp_payload_data[7 : 0]};
  assign _zz_memaccess_LSUPlugin_dcache_lh = DCachePlugin_dcache_access_rsp_payload_data[15];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_lh_1[47] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[46] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[45] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[44] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[43] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[42] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[41] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[40] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[39] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[38] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[37] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[36] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[35] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[34] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[33] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[32] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[31] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[30] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[29] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[28] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[27] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[26] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[25] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[24] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[23] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[22] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[21] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[20] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[19] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[18] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[17] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[16] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[15] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[14] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[13] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[12] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[11] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[10] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[9] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[8] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[7] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[6] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[5] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[4] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[3] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[2] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[1] = _zz_memaccess_LSUPlugin_dcache_lh;
    _zz_memaccess_LSUPlugin_dcache_lh_1[0] = _zz_memaccess_LSUPlugin_dcache_lh;
  end

  assign memaccess_LSUPlugin_dcache_lh = {_zz_memaccess_LSUPlugin_dcache_lh_1,DCachePlugin_dcache_access_rsp_payload_data[15 : 0]};
  assign _zz_2 = zz__zz_memaccess_LSUPlugin_dcache_lhu(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_lhu = _zz_2;
  assign memaccess_LSUPlugin_dcache_lhu = {_zz_memaccess_LSUPlugin_dcache_lhu,DCachePlugin_dcache_access_rsp_payload_data[15 : 0]};
  assign _zz_memaccess_LSUPlugin_dcache_lw = DCachePlugin_dcache_access_rsp_payload_data[31];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_lw_1[31] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[30] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[29] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[28] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[27] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[26] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[25] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[24] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[23] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[22] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[21] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[20] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[19] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[18] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[17] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[16] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[15] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[14] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[13] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[12] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[11] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[10] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[9] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[8] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[7] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[6] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[5] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[4] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[3] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[2] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[1] = _zz_memaccess_LSUPlugin_dcache_lw;
    _zz_memaccess_LSUPlugin_dcache_lw_1[0] = _zz_memaccess_LSUPlugin_dcache_lw;
  end

  assign memaccess_LSUPlugin_dcache_lw = {_zz_memaccess_LSUPlugin_dcache_lw_1,DCachePlugin_dcache_access_rsp_payload_data[31 : 0]};
  assign _zz_3 = zz__zz_memaccess_LSUPlugin_dcache_lwu(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_lwu = _zz_3;
  assign memaccess_LSUPlugin_dcache_lwu = {_zz_memaccess_LSUPlugin_dcache_lwu,DCachePlugin_dcache_access_rsp_payload_data[31 : 0]};
  assign _zz_memaccess_LSUPlugin_dcache_sb = memaccess_MEM_WDATA[7];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_sb_1[55] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[54] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[53] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[52] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[51] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[50] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[49] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[48] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[47] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[46] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[45] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[44] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[43] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[42] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[41] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[40] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[39] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[38] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[37] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[36] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[35] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[34] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[33] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[32] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[31] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[30] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[29] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[28] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[27] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[26] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[25] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[24] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[23] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[22] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[21] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[20] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[19] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[18] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[17] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[16] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[15] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[14] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[13] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[12] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[11] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[10] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[9] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[8] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[7] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[6] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[5] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[4] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[3] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[2] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[1] = _zz_memaccess_LSUPlugin_dcache_sb;
    _zz_memaccess_LSUPlugin_dcache_sb_1[0] = _zz_memaccess_LSUPlugin_dcache_sb;
  end

  assign memaccess_LSUPlugin_dcache_sb = {_zz_memaccess_LSUPlugin_dcache_sb_1,memaccess_MEM_WDATA[7 : 0]};
  assign _zz_memaccess_LSUPlugin_dcache_sh = memaccess_MEM_WDATA[15];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_sh_1[47] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[46] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[45] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[44] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[43] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[42] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[41] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[40] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[39] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[38] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[37] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[36] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[35] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[34] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[33] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[32] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[31] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[30] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[29] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[28] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[27] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[26] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[25] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[24] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[23] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[22] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[21] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[20] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[19] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[18] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[17] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[16] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[15] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[14] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[13] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[12] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[11] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[10] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[9] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[8] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[7] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[6] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[5] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[4] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[3] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[2] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[1] = _zz_memaccess_LSUPlugin_dcache_sh;
    _zz_memaccess_LSUPlugin_dcache_sh_1[0] = _zz_memaccess_LSUPlugin_dcache_sh;
  end

  assign memaccess_LSUPlugin_dcache_sh = {_zz_memaccess_LSUPlugin_dcache_sh_1,memaccess_MEM_WDATA[15 : 0]};
  assign _zz_memaccess_LSUPlugin_dcache_sw = memaccess_MEM_WDATA[31];
  always @(*) begin
    _zz_memaccess_LSUPlugin_dcache_sw_1[31] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[30] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[29] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[28] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[27] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[26] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[25] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[24] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[23] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[22] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[21] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[20] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[19] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[18] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[17] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[16] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[15] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[14] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[13] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[12] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[11] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[10] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[9] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[8] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[7] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[6] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[5] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[4] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[3] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[2] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[1] = _zz_memaccess_LSUPlugin_dcache_sw;
    _zz_memaccess_LSUPlugin_dcache_sw_1[0] = _zz_memaccess_LSUPlugin_dcache_sw;
  end

  assign memaccess_LSUPlugin_dcache_sw = {_zz_memaccess_LSUPlugin_dcache_sw_1,memaccess_MEM_WDATA[31 : 0]};
  assign memaccess_LSUPlugin_cpu_addr = memaccess_ALU_RESULT;
  assign memaccess_LSUPlugin_is_mem = (memaccess_IS_LOAD || memaccess_IS_STORE);
  assign memaccess_LSUPlugin_is_timer = ((memaccess_LSUPlugin_cpu_addr == 64'h000000000200bff8) || (memaccess_LSUPlugin_cpu_addr == 64'h0000000002004000));
  assign memaccess_LSUPlugin_lsu_ready = 1'b1;
  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_LB)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lb;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LBU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lbu;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LH)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lh;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LHU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lhu;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LW)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lw;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LWU)) begin
        memaccess_LSUPlugin_dcache_data_load = memaccess_LSUPlugin_dcache_lwu;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_LD)) begin
        memaccess_LSUPlugin_dcache_data_load = DCachePlugin_dcache_access_rsp_payload_data;
    end else begin
        memaccess_LSUPlugin_dcache_data_load = 64'h0;
    end
  end

  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_SB)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sb;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SH)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sh;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SW)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_LSUPlugin_dcache_sw;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SD)) begin
        memaccess_LSUPlugin_dcache_wdata = memaccess_MEM_WDATA;
    end else begin
        memaccess_LSUPlugin_dcache_wdata = 64'h0;
    end
  end

  assign _zz_4 = zz__zz_memaccess_LSUPlugin_dcache_wstrb(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_wstrb = _zz_4;
  always @(*) begin
    if((memaccess_MEM_CTRL == MemCtrlEnum_SB)) begin
        memaccess_LSUPlugin_dcache_wstrb = _zz_memaccess_LSUPlugin_dcache_wstrb;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SH)) begin
        memaccess_LSUPlugin_dcache_wstrb = _zz_memaccess_LSUPlugin_dcache_wstrb_1;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SW)) begin
        memaccess_LSUPlugin_dcache_wstrb = _zz_memaccess_LSUPlugin_dcache_wstrb_2;
    end else if((memaccess_MEM_CTRL == MemCtrlEnum_SD)) begin
        memaccess_LSUPlugin_dcache_wstrb = _zz_memaccess_LSUPlugin_dcache_wstrb_3;
    end else begin
        memaccess_LSUPlugin_dcache_wstrb = 8'h0;
    end
  end

  assign _zz_5 = zz__zz_memaccess_LSUPlugin_dcache_wstrb_1(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_wstrb_1 = _zz_5;
  assign _zz_6 = zz__zz_memaccess_LSUPlugin_dcache_wstrb_2(1'b0);
  always @(*) _zz_memaccess_LSUPlugin_dcache_wstrb_2 = _zz_6;
  assign _zz_memaccess_LSUPlugin_dcache_wstrb_3[7 : 0] = 8'hff;
  assign memaccess_LSUPlugin_lsu_rdata = memaccess_LSUPlugin_dcache_data_load;
  assign memaccess_LSUPlugin_lsu_wdata = memaccess_LSUPlugin_dcache_wdata;
  assign memaccess_LSUPlugin_lsu_addr = memaccess_LSUPlugin_cpu_addr;
  assign memaccess_LSUPlugin_lsu_wen = memaccess_IS_STORE;
  assign memaccess_LSUPlugin_lsu_wstrb = memaccess_LSUPlugin_dcache_wstrb;
  assign DCachePlugin_dcache_access_cmd_valid = (((! memaccess_LSUPlugin_is_timer) && memaccess_LSUPlugin_is_mem) && memaccess_arbitration_isValid);
  assign DCachePlugin_dcache_access_cmd_payload_addr = memaccess_LSUPlugin_lsu_addr;
  assign DCachePlugin_dcache_access_cmd_payload_wen = memaccess_LSUPlugin_lsu_wen;
  assign DCachePlugin_dcache_access_cmd_payload_wdata = memaccess_LSUPlugin_lsu_wdata;
  assign DCachePlugin_dcache_access_cmd_payload_wstrb = memaccess_LSUPlugin_lsu_wstrb;
  assign icache_cmd_valid = ICachePlugin_icache_access_cmd_valid;
  assign ICachePlugin_icache_access_cmd_ready = icache_cmd_ready;
  assign icache_cmd_payload_addr = ICachePlugin_icache_access_cmd_payload_addr;
  assign ICachePlugin_icache_access_rsp_valid = icache_rsp_valid;
  assign ICachePlugin_icache_access_rsp_payload_data = icache_rsp_payload_data;
  assign dcache_cmd_valid = DCachePlugin_dcache_access_cmd_valid;
  assign DCachePlugin_dcache_access_cmd_ready = dcache_cmd_ready;
  assign dcache_cmd_payload_addr = DCachePlugin_dcache_access_cmd_payload_addr;
  assign dcache_cmd_payload_wen = DCachePlugin_dcache_access_cmd_payload_wen;
  assign dcache_cmd_payload_wdata = DCachePlugin_dcache_access_cmd_payload_wdata;
  assign dcache_cmd_payload_wstrb = DCachePlugin_dcache_access_cmd_payload_wstrb;
  assign DCachePlugin_dcache_access_rsp_valid = dcache_rsp_valid;
  assign DCachePlugin_dcache_access_rsp_payload_data = dcache_rsp_payload_data;
  assign when_Pipeline_l127 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l127_1 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_2 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_3 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_4 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l127_5 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_6 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l127_7 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_8 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_9 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_10 = (! decode_arbitration_isStuck);
  assign when_Pipeline_l127_11 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_12 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_13 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_14 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_15 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_16 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_17 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_18 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_19 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_20 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_21 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_22 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_23 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_24 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_25 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_26 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_27 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_28 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_29 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_30 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_31 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_32 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_33 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_34 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_35 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_36 = (! execute_arbitration_isStuck);
  assign when_Pipeline_l127_37 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_38 = (! writeback_arbitration_isStuck);
  assign when_Pipeline_l127_39 = (! memaccess_arbitration_isStuck);
  assign when_Pipeline_l127_40 = (! writeback_arbitration_isStuck);
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
  assign when_Pipeline_l163 = ((! fetch_arbitration_isStuck) && (! fetch_arbitration_removeIt));
  assign when_Pipeline_l166 = ((! decode_arbitration_isStuck) || decode_arbitration_removeIt);
  assign when_Pipeline_l163_1 = ((! decode_arbitration_isStuck) && (! decode_arbitration_removeIt));
  assign when_Pipeline_l166_1 = ((! execute_arbitration_isStuck) || execute_arbitration_removeIt);
  assign when_Pipeline_l163_2 = ((! execute_arbitration_isStuck) && (! execute_arbitration_removeIt));
  assign when_Pipeline_l166_2 = ((! memaccess_arbitration_isStuck) || memaccess_arbitration_removeIt);
  assign when_Pipeline_l163_3 = ((! memaccess_arbitration_isStuck) && (! memaccess_arbitration_removeIt));
  assign when_Pipeline_l166_3 = ((! writeback_arbitration_isStuck) || writeback_arbitration_removeIt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      pc_next <= 64'h0000000080000000;
      fetch_valid <= 1'b0;
      int_pc_reg <= 64'h0;
      int_en_reg <= 1'b0;
      fetch_state <= IDLE;
      execute_ALUPlugin_branch_history <= 7'h0;
      decode_arbitration_isValid <= 1'b0;
      execute_arbitration_isValid <= 1'b0;
      memaccess_arbitration_isValid <= 1'b0;
      writeback_arbitration_isValid <= 1'b0;
    end else begin
      fetch_state <= fetch_state_next;
      if(when_FetchPlugin_l107) begin
        int_en_reg <= 1'b1;
        int_pc_reg <= _zz_pc_next_1;
      end else begin
        if(ICachePlugin_icache_access_rsp_valid) begin
          int_en_reg <= 1'b0;
        end
      end
      if(when_FetchPlugin_l116) begin
        pc_next <= _zz_pc_next_1;
      end else begin
        if(when_FetchPlugin_l119) begin
          pc_next <= _zz_pc_next;
        end else begin
          if(fetch_BPU_BRANCH_TAKEN) begin
            pc_next <= fetch_BPU_PC_NEXT;
          end else begin
            if(ICachePlugin_icache_access_cmd_fire_1) begin
              if(int_en_reg) begin
                pc_next <= int_pc_reg;
              end else begin
                pc_next <= (pc_next + 64'h0000000000000004);
              end
            end
          end
        end
      end
      if(when_FetchPlugin_l134) begin
        fetch_valid <= 1'b1;
      end else begin
        fetch_valid <= 1'b0;
      end
      if(execute_arbitration_isFiring) begin
        execute_ALUPlugin_branch_history <= {execute_ALUPlugin_branch_history[5 : 0],execute_ALUPlugin_branch_taken};
      end
      if(when_Pipeline_l163) begin
        decode_arbitration_isValid <= fetch_arbitration_isValid;
      end else begin
        if(when_Pipeline_l166) begin
          decode_arbitration_isValid <= 1'b0;
        end
      end
      if(when_Pipeline_l163_1) begin
        execute_arbitration_isValid <= decode_arbitration_isValid;
      end else begin
        if(when_Pipeline_l166_1) begin
          execute_arbitration_isValid <= 1'b0;
        end
      end
      if(when_Pipeline_l163_2) begin
        memaccess_arbitration_isValid <= execute_arbitration_isValid;
      end else begin
        if(when_Pipeline_l166_2) begin
          memaccess_arbitration_isValid <= 1'b0;
        end
      end
      if(when_Pipeline_l163_3) begin
        writeback_arbitration_isValid <= memaccess_arbitration_isValid;
      end else begin
        if(when_Pipeline_l166_3) begin
          writeback_arbitration_isValid <= 1'b0;
        end
      end
    end
  end

  always @(posedge clk) begin
    if(when_Pipeline_l127) begin
      fetch_to_decode_PC <= _zz_fetch_to_decode_PC;
    end
    if(when_Pipeline_l127_1) begin
      decode_to_execute_PC <= decode_PC;
    end
    if(when_Pipeline_l127_2) begin
      execute_to_memaccess_PC <= execute_PC;
    end
    if(when_Pipeline_l127_3) begin
      memaccess_to_writeback_PC <= memaccess_PC;
    end
    if(when_Pipeline_l127_4) begin
      fetch_to_decode_PC_NEXT <= _zz_fetch_to_decode_PC_NEXT;
    end
    if(when_Pipeline_l127_5) begin
      decode_to_execute_PC_NEXT <= decode_PC_NEXT;
    end
    if(when_Pipeline_l127_6) begin
      fetch_to_decode_INSTRUCTION <= _zz_fetch_FETCH_DEC_IMM;
    end
    if(when_Pipeline_l127_7) begin
      decode_to_execute_INSTRUCTION <= decode_INSTRUCTION;
    end
    if(when_Pipeline_l127_8) begin
      execute_to_memaccess_INSTRUCTION <= execute_INSTRUCTION;
    end
    if(when_Pipeline_l127_9) begin
      memaccess_to_writeback_INSTRUCTION <= memaccess_INSTRUCTION;
    end
    if(when_Pipeline_l127_10) begin
      fetch_to_decode_PREDICT_TAKEN <= fetch_PREDICT_TAKEN;
    end
    if(when_Pipeline_l127_11) begin
      decode_to_execute_PREDICT_TAKEN <= decode_PREDICT_TAKEN;
    end
    if(when_Pipeline_l127_12) begin
      decode_to_execute_IMM <= decode_IMM;
    end
    if(when_Pipeline_l127_13) begin
      decode_to_execute_RS1 <= decode_RS1;
    end
    if(when_Pipeline_l127_14) begin
      decode_to_execute_RS2 <= decode_RS2;
    end
    if(when_Pipeline_l127_15) begin
      decode_to_execute_RS1_ADDR <= decode_RS1_ADDR;
    end
    if(when_Pipeline_l127_16) begin
      decode_to_execute_RS2_ADDR <= decode_RS2_ADDR;
    end
    if(when_Pipeline_l127_17) begin
      decode_to_execute_ALU_CTRL <= decode_ALU_CTRL;
    end
    if(when_Pipeline_l127_18) begin
      decode_to_execute_ALU_WORD <= decode_ALU_WORD;
    end
    if(when_Pipeline_l127_19) begin
      decode_to_execute_SRC2_IS_IMM <= decode_SRC2_IS_IMM;
    end
    if(when_Pipeline_l127_20) begin
      decode_to_execute_MEM_CTRL <= decode_MEM_CTRL;
    end
    if(when_Pipeline_l127_21) begin
      execute_to_memaccess_MEM_CTRL <= execute_MEM_CTRL;
    end
    if(when_Pipeline_l127_22) begin
      decode_to_execute_RD_WEN <= decode_RD_WEN;
    end
    if(when_Pipeline_l127_23) begin
      execute_to_memaccess_RD_WEN <= execute_RD_WEN;
    end
    if(when_Pipeline_l127_24) begin
      memaccess_to_writeback_RD_WEN <= _zz_DecodePlugin_hazard_rs1_from_mem_3;
    end
    if(when_Pipeline_l127_25) begin
      decode_to_execute_RD_ADDR <= decode_RD_ADDR;
    end
    if(when_Pipeline_l127_26) begin
      execute_to_memaccess_RD_ADDR <= execute_RD_ADDR;
    end
    if(when_Pipeline_l127_27) begin
      memaccess_to_writeback_RD_ADDR <= _zz_DecodePlugin_hazard_rs1_from_mem_2;
    end
    if(when_Pipeline_l127_28) begin
      decode_to_execute_IS_LOAD <= decode_IS_LOAD;
    end
    if(when_Pipeline_l127_29) begin
      execute_to_memaccess_IS_LOAD <= execute_IS_LOAD;
    end
    if(when_Pipeline_l127_30) begin
      memaccess_to_writeback_IS_LOAD <= _zz_DecodePlugin_hazard_rs1_from_mem;
    end
    if(when_Pipeline_l127_31) begin
      decode_to_execute_IS_STORE <= decode_IS_STORE;
    end
    if(when_Pipeline_l127_32) begin
      execute_to_memaccess_IS_STORE <= execute_IS_STORE;
    end
    if(when_Pipeline_l127_33) begin
      decode_to_execute_CSR_CTRL <= _zz_decode_to_execute_CSR_CTRL;
    end
    if(when_Pipeline_l127_34) begin
      decode_to_execute_CSR_ADDR <= _zz_decode_to_execute_CSR_ADDR;
    end
    if(when_Pipeline_l127_35) begin
      decode_to_execute_CSR_WEN <= decode_CSR_WEN;
    end
    if(when_Pipeline_l127_36) begin
      decode_to_execute_CSR_RDATA <= decode_CSR_RDATA;
    end
    if(when_Pipeline_l127_37) begin
      execute_to_memaccess_ALU_RESULT <= execute_ALU_RESULT;
    end
    if(when_Pipeline_l127_38) begin
      memaccess_to_writeback_ALU_RESULT <= _zz_execute_MEM_WDATA;
    end
    if(when_Pipeline_l127_39) begin
      execute_to_memaccess_MEM_WDATA <= execute_MEM_WDATA;
    end
    if(when_Pipeline_l127_40) begin
      memaccess_to_writeback_LSU_RDATA <= memaccess_LSU_RDATA;
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

  wire       [63:0]   _zz_mtime;
  reg        [63:0]   mtime;
  reg        [63:0]   mtimecmp;
  wire                when_ExcepPlugin_l287;
  wire                when_ExcepPlugin_l300;
  wire                when_ExcepPlugin_l302;

  assign _zz_mtime = (mtime + 64'h0000000000000001);
  assign when_ExcepPlugin_l287 = (wen && cen);
  assign when_ExcepPlugin_l300 = (addr == 64'h000000000200bff8);
  always @(*) begin
    if(when_ExcepPlugin_l300) begin
      rdata = mtime;
    end else begin
      if(when_ExcepPlugin_l302) begin
        rdata = mtimecmp;
      end else begin
        rdata = 64'h0;
      end
    end
  end

  assign when_ExcepPlugin_l302 = (addr == 64'h0000000002004000);
  assign timer_int = (mtimecmp <= mtime);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mtime <= 64'h0;
      mtimecmp <= 64'hffffffffffffffff;
    end else begin
      if(when_ExcepPlugin_l287) begin
        case(addr)
          64'h000000000200bff8 : begin
            mtime <= wdata;
          end
          64'h0000000002004000 : begin
            mtimecmp <= wdata;
          end
          default : begin
          end
        endcase
      end else begin
        mtime <= _zz_mtime;
      end
    end
  end


endmodule

module Clint (
  input      [63:0]   pc,
  input      [63:0]   pc_next,
  input               pc_next_valid,
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
  localparam CsrEnum_IDLE = 2'd0;
  localparam CsrEnum_EXPT_TIME = 2'd1;
  localparam CsrEnum_MRET = 2'd2;
  localparam CsrEnum_WRITE = 2'd3;
  localparam IntTypeEnum_IDLE = 2'd0;
  localparam IntTypeEnum_EXPT = 2'd1;
  localparam IntTypeEnum_TIME_1 = 2'd2;
  localparam IntTypeEnum_MRET = 2'd3;

  reg        [1:0]    int_state;
  reg        [1:0]    csr_state;
  reg        [63:0]   mepc_wdata;
  reg        [63:0]   mcause_wdata;
  wire                when_ExcepPlugin_l188;
  wire                when_ExcepPlugin_l190;
  wire                when_ExcepPlugin_l200;
  wire                when_ExcepPlugin_l202;
  wire                when_ExcepPlugin_l214;
  wire                when_ExcepPlugin_l222;
  wire                when_ExcepPlugin_l223;
  wire                when_ExcepPlugin_l231;
  wire                when_ExcepPlugin_l258;
  wire                when_ExcepPlugin_l262;

  assign when_ExcepPlugin_l188 = (ecall || ebreak);
  always @(*) begin
    if(when_ExcepPlugin_l188) begin
      int_state = IntTypeEnum_EXPT;
    end else begin
      if(when_ExcepPlugin_l190) begin
        int_state = IntTypeEnum_TIME_1;
      end else begin
        if(mret) begin
          int_state = IntTypeEnum_MRET;
        end else begin
          int_state = IntTypeEnum_IDLE;
        end
      end
    end
  end

  assign when_ExcepPlugin_l190 = ((csr_ports_global_int_en && csr_ports_mtime_int_en) && timer_int);
  assign when_ExcepPlugin_l200 = ((int_state == IntTypeEnum_EXPT) || (int_state == IntTypeEnum_TIME_1));
  assign when_ExcepPlugin_l202 = (int_state == IntTypeEnum_MRET);
  assign when_ExcepPlugin_l214 = (csr_state == CsrEnum_IDLE);
  assign when_ExcepPlugin_l222 = (csr_state == CsrEnum_IDLE);
  assign when_ExcepPlugin_l223 = (int_state == IntTypeEnum_EXPT);
  assign when_ExcepPlugin_l231 = (int_state == IntTypeEnum_TIME_1);
  assign when_ExcepPlugin_l258 = (csr_state == CsrEnum_WRITE);
  assign when_ExcepPlugin_l262 = (csr_state == CsrEnum_MRET);
  assign int_hold = ((int_state != IntTypeEnum_IDLE) || (csr_state != CsrEnum_IDLE));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      csr_state <= CsrEnum_IDLE;
      mepc_wdata <= 64'h0;
      mcause_wdata <= 64'h0;
      csr_ports_mepc_wen <= 1'b0;
      csr_ports_mepc_wdata <= 64'h0;
      csr_ports_mcause_wen <= 1'b0;
      csr_ports_mcause_wdata <= 64'h0;
      csr_ports_mstatus_wen <= 1'b0;
      csr_ports_mstatus_wdata <= 64'h0;
      int_en <= 1'b0;
      int_pc <= 64'h0;
    end else begin
      if((csr_state == CsrEnum_IDLE)) begin
          if(when_ExcepPlugin_l200) begin
            csr_state <= CsrEnum_EXPT_TIME;
          end else begin
            if(when_ExcepPlugin_l202) begin
              csr_state <= CsrEnum_MRET;
            end
          end
      end else if((csr_state == CsrEnum_EXPT_TIME)) begin
          csr_state <= CsrEnum_WRITE;
      end else if((csr_state == CsrEnum_MRET) || (csr_state == CsrEnum_WRITE)) begin
          csr_state <= CsrEnum_IDLE;
      end
      if(when_ExcepPlugin_l214) begin
        if(pc_next_valid) begin
          mepc_wdata <= pc_next;
        end else begin
          mepc_wdata <= pc;
        end
      end
      if(when_ExcepPlugin_l222) begin
        if(when_ExcepPlugin_l223) begin
          if(ecall) begin
            mcause_wdata <= 64'h000000000000000b;
          end else begin
            if(ebreak) begin
              mcause_wdata <= 64'h0000000000000003;
            end else begin
              mcause_wdata <= 64'h000000000000000a;
            end
          end
        end else begin
          if(when_ExcepPlugin_l231) begin
            mcause_wdata <= 64'h8000000000000007;
          end
        end
      end
      if((csr_state == CsrEnum_WRITE)) begin
          csr_ports_mepc_wen <= 1'b1;
          csr_ports_mcause_wen <= 1'b1;
          csr_ports_mstatus_wen <= 1'b1;
          csr_ports_mepc_wdata <= mepc_wdata;
          csr_ports_mcause_wdata <= mcause_wdata;
          csr_ports_mstatus_wdata <= {{{{csr_ports_mstatus[63 : 8],csr_ports_mstatus[3]},csr_ports_mstatus[6 : 4]},1'b0},csr_ports_mstatus[2 : 0]};
      end else if((csr_state == CsrEnum_MRET)) begin
          csr_ports_mstatus_wen <= 1'b1;
          csr_ports_mstatus_wdata <= {{{{csr_ports_mstatus[63 : 8],1'b1},csr_ports_mstatus[6 : 4]},csr_ports_mstatus[7]},csr_ports_mstatus[2 : 0]};
      end else begin
          csr_ports_mepc_wen <= 1'b0;
          csr_ports_mcause_wen <= 1'b0;
          csr_ports_mstatus_wen <= 1'b0;
      end
      if(when_ExcepPlugin_l258) begin
        int_en <= 1'b1;
        int_pc <= csr_ports_mtvec;
      end else begin
        if(when_ExcepPlugin_l262) begin
          int_en <= 1'b1;
          int_pc <= csr_ports_mepc;
        end else begin
          int_en <= 1'b0;
        end
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

  wire       [63:0]   _zz_mcycle;
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
  wire                when_ExcepPlugin_l106;

  assign _zz_mcycle = (mcycle + 64'h0000000000000001);
  assign when_ExcepPlugin_l106 = (cpu_ports_wen && (cpu_ports_raddr == cpu_ports_waddr));
  always @(*) begin
    if(when_ExcepPlugin_l106) begin
      cpu_ports_rdata = cpu_ports_wdata;
    end else begin
      case(cpu_ports_raddr)
        12'h300 : begin
          cpu_ports_rdata = mstatus;
        end
        12'h304 : begin
          cpu_ports_rdata = mie;
        end
        12'h305 : begin
          cpu_ports_rdata = mtvec;
        end
        12'h341 : begin
          cpu_ports_rdata = mepc;
        end
        12'h342 : begin
          cpu_ports_rdata = mcause;
        end
        12'h343 : begin
          cpu_ports_rdata = mtval;
        end
        12'h344 : begin
          cpu_ports_rdata = mip;
        end
        12'hb00 : begin
          cpu_ports_rdata = mcycle;
        end
        12'hf14 : begin
          cpu_ports_rdata = mhartid;
        end
        default : begin
          cpu_ports_rdata = 64'h0;
        end
      endcase
    end
  end

  assign clint_ports_mtvec = mtvec;
  assign clint_ports_mepc = mepc;
  assign clint_ports_mstatus = mstatus;
  assign clint_ports_global_int_en = mstatus[3];
  assign clint_ports_mtime_int_en = mie[7];
  assign clint_ports_mtime_int_pend = mip[7];
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      mstatus <= {51'h0,13'h1880};
      mie <= 64'h0;
      mtvec <= 64'h0;
      mepc <= 64'h0;
      mcause <= 64'h0;
      mtval <= 64'h0;
      mip <= 64'h0;
      mcycle <= 64'h0;
      mhartid <= 64'h0;
      mscratch <= 64'h0;
    end else begin
      mcycle <= _zz_mcycle;
      mip <= {{{{52'h0,1'b0},3'b000},timer_int},7'h0};
      if(cpu_ports_wen) begin
        case(cpu_ports_waddr)
          12'h300 : begin
            mstatus <= {{{{{{{((cpu_ports_wdata[16 : 15] == 2'b11) || (cpu_ports_wdata[14 : 13] == 2'b11)),50'h0},2'b11},3'b000},cpu_ports_wdata[7]},3'b000},cpu_ports_wdata[3]},3'b000};
          end
          12'h304 : begin
            mie <= {{{{{{52'h0,cpu_ports_wdata[11]},3'b000},cpu_ports_wdata[7]},3'b000},cpu_ports_wdata[3]},3'b000};
          end
          12'h305 : begin
            mtvec <= cpu_ports_wdata;
          end
          12'h341 : begin
            mepc <= cpu_ports_wdata;
          end
          12'h342 : begin
            mcause <= cpu_ports_wdata;
          end
          12'h343 : begin
            mtval <= cpu_ports_wdata;
          end
          12'hf14 : begin
            mhartid <= cpu_ports_wdata;
          end
          12'h340 : begin
            mscratch <= cpu_ports_wdata;
          end
          default : begin
          end
        endcase
      end else begin
        if(clint_ports_mepc_wen) begin
          mepc <= clint_ports_mepc_wdata;
        end
        if(clint_ports_mcause_wen) begin
          mcause <= clint_ports_mcause_wdata;
        end
        if(clint_ports_mstatus_wen) begin
          mstatus <= clint_ports_mstatus_wdata;
        end
        mtvec <= {clint_ports_mtvec[63 : 2],2'b00};
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

  reg        [63:0]   _zz_read_value_1;
  reg        [63:0]   _zz_read_value_2;
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
  wire                when_DecodePlugin_l61;
  wire       [31:0]   _zz_1;

  always @(*) begin
    case(read_ports_rs1_addr)
      5'b00000 : _zz_read_value_1 = reg_file_0;
      5'b00001 : _zz_read_value_1 = reg_file_1;
      5'b00010 : _zz_read_value_1 = reg_file_2;
      5'b00011 : _zz_read_value_1 = reg_file_3;
      5'b00100 : _zz_read_value_1 = reg_file_4;
      5'b00101 : _zz_read_value_1 = reg_file_5;
      5'b00110 : _zz_read_value_1 = reg_file_6;
      5'b00111 : _zz_read_value_1 = reg_file_7;
      5'b01000 : _zz_read_value_1 = reg_file_8;
      5'b01001 : _zz_read_value_1 = reg_file_9;
      5'b01010 : _zz_read_value_1 = reg_file_10;
      5'b01011 : _zz_read_value_1 = reg_file_11;
      5'b01100 : _zz_read_value_1 = reg_file_12;
      5'b01101 : _zz_read_value_1 = reg_file_13;
      5'b01110 : _zz_read_value_1 = reg_file_14;
      5'b01111 : _zz_read_value_1 = reg_file_15;
      5'b10000 : _zz_read_value_1 = reg_file_16;
      5'b10001 : _zz_read_value_1 = reg_file_17;
      5'b10010 : _zz_read_value_1 = reg_file_18;
      5'b10011 : _zz_read_value_1 = reg_file_19;
      5'b10100 : _zz_read_value_1 = reg_file_20;
      5'b10101 : _zz_read_value_1 = reg_file_21;
      5'b10110 : _zz_read_value_1 = reg_file_22;
      5'b10111 : _zz_read_value_1 = reg_file_23;
      5'b11000 : _zz_read_value_1 = reg_file_24;
      5'b11001 : _zz_read_value_1 = reg_file_25;
      5'b11010 : _zz_read_value_1 = reg_file_26;
      5'b11011 : _zz_read_value_1 = reg_file_27;
      5'b11100 : _zz_read_value_1 = reg_file_28;
      5'b11101 : _zz_read_value_1 = reg_file_29;
      5'b11110 : _zz_read_value_1 = reg_file_30;
      default : _zz_read_value_1 = reg_file_31;
    endcase
  end

  always @(*) begin
    case(read_ports_rs2_addr)
      5'b00000 : _zz_read_value_2 = reg_file_0;
      5'b00001 : _zz_read_value_2 = reg_file_1;
      5'b00010 : _zz_read_value_2 = reg_file_2;
      5'b00011 : _zz_read_value_2 = reg_file_3;
      5'b00100 : _zz_read_value_2 = reg_file_4;
      5'b00101 : _zz_read_value_2 = reg_file_5;
      5'b00110 : _zz_read_value_2 = reg_file_6;
      5'b00111 : _zz_read_value_2 = reg_file_7;
      5'b01000 : _zz_read_value_2 = reg_file_8;
      5'b01001 : _zz_read_value_2 = reg_file_9;
      5'b01010 : _zz_read_value_2 = reg_file_10;
      5'b01011 : _zz_read_value_2 = reg_file_11;
      5'b01100 : _zz_read_value_2 = reg_file_12;
      5'b01101 : _zz_read_value_2 = reg_file_13;
      5'b01110 : _zz_read_value_2 = reg_file_14;
      5'b01111 : _zz_read_value_2 = reg_file_15;
      5'b10000 : _zz_read_value_2 = reg_file_16;
      5'b10001 : _zz_read_value_2 = reg_file_17;
      5'b10010 : _zz_read_value_2 = reg_file_18;
      5'b10011 : _zz_read_value_2 = reg_file_19;
      5'b10100 : _zz_read_value_2 = reg_file_20;
      5'b10101 : _zz_read_value_2 = reg_file_21;
      5'b10110 : _zz_read_value_2 = reg_file_22;
      5'b10111 : _zz_read_value_2 = reg_file_23;
      5'b11000 : _zz_read_value_2 = reg_file_24;
      5'b11001 : _zz_read_value_2 = reg_file_25;
      5'b11010 : _zz_read_value_2 = reg_file_26;
      5'b11011 : _zz_read_value_2 = reg_file_27;
      5'b11100 : _zz_read_value_2 = reg_file_28;
      5'b11101 : _zz_read_value_2 = reg_file_29;
      5'b11110 : _zz_read_value_2 = reg_file_30;
      default : _zz_read_value_2 = reg_file_31;
    endcase
  end

  assign read_value_1 = _zz_read_value_1;
  assign read_value_2 = _zz_read_value_2;
  assign when_DecodePlugin_l61 = (write_ports_rd_wen && (write_ports_rd_addr != 5'h0));
  assign _zz_1 = ({31'd0,1'b1} <<< write_ports_rd_addr);
  assign read_ports_rs1_value = (((write_ports_rd_wen && (write_ports_rd_addr == read_ports_rs1_addr)) && read_ports_rs1_req) ? write_ports_rd_value : read_value_1);
  assign read_ports_rs2_value = (((write_ports_rd_wen && (write_ports_rd_addr == read_ports_rs2_addr)) && read_ports_rs2_req) ? write_ports_rd_value : read_value_2);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      reg_file_0 <= 64'h0;
      reg_file_1 <= 64'h0;
      reg_file_2 <= 64'h0;
      reg_file_3 <= 64'h0;
      reg_file_4 <= 64'h0;
      reg_file_5 <= 64'h0;
      reg_file_6 <= 64'h0;
      reg_file_7 <= 64'h0;
      reg_file_8 <= 64'h0;
      reg_file_9 <= 64'h0;
      reg_file_10 <= 64'h0;
      reg_file_11 <= 64'h0;
      reg_file_12 <= 64'h0;
      reg_file_13 <= 64'h0;
      reg_file_14 <= 64'h0;
      reg_file_15 <= 64'h0;
      reg_file_16 <= 64'h0;
      reg_file_17 <= 64'h0;
      reg_file_18 <= 64'h0;
      reg_file_19 <= 64'h0;
      reg_file_20 <= 64'h0;
      reg_file_21 <= 64'h0;
      reg_file_22 <= 64'h0;
      reg_file_23 <= 64'h0;
      reg_file_24 <= 64'h0;
      reg_file_25 <= 64'h0;
      reg_file_26 <= 64'h0;
      reg_file_27 <= 64'h0;
      reg_file_28 <= 64'h0;
      reg_file_29 <= 64'h0;
      reg_file_30 <= 64'h0;
      reg_file_31 <= 64'h0;
    end else begin
      if(when_DecodePlugin_l61) begin
        if(_zz_1[0]) begin
          reg_file_0 <= write_ports_rd_value;
        end
        if(_zz_1[1]) begin
          reg_file_1 <= write_ports_rd_value;
        end
        if(_zz_1[2]) begin
          reg_file_2 <= write_ports_rd_value;
        end
        if(_zz_1[3]) begin
          reg_file_3 <= write_ports_rd_value;
        end
        if(_zz_1[4]) begin
          reg_file_4 <= write_ports_rd_value;
        end
        if(_zz_1[5]) begin
          reg_file_5 <= write_ports_rd_value;
        end
        if(_zz_1[6]) begin
          reg_file_6 <= write_ports_rd_value;
        end
        if(_zz_1[7]) begin
          reg_file_7 <= write_ports_rd_value;
        end
        if(_zz_1[8]) begin
          reg_file_8 <= write_ports_rd_value;
        end
        if(_zz_1[9]) begin
          reg_file_9 <= write_ports_rd_value;
        end
        if(_zz_1[10]) begin
          reg_file_10 <= write_ports_rd_value;
        end
        if(_zz_1[11]) begin
          reg_file_11 <= write_ports_rd_value;
        end
        if(_zz_1[12]) begin
          reg_file_12 <= write_ports_rd_value;
        end
        if(_zz_1[13]) begin
          reg_file_13 <= write_ports_rd_value;
        end
        if(_zz_1[14]) begin
          reg_file_14 <= write_ports_rd_value;
        end
        if(_zz_1[15]) begin
          reg_file_15 <= write_ports_rd_value;
        end
        if(_zz_1[16]) begin
          reg_file_16 <= write_ports_rd_value;
        end
        if(_zz_1[17]) begin
          reg_file_17 <= write_ports_rd_value;
        end
        if(_zz_1[18]) begin
          reg_file_18 <= write_ports_rd_value;
        end
        if(_zz_1[19]) begin
          reg_file_19 <= write_ports_rd_value;
        end
        if(_zz_1[20]) begin
          reg_file_20 <= write_ports_rd_value;
        end
        if(_zz_1[21]) begin
          reg_file_21 <= write_ports_rd_value;
        end
        if(_zz_1[22]) begin
          reg_file_22 <= write_ports_rd_value;
        end
        if(_zz_1[23]) begin
          reg_file_23 <= write_ports_rd_value;
        end
        if(_zz_1[24]) begin
          reg_file_24 <= write_ports_rd_value;
        end
        if(_zz_1[25]) begin
          reg_file_25 <= write_ports_rd_value;
        end
        if(_zz_1[26]) begin
          reg_file_26 <= write_ports_rd_value;
        end
        if(_zz_1[27]) begin
          reg_file_27 <= write_ports_rd_value;
        end
        if(_zz_1[28]) begin
          reg_file_28 <= write_ports_rd_value;
        end
        if(_zz_1[29]) begin
          reg_file_29 <= write_ports_rd_value;
        end
        if(_zz_1[30]) begin
          reg_file_30 <= write_ports_rd_value;
        end
        if(_zz_1[31]) begin
          reg_file_31 <= write_ports_rd_value;
        end
      end
    end
  end


endmodule

module static_predictor (
  input      [63:0]   predict_pc,
  input      [63:0]   predict_imm,
  input               predict_valid,
  input               predict_jal,
  input               predict_branch,
  output reg          predict_taken,
  output reg [63:0]   predict_pc_next
);

  wire       [63:0]   _zz_predict_pc_next;
  wire       [63:0]   _zz_predict_pc_next_1;
  wire       [63:0]   _zz_predict_pc_next_2;
  wire       [63:0]   _zz_predict_pc_next_3;
  wire       [63:0]   _zz_predict_pc_next_4;
  wire       [63:0]   _zz_predict_pc_next_5;
  wire                when_Predictor_l235;
  wire                when_Predictor_l239;

  assign _zz_predict_pc_next = ($signed(_zz_predict_pc_next_1) + $signed(_zz_predict_pc_next_2));
  assign _zz_predict_pc_next_1 = predict_pc;
  assign _zz_predict_pc_next_2 = predict_imm;
  assign _zz_predict_pc_next_3 = ($signed(_zz_predict_pc_next_4) + $signed(_zz_predict_pc_next_5));
  assign _zz_predict_pc_next_4 = predict_pc;
  assign _zz_predict_pc_next_5 = predict_imm;
  assign when_Predictor_l235 = (predict_valid && predict_jal);
  always @(*) begin
    if(when_Predictor_l235) begin
      predict_taken = 1'b1;
    end else begin
      if(when_Predictor_l239) begin
        predict_taken = predict_imm[63];
      end else begin
        predict_taken = 1'b0;
      end
    end
  end

  always @(*) begin
    if(when_Predictor_l235) begin
      predict_pc_next = _zz_predict_pc_next;
    end else begin
      if(when_Predictor_l239) begin
        predict_pc_next = _zz_predict_pc_next_3;
      end else begin
        predict_pc_next = 64'h0;
      end
    end
  end

  assign when_Predictor_l239 = (predict_valid && predict_branch);

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

  reg        [31:0]   _zz_ports_m_ports_payload;
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
  wire       [3:0]    _zz_1;
  wire                ports_s_ports_fire;

  always @(*) begin
    case(read_addr)
      2'b00 : _zz_ports_m_ports_payload = fifo_ram_0;
      2'b01 : _zz_ports_m_ports_payload = fifo_ram_1;
      2'b10 : _zz_ports_m_ports_payload = fifo_ram_2;
      default : _zz_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0];
  assign next_read_addr = (read_addr + 2'b01);
  assign write_addr = write_ptr[1 : 0];
  assign fifo_empty = (read_ptr == write_ptr);
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2]));
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready);
  assign _zz_1 = ({3'd0,1'b1} <<< write_addr);
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_s_ports_ready = (! fifo_full);
  assign ports_m_ports_valid = (! fifo_empty);
  assign ports_m_ports_payload = _zz_ports_m_ports_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000;
      write_ptr <= 3'b000;
    end else begin
      if(flush) begin
        read_ptr <= 3'b000;
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001);
        end
      end
      if(flush) begin
        write_ptr <= 3'b000;
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001);
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(_zz_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload;
        end
        if(_zz_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload;
        end
        if(_zz_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload;
        end
        if(_zz_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload;
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

  reg                 _zz_ports_m_ports_payload;
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
  wire       [3:0]    _zz_1;
  wire                ports_s_ports_fire;

  always @(*) begin
    case(read_addr)
      2'b00 : _zz_ports_m_ports_payload = fifo_ram_0;
      2'b01 : _zz_ports_m_ports_payload = fifo_ram_1;
      2'b10 : _zz_ports_m_ports_payload = fifo_ram_2;
      default : _zz_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0];
  assign next_read_addr = (read_addr + 2'b01);
  assign write_addr = write_ptr[1 : 0];
  assign fifo_empty = (read_ptr == write_ptr);
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2]));
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready);
  assign _zz_1 = ({3'd0,1'b1} <<< write_addr);
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_s_ports_ready = (! fifo_full);
  assign ports_m_ports_valid = (! fifo_empty);
  assign ports_m_ports_payload = _zz_ports_m_ports_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000;
      write_ptr <= 3'b000;
    end else begin
      if(flush) begin
        read_ptr <= 3'b000;
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001);
        end
      end
      if(flush) begin
        write_ptr <= 3'b000;
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001);
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(_zz_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload;
        end
        if(_zz_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload;
        end
        if(_zz_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload;
        end
        if(_zz_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload;
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

  reg        [63:0]   _zz_ports_m_ports_payload;
  reg        [63:0]   _zz_next_payload;
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
  wire       [3:0]    _zz_1;
  wire                ports_s_ports_fire;
  reg        [1:0]    fifo_cnt;
  wire                ports_s_ports_fire_1;
  wire                ports_m_ports_fire_1;
  wire                when_FIFO_l58;
  wire                ports_s_ports_fire_2;
  wire                ports_m_ports_fire_2;
  wire                when_FIFO_l61;

  always @(*) begin
    case(read_addr)
      2'b00 : _zz_ports_m_ports_payload = fifo_ram_0;
      2'b01 : _zz_ports_m_ports_payload = fifo_ram_1;
      2'b10 : _zz_ports_m_ports_payload = fifo_ram_2;
      default : _zz_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  always @(*) begin
    case(next_read_addr)
      2'b00 : _zz_next_payload = fifo_ram_0;
      2'b01 : _zz_next_payload = fifo_ram_1;
      2'b10 : _zz_next_payload = fifo_ram_2;
      default : _zz_next_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0];
  assign next_read_addr = (read_addr + 2'b01);
  assign write_addr = write_ptr[1 : 0];
  assign fifo_empty = (read_ptr == write_ptr);
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2]));
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready);
  assign _zz_1 = ({3'd0,1'b1} <<< write_addr);
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_s_ports_ready = (! fifo_full);
  assign ports_m_ports_valid = (! fifo_empty);
  assign ports_m_ports_payload = _zz_ports_m_ports_payload;
  assign next_payload = _zz_next_payload;
  assign ports_s_ports_fire_1 = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_m_ports_fire_1 = (ports_m_ports_valid && ports_m_ports_ready);
  assign when_FIFO_l58 = (ports_s_ports_fire_1 && (! ports_m_ports_fire_1));
  assign ports_s_ports_fire_2 = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_m_ports_fire_2 = (ports_m_ports_valid && ports_m_ports_ready);
  assign when_FIFO_l61 = ((! ports_s_ports_fire_2) && ports_m_ports_fire_2);
  assign next_valid = (2'b10 <= fifo_cnt);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000;
      write_ptr <= 3'b000;
      fifo_cnt <= 2'b00;
    end else begin
      if(flush) begin
        read_ptr <= 3'b000;
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001);
        end
      end
      if(flush) begin
        write_ptr <= 3'b000;
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001);
        end
      end
      if(when_FIFO_l58) begin
        fifo_cnt <= (fifo_cnt + 2'b01);
      end else begin
        if(when_FIFO_l61) begin
          fifo_cnt <= (fifo_cnt - 2'b01);
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(_zz_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload;
        end
        if(_zz_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload;
        end
        if(_zz_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload;
        end
        if(_zz_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload;
        end
      end
    end
  end


endmodule
