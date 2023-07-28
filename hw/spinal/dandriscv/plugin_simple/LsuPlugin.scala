package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._
import dandriscv.Riscv.CSR._

// ==================== mem stage ======================
class LSUPlugin(AW : Int = 64, DW : Int = 64) extends Plugin[DandRiscvSimple]
with DCacheAccessService
{

  @dontName var dcache_access : DCacheAccess = null
  override def newDCacheAccess(): DCacheAccess = {
    assert(dcache_access == null)
    dcache_access = DCacheAccess(AW, DW)
    dcache_access
  }

  override def setup(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline.config._

  }

  override def build(pipeline: DandRiscvSimple): Unit = {
    import Riscv._
    import pipeline._
    import pipeline.config._


    memaccess plug new Area{
      import memaccess._

      val data_dcache = dcache_access.rsp.payload.data
      val data_lb     = B((XLEN-8-1 downto 0) -> data_dcache(7)) ## data_dcache(7 downto 0)
      val data_lbu    = B((XLEN-8-1 downto 0) -> False) ## data_dcache(7 downto 0)
      val data_lh     = B((XLEN-16-1 downto 0) -> data_dcache(15)) ## data_dcache(15 downto 0)
      val data_lhu    = B((XLEN-16-1 downto 0) -> False) ## data_dcache(15 downto 0)
      val data_lw     = B((XLEN-32-1 downto 0) -> data_dcache(31)) ## data_dcache(31 downto 0)
      val data_lwu    = B((XLEN-32-1 downto 0) -> False) ## data_dcache(31 downto 0)
      val data_load   = Bits(XLEN bits)

      val mem_wdata = input(MEM_WDATA)
      val wdata_sb  = B((XLEN-8-1 downto 0) -> mem_wdata(7)) ## mem_wdata(7 downto 0)
      val wdata_sh  = B((XLEN-16-1 downto 0) -> mem_wdata(15)) ## mem_wdata(15 downto 0)
      val wdata_sw  = B((XLEN-32-1 downto 0) -> mem_wdata(31)) ## mem_wdata(31 downto 0)

      val addr      = input(ALU_RESULT).asUInt
      val wdata     = Bits(XLEN bits)
      val wstrb     = Bits(XLEN/8 bits)
      val size      = UInt(3 bits)
      val wen       = input(IS_STORE)
      val is_mem    = input(IS_LOAD) || input(IS_STORE)
      val is_timer  = (addr===MTIME) || (addr===MTIMECMP)
      val hold      = Bool()

      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.LB.asBits){
          data_load := data_lb
        }
        is(MemCtrlEnum.LBU.asBits){
          data_load := data_lbu
        }
        is(MemCtrlEnum.LH.asBits){
          data_load := data_lh
        }
        is(MemCtrlEnum.LHU.asBits){
          data_load := data_lhu
        }
        is(MemCtrlEnum.LW.asBits){
          data_load := data_lw
        }
        is(MemCtrlEnum.LWU.asBits){
          data_load := data_lwu
        }
        default{
          data_load := B(0, XLEN bits)
        }
      }

      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.SB.asBits){
          wdata := wdata_sb
          wstrb := B(wstrb.getWidth bits, 0->true, default -> false)
          size  := U(0, 3 bits)
        }
        is(MemCtrlEnum.SH.asBits){
          wdata := wdata_sh
          wstrb := B(wstrb.getWidth bits, (1 downto 0)->true, default -> false)
          size  := U(1, 3 bits)
        }
        is(MemCtrlEnum.SW.asBits){
          wdata := wdata_sw
          wstrb := B(wstrb.getWidth bits, (3 downto 0)->true, default -> false)
          size  := U(2, 3 bits)
        }
        is(MemCtrlEnum.SD.asBits){
          wdata := mem_wdata
          wstrb := B(wstrb.getWidth bits, (7 downto 0)->true)
          size  := U(3, 3 bits)
        }
        default{
          wdata := B(0, XLEN bits)
          wstrb := B(wstrb.getWidth bits, default -> false)
          size  := U(0, 3 bits)
        }
      }

      // output mem stage
      insert(DATA_LOAD):= data_load
      insert(LSU_WDATA):= wdata
      insert(TIMER_CEN):= is_timer && is_mem && arbitration.isFiring
      insert(LSU_HOLD) := hold
         
      // connect to dcache
      dcache_access.cmd.valid        := !is_timer && is_mem
      dcache_access.cmd.payload.addr := addr
      dcache_access.cmd.payload.wen  := wen
      dcache_access.cmd.payload.wdata:= wdata
      dcache_access.cmd.payload.wstrb:= wstrb
      dcache_access.cmd.payload.size := size
      hold := !dcache_access.cmd.ready
    }

    writebackStage plug new Area{
      import writebackStage._
      insert(RD) := input(IS_LOAD) ? input(DATA_LOAD) | input(ALU_RESULT)
    }
}
}