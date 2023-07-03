package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.plugin._
import dandriscv.plugin_simple._

//case class inoutClass() extends Bundle with IMasterSlave{
//  val dataout = Bits(32 bits)
//  val datain = Bits(32 bits)
//  override def asMaster(): Unit = {
//    out(dataout)
//  }
//  override def asSlave(): Unit = {
//    in(datain)
//  }
//}

class InstructionFetchPlugin(resetVector : BigInt = 0x80000000l,
                             addressWidth : BigInt = 64) 
extends Plugin[DandRiscvSimple] with ICacheAccessService with ControlService{

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess(64, 32)
    icache_access
  }
  @dontName var control_service : ControlIF = null
  override def newControlIF(): ControlIF = {
    assert(control_service == null)
    control_service = ControlIF()
    control_service
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscvSimple): Unit = {
    import pipeline._
    import pipeline.config._

    //val slaveBus = slave(inoutClass()).setName("slaveBus")
    //val masterBus = master(inoutClass()).setName("masterBus")
    //masterBus.dataout := B(2, 32 bits)

    @dontName val fetchInst = new Area{
      val pc_reg = Reg(UInt(addressWidth bits)) init(resetVector)
      val pc = RegNextWhen(pc_reg, icache_access.cmd.fire)
      val pc_next = pc_reg + 4
      val fetch_valid = RegInit(False)

      when(False){
      //when(control_service.hold){
        pc_reg := pc_reg
        fetch_valid := False
      }.otherwise{
        pc_reg := pc_next
        fetch_valid := True
      }
    }

    fetch plug new Area{
      import fetch._
      insert(PC) := fetchInst.pc
    }

    // send cmd to icache
    if(icache_access != null) pipeline plug new Area{
      icache_access.cmd.valid := fetchInst.fetch_valid
      icache_access.cmd.addr := fetchInst.pc
    }


  }
}