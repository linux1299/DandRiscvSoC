package dandriscv.super_scalar_1issue

import spinal.core._
import spinal.lib._
import math._

case class div() extends BlackBox {
  
  val i_clk   = in Bool()
  val i_rst_n = in Bool()
  val i_flush = in Bool()
  val i_start = in Bool()
  val o_busy = out Bool()
  val o_end_valid = out Bool()
  val i_end_ready = in Bool()
  val i_divw = in Bool()
  val i_signed = in Bool()
  val i_dividend = in Bits(64 bits)
  val i_divisor = in Bits(64 bits)
  val o_quotient = out Bits(64 bits)
  val o_remainder = out Bits(64 bits)

  addRTLPath("hw/verilog/exu/div.sv")

  mapClockDomain(clock=i_clk, reset=i_rst_n, resetActiveLevel=LOW)

}

case class div_gen_0() extends BlackBox {
  val aclk = in Bool()
  val s_axis_divisor_tvalid = in Bool()
  val s_axis_divisor_tdata = in Bits(64 bits)
  val s_axis_dividend_tvalid = in Bool()
  val s_axis_dividend_tdata = in Bits(64 bits)
  val m_axis_dout_tvalid = out Bool()
  val m_axis_dout_tdata = out Bits(128 bits)

  addRTLPath("hw/verilog/exu/div_gen_0.v")
  mapClockDomain(clock=aclk)
}


case class Divider() extends Component {
  val io = new Bundle {
    val flush = in Bool()
    val start = in Bool()
    val busy = out Bool()
    val done_valid = out Bool()
    val done_ready = in Bool()
    val op_is_word = in Bool()
    val op_is_signed = in Bool()
    val dividend = in Bits(64 bits)
    val divisor = in Bits(64 bits)
    val quotient = out Bits(64 bits)
    val remainder = out Bits(64 bits)
  }

  
  // u_div.i_flush := io.flush
  // u_div.i_divw := io.op_is_word
  // u_div.i_start := io.start
  // io.busy := u_div.o_busy
  // io.done_valid := u_div.o_end_valid
  // u_div.i_end_ready := io.done_ready
  // u_div.i_signed := io.op_is_signed
  // u_div.i_dividend := io.dividend
  // u_div.i_divisor := io.divisor
  // io.quotient := u_div.o_quotient
  // io.remainder := u_div.o_remainder


  val u_div = div_gen_0()
  val busy_reg = RegInit(False)
  when(io.flush){
    busy_reg := False
  }
  .elsewhen(io.start){
    busy_reg := True
  }
  .elsewhen(io.done_valid){
    busy_reg := False
  }

  val dividend_word_extd = Bits(64 bits)
  val divisor_word_extd  = Bits(64 bits)
  val dividend_abs = UInt(64 bits)
  val divisor_abs  = UInt(64 bits)
  val dividend_positive = Bool()
  val divisor_positive  = Bool()
  dividend_word_extd := (B(32 bits, (31 downto 0) -> io.dividend(31)) ## io.dividend(31 downto 0))
  divisor_word_extd  := (B(32 bits, (31 downto 0) -> io.divisor(31)) ## io.divisor(31 downto 0))
  dividend_positive := io.op_is_signed ? !dividend_word_extd(63) | True
  divisor_positive  := io.op_is_signed ? !divisor_word_extd(63) | True
  // dividend_abs     := io.op_is_signed ? dividend_word_extd.asUInt | (~dividend_word_extd.asUInt + 1)
  // divisor_abs      := io.op_is_signed ? divisor_wrapper.asUInt  | (~divisor_wrapper.asUInt + 1)

  when(io.op_is_word){
    when(io.op_is_signed){
      dividend_abs     := dividend_word_extd.asSInt.abs
      divisor_abs      := divisor_word_extd.asSInt.abs
    }
    .otherwise{
      dividend_abs     := (B(32 bits, (31 downto 0) -> False) ## io.dividend(31 downto 0)).asUInt
      divisor_abs      := (B(32 bits, (31 downto 0) -> False) ## io.divisor(31 downto 0)).asUInt
    }
  }
  .otherwise{
    when(io.op_is_signed){
      dividend_abs     := io.dividend.asSInt.abs
      divisor_abs      := io.divisor.asSInt.abs
    }
    .otherwise{
      dividend_abs     := io.dividend.asUInt
      divisor_abs      := io.divisor.asUInt
    }
  }


  val quotient_origin = Bits(64 bits)
  val remainder_origin= Bits(64 bits)
  val quotient_word_extd = Bits(64 bits)
  val remainder_word_extd= Bits(64 bits)
  val quotient_wrapper  = UInt(64 bits)
  val remainder_wrapper = UInt(64 bits)
  quotient_origin := u_div.m_axis_dout_tdata(127 downto 64)
  remainder_origin := u_div.m_axis_dout_tdata(63 downto 0)
  quotient_word_extd := (B(32 bits, (31 downto 0) -> quotient_origin(31)) ## quotient_origin(31 downto 0))
  remainder_word_extd := (B(32 bits, (31 downto 0) -> remainder_origin(31)) ## remainder_origin(31 downto 0))
  
  when(io.op_is_word){
    // when(io.op_is_signed){

    // }
    // .otherwise{
      
    // }
    quotient_wrapper  := (dividend_positive === divisor_positive) ? quotient_word_extd.asUInt | (~quotient_origin.asUInt + 1)
    remainder_wrapper := dividend_positive ? remainder_word_extd.asUInt | (~remainder_origin.asUInt + 1)
    // quotient_wrapper  := quotient_word_extd.asUInt
    // remainder_wrapper := remainder_word_extd.asUInt
  }
  .otherwise{
    // when(io.op_is_signed){

    // }
    // .otherwise{

    // }
    quotient_wrapper  := (dividend_positive === divisor_positive) ? quotient_origin.asUInt | (~quotient_origin.asUInt + 1)
    remainder_wrapper := dividend_positive ? remainder_origin.asUInt | (~remainder_origin.asUInt + 1)
  }
  
  u_div.s_axis_divisor_tvalid := io.start
  u_div.s_axis_divisor_tdata  := divisor_abs.asBits
  u_div.s_axis_dividend_tvalid:= io.start
  u_div.s_axis_dividend_tdata := dividend_abs.asBits
  io.quotient := quotient_wrapper.asBits
  io.remainder:= remainder_wrapper.asBits
  io.done_valid := u_div.m_axis_dout_tvalid && busy_reg
  io.busy := busy_reg

  
}


object GenDiv extends App {
  val clk = Bool()
  val rst_n = Bool()
  val clkDomain = ClockDomain(
    clock = clk,
    reset = rst_n,
    config = ClockDomainConfig(
      clockEdge = RISING,
      resetKind = ASYNC,
      resetActiveLevel = LOW
    )
  )
  GenConfig.spinal.generateVerilog(Divider()).mergeRTLSource("div")
}