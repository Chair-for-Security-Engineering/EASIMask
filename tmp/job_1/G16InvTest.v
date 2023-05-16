// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : G16InvTest
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module G16InvTest (
  input      [3:0]    io_x,
  output     [3:0]    io_z,
  input               clk,
  input               reset
);

  wire                x1;
  wire                x2;
  wire                x3;
  wire                x4;
  wire                f1;
  wire                f2;
  wire                f3;
  wire                f4;
  wire                dummy;

  assign dummy = 1'b0;
  assign x1 = io_x[3];
  assign x2 = io_x[2];
  assign x3 = io_x[1];
  assign x4 = io_x[0];
  assign f1 = ((((x3 ^ x4) ^ (x1 && x3)) ^ (x2 && x3)) ^ ((x2 && x3) && x4));
  assign f2 = ((((x4 ^ (x1 && x3)) ^ (x2 && x3)) ^ (x2 && x4)) ^ ((x1 && x3) && x4));
  assign f3 = ((((x1 ^ x2) ^ (x1 && x3)) ^ (x1 && x4)) ^ ((x2 && x2) && x4));
  assign f4 = ((((x2 ^ (x1 && x3)) ^ (x1 && x4)) ^ (x2 && x4)) ^ ((x1 && x2) && x3));
  assign io_z = {{{f1,f2},f3},f4};

endmodule
