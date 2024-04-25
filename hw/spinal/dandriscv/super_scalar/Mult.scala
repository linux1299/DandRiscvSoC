package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._

case class mult() extends BlackBox {

  val i_mulw = in Bool()
  val i_x_sign = in Bool()
  val i_y_sign = in Bool()
  val i_x = in Bits(64 bits)
  val i_y = in Bits(64 bits)
  val o_hi_res = out Bits(64 bits)
  val o_lw_res  = out Bits(64 bits)

  addRTLPath("../../../verilog/exu/mult.sv")
  addRTLPath("../../../verilog/exu/booth_1bit.sv")
  addRTLPath("../../../verilog/exu/booth.sv")
  addRTLPath("../../../verilog/exu/csa_nbit.sv")
  addRTLPath("../../../verilog/exu/rca_nbit.sv")
  addRTLPath("../../../verilog/exu/wallace_tree_33.sv")
}


case class Multiplier() extends Component {
  val io = new Bundle {
    val op_is_word = in Bool()
    val src1_is_signed = in Bool()
    val src2_is_signed = in Bool()
    val src1 = in Bits(64 bits)
    val src2 = in Bits(64 bits)
    val result_high = out Bits(64 bits)
    val result_low  = out Bits(64 bits)
  }

  val u_mult = new mult()

  u_mult.i_mulw := io.op_is_word
  u_mult.i_x_sign := io.src1_is_signed
  u_mult.i_y_sign := io.src2_is_signed
  u_mult.i_x := io.src1
  u_mult.i_y := io.src2
  io.result_high := u_mult.o_hi_res
  io.result_low := u_mult.o_lw_res

}

object GenMult extends App {
  GenConfig.spinal.generateVerilog(Multiplier())
}
