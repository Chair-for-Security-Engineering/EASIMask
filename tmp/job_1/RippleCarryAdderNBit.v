// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : RippleCarryAdderNBit
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module RippleCarryAdderNBit (
  input      [31:0]   io_x,
  input      [31:0]   io_y,
  output reg [31:0]   io_z,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire                c_0;
  wire                c_1;
  wire                c_2;
  wire                c_3;
  wire                c_4;
  wire                c_5;
  wire                c_6;
  wire                c_7;
  wire                c_8;
  wire                c_9;
  wire                c_10;
  wire                c_11;
  wire                c_12;
  wire                c_13;
  wire                c_14;
  wire                c_15;
  wire                c_16;
  wire                c_17;
  wire                c_18;
  wire                c_19;
  wire                c_20;
  wire                c_21;
  wire                c_22;
  wire                c_23;
  wire                c_24;
  wire                c_25;
  wire                c_26;
  wire                c_27;
  wire                c_28;
  wire                c_29;
  wire                c_30;
  wire                c_31;
  wire                s_0;
  wire                s_1;
  wire                s_2;
  wire                s_3;
  wire                s_4;
  wire                s_5;
  wire                s_6;
  wire                s_7;
  wire                s_8;
  wire                s_9;
  wire                s_10;
  wire                s_11;
  wire                s_12;
  wire                s_13;
  wire                s_14;
  wire                s_15;
  wire                s_16;
  wire                s_17;
  wire                s_18;
  wire                s_19;
  wire                s_20;
  wire                s_21;
  wire                s_22;
  wire                s_23;
  wire                s_24;
  wire                s_25;
  wire                s_26;
  wire                s_27;
  wire                s_28;
  wire                s_29;
  wire                s_30;
  wire                s_31;

  assign c_0 = 1'b0;
  assign c_1 = (((io_x[0] && io_y[0]) ^ (io_x[0] && c_0)) ^ (io_y[0] && c_0));
  assign c_2 = (((io_x[1] && io_y[1]) ^ (io_x[1] && c_1)) ^ (io_y[1] && c_1));
  assign c_3 = (((io_x[2] && io_y[2]) ^ (io_x[2] && c_2)) ^ (io_y[2] && c_2));
  assign c_4 = (((io_x[3] && io_y[3]) ^ (io_x[3] && c_3)) ^ (io_y[3] && c_3));
  assign c_5 = (((io_x[4] && io_y[4]) ^ (io_x[4] && c_4)) ^ (io_y[4] && c_4));
  assign c_6 = (((io_x[5] && io_y[5]) ^ (io_x[5] && c_5)) ^ (io_y[5] && c_5));
  assign c_7 = (((io_x[6] && io_y[6]) ^ (io_x[6] && c_6)) ^ (io_y[6] && c_6));
  assign c_8 = (((io_x[7] && io_y[7]) ^ (io_x[7] && c_7)) ^ (io_y[7] && c_7));
  assign c_9 = (((io_x[8] && io_y[8]) ^ (io_x[8] && c_8)) ^ (io_y[8] && c_8));
  assign c_10 = (((io_x[9] && io_y[9]) ^ (io_x[9] && c_9)) ^ (io_y[9] && c_9));
  assign c_11 = (((io_x[10] && io_y[10]) ^ (io_x[10] && c_10)) ^ (io_y[10] && c_10));
  assign c_12 = (((io_x[11] && io_y[11]) ^ (io_x[11] && c_11)) ^ (io_y[11] && c_11));
  assign c_13 = (((io_x[12] && io_y[12]) ^ (io_x[12] && c_12)) ^ (io_y[12] && c_12));
  assign c_14 = (((io_x[13] && io_y[13]) ^ (io_x[13] && c_13)) ^ (io_y[13] && c_13));
  assign c_15 = (((io_x[14] && io_y[14]) ^ (io_x[14] && c_14)) ^ (io_y[14] && c_14));
  assign c_16 = (((io_x[15] && io_y[15]) ^ (io_x[15] && c_15)) ^ (io_y[15] && c_15));
  assign c_17 = (((io_x[16] && io_y[16]) ^ (io_x[16] && c_16)) ^ (io_y[16] && c_16));
  assign c_18 = (((io_x[17] && io_y[17]) ^ (io_x[17] && c_17)) ^ (io_y[17] && c_17));
  assign c_19 = (((io_x[18] && io_y[18]) ^ (io_x[18] && c_18)) ^ (io_y[18] && c_18));
  assign c_20 = (((io_x[19] && io_y[19]) ^ (io_x[19] && c_19)) ^ (io_y[19] && c_19));
  assign c_21 = (((io_x[20] && io_y[20]) ^ (io_x[20] && c_20)) ^ (io_y[20] && c_20));
  assign c_22 = (((io_x[21] && io_y[21]) ^ (io_x[21] && c_21)) ^ (io_y[21] && c_21));
  assign c_23 = (((io_x[22] && io_y[22]) ^ (io_x[22] && c_22)) ^ (io_y[22] && c_22));
  assign c_24 = (((io_x[23] && io_y[23]) ^ (io_x[23] && c_23)) ^ (io_y[23] && c_23));
  assign c_25 = (((io_x[24] && io_y[24]) ^ (io_x[24] && c_24)) ^ (io_y[24] && c_24));
  assign c_26 = (((io_x[25] && io_y[25]) ^ (io_x[25] && c_25)) ^ (io_y[25] && c_25));
  assign c_27 = (((io_x[26] && io_y[26]) ^ (io_x[26] && c_26)) ^ (io_y[26] && c_26));
  assign c_28 = (((io_x[27] && io_y[27]) ^ (io_x[27] && c_27)) ^ (io_y[27] && c_27));
  assign c_29 = (((io_x[28] && io_y[28]) ^ (io_x[28] && c_28)) ^ (io_y[28] && c_28));
  assign c_30 = (((io_x[29] && io_y[29]) ^ (io_x[29] && c_29)) ^ (io_y[29] && c_29));
  assign c_31 = (((io_x[30] && io_y[30]) ^ (io_x[30] && c_30)) ^ (io_y[30] && c_30));
  assign s_0 = ((io_x[0] ^ io_y[0]) ^ c_0);
  always @(*) begin
    io_z[0] = s_0;
    io_z[1] = s_1;
    io_z[2] = s_2;
    io_z[3] = s_3;
    io_z[4] = s_4;
    io_z[5] = s_5;
    io_z[6] = s_6;
    io_z[7] = s_7;
    io_z[8] = s_8;
    io_z[9] = s_9;
    io_z[10] = s_10;
    io_z[11] = s_11;
    io_z[12] = s_12;
    io_z[13] = s_13;
    io_z[14] = s_14;
    io_z[15] = s_15;
    io_z[16] = s_16;
    io_z[17] = s_17;
    io_z[18] = s_18;
    io_z[19] = s_19;
    io_z[20] = s_20;
    io_z[21] = s_21;
    io_z[22] = s_22;
    io_z[23] = s_23;
    io_z[24] = s_24;
    io_z[25] = s_25;
    io_z[26] = s_26;
    io_z[27] = s_27;
    io_z[28] = s_28;
    io_z[29] = s_29;
    io_z[30] = s_30;
    io_z[31] = s_31;
  end

  assign s_1 = ((io_x[1] ^ io_y[1]) ^ c_1);
  assign s_2 = ((io_x[2] ^ io_y[2]) ^ c_2);
  assign s_3 = ((io_x[3] ^ io_y[3]) ^ c_3);
  assign s_4 = ((io_x[4] ^ io_y[4]) ^ c_4);
  assign s_5 = ((io_x[5] ^ io_y[5]) ^ c_5);
  assign s_6 = ((io_x[6] ^ io_y[6]) ^ c_6);
  assign s_7 = ((io_x[7] ^ io_y[7]) ^ c_7);
  assign s_8 = ((io_x[8] ^ io_y[8]) ^ c_8);
  assign s_9 = ((io_x[9] ^ io_y[9]) ^ c_9);
  assign s_10 = ((io_x[10] ^ io_y[10]) ^ c_10);
  assign s_11 = ((io_x[11] ^ io_y[11]) ^ c_11);
  assign s_12 = ((io_x[12] ^ io_y[12]) ^ c_12);
  assign s_13 = ((io_x[13] ^ io_y[13]) ^ c_13);
  assign s_14 = ((io_x[14] ^ io_y[14]) ^ c_14);
  assign s_15 = ((io_x[15] ^ io_y[15]) ^ c_15);
  assign s_16 = ((io_x[16] ^ io_y[16]) ^ c_16);
  assign s_17 = ((io_x[17] ^ io_y[17]) ^ c_17);
  assign s_18 = ((io_x[18] ^ io_y[18]) ^ c_18);
  assign s_19 = ((io_x[19] ^ io_y[19]) ^ c_19);
  assign s_20 = ((io_x[20] ^ io_y[20]) ^ c_20);
  assign s_21 = ((io_x[21] ^ io_y[21]) ^ c_21);
  assign s_22 = ((io_x[22] ^ io_y[22]) ^ c_22);
  assign s_23 = ((io_x[23] ^ io_y[23]) ^ c_23);
  assign s_24 = ((io_x[24] ^ io_y[24]) ^ c_24);
  assign s_25 = ((io_x[25] ^ io_y[25]) ^ c_25);
  assign s_26 = ((io_x[26] ^ io_y[26]) ^ c_26);
  assign s_27 = ((io_x[27] ^ io_y[27]) ^ c_27);
  assign s_28 = ((io_x[28] ^ io_y[28]) ^ c_28);
  assign s_29 = ((io_x[29] ^ io_y[29]) ^ c_29);
  assign s_30 = ((io_x[30] ^ io_y[30]) ^ c_30);
  assign s_31 = ((io_x[31] ^ io_y[31]) ^ c_31);

endmodule
