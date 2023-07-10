package dandriscv

import java.util

import spinal.core._
import spinal.lib._



case class IntPorts(addressWidth : Int = 64) extends Bundle {
  val int_en = Bool()
	val int_pc = UInt(addressWidth bits)
	val int_hold = Bool()
}

trait InterruptService{
	def newIntPorts() : IntPorts
}