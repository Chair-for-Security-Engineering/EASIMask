// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : KECCAK
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module KECCAK (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [1599:0] io_keccakIn,
  output     [1599:0] io_keccakOut,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sExecute = 2'd1;
  localparam States_sDone = 2'd2;

  wire       [1599:0] r_theta_io_thetaOut;
  wire       [1599:0] r_rhopi_io_rhoOut;
  wire       [1599:0] r_chi_io_chiOut;
  wire       [1599:0] r_iota_io_iotaOut;
  wire       [4:0]    _zz_r_roundCounter_valueNext;
  wire       [0:0]    _zz_r_roundCounter_valueNext_1;
  reg        [1599:0] r_state;
  reg                 r_roundCounter_willIncrement;
  reg                 r_roundCounter_willClear;
  reg        [4:0]    r_roundCounter_valueNext;
  reg        [4:0]    r_roundCounter_value;
  wire                r_roundCounter_willOverflowIfInc;
  wire                r_roundCounter_willOverflow;
  wire       [1599:0] r_thetaIn;
  wire       [1599:0] r_thetaOut;
  wire       [1599:0] r_rhoOut;
  wire       [1599:0] r_chiOut;
  wire       [1599:0] r_iotaOut;
  wire       [63:0]   r_current_0_0;
  wire       [63:0]   r_current_0_1;
  wire       [63:0]   r_current_0_2;
  wire       [63:0]   r_current_0_3;
  wire       [63:0]   r_current_0_4;
  wire       [63:0]   r_current_1_0;
  wire       [63:0]   r_current_1_1;
  wire       [63:0]   r_current_1_2;
  wire       [63:0]   r_current_1_3;
  wire       [63:0]   r_current_1_4;
  wire       [63:0]   r_current_2_0;
  wire       [63:0]   r_current_2_1;
  wire       [63:0]   r_current_2_2;
  wire       [63:0]   r_current_2_3;
  wire       [63:0]   r_current_2_4;
  wire       [63:0]   r_current_3_0;
  wire       [63:0]   r_current_3_1;
  wire       [63:0]   r_current_3_2;
  wire       [63:0]   r_current_3_3;
  wire       [63:0]   r_current_3_4;
  wire       [63:0]   r_current_4_0;
  wire       [63:0]   r_current_4_1;
  wire       [63:0]   r_current_4_2;
  wire       [63:0]   r_current_4_3;
  wire       [63:0]   r_current_4_4;
  reg        [1:0]    r_keccakState;
  `ifndef SYNTHESIS
  reg [63:0] r_keccakState_string;
  `endif


  assign _zz_r_roundCounter_valueNext_1 = r_roundCounter_willIncrement;
  assign _zz_r_roundCounter_valueNext = {4'd0, _zz_r_roundCounter_valueNext_1};
  Theta r_theta (
    .io_thetaIn     (r_thetaIn[1599:0]            ), //i
    .io_thetaOut    (r_theta_io_thetaOut[1599:0]  )  //o
  );
  RhoPi r_rhopi (
    .io_rhoIn     (r_thetaOut[1599:0]         ), //i
    .io_rhoOut    (r_rhopi_io_rhoOut[1599:0]  )  //o
  );
  Chi r_chi (
    .io_chiIn     (r_rhoOut[1599:0]         ), //i
    .io_chiOut    (r_chi_io_chiOut[1599:0]  )  //o
  );
  Iota r_iota (
    .io_iotaIn     (r_chiOut[1599:0]           ), //i
    .io_round      (r_roundCounter_value[4:0]  ), //i
    .io_iotaOut    (r_iota_io_iotaOut[1599:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_keccakState)
      States_sIdle : r_keccakState_string = "sIdle   ";
      States_sExecute : r_keccakState_string = "sExecute";
      States_sDone : r_keccakState_string = "sDone   ";
      default : r_keccakState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(r_keccakState)
      States_sIdle : begin
      end
      States_sExecute : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willIncrement = 1'b0;
    case(r_keccakState)
      States_sIdle : begin
      end
      States_sExecute : begin
        r_roundCounter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willClear = 1'b0;
    case(r_keccakState)
      States_sIdle : begin
        r_roundCounter_willClear = 1'b1;
      end
      States_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign r_roundCounter_willOverflowIfInc = (r_roundCounter_value == 5'h17);
  assign r_roundCounter_willOverflow = (r_roundCounter_willOverflowIfInc && r_roundCounter_willIncrement);
  always @(*) begin
    if(r_roundCounter_willOverflow) begin
      r_roundCounter_valueNext = 5'h0;
    end else begin
      r_roundCounter_valueNext = (r_roundCounter_value + _zz_r_roundCounter_valueNext);
    end
    if(r_roundCounter_willClear) begin
      r_roundCounter_valueNext = 5'h0;
    end
  end

  assign r_current_0_0 = r_iotaOut[1599 : 1536];
  assign r_current_0_1 = r_iotaOut[1535 : 1472];
  assign r_current_0_2 = r_iotaOut[1471 : 1408];
  assign r_current_0_3 = r_iotaOut[1407 : 1344];
  assign r_current_0_4 = r_iotaOut[1343 : 1280];
  assign r_current_1_0 = r_iotaOut[1279 : 1216];
  assign r_current_1_1 = r_iotaOut[1215 : 1152];
  assign r_current_1_2 = r_iotaOut[1151 : 1088];
  assign r_current_1_3 = r_iotaOut[1087 : 1024];
  assign r_current_1_4 = r_iotaOut[1023 : 960];
  assign r_current_2_0 = r_iotaOut[959 : 896];
  assign r_current_2_1 = r_iotaOut[895 : 832];
  assign r_current_2_2 = r_iotaOut[831 : 768];
  assign r_current_2_3 = r_iotaOut[767 : 704];
  assign r_current_2_4 = r_iotaOut[703 : 640];
  assign r_current_3_0 = r_iotaOut[639 : 576];
  assign r_current_3_1 = r_iotaOut[575 : 512];
  assign r_current_3_2 = r_iotaOut[511 : 448];
  assign r_current_3_3 = r_iotaOut[447 : 384];
  assign r_current_3_4 = r_iotaOut[383 : 320];
  assign r_current_4_0 = r_iotaOut[319 : 256];
  assign r_current_4_1 = r_iotaOut[255 : 192];
  assign r_current_4_2 = r_iotaOut[191 : 128];
  assign r_current_4_3 = r_iotaOut[127 : 64];
  assign r_current_4_4 = r_iotaOut[63 : 0];
  assign io_keccakOut = r_state;
  assign r_thetaIn = r_state;
  assign r_thetaOut = r_theta_io_thetaOut;
  assign r_rhoOut = r_rhopi_io_rhoOut;
  assign r_chiOut = r_chi_io_chiOut;
  assign r_iotaOut = r_iota_io_iotaOut;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_state <= 1600'h0;
      r_roundCounter_value <= 5'h0;
      r_keccakState <= States_sIdle;
    end else begin
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_state <= r_iotaOut;
      case(r_keccakState)
        States_sIdle : begin
          r_keccakState <= States_sIdle;
          if(io_enable) begin
            r_state <= io_keccakIn;
            r_keccakState <= States_sExecute;
          end
        end
        States_sExecute : begin
          r_keccakState <= States_sExecute;
          if(r_roundCounter_willOverflow) begin
            r_keccakState <= States_sDone;
          end
        end
        default : begin
          r_keccakState <= States_sDone;
        end
      endcase
    end
  end


endmodule

module Iota (
  input      [1599:0] io_iotaIn,
  input      [4:0]    io_round,
  output     [1599:0] io_iotaOut
);

  wire       [63:0]   roundConstant;
  reg        [63:0]   _zz_roundConstant;

  always @(*) begin
    case(io_round)
      5'h0 : begin
        _zz_roundConstant = 64'h0000000000000001;
      end
      5'h01 : begin
        _zz_roundConstant = 64'h0000000000008082;
      end
      5'h02 : begin
        _zz_roundConstant = 64'h800000000000808a;
      end
      5'h03 : begin
        _zz_roundConstant = 64'h8000000080008000;
      end
      5'h04 : begin
        _zz_roundConstant = 64'h000000000000808b;
      end
      5'h05 : begin
        _zz_roundConstant = 64'h0000000080000001;
      end
      5'h06 : begin
        _zz_roundConstant = 64'h8000000080008081;
      end
      5'h07 : begin
        _zz_roundConstant = 64'h8000000000008009;
      end
      5'h08 : begin
        _zz_roundConstant = 64'h000000000000008a;
      end
      5'h09 : begin
        _zz_roundConstant = 64'h0000000000000088;
      end
      5'h0a : begin
        _zz_roundConstant = 64'h0000000080008009;
      end
      5'h0b : begin
        _zz_roundConstant = 64'h000000008000000a;
      end
      5'h0c : begin
        _zz_roundConstant = 64'h000000008000808b;
      end
      5'h0d : begin
        _zz_roundConstant = 64'h800000000000008b;
      end
      5'h0e : begin
        _zz_roundConstant = 64'h8000000000008089;
      end
      5'h0f : begin
        _zz_roundConstant = 64'h8000000000008003;
      end
      5'h10 : begin
        _zz_roundConstant = 64'h8000000000008002;
      end
      5'h11 : begin
        _zz_roundConstant = 64'h8000000000000080;
      end
      5'h12 : begin
        _zz_roundConstant = 64'h000000000000800a;
      end
      5'h13 : begin
        _zz_roundConstant = 64'h800000008000000a;
      end
      5'h14 : begin
        _zz_roundConstant = 64'h8000000080008081;
      end
      5'h15 : begin
        _zz_roundConstant = 64'h8000000000008080;
      end
      5'h16 : begin
        _zz_roundConstant = 64'h0000000080000001;
      end
      5'h17 : begin
        _zz_roundConstant = 64'h8000000080008008;
      end
      default : begin
        _zz_roundConstant = 64'h0;
      end
    endcase
  end

  assign roundConstant = _zz_roundConstant;
  assign io_iotaOut = {(io_iotaIn[1599 : 1536] ^ roundConstant),io_iotaIn[1535 : 0]};

endmodule

module Chi (
  input      [1599:0] io_chiIn,
  output reg [1599:0] io_chiOut
);

  wire       [63:0]   sBox_25_io_a1;
  wire       [63:0]   sBox_25_io_a2;
  wire       [63:0]   sBox_25_io_a3;
  wire       [63:0]   sBox_26_io_a1;
  wire       [63:0]   sBox_26_io_a2;
  wire       [63:0]   sBox_26_io_a3;
  wire       [63:0]   sBox_27_io_a1;
  wire       [63:0]   sBox_27_io_a2;
  wire       [63:0]   sBox_27_io_a3;
  wire       [63:0]   sBox_28_io_a1;
  wire       [63:0]   sBox_28_io_a2;
  wire       [63:0]   sBox_28_io_a3;
  wire       [63:0]   sBox_29_io_a1;
  wire       [63:0]   sBox_29_io_a2;
  wire       [63:0]   sBox_29_io_a3;
  wire       [63:0]   sBox_30_io_a1;
  wire       [63:0]   sBox_30_io_a2;
  wire       [63:0]   sBox_30_io_a3;
  wire       [63:0]   sBox_31_io_a1;
  wire       [63:0]   sBox_31_io_a2;
  wire       [63:0]   sBox_31_io_a3;
  wire       [63:0]   sBox_32_io_a1;
  wire       [63:0]   sBox_32_io_a2;
  wire       [63:0]   sBox_32_io_a3;
  wire       [63:0]   sBox_33_io_a1;
  wire       [63:0]   sBox_33_io_a2;
  wire       [63:0]   sBox_33_io_a3;
  wire       [63:0]   sBox_34_io_a1;
  wire       [63:0]   sBox_34_io_a2;
  wire       [63:0]   sBox_34_io_a3;
  wire       [63:0]   sBox_35_io_a1;
  wire       [63:0]   sBox_35_io_a2;
  wire       [63:0]   sBox_35_io_a3;
  wire       [63:0]   sBox_36_io_a1;
  wire       [63:0]   sBox_36_io_a2;
  wire       [63:0]   sBox_36_io_a3;
  wire       [63:0]   sBox_37_io_a1;
  wire       [63:0]   sBox_37_io_a2;
  wire       [63:0]   sBox_37_io_a3;
  wire       [63:0]   sBox_38_io_a1;
  wire       [63:0]   sBox_38_io_a2;
  wire       [63:0]   sBox_38_io_a3;
  wire       [63:0]   sBox_39_io_a1;
  wire       [63:0]   sBox_39_io_a2;
  wire       [63:0]   sBox_39_io_a3;
  wire       [63:0]   sBox_40_io_a1;
  wire       [63:0]   sBox_40_io_a2;
  wire       [63:0]   sBox_40_io_a3;
  wire       [63:0]   sBox_41_io_a1;
  wire       [63:0]   sBox_41_io_a2;
  wire       [63:0]   sBox_41_io_a3;
  wire       [63:0]   sBox_42_io_a1;
  wire       [63:0]   sBox_42_io_a2;
  wire       [63:0]   sBox_42_io_a3;
  wire       [63:0]   sBox_43_io_a1;
  wire       [63:0]   sBox_43_io_a2;
  wire       [63:0]   sBox_43_io_a3;
  wire       [63:0]   sBox_44_io_a1;
  wire       [63:0]   sBox_44_io_a2;
  wire       [63:0]   sBox_44_io_a3;
  wire       [63:0]   sBox_45_io_a1;
  wire       [63:0]   sBox_45_io_a2;
  wire       [63:0]   sBox_45_io_a3;
  wire       [63:0]   sBox_46_io_a1;
  wire       [63:0]   sBox_46_io_a2;
  wire       [63:0]   sBox_46_io_a3;
  wire       [63:0]   sBox_47_io_a1;
  wire       [63:0]   sBox_47_io_a2;
  wire       [63:0]   sBox_47_io_a3;
  wire       [63:0]   sBox_48_io_a1;
  wire       [63:0]   sBox_48_io_a2;
  wire       [63:0]   sBox_48_io_a3;
  wire       [63:0]   sBox_49_io_a1;
  wire       [63:0]   sBox_49_io_a2;
  wire       [63:0]   sBox_49_io_a3;
  wire       [63:0]   sBox_25_io_res;
  wire       [63:0]   sBox_26_io_res;
  wire       [63:0]   sBox_27_io_res;
  wire       [63:0]   sBox_28_io_res;
  wire       [63:0]   sBox_29_io_res;
  wire       [63:0]   sBox_30_io_res;
  wire       [63:0]   sBox_31_io_res;
  wire       [63:0]   sBox_32_io_res;
  wire       [63:0]   sBox_33_io_res;
  wire       [63:0]   sBox_34_io_res;
  wire       [63:0]   sBox_35_io_res;
  wire       [63:0]   sBox_36_io_res;
  wire       [63:0]   sBox_37_io_res;
  wire       [63:0]   sBox_38_io_res;
  wire       [63:0]   sBox_39_io_res;
  wire       [63:0]   sBox_40_io_res;
  wire       [63:0]   sBox_41_io_res;
  wire       [63:0]   sBox_42_io_res;
  wire       [63:0]   sBox_43_io_res;
  wire       [63:0]   sBox_44_io_res;
  wire       [63:0]   sBox_45_io_res;
  wire       [63:0]   sBox_46_io_res;
  wire       [63:0]   sBox_47_io_res;
  wire       [63:0]   sBox_48_io_res;
  wire       [63:0]   sBox_49_io_res;

  SBox sBox_25 (
    .io_a1     (sBox_25_io_a1[63:0]   ), //i
    .io_a2     (sBox_25_io_a2[63:0]   ), //i
    .io_a3     (sBox_25_io_a3[63:0]   ), //i
    .io_res    (sBox_25_io_res[63:0]  )  //o
  );
  SBox sBox_26 (
    .io_a1     (sBox_26_io_a1[63:0]   ), //i
    .io_a2     (sBox_26_io_a2[63:0]   ), //i
    .io_a3     (sBox_26_io_a3[63:0]   ), //i
    .io_res    (sBox_26_io_res[63:0]  )  //o
  );
  SBox sBox_27 (
    .io_a1     (sBox_27_io_a1[63:0]   ), //i
    .io_a2     (sBox_27_io_a2[63:0]   ), //i
    .io_a3     (sBox_27_io_a3[63:0]   ), //i
    .io_res    (sBox_27_io_res[63:0]  )  //o
  );
  SBox sBox_28 (
    .io_a1     (sBox_28_io_a1[63:0]   ), //i
    .io_a2     (sBox_28_io_a2[63:0]   ), //i
    .io_a3     (sBox_28_io_a3[63:0]   ), //i
    .io_res    (sBox_28_io_res[63:0]  )  //o
  );
  SBox sBox_29 (
    .io_a1     (sBox_29_io_a1[63:0]   ), //i
    .io_a2     (sBox_29_io_a2[63:0]   ), //i
    .io_a3     (sBox_29_io_a3[63:0]   ), //i
    .io_res    (sBox_29_io_res[63:0]  )  //o
  );
  SBox sBox_30 (
    .io_a1     (sBox_30_io_a1[63:0]   ), //i
    .io_a2     (sBox_30_io_a2[63:0]   ), //i
    .io_a3     (sBox_30_io_a3[63:0]   ), //i
    .io_res    (sBox_30_io_res[63:0]  )  //o
  );
  SBox sBox_31 (
    .io_a1     (sBox_31_io_a1[63:0]   ), //i
    .io_a2     (sBox_31_io_a2[63:0]   ), //i
    .io_a3     (sBox_31_io_a3[63:0]   ), //i
    .io_res    (sBox_31_io_res[63:0]  )  //o
  );
  SBox sBox_32 (
    .io_a1     (sBox_32_io_a1[63:0]   ), //i
    .io_a2     (sBox_32_io_a2[63:0]   ), //i
    .io_a3     (sBox_32_io_a3[63:0]   ), //i
    .io_res    (sBox_32_io_res[63:0]  )  //o
  );
  SBox sBox_33 (
    .io_a1     (sBox_33_io_a1[63:0]   ), //i
    .io_a2     (sBox_33_io_a2[63:0]   ), //i
    .io_a3     (sBox_33_io_a3[63:0]   ), //i
    .io_res    (sBox_33_io_res[63:0]  )  //o
  );
  SBox sBox_34 (
    .io_a1     (sBox_34_io_a1[63:0]   ), //i
    .io_a2     (sBox_34_io_a2[63:0]   ), //i
    .io_a3     (sBox_34_io_a3[63:0]   ), //i
    .io_res    (sBox_34_io_res[63:0]  )  //o
  );
  SBox sBox_35 (
    .io_a1     (sBox_35_io_a1[63:0]   ), //i
    .io_a2     (sBox_35_io_a2[63:0]   ), //i
    .io_a3     (sBox_35_io_a3[63:0]   ), //i
    .io_res    (sBox_35_io_res[63:0]  )  //o
  );
  SBox sBox_36 (
    .io_a1     (sBox_36_io_a1[63:0]   ), //i
    .io_a2     (sBox_36_io_a2[63:0]   ), //i
    .io_a3     (sBox_36_io_a3[63:0]   ), //i
    .io_res    (sBox_36_io_res[63:0]  )  //o
  );
  SBox sBox_37 (
    .io_a1     (sBox_37_io_a1[63:0]   ), //i
    .io_a2     (sBox_37_io_a2[63:0]   ), //i
    .io_a3     (sBox_37_io_a3[63:0]   ), //i
    .io_res    (sBox_37_io_res[63:0]  )  //o
  );
  SBox sBox_38 (
    .io_a1     (sBox_38_io_a1[63:0]   ), //i
    .io_a2     (sBox_38_io_a2[63:0]   ), //i
    .io_a3     (sBox_38_io_a3[63:0]   ), //i
    .io_res    (sBox_38_io_res[63:0]  )  //o
  );
  SBox sBox_39 (
    .io_a1     (sBox_39_io_a1[63:0]   ), //i
    .io_a2     (sBox_39_io_a2[63:0]   ), //i
    .io_a3     (sBox_39_io_a3[63:0]   ), //i
    .io_res    (sBox_39_io_res[63:0]  )  //o
  );
  SBox sBox_40 (
    .io_a1     (sBox_40_io_a1[63:0]   ), //i
    .io_a2     (sBox_40_io_a2[63:0]   ), //i
    .io_a3     (sBox_40_io_a3[63:0]   ), //i
    .io_res    (sBox_40_io_res[63:0]  )  //o
  );
  SBox sBox_41 (
    .io_a1     (sBox_41_io_a1[63:0]   ), //i
    .io_a2     (sBox_41_io_a2[63:0]   ), //i
    .io_a3     (sBox_41_io_a3[63:0]   ), //i
    .io_res    (sBox_41_io_res[63:0]  )  //o
  );
  SBox sBox_42 (
    .io_a1     (sBox_42_io_a1[63:0]   ), //i
    .io_a2     (sBox_42_io_a2[63:0]   ), //i
    .io_a3     (sBox_42_io_a3[63:0]   ), //i
    .io_res    (sBox_42_io_res[63:0]  )  //o
  );
  SBox sBox_43 (
    .io_a1     (sBox_43_io_a1[63:0]   ), //i
    .io_a2     (sBox_43_io_a2[63:0]   ), //i
    .io_a3     (sBox_43_io_a3[63:0]   ), //i
    .io_res    (sBox_43_io_res[63:0]  )  //o
  );
  SBox sBox_44 (
    .io_a1     (sBox_44_io_a1[63:0]   ), //i
    .io_a2     (sBox_44_io_a2[63:0]   ), //i
    .io_a3     (sBox_44_io_a3[63:0]   ), //i
    .io_res    (sBox_44_io_res[63:0]  )  //o
  );
  SBox sBox_45 (
    .io_a1     (sBox_45_io_a1[63:0]   ), //i
    .io_a2     (sBox_45_io_a2[63:0]   ), //i
    .io_a3     (sBox_45_io_a3[63:0]   ), //i
    .io_res    (sBox_45_io_res[63:0]  )  //o
  );
  SBox sBox_46 (
    .io_a1     (sBox_46_io_a1[63:0]   ), //i
    .io_a2     (sBox_46_io_a2[63:0]   ), //i
    .io_a3     (sBox_46_io_a3[63:0]   ), //i
    .io_res    (sBox_46_io_res[63:0]  )  //o
  );
  SBox sBox_47 (
    .io_a1     (sBox_47_io_a1[63:0]   ), //i
    .io_a2     (sBox_47_io_a2[63:0]   ), //i
    .io_a3     (sBox_47_io_a3[63:0]   ), //i
    .io_res    (sBox_47_io_res[63:0]  )  //o
  );
  SBox sBox_48 (
    .io_a1     (sBox_48_io_a1[63:0]   ), //i
    .io_a2     (sBox_48_io_a2[63:0]   ), //i
    .io_a3     (sBox_48_io_a3[63:0]   ), //i
    .io_res    (sBox_48_io_res[63:0]  )  //o
  );
  SBox sBox_49 (
    .io_a1     (sBox_49_io_a1[63:0]   ), //i
    .io_a2     (sBox_49_io_a2[63:0]   ), //i
    .io_a3     (sBox_49_io_a3[63:0]   ), //i
    .io_res    (sBox_49_io_res[63:0]  )  //o
  );
  assign sBox_25_io_a1 = io_chiIn[1599 : 1536];
  assign sBox_25_io_a2 = io_chiIn[1535 : 1472];
  assign sBox_25_io_a3 = io_chiIn[1471 : 1408];
  always @(*) begin
    io_chiOut[1599 : 1536] = sBox_25_io_res;
    io_chiOut[1535 : 1472] = sBox_26_io_res;
    io_chiOut[1471 : 1408] = sBox_27_io_res;
    io_chiOut[1407 : 1344] = sBox_28_io_res;
    io_chiOut[1343 : 1280] = sBox_29_io_res;
    io_chiOut[1279 : 1216] = sBox_30_io_res;
    io_chiOut[1215 : 1152] = sBox_31_io_res;
    io_chiOut[1151 : 1088] = sBox_32_io_res;
    io_chiOut[1087 : 1024] = sBox_33_io_res;
    io_chiOut[1023 : 960] = sBox_34_io_res;
    io_chiOut[959 : 896] = sBox_35_io_res;
    io_chiOut[895 : 832] = sBox_36_io_res;
    io_chiOut[831 : 768] = sBox_37_io_res;
    io_chiOut[767 : 704] = sBox_38_io_res;
    io_chiOut[703 : 640] = sBox_39_io_res;
    io_chiOut[639 : 576] = sBox_40_io_res;
    io_chiOut[575 : 512] = sBox_41_io_res;
    io_chiOut[511 : 448] = sBox_42_io_res;
    io_chiOut[447 : 384] = sBox_43_io_res;
    io_chiOut[383 : 320] = sBox_44_io_res;
    io_chiOut[319 : 256] = sBox_45_io_res;
    io_chiOut[255 : 192] = sBox_46_io_res;
    io_chiOut[191 : 128] = sBox_47_io_res;
    io_chiOut[127 : 64] = sBox_48_io_res;
    io_chiOut[63 : 0] = sBox_49_io_res;
  end

  assign sBox_26_io_a1 = io_chiIn[1535 : 1472];
  assign sBox_26_io_a2 = io_chiIn[1471 : 1408];
  assign sBox_26_io_a3 = io_chiIn[1407 : 1344];
  assign sBox_27_io_a1 = io_chiIn[1471 : 1408];
  assign sBox_27_io_a2 = io_chiIn[1407 : 1344];
  assign sBox_27_io_a3 = io_chiIn[1343 : 1280];
  assign sBox_28_io_a1 = io_chiIn[1407 : 1344];
  assign sBox_28_io_a2 = io_chiIn[1343 : 1280];
  assign sBox_28_io_a3 = io_chiIn[1599 : 1536];
  assign sBox_29_io_a1 = io_chiIn[1343 : 1280];
  assign sBox_29_io_a2 = io_chiIn[1599 : 1536];
  assign sBox_29_io_a3 = io_chiIn[1535 : 1472];
  assign sBox_30_io_a1 = io_chiIn[1279 : 1216];
  assign sBox_30_io_a2 = io_chiIn[1215 : 1152];
  assign sBox_30_io_a3 = io_chiIn[1151 : 1088];
  assign sBox_31_io_a1 = io_chiIn[1215 : 1152];
  assign sBox_31_io_a2 = io_chiIn[1151 : 1088];
  assign sBox_31_io_a3 = io_chiIn[1087 : 1024];
  assign sBox_32_io_a1 = io_chiIn[1151 : 1088];
  assign sBox_32_io_a2 = io_chiIn[1087 : 1024];
  assign sBox_32_io_a3 = io_chiIn[1023 : 960];
  assign sBox_33_io_a1 = io_chiIn[1087 : 1024];
  assign sBox_33_io_a2 = io_chiIn[1023 : 960];
  assign sBox_33_io_a3 = io_chiIn[1279 : 1216];
  assign sBox_34_io_a1 = io_chiIn[1023 : 960];
  assign sBox_34_io_a2 = io_chiIn[1279 : 1216];
  assign sBox_34_io_a3 = io_chiIn[1215 : 1152];
  assign sBox_35_io_a1 = io_chiIn[959 : 896];
  assign sBox_35_io_a2 = io_chiIn[895 : 832];
  assign sBox_35_io_a3 = io_chiIn[831 : 768];
  assign sBox_36_io_a1 = io_chiIn[895 : 832];
  assign sBox_36_io_a2 = io_chiIn[831 : 768];
  assign sBox_36_io_a3 = io_chiIn[767 : 704];
  assign sBox_37_io_a1 = io_chiIn[831 : 768];
  assign sBox_37_io_a2 = io_chiIn[767 : 704];
  assign sBox_37_io_a3 = io_chiIn[703 : 640];
  assign sBox_38_io_a1 = io_chiIn[767 : 704];
  assign sBox_38_io_a2 = io_chiIn[703 : 640];
  assign sBox_38_io_a3 = io_chiIn[959 : 896];
  assign sBox_39_io_a1 = io_chiIn[703 : 640];
  assign sBox_39_io_a2 = io_chiIn[959 : 896];
  assign sBox_39_io_a3 = io_chiIn[895 : 832];
  assign sBox_40_io_a1 = io_chiIn[639 : 576];
  assign sBox_40_io_a2 = io_chiIn[575 : 512];
  assign sBox_40_io_a3 = io_chiIn[511 : 448];
  assign sBox_41_io_a1 = io_chiIn[575 : 512];
  assign sBox_41_io_a2 = io_chiIn[511 : 448];
  assign sBox_41_io_a3 = io_chiIn[447 : 384];
  assign sBox_42_io_a1 = io_chiIn[511 : 448];
  assign sBox_42_io_a2 = io_chiIn[447 : 384];
  assign sBox_42_io_a3 = io_chiIn[383 : 320];
  assign sBox_43_io_a1 = io_chiIn[447 : 384];
  assign sBox_43_io_a2 = io_chiIn[383 : 320];
  assign sBox_43_io_a3 = io_chiIn[639 : 576];
  assign sBox_44_io_a1 = io_chiIn[383 : 320];
  assign sBox_44_io_a2 = io_chiIn[639 : 576];
  assign sBox_44_io_a3 = io_chiIn[575 : 512];
  assign sBox_45_io_a1 = io_chiIn[319 : 256];
  assign sBox_45_io_a2 = io_chiIn[255 : 192];
  assign sBox_45_io_a3 = io_chiIn[191 : 128];
  assign sBox_46_io_a1 = io_chiIn[255 : 192];
  assign sBox_46_io_a2 = io_chiIn[191 : 128];
  assign sBox_46_io_a3 = io_chiIn[127 : 64];
  assign sBox_47_io_a1 = io_chiIn[191 : 128];
  assign sBox_47_io_a2 = io_chiIn[127 : 64];
  assign sBox_47_io_a3 = io_chiIn[63 : 0];
  assign sBox_48_io_a1 = io_chiIn[127 : 64];
  assign sBox_48_io_a2 = io_chiIn[63 : 0];
  assign sBox_48_io_a3 = io_chiIn[319 : 256];
  assign sBox_49_io_a1 = io_chiIn[63 : 0];
  assign sBox_49_io_a2 = io_chiIn[319 : 256];
  assign sBox_49_io_a3 = io_chiIn[255 : 192];

endmodule

module RhoPi (
  input      [1599:0] io_rhoIn,
  output reg [1599:0] io_rhoOut
);

  wire       [63:0]   _zz_io_rhoOut_24;
  wire       [63:0]   _zz_io_rhoOut;
  wire       [63:0]   _zz_io_rhoOut_1;
  wire       [63:0]   _zz_io_rhoOut_2;
  wire       [63:0]   _zz_io_rhoOut_3;
  wire       [63:0]   _zz_io_rhoOut_4;
  wire       [63:0]   _zz_io_rhoOut_5;
  wire       [63:0]   _zz_io_rhoOut_6;
  wire       [63:0]   _zz_io_rhoOut_7;
  wire       [63:0]   _zz_io_rhoOut_8;
  wire       [63:0]   _zz_io_rhoOut_9;
  wire       [63:0]   _zz_io_rhoOut_10;
  wire       [63:0]   _zz_io_rhoOut_11;
  wire       [63:0]   _zz_io_rhoOut_12;
  wire       [63:0]   _zz_io_rhoOut_13;
  wire       [63:0]   _zz_io_rhoOut_14;
  wire       [63:0]   _zz_io_rhoOut_15;
  wire       [63:0]   _zz_io_rhoOut_16;
  wire       [63:0]   _zz_io_rhoOut_17;
  wire       [63:0]   _zz_io_rhoOut_18;
  wire       [63:0]   _zz_io_rhoOut_19;
  wire       [63:0]   _zz_io_rhoOut_20;
  wire       [63:0]   _zz_io_rhoOut_21;
  wire       [63:0]   _zz_io_rhoOut_22;
  wire       [63:0]   _zz_io_rhoOut_23;

  assign _zz_io_rhoOut_24 = io_rhoIn[1599 : 1536];
  always @(*) begin
    io_rhoOut[1599 : 1536] = _zz_io_rhoOut_24[63 : 0];
    io_rhoOut[1535 : 1472] = {_zz_io_rhoOut[19 : 0],_zz_io_rhoOut[63 : 20]};
    io_rhoOut[1471 : 1408] = {_zz_io_rhoOut_1[20 : 0],_zz_io_rhoOut_1[63 : 21]};
    io_rhoOut[1407 : 1344] = {_zz_io_rhoOut_2[42 : 0],_zz_io_rhoOut_2[63 : 43]};
    io_rhoOut[1343 : 1280] = {_zz_io_rhoOut_3[49 : 0],_zz_io_rhoOut_3[63 : 50]};
    io_rhoOut[1279 : 1216] = {_zz_io_rhoOut_4[35 : 0],_zz_io_rhoOut_4[63 : 36]};
    io_rhoOut[1215 : 1152] = {_zz_io_rhoOut_5[43 : 0],_zz_io_rhoOut_5[63 : 44]};
    io_rhoOut[1151 : 1088] = {_zz_io_rhoOut_6[60 : 0],_zz_io_rhoOut_6[63 : 61]};
    io_rhoOut[1087 : 1024] = {_zz_io_rhoOut_7[18 : 0],_zz_io_rhoOut_7[63 : 19]};
    io_rhoOut[1023 : 960] = {_zz_io_rhoOut_8[2 : 0],_zz_io_rhoOut_8[63 : 3]};
    io_rhoOut[959 : 896] = {_zz_io_rhoOut_9[62 : 0],_zz_io_rhoOut_9[63 : 63]};
    io_rhoOut[895 : 832] = {_zz_io_rhoOut_10[57 : 0],_zz_io_rhoOut_10[63 : 58]};
    io_rhoOut[831 : 768] = {_zz_io_rhoOut_11[38 : 0],_zz_io_rhoOut_11[63 : 39]};
    io_rhoOut[767 : 704] = {_zz_io_rhoOut_12[55 : 0],_zz_io_rhoOut_12[63 : 56]};
    io_rhoOut[703 : 640] = {_zz_io_rhoOut_13[45 : 0],_zz_io_rhoOut_13[63 : 46]};
    io_rhoOut[639 : 576] = {_zz_io_rhoOut_14[36 : 0],_zz_io_rhoOut_14[63 : 37]};
    io_rhoOut[575 : 512] = {_zz_io_rhoOut_15[27 : 0],_zz_io_rhoOut_15[63 : 28]};
    io_rhoOut[511 : 448] = {_zz_io_rhoOut_16[53 : 0],_zz_io_rhoOut_16[63 : 54]};
    io_rhoOut[447 : 384] = {_zz_io_rhoOut_17[48 : 0],_zz_io_rhoOut_17[63 : 49]};
    io_rhoOut[383 : 320] = {_zz_io_rhoOut_18[7 : 0],_zz_io_rhoOut_18[63 : 8]};
    io_rhoOut[319 : 256] = {_zz_io_rhoOut_19[1 : 0],_zz_io_rhoOut_19[63 : 2]};
    io_rhoOut[255 : 192] = {_zz_io_rhoOut_20[8 : 0],_zz_io_rhoOut_20[63 : 9]};
    io_rhoOut[191 : 128] = {_zz_io_rhoOut_21[24 : 0],_zz_io_rhoOut_21[63 : 25]};
    io_rhoOut[127 : 64] = {_zz_io_rhoOut_22[22 : 0],_zz_io_rhoOut_22[63 : 23]};
    io_rhoOut[63 : 0] = {_zz_io_rhoOut_23[61 : 0],_zz_io_rhoOut_23[63 : 62]};
  end

  assign _zz_io_rhoOut = io_rhoIn[1215 : 1152];
  assign _zz_io_rhoOut_1 = io_rhoIn[831 : 768];
  assign _zz_io_rhoOut_2 = io_rhoIn[447 : 384];
  assign _zz_io_rhoOut_3 = io_rhoIn[63 : 0];
  assign _zz_io_rhoOut_4 = io_rhoIn[1407 : 1344];
  assign _zz_io_rhoOut_5 = io_rhoIn[1023 : 960];
  assign _zz_io_rhoOut_6 = io_rhoIn[959 : 896];
  assign _zz_io_rhoOut_7 = io_rhoIn[575 : 512];
  assign _zz_io_rhoOut_8 = io_rhoIn[191 : 128];
  assign _zz_io_rhoOut_9 = io_rhoIn[1535 : 1472];
  assign _zz_io_rhoOut_10 = io_rhoIn[1151 : 1088];
  assign _zz_io_rhoOut_11 = io_rhoIn[767 : 704];
  assign _zz_io_rhoOut_12 = io_rhoIn[383 : 320];
  assign _zz_io_rhoOut_13 = io_rhoIn[319 : 256];
  assign _zz_io_rhoOut_14 = io_rhoIn[1343 : 1280];
  assign _zz_io_rhoOut_15 = io_rhoIn[1279 : 1216];
  assign _zz_io_rhoOut_16 = io_rhoIn[895 : 832];
  assign _zz_io_rhoOut_17 = io_rhoIn[511 : 448];
  assign _zz_io_rhoOut_18 = io_rhoIn[127 : 64];
  assign _zz_io_rhoOut_19 = io_rhoIn[1471 : 1408];
  assign _zz_io_rhoOut_20 = io_rhoIn[1087 : 1024];
  assign _zz_io_rhoOut_21 = io_rhoIn[703 : 640];
  assign _zz_io_rhoOut_22 = io_rhoIn[639 : 576];
  assign _zz_io_rhoOut_23 = io_rhoIn[255 : 192];

endmodule

module Theta (
  input      [1599:0] io_thetaIn,
  output reg [1599:0] io_thetaOut
);

  wire       [319:0]  b;
  reg        [319:0]  d;
  wire       [63:0]   _zz_d;
  wire       [63:0]   _zz_d_1;
  wire       [63:0]   _zz_d_2;
  wire       [63:0]   _zz_d_3;
  wire       [63:0]   _zz_d_4;

  assign b = ((((io_thetaIn[1599 : 1280] ^ io_thetaIn[1279 : 960]) ^ io_thetaIn[959 : 640]) ^ io_thetaIn[639 : 320]) ^ io_thetaIn[319 : 0]);
  assign _zz_d = b[255 : 192];
  always @(*) begin
    d[319 : 256] = (b[63 : 0] ^ {_zz_d[62 : 0],_zz_d[63 : 63]});
    d[255 : 192] = (b[319 : 256] ^ {_zz_d_1[62 : 0],_zz_d_1[63 : 63]});
    d[191 : 128] = (b[255 : 192] ^ {_zz_d_2[62 : 0],_zz_d_2[63 : 63]});
    d[127 : 64] = (b[191 : 128] ^ {_zz_d_3[62 : 0],_zz_d_3[63 : 63]});
    d[63 : 0] = (b[127 : 64] ^ {_zz_d_4[62 : 0],_zz_d_4[63 : 63]});
  end

  assign _zz_d_1 = b[191 : 128];
  assign _zz_d_2 = b[127 : 64];
  assign _zz_d_3 = b[63 : 0];
  assign _zz_d_4 = b[319 : 256];
  always @(*) begin
    io_thetaOut[1599 : 1536] = (io_thetaIn[1599 : 1536] ^ d[319 : 256]);
    io_thetaOut[1535 : 1472] = (io_thetaIn[1535 : 1472] ^ d[255 : 192]);
    io_thetaOut[1471 : 1408] = (io_thetaIn[1471 : 1408] ^ d[191 : 128]);
    io_thetaOut[1407 : 1344] = (io_thetaIn[1407 : 1344] ^ d[127 : 64]);
    io_thetaOut[1343 : 1280] = (io_thetaIn[1343 : 1280] ^ d[63 : 0]);
    io_thetaOut[1279 : 1216] = (io_thetaIn[1279 : 1216] ^ d[319 : 256]);
    io_thetaOut[1215 : 1152] = (io_thetaIn[1215 : 1152] ^ d[255 : 192]);
    io_thetaOut[1151 : 1088] = (io_thetaIn[1151 : 1088] ^ d[191 : 128]);
    io_thetaOut[1087 : 1024] = (io_thetaIn[1087 : 1024] ^ d[127 : 64]);
    io_thetaOut[1023 : 960] = (io_thetaIn[1023 : 960] ^ d[63 : 0]);
    io_thetaOut[959 : 896] = (io_thetaIn[959 : 896] ^ d[319 : 256]);
    io_thetaOut[895 : 832] = (io_thetaIn[895 : 832] ^ d[255 : 192]);
    io_thetaOut[831 : 768] = (io_thetaIn[831 : 768] ^ d[191 : 128]);
    io_thetaOut[767 : 704] = (io_thetaIn[767 : 704] ^ d[127 : 64]);
    io_thetaOut[703 : 640] = (io_thetaIn[703 : 640] ^ d[63 : 0]);
    io_thetaOut[639 : 576] = (io_thetaIn[639 : 576] ^ d[319 : 256]);
    io_thetaOut[575 : 512] = (io_thetaIn[575 : 512] ^ d[255 : 192]);
    io_thetaOut[511 : 448] = (io_thetaIn[511 : 448] ^ d[191 : 128]);
    io_thetaOut[447 : 384] = (io_thetaIn[447 : 384] ^ d[127 : 64]);
    io_thetaOut[383 : 320] = (io_thetaIn[383 : 320] ^ d[63 : 0]);
    io_thetaOut[319 : 256] = (io_thetaIn[319 : 256] ^ d[319 : 256]);
    io_thetaOut[255 : 192] = (io_thetaIn[255 : 192] ^ d[255 : 192]);
    io_thetaOut[191 : 128] = (io_thetaIn[191 : 128] ^ d[191 : 128]);
    io_thetaOut[127 : 64] = (io_thetaIn[127 : 64] ^ d[127 : 64]);
    io_thetaOut[63 : 0] = (io_thetaIn[63 : 0] ^ d[63 : 0]);
  end


endmodule

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

module SBox (
  input      [63:0]   io_a1,
  input      [63:0]   io_a2,
  input      [63:0]   io_a3,
  output     [63:0]   io_res
);


  assign io_res = (io_a1 ^ ((~ io_a2) & io_a3));

endmodule
