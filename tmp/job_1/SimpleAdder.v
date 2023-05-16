// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : SimpleAdder
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module SimpleAdder (
  input      [3:0]    io_x,
  input      [3:0]    io_y,
  output     [3:0]    io_z,
  input               clk,
  input               reset
);

  wire       [3:0]    _zz_io_z;
  reg                 dummy;

  assign _zz_io_z = (io_x + io_y);
  assign io_z = _zz_io_z;

endmodule
