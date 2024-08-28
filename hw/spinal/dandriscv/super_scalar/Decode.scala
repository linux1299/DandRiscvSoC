package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import dandriscv.Riscv._

case class Decode() extends Component {
  import CpuConfig._
  import MyUtils._
  import AluCtrlEnum._
  import BjuCtrlEnum._
  import ExpCtrlEnum._
  import LsuCtrlEnum._
  // =================== IO ===================
  val pc = in UInt(PC_WIDTH bits)
  val instr = in Bits(32 bits)
  val rs1_addr = out UInt(5 bits)
  val rs2_addr = out UInt(5 bits)
  val rs1_rd_en = out Bool() // read reg enable
  val rs2_rd_en = out Bool() // read reg enable
  val rd_addr = out UInt(5 bits)
  val imm = out Bits(64 bits)
  val alu_micro_op = out(IQ_MicroOp("ALU"))
  val lsu_micro_op = out(IQ_MicroOp("LSU"))
  val bju_micro_op = out(IQ_MicroOp("BJU"))
  val exception = out(ExceptionEnum())
  val rob_micro_op = out(RobMicroOp())

  // =================== inter signals ===================
  // pre decode
  val opcode = instr(opcodeRange)
  val rd     = instr(rdRange)
  val rs1    = instr(rs1Range)
  val rs2    = instr(rs2Range)
  val func3  = instr(funct3Range)
  val func7  = instr(funct7Range)
  val csr    = instr(csrRange)
  // opcode
  val op_is_imm = (opcode===OP_IMM)
  val op_is_alu = (opcode===OP_ALU)
  val op_is_load = (opcode===OP_LOAD)
  val op_is_store = (opcode===OP_STORE)
  val op_is_jal = (opcode===OP_JAL)
  val op_is_jalr = (opcode===OP_JALR)
  val op_is_branch = (opcode===OP_BRANCH)
  val op_is_lui = (opcode===OP_LUI)
  val op_is_auipc = (opcode===OP_AUIPC)
  val op_is_fence = (opcode===OP_FENCE)
  val op_is_sys = (opcode===OP_SYS)
  val op_is_word = (opcode===OP_ALU_WORD)
  val op_is_wordi = (opcode===OP_IMM_WORD)
  // func3
  val func3_is_000 = (func3===B"000")
  val func3_is_001 = (func3===B"001")
  val func3_is_010 = (func3===B"010")
  val func3_is_011 = (func3===B"011")
  val func3_is_100 = (func3===B"100")
  val func3_is_101 = (func3===B"101")
  val func3_is_110 = (func3===B"110")
  val func3_is_111 = (func3===B"111")
  // func7
  val func7_is_0000000 = (func7===B"0000000")
  val func7_is_0100000 = (func7===B"0100000")
  val func7_is_0011000 = (func7===B"0011000")
  val func7_is_0000001 = (func7===B"0000001")
  val instr_high_6bit_is_000000 = (instr(31 downto 26)===B"000000")
  val instr_high_6bit_is_010000 = (instr(31 downto 26)===B"010000")

  //--------------ALU and imm ALU imm Instruction------------------------
  val add    = op_is_alu  && func3_is_000 && func7_is_0000000
  val and    = op_is_alu  && func3_is_111 && func7_is_0000000
  val or     = op_is_alu  && func3_is_110 && func7_is_0000000
  val sll    = op_is_alu  && func3_is_001 && func7_is_0000000
  val slt    = op_is_alu  && func3_is_010 && func7_is_0000000
  val sltu   = op_is_alu  && func3_is_011 && func7_is_0000000
  val sra    = op_is_alu  && func3_is_101 && func7_is_0100000
  val srl    = op_is_alu  && func3_is_101 && func7_is_0000000
  val sub    = op_is_alu  && func3_is_000 && func7_is_0100000
  val xor    = op_is_alu  && func3_is_100 && func7_is_0000000
  val subw   = op_is_word && func3_is_000 && func7_is_0100000
  val srlw   = op_is_word && func3_is_101 && func7_is_0000000
  val sraw   = op_is_word && func3_is_101 && func7_is_0100000
  val addw   = op_is_word && func3_is_000 && func7_is_0000000
  val sllw   = op_is_word && func3_is_001 && func7_is_0000000
  val addi   = op_is_imm   && func3_is_000
  val andi   = op_is_imm   && func3_is_111
  val ori    = op_is_imm   && func3_is_110
  val slli   = op_is_imm   && func3_is_001 && instr_high_6bit_is_000000
  val slti   = op_is_imm   && func3_is_010
  val sltiu  = op_is_imm   && func3_is_011
  val srai   = op_is_imm   && func3_is_101 && instr_high_6bit_is_010000
  val srli   = op_is_imm   && func3_is_101 && instr_high_6bit_is_000000
  val xori   = op_is_imm   && func3_is_100
  val srliw  = op_is_wordi && func3_is_101 && instr_high_6bit_is_000000
  val sraiw  = op_is_wordi && func3_is_101 && instr_high_6bit_is_010000
  val addiw  = op_is_wordi && func3_is_000
  val slliw  = op_is_wordi && func3_is_001 && instr_high_6bit_is_000000
  val lui    = op_is_lui
  val mul    = op_is_alu   && func3_is_000 && func7_is_0000001
  val mulh   = op_is_alu   && func3_is_001 && func7_is_0000001
  val mulhsu = op_is_alu   && func3_is_010 && func7_is_0000001
  val mulhu  = op_is_alu   && func3_is_011 && func7_is_0000001
  val div    = op_is_alu   && func3_is_100 && func7_is_0000001
  val divu   = op_is_alu   && func3_is_101 && func7_is_0000001
  val rem    = op_is_alu   && func3_is_110 && func7_is_0000001
  val remu   = op_is_alu   && func3_is_111 && func7_is_0000001
  val mulw   = op_is_word  && func3_is_000 && func7_is_0000001
  val divw   = op_is_word  && func3_is_100 && func7_is_0000001
  val divuw  = op_is_word  && func3_is_101 && func7_is_0000001
  val remw   = op_is_word  && func3_is_110 && func7_is_0000001
  val remuw  = op_is_word  && func3_is_111 && func7_is_0000001

  val alu_add = add  || addi || addw || addiw
  val alu_sub = sub  || subw
  val alu_slt = slt  || slti
  val alu_sltu= sltu || slti
  val alu_xor = xor  || xori
  val alu_sll = sll  || slli || sllw || slliw
  val alu_srl = srl  || srli || srlw || slliw
  val alu_sra = sra  || srai || sraw || sraiw
  val alu_and = and  || andi
  val alu_or  = or   || ori

  //---------Load and store-----------------------
  val lb     = op_is_load  && func3_is_000
  val lbu    = op_is_load  && func3_is_100
  val ld     = op_is_load  && func3_is_011
  val lh     = op_is_load  && func3_is_001
  val lhu    = op_is_load  && func3_is_101
  val lw     = op_is_load  && func3_is_010
  val lwu    = op_is_load  && func3_is_110
  val sb     = op_is_store && func3_is_000
  val sd     = op_is_store && func3_is_011
  val sh     = op_is_store && func3_is_001
  val sw     = op_is_store && func3_is_010
  val load   = op_is_load
  val store  = op_is_store

  //-------------Exception or CSR----------------------
  val ebreak = op_is_sys && func3_is_000 && func7_is_0000000 && (rs2===B"00001")
  val ecall  = op_is_sys && func3_is_000 && func7_is_0000000 && (rs2===B"00000")
  val mret   = op_is_sys && func3_is_000 && func7_is_0011000 && (rs2===B"00010")
  val csrrw  = op_is_sys && func3_is_001
  val csrrs  = op_is_sys && func3_is_010
  val csrrc  = op_is_sys && func3_is_011
  val csrrwi = op_is_sys && func3_is_101
  val csrrsi = op_is_sys && func3_is_110
  val csrrci = op_is_sys && func3_is_111
  val csri   = csrrwi || csrrsi || csrrci
  val csr_op = csri || csrrw || csrrs || csrrc

  //--------------Branch jal jalr----------------
  val beq    = op_is_branch && func3_is_000
  val bge    = op_is_branch && func3_is_101
  val bgeu   = op_is_branch && func3_is_111
  val blt    = op_is_branch && func3_is_100
  val bltu   = op_is_branch && func3_is_110
  val bne    = op_is_branch && func3_is_001
  val jal    = op_is_jal
  val jalr   = op_is_jalr
  val auipc  = op_is_auipc

  // ------------ choose imm ------------
  val imm_all = IMM_ALL(instr, 64)
  val csr_imm = B"59'd0" ## rs1
  val imm_data =  imm_all.u_sext ##
                  imm_all.j_sext ##
                  imm_all.b_sext ##
                  imm_all.s_sext ##
                  imm_all.i_sext ##
                  csr_imm
  val imm_type =  imm_all.u_type_imm ##
                  imm_all.j_type_imm ##
                  imm_all.b_type_imm ##
                  imm_all.s_type_imm ##
                  imm_all.i_type_imm ##
                  csri
  imm := dataMux(imm_type, imm_data)

  // ------------alu micro op ------------
  val alu_ctrl_sel =
    remuw ## remw ## divuw ## divw ## mulw ## remu ## rem ## 
    divu ## div ## mulhu ## mulhsu ## mulh ## mul ##
    lui ## alu_or ## alu_and ## alu_sra ## alu_srl ## 
    alu_sll ## alu_xor ## alu_sltu ## alu_slt ## alu_sub ## alu_add

  val alu_ctrl_data = 
    REMUW.asBits ## REMW.asBits ## DIVUW.asBits ##
    DIVW.asBits ## MULW.asBits ## REMU.asBits ##
    REM.asBits ## DIVU.asBits ## DIV.asBits ## 
    MULHU.asBits ## MULHSU.asBits ## MULH.asBits ## MUL.asBits ##
    LUI.asBits ## OR.asBits ## AND.asBits ## SRA.asBits ## SRL.asBits ## 
    SLL.asBits ## XOR.asBits ## SLTU.asBits ## SLT.asBits ## SUB.asBits ## ADD.asBits

  val alu_ctrl_op = dataMux(alu_ctrl_sel, alu_ctrl_data)

  // ------------bju micro op ------------
  val bju_ctrl_sel = 
    csr_op ## bgeu ## bltu ## bge ## blt ## bne ## beq ## jalr ## jal ## auipc
  
  val bju_ctrl_data = 
    CSR.asBits ## BGEU.asBits ## BLTU.asBits ## BGE.asBits ## BLT.asBits ## 
    BNE.asBits ## BEQ.asBits ## JALR.asBits ## JAL.asBits ## AUIPC.asBits

  val bju_ctrl_op = dataMux(bju_ctrl_sel, bju_ctrl_data)
  // ------------exp micro op ------------
  val exp_ctrl_sel = 
    csrrci ## csrrsi ## csrrwi ## csrrc ## csrrs ## csrrw ## mret ## ebreak ## ecall
  
  val exp_ctrl_data = 
    CSRRCI.asBits ## CSRRSI.asBits ## CSRRWI.asBits ## CSRRC.asBits ## 
    CSRRS.asBits ## CSRRW.asBits ## MRET.asBits ## EBREAK.asBits ## ECALL.asBits

  val exp_ctrl_op = dataMux(exp_ctrl_sel, exp_ctrl_data)

  // ------------lsu micro op ------------
  val lsu_ctrl_sel = 
    sd ## sw ## sh ## sb ## ld ## lwu ## lw ## lhu ## lh ## lbu ## lb

  val lsu_ctrl_data =
    SD.asBits ## SW.asBits ## SH.asBits ## SB.asBits ## LD.asBits ## 
    LWU.asBits ## LW.asBits ## LHU.asBits ## LH.asBits ## LBU.asBits ## LB.asBits

  val lsu_ctrl_op = dataMux(lsu_ctrl_sel, lsu_ctrl_data)

  // =================== output ===================
  val rd_wen = Bool()
  val src2_is_imm = Bool()
  rs1_addr := rs1.asUInt
  rs2_addr := rs2.asUInt
  rs1_rd_en  := !(imm_all.u_type_imm || imm_all.j_type_imm)
  rs2_rd_en  := !(imm_all.u_type_imm || imm_all.j_type_imm || imm_all.i_type_imm)
  rd_wen   := !imm_all.s_type_imm && 
              !imm_all.b_type_imm && 
              !ebreak && 
              !ecall && 
              !mret && 
              !op_is_fence
  rd_addr  := rd.asUInt
  src2_is_imm :=  imm_all.i_type_imm || 
                  imm_all.s_type_imm ||
                  imm_all.u_type_imm ||
                  imm_all.j_type_imm

  alu_micro_op.alu_ctrl_op.assignFromBits(alu_ctrl_op)
  alu_micro_op.alu_is_word := op_is_word || op_is_wordi
  alu_micro_op.src2_is_imm := src2_is_imm
  alu_micro_op.rd_wen := rd_wen

  lsu_micro_op.lsu_ctrl_op.assignFromBits(lsu_ctrl_op)
  lsu_micro_op.lsu_is_load := load
  lsu_micro_op.lsu_is_store := store
  lsu_micro_op.src2_is_imm := src2_is_imm
  lsu_micro_op.rd_wen := rd_wen

  bju_micro_op.bju_ctrl_op.assignFromBits(bju_ctrl_op)
  bju_micro_op.exp_ctrl_op.assignFromBits(exp_ctrl_op)
  bju_micro_op.bju_rd_eq_rs1 := (rd===rs1)
  bju_micro_op.bju_rd_is_link := (rd===B(0, 5 bits) || rd===B(5, 5 bits))
  bju_micro_op.bju_rs1_is_link := (rs1===B(0, 5 bits) || rs1===B(5, 5 bits))
  bju_micro_op.src2_is_imm := src2_is_imm
  bju_micro_op.rd_wen := rd_wen

  when(ecall){
    exception := ExceptionEnum.ECALL
  }.elsewhen(ebreak){
    exception := ExceptionEnum.EBREAK
  }.elsewhen(mret){
    exception := ExceptionEnum.MRET
  }.otherwise{
    exception := ExceptionEnum.IDLE
  }

  when(load || store){
    rob_micro_op := RobMicroOp.LSU
  }.elsewhen(op_is_imm || op_is_alu || op_is_lui || op_is_word || op_is_wordi){
    rob_micro_op := RobMicroOp.ALU
  }.elsewhen(op_is_jal || op_is_jalr || op_is_branch || op_is_auipc || op_is_sys){
    rob_micro_op := RobMicroOp.BJU
  }

}

