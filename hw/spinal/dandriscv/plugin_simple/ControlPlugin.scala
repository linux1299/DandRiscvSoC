package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// Control instructionFetch
case class ControlPorts() extends Bundle {
  val decode_rs1_req =  Bool()
  val decode_rs2_req =  Bool()
  val decode_rs1_addr = UInt(5 bits)
  val decode_rs2_addr = UInt(5 bits)

  val rs1_from_mem = Bool()
  val rs2_from_mem = Bool()
  val rs1_from_wb = Bool()
  val rs2_from_wb = Bool()
  val load_use = Bool()

  val ctrl_rs1_from_mem = Bool()
  val ctrl_rs2_from_mem = Bool()
  val ctrl_rs1_from_wb = Bool()
  val ctrl_rs2_from_wb = Bool()
  val ctrl_load_use = Bool()
}

trait ControlService{
  def newControlPorts() : ControlPorts
}

// ==================== Control unit handle hazard ======================
class ControlPlugin() extends Plugin[DandRiscvSimple]
with ControlService
{

  @dontName var control_ports : ControlPorts = null
  override def newControlPorts() : ControlPorts = {
    assert(control_ports == null)
    control_ports = ControlPorts()
    control_ports
  }
  
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._ 

    if(control_ports != null) pipeline plug new Area{
      // data hazard detect
      control_ports.rs1_from_mem := memaccess.output(RD_WEN) && memaccess.output(RD_ADDR)=/=U(0, 5 bits) && memaccess.output(RD_ADDR)===execute.output(RS1_ADDR)
      control_ports.rs2_from_mem := memaccess.output(RD_WEN) && memaccess.output(RD_ADDR)=/=U(0, 5 bits) && memaccess.output(RD_ADDR)===execute.output(RS2_ADDR)
      control_ports.rs1_from_wb := writebackStage.output(RD_WEN) && writebackStage.output(RD_ADDR)=/=U(0, 5 bits) && writebackStage.output(RD_ADDR)===execute.output(RS1_ADDR) && ((memaccess.output(RD_ADDR)=/=execute.output(RS1_ADDR)) || writebackStage.output(IS_LOAD))
      control_ports.rs2_from_wb := writebackStage.output(RD_WEN) && writebackStage.output(RD_ADDR)=/=U(0, 5 bits) && writebackStage.output(RD_ADDR)===execute.output(RS2_ADDR) && ((memaccess.output(RD_ADDR)=/=execute.output(RS2_ADDR)) || writebackStage.output(IS_LOAD))
      control_ports.load_use    := memaccess.output(IS_LOAD) && ((control_ports.decode_rs1_req && control_ports.decode_rs1_addr===execute.output(RD_ADDR)) || (control_ports.decode_rs2_req && control_ports.decode_rs2_addr===execute.output(RD_ADDR)))
      
      // control hazadr detect
      control_ports.ctrl_rs1_from_mem := execute.output(BRANCH_OR_JALR) && control_ports.rs1_from_mem
      control_ports.ctrl_rs2_from_mem := execute.output(BRANCH_OR_JALR) && control_ports.rs2_from_mem
      control_ports.ctrl_rs1_from_wb  := execute.output(BRANCH_OR_JALR) && control_ports.rs1_from_wb
      control_ports.ctrl_rs2_from_wb  := execute.output(BRANCH_OR_JALR) && control_ports.rs2_from_wb
      control_ports.ctrl_load_use     := execute.output(BRANCH_OR_JALR) && memaccess.output(IS_LOAD) && (execute.output(RS1_ADDR)===memaccess.output(RD_ADDR) || execute.output(RS2_ADDR)===memaccess.output(RD_ADDR))

    }

    fetch plug new Area{
      import fetch._
      insert(LOAD_USE) := control_ports.load_use
      // control fetch stage
      // add allowOverride or see Stage.scala
      arbitration.haltItself := input(LOAD_USE) || input(INT_HOLD) || input(LSU_HOLD)
      
    }

    execute plug new Area{
      import execute._
      insert(RS1_FROM_MEM) := control_ports.rs1_from_mem
      insert(RS2_FROM_MEM) := control_ports.rs2_from_mem
      insert(RS1_FROM_WB) := control_ports.rs1_from_wb
      insert(RS2_FROM_WB) := control_ports.rs2_from_wb
      insert(CTRL_RS1_FROM_MEM) := control_ports.ctrl_rs1_from_mem
      insert(CTRL_RS2_FROM_MEM) := control_ports.ctrl_rs2_from_mem
      insert(CTRL_RS1_FROM_WB)  := control_ports.ctrl_rs1_from_wb
      insert(CTRL_RS2_FROM_WB)  := control_ports.ctrl_rs2_from_wb
      insert(CTRL_LOAD_USE) := control_ports.ctrl_load_use
      // control exe stage
      
    }

  }

}