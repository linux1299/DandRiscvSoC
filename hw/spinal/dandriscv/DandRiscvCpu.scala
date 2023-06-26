package dandriscv

import dandriscv.plugin._
import spinal.core._

import scala.collection.mutable.ArrayBuffer
import scala.collection.Seq

object DandRiscvConfig{
  def apply(withMemoryStage : Boolean, withWriteBackStage : Boolean, plugins : Seq[Plugin[DandRiscv]]): DandRiscvConfig = {
    val config = DandRiscvConfig()
    config.plugins ++= plugins
    config.withMemoryStage = withMemoryStage
    config.withWriteBackStage = withWriteBackStage
    config
  }

  def apply(plugins : Seq[Plugin[DandRiscv]] = ArrayBuffer()) : DandRiscvConfig = apply(true,true,plugins)
}
trait DandRiscvRegressionArg{
  def getDandRiscvRegressionArgs() : Seq[String]
}
case class DandRiscvConfig(){
  var withMemoryStage = true
  var withWriteBackStage = true
  val plugins = ArrayBuffer[Plugin[DandRiscv]]()

  def add(that : Plugin[DandRiscv]) : this.type = {plugins += that;this}
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

  def FLEN = 32

  //Default Stageables
  object IS_RVC extends Stageable(Bool)
  object BYPASSABLE_EXECUTE_STAGE   extends Stageable(Bool)
  object BYPASSABLE_MEMORY_STAGE   extends Stageable(Bool)
  object RS1   extends Stageable(Bits(32 bits))
  object RS2   extends Stageable(Bits(32 bits))
  object RS1_USE extends Stageable(Bool)
  object RS2_USE extends Stageable(Bool)
  object RESULT extends Stageable(UInt(32 bits))
  object PC extends Stageable(UInt(32 bits))
  object PC_CALC_WITHOUT_JUMP extends Stageable(UInt(32 bits))
  object INSTRUCTION extends Stageable(Bits(32 bits))
  object INSTRUCTION_ANTICIPATED extends Stageable(Bits(32 bits))
  object LEGAL_INSTRUCTION extends Stageable(Bool)
  object REGFILE_WRITE_VALID extends Stageable(Bool)
  object REGFILE_WRITE_DATA extends Stageable(Bits(32 bits))

  object MPP extends PipelineThing[UInt]
  object DEBUG_BYPASS_CACHE extends PipelineThing[Bool]

  object SRC1   extends Stageable(Bits(32 bits))
  object SRC2   extends Stageable(Bits(32 bits))
  object SRC_ADD_SUB extends Stageable(Bits(32 bits))
  object SRC_ADD extends Stageable(Bits(32 bits))
  object SRC_SUB extends Stageable(Bits(32 bits))
  object SRC_LESS extends Stageable(Bool)
  object SRC_USE_SUB_LESS extends Stageable(Bool)
  object SRC_LESS_UNSIGNED extends Stageable(Bool)
  object SRC_ADD_ZERO extends Stageable(Bool)


  object HAS_SIDE_EFFECT extends Stageable(Bool)

  //Formal verification purposes
  object FORMAL_HALT       extends Stageable(Bool)
  object FORMAL_PC_NEXT    extends Stageable(UInt(32 bits))
  object FORMAL_MEM_ADDR   extends Stageable(UInt(32 bits))
  object FORMAL_MEM_RMASK  extends Stageable(Bits(4 bits))
  object FORMAL_MEM_WMASK  extends Stageable(Bits(4 bits))
  object FORMAL_MEM_RDATA  extends Stageable(Bits(32 bits))
  object FORMAL_MEM_WDATA  extends Stageable(Bits(32 bits))
  object FORMAL_INSTRUCTION extends Stageable(Bits(32 bits))
  object FORMAL_MODE       extends Stageable(Bits(2 bits))


  object Src1CtrlEnum extends SpinalEnum(binarySequential){
    val RS, IMU, PC_INCREMENT, URS1 = newElement()   //IMU, IMZ IMJB
  }

  object Src2CtrlEnum extends SpinalEnum(binarySequential){
    val RS, IMI, IMS, PC = newElement() //TODO remplacing ZERO could avoid 32 muxes if SRC_ADD can be disabled
  }
  object SRC1_CTRL  extends Stageable(Src1CtrlEnum())
  object SRC2_CTRL  extends Stageable(Src2CtrlEnum())

  def getRegressionArgs() : Seq[String] = {
    val str = ArrayBuffer[String]()
    plugins.foreach{
      case e : DandRiscvRegressionArg => str ++= e.getDandRiscvRegressionArgs()
      case _ =>
    }
    str
  }
}




class DandRiscv(val config : DandRiscvConfig) extends Component with Pipeline{
  type  T = DandRiscv
  import config._

  //Define stages
  def newStage(): Stage = { val s = new Stage; stages += s; s }
  val stage_1    = newStage()
  val stage_2    = newStage()
  val stage_3    = newStage()

  plugins ++= config.plugins
}


