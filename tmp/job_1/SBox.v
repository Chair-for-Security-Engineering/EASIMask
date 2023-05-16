// Generator : SpinalHDL v1.6.2    git head : 47ae50d83f8f2535f984ba8e55c890dbe0ae9cc7
// Component : SBox
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module SBox (
  input      [7:0]    io_sbIn0,
  input      [7:0]    io_sbIn1,
  input      [27:0]   io_m,
  output     [7:0]    io_sbOut0,
  output     [7:0]    io_sbOut1,
  input               clk,
  input               reset
);

  wire       [7:0]    convert0_io_output;
  wire       [7:0]    convert1_io_output;
  wire       [7:0]    convert2_io_output;
  wire       [7:0]    convert3_io_output;
  wire       [7:0]    inv_io_z_0;
  wire       [7:0]    inv_io_z_1;
  reg                 dummy;

  NewBasis convert0 (
    .io_input        (io_sbIn0[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert0_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert1 (
    .io_input        (io_sbIn1[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert1_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert2 (
    .io_input        (inv_io_z_0[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert2_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert3 (
    .io_input        (inv_io_z_1[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert3_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  G256Inv2Shares5Stages inv (
    .io_x_0    (convert0_io_output[7:0]  ), //i
    .io_x_1    (convert1_io_output[7:0]  ), //i
    .io_m      (io_m[27:0]               ), //i
    .io_z_0    (inv_io_z_0[7:0]          ), //o
    .io_z_1    (inv_io_z_1[7:0]          ), //o
    .clk       (clk                      ), //i
    .reset     (reset                    )  //i
  );
  assign io_sbOut0 = (convert2_io_output ^ 8'h63);
  assign io_sbOut1 = convert3_io_output;

endmodule

module G256Inv2Shares5Stages (
  input      [7:0]    io_x_0,
  input      [7:0]    io_x_1,
  input      [27:0]   io_m,
  output     [7:0]    io_z_0,
  output     [7:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [7:0]    mul1_io_m;
  wire       [3:0]    mul2_io_m;
  wire       [3:0]    mul3_io_m;
  wire       [3:0]    inv_io_x_0;
  wire       [3:0]    inv_io_x_1;
  wire       [11:0]   inv_io_m;
  wire       [3:0]    g16SqSc_2_io_t;
  wire       [3:0]    g16SqSc_3_io_t;
  wire       [3:0]    mul1_io_z_0;
  wire       [3:0]    mul1_io_z_1;
  wire       [3:0]    mul2_io_z_0;
  wire       [3:0]    mul2_io_z_1;
  wire       [3:0]    mul3_io_z_0;
  wire       [3:0]    mul3_io_z_1;
  wire       [3:0]    inv_io_z_0;
  wire       [3:0]    inv_io_z_1;
  wire       [3:0]    g16SqSc_2_io_x;
  wire       [3:0]    g16SqSc_3_io_x;
  wire       [3:0]    a_0;
  wire       [3:0]    a_1;
  wire       [3:0]    b_0;
  wire       [3:0]    b_1;
  wire       [3:0]    d_0;
  wire       [3:0]    d_1;
  wire       [3:0]    e_0;
  wire       [3:0]    e_1;
  wire       [3:0]    f_0;
  wire       [3:0]    f_1;
  wire       [3:0]    p_0;
  wire       [3:0]    p_1;
  wire       [3:0]    q_0;
  wire       [3:0]    q_1;
  reg        [3:0]    a1_0;
  reg        [3:0]    a1_1;
  reg        [3:0]    a2_0;
  reg        [3:0]    a2_1;
  reg        [3:0]    a3_0;
  reg        [3:0]    a3_1;
  reg        [3:0]    b1_0;
  reg        [3:0]    b1_1;
  reg        [3:0]    b2_0;
  reg        [3:0]    b2_1;
  reg        [3:0]    b3_0;
  reg        [3:0]    b3_1;
  reg        [3:0]    c_0;
  reg        [3:0]    c_1;

  G16Mul2SharesDepMul mul1 (
    .io_x_0    (a_0[3:0]          ), //i
    .io_x_1    (a_1[3:0]          ), //i
    .io_y_0    (b_0[3:0]          ), //i
    .io_y_1    (b_1[3:0]          ), //i
    .io_m      (mul1_io_m[7:0]    ), //i
    .io_z_0    (mul1_io_z_0[3:0]  ), //o
    .io_z_1    (mul1_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Mul2SharesIndepMul mul2 (
    .io_x_0    (b3_0[3:0]         ), //i
    .io_x_1    (b3_1[3:0]         ), //i
    .io_y_0    (f_0[3:0]          ), //i
    .io_y_1    (f_1[3:0]          ), //i
    .io_m      (mul2_io_m[3:0]    ), //i
    .io_z_0    (mul2_io_z_0[3:0]  ), //o
    .io_z_1    (mul2_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Mul2SharesIndepMul mul3 (
    .io_x_0    (a3_0[3:0]         ), //i
    .io_x_1    (a3_1[3:0]         ), //i
    .io_y_0    (f_0[3:0]          ), //i
    .io_y_1    (f_1[3:0]          ), //i
    .io_m      (mul3_io_m[3:0]    ), //i
    .io_z_0    (mul3_io_z_0[3:0]  ), //o
    .io_z_1    (mul3_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Inv2SharesDep inv (
    .io_x_0    (inv_io_x_0[3:0]  ), //i
    .io_x_1    (inv_io_x_1[3:0]  ), //i
    .io_m      (inv_io_m[11:0]   ), //i
    .io_z_0    (inv_io_z_0[3:0]  ), //o
    .io_z_1    (inv_io_z_1[3:0]  ), //o
    .clk       (clk              ), //i
    .reset     (reset            )  //i
  );
  G16SqSc g16SqSc_2 (
    .io_t    (g16SqSc_2_io_t[3:0]  ), //i
    .io_x    (g16SqSc_2_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_3 (
    .io_t    (g16SqSc_3_io_t[3:0]  ), //i
    .io_x    (g16SqSc_3_io_x[3:0]  )  //o
  );
  assign a_0 = io_x_0[7 : 4];
  assign b_0 = io_x_0[3 : 0];
  assign a_1 = io_x_1[7 : 4];
  assign b_1 = io_x_1[3 : 0];
  assign g16SqSc_2_io_t = (a_0 ^ b_0);
  assign g16SqSc_3_io_t = (a_1 ^ b_1);
  assign mul1_io_m = io_m[27 : 20];
  assign d_0 = mul1_io_z_0;
  assign d_1 = mul1_io_z_1;
  assign inv_io_x_0 = (c_0 ^ d_0);
  assign inv_io_x_1 = (c_1 ^ d_1);
  assign inv_io_m = io_m[19 : 8];
  assign f_0 = inv_io_z_0;
  assign f_1 = inv_io_z_1;
  assign mul2_io_m = io_m[7 : 4];
  assign p_0 = mul2_io_z_0;
  assign p_1 = mul2_io_z_1;
  assign mul3_io_m = io_m[3 : 0];
  assign q_0 = mul3_io_z_0;
  assign q_1 = mul3_io_z_1;
  assign io_z_0 = {p_0,q_0};
  assign io_z_1 = {p_1,q_1};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      a1_0 <= 4'b0000;
      a1_1 <= 4'b0000;
      a2_0 <= 4'b0000;
      a2_1 <= 4'b0000;
      a3_0 <= 4'b0000;
      a3_1 <= 4'b0000;
      b1_0 <= 4'b0000;
      b1_1 <= 4'b0000;
      b2_0 <= 4'b0000;
      b2_1 <= 4'b0000;
      b3_0 <= 4'b0000;
      b3_1 <= 4'b0000;
      c_0 <= 4'b0000;
      c_1 <= 4'b0000;
    end else begin
      a1_0 <= a_0;
      a2_0 <= a1_0;
      a3_0 <= a2_0;
      b1_0 <= b_0;
      b2_0 <= b1_0;
      b3_0 <= b2_0;
      a1_1 <= a_1;
      a2_1 <= a1_1;
      a3_1 <= a2_1;
      b1_1 <= b_1;
      b2_1 <= b1_1;
      b3_1 <= b2_1;
      c_0 <= g16SqSc_2_io_x;
      c_1 <= g16SqSc_3_io_x;
    end
  end


endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

module NewBasis (
  input      [7:0]    io_input,
  input               io_direction,
  output reg [7:0]    io_output,
  input               clk,
  input               reset
);

  wire                dummy;
  wire       [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  wire                when_NewBasis_l35;

  assign dummy = 1'b0;
  assign a = io_input;
  always @(*) begin
    b[7] = (((((a[7] ^ a[6]) ^ a[5]) ^ a[2]) ^ a[1]) ^ a[0]);
    b[6] = (((a[6] ^ a[5]) ^ a[4]) ^ a[0]);
    b[5] = (((a[6] ^ a[5]) ^ a[1]) ^ a[0]);
    b[4] = (((a[7] ^ a[6]) ^ a[5]) ^ a[0]);
    b[3] = ((((a[7] ^ a[4]) ^ a[3]) ^ a[1]) ^ a[0]);
    b[2] = a[0];
    b[1] = ((a[6] ^ a[5]) ^ a[0]);
    b[0] = ((((a[6] ^ a[3]) ^ a[2]) ^ a[1]) ^ a[0]);
  end

  always @(*) begin
    c[7] = (a[5] ^ a[3]);
    c[6] = (a[7] ^ a[3]);
    c[5] = (a[6] ^ a[0]);
    c[4] = ((a[7] ^ a[5]) ^ a[3]);
    c[3] = ((((a[7] ^ a[6]) ^ a[5]) ^ a[4]) ^ a[3]);
    c[2] = ((((a[6] ^ a[5]) ^ a[3]) ^ a[2]) ^ a[0]);
    c[1] = ((a[5] ^ a[4]) ^ a[1]);
    c[0] = ((a[6] ^ a[4]) ^ a[1]);
  end

  assign when_NewBasis_l35 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l35) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

//G16SqSc replaced by G16SqSc

module G16SqSc (
  input      [3:0]    io_t,
  output     [3:0]    io_x
);

  wire       [1:0]    square1_io_t;
  wire       [1:0]    square1_io_x;
  wire       [1:0]    square2_io_x;
  wire       [1:0]    scale_io_x;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    p;
  wire       [1:0]    q;

  G4Sq square1 (
    .io_t    (square1_io_t[1:0]  ), //i
    .io_x    (square1_io_x[1:0]  )  //o
  );
  G4Sq square2 (
    .io_t    (b[1:0]             ), //i
    .io_x    (square2_io_x[1:0]  )  //o
  );
  G4ScaleN2 scale (
    .io_t    (c[1:0]           ), //i
    .io_x    (scale_io_x[1:0]  )  //o
  );
  assign square1_io_t = (a ^ b);
  assign p = square1_io_x;
  assign c = square2_io_x;
  assign q = scale_io_x;
  assign a = io_t[3 : 2];
  assign b = io_t[1 : 0];
  assign io_x = {p,q};

endmodule

module G16Inv2SharesDep (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    mul1_io_m;
  wire       [3:0]    mul2_io_m;
  wire       [3:0]    mul3_io_m;
  wire       [1:0]    g4Sq_8_io_t;
  wire       [1:0]    g4Sq_9_io_t;
  wire       [1:0]    g4Sq_10_io_t;
  wire       [1:0]    g4Sq_11_io_t;
  wire       [1:0]    mul1_io_z_0;
  wire       [1:0]    mul1_io_z_1;
  wire       [1:0]    mul2_io_z_0;
  wire       [1:0]    mul2_io_z_1;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  wire       [1:0]    g4Sq_8_io_x;
  wire       [1:0]    g4ScaleN_16_io_x;
  wire       [1:0]    g4Sq_9_io_x;
  wire       [1:0]    g4Sq_10_io_x;
  wire       [1:0]    g4ScaleN_17_io_x;
  wire       [1:0]    g4Sq_11_io_x;
  wire       [1:0]    a_0;
  wire       [1:0]    a_1;
  wire       [1:0]    b_0;
  wire       [1:0]    b_1;
  wire       [1:0]    d_0;
  wire       [1:0]    d_1;
  wire       [1:0]    e_0;
  wire       [1:0]    e_1;
  wire       [1:0]    p_0;
  wire       [1:0]    p_1;
  wire       [1:0]    q_0;
  wire       [1:0]    q_1;
  reg        [1:0]    c_0;
  reg        [1:0]    c_1;
  reg        [1:0]    a1_0;
  reg        [1:0]    a1_1;
  reg        [1:0]    b1_0;
  reg        [1:0]    b1_1;

  G4Mul2SharesDepMul mul1 (
    .io_x_0    (a_0[1:0]          ), //i
    .io_x_1    (a_1[1:0]          ), //i
    .io_y_0    (b_0[1:0]          ), //i
    .io_y_1    (b_1[1:0]          ), //i
    .io_m      (mul1_io_m[3:0]    ), //i
    .io_z_0    (mul1_io_z_0[1:0]  ), //o
    .io_z_1    (mul1_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Mul2SharesDepMul mul2 (
    .io_x_0    (b1_0[1:0]         ), //i
    .io_x_1    (b1_1[1:0]         ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_m      (mul2_io_m[3:0]    ), //i
    .io_z_0    (mul2_io_z_0[1:0]  ), //o
    .io_z_1    (mul2_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Mul2SharesDepMul mul3 (
    .io_x_0    (a1_0[1:0]         ), //i
    .io_x_1    (a1_1[1:0]         ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_m      (mul3_io_m[3:0]    ), //i
    .io_z_0    (mul3_io_z_0[1:0]  ), //o
    .io_z_1    (mul3_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Sq g4Sq_8 (
    .io_t    (g4Sq_8_io_t[1:0]  ), //i
    .io_x    (g4Sq_8_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_16 (
    .io_t    (g4Sq_8_io_x[1:0]       ), //i
    .io_x    (g4ScaleN_16_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_9 (
    .io_t    (g4Sq_9_io_t[1:0]  ), //i
    .io_x    (g4Sq_9_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_10 (
    .io_t    (g4Sq_10_io_t[1:0]  ), //i
    .io_x    (g4Sq_10_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_17 (
    .io_t    (g4Sq_10_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_17_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_11 (
    .io_t    (g4Sq_11_io_t[1:0]  ), //i
    .io_x    (g4Sq_11_io_x[1:0]  )  //o
  );
  assign a_0 = io_x_0[3 : 2];
  assign b_0 = io_x_0[1 : 0];
  assign g4Sq_8_io_t = (a_0 ^ b_0);
  assign g4Sq_9_io_t = (c_0 ^ d_0);
  assign e_0 = g4Sq_9_io_x;
  assign a_1 = io_x_1[3 : 2];
  assign b_1 = io_x_1[1 : 0];
  assign g4Sq_10_io_t = (a_1 ^ b_1);
  assign g4Sq_11_io_t = (c_1 ^ d_1);
  assign e_1 = g4Sq_11_io_x;
  assign mul1_io_m = io_m[11 : 8];
  assign d_0 = mul1_io_z_0;
  assign d_1 = mul1_io_z_1;
  assign mul2_io_m = io_m[7 : 4];
  assign p_0 = mul2_io_z_0;
  assign p_1 = mul2_io_z_1;
  assign mul3_io_m = io_m[3 : 0];
  assign q_0 = mul3_io_z_0;
  assign q_1 = mul3_io_z_1;
  assign io_z_0 = {p_0,q_0};
  assign io_z_1 = {p_1,q_1};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      c_0 <= 2'b00;
      c_1 <= 2'b00;
      a1_0 <= 2'b00;
      a1_1 <= 2'b00;
      b1_0 <= 2'b00;
      b1_1 <= 2'b00;
    end else begin
      a1_0 <= a_0;
      b1_0 <= b_0;
      c_0 <= g4ScaleN_16_io_x;
      a1_1 <= a_1;
      b1_1 <= b_1;
      c_1 <= g4ScaleN_17_io_x;
    end
  end


endmodule

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

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

module G16Mul2SharesDepMul (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [7:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    g16Mul_14_io_b;
  wire       [3:0]    g16Mul_17_io_b;
  wire       [3:0]    g16Mul_14_io_x;
  wire       [3:0]    g16Mul_15_io_x;
  wire       [3:0]    g16Mul_16_io_x;
  wire       [3:0]    g16Mul_17_io_x;
  wire       [3:0]    g16Mul_18_io_x;
  wire       [3:0]    g16Mul_19_io_x;
  reg        [3:0]    xR_0;
  reg        [3:0]    xR_1;
  reg        [3:0]    yR_0;
  reg        [3:0]    yR_1;

  G16Mul g16Mul_14 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (g16Mul_14_io_b[3:0]  ), //i
    .io_x    (g16Mul_14_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_15 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (io_y_0[3:0]          ), //i
    .io_x    (g16Mul_15_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_16 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (yR_0[3:0]            ), //i
    .io_x    (g16Mul_16_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_17 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (g16Mul_17_io_b[3:0]  ), //i
    .io_x    (g16Mul_17_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_18 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (io_y_1[3:0]          ), //i
    .io_x    (g16Mul_18_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_19 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (yR_1[3:0]            ), //i
    .io_x    (g16Mul_19_io_x[3:0]  )  //o
  );
  assign g16Mul_14_io_b = io_m[7 : 4];
  assign io_z_0 = ((g16Mul_15_io_x ^ g16Mul_16_io_x) ^ xR_0);
  assign g16Mul_17_io_b = io_m[7 : 4];
  assign io_z_1 = ((g16Mul_18_io_x ^ g16Mul_19_io_x) ^ xR_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      xR_0 <= 4'b0000;
      xR_1 <= 4'b0000;
      yR_0 <= 4'b0000;
      yR_1 <= 4'b0000;
    end else begin
      yR_0 <= (io_y_1 ^ io_m[7 : 4]);
      yR_1 <= (io_y_0 ^ io_m[7 : 4]);
      xR_0 <= (g16Mul_14_io_x ^ io_m[3 : 0]);
      xR_1 <= (g16Mul_17_io_x ^ io_m[3 : 0]);
    end
  end


endmodule

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

module G4ScaleN2 (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {(io_t[1] ^ io_t[0]),io_t[1]};

endmodule

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

module G4Sq (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],io_t[1]};

endmodule

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

module G4Mul2SharesDepMul (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [3:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [1:0]    g4Mul_60_io_b;
  wire       [1:0]    g4Mul_63_io_b;
  wire       [1:0]    g4Mul_60_io_x;
  wire       [1:0]    g4Mul_61_io_x;
  wire       [1:0]    g4Mul_62_io_x;
  wire       [1:0]    g4Mul_63_io_x;
  wire       [1:0]    g4Mul_64_io_x;
  wire       [1:0]    g4Mul_65_io_x;
  reg        [1:0]    yRemasked_0;
  reg        [1:0]    yRemasked_1;
  reg        [1:0]    xRemasked_0;
  reg        [1:0]    xRemasked_1;

  G4Mul g4Mul_60 (
    .io_a    (io_x_0[1:0]         ), //i
    .io_b    (g4Mul_60_io_b[1:0]  ), //i
    .io_x    (g4Mul_60_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_61 (
    .io_a    (io_x_0[1:0]         ), //i
    .io_b    (io_y_0[1:0]         ), //i
    .io_x    (g4Mul_61_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_62 (
    .io_a    (yRemasked_0[1:0]    ), //i
    .io_b    (io_x_0[1:0]         ), //i
    .io_x    (g4Mul_62_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_63 (
    .io_a    (io_x_1[1:0]         ), //i
    .io_b    (g4Mul_63_io_b[1:0]  ), //i
    .io_x    (g4Mul_63_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_64 (
    .io_a    (io_x_1[1:0]         ), //i
    .io_b    (io_y_1[1:0]         ), //i
    .io_x    (g4Mul_64_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_65 (
    .io_a    (yRemasked_1[1:0]    ), //i
    .io_b    (io_x_1[1:0]         ), //i
    .io_x    (g4Mul_65_io_x[1:0]  )  //o
  );
  assign g4Mul_60_io_b = io_m[3 : 2];
  assign io_z_0 = ((g4Mul_61_io_x ^ g4Mul_62_io_x) ^ xRemasked_0);
  assign g4Mul_63_io_b = io_m[3 : 2];
  assign io_z_1 = ((g4Mul_64_io_x ^ g4Mul_65_io_x) ^ xRemasked_1);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      yRemasked_0 <= 2'b00;
      yRemasked_1 <= 2'b00;
      xRemasked_0 <= 2'b00;
      xRemasked_1 <= 2'b00;
    end else begin
      yRemasked_0 <= (io_y_1 ^ io_m[3 : 2]);
      yRemasked_1 <= (io_y_0 ^ io_m[3 : 2]);
      xRemasked_0 <= (g4Mul_60_io_x ^ io_m[1 : 0]);
      xRemasked_1 <= (g4Mul_63_io_x ^ io_m[1 : 0]);
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

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

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
