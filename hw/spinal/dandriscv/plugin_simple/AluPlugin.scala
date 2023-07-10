package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// ==================== exe stage ======================
class ALUPlugin() extends Plugin[DandRiscvSimple]{
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._  

    execute plug new Area{
      import execute._

      val src1 = Bits(XLEN bits) 
      val src2 = Bits(XLEN bits)
      val src1_word = src1(31 downto 0)
      val src2_word = src2(31 downto 0)
      val shift_bits = if(XLEN==32) src2(4 downto 0).asUInt else src2(5 downto 0).asUInt
      val add_result = src1.asSInt + src2.asSInt //SInt(XLEN bits)
      val sub_result = src1.asSInt - src2.asSInt //SInt(XLEN bits)
      val slt_result = src1.asSInt < src2.asSInt //Bool()
      val sltu_result= src1.asUInt < src2.asUInt //Bool()
      val xor_result = src1 ^ src2 //Bits(XLEN bits)
      val sll_result = src1 |<< shift_bits //Bits(XLEN bits)
      val srl_result = src1 |>> shift_bits //Bits(XLEN bits)
      val sra_result = src1.asSInt |>> shift_bits //SInt(XLEN bits)
      val and_result = src1 & src2 //Bits(XLEN bits)
      val or_result  = src1 | src2 //Bits(XLEN bits)
      val pc_next    = UInt(addressWidth bits)

      val addw_result= B((31 downto 0) -> add_result(31)) ## add_result(31 downto 0)
      val subw_result= B((31 downto 0) -> sub_result(31)) ## sub_result(31 downto 0)
      val sllw_temp  = src1_word |<< shift_bits(4 downto 0)
      val sllw_result= B((31 downto 0) -> sllw_temp(31)) ## sllw_temp
      val srlw_temp  = src1_word |>> shift_bits(4 downto 0)
      val srlw_result= B((31 downto 0) -> srlw_temp(31)) ## srlw_temp
      val sraw_temp  = src1_word.asSInt |>> shift_bits(4 downto 0)
      val sraw_result= B((31 downto 0) -> sraw_temp(31)) ## sraw_temp

      val alu_result  = Bits(XLEN bits)
      val jump  = input(ALU_CTRL)===AluCtrlEnum.JAL.asBits || input(ALU_CTRL)===AluCtrlEnum.JALR.asBits
      val branch_or_jump = jump || (input(ALU_CTRL)===AluCtrlEnum.BEQ.asBits) || (input(ALU_CTRL)===AluCtrlEnum.BNE.asBits) || (input(ALU_CTRL)===AluCtrlEnum.BLT.asBits) || (input(ALU_CTRL)===AluCtrlEnum.BGE.asBits) || (input(ALU_CTRL)===AluCtrlEnum.BLTU.asBits) ||  (input(ALU_CTRL)===AluCtrlEnum.BGEU.asBits)
      val branch_history = RegInit(B"7'b0")
      val branch_src1 = Bits(XLEN bits)
      val branch_src2 = Bits(XLEN bits)

      // ================= select op's source data ==================
      when(input(ALU_CTRL)===AluCtrlEnum.AUIPC.asBits || jump){
        src1 := input(PC).asBits
      }.otherwise{
        when(input(RS1_FROM_MEM)){
          src1 := memaccess.input(ALU_RESULT)
        }.elsewhen(input(RS1_FROM_WB)){
          src1 := writebackStage.output(RD)
        }.otherwise{
          src1 := input(RS1).asBits
        }
      }
      when(input(SRC2_IS_IMM)){
        src2 := input(IMM)
      }.elsewhen(jump){
        src2 := B(4, XLEN bits)
      }.otherwise{
        when(input(RS2_FROM_MEM)){
          src2 := memaccess.input(ALU_RESULT)
        }.elsewhen(input(RS2_FROM_WB)){
          src2 := writebackStage.output(RD)
        }.otherwise{
          src2 := input(RS2).asBits
        }
      }

      // ================= select branch op's source data ==================
      when(input(CTRL_RS1_FROM_MEM)){
        branch_src1 := memaccess.output(RS1).asBits
      }.elsewhen(input(CTRL_RS1_FROM_WB)){
        branch_src1 := writeback.output(RS1).asBits
      }.otherwise{
        branch_src1 := input(RS1).asBits
      }
      when(input(CTRL_RS2_FROM_MEM)){
        branch_src2 := memaccess.output(RS2).asBits
      }.elsewhen(input(CTRL_RS1_FROM_WB)){
        branch_src2 := writeback.output(RS2).asBits
      }.otherwise{
        branch_src2 := input(RS2).asBits
      }

      // ================= caclulate alu result =====================
      switch(input(ALU_CTRL)){
        is(AluCtrlEnum.ADD.asBits, AluCtrlEnum.AUIPC.asBits){
          when(input(ALU_WORD)===True){
            alu_result := addw_result
          }.otherwise{
            alu_result := add_result.asBits
          }
        }
        is(AluCtrlEnum.SUB.asBits){
          when(input(ALU_WORD)===True){
            alu_result := subw_result
          }.otherwise{
            alu_result := sub_result.asBits
          }
        }
        is(AluCtrlEnum.SLT.asBits){
          alu_result := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## slt_result
        }
        is(AluCtrlEnum.SLTU.asBits){
          alu_result := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## sltu_result
        }
        is(AluCtrlEnum.XOR.asBits){
          alu_result := xor_result
        }
        is(AluCtrlEnum.SLL.asBits){
          when(input(ALU_WORD)===True){
            alu_result := sllw_result
          }.otherwise{
            alu_result := sll_result
          }
        }
        is(AluCtrlEnum.SRL.asBits){
          when(input(ALU_WORD)===True){
            alu_result := srlw_result
          }.otherwise{
            alu_result := srl_result
          }
        }
        is(AluCtrlEnum.SRA.asBits){
          when(input(ALU_WORD)===True){
            alu_result := sraw_result
          }.otherwise{
            alu_result := sra_result.asBits
          }
        }
        is(AluCtrlEnum.AND.asBits){
          alu_result := and_result
        }
        is(AluCtrlEnum.OR.asBits){
          alu_result := or_result
        }
        is(AluCtrlEnum.LUI.asBits){
          alu_result := input(IMM)
        }
        default{
          alu_result := B(0, XLEN bits)
        }
      }

      // ================ for branch and jump ======================
      // calculate pc
      when(input(ALU_CTRL)===AluCtrlEnum.JALR.asBits){
        pc_next := ((src1.asSInt + input(IMM).asSInt) & ~S(1, XLEN bits)).asUInt // jalr
      }.otherwise{
        pc_next := (input(PC).asSInt + input(IMM).asSInt).asUInt // jal or branch
      }
      // decide if should branch or jump
      val beq_result = (branch_src1===branch_src2)
      val bne_result = (branch_src1=/=branch_src2)
      val blt_result = (branch_src1.asSInt < branch_src2.asSInt)
      val bge_result = (branch_src1.asSInt >=branch_src2.asSInt)
      val bltu_result =(branch_src1.asUInt <  branch_src2.asUInt)
      val bgeu_result =(branch_src1.asUInt >= branch_src2.asUInt)
      val branch_taken = beq_result || bne_result || blt_result || bge_result || bltu_result || bgeu_result || branch_taken || jump
      // branch history
      //branch_history := //TODO:
      

      // insert to stage
      insert(ALU_RESULT) := alu_result
      insert(MEM_WDATA) := input(RS2) // TODO:need bypass some value
      insert(PC_NEXT) := pc_next
      insert(BRANCH_OR_JUMP) := branch_or_jump
      insert(BRANCH_TAKEN) := branch_taken
      insert(JUMP) := jump

    }

  }

}