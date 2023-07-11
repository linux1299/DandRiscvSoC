package dandriscv.gencpu

import dandriscv.plugin_simple._
import dandriscv.ip._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}
import spinal.core._

/**
 * Created by spinalvm on 15.06.17.
 */
object GenSimple extends App{
  def cpu() = new DandRiscvSimple(
    config = DandRiscvSimpleConfig(
      plugins = List(
        new InstructionFetchPlugin,
        new BPUPlugin,
        new DecodePlugin,
        new ALUPlugin,
        new ControlPlugin,
        new LsuPlugin(AW=64, DW=64),
        new ICachePlugin(config = ICacheConfig(
          cacheSize = 4096,
          bytePerLine =64,
          wayCount = 4,
          addressWidth = 64,
          cpuDataWidth = 32,
          bankWidth = 256,
          busDataWidth = 256
        )),
        new DCachePlugin(config = DCacheConfig(
          cacheSize = 4096,
          bytePerLine =64,
          wayCount = 4,
          addressWidth = 64,
          cpuDataWidth = 64,
          bankWidth = 256,
          busDataWidth = 256
        ))
      )
    )
  )

  SpinalVerilog(cpu())
}
