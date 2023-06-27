package dandriscv.plugin_simple

import dandriscv._
import spinal.core._
import spinal.lib._

trait ICacheAccessService {
    def newICacheAccess() : ICacheAccess
}

case class ICacheAccess() extends Bundle {
  val cmd = Stream(DBusAccessCmd())
  val rsp = Flow(DBusAccessRsp())
}


case class ICache() extends Plugin[VexRiscv]{

  val flush = in Bool()
  val datain = in Bits(32 bits)
  val instruction = out Bits(32 bits)

  var icache_access : ICacheAccess = null
  icache_access = 

  instruction := datain


}