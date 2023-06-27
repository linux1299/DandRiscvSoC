package dandriscv.plugin

import dandriscv._
import spinal.core._
import spinal.lib._

object InstructionFetchPlugin{
  object INSTRUCTION extends Stageable(Bits(32 bits))
}

case class dBusClass() extends Bundle with IMasterSlave{
  val dataout = Bits(32 bits)
  val datain = Bits(32 bits)

  override def asMaster: Unit = {
    out(dataout)
  }

  override def asSlave: Unit = {
    in(datain)
  }
}

class InstructionFetchPlugin extends Plugin[DandRiscv] with ICacheAccessService{
  import InstructionFetchPlugin._

  override def setup(pipeline: DandRiscv): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscv): Unit = {
    import pipeline._
    import pipeline.config._

    val slaveBus = slave(dBusClass()).setName("slaveBus")
    val masterBus = master(dBusClass()).setName("masterBus")
    masterBus.dataout := B(0, 32 bits)

    fetch plug new Area{
      import fetch._

      insert(INSTRUCTION) := slaveBus.datain
    }


  }
}