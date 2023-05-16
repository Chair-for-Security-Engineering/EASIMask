// Generator : SpinalHDL v1.6.2    git head : 85cae432eceede8556a3d1c01b9034bca87c9af9
// Component : SmallSBoxMasked
// Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

`timescale 1ns/1ps 

module SmallSBoxMasked (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_a_0,
  input      [7:0]    io_a_1,
  input      [7:0]    io_r,
  output     [7:0]    io_b_0,
  output     [7:0]    io_b_1
);


  assign io_b_1 = ((~ io_a_1) ^ io_r);
  assign io_b_0 = (io_a_0 ^ io_r);

endmodule
