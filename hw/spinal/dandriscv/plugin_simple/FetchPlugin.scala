package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

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


class FetchPlugin(resetVector : BigInt = 0x80000000l, addressWidth : Int = 64) //
extends Plugin[DandRiscvSimple]
with ICacheAccessService
{

  @dontName var icache_access : ICacheAccess = null
  override def newICacheAccess(): ICacheAccess = {
    assert(icache_access == null)
    icache_access = ICacheAccess(addressWidth, 32)
    icache_access
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

    val pc_next = Reg(UInt(this.addressWidth bits)).setName("pc_next") init(resetVector)
    val pc = RegNextWhen(pc_next, icache_access.cmd.fire).setName("pc")
    val fetch_valid = RegInit(False).setName("fetch_valid")
    val int_pc_reg = Reg(UInt(this.addressWidth bits)).setName("int_pc_reg") init(0)
    val int_pc_valid = RegInit(False).setName("int_pc_valid")
    val fetch_state_next = U(0, 2 bits).setName("fetch_state_next")
    val fetch_state = RegNext(fetch_state_next).setName("fetch_state") init(0)

    val fetchFSM = new Area{
      def IDLE : UInt = 0
      def FETCH : UInt = 1
      def WAIT : UInt = 2
      switch(fetch_state){
        is(IDLE) {
          when(!fetch.arbitration.haltItself){
            fetch_state_next := FETCH
          }
        }
        is(FETCH) {
          when(icache_access.cmd.isStall){
            fetch_state_next := WAIT
          }
        }
        is(WAIT) {
          when(icache_access.cmd.fire){
            fetch_state_next := FETCH
          }
        }
      }

      // when icache is busy, interrupt is high, use reg store interrupt's pc
      when(fetch.output(INT_EN) & (fetch_state===WAIT || fetch_state_next===WAIT)){
        int_pc_valid := True
        int_pc_reg   := fetch.output(INT_PC)
      }
      .elsewhen(icache_access.rsp.fire){
        int_pc_valid := False
      }

      // pc_next used to fetch instruction
      when(fetch_state_next===FETCH){
        when(int_pc_valid){
          pc_next := int_pc_reg
        }
        .elsewhen(fetch.output(INT_EN)) {
          pc_next := fetch.output(INT_PC)
        } 
        .elsewhen(execute.output(REDIRECT_VALID)){
          pc_next := execute.output(REDIRECT_PC_NEXT)
        }
        .elsewhen(fetch.input(BPU_BRANCH_TAKEN)) {
          pc_next := fetch.input(BPU_PC_NEXT)
        } 
        .otherwise {
          pc_next := pc_next + 4
        }
      }

      when(fetch_state_next===FETCH){
        fetch_valid := True // TODO:
      }
    }

    // insert to stage
    fetch plug new Area{
      import fetch._
      insert(PC) := pc
      insert(PC_NEXT) := pc_next
      
    }

    // send cmd to icache
    if(icache_access != null) pipeline plug new Area{
      icache_access.cmd.valid := fetch_valid
      icache_access.cmd.addr := pc_next
    }


  }
}