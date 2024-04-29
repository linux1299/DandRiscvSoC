package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

case class Alu() extends Component {
  import CpuConfig._

  // =================== IO ===================
  val clk   = in Bool()
  val rst_n = in Bool()
  val flush = in Bool()
  val stall = in Bool()
  val src_ports = slave(Stream(AluSrc()))
  val dst_ports = master(Stream(AluDst()))
  
  // =================== signals ===================
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
  
  val alu_is_mul      = (alu_micro_op===AluMicroOp.MUL) ||
                        (alu_micro_op===AluMicroOp.MULH) ||
                        (alu_micro_op===AluMicroOp.MULHSU) ||
                        (alu_micro_op===AluMicroOp.MULHU) ||
                        (alu_micro_op===AluMicroOp.MULW)

  val alu_is_quo      = (alu_micro_op===AluMicroOp.DIV)  ||
                        (alu_micro_op===AluMicroOp.DIVU) ||
                        (alu_micro_op===AluMicroOp.DIVW) ||
                        (alu_micro_op===AluMicroOp.DIVUW)

  val alu_is_rem      = (alu_micro_op===AluMicroOp.REM) ||
                        (alu_micro_op===AluMicroOp.REMU) ||
                        (alu_micro_op===AluMicroOp.REMW) ||
                        (alu_micro_op===AluMicroOp.REMUW)
  val alu_is_div      = alu_is_quo || alu_is_rem
                        

  val src_stream = src_ports.haltWhen(stall).throwWhen(flush)
  val dst_stream = Stream(AluDst())

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

  mul.io.src2_is_signed :=  (alu_micro_op===AluMicroOp.MUL) ||
                            (alu_micro_op===AluMicroOp.MULH)

  mul.io.src1 := src1
  mul.io.src2 := src2

  val mul_result_low = mul.io.result_low
  val mul_result_high = mul.io.result_high
  val mul_result = Bits(64 bits)
  mul_result :=  alu_is_word ? (B((31 downto 0) -> mul_result_low(31)) ## mul_result_low(31 downto 0)) |
                ((alu_micro_op===AluMicroOp.MUL || alu_micro_op===AluMicroOp.MULH) ? mul_result_low | mul_result_high)

  // ================= caclulate div =====================
  val div = Divider()
  div.io.clk := clk
  div.io.rst_n := rst_n
  // div.io.clk := True
  // div.io.rst_n := False
  div.io.flush := flush
  div.io.start := src_ports.fire
  div.io.done_ready := dst_stream.ready
  div.io.op_is_word := alu_is_word
  div.io.op_is_signed :=  (alu_micro_op===AluMicroOp.DIV) ||
                          (alu_micro_op===AluMicroOp.REM) ||
                          (alu_micro_op===AluMicroOp.DIVW)||
                          (alu_micro_op===AluMicroOp.REMW)
  div.io.dividend := src1
  div.io.divisor  := src2
  val div_result_quotient = div.io.quotient
  val div_result_remainder= div.io.remainder
  
  // ================= stream control =====================
  src_stream.ready := dst_stream.ready
  dst_stream.valid := (!alu_is_div && !div.io.busy && src_stream.valid) || div.io.done_valid
  dst_stream.payload.result := alu_is_mul ? mul_result | 
                        (alu_is_quo ? div_result_quotient | 
                        (alu_is_rem ? div_result_remainder | alu_result)
                        )
  dst_stream >-> dst_ports
}

case class Alu_module() extends Component {
  val clk = in Bool()
  val rst_n = in Bool()
  val clkDomain = ClockDomain(
    clock = clk,
    reset = rst_n,
    config = ClockDomainConfig(
      clockEdge        = RISING,
      resetKind        = ASYNC,
      resetActiveLevel = LOW
    )
  )
  val alu = new Alu()
  alu.clk := clk
  alu.rst_n := rst_n
}

object GenALU extends App {
  GenConfig.spinal.generateVerilog(Alu())
}