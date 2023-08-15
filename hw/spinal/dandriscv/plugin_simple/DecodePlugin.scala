package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
//import dandriscv.plugin_simple._

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

  // val wordArray = (0 until 32).map(i => {
  //   BigInt(0)
  // })

  // val reg_file = Mem(Bits(XLEN bits), 32) // initBigInt(wordArray)
  // val read_value_1 = reg_file.readAsync(
  //   address = read_ports.rs1_addr
  //   )
  // val read_value_2 = reg_file.readAsync(
  //   address = read_ports.rs2_addr
  // )

  // reg_file.write(
  //     enable  = write_ports.rd_wen,
  //     address = write_ports.rd_addr,
  //     data    = write_ports.rd_value
  //   )

  val reg_file = Vec(Reg(Bits(XLEN bits)) init(0), 32).setName("reg_file")
  val read_value_1 = reg_file(read_ports.rs1_addr)
  val read_value_2 = reg_file(read_ports.rs2_addr)
  when(write_ports.rd_wen && write_ports.rd_addr=/=U(0, 5 bits)){
    reg_file(write_ports.rd_addr) := write_ports.rd_value
  }

  read_ports.rs1_value := (write_ports.rd_wen && (write_ports.rd_addr===read_ports.rs1_addr && write_ports.rd_addr=/=U(0,5 bits)) && read_ports.rs1_req) ? write_ports.rd_value | read_value_1
  read_ports.rs2_value := (write_ports.rd_wen && (write_ports.rd_addr===read_ports.rs2_addr && write_ports.rd_addr=/=U(0,5 bits)) && read_ports.rs2_req) ? write_ports.rd_value | read_value_2
}

// ==================== decode stage ======================
class DecodePlugin() extends Plugin[DandRiscvSimple]
{
  var hazard : ControlPorts = null

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    hazard = pipeline.service(classOf[ControlService]).newControlPorts
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    val regfile_module = new RegFileModule(XLEN)

