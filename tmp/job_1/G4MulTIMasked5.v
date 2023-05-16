// Generator : SpinalHDL v1.6.2    git head : e20135930d099f5d7469bbea4f2ca5d14698f642
// Component : G4MulTIMasked5
// Git hash  : e20135930d099f5d7469bbea4f2ca5d14698f642

`timescale 1ns/1ps 

module G4MulTIMasked5 (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_x_2,
  input      [1:0]    io_x_3,
  input      [1:0]    io_x_4,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [1:0]    io_y_2,
  input      [1:0]    io_y_3,
  input      [1:0]    io_y_4,
  output reg [1:0]    io_z_0,
  output reg [1:0]    io_z_1,
  output reg [1:0]    io_z_2,
  output reg [1:0]    io_z_3,
  output reg [1:0]    io_z_4,
  input               clk,
  input               reset
);

  wire                dummy;
  wire                a_0;
  wire                a_1;
  wire                a_2;
  wire                a_3;
  wire                a_4;
  wire                b_0;
  wire                b_1;
  wire                b_2;
  wire                b_3;
  wire                b_4;
  wire                c_0;
  wire                c_1;
  wire                c_2;
  wire                c_3;
  wire                c_4;
  wire                d_0;
  wire                d_1;
  wire                d_2;
  wire                d_3;
  wire                d_4;
  wire                e_0;
  wire                e_1;
  wire                e_2;
  wire                e_3;
  wire                e_4;
  wire                f_0;
  wire                f_1;
  wire                f_2;
  wire                f_3;
  wire                f_4;
  wire                ac_0;
  wire                ac_1;
  wire                ac_2;
  wire                ac_3;
  wire                ac_4;
  wire                ac_5;
  wire                ac_6;
  wire                ac_7;
  wire                ac_8;
  wire                ac_9;
  wire                ac_10;
  wire                ac_11;
  wire                ac_12;
  wire                ac_13;
  wire                ac_14;
  wire                ac_15;
  wire                ac_16;
  wire                ac_17;
  wire                ac_18;
  wire                ac_19;
  wire                ac_20;
  wire                ac_21;
  wire                ac_22;
  wire                ac_23;
  wire                ac_24;
  wire                ad_0;
  wire                ad_1;
  wire                ad_2;
  wire                ad_3;
  wire                ad_4;
  wire                ad_5;
  wire                ad_6;
  wire                ad_7;
  wire                ad_8;
  wire                ad_9;
  wire                ad_10;
  wire                ad_11;
  wire                ad_12;
  wire                ad_13;
  wire                ad_14;
  wire                ad_15;
  wire                ad_16;
  wire                ad_17;
  wire                ad_18;
  wire                ad_19;
  wire                ad_20;
  wire                ad_21;
  wire                ad_22;
  wire                ad_23;
  wire                ad_24;
  wire                bc_0;
  wire                bc_1;
  wire                bc_2;
  wire                bc_3;
  wire                bc_4;
  wire                bc_5;
  wire                bc_6;
  wire                bc_7;
  wire                bc_8;
  wire                bc_9;
  wire                bc_10;
  wire                bc_11;
  wire                bc_12;
  wire                bc_13;
  wire                bc_14;
  wire                bc_15;
  wire                bc_16;
  wire                bc_17;
  wire                bc_18;
  wire                bc_19;
  wire                bc_20;
  wire                bc_21;
  wire                bc_22;
  wire                bc_23;
  wire                bc_24;
  wire                bd_0;
  wire                bd_1;
  wire                bd_2;
  wire                bd_3;
  wire                bd_4;
  wire                bd_5;
  wire                bd_6;
  wire                bd_7;
  wire                bd_8;
  wire                bd_9;
  wire                bd_10;
  wire                bd_11;
  wire                bd_12;
  wire                bd_13;
  wire                bd_14;
  wire                bd_15;
  wire                bd_16;
  wire                bd_17;
  wire                bd_18;
  wire                bd_19;
  wire                bd_20;
  wire                bd_21;
  wire                bd_22;
  wire                bd_23;
  wire                bd_24;

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
  assign a_3 = io_x_3[1];
  assign b_3 = io_x_3[0];
  assign c_3 = io_y_3[1];
  assign d_3 = io_y_3[0];
  assign a_4 = io_x_4[1];
  assign b_4 = io_x_4[0];
  assign c_4 = io_y_4[1];
  assign d_4 = io_y_4[0];
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
  assign ac_3 = (a_0 && c_3);
  assign ad_3 = (a_0 && d_3);
  assign bc_3 = (b_0 && c_3);
  assign bd_3 = (b_0 && d_3);
  assign ac_4 = (a_0 && c_4);
  assign ad_4 = (a_0 && d_4);
  assign bc_4 = (b_0 && c_4);
  assign bd_4 = (b_0 && d_4);
  assign ac_5 = (a_1 && c_0);
  assign ad_5 = (a_1 && d_0);
  assign bc_5 = (b_1 && c_0);
  assign bd_5 = (b_1 && d_0);
  assign ac_6 = (a_1 && c_1);
  assign ad_6 = (a_1 && d_1);
  assign bc_6 = (b_1 && c_1);
  assign bd_6 = (b_1 && d_1);
  assign ac_7 = (a_1 && c_2);
  assign ad_7 = (a_1 && d_2);
  assign bc_7 = (b_1 && c_2);
  assign bd_7 = (b_1 && d_2);
  assign ac_8 = (a_1 && c_3);
  assign ad_8 = (a_1 && d_3);
  assign bc_8 = (b_1 && c_3);
  assign bd_8 = (b_1 && d_3);
  assign ac_9 = (a_1 && c_4);
  assign ad_9 = (a_1 && d_4);
  assign bc_9 = (b_1 && c_4);
  assign bd_9 = (b_1 && d_4);
  assign ac_10 = (a_2 && c_0);
  assign ad_10 = (a_2 && d_0);
  assign bc_10 = (b_2 && c_0);
  assign bd_10 = (b_2 && d_0);
  assign ac_11 = (a_2 && c_1);
  assign ad_11 = (a_2 && d_1);
  assign bc_11 = (b_2 && c_1);
  assign bd_11 = (b_2 && d_1);
  assign ac_12 = (a_2 && c_2);
  assign ad_12 = (a_2 && d_2);
  assign bc_12 = (b_2 && c_2);
  assign bd_12 = (b_2 && d_2);
  assign ac_13 = (a_2 && c_3);
  assign ad_13 = (a_2 && d_3);
  assign bc_13 = (b_2 && c_3);
  assign bd_13 = (b_2 && d_3);
  assign ac_14 = (a_2 && c_4);
  assign ad_14 = (a_2 && d_4);
  assign bc_14 = (b_2 && c_4);
  assign bd_14 = (b_2 && d_4);
  assign ac_15 = (a_3 && c_0);
  assign ad_15 = (a_3 && d_0);
  assign bc_15 = (b_3 && c_0);
  assign bd_15 = (b_3 && d_0);
  assign ac_16 = (a_3 && c_1);
  assign ad_16 = (a_3 && d_1);
  assign bc_16 = (b_3 && c_1);
  assign bd_16 = (b_3 && d_1);
  assign ac_17 = (a_3 && c_2);
  assign ad_17 = (a_3 && d_2);
  assign bc_17 = (b_3 && c_2);
  assign bd_17 = (b_3 && d_2);
  assign ac_18 = (a_3 && c_3);
  assign ad_18 = (a_3 && d_3);
  assign bc_18 = (b_3 && c_3);
  assign bd_18 = (b_3 && d_3);
  assign ac_19 = (a_3 && c_4);
  assign ad_19 = (a_3 && d_4);
  assign bc_19 = (b_3 && c_4);
  assign bd_19 = (b_3 && d_4);
  assign ac_20 = (a_4 && c_0);
  assign ad_20 = (a_4 && d_0);
  assign bc_20 = (b_4 && c_0);
  assign bd_20 = (b_4 && d_0);
  assign ac_21 = (a_4 && c_1);
  assign ad_21 = (a_4 && d_1);
  assign bc_21 = (b_4 && c_1);
  assign bd_21 = (b_4 && d_1);
  assign ac_22 = (a_4 && c_2);
  assign ad_22 = (a_4 && d_2);
  assign bc_22 = (b_4 && c_2);
  assign bd_22 = (b_4 && d_2);
  assign ac_23 = (a_4 && c_3);
  assign ad_23 = (a_4 && d_3);
  assign bc_23 = (b_4 && c_3);
  assign bd_23 = (b_4 && d_3);
  assign ac_24 = (a_4 && c_4);
  assign ad_24 = (a_4 && d_4);
  assign bc_24 = (b_4 && c_4);
  assign bd_24 = (b_4 && d_4);
  assign e_0 = ((((((((((((((bc_6 ^ ad_6) ^ bd_6) ^ bc_7) ^ ad_7) ^ bd_7) ^ bc_11) ^ ad_11) ^ bd_11) ^ bc_16) ^ ad_16) ^ bd_16) ^ bc_21) ^ ad_21) ^ bd_21);
  assign e_1 = ((((((((((((((bc_2 ^ ad_2) ^ bd_2) ^ bc_10) ^ ad_10) ^ bd_10) ^ bc_12) ^ ad_12) ^ bd_12) ^ bc_15) ^ ad_15) ^ bd_15) ^ bc_20) ^ ad_20) ^ bd_20);
  assign e_2 = ((((((((((((((bc_1 ^ ad_1) ^ bd_1) ^ bc_5) ^ ad_5) ^ bd_5) ^ bc_18) ^ ad_18) ^ bd_18) ^ bc_19) ^ ad_19) ^ bd_19) ^ bc_23) ^ ad_23) ^ bd_23);
  assign e_3 = ((((((((((((((bc_4 ^ ad_4) ^ bd_4) ^ bc_9) ^ ad_9) ^ bd_9) ^ bc_14) ^ ad_14) ^ bd_14) ^ bc_22) ^ ad_22) ^ bd_22) ^ bc_24) ^ ad_24) ^ bd_24);
  assign e_4 = ((((((((((((((bc_0 ^ ad_0) ^ bd_0) ^ bc_3) ^ ad_3) ^ bd_3) ^ bc_8) ^ ad_8) ^ bd_8) ^ bc_13) ^ ad_13) ^ bd_13) ^ bc_17) ^ ad_17) ^ bd_17);
  assign f_0 = ((((((((((((((bc_6 ^ ad_6) ^ ac_6) ^ bc_7) ^ ad_7) ^ ac_7) ^ bc_11) ^ ad_11) ^ ac_11) ^ bc_16) ^ ad_16) ^ ac_16) ^ bc_21) ^ ad_21) ^ ac_21);
  assign f_1 = ((((((((((((((bc_2 ^ ad_2) ^ ac_2) ^ bc_10) ^ ad_10) ^ ac_10) ^ bc_12) ^ ad_12) ^ ac_12) ^ bc_15) ^ ad_15) ^ ac_15) ^ bc_20) ^ ad_20) ^ ac_20);
  assign f_2 = ((((((((((((((bc_1 ^ ad_1) ^ ac_1) ^ bc_5) ^ ad_5) ^ ac_5) ^ bc_18) ^ ad_18) ^ ac_18) ^ bc_19) ^ ad_19) ^ ac_19) ^ bc_23) ^ ad_23) ^ ac_23);
  assign f_3 = ((((((((((((((bc_4 ^ ad_4) ^ ac_4) ^ bc_9) ^ ad_9) ^ ac_9) ^ bc_14) ^ ad_14) ^ ac_14) ^ bc_22) ^ ad_22) ^ ac_22) ^ bc_24) ^ ad_24) ^ ac_24);
  assign f_4 = ((((((((((((((bc_0 ^ ad_0) ^ ac_0) ^ bc_3) ^ ad_3) ^ ac_3) ^ bc_8) ^ ad_8) ^ ac_8) ^ bc_13) ^ ad_13) ^ ac_13) ^ bc_17) ^ ad_17) ^ ac_17);
  always @(*) begin
    io_z_0[1] = e_0;
    io_z_0[0] = f_0;
  end

  always @(*) begin
    io_z_1[1] = e_1;
    io_z_1[0] = f_1;
  end

  always @(*) begin
    io_z_2[1] = e_2;
    io_z_2[0] = f_2;
  end

  always @(*) begin
    io_z_3[1] = e_3;
    io_z_3[0] = f_3;
  end

  always @(*) begin
    io_z_4[1] = e_4;
    io_z_4[0] = f_4;
  end


endmodule
