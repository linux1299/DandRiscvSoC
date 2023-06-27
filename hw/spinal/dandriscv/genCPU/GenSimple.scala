package dandriscv.genCPU

import dandriscv.plugin_simple._
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
        new ICachePlugin
      )
    )
  )

  SpinalVerilog(cpu())
}
