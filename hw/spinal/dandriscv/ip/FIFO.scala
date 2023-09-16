package dandriscv.ip

import dandriscv.plugin._
import dandriscv._
import spinal.core._
import spinal.lib._
import scala.math._


case class FIFO_ports[T <: Data](dataType: T) extends Bundle with IMasterSlave{
  val s_ports  = Stream(cloneOf(dataType))
  val m_ports = Stream(cloneOf(dataType))

  override def asMaster(): Unit = {
    master(m_ports)
    slave(s_ports)
  }
}

case class FIFO[T <: Data](dataType: T, DEPTH : Int = 2, READ_NEXT : Boolean = false) extends Component{
  val ports = master(FIFO_ports(dataType))
  val flush = in Bool()
  def PTR_WIDTH = log2Up(DEPTH)

  val read_ptr = Reg(UInt(PTR_WIDTH+1 bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH+1 bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-1 downto 0)
  val next_read_addr = read_addr + 1
  val write_addr= write_ptr(PTR_WIDTH-1 downto 0)
  val fifo_empty = (read_ptr===write_ptr)
  val fifo_full = (read_addr===write_addr) && (read_ptr(PTR_WIDTH)=/=write_ptr(PTR_WIDTH))
  val fifo_ram = Vec(Reg(dataType), DEPTH)
  // update pointer, write fifo
  when(flush){
    read_ptr := 0
  }
  .elsewhen(ports.m_ports.fire){
    read_ptr := read_ptr + 1
  }
  when(flush){
    write_ptr := 0
  }
  .elsewhen(ports.s_ports.fire){
    write_ptr := write_ptr + 1
    fifo_ram(write_addr) := ports.s_ports.payload
  }
  // output
  ports.s_ports.ready := !fifo_full
  ports.m_ports.valid := !fifo_empty
  ports.m_ports.payload := fifo_ram(read_addr)
  
  val next_payload = ifGen(READ_NEXT){out cloneOf(dataType)}
  val fifo_cnt = ifGen(READ_NEXT) {Reg(UInt(PTR_WIDTH+1 bits)) init(0)}
  val next_valid = ifGen(READ_NEXT){out Bool()}
  if(next_payload!=null){
    next_payload.setName("next_payload")
    next_payload := fifo_ram(next_read_addr)
    when(flush){
      fifo_cnt := 0
    }
    .elsewhen(ports.s_ports.fire && !ports.m_ports.fire){ //write
      fifo_cnt := fifo_cnt + 1
    }
    .elsewhen(!ports.s_ports.fire && ports.m_ports.fire){
      fifo_cnt := fifo_cnt - 1
    }
  }
  if(next_valid!=null){
    next_valid := (fifo_cnt >= U(2))
  }
  
  
}

object FIFO extends App {
  SpinalVerilog(FIFO(Bits(32 bits), 4, false))
}