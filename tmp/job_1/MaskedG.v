// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : MaskedG
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module MaskedG (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output reg [3:0]    io_out1,
  output reg [3:0]    io_out2,
  output reg [3:0]    io_out3,
  input               clk,
  input               reset
);

  wire                _zz_g10;
  wire                _zz_g10_1;
  wire                _zz_g20;
  reg                 dummy;
  wire                x1;
  wire                x2;
  wire                x3;
  wire                y1;
  wire                y2;
  wire                y3;
  wire                z1;
  wire                z2;
  wire                z3;
  wire                w1;
  wire                w2;
  wire                w3;
  wire                g13;
  wire                g12;
  wire                g11;
  wire                g10;
  wire                g23;
  wire                g22;
  wire                g21;
  wire                g20;
  wire                g33;
  wire                g32;
  wire                g31;
  wire                g30;

  assign _zz_g10 = (1'b1 ^ w2);
  assign _zz_g10_1 = (x2 && y2);
  assign _zz_g20 = (x3 && y3);
  assign x1 = io_in1[3];
  assign x2 = io_in2[3];
  assign x3 = io_in3[3];
  assign y1 = io_in1[2];
  assign y2 = io_in2[2];
  assign y3 = io_in3[2];
  assign z1 = io_in1[1];
  assign z2 = io_in2[1];
  assign z3 = io_in3[1];
  assign w1 = io_in1[0];
  assign w2 = io_in2[0];
  assign w3 = io_in3[0];
  assign g13 = ((y2 ^ z2) ^ w2);
  assign g12 = ((1'b1 ^ y2) ^ z2);
  assign g11 = ((((((((1'b1 ^ x2) ^ z2) ^ (y2 && w2)) ^ (y2 && w3)) ^ (y3 && w2)) ^ (z2 && w2)) ^ (z2 && w3)) ^ (z3 && w2));
  assign g10 = (((((((((_zz_g10 ^ _zz_g10_1) ^ (x2 && y3)) ^ (x3 && y2)) ^ (x2 && z2)) ^ (x2 && z3)) ^ (x3 && z2)) ^ (y2 && z2)) ^ (y2 && z3)) ^ (y3 && z2));
  assign g23 = ((y3 ^ z3) ^ w3);
  assign g22 = (y3 ^ z3);
  assign g21 = (((((((x3 ^ z3) ^ (y3 && w3)) ^ (y1 && w3)) ^ (y3 && w1)) ^ (z3 && w3)) ^ (z1 && w3)) ^ (z3 && w1));
  assign g20 = (((((((((w3 ^ _zz_g20) ^ (x1 && y3)) ^ (x3 && y1)) ^ (x3 && z3)) ^ (x1 && z3)) ^ (x3 && z1)) ^ (y3 && z3)) ^ (y1 && z3)) ^ (y3 && z1));
  assign g33 = ((y1 ^ z1) ^ w1);
  assign g32 = (y1 ^ z1);
  assign g31 = (((((((x1 ^ z1) ^ (y1 && w1)) ^ (y1 && w2)) ^ (y2 && w1)) ^ (z1 && w1)) ^ (z1 && w2)) ^ (z2 && w1));
  assign g30 = (((((((((w1 ^ (x1 && y1)) ^ (x1 && y2)) ^ (x2 && y1)) ^ (x1 && z1)) ^ (x1 && z2)) ^ (x2 && z1)) ^ (y1 && z1)) ^ (y1 && z2)) ^ (y2 && z1));
  always @(*) begin
    io_out1[3] = g13;
    io_out1[2] = g12;
    io_out1[1] = g11;
    io_out1[0] = g10;
  end

  always @(*) begin
    io_out2[3] = g23;
    io_out2[2] = g22;
    io_out2[1] = g21;
    io_out2[0] = g20;
  end

  always @(*) begin
    io_out3[3] = g33;
    io_out3[2] = g32;
    io_out3[1] = g31;
    io_out3[0] = g30;
  end


endmodule
