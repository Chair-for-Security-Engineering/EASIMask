// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : DomIndepMul2Shares
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module DomIndepMul2Shares (
  input               io_x_0,
  input               io_x_1,
  input               io_y_0,
  input               io_y_1,
  input               io_m,
  output              io_z_0,
  output              io_z_1,
  input               clk,
  input               reset
);

  wire                xy_0;
  wire                xy_1;
  wire                xy_2;
  wire                xy_3;
  reg                 a_0;
  reg                 a_1;
  reg                 a_2;
  reg                 a_3;

  assign xy_0 = (io_x_0 && io_y_0);
  assign xy_1 = (io_x_0 && io_y_1);
  assign xy_2 = (io_x_1 && io_y_0);
  assign xy_3 = (io_x_1 && io_y_1);
  assign io_z_0 = ((1'b0 ^ a_0) ^ a_1);
  assign io_z_1 = ((1'b0 ^ a_2) ^ a_3);
  always @(posedge clk) begin
    a_0 <= xy_0;
    a_1 <= (xy_1 ^ io_m);
    a_2 <= (xy_2 ^ io_m);
    a_3 <= xy_3;
  end


endmodule
