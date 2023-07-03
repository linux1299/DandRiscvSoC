package dandriscv

import dandriscv.plugin._
import dandriscv.plugin_simple._
import spinal.core._

import scala.collection.mutable.ArrayBuffer
import scala.collection.Seq

object DandRiscvSimpleConfig{
  def apply(withMemoryStage : Boolean, withWriteBackStage : Boolean, plugins : Seq[Plugin[DandRiscvSimple]]): DandRiscvSimpleConfig = {
    val config = DandRiscvSimpleConfig()
    config.plugins ++= plugins
    config.withMemoryStage = withMemoryStage
    config.withWriteBackStage = withWriteBackStage
    config
  }

  def apply(plugins : Seq[Plugin[DandRiscvSimple]] = ArrayBuffer()) : DandRiscvSimpleConfig = apply(true,true,plugins)

}
trait DandRiscvSimpleRegressionArg{
  def getDandRiscvSimpleRegressionArgs() : Seq[String]
}
case class DandRiscvSimpleConfig(){
  var withMemoryStage = true
  var withWriteBackStage = true
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
  
  object PC extends Stageable(UInt(32 bits))
  object INSTRUCTION extends Stageable(Bits(32 bits))
  object PC_EXE extends Stageable(Bits(32 bits))

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
  val writeback = newStage()
  plugins ++= config.plugins

}


