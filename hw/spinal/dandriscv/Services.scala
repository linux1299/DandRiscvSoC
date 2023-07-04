package dandriscv

import java.util

import spinal.core._
import spinal.lib._

// Control instructionFetch
case class ControlPorts() extends Bundle {
  val hold = Bool()
}

trait ControlService{
  def newControlPorts() : ControlPorts
}

case class IntPorts(addressWidth : Int = 64) extends Bundle {
  val int_en = Bool()
	val int_pc = UInt(addressWidth bits)
	val int_hold = Bool()
}

trait InterruptService{
	def newIntPorts() : IntPorts
}

case class BPUPorts(addressWidth : Int = 64) extends Bundle {
	val branch_taken = Bool()
	val branch_pc = UInt(addressWidth bits)
}

trait BPUService{
	def newBPUPorts() : BPUPorts
}