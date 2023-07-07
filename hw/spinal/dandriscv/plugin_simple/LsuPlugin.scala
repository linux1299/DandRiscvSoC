package dandriscv.plugin_simple

import spinal.core._
import spinal.lib._

import dandriscv._
import dandriscv.ip._
import dandriscv.plugin._
import dandriscv.plugin_simple._

// ==================== mem stage ======================
class LsuPlugin(AW : Int = 64, DW : Int = 64) extends Plugin[DandRiscvSimple]
//with NextLevelDataService
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
      //val is_load     = Bool()

      val mem_wdata = input(MEM_WDATA)
      val wdata_sb  = B((XLEN-8-1 downto 0) -> mem_wdata(7)) ## mem_wdata(7 downto 0)
      val wdata_sh  = B((XLEN-16-1 downto 0) -> mem_wdata(15)) ## mem_wdata(15 downto 0)
      val wdata_sw  = B((XLEN-32-1 downto 0) -> mem_wdata(31)) ## mem_wdata(31 downto 0)

      val wen_dcache  = Bool()
      val addr_dcache = input(ALU_RESULT).asUInt
      val wdata_dcache= Bits(XLEN bits)
      val wstrb_dcache= Bits(XLEN/8 bits)
      val size_dcache = UInt(3 bits)

      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.LB.asBits){
          data_load := data_lb
          //is_load   := True
        }
        is(MemCtrlEnum.LBU.asBits){
          data_load := data_lbu
          //is_load   := True
        }
        is(MemCtrlEnum.LH.asBits){
          data_load := data_lh
          //is_load   := True
        }
        is(MemCtrlEnum.LHU.asBits){
          data_load := data_lhu
          //is_load   := True
        }
        is(MemCtrlEnum.LW.asBits){
          data_load := data_lw
          //is_load   := True
        }
        is(MemCtrlEnum.LWU.asBits){
          data_load := data_lwu
          //is_load   := True
        }
        default{
          data_load := B(0, XLEN bits)
          //is_load   := False
        }
      }

      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.SB.asBits){
          wen_dcache   := True
          wdata_dcache := wdata_sb
          wstrb_dcache := B(wstrb_dcache.getWidth bits, 0->true, default -> false)
          size_dcache  := U(0, 3 bits)
        }
        is(MemCtrlEnum.SH.asBits){
          wen_dcache   := True
          wdata_dcache := wdata_sh
          wstrb_dcache := B(wstrb_dcache.getWidth bits, (1 downto 0)->true, default -> false)
          size_dcache  := U(1, 3 bits)
        }
        is(MemCtrlEnum.SW.asBits){
          wen_dcache   := True
          wdata_dcache := wdata_sw
          wstrb_dcache := B(wstrb_dcache.getWidth bits, (3 downto 0)->true, default -> false)
          size_dcache  := U(2, 3 bits)
        }
        is(MemCtrlEnum.SD.asBits){
          wen_dcache   := True
          wdata_dcache := mem_wdata
          wstrb_dcache := B(wstrb_dcache.getWidth bits, (7 downto 0)->true)
          size_dcache  := U(3, 3 bits)
        }
        default{
          wen_dcache   := False
          wdata_dcache := B(0, XLEN bits)
          wstrb_dcache := B(wstrb_dcache.getWidth bits, default -> false)
          size_dcache  := U(0, 3 bits)
        }
      }

      // output mem stage
      insert(DATA_LOAD) := data_load
      //insert(IS_LOAD)   := is_load
      dcache_access.cmd.payload.addr := addr_dcache
      dcache_access.cmd.payload.wen  := wen_dcache
      dcache_access.cmd.payload.wdata:= wdata_dcache
      dcache_access.cmd.payload.wstrb:= wstrb_dcache
      dcache_access.cmd.payload.size := size_dcache
      
    }

    writebackStage plug new Area{
      import writebackStage._
      insert(RD) := input(IS_LOAD) ? input(DATA_LOAD) | input(ALU_RESULT)
    }
}
}