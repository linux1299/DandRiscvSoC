package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

case class Alu() extends Component {
  import CpuConfig._

  // =================== IO ===================
  val flush = in Bool()
  val stall = in Bool()
  val src_ports = slave(Stream(AluSrc()))
  val dst_ports = master(Stream(AluDst()))

  dst_ports.valid.setAsReg()
  dst_ports.payload.setAsReg()

  val src1       = src_ports.payload.src1
  val src2       = src_ports.payload.src2
  val imm        = src_ports.payload.imm
  val src1_word  = src1(31 downto 0)
  val src2_word  = src2(31 downto 0)
  val shift_bits = src2(5 downto 0).asUInt
  val add_result = src1.asSInt + src2.asSInt //SInt(64 bits)
  val sub_result = src1.asSInt - src2.asSInt //SInt(64 bits)
  val slt_result = src1.asSInt < src2.asSInt //Bool()
  val sltu_result= src1.asUInt < src2.asUInt //Bool()
  val xor_result = src1 ^ src2 //Bits(64 bits)
  val sll_result = src1 |<< shift_bits //Bits(64 bits)
  val srl_result = src1 |>> shift_bits //Bits(64 bits)
  val sra_result = src1.asSInt |>> shift_bits //SInt(64 bits)
  val and_result = src1 & src2 //Bits(64 bits)
  val or_result  = src1 | src2 //Bits(64 bits)
  val addw_result= B((31 downto 0) -> add_result(31)) ## add_result(31 downto 0)
  val subw_result= B((31 downto 0) -> sub_result(31)) ## sub_result(31 downto 0)
  val sllw_temp  = src1_word |<< shift_bits(4 downto 0)
  val sllw_result= B((31 downto 0) -> sllw_temp(31)) ## sllw_temp
  val srlw_temp  = src1_word |>> shift_bits(4 downto 0)
  val srlw_result= B((31 downto 0) -> srlw_temp(31)) ## srlw_temp
  val sraw_temp  = src1_word.asSInt |>> shift_bits(4 downto 0)
  val sraw_result= B((31 downto 0) -> sraw_temp(31)) ## sraw_temp
  val alu_result = Bits(64 bits)

  val alu_micro_op    = src_ports.payload.micro_op.alu_micro_op
  val alu_is_word     = src_ports.payload.micro_op.alu_is_word
  val alu_src2_is_imm = src_ports.payload.micro_op.alu_src2_is_imm

  // ================= caclulate alu result =====================
  switch(alu_micro_op){
    is(AluMicroOp.ADD){
      when(alu_is_word===True){
        alu_result := addw_result
      }.otherwise{
        alu_result := add_result.asBits
      }
    }
    is(AluMicroOp.SUB){
      when(alu_is_word===True){
        alu_result := subw_result
      }.otherwise{
        alu_result := sub_result.asBits
      }
    }
    is(AluMicroOp.SLT){
      alu_result := B(64-1 bits, (64-2 downto 0) -> false) ## slt_result
    }
    is(AluMicroOp.SLTU){
      alu_result := B(64-1 bits, (64-2 downto 0) -> false) ## sltu_result
    }
    is(AluMicroOp.XOR){
      alu_result := xor_result
    }
    is(AluMicroOp.SLL){
      when(alu_is_word===True){
        alu_result := sllw_result
      }.otherwise{
        alu_result := sll_result
      }
    }
    is(AluMicroOp.SRL){
      when(alu_is_word===True){
        alu_result := srlw_result
      }.otherwise{
        alu_result := srl_result
      }
    }
    is(AluMicroOp.SRA){
      when(alu_is_word===True){
        alu_result := sraw_result
      }.otherwise{
        alu_result := sra_result.asBits
      }
    }
    is(AluMicroOp.AND){
      alu_result := and_result
    }
    is(AluMicroOp.OR){
      alu_result := or_result
    }
    is(AluMicroOp.LUI){
      alu_result := imm
    }
    default{
      alu_result := B(0)
    }
  }

  // ================= caclulate multiply =====================
  val mul = Multiplier()
  mul.io.op_is_word := alu_is_word
  mul.io.src1_is_signed :=  (alu_micro_op===AluMicroOp.MUL) ||
                            (alu_micro_op===AluMicroOp.MULH) ||
                            (alu_micro_op===AluMicroOp.MULHSU)

  mul.io.src1_is_signed :=  (alu_micro_op===AluMicroOp.MUL) ||
                            (alu_micro_op===AluMicroOp.MULH)

  mul.io.src1 := src1
  mul.io.src2 := src2

  val mul_result = mul.io.result_low
  val mulh_result = mul.io.result_high
  val mulhu_result = 
}