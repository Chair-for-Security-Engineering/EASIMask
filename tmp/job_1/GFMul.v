// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : GFMul
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module GFMul (
  input      [1:0]    io_x,
  input      [1:0]    io_y,
  output     [1:0]    io_z,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire       [0:0]    a;
  wire       [0:0]    b;
  wire       [0:0]    c;
  wire       [0:0]    d;
  wire       [0:0]    e;
  wire       [0:0]    f;
  wire       [0:0]    g;
  wire       [0:0]    h;
  wire       [0:0]    p;
  wire       [0:0]    q;

  assign a = io_x[1 : 1];
  assign b = io_x[0 : 0];
  assign c = io_y[1 : 1];
  assign d = io_y[0 : 0];
  assign e = ((a ^ b) & (c ^ d));
  assign f = e;
  assign g = (a & c);
  assign h = (b & d);
  assign p = (g ^ f);
  assign q = (h ^ f);
  assign io_z = {p,q};

endmodule
