// Generator : SpinalHDL v1.6.2    git head : 835dad6b10a4191c366f7748f775bd594b010510
// Component : test
// Git hash  : 835dad6b10a4191c366f7748f775bd594b010510

`timescale 1ns/1ps 

module test (
  input      [1:0]    io_p,
  input      [1:0]    io_k,
  output     [1:0]    io_c,
  input               clk,
  input               reset
);

  wire       [1:0]    sbox_1_sboxOut;
  reg                 dummy;

  sbox sbox_1 (
    .clk        (clk                  ), //i
    .sboxIn     (io_p[1:0]            ), //i
    .sboxOut    (sbox_1_sboxOut[1:0]  )  //o
  );
  assign io_c = sbox_1_sboxOut;

endmodule
