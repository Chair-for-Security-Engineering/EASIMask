// Generator : SpinalHDL v1.6.2    git head : b35dce327aac7da3d63fe591d87ab216ac6ce79b
// Component : AES_Quarterround_Masked
// Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

`timescale 1ns/1ps 

module AES_Quarterround_Masked (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [31:0]   io_p1,
  input      [31:0]   io_p2,
  input      [31:0]   io_k1,
  input      [31:0]   io_k2,
  input      [27:0]   io_r,
  output     [31:0]   io_c1,
  output     [31:0]   io_c2,
  output reg          io_done
);
  localparam QuarterroundStates_sIdle = 2'd0;
  localparam QuarterroundStates_sInit = 2'd1;
  localparam QuarterroundStates_sExecute = 2'd2;
  localparam QuarterroundStates_sDone = 2'd3;

  wire       [7:0]    addroundkey1_io_b;
  wire       [7:0]    addroundkey2_io_b;
  wire       [7:0]    sbox_io_sbOut0;
  wire       [7:0]    sbox_io_sbOut1;
  wire       [7:0]    mixcolumns1_io_mcOut1;
  wire       [7:0]    mixcolumns1_io_mcOut2;
  wire       [7:0]    mixcolumns1_io_mcOut3;
  wire       [7:0]    mixcolumns1_io_mcOut4;
  wire       [7:0]    mixcolumns2_io_mcOut1;
  wire       [7:0]    mixcolumns2_io_mcOut2;
  wire       [7:0]    mixcolumns2_io_mcOut3;
  wire       [7:0]    mixcolumns2_io_mcOut4;
  wire       [3:0]    _zz_ctr_valueNext;
  wire       [0:0]    _zz_ctr_valueNext_1;
  reg        [1:0]    aesState;
  reg        [7:0]    stateReg_0_0;
  reg        [7:0]    stateReg_0_1;
  reg        [7:0]    stateReg_0_2;
  reg        [7:0]    stateReg_0_3;
  reg        [7:0]    stateReg_1_0;
  reg        [7:0]    stateReg_1_1;
  reg        [7:0]    stateReg_1_2;
  reg        [7:0]    stateReg_1_3;
  reg        [7:0]    keyReg_0_0;
  reg        [7:0]    keyReg_0_1;
  reg        [7:0]    keyReg_0_2;
  reg        [7:0]    keyReg_0_3;
  reg        [7:0]    keyReg_1_0;
  reg        [7:0]    keyReg_1_1;
  reg        [7:0]    keyReg_1_2;
  reg        [7:0]    keyReg_1_3;
  reg                 ctr_willIncrement;
  wire                ctr_willClear;
  reg        [3:0]    ctr_valueNext;
  reg        [3:0]    ctr_value;
  wire                ctr_willOverflowIfInc;
  wire                ctr_willOverflow;
  reg                 initData;
  reg                 stateRotation;
  reg                 mixColumnsRotation;
  wire                when_AES_Quarterround_Masked_l131;
  wire                when_AES_Quarterround_Masked_l136;
  `ifndef SYNTHESIS
  reg [63:0] aesState_string;
  `endif


  assign _zz_ctr_valueNext_1 = ctr_willIncrement;
  assign _zz_ctr_valueNext = {3'd0, _zz_ctr_valueNext_1};
  AddRoundKey addroundkey1 (
    .io_a    (stateReg_0_0[7:0]       ), //i
    .io_k    (keyReg_0_0[7:0]         ), //i
    .io_b    (addroundkey1_io_b[7:0]  )  //o
  );
  AddRoundKey addroundkey2 (
    .io_a    (stateReg_1_0[7:0]       ), //i
    .io_k    (keyReg_1_0[7:0]         ), //i
    .io_b    (addroundkey2_io_b[7:0]  )  //o
  );
  SBoxMasked sbox (
    .io_clk       (io_clk                  ), //i
    .io_reset     (io_reset                ), //i
    .io_sbIn0     (addroundkey1_io_b[7:0]  ), //i
    .io_sbIn1     (addroundkey2_io_b[7:0]  ), //i
    .io_m         (io_r[27:0]              ), //i
    .io_sbOut0    (sbox_io_sbOut0[7:0]     ), //o
    .io_sbOut1    (sbox_io_sbOut1[7:0]     )  //o
  );
  MixColumns mixcolumns1 (
    .io_mcIn1     (stateReg_0_0[7:0]           ), //i
    .io_mcIn2     (stateReg_0_1[7:0]           ), //i
    .io_mcIn3     (stateReg_0_2[7:0]           ), //i
    .io_mcIn4     (stateReg_0_3[7:0]           ), //i
    .io_mcOut1    (mixcolumns1_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (mixcolumns1_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (mixcolumns1_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (mixcolumns1_io_mcOut4[7:0]  )  //o
  );
  MixColumns mixcolumns2 (
    .io_mcIn1     (stateReg_1_0[7:0]           ), //i
    .io_mcIn2     (stateReg_1_1[7:0]           ), //i
    .io_mcIn3     (stateReg_1_2[7:0]           ), //i
    .io_mcIn4     (stateReg_1_3[7:0]           ), //i
    .io_mcOut1    (mixcolumns2_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (mixcolumns2_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (mixcolumns2_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (mixcolumns2_io_mcOut4[7:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : aesState_string = "sIdle   ";
      QuarterroundStates_sInit : aesState_string = "sInit   ";
      QuarterroundStates_sExecute : aesState_string = "sExecute";
      QuarterroundStates_sDone : aesState_string = "sDone   ";
      default : aesState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    ctr_willIncrement = 1'b0;
    case(aesState)
      QuarterroundStates_sIdle : begin
      end
      QuarterroundStates_sInit : begin
      end
      QuarterroundStates_sExecute : begin
        ctr_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign ctr_willClear = 1'b0;
  assign ctr_willOverflowIfInc = (ctr_value == 4'b1000);
  assign ctr_willOverflow = (ctr_willOverflowIfInc && ctr_willIncrement);
  always @(*) begin
    if(ctr_willOverflow) begin
      ctr_valueNext = 4'b0000;
    end else begin
      ctr_valueNext = (ctr_value + _zz_ctr_valueNext);
    end
    if(ctr_willClear) begin
      ctr_valueNext = 4'b0000;
    end
  end

  assign io_c1 = {{{stateReg_0_0,stateReg_0_1},stateReg_0_2},stateReg_0_3};
  assign io_c2 = {{{stateReg_1_0,stateReg_1_1},stateReg_1_2},stateReg_1_3};
  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        initData = 1'b0;
      end
      QuarterroundStates_sInit : begin
        initData = 1'b1;
      end
      QuarterroundStates_sExecute : begin
        initData = 1'b0;
      end
      default : begin
        initData = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        stateRotation = 1'b0;
      end
      QuarterroundStates_sInit : begin
        stateRotation = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        if(when_AES_Quarterround_Masked_l131) begin
          stateRotation = 1'b1;
        end else begin
          stateRotation = 1'b0;
        end
      end
      default : begin
        stateRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        mixColumnsRotation = 1'b0;
      end
      QuarterroundStates_sInit : begin
        mixColumnsRotation = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        if(when_AES_Quarterround_Masked_l136) begin
          mixColumnsRotation = 1'b1;
        end else begin
          mixColumnsRotation = 1'b0;
        end
      end
      default : begin
        mixColumnsRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        io_done = 1'b0;
      end
      QuarterroundStates_sInit : begin
        io_done = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        io_done = 1'b0;
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign when_AES_Quarterround_Masked_l131 = (ctr_value < 4'b1000);
  assign when_AES_Quarterround_Masked_l136 = (ctr_value == 4'b1000);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      aesState <= QuarterroundStates_sIdle;
      stateReg_0_0 <= 8'h0;
      stateReg_0_1 <= 8'h0;
      stateReg_0_2 <= 8'h0;
      stateReg_0_3 <= 8'h0;
      stateReg_1_0 <= 8'h0;
      stateReg_1_1 <= 8'h0;
      stateReg_1_2 <= 8'h0;
      stateReg_1_3 <= 8'h0;
      keyReg_0_0 <= 8'h0;
      keyReg_0_1 <= 8'h0;
      keyReg_0_2 <= 8'h0;
      keyReg_0_3 <= 8'h0;
      keyReg_1_0 <= 8'h0;
      keyReg_1_1 <= 8'h0;
      keyReg_1_2 <= 8'h0;
      keyReg_1_3 <= 8'h0;
      ctr_value <= 4'b0000;
    end else begin
      ctr_value <= ctr_valueNext;
      if(initData) begin
        stateReg_0_0 <= io_p1[31 : 24];
        stateReg_0_1 <= io_p1[23 : 16];
        stateReg_0_2 <= io_p1[15 : 8];
        stateReg_0_3 <= io_p1[7 : 0];
        stateReg_1_0 <= io_p2[31 : 24];
        stateReg_1_1 <= io_p2[23 : 16];
        stateReg_1_2 <= io_p2[15 : 8];
        stateReg_1_3 <= io_p2[7 : 0];
        keyReg_0_0 <= io_k1[31 : 24];
        keyReg_0_1 <= io_k1[23 : 16];
        keyReg_0_2 <= io_k1[15 : 8];
        keyReg_0_3 <= io_k1[7 : 0];
        keyReg_1_0 <= io_k2[31 : 24];
        keyReg_1_1 <= io_k2[23 : 16];
        keyReg_1_2 <= io_k2[15 : 8];
        keyReg_1_3 <= io_k2[7 : 0];
      end
      if(stateRotation) begin
        stateReg_0_0 <= stateReg_0_1;
        stateReg_0_1 <= stateReg_0_2;
        stateReg_0_2 <= stateReg_0_3;
        stateReg_0_3 <= sbox_io_sbOut0;
        stateReg_1_0 <= stateReg_1_1;
        stateReg_1_1 <= stateReg_1_2;
        stateReg_1_2 <= stateReg_1_3;
        stateReg_1_3 <= sbox_io_sbOut1;
      end
      if(mixColumnsRotation) begin
        stateReg_0_0 <= mixcolumns1_io_mcOut1;
        stateReg_0_1 <= mixcolumns1_io_mcOut2;
        stateReg_0_2 <= mixcolumns1_io_mcOut3;
        stateReg_0_3 <= mixcolumns1_io_mcOut4;
        stateReg_1_0 <= mixcolumns2_io_mcOut1;
        stateReg_1_1 <= mixcolumns2_io_mcOut2;
        stateReg_1_2 <= mixcolumns2_io_mcOut3;
        stateReg_1_3 <= mixcolumns2_io_mcOut4;
      end
      case(aesState)
        QuarterroundStates_sIdle : begin
          aesState <= QuarterroundStates_sIdle;
          if(io_enable) begin
            aesState <= QuarterroundStates_sInit;
          end
        end
        QuarterroundStates_sInit : begin
          aesState <= QuarterroundStates_sExecute;
        end
        QuarterroundStates_sExecute : begin
          aesState <= QuarterroundStates_sExecute;
          if(ctr_willOverflow) begin
            aesState <= QuarterroundStates_sDone;
          end
        end
        default : begin
          aesState <= QuarterroundStates_sIdle;
        end
      endcase
    end
  end


endmodule

//MixColumns replaced by MixColumns

module MixColumns (
  input      [7:0]    io_mcIn1,
  input      [7:0]    io_mcIn2,
  input      [7:0]    io_mcIn3,
  input      [7:0]    io_mcIn4,
  output     [7:0]    io_mcOut1,
  output     [7:0]    io_mcOut2,
  output     [7:0]    io_mcOut3,
  output     [7:0]    io_mcOut4
);

  wire       [8:0]    _zz__zz_io_mcOut1;
  wire       [8:0]    _zz__zz_io_mcOut1_1;
  wire       [8:0]    _zz__zz_io_mcOut2;
  wire       [8:0]    _zz__zz_io_mcOut2_1;
  wire       [8:0]    _zz__zz_io_mcOut3;
  wire       [8:0]    _zz__zz_io_mcOut3_1;
  wire       [8:0]    _zz__zz_io_mcOut4;
  wire       [8:0]    _zz__zz_io_mcOut4_1;
  wire       [7:0]    a1;
  wire       [7:0]    a2;
  wire       [7:0]    a3;
  wire       [7:0]    a0;
  reg        [8:0]    _zz_io_mcOut1;
  wire                when_MixColumns_l26;
  reg        [8:0]    _zz_io_mcOut1_1;
  wire                when_MixColumns_l26_1;
  reg        [8:0]    _zz_io_mcOut2;
  wire                when_MixColumns_l26_2;
  reg        [8:0]    _zz_io_mcOut2_1;
  wire                when_MixColumns_l26_3;
  reg        [8:0]    _zz_io_mcOut3;
  wire                when_MixColumns_l26_4;
  reg        [8:0]    _zz_io_mcOut3_1;
  wire                when_MixColumns_l26_5;
  reg        [8:0]    _zz_io_mcOut4;
  wire                when_MixColumns_l26_6;
  reg        [8:0]    _zz_io_mcOut4_1;
  wire                when_MixColumns_l26_7;

  assign _zz__zz_io_mcOut1 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
  assign _zz__zz_io_mcOut4 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
  assign a0 = io_mcIn1;
  assign a1 = io_mcIn2;
  assign a2 = io_mcIn3;
  assign a3 = io_mcIn4;
  assign when_MixColumns_l26 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26) begin
      _zz_io_mcOut1 = (_zz__zz_io_mcOut1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_1 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_1) begin
      _zz_io_mcOut1_1 = (_zz__zz_io_mcOut1_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
    end
  end

  assign io_mcOut1 = (((_zz_io_mcOut1[7 : 0] ^ (_zz_io_mcOut1_1[7 : 0] ^ a1)) ^ a2) ^ a3);
  assign when_MixColumns_l26_2 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_2) begin
      _zz_io_mcOut2 = (_zz__zz_io_mcOut2 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumns_l26_3 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_3) begin
      _zz_io_mcOut2_1 = (_zz__zz_io_mcOut2_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
    end
  end

  assign io_mcOut2 = (((a0 ^ _zz_io_mcOut2[7 : 0]) ^ (_zz_io_mcOut2_1[7 : 0] ^ a2)) ^ a3);
  assign when_MixColumns_l26_4 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_4) begin
      _zz_io_mcOut3 = (_zz__zz_io_mcOut3 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l26_5 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_5) begin
      _zz_io_mcOut3_1 = (_zz__zz_io_mcOut3_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut3 = (((a0 ^ a1) ^ _zz_io_mcOut3[7 : 0]) ^ (_zz_io_mcOut3_1[7 : 0] ^ a3));
  assign when_MixColumns_l26_6 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26_6) begin
      _zz_io_mcOut4 = (_zz__zz_io_mcOut4 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_7 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_7) begin
      _zz_io_mcOut4_1 = (_zz__zz_io_mcOut4_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut4 = ((((_zz_io_mcOut4[7 : 0] ^ a0) ^ a1) ^ a2) ^ _zz_io_mcOut4_1[7 : 0]);

endmodule

module SBoxMasked (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_sbIn0,
  input      [7:0]    io_sbIn1,
  input      [27:0]   io_m,
  output     [7:0]    io_sbOut0,
  output     [7:0]    io_sbOut1
);

  wire       [7:0]    convert0_io_output;
  wire       [7:0]    convert1_io_output;
  wire       [7:0]    convert2_io_output;
  wire       [7:0]    convert3_io_output;
  wire       [7:0]    inv_io_z_0;
  wire       [7:0]    inv_io_z_1;

  NewBasis convert0 (
    .io_input        (io_sbIn0[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert0_io_output[7:0]  )  //o
  );
  NewBasis convert1 (
    .io_input        (io_sbIn1[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert1_io_output[7:0]  )  //o
  );
  NewBasis convert2 (
    .io_input        (inv_io_z_0[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert2_io_output[7:0]  )  //o
  );
  NewBasis convert3 (
    .io_input        (inv_io_z_1[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert3_io_output[7:0]  )  //o
  );
  G256Inv2Shares5Stages inv (
    .io_clk      (io_clk                   ), //i
    .io_reset    (io_reset                 ), //i
    .io_x_0      (convert0_io_output[7:0]  ), //i
    .io_x_1      (convert1_io_output[7:0]  ), //i
    .io_m        (io_m[27:0]               ), //i
    .io_z_0      (inv_io_z_0[7:0]          ), //o
    .io_z_1      (inv_io_z_1[7:0]          )  //o
  );
  assign io_sbOut0 = (convert2_io_output ^ 8'h63);
  assign io_sbOut1 = convert3_io_output;

endmodule

//AddRoundKey replaced by AddRoundKey

module AddRoundKey (
  input      [7:0]    io_a,
  input      [7:0]    io_k,
  output     [7:0]    io_b
);


  assign io_b = (io_a ^ io_k);

endmodule

module G256Inv2Shares5Stages (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_x_0,
  input      [7:0]    io_x_1,
  input      [27:0]   io_m,
  output     [7:0]    io_z_0,
  output     [7:0]    io_z_1
);

  wire       [7:0]    r_mul1_io_m;
  wire       [3:0]    r_mul2_io_m;
  wire       [3:0]    r_mul3_io_m;
  wire       [3:0]    r_inv_io_x_0;
  wire       [3:0]    r_inv_io_x_1;
  wire       [11:0]   r_inv_io_m;
  wire       [3:0]    g16SqSc_2_io_t;
  wire       [3:0]    g16SqSc_3_io_t;
  wire       [3:0]    r_mul1_io_z_0;
  wire       [3:0]    r_mul1_io_z_1;
  wire       [3:0]    r_mul2_io_z_0;
  wire       [3:0]    r_mul2_io_z_1;
  wire       [3:0]    r_mul3_io_z_0;
  wire       [3:0]    r_mul3_io_z_1;
  wire       [3:0]    r_inv_io_z_0;
  wire       [3:0]    r_inv_io_z_1;
  wire       [3:0]    g16SqSc_2_io_x;
  wire       [3:0]    g16SqSc_3_io_x;
  wire       [3:0]    r_a_0;
  wire       [3:0]    r_a_1;
  wire       [3:0]    r_b_0;
  wire       [3:0]    r_b_1;
  wire       [3:0]    r_d_0;
  wire       [3:0]    r_d_1;
  wire       [3:0]    r_e_0;
  wire       [3:0]    r_e_1;
  wire       [3:0]    r_f_0;
  wire       [3:0]    r_f_1;
  wire       [3:0]    r_p_0;
  wire       [3:0]    r_p_1;
  wire       [3:0]    r_q_0;
  wire       [3:0]    r_q_1;
  reg        [3:0]    r_a1_0;
  reg        [3:0]    r_a1_1;
  reg        [3:0]    r_a2_0;
  reg        [3:0]    r_a2_1;
  reg        [3:0]    r_a3_0;
  reg        [3:0]    r_a3_1;
  reg        [3:0]    r_b1_0;
  reg        [3:0]    r_b1_1;
  reg        [3:0]    r_b2_0;
  reg        [3:0]    r_b2_1;
  reg        [3:0]    r_b3_0;
  reg        [3:0]    r_b3_1;
  reg        [3:0]    r_c_0;
  reg        [3:0]    r_c_1;

  G16Mul2SharesDepMul r_mul1 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a_0[3:0]          ), //i
    .io_x_1      (r_a_1[3:0]          ), //i
    .io_y_0      (r_b_0[3:0]          ), //i
    .io_y_1      (r_b_1[3:0]          ), //i
    .io_m        (r_mul1_io_m[7:0]    ), //i
    .io_z_0      (r_mul1_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul1_io_z_1[3:0]  )  //o
  );
  G16Mul2SharesIndepMul r_mul2 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_b3_0[3:0]         ), //i
    .io_x_1      (r_b3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul2_io_m[3:0]    ), //i
    .io_z_0      (r_mul2_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul2_io_z_1[3:0]  )  //o
  );
  G16Mul2SharesIndepMul r_mul3 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a3_0[3:0]         ), //i
    .io_x_1      (r_a3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul3_io_m[3:0]    ), //i
    .io_z_0      (r_mul3_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul3_io_z_1[3:0]  )  //o
  );
  G16Inv2SharesDep r_inv (
    .io_clk      (io_clk             ), //i
    .io_reset    (io_reset           ), //i
    .io_x_0      (r_inv_io_x_0[3:0]  ), //i
    .io_x_1      (r_inv_io_x_1[3:0]  ), //i
    .io_m        (r_inv_io_m[11:0]   ), //i
    .io_z_0      (r_inv_io_z_0[3:0]  ), //o
    .io_z_1      (r_inv_io_z_1[3:0]  )  //o
  );
  G16SqSc g16SqSc_2 (
    .io_t    (g16SqSc_2_io_t[3:0]  ), //i
    .io_x    (g16SqSc_2_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_3 (
    .io_t    (g16SqSc_3_io_t[3:0]  ), //i
    .io_x    (g16SqSc_3_io_x[3:0]  )  //o
  );
  assign r_a_0 = io_x_0[7 : 4];
  assign r_b_0 = io_x_0[3 : 0];
  assign r_a_1 = io_x_1[7 : 4];
  assign r_b_1 = io_x_1[3 : 0];
  assign g16SqSc_2_io_t = (r_a_0 ^ r_b_0);
  assign g16SqSc_3_io_t = (r_a_1 ^ r_b_1);
  assign r_mul1_io_m = io_m[27 : 20];
  assign r_d_0 = r_mul1_io_z_0;
  assign r_d_1 = r_mul1_io_z_1;
  assign r_inv_io_x_0 = (r_c_0 ^ r_d_0);
  assign r_inv_io_x_1 = (r_c_1 ^ r_d_1);
  assign r_inv_io_m = io_m[19 : 8];
  assign r_f_0 = r_inv_io_z_0;
  assign r_f_1 = r_inv_io_z_1;
  assign r_mul2_io_m = io_m[7 : 4];
  assign r_p_0 = r_mul2_io_z_0;
  assign r_p_1 = r_mul2_io_z_1;
  assign r_mul3_io_m = io_m[3 : 0];
  assign r_q_0 = r_mul3_io_z_0;
  assign r_q_1 = r_mul3_io_z_1;
  assign io_z_0 = {r_p_0,r_q_0};
  assign io_z_1 = {r_p_1,r_q_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_a1_0 <= 4'b0000;
      r_a1_1 <= 4'b0000;
      r_a2_0 <= 4'b0000;
      r_a2_1 <= 4'b0000;
      r_a3_0 <= 4'b0000;
      r_a3_1 <= 4'b0000;
      r_b1_0 <= 4'b0000;
      r_b1_1 <= 4'b0000;
      r_b2_0 <= 4'b0000;
      r_b2_1 <= 4'b0000;
      r_b3_0 <= 4'b0000;
      r_b3_1 <= 4'b0000;
      r_c_0 <= 4'b0000;
      r_c_1 <= 4'b0000;
    end else begin
      r_a1_0 <= r_a_0;
      r_a2_0 <= r_a1_0;
      r_a3_0 <= r_a2_0;
      r_b1_0 <= r_b_0;
      r_b2_0 <= r_b1_0;
      r_b3_0 <= r_b2_0;
      r_a1_1 <= r_a_1;
      r_a2_1 <= r_a1_1;
      r_a3_1 <= r_a2_1;
      r_b1_1 <= r_b_1;
      r_b2_1 <= r_b1_1;
      r_b3_1 <= r_b2_1;
      r_c_0 <= g16SqSc_2_io_x;
      r_c_1 <= g16SqSc_3_io_x;
    end
  end


endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

module NewBasis (
  input      [7:0]    io_input,
  input               io_direction,
  output reg [7:0]    io_output
);

  wire       [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  wire                when_NewBasis_l33;

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

  assign when_NewBasis_l33 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l33) begin
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
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    r_mul1_io_m;
  wire       [3:0]    r_mul2_io_m;
  wire       [3:0]    r_mul3_io_m;
  wire       [1:0]    g4Sq_8_io_t;
  wire       [1:0]    g4Sq_9_io_t;
  wire       [1:0]    g4Sq_10_io_t;
  wire       [1:0]    g4Sq_11_io_t;
  wire       [1:0]    r_mul1_io_z_0;
  wire       [1:0]    r_mul1_io_z_1;
  wire       [1:0]    r_mul2_io_z_0;
  wire       [1:0]    r_mul2_io_z_1;
  wire       [1:0]    r_mul3_io_z_0;
  wire       [1:0]    r_mul3_io_z_1;
  wire       [1:0]    g4Sq_8_io_x;
  wire       [1:0]    g4ScaleN_16_io_x;
  wire       [1:0]    g4Sq_9_io_x;
  wire       [1:0]    g4Sq_10_io_x;
  wire       [1:0]    g4ScaleN_17_io_x;
  wire       [1:0]    g4Sq_11_io_x;
  wire       [1:0]    r_a_0;
  wire       [1:0]    r_a_1;
  wire       [1:0]    r_b_0;
  wire       [1:0]    r_b_1;
  wire       [1:0]    r_d_0;
  wire       [1:0]    r_d_1;
  wire       [1:0]    r_e_0;
  wire       [1:0]    r_e_1;
  wire       [1:0]    r_p_0;
  wire       [1:0]    r_p_1;
  wire       [1:0]    r_q_0;
  wire       [1:0]    r_q_1;
  reg        [1:0]    r_c_0;
  reg        [1:0]    r_c_1;
  reg        [1:0]    r_a1_0;
  reg        [1:0]    r_a1_1;
  reg        [1:0]    r_b1_0;
  reg        [1:0]    r_b1_1;

  G4Mul2SharesDepMul r_mul1 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a_0[1:0]          ), //i
    .io_x_1      (r_a_1[1:0]          ), //i
    .io_y_0      (r_b_0[1:0]          ), //i
    .io_y_1      (r_b_1[1:0]          ), //i
    .io_m        (r_mul1_io_m[3:0]    ), //i
    .io_z_0      (r_mul1_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul1_io_z_1[1:0]  )  //o
  );
  G4Mul2SharesDepMul r_mul2 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_b1_0[1:0]         ), //i
    .io_x_1      (r_b1_1[1:0]         ), //i
    .io_y_0      (r_e_0[1:0]          ), //i
    .io_y_1      (r_e_1[1:0]          ), //i
    .io_m        (r_mul2_io_m[3:0]    ), //i
    .io_z_0      (r_mul2_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul2_io_z_1[1:0]  )  //o
  );
  G4Mul2SharesDepMul r_mul3 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a1_0[1:0]         ), //i
    .io_x_1      (r_a1_1[1:0]         ), //i
    .io_y_0      (r_e_0[1:0]          ), //i
    .io_y_1      (r_e_1[1:0]          ), //i
    .io_m        (r_mul3_io_m[3:0]    ), //i
    .io_z_0      (r_mul3_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul3_io_z_1[1:0]  )  //o
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
  assign r_a_0 = io_x_0[3 : 2];
  assign r_b_0 = io_x_0[1 : 0];
  assign g4Sq_8_io_t = (r_a_0 ^ r_b_0);
  assign g4Sq_9_io_t = (r_c_0 ^ r_d_0);
  assign r_e_0 = g4Sq_9_io_x;
  assign r_a_1 = io_x_1[3 : 2];
  assign r_b_1 = io_x_1[1 : 0];
  assign g4Sq_10_io_t = (r_a_1 ^ r_b_1);
  assign g4Sq_11_io_t = (r_c_1 ^ r_d_1);
  assign r_e_1 = g4Sq_11_io_x;
  assign r_mul1_io_m = io_m[11 : 8];
  assign r_d_0 = r_mul1_io_z_0;
  assign r_d_1 = r_mul1_io_z_1;
  assign r_mul2_io_m = io_m[7 : 4];
  assign r_p_0 = r_mul2_io_z_0;
  assign r_p_1 = r_mul2_io_z_1;
  assign r_mul3_io_m = io_m[3 : 0];
  assign r_q_0 = r_mul3_io_z_0;
  assign r_q_1 = r_mul3_io_z_1;
  assign io_z_0 = {r_p_0,r_q_0};
  assign io_z_1 = {r_p_1,r_q_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_c_0 <= 2'b00;
      r_c_1 <= 2'b00;
      r_a1_0 <= 2'b00;
      r_a1_1 <= 2'b00;
      r_b1_0 <= 2'b00;
      r_b1_1 <= 2'b00;
    end else begin
      r_a1_0 <= r_a_0;
      r_b1_0 <= r_b_0;
      r_c_0 <= g4ScaleN_16_io_x;
      r_a1_1 <= r_a_1;
      r_b1_1 <= r_b_1;
      r_c_1 <= g4ScaleN_17_io_x;
    end
  end


endmodule

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

module G16Mul2SharesIndepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    r_mul1_io_x;
  wire       [3:0]    r_mul2_io_x;
  wire       [3:0]    r_mul3_io_x;
  wire       [3:0]    r_mul4_io_x;
  reg        [3:0]    r_r0;
  reg        [3:0]    r_r1;
  reg        [3:0]    r_r2;
  reg        [3:0]    r_r3;

  G16Mul r_mul1 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul1_io_x[3:0]  )  //o
  );
  G16Mul r_mul2 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul2_io_x[3:0]  )  //o
  );
  G16Mul r_mul3 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul3_io_x[3:0]  )  //o
  );
  G16Mul r_mul4 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul4_io_x[3:0]  )  //o
  );
  assign io_z_0 = (r_r0 ^ r_r1);
  assign io_z_1 = (r_r2 ^ r_r3);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_r0 <= 4'b0000;
      r_r1 <= 4'b0000;
      r_r2 <= 4'b0000;
      r_r3 <= 4'b0000;
    end else begin
      r_r0 <= r_mul1_io_x;
      r_r1 <= (r_mul2_io_x ^ io_m);
      r_r2 <= (r_mul3_io_x ^ io_m);
      r_r3 <= r_mul4_io_x;
    end
  end


endmodule

module G16Mul2SharesDepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [7:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    g16Mul_18_io_b;
  wire       [3:0]    g16Mul_19_io_b;
  wire       [3:0]    g16Mul_14_io_x;
  wire       [3:0]    g16Mul_15_io_x;
  wire       [3:0]    g16Mul_16_io_x;
  wire       [3:0]    g16Mul_17_io_x;
  wire       [3:0]    g16Mul_18_io_x;
  wire       [3:0]    g16Mul_19_io_x;
  wire       [3:0]    r_xTimesBlindedY_0;
  wire       [3:0]    r_xTimesBlindedY_1;
  wire       [3:0]    r_xTimesM_0;
  wire       [3:0]    r_xTimesM_1;
  wire       [3:0]    r_xTimesY_0;
  wire       [3:0]    r_xTimesY_1;
  reg        [3:0]    r_blindedY_0;
  reg        [3:0]    r_blindedY_1;
  reg        [3:0]    r_xTimesMBlinded_0;
  reg        [3:0]    r_xTimesMBlinded_1;
  reg        [3:0]    r_X_0;
  reg        [3:0]    r_X_1;
  reg        [3:0]    r_Y_0;
  reg        [3:0]    r_Y_1;

  G16Mul g16Mul_14 (
    .io_a    (r_X_0[3:0]           ), //i
    .io_b    (r_blindedY_0[3:0]    ), //i
    .io_x    (g16Mul_14_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_15 (
    .io_a    (r_X_1[3:0]           ), //i
    .io_b    (r_blindedY_1[3:0]    ), //i
    .io_x    (g16Mul_15_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_16 (
    .io_a    (r_X_0[3:0]           ), //i
    .io_b    (r_Y_0[3:0]           ), //i
    .io_x    (g16Mul_16_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_17 (
    .io_a    (r_X_1[3:0]           ), //i
    .io_b    (r_Y_1[3:0]           ), //i
    .io_x    (g16Mul_17_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_18 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (g16Mul_18_io_b[3:0]  ), //i
    .io_x    (g16Mul_18_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_19 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (g16Mul_19_io_b[3:0]  ), //i
    .io_x    (g16Mul_19_io_x[3:0]  )  //o
  );
  assign io_z_0 = ((r_xTimesY_0 ^ r_xTimesBlindedY_0) ^ r_xTimesMBlinded_0);
  assign io_z_1 = ((r_xTimesY_1 ^ r_xTimesBlindedY_1) ^ r_xTimesMBlinded_1);
  assign r_xTimesBlindedY_0 = g16Mul_14_io_x;
  assign r_xTimesBlindedY_1 = g16Mul_15_io_x;
  assign r_xTimesY_0 = g16Mul_16_io_x;
  assign r_xTimesY_1 = g16Mul_17_io_x;
  assign g16Mul_18_io_b = io_m[7 : 4];
  assign r_xTimesM_0 = g16Mul_18_io_x;
  assign g16Mul_19_io_b = io_m[7 : 4];
  assign r_xTimesM_1 = g16Mul_19_io_x;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_blindedY_0 <= 4'b0000;
      r_blindedY_1 <= 4'b0000;
      r_xTimesMBlinded_0 <= 4'b0000;
      r_xTimesMBlinded_1 <= 4'b0000;
      r_X_0 <= 4'b0000;
      r_X_1 <= 4'b0000;
      r_Y_0 <= 4'b0000;
      r_Y_1 <= 4'b0000;
    end else begin
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 ^ io_m[7 : 4]);
      r_blindedY_1 <= (io_y_0 ^ io_m[7 : 4]);
      r_xTimesMBlinded_0 <= (r_xTimesM_0 ^ io_m[3 : 0]);
      r_xTimesMBlinded_1 <= (r_xTimesM_1 ^ io_m[3 : 0]);
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
  input               io_clk,
  input               io_reset,
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [3:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1
);

  wire       [1:0]    g4Mul_64_io_b;
  wire       [1:0]    g4Mul_65_io_b;
  wire       [1:0]    g4Mul_60_io_x;
  wire       [1:0]    g4Mul_61_io_x;
  wire       [1:0]    g4Mul_62_io_x;
  wire       [1:0]    g4Mul_63_io_x;
  wire       [1:0]    g4Mul_64_io_x;
  wire       [1:0]    g4Mul_65_io_x;
  wire       [1:0]    r_xTimesBlindedY_0;
  wire       [1:0]    r_xTimesBlindedY_1;
  wire       [1:0]    r_xTimesM_0;
  wire       [1:0]    r_xTimesM_1;
  wire       [1:0]    r_xTimesY_0;
  wire       [1:0]    r_xTimesY_1;
  reg        [1:0]    r_blindedY_0;
  reg        [1:0]    r_blindedY_1;
  reg        [1:0]    r_xTimesMBlinded_0;
  reg        [1:0]    r_xTimesMBlinded_1;
  reg        [1:0]    r_X_0;
  reg        [1:0]    r_X_1;
  reg        [1:0]    r_Y_0;
  reg        [1:0]    r_Y_1;

  G4Mul g4Mul_60 (
    .io_a    (r_X_0[1:0]          ), //i
    .io_b    (r_blindedY_0[1:0]   ), //i
    .io_x    (g4Mul_60_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_61 (
    .io_a    (r_X_1[1:0]          ), //i
    .io_b    (r_blindedY_1[1:0]   ), //i
    .io_x    (g4Mul_61_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_62 (
    .io_a    (r_X_0[1:0]          ), //i
    .io_b    (r_Y_0[1:0]          ), //i
    .io_x    (g4Mul_62_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_63 (
    .io_a    (r_X_1[1:0]          ), //i
    .io_b    (r_Y_1[1:0]          ), //i
    .io_x    (g4Mul_63_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_64 (
    .io_a    (io_x_0[1:0]         ), //i
    .io_b    (g4Mul_64_io_b[1:0]  ), //i
    .io_x    (g4Mul_64_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_65 (
    .io_a    (io_x_1[1:0]         ), //i
    .io_b    (g4Mul_65_io_b[1:0]  ), //i
    .io_x    (g4Mul_65_io_x[1:0]  )  //o
  );
  assign io_z_0 = ((r_xTimesY_0 ^ r_xTimesBlindedY_0) ^ r_xTimesMBlinded_0);
  assign io_z_1 = ((r_xTimesY_1 ^ r_xTimesBlindedY_1) ^ r_xTimesMBlinded_1);
  assign r_xTimesBlindedY_0 = g4Mul_60_io_x;
  assign r_xTimesBlindedY_1 = g4Mul_61_io_x;
  assign r_xTimesY_0 = g4Mul_62_io_x;
  assign r_xTimesY_1 = g4Mul_63_io_x;
  assign g4Mul_64_io_b = io_m[3 : 2];
  assign r_xTimesM_0 = g4Mul_64_io_x;
  assign g4Mul_65_io_b = io_m[3 : 2];
  assign r_xTimesM_1 = g4Mul_65_io_x;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_blindedY_0 <= 2'b00;
      r_blindedY_1 <= 2'b00;
      r_xTimesMBlinded_0 <= 2'b00;
      r_xTimesMBlinded_1 <= 2'b00;
      r_X_0 <= 2'b00;
      r_X_1 <= 2'b00;
      r_Y_0 <= 2'b00;
      r_Y_1 <= 2'b00;
    end else begin
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 ^ io_m[3 : 2]);
      r_blindedY_1 <= (io_y_0 ^ io_m[3 : 2]);
      r_xTimesMBlinded_0 <= (r_xTimesM_0 ^ io_m[1 : 0]);
      r_xTimesMBlinded_1 <= (r_xTimesM_1 ^ io_m[1 : 0]);
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
