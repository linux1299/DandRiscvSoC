package dandriscv.gencpu

import dandriscv.plugin._
import dandriscv.plugin_simple._
import dandriscv.plugin_simple
import dandriscv.{plugin, DandRiscv, DandRiscvConfig}
import spinal.core._

/**
 * Created by spinalvm on 15.06.17.
 */
object GenSmallest extends App{
  def cpu() = new DandRiscv(
    config = DandRiscvConfig(
      plugins = List(
        new PluginTest
      )
    )
  )

  SpinalVerilog(cpu())
}
