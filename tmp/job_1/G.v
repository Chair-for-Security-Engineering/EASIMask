// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : G
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module G (
  input      [3:0]    io_input,
  output reg [3:0]    io_output,
  input               clk,
  input               reset
);

  wire                x;
  wire                y;
  wire                z;
  wire                w;
  reg                 dummy;

  assign x = io_input[3];
  assign y = io_input[2];
  assign z = io_input[1];
  assign w = io_input[0];
  always @(*) begin
    io_output[3] = ((y ^ z) ^ w);
    io_output[2] = ((1'b1 ^ y) ^ z);
    io_output[1] = ((((1'b1 ^ x) ^ z) ^ (y && w)) ^ (z && w));
    io_output[0] = ((((1'b1 ^ w) ^ (x && y)) ^ (x && z)) ^ (y && z));
  end


endmodule
