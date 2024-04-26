module mult #(
  parameter W = 64          // width should not be changed, only support 64 now.
)(
  input             i_mulw  ,
  input             i_x_sign,
  input             i_y_sign,
  input 	[W-1:0]   i_x     ,
  input 	[W-1:0]   i_y     ,
  output 	[W-1:0]   o_hi_res,
  output 	[W-1:0]   o_lw_res
);

  localparam EXTEN_W = W + 2 ; // 2 for signed extension, 66 totally.
  localparam PSUM_W = EXTEN_W*2;
  localparam PSUM_N = EXTEN_W/2;

  logic	[EXTEN_W-1:0] x, y;

  assign x = i_mulw ? {{(2+W/2){i_x[W/2-1]}}, i_x[W/2-1:0]} : {i_x_sign ? {2{i_x[W-1]}} : 2'b0, i_x[W-1:0]};
  assign y = i_mulw ? {{(2+W/2){i_y[W/2-1]}}, i_y[W/2-1:0]} : {i_y_sign ? {2{i_y[W-1]}} : 2'b0, i_y[W-1:0]};

  // 1. generate partial product://///////////////////////////////////////////////////////////
  logic  [PSUM_W-1:0] psum [PSUM_N-1:0];

  booth #(
    .INXY_W(EXTEN_W),
    .PSUM_W(PSUM_W),
    .PSUM_N(PSUM_N)
  ) u_booth (
    .x   (x   ),
    .y   (y   ),
    .psum(psum)
  );

  // 2. use wallace tree to generate result://////////////////////////////////////////////////
  wire [PSUM_W-1:0] tree_out [1:0];
  wallace_tree_33 #(PSUM_W) wallace_tree (.in(psum),.out(tree_out));

  // 3. full connect adder://///////////////////////////////////////////////////////////////////
  logic [PSUM_W-1:0] res;
  logic carry;

  rca_nbit #(
    .N (PSUM_W)
  ) u_rca_nbit(
    .i_a (tree_out[1]),
    .i_b (tree_out[0]),
    .i_c (1'b0       ),
    .o_s (res        ),
    .o_c (carry      ));

  assign {o_hi_res, o_lw_res} = res[2*W-1:0];

endmodule
module booth_1bit #(parameter WIDTH=32) (
  input   [WIDTH-1:0] x,
  input   [      2:0] s,
  output  [  WIDTH:0] psum, // partil sum.
  output              clow  // carray low bit.
);

  wire y_add,y,y_sub; // y+1,y,y-1
  wire sel_negative,sel_double_negative,sel_positive,sel_double_positive;

  assign {y_add,y,y_sub} = s;

  assign sel_negative =  y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_positive = ~y_add & (y & ~y_sub | ~y & y_sub);
  assign sel_double_negative =  y_add & ~y & ~y_sub;
  assign sel_double_positive = ~y_add &  y &  y_sub;

  assign psum = sel_double_negative ? ~{x, 1'b0} : 
            (sel_double_positive ?  {x, 1'b0} :
            (sel_negative ? ~{x[WIDTH-1],x} :
            (sel_positive ?  {x[WIDTH-1],x} : {(WIDTH+1){1'b0}})));

  assign clow = sel_double_negative | sel_negative;

endmodule
module booth #(
  parameter INXY_W = 66 ,
  parameter PSUM_W = INXY_W*2,
  parameter PSUM_N = INXY_W/2
)(
  input  [INXY_W-1:0] x,
  input  [INXY_W-1:0] y,
  output [PSUM_W-1:0] psum [PSUM_N-1:0] // partial sum with shift and sign extension
);

  logic [INXY_W:0] psum_raw [PSUM_N-1:0];
  logic            clow_raw [PSUM_N-1:0];

  booth_1bit #(.WIDTH (INXY_W)) B_0(.x (x),.s ({y[1:0], 1'b0}),.psum (psum_raw[0]), .clow(clow_raw[0]));
  assign psum[0] = {{(INXY_W-1){psum_raw[0][INXY_W]}}, psum_raw[0]};  // 65bit sign extension + 67bit psum_raw.
  for(genvar i=1; i<PSUM_N; i=i+1) begin: gen_shift_partial_sum
    booth_1bit #(.WIDTH (INXY_W)) B_(.x (x),.s (y[2*i+1 : 2*i-1]),.psum (psum_raw[i]), .clow(clow_raw[i]));
    assign psum[i] = {{(INXY_W-1-2*i){psum_raw[i][INXY_W]}}, psum_raw[i], 1'b0, clow_raw[i-1], {(2*i-2){1'b0}}};
  end

endmodule
module csa_nbit#(
  parameter N = 64
)(
  input  [N-1:0] i_a, 
  input  [N-1:0] i_b, 
  input  [N-1:0] i_c, 
  output [N-1:0] o_s, 
  output [N-1:0] o_c
);

  wire [N-1:0] p;
  wire [N-1:0] g;

  genvar i;
  generate
    for(i=0; i<N; i=i+1)begin:csa
      assign g[i] = i_a[i] & i_b[i];
      assign p[i] = i_a[i] ^ i_b[i];
      assign o_s[i] = p[i] ^ i_c[i];
      assign o_c[i] = i_c[i] & p[i] | g[i] ;
    end
  endgenerate

endmodule
module rca_nbit#(
  parameter N = 64
)(
  input  [N-1:0] i_a, 
  input  [N-1:0] i_b, 
  input          i_c, 
  output [N-1:0] o_s, 
  output         o_c
);

  wire [N-1:0] p;
  wire [N-1:0] g;
  // verilator lint_off UNOPTFLAT
  wire [N:0] c;
  // verilator lint_on UNOPTFLAT

  for(genvar i=0; i<N; i=i+1)begin:csa
    assign g[i]   = i_a[i] & i_b[i];
    assign p[i]   = i_a[i] ^ i_b[i];
    assign c[i+1] = c[i] & p[i] | g[i];
    assign o_s[i] = p[i] ^ c[i];
  end

  assign c[0] = i_c;
  assign o_c = c[N];

endmodule
module wallace_tree_33 #(
  parameter WIDTH=132
) (
  input  [WIDTH-1:0] in [32:0],
  output [WIDTH-1:0] out[1:0]
);

  wire  [WIDTH-1:0] s_row1[11:0];
  wire  [WIDTH-1:0] c_row1[11:0];
  wire  [WIDTH-1:0] c_row1_shift[11:0];

  wire  [WIDTH-1:0] s_row2[6:0];
  wire  [WIDTH-1:0] c_row2[6:0];
  wire  [WIDTH-1:0] c_row2_shift[6:0];
  
  wire  [WIDTH-1:0] s_row3[4:0];
  wire  [WIDTH-1:0] c_row3[4:0];
  wire  [WIDTH-1:0] c_row3_shift[4:0];

  wire  [WIDTH-1:0] s_row4[2:0];
  wire  [WIDTH-1:0] c_row4[2:0];
  wire  [WIDTH-1:0] c_row4_shift[2:0];

  wire  [WIDTH-1:0] s_row5[1:0];
  wire  [WIDTH-1:0] c_row5[1:0];
  wire  [WIDTH-1:0] c_row5_shift[1:0];

  wire  [WIDTH-1:0] s_row6, c_row6, c_row6_shift;
  wire  [WIDTH-1:0] s_row7, c_row7, c_row7_shift;
  wire  [WIDTH-1:0] s_row8, c_row8, c_row8_shift;

  // 1. first level, 11 csa, 33p -> 22p://////////////////////////////////////////////////////////////
  for(genvar i=0; i<11; i=i+1)begin: csa_row1
    csa_nbit #(.N(WIDTH)) csa_row1  (in[3*i] , in[3*i+1] , in[3*i+2] , s_row1[i], c_row1[i]);
    assign c_row1_shift[i] = {c_row1[i][WIDTH-2:0], 1'b0};
  end

  // 2. second level, 7 csa, 22p -> 15p (2*7+1):///////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row2_0  (s_row1[0]      , c_row1_shift[0],  s_row1[1]      ,  s_row2[0], c_row2[0]);
  csa_nbit #(.N(WIDTH)) csa_row2_1  (c_row1_shift[1], s_row1[2]      ,  c_row1_shift[2],  s_row2[1], c_row2[1]);
  csa_nbit #(.N(WIDTH)) csa_row2_2  (s_row1[3]      , c_row1_shift[3],  s_row1[4]      ,  s_row2[2], c_row2[2]);
  csa_nbit #(.N(WIDTH)) csa_row2_3  (c_row1_shift[4], s_row1[5]      ,  c_row1_shift[5],  s_row2[3], c_row2[3]);
  csa_nbit #(.N(WIDTH)) csa_row2_4  (s_row1[6]      , c_row1_shift[6],  s_row1[7]      ,  s_row2[4], c_row2[4]);
  csa_nbit #(.N(WIDTH)) csa_row2_5  (c_row1_shift[7], s_row1[8]      ,  c_row1_shift[8],  s_row2[5], c_row2[5]);
  csa_nbit #(.N(WIDTH)) csa_row2_6  (s_row1[9]      , c_row1_shift[9],  s_row1[10]     ,  s_row2[6], c_row2[6]);
  for(genvar i=0; i<7; i=i+1)begin: csa_row2_shift
    assign c_row2_shift[i] = {c_row2[i][WIDTH-2:0], 1'b0};
  end

  // 3. third level, 5 csa, 15p -> 10p: ///////////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row3_0  (c_row1_shift[10], s_row2[0]      , c_row2_shift[0], s_row3[0], c_row3[0]);
  csa_nbit #(.N(WIDTH)) csa_row3_1  (s_row2[1]       , c_row2_shift[1], s_row2[2]      , s_row3[1], c_row3[1]);
  csa_nbit #(.N(WIDTH)) csa_row3_2  (c_row2_shift[2] , s_row2[3]      , c_row2_shift[3], s_row3[2], c_row3[2]);
  csa_nbit #(.N(WIDTH)) csa_row3_3  (s_row2[4]       , c_row2_shift[4], s_row2[5]      , s_row3[3], c_row3[3]);
  csa_nbit #(.N(WIDTH)) csa_row3_4  (c_row2_shift[5] , s_row2[6]      , c_row2_shift[6], s_row3[4], c_row3[4]);
  for(genvar i=0; i<5; i=i+1)begin: csa_row3_shift
    assign c_row3_shift[i] = {c_row3[i][WIDTH-2:0], 1'b0};
  end

  // 4. fourth level, 3 csa, 10p -> 7p (2*3+1): ////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row4_0  (s_row3[0]       , c_row3_shift[0], s_row3[1]      , s_row4[0], c_row4[0]);
  csa_nbit #(.N(WIDTH)) csa_row4_1  (c_row3_shift[1] , s_row3[2]      , c_row3_shift[2], s_row4[1], c_row4[1]);
  csa_nbit #(.N(WIDTH)) csa_row4_2  (s_row3[3]       , c_row3_shift[3], s_row3[4]      , s_row4[2], c_row4[2]);
  for(genvar i=0; i<3; i=i+1)begin: csa_row4_shift
    assign c_row4_shift[i] = {c_row4[i][WIDTH-2:0], 1'b0};
  end

  // 5. fifth level, 2 csa, 7p -> 5p (2*2+1): //////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row5_0  (c_row3_shift[4], s_row4[0]      , c_row4_shift[0], s_row5[0], c_row5[0]);
  csa_nbit #(.N(WIDTH)) csa_row5_1  (s_row4[1]      , c_row4_shift[1], s_row4[2]      , s_row5[1], c_row5[1]);
  for(genvar i=0; i<2; i=i+1)begin: csa_row5_shift
    assign c_row5_shift[i] = {c_row5[i][WIDTH-2:0], 1'b0};
  end

  // 6. sixth level, 1 csa, 5p -> 4p (2+2): ////////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row6    (c_row4_shift[2], s_row5[0], c_row5_shift[0], s_row6, c_row6);
  assign c_row6_shift = {c_row6[WIDTH-2:0], 1'b0};

  // 7. seventh level, 1 csa, 4p -> 3p (2+1): //////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row7    (s_row5[1], c_row5_shift[1], s_row6, s_row7, c_row7);
  assign c_row7_shift = {c_row7[WIDTH-2:0], 1'b0};

  // 8. eighth level, 1 csa, 3p -> 2p: ////////////////////////////////////////////////////////////////////
  csa_nbit #(.N(WIDTH)) csa_row8    (c_row6_shift, s_row7, c_row7_shift, s_row8, c_row8);
  assign c_row8_shift = {c_row8[WIDTH-2:0], 1'b0};

  // 9. output 2p :////////////////////////////////////////////////////////////////////////////////////////
  assign out[1] = c_row8_shift;
  assign out[0] = s_row8;

endmodule
