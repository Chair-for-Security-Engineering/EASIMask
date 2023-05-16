// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : KoggeStoneAdder
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module KoggeStoneAdder (
  input      [3:0]    io_x,
  input      [3:0]    io_y,
  output     [3:0]    io_z,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire                G00;
  wire                G01;
  wire                G02;
  wire                G03;
  wire                P00;
  wire                P01;
  wire                P02;
  wire                P03;
  wire                G11;
  wire                G12;
  wire                G13;
  wire                P11;
  wire                P12;
  wire                P13;
  wire                G22;
  wire                G23;
  wire                P22;
  wire                P23;
  wire                c0;
  wire                c1;
  wire                c2;
  wire                c3;
  wire                s0;
  wire                s1;
  wire                s2;
  wire                s3;

  assign c0 = 1'b0;
  assign G00 = (io_x[0] && io_y[0]);
  assign G01 = (io_x[1] && io_y[1]);
  assign G02 = (io_x[2] && io_y[2]);
  assign G03 = (io_x[3] && io_y[3]);
  assign P00 = (io_x[0] ^ io_y[0]);
  assign P01 = (io_x[1] ^ io_y[1]);
  assign P02 = (io_x[2] ^ io_y[2]);
  assign P03 = (io_x[3] ^ io_y[3]);
  assign G11 = ((P01 && G00) ^ G01);
  assign P11 = (P01 && P00);
  assign G12 = ((P02 && G01) ^ G02);
  assign P12 = (P02 && P01);
  assign G13 = ((P03 && G02) ^ G03);
  assign P13 = (P03 && P02);
  assign G22 = ((P12 && G00) ^ G12);
  assign P22 = (P12 && P00);
  assign G23 = ((P13 && G11) ^ G13);
  assign P23 = (P13 && P11);
  assign c1 = G00;
  assign c2 = G11;
  assign c3 = G22;
  assign s0 = ((io_x[0] ^ io_y[0]) ^ c0);
  assign s1 = ((io_x[1] ^ io_y[1]) ^ c1);
  assign s2 = ((io_x[2] ^ io_y[2]) ^ c2);
  assign s3 = ((io_x[3] ^ io_y[3]) ^ c3);
  assign io_z = {{{s3,s2},s1},s0};

endmodule
