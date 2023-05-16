// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : RippleCarryAdder
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module RippleCarryAdder (
  input      [3:0]    io_x,
  input      [3:0]    io_y,
  output     [3:0]    io_z,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire                c0;
  wire                s0;
  wire                c1;
  wire                s1;
  wire                c2;
  wire                s2;
  wire                c3;
  wire                s3;

  assign c0 = 1'b0;
  assign s0 = ((io_x[0] ^ io_y[0]) ^ c0);
  assign c1 = (((io_x[0] && io_y[0]) ^ (io_x[0] && c0)) ^ (io_y[0] && c0));
  assign s1 = ((io_x[1] ^ io_y[1]) ^ c1);
  assign c2 = (((io_x[1] && io_y[1]) ^ (io_x[1] && c1)) ^ (io_y[1] && c1));
  assign s2 = ((io_x[2] ^ io_y[2]) ^ c2);
  assign c3 = (((io_x[2] && io_y[2]) ^ (io_x[2] && c2)) ^ (io_y[2] && c2));
  assign s3 = ((io_x[3] ^ io_y[3]) ^ c3);
  assign io_z = {{{s3,s2},s1},s0};

endmodule
