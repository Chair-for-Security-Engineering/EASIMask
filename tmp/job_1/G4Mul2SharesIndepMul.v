// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : G4Mul2SharesIndepMul
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module G4Mul2SharesIndepMul (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [1:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    mul4_io_x;
  wire       [1:0]    x0y0;
  wire       [1:0]    x0y1;
  wire       [1:0]    x1y0;
  wire       [1:0]    x1y1;
  reg        [1:0]    r0;
  reg        [1:0]    r1;
  reg        [1:0]    r2;
  reg        [1:0]    r3;

  G4Mul mul1 (
    .io_a    (io_x_0[1:0]     ), //i
    .io_b    (io_y_0[1:0]     ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (io_x_0[1:0]     ), //i
    .io_b    (io_y_1[1:0]     ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (io_x_1[1:0]     ), //i
    .io_b    (io_y_0[1:0]     ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  G4Mul mul4 (
    .io_a    (io_x_1[1:0]     ), //i
    .io_b    (io_y_1[1:0]     ), //i
    .io_x    (mul4_io_x[1:0]  )  //o
  );
  assign x0y0 = mul1_io_x;
  assign x0y1 = mul2_io_x;
  assign x1y0 = mul3_io_x;
  assign x1y1 = mul4_io_x;
  assign io_z_0 = (r0 ^ r1);
  assign io_z_1 = (r2 ^ r3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      r0 <= 2'b00;
      r1 <= 2'b00;
      r2 <= 2'b00;
      r3 <= 2'b00;
    end else begin
      r0 <= x0y0;
      r1 <= (x0y1 ^ io_m);
      r2 <= (x1y0 ^ io_m);
      r3 <= x1y1;
    end
  end


endmodule

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

module G4Mul (
  input      [1:0]    io_a,
  input      [1:0]    io_b,
  output     [1:0]    io_x
);

  wire       [0:0]    a;
  wire       [0:0]    b;
  wire       [0:0]    c;
  wire       [0:0]    d;
  wire       [0:0]    e;
  wire       [0:0]    p;
  wire       [0:0]    q;

  assign a = io_a[1];
  assign b = io_a[0];
  assign c = io_b[1];
  assign d = io_b[0];
  assign e = ((a ^ b) & (c ^ d));
  assign p = ((a & c) ^ e);
  assign q = ((b & d) ^ e);
  assign io_x = {p,q};

endmodule
