package dandriscv.gencpu

import dandriscv.plugin_simple._
import dandriscv.ip._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}
import spinal.core._

object GenSimple extends App{
  def cpu() = new DandRiscvSimple(
    config = DandRiscvSimpleConfig(
      plugins = List(
        new FetchPlugin,
        new BPUPlugin(p = PredictorConfig(
          addressWidth =64, 
          RAS_ENTRIES = 4, 
          BTB_ENTRIES = 4, 
          PHT_ENTRIES = 128
        )),
        new DecodePlugin,
        new ALUPlugin,
        new ControlPlugin,
        new ExcepPlugin,
        new LSUPlugin(AW=64, DW=64),
        new ICachePlugin(config = ICacheConfig(
          cacheSize = 32*1024, // 32KB
          bytePerLine =64,
          wayCount = 4,
          addressWidth = 64,
          cpuDataWidth = 32,
          bankWidth = 32,
          busDataWidth = 256,
          directOutput = true
        )),
        new DCachePlugin(config = DCacheConfig(
          cacheSize = 32*1024, // 32KB
          bytePerLine =64,
          wayCount = 4,
          addressWidth = 64,
          cpuDataWidth = 64,
          bankWidth = 64,
          busDataWidth = 256,
          directOutput = true
        ))
      )
    )
  )

  SpinalVerilog(cpu())
}
