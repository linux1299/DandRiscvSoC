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

  @dontName var hazard : ControlPorts = null
  override def newControlPorts() : ControlPorts = {
    assert(hazard == null)
    hazard = ControlPorts()
    hazard
  }
  
  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._ 

    if(hazard != null) pipeline plug new Area{
      // data hazard detect
      hazard.rs1_from_mem := memaccess.arbitration.isValid && memaccess.output(RD_WEN)      && memaccess.output(RD_ADDR)=/=U(0, 5 bits)      && memaccess.output(RD_ADDR)===execute.output(RS1_ADDR) && !memaccess.output(IS_LOAD)
      hazard.rs2_from_mem := memaccess.arbitration.isValid && memaccess.output(RD_WEN)      && memaccess.output(RD_ADDR)=/=U(0, 5 bits)      && memaccess.output(RD_ADDR)===execute.output(RS2_ADDR) && !memaccess.output(IS_LOAD)
      hazard.rs1_from_wb  := writebackStage.arbitration.isValid && writebackStage.output(RD_WEN) && writebackStage.output(RD_ADDR)=/=U(0, 5 bits) && writebackStage.output(RD_ADDR)===execute.output(RS1_ADDR) && memaccess.output(RD_ADDR)=/=execute.output(RS1_ADDR)
      hazard.rs2_from_wb  := writebackStage.arbitration.isValid && writebackStage.output(RD_WEN) && writebackStage.output(RD_ADDR)=/=U(0, 5 bits) && writebackStage.output(RD_ADDR)===execute.output(RS2_ADDR) && memaccess.output(RD_ADDR)=/=execute.output(RS2_ADDR)
      hazard.load_use     := memaccess.arbitration.isValid && memaccess.output(IS_LOAD)     && ((memaccess.output(RD_ADDR)===execute.output(RS1_ADDR) && !hazard.rs1_from_wb) || (memaccess.output(RD_ADDR)===execute.output(RS2_ADDR) && !hazard.rs2_from_wb))
      
      // control hazadr detect
      hazard.ctrl_rs1_from_mem := execute.arbitration.isValid &&  execute.output(BRANCH_OR_JALR) && hazard.rs1_from_mem
      hazard.ctrl_rs2_from_mem := execute.arbitration.isValid &&  execute.output(BRANCH_OR_JALR) && hazard.rs2_from_mem
      hazard.ctrl_rs1_from_wb  := execute.arbitration.isValid &&  execute.output(BRANCH_OR_JALR) && hazard.rs1_from_wb
      hazard.ctrl_rs2_from_wb  := execute.arbitration.isValid &&  execute.output(BRANCH_OR_JALR) && hazard.rs2_from_wb
      hazard.ctrl_load_use     := execute.arbitration.isValid &&  execute.output(BRANCH_OR_JALR) && hazard.load_use

    }

    // control fetch stage
    fetch plug new Area{
      import fetch._
      arbitration.haltItself := False
      arbitration.flushIt := execute.output(REDIRECT_VALID)
    }
    
    // control decode stage
    decode plug new Area{
      import decode._
      arbitration.haltItself := False
      arbitration.flushIt := execute.output(REDIRECT_VALID)
    }

    // control exe stage
    execute plug new Area{
      import execute._
      insert(RS1_FROM_MEM) := hazard.rs1_from_mem
      insert(RS2_FROM_MEM) := hazard.rs2_from_mem
      insert(RS1_FROM_WB) := hazard.rs1_from_wb
      insert(RS2_FROM_WB) := hazard.rs2_from_wb
      insert(CTRL_RS1_FROM_MEM) := hazard.ctrl_rs1_from_mem
      insert(CTRL_RS2_FROM_MEM) := hazard.ctrl_rs2_from_mem
      insert(CTRL_RS1_FROM_WB)  := hazard.ctrl_rs1_from_wb
      insert(CTRL_RS2_FROM_WB)  := hazard.ctrl_rs2_from_wb
      arbitration.haltItself := output(INT_HOLD)
      arbitration.flushIt := False
    }

    // control memaccess stage
    memaccess plug new Area{
      import memaccess._
      arbitration.haltItself := hazard.load_use || hazard.ctrl_load_use || output(LSU_HOLD)
      arbitration.flushIt := False
    }

    // control writeback stage
    writeback plug new Area{
      import writeback._
      arbitration.haltItself := False
      arbitration.flushIt := False
    }

  }

}