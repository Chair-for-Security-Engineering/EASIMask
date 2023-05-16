// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : GFMul_3
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module GFMul_3 (
  input      [3:0]    io_x,
  input      [3:0]    io_y,
  output     [3:0]    io_z,
  input               clk,
  input               reset
);

  wire       [1:0]    gFMul_4_io_x;
  wire       [1:0]    gFMul_4_io_y;
  wire       [1:0]    gFMul_4_io_z;
  wire       [1:0]    gFMul_5_io_z;
  wire       [1:0]    gFMul_6_io_z;
  wire       [1:0]    g4ScaleN_1_io_x;
  reg                 dummy;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    d;
  wire       [1:0]    e;
  wire       [1:0]    f;
  wire       [1:0]    g;
  wire       [1:0]    h;
  wire       [1:0]    p;
  wire       [1:0]    q;

  GFMul gFMul_4 (
    .io_x     (gFMul_4_io_x[1:0]  ), //i
    .io_y     (gFMul_4_io_y[1:0]  ), //i
    .io_z     (gFMul_4_io_z[1:0]  ), //o
    .clk      (clk                ), //i
    .reset    (reset              )  //i
  );
  GFMul gFMul_5 (
    .io_x     (a[1:0]             ), //i
    .io_y     (c[1:0]             ), //i
    .io_z     (gFMul_5_io_z[1:0]  ), //o
    .clk      (clk                ), //i
    .reset    (reset              )  //i
  );
  GFMul gFMul_6 (
    .io_x     (b[1:0]             ), //i
    .io_y     (d[1:0]             ), //i
    .io_z     (gFMul_6_io_z[1:0]  ), //o
    .clk      (clk                ), //i
    .reset    (reset              )  //i
  );
  G4ScaleN g4ScaleN_1 (
    .io_t    (e[1:0]                ), //i
    .io_x    (g4ScaleN_1_io_x[1:0]  )  //o
  );
  assign a = io_x[3 : 2];
  assign b = io_x[1 : 0];
  assign c = io_y[3 : 2];
  assign d = io_y[1 : 0];
  assign gFMul_4_io_x = (a ^ b);
  assign gFMul_4_io_y = (c ^ d);
  assign e = gFMul_4_io_z;
  assign f = g4ScaleN_1_io_x;
  assign g = gFMul_5_io_z;
  assign h = gFMul_6_io_z;
  assign p = (g ^ f);
  assign q = (h ^ f);
  assign io_z = {p,q};

endmodule

module G4ScaleN (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],(io_t[1] ^ io_t[0])};

endmodule

//GFMul replaced by GFMul

//GFMul replaced by GFMul

module GFMul (
  input      [1:0]    io_x,
  input      [1:0]    io_y,
  output     [1:0]    io_z,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire       [0:0]    a;
  wire       [0:0]    b;
  wire       [0:0]    c;
  wire       [0:0]    d;
  wire       [0:0]    e;
  wire       [0:0]    f;
  wire       [0:0]    g;
  wire       [0:0]    h;
  wire       [0:0]    p;
  wire       [0:0]    q;

  assign a = io_x[1 : 1];
  assign b = io_x[0 : 0];
  assign c = io_y[1 : 1];
  assign d = io_y[0 : 0];
  assign e = ((a ^ b) & (c ^ d));
  assign f = e;
  assign g = (a & c);
  assign h = (b & d);
  assign p = (g ^ f);
  assign q = (h ^ f);
  assign io_z = {p,q};

endmodule
