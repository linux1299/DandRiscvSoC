package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// ====================== reg file ports ====================
case class RegFileReadPorts(XLEN : Int = 64) extends Bundle with IMasterSlave{
  val rs1_value = Bits(XLEN bits)
  val rs2_value = Bits(XLEN bits)
  val rs1_addr  = UInt(5 bits)
  val rs2_addr  = UInt(5 bits)
  val rs1_req   = Bool()
  val rs2_req   = Bool()

  override def asMaster(): Unit = {
    out(rs1_req, rs2_req, rs1_addr, rs2_addr)
    in(rs1_value, rs2_value)
  }
}
case class RegFileWritePorts(XLEN : Int = 64) extends Bundle with IMasterSlave{
  val rd_value = Bits(XLEN bits)
  val rd_addr  = UInt(5 bits)
  val rd_wen   = Bool()

  override def asMaster(): Unit = {
    out(rd_addr, rd_wen, rd_value)
  }
}

// ========================= register file moudle =========================
case class RegFileModule(XLEN : Int = 64) extends Component{
  val read_ports = slave(RegFileReadPorts(XLEN))
  val write_ports= slave(RegFileWritePorts(XLEN))

  val reg_file = Mem(Bits(XLEN bits), 32)
  reg_file.write(
      enable  = write_ports.rd_wen,
      address = write_ports.rd_addr,
      data    = write_ports.rd_value
    )

  read_ports.rs1_value := reg_file.readAsync(
      //enable  = read_ports.rs1_req,
      address = read_ports.rs1_addr
    )
  read_ports.rs2_value := reg_file.readAsync(
      //enable  = read_ports.rs2_req,
      address = read_ports.rs2_addr
    )
}

// ==================== decode stage ======================
class DecodePlugin() extends Plugin[DandRiscvSimple]{
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    decode plug new Area{
      import decode._

      val regfile_module = new RegFileModule(XLEN)

      val pc = input(PC)
      val instruction = input(INSTRUCTION)
      val imm_all = IMM_ALL(instruction, XLEN)
      val imm = Bits(XLEN bits)
      val rs1 = Bits(XLEN bits)
      val rs2 = Bits(XLEN bits)
      val alu_ctrl = Bits(AluCtrlEnum.ADD.asBits.getWidth bits)
      val alu_word = instruction(opcodeRange)===OP_ALU_WORD
      val src2_is_imm = imm_all.i_type_imm || imm_all.s_type_imm || imm_all.u_type_imm || imm_all.j_type_imm
      //val op_is_jal_or_jalr = instruction(opcodeRange)===OP_JAL || instruction(opcodeRange)===OP_JALR
      val mem_ctrl = Bits(MemCtrlEnum.LB.asBits.getWidth bits)
      val rd_wen = Bool()
      val rd_addr = instruction(rdRange).asUInt


      // decode logic
      
      when(imm_all.i_type_imm){
        imm := imm_all.i_sext
      }.elsewhen(imm_all.s_type_imm){
        imm := imm_all.s_sext
      }.elsewhen(imm_all.b_type_imm){
        imm := imm_all.b_sext
      }.elsewhen(imm_all.j_type_imm){
        imm := imm_all.j_sext
      }.elsewhen(imm_all.u_type_imm){
        imm := imm_all.u_sext
      }.otherwise{
        imm := imm_all.i_sext
      }

      switch(instruction){
        is(ADD, ADDW, ADDI, ADDIW, AUIPC){
          alu_ctrl := AluCtrlEnum.ADD.asBits
        }
        is(SUB, SUBW){
          alu_ctrl := AluCtrlEnum.SUB.asBits
        }
        is(SLT, SLTI){
          alu_ctrl := AluCtrlEnum.SLT.asBits
        }
        is(SLTU, SLTIU){
          alu_ctrl := AluCtrlEnum.SLTU.asBits
        }
        is(XOR, XORI){
          alu_ctrl := AluCtrlEnum.XOR.asBits
        }
        is(SLL, SLLI, SLLW, SLLIW){
          alu_ctrl := AluCtrlEnum.SLL.asBits
        }
        is(SRL, SRLI, SRLW, SRLIW){
          alu_ctrl := AluCtrlEnum.SRL.asBits
        }
        is(SRA, SRAI, SRAW, SRAIW){
          alu_ctrl := AluCtrlEnum.SRA.asBits
        }
        is(AND, ANDI){
          alu_ctrl := AluCtrlEnum.AND.asBits
        }
        is(OR){
          alu_ctrl := AluCtrlEnum.OR.asBits
        }
        is(LUI){
          alu_ctrl := AluCtrlEnum.LUI.asBits
        }
        is(AUIPC){
          alu_ctrl := AluCtrlEnum.AUIPC.asBits
        }
        is(JAL(false)){
          alu_ctrl := AluCtrlEnum.JAL.asBits
        }
        is(JALR){
          alu_ctrl := AluCtrlEnum.JALR.asBits
        }
        default {
          alu_ctrl := B(0)
        }
      }

      switch(instruction){
        is(LB){
          mem_ctrl := MemCtrlEnum.LB.asBits
        }
        is(LBU){
          mem_ctrl := MemCtrlEnum.LBU.asBits
        }
        is(LH){
          mem_ctrl := MemCtrlEnum.LH.asBits
        }
        is(LHU){
          mem_ctrl := MemCtrlEnum.LHU.asBits
        }
        is(LW){
          mem_ctrl := MemCtrlEnum.LW.asBits
        }
        is(LWU){
          mem_ctrl := MemCtrlEnum.LWU.asBits
        }
        is(LD){
          mem_ctrl := MemCtrlEnum.LD.asBits
        }
        is(SB){
          mem_ctrl := MemCtrlEnum.SB.asBits
        }
        is(SH){
          mem_ctrl := MemCtrlEnum.SH.asBits
        }
        is(SW){
          mem_ctrl := MemCtrlEnum.SW.asBits
        }
        is(SD){
          mem_ctrl := MemCtrlEnum.SD.asBits
        }
        default{
          mem_ctrl := B(0)
        }
      }

      regfile_module.read_ports.rs1_addr := instruction(rs1Range).asUInt
      regfile_module.read_ports.rs2_addr := instruction(rs2Range).asUInt
      regfile_module.read_ports.rs1_req := !(imm_all.u_type_imm || imm_all.j_type_imm)
      regfile_module.read_ports.rs2_req := !(imm_all.u_type_imm || imm_all.j_type_imm || imm_all.i_type_imm)
      rs1 := regfile_module.read_ports.rs1_value
      rs2 := regfile_module.read_ports.rs2_value
      rd_wen := decode.arbitration.isValid && (!imm_all.s_type_imm && !imm_all.s_type_imm && !(instruction===EBREAK) && !(instruction===ECALL) && !(instruction===MRET) && !(instruction(opcodeRange)===OP_FENCE))


      // insert to stages
      insert(IMM) := imm
      insert(RS1) := rs1
      insert(RS2) := rs2
      insert(ALU_CTRL) := alu_ctrl
      insert(ALU_WORD) := alu_word
      insert(SRC2_IS_IMM) := src2_is_imm

      
    }

    execute plug new Area{
      import execute._
      output(IMM) := input(IMM)
    }
  }
}