case class DecodeStage(p : ReorderBufferConfig) extends Component {
  import p._
  import CpuConfig._

  // ==================== IO =============================
  val flush = in Bool()
  val stall = in Bool()
  val src_ports_0 = slave(Stream(FetchDst()))
  val src_ports_1 = slave(Stream(FetchDst()))
  val en_rob_ports_0 = master(Stream(EnROB(PC_WIDTH)))
  val en_rob_ports_1 = master(Stream(EnROB(PC_WIDTH)))

  // ==================== inst =============================
  val decode_0 = new Decode()
  val decode_1 = new Decode()
  
  
  // ==================== stream =============================
  val src_stream_0 = src_ports_0.haltWhen(stall).throwWhen(flush)
  val src_stream_1 = src_ports_1.haltWhen(stall).throwWhen(flush)
  val en_rob_stream_0 = Stream(EnROB(PC_WIDTH))
  val en_rob_stream_1 = Stream(EnROB(PC_WIDTH))

  // ==================== connect =============================
 

  decode_0.pc := src_stream_0.pc
  decode_0.instr := src_stream_0.instruction
  decode_1.pc := src_stream_1.pc
  decode_1.instr := src_stream_1.instruction

  // ==================== output =============================
  en_rob_stream_0.valid := src_stream_0.valid
  en_rob_stream_0.pc := src_stream_0.pc
  en_rob_stream_0.micro_op := decode_0.rob_micro_op
  en_rob_stream_0.rd_addr := decode_0.rd_addr
  en_rob_stream_0.exception := decode_0.exception
  en_rob_stream_0.rs1_rd_en := decode_0.rs1_rd_en
  en_rob_stream_0.rs2_rd_en := decode_0.rs2_rd_en
  en_rob_stream_0.rs1_addr := decode_0.rs1_addr
  en_rob_stream_0.rs2_addr := decode_0.rs2_addr
  en_rob_stream_0.imm_val := decode_0.imm
  en_rob_stream_0.bju_micro_op := decode_0.bju_micro_op
  en_rob_stream_0.alu_micro_op := decode_0.alu_micro_op
  en_rob_stream_0.lsu_micro_op := decode_0.lsu_micro_op

  en_rob_stream_1.valid := src_stream_1.valid
  en_rob_stream_1.pc := src_stream_1.pc
  en_rob_stream_1.micro_op := decode_1.rob_micro_op
  en_rob_stream_1.rd_addr := decode_1.rd_addr
  en_rob_stream_1.exception := decode_1.exception
  en_rob_stream_1.rs1_rd_en := decode_1.rs1_rd_en
  en_rob_stream_1.rs2_rd_en := decode_1.rs2_rd_en
  en_rob_stream_1.rs1_addr := decode_1.rs1_addr
  en_rob_stream_1.rs2_addr := decode_1.rs2_addr
  en_rob_stream_1.imm_val := decode_1.imm
  en_rob_stream_1.bju_micro_op := decode_1.bju_micro_op
  en_rob_stream_1.alu_micro_op := decode_1.alu_micro_op
  en_rob_stream_1.lsu_micro_op := decode_1.lsu_micro_op

  en_rob_stream_0 >-> en_rob_ports_0
  en_rob_stream_1 >-> en_rob_ports_1
}

object GenDecode extends App {
  GenConfig.spinal.generateVerilog(Decode())
}