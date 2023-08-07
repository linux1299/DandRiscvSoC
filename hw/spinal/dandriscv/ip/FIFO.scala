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

case class FIFO[T <: Data](dataType: T, DEPTH : Int = 4) extends Component{
  val ports = master(FIFO_ports(dataType))
  def PTR_WIDTH = log2Up(DEPTH)

  val read_ptr = Reg(UInt(PTR_WIDTH+1 bits)) init(0)
  val write_ptr= Reg(UInt(PTR_WIDTH+1 bits)) init(0)
  val read_addr = read_ptr(PTR_WIDTH-1 downto 0)
  val write_addr= write_ptr(PTR_WIDTH-1 downto 0)
  val fifo_empty = (read_ptr===write_ptr)
  val fifo_full = (read_addr===write_addr) && (read_ptr(PTR_WIDTH)=/=write_addr(PTR_WIDTH))
  val fifo_ram = Vec(dataType, DEPTH)

  when(ports.m_ports.fire){
    read_ptr := read_ptr + 1
  }
  when(ports.s_ports.fire){
    write_ptr := write_ptr + 1
    // fifo_ram(write_addr) := ports.s_ports.payload
  }

  ports.s_ports.ready := !fifo_full
  ports.m_ports.valid := !fifo_empty
}