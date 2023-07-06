package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// Control instructionFetch
case class ControlPorts() extends Bundle {
  val hold = Bool()
}

trait ControlService{
  def newControlPorts() : ControlPorts
}

// ==================== Control unit handle hazard ======================
class ControlPlugin() extends Plugin[DandRiscvSimple]{
  
  var control_ports : ControlPorts = null
  
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

    control_ports = pipeline.service(classOf[ControlService]).newControlPorts

  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._ 

    control_ports.hold := False //TODO:need add logic

  }

}