package dandriscv.gencpu

import dandriscv.plugin_simple._
import dandriscv.ip._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}
import spinal.core._

object GenSimple extends App{
  def cpu() = new DandRiscvSimple(
    config = DandRiscvSimpleConfig(
      plugins = List(
        new FetchPlugin(addressWidth=32),
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
        new LSUPlugin(AW=32, DW=64),
        new ICachePlugin(config = ICacheConfig(
          cacheSize = 32*1024, // 32KB
          // cacheSize = 1*1024, // 1KB
          bytePerLine =64,
          wayCount = 4,
          // addressWidth = 64,
          addressWidth = 32,
          cpuDataWidth = 32,
          bankWidth = 32,
          busDataWidth = 64,
          directOutput = false,
          noBurst=true
        )),
        new DCachePlugin(config = DCacheConfig(
          // cacheSize = 32*1024, // 32KB
          // cacheSize = 1*1024, // 1KB
          cacheSize = 512, // 512B
          bytePerLine =64,
          wayCount = 2,
          // addressWidth = 64,
          addressWidth = 32,
          cpuDataWidth = 64,
          bankWidth = 64,
          busDataWidth = 64,
          directOutput = false,
          // noBurst=false
          noBurst=true
        ))
      )
    )
  )

  SpinalVerilog(cpu())
}
