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

      val cpu_addr  = input(ALU_RESULT).asUInt
      val cpu_addr_offset = cpu_addr(2 downto 0)
      val is_mem    = input(IS_LOAD) || input(IS_STORE)
      val is_timer  = (cpu_addr===MTIME) || (cpu_addr===MTIMECMP)

      val dcache_rdata = dcache_access.rsp.payload.data |>> (cpu_addr_offset << 3)
      val dcache_lb   = B((XLEN-8-1 downto 0) -> dcache_rdata(7)) ## dcache_rdata(7 downto 0)
      val dcache_lbu  = B((XLEN-8-1 downto 0) -> False) ## dcache_rdata(7 downto 0)
      val dcache_lh   = B((XLEN-16-1 downto 0) -> dcache_rdata(15)) ## dcache_rdata(15 downto 0)
      val dcache_lhu  = B((XLEN-16-1 downto 0) -> False) ## dcache_rdata(15 downto 0)
      val dcache_lw   = B((XLEN-32-1 downto 0) -> dcache_rdata(31)) ## dcache_rdata(31 downto 0)
      val dcache_lwu  = B((XLEN-32-1 downto 0) -> False) ## dcache_rdata(31 downto 0)
      val dcache_data_load = Bits(XLEN bits)

      val mem_wdata = input(MEM_WDATA)
      val dcache_sb = B((XLEN-8-1 downto 0) -> mem_wdata(7)) ## mem_wdata(7 downto 0)
      val dcache_sh = B((XLEN-16-1 downto 0) -> mem_wdata(15)) ## mem_wdata(15 downto 0)
      val dcache_sw = B((XLEN-32-1 downto 0) -> mem_wdata(31)) ## mem_wdata(31 downto 0)
      val dcache_wdata = Bits(XLEN bits)
      val dcache_wstrb = Bits(XLEN/8 bits)
      val dcache_wen   = input(IS_STORE)
      
      val lsu_ready = RegInit(True)
      val lsu_addr  = UInt(XLEN bits)
      val lsu_rdata = Bits(XLEN bits)
      val lsu_wdata = Bits(XLEN bits)
      val lsu_wen   = Bool()
      val lsu_wstrb = Bits(XLEN/8 bits)
      
      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.LB.asBits){
          dcache_data_load := dcache_lb
        }
        is(MemCtrlEnum.LBU.asBits){
          dcache_data_load := dcache_lbu
        }
        is(MemCtrlEnum.LH.asBits){
          dcache_data_load := dcache_lh
        }
        is(MemCtrlEnum.LHU.asBits){
          dcache_data_load := dcache_lhu
        }
        is(MemCtrlEnum.LW.asBits){
          dcache_data_load := dcache_lw
        }
        is(MemCtrlEnum.LWU.asBits){
          dcache_data_load := dcache_lwu
        }
        is(MemCtrlEnum.LD.asBits){
          dcache_data_load := dcache_rdata
        }
        default{
          dcache_data_load := B(0, XLEN bits)
        }
      }

      switch(input(MEM_CTRL)){
        is(MemCtrlEnum.SB.asBits){
          dcache_wdata := dcache_sb
          dcache_wstrb := B(dcache_wstrb.getWidth bits, 0->true, default -> false)
        }
        is(MemCtrlEnum.SH.asBits){
          dcache_wdata := dcache_sh
          dcache_wstrb := B(dcache_wstrb.getWidth bits, (1 downto 0)->true, default -> false)
        }
        is(MemCtrlEnum.SW.asBits){
          dcache_wdata := dcache_sw
          dcache_wstrb := B(dcache_wstrb.getWidth bits, (3 downto 0)->true, default -> false)
        }
        is(MemCtrlEnum.SD.asBits){
          dcache_wdata := mem_wdata
          dcache_wstrb := B(dcache_wstrb.getWidth bits, (7 downto 0)->true)
        }
        default{
          dcache_wdata := B(0, XLEN bits)
          dcache_wstrb := B(dcache_wstrb.getWidth bits, default -> false)
        }
      }

      // for unalign mem access
      // val lsu_aligned = cpu_addr(2 downto 0)===U"3'd0" // 8 byte align
      // val lsu_addr_end = UInt(4 bits)
      // val lsu_crossover = cpu_addr(3) // LSU req cross over 8 byte boundry
      // val lsu_len = lsu_aligned ? U(0, 8 bits) | (U(0, 7 bits) ## lsu_crossover).asUInt
      // val lsu_addr_align = cpu_addr(63 downto 3) ## U(0, 3 bits)
      // val lsu_offset_align_low = ((U(0, 3 bits) ## cpu_addr(2 downto 0)) |<< 3).asUInt
      // val lsu_offset_align_high= UInt(6 bits)
      // val lsu_full_mask = Bits(128 bits)
      // val lsu_full_strb = Bits(16 bits)
      // lsu_offset_align_high := U(64, 7 bits) - lsu_offset_align_low
      lsu_rdata := dcache_data_load  //TODO:need add unalign access
      lsu_wdata := dcache_wdata |<< (cpu_addr_offset << 3)//TODO:need add unalign access
      lsu_addr  := cpu_addr //TODO:need add unalign access
      lsu_wen   := dcache_wen
      lsu_wstrb := dcache_wstrb |<< cpu_addr_offset

      // output mem stage
      insert(LSU_RDATA):= lsu_rdata
      insert(LSU_WDATA):= lsu_wdata
      insert(TIMER_CEN):= is_timer && is_mem && arbitration.isFiring
      insert(LSU_HOLD) := !dcache_access.cmd.ready
         
      // connect to dcache
      dcache_access.cmd.valid        := !is_timer && is_mem && arbitration.isValid
      dcache_access.cmd.payload.addr := lsu_addr
      dcache_access.cmd.payload.wen  := lsu_wen
      dcache_access.cmd.payload.wdata:= lsu_wdata
      dcache_access.cmd.payload.wstrb:= lsu_wstrb
    }

    writebackStage plug new Area{
      import writebackStage._
      insert(RD) := input(IS_LOAD) ? input(LSU_RDATA) | input(ALU_RESULT)

      // for test:
      output(PC) := input(PC)
      output(INSTRUCTION) := input(INSTRUCTION)
    }
}
}