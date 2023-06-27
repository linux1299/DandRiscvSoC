/*
 * @Author: mikey.zhaopeng 
 * @Date: 2023-06-27 15:23:08 
 * @Last Modified by:   mikey.zhaopeng 
 * @Last Modified time: 2023-06-27 15:23:08 
 */


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
}

class DandRiscv(val config : DandRiscvConfig) extends Component with Pipeline{
  type  T = DandRiscv
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