    decode plug new Area{
      import decode._

      val pc = input(PC)
      val instruction = input(INSTRUCTION)
      val imm_all = IMM_ALL(instruction, XLEN)
      val imm = Bits(XLEN bits)
      val rs1 = Bits(XLEN bits)
      val rs2 = Bits(XLEN bits)
      val rs1_req = !(imm_all.u_type_imm || imm_all.j_type_imm)
      val rs2_req = !(imm_all.u_type_imm || imm_all.j_type_imm || imm_all.i_type_imm)
      val rs1_addr = instruction(rs1Range).asUInt
      val rs2_addr = instruction(rs2Range).asUInt
      val rd_wen = Bool()
      val rd_addr = instruction(rdRange).asUInt
      val alu_ctrl = Bits(AluCtrlEnum.ADD.asBits.getWidth bits)
      val alu_word = instruction(opcodeRange)===OP_ALU_WORD || instruction(opcodeRange)===OP_IMM_WORD
      val src2_is_imm = imm_all.i_type_imm || imm_all.s_type_imm || imm_all.u_type_imm

      val mem_ctrl = Bits(MemCtrlEnum.LB.asBits.getWidth bits)
      val is_load = Bool()
      val is_store= Bool()
      // val branch_or_jalr = instruction(opcodeRange)===OP_BRANCH || instruction===JALR
      val csr_ctrl = Bits(CsrCtrlEnum.EBREAK.asBits.getWidth bits)
      val csr_addr = instruction(csrRange).asUInt
      val csr_wen  = csr_ctrl===CsrCtrlEnum.CSRRW.asBits || csr_ctrl===CsrCtrlEnum.CSRRS.asBits || csr_ctrl===CsrCtrlEnum.CSRRC.asBits

      // choose imm
      when(imm_all.i_type_imm){
        imm := imm_all.i_sext
      }
      .elsewhen(imm_all.s_type_imm){
        imm := imm_all.s_sext
      }
      .elsewhen(imm_all.b_type_imm){
        imm := imm_all.b_sext
      }
      .elsewhen(imm_all.j_type_imm){
        imm := imm_all.j_sext
      }
      .elsewhen(imm_all.u_type_imm){
        imm := imm_all.u_sext
      }
      .otherwise{
        imm := imm_all.i_sext
      }

      // choose ALU's type
      switch(instruction){
        is(ADD, ADDW, ADDI, ADDIW, SB, SH, SW, SD){
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
        is(OR, ORI){
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
        is(BEQ(false)){
          alu_ctrl := AluCtrlEnum.BEQ.asBits
        }
        is(BNE(false)){
          alu_ctrl := AluCtrlEnum.BNE.asBits
        }
        is(BLT(false)){
          alu_ctrl := AluCtrlEnum.BLT.asBits
        }
        is(BGE(false)){
          alu_ctrl := AluCtrlEnum.BGE.asBits
        }
        is(BLTU(false)){
          alu_ctrl := AluCtrlEnum.BLTU.asBits
        }
        is(BGEU(false)){
          alu_ctrl := AluCtrlEnum.BGEU.asBits
        }
        default {
          alu_ctrl := B(0)
        }
      }

      // choose LSU's type
      switch(instruction){
        is(LB){
          mem_ctrl := MemCtrlEnum.LB.asBits
          is_load  := True
          is_store := False
        }
        is(LBU){
          mem_ctrl := MemCtrlEnum.LBU.asBits
          is_load  := True
          is_store := False
        }
        is(LH){
          mem_ctrl := MemCtrlEnum.LH.asBits
          is_load  := True
          is_store := False
        }
        is(LHU){
          mem_ctrl := MemCtrlEnum.LHU.asBits
          is_load  := True
          is_store := False
        }
        is(LW){
          mem_ctrl := MemCtrlEnum.LW.asBits
          is_load  := True
          is_store := False
        }
        is(LWU){
          mem_ctrl := MemCtrlEnum.LWU.asBits
          is_load  := True
          is_store := False
        }
        is(LD){
          mem_ctrl := MemCtrlEnum.LD.asBits
          is_load  := True
          is_store := False
        }
        is(SB){
          mem_ctrl := MemCtrlEnum.SB.asBits
          is_load  := False
          is_store := True
        }
        is(SH){
          mem_ctrl := MemCtrlEnum.SH.asBits
          is_load  := False
          is_store := True
        }
        is(SW){
          mem_ctrl := MemCtrlEnum.SW.asBits
          is_load  := False
          is_store := True
        }
        is(SD){
          mem_ctrl := MemCtrlEnum.SD.asBits
          is_load  := False
          is_store := True
        }
        default{
          mem_ctrl := B(0)
          is_load  := False
          is_store := False
        }
      }

      // choose Csr op type
      switch(instruction){
        is(ECALL){
          csr_ctrl := CsrCtrlEnum.ECALL.asBits
        }
        is(EBREAK){
          csr_ctrl := CsrCtrlEnum.EBREAK.asBits
        }
        is(MRET){
          csr_ctrl := CsrCtrlEnum.MRET.asBits
        }
        is(CSRRW){
          csr_ctrl := CsrCtrlEnum.CSRRW.asBits
        }
        is(CSRRS){
          csr_ctrl := CsrCtrlEnum.CSRRS.asBits
        }
        is(CSRRC){
          csr_ctrl := CsrCtrlEnum.CSRRC.asBits
        }
        is(CSRRWI){
          csr_ctrl := CsrCtrlEnum.CSRRWI.asBits
        }
        is(CSRRSI){
          csr_ctrl := CsrCtrlEnum.CSRRSI.asBits
        }
        is(CSRRCI){
          csr_ctrl := CsrCtrlEnum.CSRRCI.asBits
        }
        default{
          csr_ctrl := 0
        }
      }

      // access reigster file
      regfile_module.read_ports.rs1_addr := rs1_addr
      regfile_module.read_ports.rs2_addr := rs2_addr
      regfile_module.read_ports.rs1_req := rs1_req
      regfile_module.read_ports.rs2_req := rs2_req
      rs1 := regfile_module.read_ports.rs1_value
      rs2 := regfile_module.read_ports.rs2_value
      rd_wen := !imm_all.s_type_imm && !imm_all.b_type_imm && instruction=/=EBREAK && instruction=/=ECALL && instruction=/=MRET && instruction(opcodeRange)=/=OP_FENCE

      // insert to decode stage
      insert(IMM) := imm
      insert(RS1) := rs1
      insert(RS2) := rs2
      insert(RS1_ADDR) := rs1_addr
      insert(RS2_ADDR) := rs2_addr
      insert(ALU_CTRL) := alu_ctrl
      insert(ALU_WORD) := alu_word
      insert(SRC2_IS_IMM) := src2_is_imm
      insert(MEM_CTRL) := mem_ctrl
      insert(RD_WEN) := rd_wen
      insert(RD_ADDR) := rd_addr
      insert(IS_LOAD) := is_load
      insert(IS_STORE):= is_store
      insert(CSR_CTRL) := csr_ctrl
      insert(CSR_ADDR) := csr_addr
      insert(CSR_WEN)  := csr_wen
      // insert to fetch stage
      fetch.insert(FETCH_DEC_JAL) :=    fetch.output(INSTRUCTION)(opcodeRange)===OP_JAL
      fetch.insert(FETCH_DEC_JALR) :=   fetch.output(INSTRUCTION)(opcodeRange)===OP_JALR
      fetch.insert(FETCH_DEC_BRANCH) := fetch.output(INSTRUCTION)(opcodeRange)===OP_BRANCH
      fetch.insert(FETCH_DEC_IMM) := IMM_ALL(fetch.output(INSTRUCTION), XLEN).b_type_imm ? IMM_ALL(fetch.output(INSTRUCTION), XLEN).b_sext | IMM_ALL(fetch.output(INSTRUCTION), XLEN).j_sext


      // hazard control input
      hazard.decode_rs1_req := rs1_req
      hazard.decode_rs2_req := rs2_req
      hazard.decode_rs1_addr := rs1_addr
      hazard.decode_rs2_addr := rs2_addr
    }

    // regfile recv rd from wb stage
    writebackStage plug new Area{
      import writebackStage._
      regfile_module.write_ports.rd_wen := arbitration.isFiring & output(RD_WEN)
      regfile_module.write_ports.rd_addr := output(RD_ADDR)
      regfile_module.write_ports.rd_value := output(RD)
    }

    

  }
}