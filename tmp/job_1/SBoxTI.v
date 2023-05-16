// Generator : SpinalHDL v1.6.2    git head : 835dad6b10a4191c366f7748f775bd594b010510
// Component : SBoxTI
// Git hash  : 835dad6b10a4191c366f7748f775bd594b010510

`timescale 1ns/1ps 

module SBoxTI (
  input      [7:0]    io_SBoxIn_0,
  input      [7:0]    io_SBoxIn_1,
  input      [7:0]    io_SBoxIn_2,
  input      [47:0]   io_m,
  output     [7:0]    io_SBoxOut_0,
  output     [7:0]    io_SBoxOut_1,
  output     [7:0]    io_SBoxOut_2,
  input               clk,
  input               reset
);

  wire       [7:0]    inv_io_x_0;
  wire       [7:0]    inv_io_x_1;
  wire       [7:0]    inv_io_x_2;
  wire       [7:0]    newBasis_6_io_output;
  wire       [7:0]    newBasis_7_io_output;
  wire       [7:0]    newBasis_8_io_output;
  wire       [7:0]    newBasis_9_io_output;
  wire       [7:0]    newBasis_10_io_output;
  wire       [7:0]    newBasis_11_io_output;
  wire                dummy;

  G256InvTIRegRemasked inv (
    .io_t_0    (newBasis_6_io_output[7:0]  ), //i
    .io_t_1    (newBasis_7_io_output[7:0]  ), //i
    .io_t_2    (newBasis_8_io_output[7:0]  ), //i
    .io_m      (io_m[47:0]                 ), //i
    .io_x_0    (inv_io_x_0[7:0]            ), //o
    .io_x_1    (inv_io_x_1[7:0]            ), //o
    .io_x_2    (inv_io_x_2[7:0]            ), //o
    .clk       (clk                        ), //i
    .reset     (reset                      )  //i
  );
  NewBasis newBasis_6 (
    .io_input        (io_SBoxIn_0[7:0]           ), //i
    .io_direction    (1'b0                       ), //i
    .io_output       (newBasis_6_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis newBasis_7 (
    .io_input        (io_SBoxIn_1[7:0]           ), //i
    .io_direction    (1'b0                       ), //i
    .io_output       (newBasis_7_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis newBasis_8 (
    .io_input        (io_SBoxIn_2[7:0]           ), //i
    .io_direction    (1'b0                       ), //i
    .io_output       (newBasis_8_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis newBasis_9 (
    .io_input        (inv_io_x_0[7:0]            ), //i
    .io_direction    (1'b1                       ), //i
    .io_output       (newBasis_9_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis newBasis_10 (
    .io_input        (inv_io_x_1[7:0]             ), //i
    .io_direction    (1'b1                        ), //i
    .io_output       (newBasis_10_io_output[7:0]  ), //o
    .clk             (clk                         ), //i
    .reset           (reset                       )  //i
  );
  NewBasis newBasis_11 (
    .io_input        (inv_io_x_2[7:0]             ), //i
    .io_direction    (1'b1                        ), //i
    .io_output       (newBasis_11_io_output[7:0]  ), //o
    .clk             (clk                         ), //i
    .reset           (reset                       )  //i
  );
  assign dummy = 1'b0;
  assign io_SBoxOut_0 = (newBasis_9_io_output ^ 8'h63);
  assign io_SBoxOut_1 = (newBasis_10_io_output ^ 8'h63);
  assign io_SBoxOut_2 = (newBasis_11_io_output ^ 8'h63);

endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

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
  wire                when_NewBasis_l45;

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

  assign when_NewBasis_l45 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l45) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

module G256InvTIRegRemasked (
  input      [7:0]    io_t_0,
  input      [7:0]    io_t_1,
  input      [7:0]    io_t_2,
  input      [47:0]   io_m,
  output     [7:0]    io_x_0,
  output     [7:0]    io_x_1,
  output     [7:0]    io_x_2,
  input               clk,
  input               reset
);

  wire       [3:0]    e_io_m_0;
  wire       [3:0]    e_io_m_1;
  wire       [11:0]   mul1_io_m;
  wire       [3:0]    inv_io_a_0;
  wire       [3:0]    inv_io_a_1;
  wire       [3:0]    inv_io_a_2;
  wire       [3:0]    inv_io_m;
  wire       [11:0]   mul2_io_m;
  wire       [11:0]   mul3_io_m;
  wire       [3:0]    e_io_b_0;
  wire       [3:0]    e_io_b_1;
  wire       [3:0]    e_io_b_2;
  wire       [3:0]    g16SqSc_3_io_x;
  wire       [3:0]    g16SqSc_4_io_x;
  wire       [3:0]    g16SqSc_5_io_x;
  wire       [3:0]    mul1_io_c_0;
  wire       [3:0]    mul1_io_c_1;
  wire       [3:0]    mul1_io_c_2;
  wire       [3:0]    inv_io_b_0;
  wire       [3:0]    inv_io_b_1;
  wire       [3:0]    inv_io_b_2;
  wire       [3:0]    mul2_io_c_0;
  wire       [3:0]    mul2_io_c_1;
  wire       [3:0]    mul2_io_c_2;
  wire       [3:0]    mul3_io_c_0;
  wire       [3:0]    mul3_io_c_1;
  wire       [3:0]    mul3_io_c_2;
  wire       [3:0]    a_0;
  wire       [3:0]    a_1;
  wire       [3:0]    a_2;
  wire       [3:0]    b_0;
  wire       [3:0]    b_1;
  wire       [3:0]    b_2;
  wire       [3:0]    d_0;
  wire       [3:0]    d_1;
  wire       [3:0]    d_2;
  wire       [3:0]    f_0;
  wire       [3:0]    f_1;
  wire       [3:0]    f_2;
  wire       [3:0]    p_0;
  wire       [3:0]    p_1;
  wire       [3:0]    p_2;
  wire       [3:0]    q_0;
  wire       [3:0]    q_1;
  wire       [3:0]    q_2;
  reg        [3:0]    a1_0;
  reg        [3:0]    a1_1;
  reg        [3:0]    a1_2;
  reg        [3:0]    a2_0;
  reg        [3:0]    a2_1;
  reg        [3:0]    a2_2;
  reg        [3:0]    a3_0;
  reg        [3:0]    a3_1;
  reg        [3:0]    a3_2;
  reg        [3:0]    b1_0;
  reg        [3:0]    b1_1;
  reg        [3:0]    b1_2;
  reg        [3:0]    b2_0;
  reg        [3:0]    b2_1;
  reg        [3:0]    b2_2;
  reg        [3:0]    b3_0;
  reg        [3:0]    b3_1;
  reg        [3:0]    b3_2;
  reg        [3:0]    c_0;
  reg        [3:0]    c_1;
  reg        [3:0]    c_2;

  RemaskedRegister_10 e (
    .io_a_0    (inv_io_b_0[3:0]  ), //i
    .io_a_1    (inv_io_b_1[3:0]  ), //i
    .io_a_2    (inv_io_b_2[3:0]  ), //i
    .io_m_0    (e_io_m_0[3:0]    ), //i
    .io_m_1    (e_io_m_1[3:0]    ), //i
    .io_b_0    (e_io_b_0[3:0]    ), //o
    .io_b_1    (e_io_b_1[3:0]    ), //o
    .io_b_2    (e_io_b_2[3:0]    ), //o
    .clk       (clk              ), //i
    .reset     (reset            )  //i
  );
  G16SqSc g16SqSc_3 (
    .io_t    (f_0[3:0]             ), //i
    .io_x    (g16SqSc_3_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_4 (
    .io_t    (f_1[3:0]             ), //i
    .io_x    (g16SqSc_4_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_5 (
    .io_t    (f_2[3:0]             ), //i
    .io_x    (g16SqSc_5_io_x[3:0]  )  //o
  );
  G16MulTIRegRemask mul1 (
    .io_a_0    (a_0[3:0]          ), //i
    .io_a_1    (a_1[3:0]          ), //i
    .io_a_2    (a_2[3:0]          ), //i
    .io_b_0    (b_0[3:0]          ), //i
    .io_b_1    (b_1[3:0]          ), //i
    .io_b_2    (b_2[3:0]          ), //i
    .io_m      (mul1_io_m[11:0]   ), //i
    .io_c_0    (mul1_io_c_0[3:0]  ), //o
    .io_c_1    (mul1_io_c_1[3:0]  ), //o
    .io_c_2    (mul1_io_c_2[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16InvTIRegRemasked inv (
    .io_a_0    (inv_io_a_0[3:0]  ), //i
    .io_a_1    (inv_io_a_1[3:0]  ), //i
    .io_a_2    (inv_io_a_2[3:0]  ), //i
    .io_m      (inv_io_m[3:0]    ), //i
    .io_b_0    (inv_io_b_0[3:0]  ), //o
    .io_b_1    (inv_io_b_1[3:0]  ), //o
    .io_b_2    (inv_io_b_2[3:0]  ), //o
    .clk       (clk              ), //i
    .reset     (reset            )  //i
  );
  G16MulTIRegRemask mul2 (
    .io_a_0    (a3_0[3:0]         ), //i
    .io_a_1    (a3_1[3:0]         ), //i
    .io_a_2    (a3_2[3:0]         ), //i
    .io_b_0    (e_io_b_0[3:0]     ), //i
    .io_b_1    (e_io_b_1[3:0]     ), //i
    .io_b_2    (e_io_b_2[3:0]     ), //i
    .io_m      (mul2_io_m[11:0]   ), //i
    .io_c_0    (mul2_io_c_0[3:0]  ), //o
    .io_c_1    (mul2_io_c_1[3:0]  ), //o
    .io_c_2    (mul2_io_c_2[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16MulTIRegRemask mul3 (
    .io_a_0    (b3_0[3:0]         ), //i
    .io_a_1    (b3_1[3:0]         ), //i
    .io_a_2    (b3_2[3:0]         ), //i
    .io_b_0    (e_io_b_0[3:0]     ), //i
    .io_b_1    (e_io_b_1[3:0]     ), //i
    .io_b_2    (e_io_b_2[3:0]     ), //i
    .io_m      (mul3_io_m[11:0]   ), //i
    .io_c_0    (mul3_io_c_0[3:0]  ), //o
    .io_c_1    (mul3_io_c_1[3:0]  ), //o
    .io_c_2    (mul3_io_c_2[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  assign e_io_m_0 = io_m[7 : 4];
  assign e_io_m_1 = io_m[3 : 0];
  assign a_0 = io_t_0[7 : 4];
  assign b_0 = io_t_0[3 : 0];
  assign a_1 = io_t_1[7 : 4];
  assign b_1 = io_t_1[3 : 0];
  assign a_2 = io_t_2[7 : 4];
  assign b_2 = io_t_2[3 : 0];
  assign f_0 = (a_0 ^ b_0);
  assign f_1 = (a_1 ^ b_1);
  assign f_2 = (a_2 ^ b_2);
  assign mul1_io_m = io_m[47 : 36];
  assign d_0 = mul1_io_c_0;
  assign d_1 = mul1_io_c_1;
  assign d_2 = mul1_io_c_2;
  assign inv_io_m = io_m[11 : 8];
  assign inv_io_a_0 = (c_0 ^ d_0);
  assign inv_io_a_1 = (c_1 ^ d_1);
  assign inv_io_a_2 = (c_2 ^ d_2);
  assign mul2_io_m = io_m[35 : 24];
  assign q_0 = mul2_io_c_0;
  assign q_1 = mul2_io_c_1;
  assign q_2 = mul2_io_c_2;
  assign mul3_io_m = io_m[23 : 12];
  assign p_0 = mul3_io_c_0;
  assign p_1 = mul3_io_c_1;
  assign p_2 = mul3_io_c_2;
  assign io_x_0 = {p_0,q_0};
  assign io_x_1 = {p_1,q_1};
  assign io_x_2 = {p_2,q_2};
  always @(posedge clk) begin
    a1_0 <= a_0;
    b1_0 <= b_0;
    a1_1 <= a_1;
    b1_1 <= b_1;
    a1_2 <= a_2;
    b1_2 <= b_2;
    c_0 <= g16SqSc_3_io_x;
    c_1 <= g16SqSc_4_io_x;
    c_2 <= g16SqSc_5_io_x;
    a2_0 <= a1_0;
    a2_1 <= a1_1;
    a2_2 <= a1_2;
    a3_0 <= a2_0;
    a3_1 <= a2_1;
    a3_2 <= a2_2;
    b2_0 <= b1_0;
    b2_1 <= b1_1;
    b2_2 <= b1_2;
    b3_0 <= b2_0;
    b3_1 <= b2_1;
    b3_2 <= b2_2;
  end


endmodule

//G16MulTIRegRemask replaced by G16MulTIRegRemask

//G16MulTIRegRemask replaced by G16MulTIRegRemask

module G16InvTIRegRemasked (
  input      [3:0]    io_a_0,
  input      [3:0]    io_a_1,
  input      [3:0]    io_a_2,
  input      [3:0]    io_m,
  output     [3:0]    io_b_0,
  output     [3:0]    io_b_1,
  output     [3:0]    io_b_2,
  input               clk,
  input               reset
);

  wire       [1:0]    d_io_m_0;
  wire       [1:0]    d_io_m_1;
  wire       [1:0]    g4Sq_12_io_t;
  wire       [1:0]    g4Sq_13_io_t;
  wire       [1:0]    g4Sq_14_io_t;
  wire       [1:0]    g4Sq_15_io_t;
  wire       [1:0]    g4Sq_16_io_t;
  wire       [1:0]    g4Sq_17_io_t;
  wire       [1:0]    d_io_b_0;
  wire       [1:0]    d_io_b_1;
  wire       [1:0]    d_io_b_2;
  wire       [1:0]    g4ScaleN_12_io_x;
  wire       [1:0]    g4Sq_12_io_x;
  wire       [1:0]    g4ScaleN_13_io_x;
  wire       [1:0]    g4Sq_13_io_x;
  wire       [1:0]    g4ScaleN_14_io_x;
  wire       [1:0]    g4Sq_14_io_x;
  wire       [1:0]    mul1_io_z_0;
  wire       [1:0]    mul1_io_z_1;
  wire       [1:0]    mul1_io_z_2;
  wire       [1:0]    mul2_io_z_0;
  wire       [1:0]    mul2_io_z_1;
  wire       [1:0]    mul2_io_z_2;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  wire       [1:0]    mul3_io_z_2;
  wire       [1:0]    g4Sq_15_io_x;
  wire       [1:0]    g4Sq_16_io_x;
  wire       [1:0]    g4Sq_17_io_x;
  wire       [1:0]    a_0;
  wire       [1:0]    a_1;
  wire       [1:0]    a_2;
  wire       [1:0]    b_0;
  wire       [1:0]    b_1;
  wire       [1:0]    b_2;
  wire       [1:0]    f_0;
  wire       [1:0]    f_1;
  wire       [1:0]    f_2;
  wire       [1:0]    e_0;
  wire       [1:0]    e_1;
  wire       [1:0]    e_2;
  wire       [1:0]    p_0;
  wire       [1:0]    p_1;
  wire       [1:0]    p_2;
  wire       [1:0]    q_0;
  wire       [1:0]    q_1;
  wire       [1:0]    q_2;
  reg        [1:0]    aReg_0;
  reg        [1:0]    aReg_1;
  reg        [1:0]    aReg_2;
  reg        [1:0]    bReg_0;
  reg        [1:0]    bReg_1;
  reg        [1:0]    bReg_2;
  reg        [1:0]    c_0;
  reg        [1:0]    c_1;
  reg        [1:0]    c_2;

  RemaskedRegister d (
    .io_a_0    (mul1_io_z_0[1:0]  ), //i
    .io_a_1    (mul1_io_z_1[1:0]  ), //i
    .io_a_2    (mul1_io_z_2[1:0]  ), //i
    .io_m_0    (d_io_m_0[1:0]     ), //i
    .io_m_1    (d_io_m_1[1:0]     ), //i
    .io_b_0    (d_io_b_0[1:0]     ), //o
    .io_b_1    (d_io_b_1[1:0]     ), //o
    .io_b_2    (d_io_b_2[1:0]     ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4ScaleN g4ScaleN_12 (
    .io_t    (g4Sq_12_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_12_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_12 (
    .io_t    (g4Sq_12_io_t[1:0]  ), //i
    .io_x    (g4Sq_12_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_13 (
    .io_t    (g4Sq_13_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_13_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_13 (
    .io_t    (g4Sq_13_io_t[1:0]  ), //i
    .io_x    (g4Sq_13_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_14 (
    .io_t    (g4Sq_14_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_14_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_14 (
    .io_t    (g4Sq_14_io_t[1:0]  ), //i
    .io_x    (g4Sq_14_io_x[1:0]  )  //o
  );
  G4MulTIMasked3 mul1 (
    .io_x_0    (a_0[1:0]          ), //i
    .io_x_1    (a_1[1:0]          ), //i
    .io_x_2    (a_2[1:0]          ), //i
    .io_y_0    (b_0[1:0]          ), //i
    .io_y_1    (b_1[1:0]          ), //i
    .io_y_2    (b_2[1:0]          ), //i
    .io_z_0    (mul1_io_z_0[1:0]  ), //o
    .io_z_1    (mul1_io_z_1[1:0]  ), //o
    .io_z_2    (mul1_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4MulTIMasked3 mul2 (
    .io_x_0    (bReg_0[1:0]       ), //i
    .io_x_1    (bReg_1[1:0]       ), //i
    .io_x_2    (bReg_2[1:0]       ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_y_2    (e_2[1:0]          ), //i
    .io_z_0    (mul2_io_z_0[1:0]  ), //o
    .io_z_1    (mul2_io_z_1[1:0]  ), //o
    .io_z_2    (mul2_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4MulTIMasked3 mul3 (
    .io_x_0    (aReg_0[1:0]       ), //i
    .io_x_1    (aReg_1[1:0]       ), //i
    .io_x_2    (aReg_2[1:0]       ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_y_2    (e_2[1:0]          ), //i
    .io_z_0    (mul3_io_z_0[1:0]  ), //o
    .io_z_1    (mul3_io_z_1[1:0]  ), //o
    .io_z_2    (mul3_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Sq g4Sq_15 (
    .io_t    (g4Sq_15_io_t[1:0]  ), //i
    .io_x    (g4Sq_15_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_16 (
    .io_t    (g4Sq_16_io_t[1:0]  ), //i
    .io_x    (g4Sq_16_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_17 (
    .io_t    (g4Sq_17_io_t[1:0]  ), //i
    .io_x    (g4Sq_17_io_x[1:0]  )  //o
  );
  assign d_io_m_0 = io_m[3 : 2];
  assign d_io_m_1 = io_m[1 : 0];
  assign a_0 = io_a_0[3 : 2];
  assign b_0 = io_a_0[1 : 0];
  assign a_1 = io_a_1[3 : 2];
  assign b_1 = io_a_1[1 : 0];
  assign a_2 = io_a_2[3 : 2];
  assign b_2 = io_a_2[1 : 0];
  assign g4Sq_12_io_t = (a_0 ^ b_0);
  assign g4Sq_13_io_t = (a_1 ^ b_1);
  assign g4Sq_14_io_t = (a_2 ^ b_2);
  assign g4Sq_15_io_t = (c_0 ^ d_io_b_0);
  assign e_0 = g4Sq_15_io_x;
  assign g4Sq_16_io_t = (c_1 ^ d_io_b_1);
  assign e_1 = g4Sq_16_io_x;
  assign g4Sq_17_io_t = (c_2 ^ d_io_b_2);
  assign e_2 = g4Sq_17_io_x;
  assign p_0 = mul2_io_z_0;
  assign p_1 = mul2_io_z_1;
  assign p_2 = mul2_io_z_2;
  assign q_0 = mul3_io_z_0;
  assign q_1 = mul3_io_z_1;
  assign q_2 = mul3_io_z_2;
  assign io_b_0 = {p_0,q_0};
  assign io_b_1 = {p_1,q_1};
  assign io_b_2 = {p_2,q_2};
  always @(posedge clk) begin
    aReg_0 <= io_a_0[3 : 2];
    bReg_0 <= io_a_0[1 : 0];
    aReg_1 <= io_a_1[3 : 2];
    bReg_1 <= io_a_1[1 : 0];
    aReg_2 <= io_a_2[3 : 2];
    bReg_2 <= io_a_2[1 : 0];
    c_0 <= g4ScaleN_12_io_x;
    c_1 <= g4ScaleN_13_io_x;
    c_2 <= g4ScaleN_14_io_x;
  end


endmodule

module G16MulTIRegRemask (
  input      [3:0]    io_a_0,
  input      [3:0]    io_a_1,
  input      [3:0]    io_a_2,
  input      [3:0]    io_b_0,
  input      [3:0]    io_b_1,
  input      [3:0]    io_b_2,
  input      [11:0]   io_m,
  output     [3:0]    io_c_0,
  output     [3:0]    io_c_1,
  output     [3:0]    io_c_2,
  input               clk,
  input               reset
);

  wire       [1:0]    e_io_m_0;
  wire       [1:0]    e_io_m_1;
  wire       [1:0]    g_io_m_0;
  wire       [1:0]    g_io_m_1;
  wire       [1:0]    h_io_m_0;
  wire       [1:0]    h_io_m_1;
  wire       [1:0]    mul1_io_x_0;
  wire       [1:0]    mul1_io_x_1;
  wire       [1:0]    mul1_io_x_2;
  wire       [1:0]    mul1_io_y_0;
  wire       [1:0]    mul1_io_y_1;
  wire       [1:0]    mul1_io_y_2;
  wire       [1:0]    e_io_b_0;
  wire       [1:0]    e_io_b_1;
  wire       [1:0]    e_io_b_2;
  wire       [1:0]    g_io_b_0;
  wire       [1:0]    g_io_b_1;
  wire       [1:0]    g_io_b_2;
  wire       [1:0]    h_io_b_0;
  wire       [1:0]    h_io_b_1;
  wire       [1:0]    h_io_b_2;
  wire       [1:0]    mul1_io_z_0;
  wire       [1:0]    mul1_io_z_1;
  wire       [1:0]    mul1_io_z_2;
  wire       [1:0]    mul2_io_z_0;
  wire       [1:0]    mul2_io_z_1;
  wire       [1:0]    mul2_io_z_2;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  wire       [1:0]    mul3_io_z_2;
  wire       [1:0]    g4ScaleN_12_io_x;
  wire       [1:0]    g4ScaleN_13_io_x;
  wire       [1:0]    g4ScaleN_14_io_x;
  wire       [1:0]    a_0;
  wire       [1:0]    a_1;
  wire       [1:0]    a_2;
  wire       [1:0]    b_0;
  wire       [1:0]    b_1;
  wire       [1:0]    b_2;
  wire       [1:0]    c_0;
  wire       [1:0]    c_1;
  wire       [1:0]    c_2;
  wire       [1:0]    d_0;
  wire       [1:0]    d_1;
  wire       [1:0]    d_2;
  wire       [1:0]    f_0;
  wire       [1:0]    f_1;
  wire       [1:0]    f_2;
  wire       [1:0]    p_0;
  wire       [1:0]    p_1;
  wire       [1:0]    p_2;
  wire       [1:0]    q_0;
  wire       [1:0]    q_1;
  wire       [1:0]    q_2;

  RemaskedRegister e (
    .io_a_0    (mul1_io_z_0[1:0]  ), //i
    .io_a_1    (mul1_io_z_1[1:0]  ), //i
    .io_a_2    (mul1_io_z_2[1:0]  ), //i
    .io_m_0    (e_io_m_0[1:0]     ), //i
    .io_m_1    (e_io_m_1[1:0]     ), //i
    .io_b_0    (e_io_b_0[1:0]     ), //o
    .io_b_1    (e_io_b_1[1:0]     ), //o
    .io_b_2    (e_io_b_2[1:0]     ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  RemaskedRegister g (
    .io_a_0    (mul2_io_z_0[1:0]  ), //i
    .io_a_1    (mul2_io_z_1[1:0]  ), //i
    .io_a_2    (mul2_io_z_2[1:0]  ), //i
    .io_m_0    (g_io_m_0[1:0]     ), //i
    .io_m_1    (g_io_m_1[1:0]     ), //i
    .io_b_0    (g_io_b_0[1:0]     ), //o
    .io_b_1    (g_io_b_1[1:0]     ), //o
    .io_b_2    (g_io_b_2[1:0]     ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  RemaskedRegister h (
    .io_a_0    (mul3_io_z_0[1:0]  ), //i
    .io_a_1    (mul3_io_z_1[1:0]  ), //i
    .io_a_2    (mul3_io_z_2[1:0]  ), //i
    .io_m_0    (h_io_m_0[1:0]     ), //i
    .io_m_1    (h_io_m_1[1:0]     ), //i
    .io_b_0    (h_io_b_0[1:0]     ), //o
    .io_b_1    (h_io_b_1[1:0]     ), //o
    .io_b_2    (h_io_b_2[1:0]     ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4MulTIMasked3 mul1 (
    .io_x_0    (mul1_io_x_0[1:0]  ), //i
    .io_x_1    (mul1_io_x_1[1:0]  ), //i
    .io_x_2    (mul1_io_x_2[1:0]  ), //i
    .io_y_0    (mul1_io_y_0[1:0]  ), //i
    .io_y_1    (mul1_io_y_1[1:0]  ), //i
    .io_y_2    (mul1_io_y_2[1:0]  ), //i
    .io_z_0    (mul1_io_z_0[1:0]  ), //o
    .io_z_1    (mul1_io_z_1[1:0]  ), //o
    .io_z_2    (mul1_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4MulTIMasked3 mul2 (
    .io_x_0    (a_0[1:0]          ), //i
    .io_x_1    (a_1[1:0]          ), //i
    .io_x_2    (a_2[1:0]          ), //i
    .io_y_0    (c_0[1:0]          ), //i
    .io_y_1    (c_1[1:0]          ), //i
    .io_y_2    (c_2[1:0]          ), //i
    .io_z_0    (mul2_io_z_0[1:0]  ), //o
    .io_z_1    (mul2_io_z_1[1:0]  ), //o
    .io_z_2    (mul2_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4MulTIMasked3 mul3 (
    .io_x_0    (b_0[1:0]          ), //i
    .io_x_1    (b_1[1:0]          ), //i
    .io_x_2    (b_2[1:0]          ), //i
    .io_y_0    (d_0[1:0]          ), //i
    .io_y_1    (d_1[1:0]          ), //i
    .io_y_2    (d_2[1:0]          ), //i
    .io_z_0    (mul3_io_z_0[1:0]  ), //o
    .io_z_1    (mul3_io_z_1[1:0]  ), //o
    .io_z_2    (mul3_io_z_2[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4ScaleN g4ScaleN_12 (
    .io_t    (e_io_b_0[1:0]          ), //i
    .io_x    (g4ScaleN_12_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_13 (
    .io_t    (e_io_b_1[1:0]          ), //i
    .io_x    (g4ScaleN_13_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_14 (
    .io_t    (e_io_b_2[1:0]          ), //i
    .io_x    (g4ScaleN_14_io_x[1:0]  )  //o
  );
  assign e_io_m_0 = io_m[11 : 10];
  assign e_io_m_1 = io_m[9 : 8];
  assign g_io_m_0 = io_m[7 : 6];
  assign g_io_m_1 = io_m[5 : 4];
  assign h_io_m_0 = io_m[3 : 2];
  assign h_io_m_1 = io_m[1 : 0];
  assign a_0 = io_a_0[3 : 2];
  assign b_0 = io_a_0[1 : 0];
  assign c_0 = io_b_0[3 : 2];
  assign d_0 = io_b_0[1 : 0];
  assign a_1 = io_a_1[3 : 2];
  assign b_1 = io_a_1[1 : 0];
  assign c_1 = io_b_1[3 : 2];
  assign d_1 = io_b_1[1 : 0];
  assign a_2 = io_a_2[3 : 2];
  assign b_2 = io_a_2[1 : 0];
  assign c_2 = io_b_2[3 : 2];
  assign d_2 = io_b_2[1 : 0];
  assign mul1_io_x_0 = (a_0 ^ b_0);
  assign mul1_io_y_0 = (c_0 ^ d_0);
  assign mul1_io_x_1 = (a_1 ^ b_1);
  assign mul1_io_y_1 = (c_1 ^ d_1);
  assign mul1_io_x_2 = (a_2 ^ b_2);
  assign mul1_io_y_2 = (c_2 ^ d_2);
  assign f_0 = g4ScaleN_12_io_x;
  assign f_1 = g4ScaleN_13_io_x;
  assign f_2 = g4ScaleN_14_io_x;
  assign p_0 = (g_io_b_0 ^ f_0);
  assign q_0 = (h_io_b_0 ^ f_0);
  assign io_c_0 = {p_0,q_0};
  assign p_1 = (g_io_b_1 ^ f_1);
  assign q_1 = (h_io_b_1 ^ f_1);
  assign io_c_1 = {p_1,q_1};
  assign p_2 = (g_io_b_2 ^ f_2);
  assign q_2 = (h_io_b_2 ^ f_2);
  assign io_c_2 = {p_2,q_2};

endmodule

//G16SqSc replaced by G16SqSc

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

module RemaskedRegister_10 (
  input      [3:0]    io_a_0,
  input      [3:0]    io_a_1,
  input      [3:0]    io_a_2,
  input      [3:0]    io_m_0,
  input      [3:0]    io_m_1,
  output     [3:0]    io_b_0,
  output     [3:0]    io_b_1,
  output     [3:0]    io_b_2,
  input               clk,
  input               reset
);

  reg        [3:0]    a_0;
  reg        [3:0]    a_1;
  reg        [3:0]    a_2;
  reg        [3:0]    m;

  assign io_b_0 = (a_0 ^ m);
  assign io_b_1 = a_1;
  assign io_b_2 = a_2;
  always @(posedge clk) begin
    a_0 <= io_a_0;
    a_1 <= (io_a_1 ^ io_m_0);
    a_2 <= (io_a_2 ^ io_m_1);
    m <= (io_m_0 ^ io_m_1);
  end


endmodule

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//RemaskedRegister replaced by RemaskedRegister

//RemaskedRegister replaced by RemaskedRegister

//RemaskedRegister replaced by RemaskedRegister

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//RemaskedRegister replaced by RemaskedRegister

//RemaskedRegister replaced by RemaskedRegister

//RemaskedRegister replaced by RemaskedRegister

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//RemaskedRegister replaced by RemaskedRegister

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

module G4ScaleN (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],(io_t[1] ^ io_t[0])};

endmodule

//G4MulTIMasked3 replaced by G4MulTIMasked3

//G4MulTIMasked3 replaced by G4MulTIMasked3

module G4MulTIMasked3 (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_x_2,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [1:0]    io_y_2,
  output reg [1:0]    io_z_0,
  output reg [1:0]    io_z_1,
  output reg [1:0]    io_z_2,
  input               clk,
  input               reset
);

  wire                dummy;
  wire                a1;
  wire                a2;
  wire                a3;
  wire                b1;
  wire                b2;
  wire                b3;
  wire                c1;
  wire                c2;
  wire                c3;
  wire                d1;
  wire                d2;
  wire                d3;
  wire                e1;
  wire                e2;
  wire                e3;
  wire                f1;
  wire                f2;
  wire                f3;
  wire                a1c1;
  wire                a1c2;
  wire                a1c3;
  wire                a1d1;
  wire                a1d2;
  wire                a1d3;
  wire                a2c1;
  wire                a2c2;
  wire                a2c3;
  wire                a2d1;
  wire                a2d2;
  wire                a2d3;
  wire                a3c1;
  wire                a3c2;
  wire                a3c3;
  wire                a3d1;
  wire                a3d2;
  wire                a3d3;
  wire                b1c1;
  wire                b1c2;
  wire                b1c3;
  wire                b1d1;
  wire                b1d2;
  wire                b1d3;
  wire                b2c1;
  wire                b2c2;
  wire                b2c3;
  wire                b2d1;
  wire                b2d2;
  wire                b2d3;
  wire                b3c1;
  wire                b3c2;
  wire                b3c3;
  wire                b3d1;
  wire                b3d2;
  wire                b3d3;
  wire                a_0;
  wire                a_1;
  wire                a_2;
  wire                b_0;
  wire                b_1;
  wire                b_2;
  wire                c_0;
  wire                c_1;
  wire                c_2;
  wire                d_0;
  wire                d_1;
  wire                d_2;
  wire                ac_0;
  wire                ac_1;
  wire                ac_2;
  wire                ac_3;
  wire                ac_4;
  wire                ac_5;
  wire                ac_6;
  wire                ac_7;
  wire                ac_8;
  wire                ad_0;
  wire                ad_1;
  wire                ad_2;
  wire                ad_3;
  wire                ad_4;
  wire                ad_5;
  wire                ad_6;
  wire                ad_7;
  wire                ad_8;
  wire                bc_0;
  wire                bc_1;
  wire                bc_2;
  wire                bc_3;
  wire                bc_4;
  wire                bc_5;
  wire                bc_6;
  wire                bc_7;
  wire                bc_8;
  wire                bd_0;
  wire                bd_1;
  wire                bd_2;
  wire                bd_3;
  wire                bd_4;
  wire                bd_5;
  wire                bd_6;
  wire                bd_7;
  wire                bd_8;

  assign dummy = 1'b0;
  assign a_0 = io_x_0[1];
  assign b_0 = io_x_0[0];
  assign c_0 = io_y_0[1];
  assign d_0 = io_y_0[0];
  assign a_1 = io_x_1[1];
  assign b_1 = io_x_1[0];
  assign c_1 = io_y_1[1];
  assign d_1 = io_y_1[0];
  assign a_2 = io_x_2[1];
  assign b_2 = io_x_2[0];
  assign c_2 = io_y_2[1];
  assign d_2 = io_y_2[0];
  assign ac_0 = (a_0 && c_0);
  assign ad_0 = (a_0 && d_0);
  assign bc_0 = (b_0 && c_0);
  assign bd_0 = (b_0 && d_0);
  assign ac_1 = (a_0 && c_1);
  assign ad_1 = (a_0 && d_1);
  assign bc_1 = (b_0 && c_1);
  assign bd_1 = (b_0 && d_1);
  assign ac_2 = (a_0 && c_2);
  assign ad_2 = (a_0 && d_2);
  assign bc_2 = (b_0 && c_2);
  assign bd_2 = (b_0 && d_2);
  assign ac_3 = (a_1 && c_0);
  assign ad_3 = (a_1 && d_0);
  assign bc_3 = (b_1 && c_0);
  assign bd_3 = (b_1 && d_0);
  assign ac_4 = (a_1 && c_1);
  assign ad_4 = (a_1 && d_1);
  assign bc_4 = (b_1 && c_1);
  assign bd_4 = (b_1 && d_1);
  assign ac_5 = (a_1 && c_2);
  assign ad_5 = (a_1 && d_2);
  assign bc_5 = (b_1 && c_2);
  assign bd_5 = (b_1 && d_2);
  assign ac_6 = (a_2 && c_0);
  assign ad_6 = (a_2 && d_0);
  assign bc_6 = (b_2 && c_0);
  assign bd_6 = (b_2 && d_0);
  assign ac_7 = (a_2 && c_1);
  assign ad_7 = (a_2 && d_1);
  assign bc_7 = (b_2 && c_1);
  assign bd_7 = (b_2 && d_1);
  assign ac_8 = (a_2 && c_2);
  assign ad_8 = (a_2 && d_2);
  assign bc_8 = (b_2 && c_2);
  assign bd_8 = (b_2 && d_2);
  assign a1 = io_x_0[1];
  assign a2 = io_x_1[1];
  assign a3 = io_x_2[1];
  assign b1 = io_x_0[0];
  assign b2 = io_x_1[0];
  assign b3 = io_x_2[0];
  assign c1 = io_y_0[1];
  assign c2 = io_y_1[1];
  assign c3 = io_y_2[1];
  assign d1 = io_y_0[0];
  assign d2 = io_y_1[0];
  assign d3 = io_y_2[0];
  assign a1c1 = (a1 && c1);
  assign a1c2 = (a1 && c2);
  assign a1c3 = (a1 && c3);
  assign a1d1 = (a1 && d1);
  assign a1d2 = (a1 && d2);
  assign a1d3 = (a1 && d3);
  assign a2c1 = (a2 && c1);
  assign a2c2 = (a2 && c2);
  assign a2c3 = (a2 && c3);
  assign a2d1 = (a2 && d1);
  assign a2d2 = (a2 && d2);
  assign a2d3 = (a2 && d3);
  assign a3c1 = (a3 && c1);
  assign a3c2 = (a3 && c2);
  assign a3c3 = (a3 && c3);
  assign a3d1 = (a3 && d1);
  assign a3d2 = (a3 && d2);
  assign a3d3 = (a3 && d3);
  assign b1c1 = (b1 && c1);
  assign b1c2 = (b1 && c2);
  assign b1c3 = (b1 && c3);
  assign b1d1 = (b1 && d1);
  assign b1d2 = (b1 && d2);
  assign b1d3 = (b1 && d3);
  assign b2c1 = (b2 && c1);
  assign b2c2 = (b2 && c2);
  assign b2c3 = (b2 && c3);
  assign b2d1 = (b2 && d1);
  assign b2d2 = (b2 && d2);
  assign b2d3 = (b2 && d3);
  assign b3c1 = (b3 && c1);
  assign b3c2 = (b3 && c2);
  assign b3c3 = (b3 && c3);
  assign b3d1 = (b3 && d1);
  assign b3d2 = (b3 && d2);
  assign b3d3 = (b3 && d3);
  assign e1 = ((((((((((((ad_4 ^ ad_5) ^ ad_7) ^ bc_4) ^ bc_5) ^ bc_7) ^ bd_4) ^ bd_5) ^ bd_7) ^ a_2) ^ bc_4) ^ bc_8) ^ ac_4);
  assign e2 = ((((((((((((((ad_2 ^ ad_6) ^ ad_8) ^ bc_2) ^ bc_6) ^ bc_8) ^ bd_2) ^ bd_6) ^ bd_8) ^ a_0) ^ a_2) ^ d_0) ^ bc_0) ^ bc_8) ^ ad_0);
  assign e3 = ((((((((((((((ad_0 ^ ad_1) ^ ad_3) ^ bc_0) ^ bc_1) ^ bc_3) ^ bd_0) ^ bd_1) ^ bd_3) ^ a_0) ^ d_0) ^ bc_0) ^ bc_4) ^ ac_4) ^ ad_0);
  assign f1 = ((((((((((((((ac_4 ^ ac_5) ^ ac_7) ^ a2d2) ^ a2d3) ^ a3d2) ^ b2c2) ^ b2c3) ^ b3c2) ^ c_2) ^ d_2) ^ ac_4) ^ ac_8) ^ bd_4) ^ bd_8);
  assign f2 = (((((((((((((ac_2 ^ ad_2) ^ ac_6) ^ ac_8) ^ ad_6) ^ ad_8) ^ bc_2) ^ bc_6) ^ bc_8) ^ c_2) ^ d_2) ^ ac_8) ^ bd_8) ^ bd_0);
  assign f3 = (((((((((((ac_0 ^ ac_1) ^ a1d1) ^ a1d2) ^ ac_3) ^ a2d1) ^ b1c1) ^ b1c2) ^ b2c1) ^ a2c2) ^ b2d2) ^ b1d1);
  always @(*) begin
    io_z_0[1] = e1;
    io_z_0[0] = f1;
  end

  always @(*) begin
    io_z_1[1] = e2;
    io_z_1[0] = f2;
  end

  always @(*) begin
    io_z_2[1] = e3;
    io_z_2[0] = f3;
  end


endmodule

//RemaskedRegister replaced by RemaskedRegister

//RemaskedRegister replaced by RemaskedRegister

module RemaskedRegister (
  input      [1:0]    io_a_0,
  input      [1:0]    io_a_1,
  input      [1:0]    io_a_2,
  input      [1:0]    io_m_0,
  input      [1:0]    io_m_1,
  output     [1:0]    io_b_0,
  output     [1:0]    io_b_1,
  output     [1:0]    io_b_2,
  input               clk,
  input               reset
);

  reg        [1:0]    a_0;
  reg        [1:0]    a_1;
  reg        [1:0]    a_2;
  reg        [1:0]    m;

  assign io_b_0 = (a_0 ^ m);
  assign io_b_1 = a_1;
  assign io_b_2 = a_2;
  always @(posedge clk) begin
    a_0 <= io_a_0;
    a_1 <= (io_a_1 ^ io_m_0);
    a_2 <= (io_a_2 ^ io_m_1);
    m <= (io_m_0 ^ io_m_1);
  end


endmodule

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

module G4Sq (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],io_t[1]};

endmodule
