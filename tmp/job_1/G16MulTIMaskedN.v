// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : G16MulTIMaskedN
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module G16MulTIMaskedN (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_x_2,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_y_2,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  output     [3:0]    io_z_2,
  input               clk,
  input               reset
);

  wire       [1:0]    mul1_io_x_0;
  wire       [1:0]    mul1_io_x_1;
  wire       [1:0]    mul1_io_x_2;
  wire       [1:0]    mul1_io_y_0;
  wire       [1:0]    mul1_io_y_1;
  wire       [1:0]    mul1_io_y_2;
  wire       [1:0]    mul1_io_z_0;
  wire       [1:0]    mul1_io_z_1;
  wire       [1:0]    mul1_io_z_2;
  wire       [1:0]    mul2_io_z_0;
  wire       [1:0]    mul2_io_z_1;
  wire       [1:0]    mul2_io_z_2;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  wire       [1:0]    mul3_io_z_2;
  wire       [1:0]    g4ScaleN_3_io_x;
  wire       [1:0]    g4ScaleN_4_io_x;
  wire       [1:0]    g4ScaleN_5_io_x;
  wire                dummy;
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
  wire       [1:0]    e_0;
  wire       [1:0]    e_1;
  wire       [1:0]    e_2;
  wire       [1:0]    f_0;
  wire       [1:0]    f_1;
  wire       [1:0]    f_2;
  wire       [1:0]    g_0;
  wire       [1:0]    g_1;
  wire       [1:0]    g_2;
  wire       [1:0]    h_0;
  wire       [1:0]    h_1;
  wire       [1:0]    h_2;
  wire       [1:0]    p_0;
  wire       [1:0]    p_1;
  wire       [1:0]    p_2;
  wire       [1:0]    q_0;
  wire       [1:0]    q_1;
  wire       [1:0]    q_2;

  G4MulTIMaskedN mul1 (
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
  G4MulTIMaskedN mul2 (
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
  G4MulTIMaskedN mul3 (
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
  G4ScaleN g4ScaleN_3 (
    .io_t    (e_0[1:0]              ), //i
    .io_x    (g4ScaleN_3_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_4 (
    .io_t    (e_1[1:0]              ), //i
    .io_x    (g4ScaleN_4_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_5 (
    .io_t    (e_2[1:0]              ), //i
    .io_x    (g4ScaleN_5_io_x[1:0]  )  //o
  );
  assign dummy = 1'b0;
  assign a_0 = io_x_0[3 : 2];
  assign b_0 = io_x_0[1 : 0];
  assign c_0 = io_y_0[3 : 2];
  assign d_0 = io_y_0[1 : 0];
  assign a_1 = io_x_1[3 : 2];
  assign b_1 = io_x_1[1 : 0];
  assign c_1 = io_y_1[3 : 2];
  assign d_1 = io_y_1[1 : 0];
  assign a_2 = io_x_2[3 : 2];
  assign b_2 = io_x_2[1 : 0];
  assign c_2 = io_y_2[3 : 2];
  assign d_2 = io_y_2[1 : 0];
  assign mul1_io_x_0 = (a_0 ^ b_0);
  assign mul1_io_x_1 = (a_1 ^ b_1);
  assign mul1_io_x_2 = (a_2 ^ b_2);
  assign mul1_io_y_0 = (c_0 ^ d_0);
  assign mul1_io_y_1 = (c_1 ^ d_1);
  assign mul1_io_y_2 = (c_2 ^ d_2);
  assign e_0 = mul1_io_z_0;
  assign e_1 = mul1_io_z_1;
  assign e_2 = mul1_io_z_2;
  assign f_0 = g4ScaleN_3_io_x;
  assign f_1 = g4ScaleN_4_io_x;
  assign f_2 = g4ScaleN_5_io_x;
  assign g_0 = mul2_io_z_0;
  assign g_1 = mul2_io_z_1;
  assign g_2 = mul2_io_z_2;
  assign h_0 = mul3_io_z_0;
  assign h_1 = mul3_io_z_1;
  assign h_2 = mul3_io_z_2;
  assign p_0 = (f_0 ^ g_0);
  assign p_1 = (f_1 ^ g_1);
  assign p_2 = (f_2 ^ g_2);
  assign q_0 = (f_0 ^ h_0);
  assign q_1 = (f_1 ^ h_1);
  assign q_2 = (f_2 ^ h_2);
  assign io_z_0 = {p_0,q_0};
  assign io_z_1 = {p_1,q_1};
  assign io_z_2 = {p_2,q_2};

endmodule

//G4ScaleN replaced by G4ScaleN

//G4ScaleN replaced by G4ScaleN

module G4ScaleN (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],(io_t[1] ^ io_t[0])};

endmodule

//G4MulTIMaskedN replaced by G4MulTIMaskedN

//G4MulTIMaskedN replaced by G4MulTIMaskedN

module G4MulTIMaskedN (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_x_2,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [1:0]    io_y_2,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  output     [1:0]    io_z_2,
  input               clk,
  input               reset
);

  wire                dummy;
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
  reg        [2:0]    e_0;
  reg        [2:0]    e_1;
  reg        [2:0]    e_2;
  reg        [2:0]    f_0;
  reg        [2:0]    f_1;
  reg        [2:0]    f_2;
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
  always @(*) begin
    e_0[2] = ((bc_0 ^ ad_0) ^ bd_0);
    e_0[0] = ((bc_4 ^ ad_4) ^ bd_4);
    e_0[1] = ((bc_8 ^ ad_8) ^ bd_8);
  end

  always @(*) begin
    f_0[2] = ((bc_0 ^ ad_0) ^ ac_0);
    f_0[0] = ((bc_4 ^ ad_4) ^ ac_4);
    f_0[1] = ((bc_8 ^ ad_8) ^ ac_8);
  end

  always @(*) begin
    e_1[0] = (((e_0[0] ^ bc_5) ^ ad_5) ^ bd_5);
    e_1[1] = (((e_0[1] ^ bc_2) ^ ad_2) ^ bd_2);
    e_1[2] = (((e_0[2] ^ bc_1) ^ ad_1) ^ bd_1);
  end

  always @(*) begin
    f_1[0] = (((f_0[0] ^ bc_5) ^ ad_5) ^ ac_5);
    f_1[1] = (((f_0[1] ^ bc_2) ^ ad_2) ^ ac_2);
    f_1[2] = (((f_0[2] ^ bc_1) ^ ad_1) ^ ac_1);
  end

  always @(*) begin
    e_2[0] = (((e_1[0] ^ bc_7) ^ ad_7) ^ bd_7);
    e_2[1] = (((e_1[1] ^ bc_6) ^ ad_6) ^ bd_6);
    e_2[2] = (((e_1[2] ^ bc_3) ^ ad_3) ^ bd_3);
  end

  always @(*) begin
    f_2[0] = (((f_1[0] ^ bc_7) ^ ad_7) ^ ac_7);
    f_2[1] = (((f_1[1] ^ bc_6) ^ ad_6) ^ ac_6);
    f_2[2] = (((f_1[2] ^ bc_3) ^ ad_3) ^ ac_3);
  end

  assign io_z_0 = {e_2[0],f_2[0]};
  assign io_z_1 = {e_2[1],f_2[1]};
  assign io_z_2 = {e_2[2],f_2[2]};

endmodule
