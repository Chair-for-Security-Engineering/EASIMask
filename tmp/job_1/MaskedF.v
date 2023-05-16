// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : MaskedF
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module MaskedF (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output reg [3:0]    io_out1,
  output reg [3:0]    io_out2,
  output reg [3:0]    io_out3,
  input               clk,
  input               reset
);

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
  wire                f13;
  wire                f12;
  wire                f11;
  wire                f10;
  wire                f23;
  wire                f22;
  wire                f21;
  wire                f20;
  wire                f33;
  wire                f32;
  wire                f31;
  wire                f30;

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
  assign f13 = (((((y2 ^ z2) ^ w2) ^ (x2 && w2)) ^ (x2 && w3)) ^ (x3 && w2));
  assign f12 = (((x2 ^ (z2 && w2)) ^ (z2 && w3)) ^ (z3 && w2));
  assign f11 = ((((y2 ^ z2) ^ (x2 && w2)) ^ (x2 && w3)) ^ (x3 && w2));
  assign f10 = (((z2 ^ (y2 && w2)) ^ (y2 && w3)) ^ (y3 && w2));
  assign f23 = (((((y3 ^ z3) ^ w3) ^ (x3 && w3)) ^ (x1 && w3)) ^ (x3 && w1));
  assign f22 = (((x3 ^ (z3 && w3)) ^ (z1 && w3)) ^ (z3 && w1));
  assign f21 = ((((y3 ^ z3) ^ (x3 && w3)) ^ (x1 && w3)) ^ (x3 && w1));
  assign f20 = (((z3 ^ (y3 && w3)) ^ (y1 && w3)) ^ (y3 && w1));
  assign f33 = (((((y1 ^ z1) ^ w1) ^ (x1 && w1)) ^ (x1 && w2)) ^ (x2 && w1));
  assign f32 = (((x1 ^ (z1 && w1)) ^ (z1 && w2)) ^ (z2 && w1));
  assign f31 = ((((y1 ^ z1) ^ (x1 && w1)) ^ (x1 && w2)) ^ (x2 && w1));
  assign f30 = (((z1 ^ (y1 && w1)) ^ (y1 && w2)) ^ (y2 && w1));
  always @(*) begin
    io_out1[3] = f13;
    io_out1[2] = f12;
    io_out1[1] = f11;
    io_out1[0] = f10;
  end

  always @(*) begin
    io_out2[3] = f23;
    io_out2[2] = f22;
    io_out2[1] = f21;
    io_out2[0] = f20;
  end

  always @(*) begin
    io_out3[3] = f33;
    io_out3[2] = f32;
    io_out3[1] = f31;
    io_out3[0] = f30;
  end


endmodule
