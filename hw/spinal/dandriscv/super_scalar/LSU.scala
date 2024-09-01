package dandriscv.super_scalar

import spinal.core._
import spinal.lib._
import math._
import dandriscv.Riscv._

case class LSU(AW:Int=32, DW:Int=64) extends Component {
  import CpuConfig._
  import LsuCtrlEnum._
  import CSR._

  // =================== IO ===================
  val flush = in Bool()
  val stall = in Bool()
  val src_ports = slave(Stream(LsuSrc()))
  val dst_ports = master(Stream(LsuDst()))
  val dcache_ports = master(DCacheAccess(AW, DW))
  val timer_cen = out Bool()
  val timer_wen = out Bool()
  val timer_addr= out UInt(AW bits)
  val timer_wdata = out Bits(64 bits)

  // =========== stream control ================
  val src_stream = src_ports.haltWhen(stall).throwWhen(flush)
  val dst_stream = Stream(LsuDst())
  val dcache_cmd_stream = Stream(DCacheAccessCmd(AW, DW))

  // =================== stage 0 logic ===================
  val src1 = src_ports.src1
  val src2 = src_ports.src2
  val imm  = src_ports.imm
  val micro_op = src_ports.micro_op

  val lsu_cen = micro_op.lsu_is_load || micro_op.lsu_is_store
  val lsu_addr = src1.asUInt + imm.asUInt
  val lsu_addr_offset = lsu_addr(2 downto 0)
  val lsu_addr_is_timer = (lsu_addr===MTIME) || (lsu_addr===MTIMECMP)
  val lsu_wdata= src2
  val lsu_wdata_byte = B((64-8-1 downto 0) -> lsu_wdata(7)) ## lsu_wdata(7 downto 0)
  val lsu_wdata_half = B((64-16-1 downto 0) -> lsu_wdata(15)) ## lsu_wdata(15 downto 0)
  val lsu_wdata_word = B((64-32-1 downto 0) -> lsu_wdata(31)) ## lsu_wdata(31 downto 0)
  val lsu_rdata = Bits(64 bits)

  val dcache_cen   = !lsu_addr_is_timer && lsu_cen
  val dcache_addr  = lsu_addr.resized
  val dcache_wdata = Bits(64 bits)
  val dcache_wstrb = Bits(64/8 bits)
  val dcache_wen   = micro_op.lsu_is_store
  val dcache_size  = UInt(3 bits)
  val dcache_rdata = dcache_ports.rsp.data |>> (lsu_addr_offset << 3) // TODO:
  val dcache_rdata_lb   = B((XLEN-8-1 downto 0) -> dcache_rdata(7)) ## dcache_rdata(7 downto 0)
  val dcache_rdata_lbu  = B((XLEN-8-1 downto 0) -> False) ## dcache_rdata(7 downto 0)
  val dcache_rdata_lh   = B((XLEN-16-1 downto 0) -> dcache_rdata(15)) ## dcache_rdata(15 downto 0)
  val dcache_rdata_lhu  = B((XLEN-16-1 downto 0) -> False) ## dcache_rdata(15 downto 0)
  val dcache_rdata_lw   = B((XLEN-32-1 downto 0) -> dcache_rdata(31)) ## dcache_rdata(31 downto 0)
  val dcache_rdata_lwu  = B((XLEN-32-1 downto 0) -> False) ## dcache_rdata(31 downto 0)

  switch(micro_op.lsu_ctrl_op){
    is(LB){
      lsu_rdata := dcache_rdata_lb
      dcache_size := U(0)
    }
    is(LBU){
      lsu_rdata := dcache_rdata_lbu
      dcache_size := U(0)
    }
    is(LH){
      lsu_rdata := dcache_rdata_lh
      dcache_size := U(1)
    }
    is(LHU){
      lsu_rdata := dcache_rdata_lhu
      dcache_size := U(1)
    }
    is(LW){
      lsu_rdata := dcache_rdata_lw
      dcache_size := U(2)
    }
    is(LWU){
      lsu_rdata := dcache_rdata_lwu
      dcache_size := U(2)
    }
    is(LD){
      lsu_rdata := dcache_rdata
      dcache_size := U(3)
    }
    default{
      lsu_rdata := B(0, XLEN bits)
      dcache_size := U(0)
    }
  }

  switch(micro_op.lsu_ctrl_op){
    is(SB){
      dcache_wdata := lsu_wdata_byte
      dcache_wstrb := B(dcache_wstrb.getWidth bits, 0->true, default -> false)
    }
    is(SH){
      dcache_wdata := lsu_wdata_half
      dcache_wstrb := B(dcache_wstrb.getWidth bits, (1 downto 0)->true, default -> false)
    }
    is(SW){
      dcache_wdata := lsu_wdata_word
      dcache_wstrb := B(dcache_wstrb.getWidth bits, (3 downto 0)->true, default -> false)
    }
    is(SD){
      dcache_wdata := lsu_wdata
      dcache_wstrb := B(dcache_wstrb.getWidth bits, (7 downto 0)->true)
    }
    default{
      dcache_wdata := B(0, XLEN bits)
      dcache_wstrb := B(dcache_wstrb.getWidth bits, default -> false)
    }
  }

  // =================== stage 1 access dcache ===================
  dcache_cmd_stream.valid := src_stream.valid
  dcache_cmd_stream.addr  := dcache_addr
  dcache_cmd_stream.wen   := dcache_wen
  dcache_cmd_stream.wdata := dcache_wdata
  dcache_cmd_stream.wstrb := dcache_wstrb
  dcache_cmd_stream.size  := dcache_size
  dcache_cmd_stream >-> dcache_ports.cmd

  // =========== output ================
  src_stream.ready := dcache_cmd_stream.ready
  dst_stream.valid := dcache_ports.rsp.valid
  dst_stream.result := lsu_rdata
  dst_stream.rd_wen := src_ports.micro_op.rd_wen
  dst_stream.rd_rob_ptr := src_ports.rd_rob_ptr
  dst_stream >> dst_ports

  // =========== timer ================
  timer_cen := lsu_addr_is_timer && lsu_cen
  timer_wen := micro_op.lsu_is_store
  timer_addr:= dcache_addr
  timer_wdata := dcache_wdata
}

object GenLSU extends App {
  GenConfig.spinal.generateVerilog(LSU(64, 64))
}