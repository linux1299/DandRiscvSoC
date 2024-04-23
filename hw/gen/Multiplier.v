// Generator : SpinalHDL v1.8.1    git head : 2a7592004363e5b40ec43e1f122ed8641cd8965b
// Component : Multiplier
// Git hash  : a9cb3719cd82970e1dd9c2e2f5bb09b966f310fd

`timescale 1ns/1ps

module Multiplier (
  input               io_op_is_word,
  input               io_src1_is_signed,
  input               io_src2_is_signed,
  input      [63:0]   io_src1,
  input      [63:0]   io_src2,
  output     [63:0]   io_result_high,
  output     [63:0]   io_result_low
);

  wire       [63:0]   u_mult_o_hi_res;
  wire       [63:0]   u_mult_o_lw_res;

  mult u_mult (
    .i_mulw   (io_op_is_word        ), //i
    .i_x_sign (io_src1_is_signed    ), //i
    .i_y_sign (io_src2_is_signed    ), //i
    .i_x      (io_src1[63:0]        ), //i
    .i_y      (io_src2[63:0]        ), //i
    .o_hi_res (u_mult_o_hi_res[63:0]), //o
    .o_lw_res (u_mult_o_lw_res[63:0])  //o
  );
  assign io_result_high = u_mult_o_hi_res; // @ Mult.scala l45
  assign io_result_low = u_mult_o_lw_res; // @ Mult.scala l46

endmodule
