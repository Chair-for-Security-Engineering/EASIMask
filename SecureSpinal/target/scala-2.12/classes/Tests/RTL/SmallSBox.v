// Generator : SpinalHDL v1.6.2    git head : 85cae432eceede8556a3d1c01b9034bca87c9af9
// Component : SmallSBox
// Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

`timescale 1ns/1ps 

module SmallSBox (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_a,
  output     [7:0]    io_b
);


  assign io_b = (~ io_a);

endmodule
