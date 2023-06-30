package dandriscv.genCPU

import dandriscv.plugin_simple._
import dandriscv.{plugin_simple, DandRiscvSimple, DandRiscvSimpleConfig}
import spinal.core._
import dandriscv.ip._

/**
 * Created by spinalvm on 15.06.17.
 */
object GenSimple extends App{
  def cpu() = new DandRiscvSimple(
    config = DandRiscvSimpleConfig(
      plugins = List(
        new InstructionFetchPlugin,
        new ICachePlugin(config = ICacheConfig(
          cacheSize = 4096,
          bytePerLine =64,
          wayCount = 2,
          addressWidth = 64,
          cpuDataWidth = 32,
          bankWidth = 256,
          busDataWidth = 256
          )
        )
      )
    )
  )

  SpinalVerilog(cpu())
}
