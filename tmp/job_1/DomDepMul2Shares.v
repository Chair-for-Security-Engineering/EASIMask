// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : DomDepMul2Shares
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module DomDepMul2Shares (
  input               io_x_0,
  input               io_x_1,
  input               io_y_0,
  input               io_y_1,
  input               io_m_0,
  input               io_m_1,
  input               io_m_2,
  output              io_z_0,
  output              io_z_1,
  input               clk,
  input               reset
);

  wire                mul_io_z_0;
  wire                mul_io_z_1;
  reg                 a_0;
  reg                 a_1;
  reg                 x_0;
  reg                 x_1;
  wire                b;
  wire                c_0;
  wire                c_1;
  wire                d_0;
  wire                d_1;

  DomIndepMul2Shares mul (
    .io_x_0    (io_x_0      ), //i
    .io_x_1    (io_x_1      ), //i
    .io_y_0    (io_m_0      ), //i
    .io_y_1    (io_m_1      ), //i
    .io_m      (io_m_2      ), //i
    .io_z_0    (mul_io_z_0  ), //o
    .io_z_1    (mul_io_z_1  ), //o
    .clk       (clk         ), //i
    .reset     (reset       )  //i
  );
  assign d_0 = mul_io_z_0;
  assign d_1 = mul_io_z_1;
  assign b = (a_0 ^ a_1);
  assign c_0 = (x_0 && b);
  assign c_1 = (x_1 && b);
  assign io_z_0 = (c_0 ^ d_0);
  assign io_z_1 = (c_1 ^ d_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      a_0 <= 1'b0;
      a_1 <= 1'b0;
      x_0 <= 1'b0;
      x_1 <= 1'b0;
    end else begin
      a_0 <= (io_y_0 ^ io_m_0);
      a_1 <= (io_y_1 ^ io_m_1);
      x_0 <= io_x_0;
      x_1 <= io_x_1;
    end
  end


endmodule

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
