// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : DomDepMul
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module DomDepMul (
  input               io_x_0,
  input               io_x_1,
  input               io_x_2,
  input               io_y_0,
  input               io_y_1,
  input               io_y_2,
  input               io_m_0,
  input               io_m_1,
  input               io_m_2,
  input               io_m_3,
  input               io_m_4,
  input               io_m_5,
  output              io_z_0,
  output              io_z_1,
  output              io_z_2,
  input               clk,
  input               reset
);

  wire                mul_io_z_0;
  wire                mul_io_z_1;
  wire                mul_io_z_2;
  reg                 a_0;
  reg                 a_1;
  reg                 a_2;
  reg                 x_0;
  reg                 x_1;
  reg                 x_2;
  wire                b;
  wire                c_0;
  wire                c_1;
  wire                c_2;
  wire                d_0;
  wire                d_1;
  wire                d_2;

  DomIndepMul mul (
    .io_x_0    (io_x_0      ), //i
    .io_x_1    (io_x_1      ), //i
    .io_x_2    (io_x_2      ), //i
    .io_y_0    (io_m_0      ), //i
    .io_y_1    (io_m_1      ), //i
    .io_y_2    (io_m_2      ), //i
    .io_m_0    (io_m_3      ), //i
    .io_m_1    (io_m_4      ), //i
    .io_m_2    (io_m_5      ), //i
    .io_z_0    (mul_io_z_0  ), //o
    .io_z_1    (mul_io_z_1  ), //o
    .io_z_2    (mul_io_z_2  ), //o
    .clk       (clk         ), //i
    .reset     (reset       )  //i
  );
  assign b = (((1'b0 ^ a_0) ^ a_1) ^ a_2);
  assign c_0 = (x_0 && b);
  assign c_1 = (x_1 && b);
  assign c_2 = (x_2 && b);
  assign d_0 = mul_io_z_0;
  assign d_1 = mul_io_z_1;
  assign d_2 = mul_io_z_2;
  assign io_z_0 = (c_0 ^ d_0);
  assign io_z_1 = (c_1 ^ d_1);
  assign io_z_2 = (c_2 ^ d_2);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      a_0 <= 1'b0;
      a_1 <= 1'b0;
      a_2 <= 1'b0;
      x_0 <= 1'b0;
      x_1 <= 1'b0;
      x_2 <= 1'b0;
    end else begin
      a_0 <= (io_y_0 ^ io_m_0);
      x_0 <= io_x_0;
      a_1 <= (io_y_1 ^ io_m_1);
      x_1 <= io_x_1;
      a_2 <= (io_y_2 ^ io_m_2);
      x_2 <= io_x_2;
    end
  end


endmodule

module DomIndepMul (
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

  wire                xy_0;
  wire                xy_1;
  wire                xy_2;
  wire                xy_3;
  wire                xy_4;
  wire                xy_5;
  wire                xy_6;
  wire                xy_7;
  wire                xy_8;
  reg                 z_0;
  reg                 z_1;
  reg                 z_2;
  reg                 z_3;
  reg                 z_4;
  reg                 z_5;
  reg                 z_6;
  reg                 z_7;
  reg                 z_8;

  assign xy_0 = (io_x_0 && io_y_0);
  assign xy_1 = (io_x_0 && io_y_1);
  assign xy_2 = (io_x_0 && io_y_2);
  assign xy_3 = (io_x_1 && io_y_0);
  assign xy_4 = (io_x_1 && io_y_1);
  assign xy_5 = (io_x_1 && io_y_2);
  assign xy_6 = (io_x_2 && io_y_0);
  assign xy_7 = (io_x_2 && io_y_1);
  assign xy_8 = (io_x_2 && io_y_2);
  assign io_z_0 = (((1'b0 ^ z_0) ^ z_1) ^ z_2);
  assign io_z_1 = (((1'b0 ^ z_3) ^ z_4) ^ z_5);
  assign io_z_2 = (((1'b0 ^ z_6) ^ z_7) ^ z_8);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      z_0 <= 1'b0;
      z_1 <= 1'b0;
      z_2 <= 1'b0;
      z_3 <= 1'b0;
      z_4 <= 1'b0;
      z_5 <= 1'b0;
      z_6 <= 1'b0;
      z_7 <= 1'b0;
      z_8 <= 1'b0;
    end else begin
      z_0 <= xy_0;
      z_1 <= (xy_1 ^ io_m_0);
      z_2 <= (xy_2 ^ io_m_1);
      z_3 <= (xy_3 ^ io_m_0);
      z_4 <= xy_4;
      z_5 <= (xy_5 ^ io_m_2);
      z_6 <= (xy_6 ^ io_m_1);
      z_7 <= (xy_7 ^ io_m_2);
      z_8 <= xy_8;
    end
  end


endmodule
