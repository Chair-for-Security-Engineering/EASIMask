// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : DomIndepMul
// Git hash  : 5dddc5a360ffe28dad22b1b12d714c1fa8824bd3

`timescale 1ns/1ps 

module DomIndepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_x_2,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_y_2,
  input      [3:0]    io_m_0,
  input      [3:0]    io_m_1,
  input      [3:0]    io_m_2,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  output     [3:0]    io_z_2
);

  wire       [3:0]    g16Mul_9_io_x;
  wire       [3:0]    g16Mul_10_io_x;
  wire       [3:0]    g16Mul_11_io_x;
  wire       [3:0]    g16Mul_12_io_x;
  wire       [3:0]    g16Mul_13_io_x;
  wire       [3:0]    g16Mul_14_io_x;
  wire       [3:0]    g16Mul_15_io_x;
  wire       [3:0]    g16Mul_16_io_x;
  wire       [3:0]    g16Mul_17_io_x;
  reg        [3:0]    r_r_0;
  reg        [3:0]    r_r_1;
  reg        [3:0]    r_r_2;
  reg        [3:0]    r_r_3;
  reg        [3:0]    r_r_4;
  reg        [3:0]    r_r_5;
  reg        [3:0]    r_r_6;
  reg        [3:0]    r_r_7;
  reg        [3:0]    r_r_8;
  wire       [3:0]    r_mulOut_0;
  wire       [3:0]    r_mulOut_1;
  wire       [3:0]    r_mulOut_2;
  wire       [3:0]    r_mulOut_3;
  wire       [3:0]    r_mulOut_4;
  wire       [3:0]    r_mulOut_5;
  wire       [3:0]    r_mulOut_6;
  wire       [3:0]    r_mulOut_7;
  wire       [3:0]    r_mulOut_8;

  G16Mul g16Mul_9 (
    .io_a    (io_x_0[3:0]         ), //i
    .io_b    (io_y_0[3:0]         ), //i
    .io_x    (g16Mul_9_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_10 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (io_y_1[3:0]          ), //i
    .io_x    (g16Mul_10_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_11 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (io_y_2[3:0]          ), //i
    .io_x    (g16Mul_11_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_12 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (io_y_0[3:0]          ), //i
    .io_x    (g16Mul_12_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_13 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (io_y_1[3:0]          ), //i
    .io_x    (g16Mul_13_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_14 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (io_y_2[3:0]          ), //i
    .io_x    (g16Mul_14_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_15 (
    .io_a    (io_x_2[3:0]          ), //i
    .io_b    (io_y_0[3:0]          ), //i
    .io_x    (g16Mul_15_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_16 (
    .io_a    (io_x_2[3:0]          ), //i
    .io_b    (io_y_1[3:0]          ), //i
    .io_x    (g16Mul_16_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_17 (
    .io_a    (io_x_2[3:0]          ), //i
    .io_b    (io_y_2[3:0]          ), //i
    .io_x    (g16Mul_17_io_x[3:0]  )  //o
  );
  assign r_mulOut_0 = g16Mul_9_io_x;
  assign r_mulOut_1 = g16Mul_10_io_x;
  assign r_mulOut_2 = g16Mul_11_io_x;
  assign r_mulOut_3 = g16Mul_12_io_x;
  assign r_mulOut_4 = g16Mul_13_io_x;
  assign r_mulOut_5 = g16Mul_14_io_x;
  assign r_mulOut_6 = g16Mul_15_io_x;
  assign r_mulOut_7 = g16Mul_16_io_x;
  assign r_mulOut_8 = g16Mul_17_io_x;
  assign io_z_0 = ((r_r_0 ^ r_r_1) ^ r_r_2);
  assign io_z_1 = ((r_r_3 ^ r_r_4) ^ r_r_5);
  assign io_z_2 = ((r_r_6 ^ r_r_7) ^ r_r_8);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_r_0 <= 4'b0000;
      r_r_1 <= 4'b0000;
      r_r_2 <= 4'b0000;
      r_r_3 <= 4'b0000;
      r_r_4 <= 4'b0000;
      r_r_5 <= 4'b0000;
      r_r_6 <= 4'b0000;
      r_r_7 <= 4'b0000;
      r_r_8 <= 4'b0000;
    end else begin
      r_r_0 <= r_mulOut_0;
      r_r_1 <= (r_mulOut_1 ^ io_m_0);
      r_r_2 <= (r_mulOut_2 ^ io_m_1);
      r_r_3 <= (r_mulOut_3 ^ io_m_0);
      r_r_4 <= r_mulOut_4;
      r_r_5 <= (r_mulOut_5 ^ io_m_2);
      r_r_6 <= (r_mulOut_6 ^ io_m_1);
      r_r_7 <= (r_mulOut_7 ^ io_m_2);
      r_r_8 <= r_mulOut_8;
    end
  end


endmodule

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

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
