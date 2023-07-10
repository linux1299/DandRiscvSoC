package dandriscv

import dandriscv.plugin._
import dandriscv.plugin_simple._
import spinal.core._

import scala.collection.mutable.ArrayBuffer
import scala.collection.Seq

object DandRiscvSimpleConfig{
  def apply(withWBstage : Boolean, plugins : Seq[Plugin[DandRiscvSimple]]): DandRiscvSimpleConfig = {
    val config = DandRiscvSimpleConfig()
    config.plugins ++= plugins
    config.withWBstage = withWBstage
    config
  }

  def apply(plugins : Seq[Plugin[DandRiscvSimple]] = ArrayBuffer()) : DandRiscvSimpleConfig = apply(true,plugins)

}
trait DandRiscvSimpleRegressionArg{
  def getDandRiscvSimpleRegressionArgs() : Seq[String]
}
case class DandRiscvSimpleConfig(){
  var withWBstage = true
  var addressWidth = 64
  var XLEN = 64
  val plugins = ArrayBuffer[Plugin[DandRiscvSimple]]()

  def add(that : Plugin[DandRiscvSimple]) : this.type = {plugins += that;this}
  def find[T](clazz: Class[T]): Option[T] = {
    plugins.find(_.getClass == clazz) match {
      case Some(x) => Some(x.asInstanceOf[T])
      case None => None
    }
  }
  def get[T](clazz: Class[T]): T = {
    plugins.find(_.getClass == clazz) match {
      case Some(x) => x.asInstanceOf[T]
    }
  }
  
  object AluCtrlEnum extends SpinalEnum(binarySequential){
    val ADD, SUB, SLT, SLTU, XOR, SLL, SRL, SRA, AND, OR, LUI, AUIPC, JAL, JALR,BEQ, BNE, BLT, BGE, BLTU, BGEU= newElement()
  }

  object MemCtrlEnum extends SpinalEnum(binarySequential){
    val LB, LBU, LH, LHU, LW, LWU, LD, SB, SH, SW, SD= newElement()
  }

  object PC extends Stageable(UInt(addressWidth bits))
  object PC_NEXT extends Stageable(UInt(addressWidth bits))
  object BPU_PC_NEXT extends Stageable(UInt(addressWidth bits))
  object BPU_BRANCH_TAKEN extends Stageable(Bool())
  object INSTRUCTION extends Stageable(Bits(32 bits))
  object RS1 extends Stageable(Bits(XLEN bits))
  object RS2 extends Stageable(Bits(XLEN bits))
  object IMM extends Stageable(Bits(XLEN bits))
  object ALU_CTRL extends Stageable(Bits(AluCtrlEnum.ADD.asBits.getWidth bits))
  object ALU_WORD extends Stageable(Bool())
  object SRC2_IS_IMM extends Stageable(Bool())
  object RD extends Stageable(Bits(XLEN bits))
  object RD_WEN extends Stageable(Bool())
  object RD_ADDR extends Stageable(UInt(5 bits))
  object RS1_ADDR extends Stageable(UInt(5 bits))
  object RS2_ADDR extends Stageable(UInt(5 bits))
  object ALU_RESULT extends Stageable(Bits(XLEN bits))
  object MEM_CTRL extends Stageable(Bits(MemCtrlEnum.LB.asBits.getWidth bits))
  object MEM_WDATA extends Stageable(Bits(XLEN bits))
  object DATA_LOAD extends Stageable(Bits(XLEN bits))
  object IS_LOAD extends Stageable(Bool())
  object LOAD_USE extends Stageable(Bool())
  object BRANCH_OR_JALR extends Stageable(Bool())
  object RS1_FROM_MEM extends Stageable(Bool())
  object RS2_FROM_MEM extends Stageable(Bool())
  object RS1_FROM_WB extends Stageable(Bool())
  object RS2_FROM_WB extends Stageable(Bool())
  object CTRL_RS1_FROM_MEM extends Stageable(Bool())
  object CTRL_RS2_FROM_MEM extends Stageable(Bool())
  object CTRL_RS1_FROM_WB extends Stageable(Bool())
  object CTRL_RS2_FROM_WB extends Stageable(Bool())
  object CTRL_LOAD_USE extends Stageable(Bool())
  object BRANCH_TAKEN extends Stageable(Bool())
  object BRANCH_OR_JUMP extends Stageable(Bool())
  object BRANCH_HISTORY extends Stageable(UInt(7 bits))
  object IS_CALL extends Stageable(Bool())
  object IS_RET extends Stageable(Bool())
  object IS_JMP extends Stageable(Bool())
  object MISPRED extends Stageable(Bool())
}


class DandRiscvSimple(val config : DandRiscvSimpleConfig) extends Component with Pipeline{

  type  T = DandRiscvSimple
  import config._

  //Define stages
  def newStage(): Stage = { val s = new Stage; stages += s; s }
  val fetch     = newStage()
  val decode    = newStage()
  val execute   = newStage()
  val memaccess = newStage()
  val writeback = ifGen(config.withWBstage) (newStage())
  val writebackStage = if(config.withWBstage) writeback else memaccess
  plugins ++= config.plugins

}


