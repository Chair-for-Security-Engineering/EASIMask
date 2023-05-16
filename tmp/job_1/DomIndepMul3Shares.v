// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : DomIndepMul3Shares
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module DomIndepMul3Shares (
  input               io_x_0,
  input               io_x_1,
  input               io_x_2,
  input               io_y_0,
  input               io_y_1,
  input               io_y_2,
  input               io_m_0,
  input               io_m_1,
  input               io_m_2,
  output              io_z_0,
  output              io_z_1,
  output              io_z_2,
  input               clk,
  input               reset
);

  wire                x_0;
  wire                x_1;
  wire                x_2;
  wire                y_0;
  wire                y_1;
  wire                y_2;
  wire                m_0;
  wire                m_1;
  wire                m_2;
  wire                xy_0;
  wire                xy_1;
  wire                xy_2;
  wire                xy_3;
  wire                xy_4;
  wire                xy_5;
  wire                xy_6;
  wire                xy_7;
  wire                xy_8;
  reg                 a_0;
  reg                 a_1;
  reg                 a_2;
  reg                 a_3;
  reg                 a_4;
  reg                 a_5;
  reg                 a_6;
  reg                 a_7;
  reg                 a_8;

  assign xy_0 = (io_x_0 && io_y_0);
  assign xy_1 = (io_x_0 && io_y_1);
  assign xy_2 = (io_x_0 && io_y_2);
  assign xy_3 = (io_x_1 && io_y_0);
  assign xy_4 = (io_x_1 && io_y_1);
  assign xy_5 = (io_x_1 && io_y_2);
  assign xy_6 = (io_x_2 && io_y_0);
  assign xy_7 = (io_x_2 && io_y_1);
  assign xy_8 = (io_x_2 && io_y_2);
  assign io_z_0 = (((1'b0 ^ a_0) ^ a_1) ^ a_2);
  assign io_z_1 = (((1'b0 ^ a_3) ^ a_4) ^ a_5);
  assign io_z_2 = (((1'b0 ^ a_6) ^ a_7) ^ a_8);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      a_0 <= 1'b0;
      a_1 <= 1'b0;
      a_2 <= 1'b0;
      a_3 <= 1'b0;
      a_4 <= 1'b0;
      a_5 <= 1'b0;
      a_6 <= 1'b0;
      a_7 <= 1'b0;
      a_8 <= 1'b0;
    end else begin
      a_0 <= xy_0;
      a_1 <= (xy_1 ^ io_m_0);
      a_2 <= (xy_2 ^ io_m_1);
      a_3 <= (xy_3 ^ io_m_0);
      a_4 <= xy_4;
      a_5 <= (xy_5 ^ io_m_2);
      a_6 <= (xy_6 ^ io_m_1);
      a_7 <= (xy_7 ^ io_m_2);
      a_8 <= xy_8;
    end
  end


endmodule
