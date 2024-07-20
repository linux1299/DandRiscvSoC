package dandriscv.gencpu

import dandriscv.ip._
import dandriscv.super_scalar._
import spinal.core._


case class SuperScalar() extends Component {
  val icache_config = ICacheConfig(
    cacheSize = 32*1024, // 32KB
    bytePerLine = 64,
    wayCount = 4,
    addressWidth = 32,
    cpuDataWidth = 32,
    bankWidth = 32,
    busDataWidth = 64,
    directOutput = false,
    noBurst=true
  )
  val fetch = new Fetch(0x30000000, icache_config)
}