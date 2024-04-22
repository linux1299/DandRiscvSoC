package dandriscv.super_scalar

import dandriscv.ip._
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
  val i_dividend = in UInt(64 bits)
  val i_divisor = in UInt(64 bits)
  val o_quotient = out UInt(64 bits)
  val o_remainder = out UInt(64 bits)

  addRTLPath("../verilog/exu/div.sv")  
}


case class Div() extends Component {
  val io = new Bundle {
    val clk   = in Bool()
    val rst_n = in Bool()
    val flush = in Bool()
    val start = in Bool()
    val busy = out Bool()
    val done_valid = out Bool()
    val done_ready = in Bool()
    val op_is_word = in Bool()
    val op_is_signed = in Bool()
    val dividend = in UInt(64 bits)
    val divisor = in UInt(64 bits)
    val quetient = out UInt(64 bits)
    val remainder = out UInt(64 bits)
  }

  val u_div = new div()
  u_div.i_clk := io.clk
  u_div.i_rst_n := io.rst_n
  u_div.i_flush := io.flush
  u_div.i_divw := io.op_is_word
  u_div.i_start := io.start
  io.busy := u_div.o_busy
  io.done_valid := u_div.o_end_valid
  u_div.i_end_ready := io.done_ready
  u_div.i_signed := io.op_is_signed
  u_div.i_dividend := io.dividend
  u_div.i_divisor := io.divisor
  io.quetient := u_div.o_quotient
  io.remainder := u_div.o_remainder
}


object GenDiv extends App {
  GenConfig.spinal.generateVerilog(Div())
}