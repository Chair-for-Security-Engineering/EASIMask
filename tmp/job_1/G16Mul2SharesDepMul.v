// Generator : SpinalHDL v1.6.2    git head : 47ae50d83f8f2535f984ba8e55c890dbe0ae9cc7
// Component : G16Mul2SharesDepMul
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module G16Mul2SharesDepMul (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    mul3_io_m;
  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_z_0;
  wire       [3:0]    mul3_io_z_1;
  reg        [3:0]    x_0;
  reg        [3:0]    x_1;
  reg        [3:0]    yz_0;
  reg        [3:0]    yz_1;
  wire       [3:0]    z_0;
  wire       [3:0]    z_1;
  wire       [3:0]    b;

  G16Mul mul1 (
    .io_a    (x_0[3:0]        ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (x_1[3:0]        ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul2SharesIndepMul mul3 (
    .io_x_0    (io_x_0[3:0]       ), //i
    .io_x_1    (io_x_1[3:0]       ), //i
    .io_y_0    (z_0[3:0]          ), //i
    .io_y_1    (z_1[3:0]          ), //i
    .io_m      (mul3_io_m[3:0]    ), //i
    .io_z_0    (mul3_io_z_0[3:0]  ), //o
    .io_z_1    (mul3_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  assign z_0 = io_m[7 : 4];
  assign z_1 = io_m[3 : 0];
  assign b = (yz_0 ^ yz_1);
  assign mul3_io_m = io_m[11 : 8];
  assign io_z_0 = (mul3_io_z_0 ^ mul1_io_x);
  assign io_z_1 = (mul3_io_z_1 ^ mul2_io_x);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      x_0 <= 4'b0000;
      x_1 <= 4'b0000;
      yz_0 <= 4'b0000;
      yz_1 <= 4'b0000;
    end else begin
      x_0 <= io_x_0;
      yz_0 <= (z_0 ^ io_y_0);
      x_1 <= io_x_1;
      yz_1 <= (z_1 ^ io_y_1);
    end
  end


endmodule

module G16Mul2SharesIndepMul (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_x;
  wire       [3:0]    mul4_io_x;
  reg        [3:0]    r0;
  reg        [3:0]    r1;
  reg        [3:0]    r2;
  reg        [3:0]    r3;

  G16Mul mul1 (
    .io_a    (io_x_0[3:0]     ), //i
    .io_b    (io_y_0[3:0]     ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (io_x_0[3:0]     ), //i
    .io_b    (io_y_1[3:0]     ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul mul3 (
    .io_a    (io_x_1[3:0]     ), //i
    .io_b    (io_y_0[3:0]     ), //i
    .io_x    (mul3_io_x[3:0]  )  //o
  );
  G16Mul mul4 (
    .io_a    (io_x_1[3:0]     ), //i
    .io_b    (io_y_1[3:0]     ), //i
    .io_x    (mul4_io_x[3:0]  )  //o
  );
  assign io_z_0 = (r0 ^ r1);
  assign io_z_1 = (r2 ^ r3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      r0 <= 4'b0000;
      r1 <= 4'b0000;
      r2 <= 4'b0000;
      r3 <= 4'b0000;
    end else begin
      r0 <= mul1_io_x;
      r1 <= (mul2_io_x ^ io_m);
      r2 <= (mul3_io_x ^ io_m);
      r3 <= mul4_io_x;
    end
  end


endmodule

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

module G16Mul (
  input      [3:0]    io_a,
  input      [3:0]    io_b,
  output     [3:0]    io_x
);

  wire       [1:0]    mul1_io_a;
  wire       [1:0]    mul1_io_b;
  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    scale_io_x;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    d;
  wire       [1:0]    e;
  wire       [1:0]    f;
  wire       [1:0]    p;
  wire       [1:0]    q;

  G4Mul mul1 (
    .io_a    (mul1_io_a[1:0]  ), //i
    .io_b    (mul1_io_b[1:0]  ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (a[1:0]          ), //i
    .io_b    (c[1:0]          ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (b[1:0]          ), //i
    .io_b    (d[1:0]          ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  G4ScaleN scale (
    .io_t    (e[1:0]           ), //i
    .io_x    (scale_io_x[1:0]  )  //o
  );
  assign mul1_io_a = (a ^ b);
  assign mul1_io_b = (c ^ d);
  assign e = mul1_io_x;
  assign f = scale_io_x;
  assign p = (mul2_io_x ^ f);
  assign q = (mul3_io_x ^ f);
  assign a = io_a[3 : 2];
  assign b = io_a[1 : 0];
  assign c = io_b[3 : 2];
  assign d = io_b[1 : 0];
  assign io_x = {p,q};

endmodule

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

module G4ScaleN (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],(io_t[1] ^ io_t[0])};

endmodule

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
