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

      val rd_value  = Bits(XLEN bits)
      val op_is_jump= input(ALU_CTRL)===AluCtrlEnum.JAL.asBits || input(ALU_CTRL)===AluCtrlEnum.JALR.asBits

      // calculate pc
      when(input(ALU_CTRL)===AluCtrlEnum.JALR.asBits){
        pc_next := ((src1.asSInt + input(IMM).asSInt) & ~S(1, XLEN bits)).asUInt
      }.otherwise{
        pc_next := (input(PC).asSInt + input(IMM).asSInt).asUInt // jal or branch
      }

      when(input(ALU_CTRL)===AluCtrlEnum.AUIPC.asBits || op_is_jump){
        src1 := input(PC).asBits
      }.otherwise{
        src1 := input(RS1).asBits //TODO: need forward some value
      }
      when(input(SRC2_IS_IMM)){
        src2 := input(IMM)
      }.elsewhen(op_is_jump){
        src2 := B(4, XLEN bits)
      }.otherwise{
        src2 := input(RS2) //TODO: need forward some value
      }
      // caclulate rd
      switch(input(ALU_CTRL)){
        is(AluCtrlEnum.ADD.asBits, AluCtrlEnum.AUIPC.asBits){
          when(input(ALU_WORD)===True){
            rd_value := addw_result
          }.otherwise{
            rd_value := add_result.asBits
          }
        }
        is(AluCtrlEnum.SUB.asBits){
          when(input(ALU_WORD)===True){
            rd_value := subw_result
          }.otherwise{
            rd_value := sub_result.asBits
          }
        }
        is(AluCtrlEnum.SLT.asBits){
          rd_value := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## slt_result
        }
        is(AluCtrlEnum.SLTU.asBits){
          rd_value := B(XLEN-1 bits, (XLEN-2 downto 0) -> false) ## sltu_result
        }
        is(AluCtrlEnum.XOR.asBits){
          rd_value := xor_result
        }
        is(AluCtrlEnum.SLL.asBits){
          when(input(ALU_WORD)===True){
            rd_value := sllw_result
          }.otherwise{
            rd_value := sll_result
          }
        }
        is(AluCtrlEnum.SRL.asBits){
          when(input(ALU_WORD)===True){
            rd_value := srlw_result
          }.otherwise{
            rd_value := srl_result
          }
        }
        is(AluCtrlEnum.SRA.asBits){
          when(input(ALU_WORD)===True){
            rd_value := sraw_result
          }.otherwise{
            rd_value := sra_result.asBits
          }
        }
        is(AluCtrlEnum.AND.asBits){
          rd_value := and_result
        }
        is(AluCtrlEnum.OR.asBits){
          rd_value := or_result
        }
        is(AluCtrlEnum.LUI.asBits){
          rd_value := input(IMM)
        }
        default{
          rd_value := B(0, XLEN bits)
        }
      }

      insert(RD) := rd_value
      output(RD) := input(RD)

    }

  }

}