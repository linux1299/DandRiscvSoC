// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Divider
// Git hash  : a9cb3719cd82970e1dd9c2e2f5bb09b966f310fd

`timescale 1ns/1ps

module Divider (
  input               io_clk,
  input               io_rst_n,
  input               io_flush,
  input               io_start,
  output              io_busy,
  output              io_done_valid,
  input               io_done_ready,
  input               io_op_is_word,
  input               io_op_is_signed,
  input      [63:0]   io_dividend,
  input      [63:0]   io_divisor,
  output     [63:0]   io_quetient,
  output     [63:0]   io_remainder
);

  wire                u_div_o_busy;
  wire                u_div_o_end_valid;
  wire       [63:0]   u_div_o_quotient;
  wire       [63:0]   u_div_o_remainder;

  div u_div (
    .i_clk       (io_clk                 ), //i
    .i_rst_n     (io_rst_n               ), //i
    .i_flush     (io_flush               ), //i
    .i_start     (io_start               ), //i
    .o_busy      (u_div_o_busy           ), //o
    .o_end_valid (u_div_o_end_valid      ), //o
    .i_end_ready (io_done_ready          ), //i
    .i_divw      (io_op_is_word          ), //i
    .i_signed    (io_op_is_signed        ), //i
    .i_dividend  (io_dividend[63:0]      ), //i
    .i_divisor   (io_divisor[63:0]       ), //i
    .o_quotient  (u_div_o_quotient[63:0] ), //o
    .o_remainder (u_div_o_remainder[63:0])  //o
  );
  assign io_busy = u_div_o_busy; // @ Div.scala l51
  assign io_done_valid = u_div_o_end_valid; // @ Div.scala l52
  assign io_quetient = u_div_o_quotient; // @ Div.scala l57
  assign io_remainder = u_div_o_remainder; // @ Div.scala l58

endmodule
