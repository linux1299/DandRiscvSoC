package dandriscv.plugin_simple

import dandriscv._
import dandriscv.plugin._
import spinal.core._
import spinal.lib._

object PluginTest{
  object RESULT_XOR extends Stageable(Bits(32 bits))
  object RESULT_AND extends Stageable(Bits(32 bits))
  object RESULT_SUB extends Stageable(UInt(32 bits))
  object RESULT_OUT extends Stageable(UInt(32 bits))
}


case class dBusClass() extends Bundle with IMasterSlave{
  val dataout = Bits(32 bits)
  val datain = Bits(32 bits)

  override def asMaster(): Unit = {
    out(dataout)
  }

  override def asSlave(): Unit = {
    in(datain)
  }
}

class PluginTest extends Plugin[DandRiscv]{
  import PluginTest._

  override def setup(pipeline: DandRiscv): Unit = {
    import Riscv._
    import pipeline.config._
  }
  
  override def build(pipeline: DandRiscv): Unit = {
    import pipeline._
    import pipeline.config._
    import spinal.lib.bus.amba4.axi

    val axiConfig = spinal.lib.bus.amba4.axi.Axi4Config(addressWidth=16, dataWidth=64, idWidth=4,
                                                        useId=false, useLast=false, useRegion=false, useBurst=false, useLock=false, useCache=false, useSize=false, useQos=false,
                                                        useLen=false, useResp=false, useProt=false, useStrb=false)
    //val dbus = master(spinal.lib.bus.amba4.axi.Axi4ReadOnly(axiConfig)).setName("dBus")
    //dbus.r.ready := False
    //dbus.ar.valid := False
    //dbus.ar.addr := U(32, 16 bits)

    val slaveBus = slave(dBusClass()).setName("slaveBus")
    val masterBus = master(dBusClass()).setName("masterBus")
    masterBus.dataout := B(222, 32 bits)

    stage_1 plug new Area{
      import stage_1._

      //insert(RESULT_XOR) := dbus.r.data(31 downto 0) ^ dbus.r.data(31 downto 0)
      insert(RESULT_XOR) := slaveBus.datain(31 downto 0) ^ slaveBus.datain(31 downto 0)
      //input(RESULT_XOR) := slaveBus.datain(31 downto 0) ^ slaveBus.datain(31 downto 0)
      }

      stage_2 plug new Area{
        import stage_2._
      
        insert(RESULT_AND) := input(RESULT_XOR) & input(RESULT_XOR)
      }
    
      stage_3 plug new Area{
        import stage_3._
      
        insert(RESULT_SUB) := input(RESULT_AND).asUInt - input(RESULT_AND).asUInt
      }
    
  }
}