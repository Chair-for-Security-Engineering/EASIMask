// Generator : SpinalHDL v1.6.2    git head : 835dad6b10a4191c366f7748f775bd594b010510
// Component : test
// Git hash  : 835dad6b10a4191c366f7748f775bd594b010510

`timescale 1ns/1ps 

module test (
  input      [1:0]    io_p,
  input      [1:0]    io_k,
  output     [1:0]    io_c,
  input      [1:0]    io_k_0,
  input      [1:0]    io_k_1,
  input      [1:0]    io_k_2,
  output     [1:0]    io_c_0,
  output     [1:0]    io_c_1,
  output     [1:0]    io_c_2
);


  assign io_c = io_p;
  assign io_c_0 = io_k_0;
  assign io_c_1 = io_k_1;
  assign io_c_2 = io_k_2;

endmodule
