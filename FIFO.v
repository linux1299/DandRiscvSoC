// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : FIFO
// Git hash  : 928f07ebf13ad0d8e08ff2ac95aaf1122da7690e

`timescale 1ns/1ps

module FIFO (
  input               ports_s_ports_valid,
  output              ports_s_ports_ready,
  input      [31:0]   ports_s_ports_payload,
  output              ports_m_ports_valid,
  input               ports_m_ports_ready,
  output     [31:0]   ports_m_ports_payload,
  input               flush,
  input               clk,
  input               reset
);

  reg        [31:0]   _zz_ports_m_ports_payload;
  reg        [2:0]    read_ptr;
  reg        [2:0]    write_ptr;
  wire       [1:0]    read_addr;
  wire       [1:0]    next_read_addr;
  wire       [1:0]    write_addr;
  wire                fifo_empty;
  wire                fifo_full;
  reg        [31:0]   fifo_ram_0;
  reg        [31:0]   fifo_ram_1;
  reg        [31:0]   fifo_ram_2;
  reg        [31:0]   fifo_ram_3;
  wire                ports_m_ports_fire;
  wire       [3:0]    _zz_1;
  wire                ports_s_ports_fire;

  always @(*) begin
    case(read_addr)
      2'b00 : _zz_ports_m_ports_payload = fifo_ram_0;
      2'b01 : _zz_ports_m_ports_payload = fifo_ram_1;
      2'b10 : _zz_ports_m_ports_payload = fifo_ram_2;
      default : _zz_ports_m_ports_payload = fifo_ram_3;
    endcase
  end

  assign read_addr = read_ptr[1 : 0];
  assign next_read_addr = (read_addr + 2'b01);
  assign write_addr = write_ptr[1 : 0];
  assign fifo_empty = (read_ptr == write_ptr);
  assign fifo_full = ((read_addr == write_addr) && (read_ptr[2] != write_ptr[2]));
  assign ports_m_ports_fire = (ports_m_ports_valid && ports_m_ports_ready);
  assign _zz_1 = ({3'd0,1'b1} <<< write_addr);
  assign ports_s_ports_fire = (ports_s_ports_valid && ports_s_ports_ready);
  assign ports_s_ports_ready = (! fifo_full);
  assign ports_m_ports_valid = (! fifo_empty);
  assign ports_m_ports_payload = _zz_ports_m_ports_payload;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      read_ptr <= 3'b000;
      write_ptr <= 3'b000;
    end else begin
      if(flush) begin
        read_ptr <= 3'b000;
      end else begin
        if(ports_m_ports_fire) begin
          read_ptr <= (read_ptr + 3'b001);
        end
      end
      if(flush) begin
        write_ptr <= 3'b000;
      end else begin
        if(ports_s_ports_fire) begin
          write_ptr <= (write_ptr + 3'b001);
        end
      end
    end
  end

  always @(posedge clk) begin
    if(!flush) begin
      if(ports_s_ports_fire) begin
        if(_zz_1[0]) begin
          fifo_ram_0 <= ports_s_ports_payload;
        end
        if(_zz_1[1]) begin
          fifo_ram_1 <= ports_s_ports_payload;
        end
        if(_zz_1[2]) begin
          fifo_ram_2 <= ports_s_ports_payload;
        end
        if(_zz_1[3]) begin
          fifo_ram_3 <= ports_s_ports_payload;
        end
      end
    end
  end


endmodule
