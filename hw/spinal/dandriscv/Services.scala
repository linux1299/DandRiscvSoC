package dandriscv

import java.util

import spinal.core._
import spinal.lib._

// Control instructionFetch
case class ControlIF() extends Bundle {
  val hold = Bool()
}

trait ControlService{
  def newControlIF() : ControlIF
}