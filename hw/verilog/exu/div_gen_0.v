// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sun Dec 29 11:13:42 2024
// Host        : PC-LIN running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               d:/LinWork/ProgramSpace/ScalaProjects/DandRiscvSoC/vivado_prj/dand_soc_super/dand_soc_super.srcs/sources_1/ip/div_gen_0/div_gen_0_stub.v
// Design      : div_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a200tfbg484-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "div_gen_v5_1_16,Vivado 2019.2" *)
module div_gen_0(aclk, s_axis_divisor_tvalid, 
  s_axis_divisor_tdata, s_axis_dividend_tvalid, s_axis_dividend_tdata, 
  m_axis_dout_tvalid, m_axis_dout_tdata)
/* synthesis syn_black_box black_box_pad_pin="aclk,s_axis_divisor_tvalid,s_axis_divisor_tdata[63:0],s_axis_dividend_tvalid,s_axis_dividend_tdata[63:0],m_axis_dout_tvalid,m_axis_dout_tdata[127:0]" */;
  input aclk;
  input s_axis_divisor_tvalid;
  input [63:0]s_axis_divisor_tdata;
  input s_axis_dividend_tvalid;
  input [63:0]s_axis_dividend_tdata;
  output m_axis_dout_tvalid;
  output [127:0]m_axis_dout_tdata;

  // for sim
  reg [63:0] quotient [0:59];
  reg [63:0] remainder[0:59];
  reg [59:0] out_valid;
  genvar i;

  always @(posedge aclk) begin
    if(s_axis_divisor_tvalid && s_axis_dividend_tvalid) begin
      quotient[0]  <= (s_axis_divisor_tdata==64'h0) ? 64'hffffffffffffffff : (s_axis_dividend_tdata / s_axis_divisor_tdata);
      remainder[0] <= (s_axis_divisor_tdata==64'h0) ? s_axis_dividend_tdata : (s_axis_dividend_tdata % s_axis_divisor_tdata);
      out_valid[0] <= 1'b1;
    end
    else begin
      out_valid[0] <= 1'b0;
    end
  end

  generate
    for(i=1; i<60; i=i+1) begin
      always @(posedge aclk) begin
        quotient[i]  <= quotient[i-1];
        remainder[i] <= remainder[i-1];
        out_valid[i] <= out_valid[i-1];
      end
    end
  endgenerate

  // assign m_axis_dout_tdata[127:64] = quotient[59];
  // assign m_axis_dout_tdata[63:0]   = remainder[59];
  assign m_axis_dout_tdata[127:64] = quotient[0];
  assign m_axis_dout_tdata[63:0]   = remainder[0];
  assign m_axis_dout_tvalid        = out_valid[59];

endmodule