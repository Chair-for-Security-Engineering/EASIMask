// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : QuarterRound
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module QuarterRound (
  input      [31:0]   io_a,
  input      [31:0]   io_b,
  input      [31:0]   io_c,
  input      [31:0]   io_d,
  output     [31:0]   io_e,
  output     [31:0]   io_f,
  output     [31:0]   io_g,
  output     [31:0]   io_h,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire       [31:0]   a1;
  wire       [31:0]   _zz_d1;
  wire       [31:0]   d1;
  wire       [31:0]   c1;
  wire       [31:0]   _zz_b1;
  wire       [31:0]   b1;
  wire       [31:0]   a2;
  wire       [31:0]   _zz_d2;
  wire       [31:0]   d2;
  wire       [31:0]   c2;
  wire       [31:0]   _zz_b2;
  wire       [31:0]   b2;

  assign a1 = (io_a + io_b);
  assign _zz_d1 = (a1 ^ io_d);
  assign d1 = {_zz_d1[15 : 0],_zz_d1[31 : 16]};
  assign c1 = (io_c + d1);
  assign _zz_b1 = (io_b ^ c1);
  assign b1 = {_zz_b1[19 : 0],_zz_b1[31 : 20]};
  assign a2 = (a1 + b1);
  assign _zz_d2 = (a2 ^ d1);
  assign d2 = {_zz_d2[23 : 0],_zz_d2[31 : 24]};
  assign c2 = (c1 + d2);
  assign _zz_b2 = (b1 ^ c2);
  assign b2 = {_zz_b2[24 : 0],_zz_b2[31 : 25]};
  assign io_e = a2;
  assign io_f = b2;
  assign io_g = c2;
  assign io_h = d2;

endmodule
