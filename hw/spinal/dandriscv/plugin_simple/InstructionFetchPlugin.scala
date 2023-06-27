package dandriscv.plugin_simple

import dandriscv._
import spinal.core._
import spinal.lib._
import dandriscv.plugin._
import dandriscv.plugin_simple._

//object InstructionFetchPlugin{
//  //object INSTRUCTION extends Stageable(Bits(32 bits))
//  //object INST_TEST extends Stageable(Bits(32 bits))
//  //object INST_EXE extends Stageable(Bits(32 bits))
//}

case class inoutClass() extends Bundle with IMasterSlave{
  val dataout = Bits(32 bits)
  val datain = Bits(32 bits)

  override def asMaster: Unit = {
    out(dataout)
  }

  override def asSlave: Unit = {
    in(datain)
  }
}

class InstructionFetchPlugin extends Plugin[DandRiscvSimple] with ICacheAccessService{
  //import InstructionFetchPlugin._

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess()
    icache_access
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    val slaveBus = slave(inoutClass()).setName("slaveBus")
    val masterBus = master(inoutClass()).setName("masterBus")
    masterBus.dataout := B(1, 32 bits)

    fetch plug new Area{
      import fetch._

      insert(INSTRUCTION) := slaveBus.datain
    }

    //decode plug new Area{
    //  import decode._
//
    //  insert(INST_TEST) := input(INSTRUCTION)
    //}

    execute plug new Area{
      import execute._

      insert(INST_EXE) := input(INST_TEST)
    }

    if(icache_access != null) pipeline plug new Area{
      icache_access.cmd.ready := True
    }


  }
}