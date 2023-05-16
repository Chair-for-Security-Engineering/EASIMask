// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : KECCAKMasked
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module KECCAKMasked (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [1599:0] io_in1,
  input      [1599:0] io_in2,
  output     [1599:0] io_out1,
  output     [1599:0] io_out2,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sExecute = 2'd1;
  localparam States_sDone = 2'd2;

  wire       [1599:0] r_theta1_io_thetaOut;
  wire       [1599:0] r_theta2_io_thetaOut;
  wire       [1599:0] r_rhopi1_io_rhoOut;
  wire       [1599:0] r_rhopi2_io_rhoOut;
  wire       [1599:0] r_chi_io_chiOut1;
  wire       [1599:0] r_chi_io_chiOut2;
  wire       [1599:0] r_iota1_io_iotaOut;
  wire       [1599:0] r_iota2_io_iotaOut;
  wire       [4:0]    _zz_r_roundCounter_valueNext;
  wire       [0:0]    _zz_r_roundCounter_valueNext_1;
  reg        [1599:0] r_state1;
  reg        [1599:0] r_state2;
  reg                 r_roundCounter_willIncrement;
  reg                 r_roundCounter_willClear;
  reg        [4:0]    r_roundCounter_valueNext;
  reg        [4:0]    r_roundCounter_value;
  wire                r_roundCounter_willOverflowIfInc;
  wire                r_roundCounter_willOverflow;
  reg                 r_smallCounter_willIncrement;
  reg                 r_smallCounter_willClear;
  reg        [0:0]    r_smallCounter_valueNext;
  reg        [0:0]    r_smallCounter_value;
  wire                r_smallCounter_willOverflowIfInc;
  wire                r_smallCounter_willOverflow;
  reg        [1:0]    r_keccakState;
  `ifndef SYNTHESIS
  reg [63:0] r_keccakState_string;
  `endif


  assign _zz_r_roundCounter_valueNext_1 = r_roundCounter_willIncrement;
  assign _zz_r_roundCounter_valueNext = {4'd0, _zz_r_roundCounter_valueNext_1};
  Theta r_theta1 (
    .io_thetaIn     (r_state1[1599:0]              ), //i
    .io_thetaOut    (r_theta1_io_thetaOut[1599:0]  )  //o
  );
  Theta r_theta2 (
    .io_thetaIn     (r_state2[1599:0]              ), //i
    .io_thetaOut    (r_theta2_io_thetaOut[1599:0]  )  //o
  );
  RhoPi r_rhopi1 (
    .io_rhoIn     (r_theta1_io_thetaOut[1599:0]  ), //i
    .io_rhoOut    (r_rhopi1_io_rhoOut[1599:0]    )  //o
  );
  RhoPi r_rhopi2 (
    .io_rhoIn     (r_theta2_io_thetaOut[1599:0]  ), //i
    .io_rhoOut    (r_rhopi2_io_rhoOut[1599:0]    )  //o
  );
  ChiMasked r_chi (
    .io_chiIn1     (r_rhopi1_io_rhoOut[1599:0]  ), //i
    .io_chiIn2     (r_rhopi2_io_rhoOut[1599:0]  ), //i
    .io_chiOut1    (r_chi_io_chiOut1[1599:0]    ), //o
    .io_chiOut2    (r_chi_io_chiOut2[1599:0]    ), //o
    .io_clk        (io_clk                      ), //i
    .io_reset      (io_reset                    )  //i
  );
  Iota r_iota1 (
    .io_iotaIn     (r_chi_io_chiOut1[1599:0]    ), //i
    .io_round      (r_roundCounter_value[4:0]   ), //i
    .io_iotaOut    (r_iota1_io_iotaOut[1599:0]  )  //o
  );
  Iota r_iota2 (
    .io_iotaIn     (r_chi_io_chiOut2[1599:0]    ), //i
    .io_round      (5'h19                       ), //i
    .io_iotaOut    (r_iota2_io_iotaOut[1599:0]  )  //o
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
        if(r_smallCounter_willOverflow) begin
          r_roundCounter_willIncrement = 1'b1;
        end
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

  always @(*) begin
    r_smallCounter_willIncrement = 1'b0;
    case(r_keccakState)
      States_sIdle : begin
      end
      States_sExecute : begin
        r_smallCounter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_smallCounter_willClear = 1'b0;
    case(r_keccakState)
      States_sIdle : begin
        r_smallCounter_willClear = 1'b1;
      end
      States_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign r_smallCounter_willOverflowIfInc = (r_smallCounter_value == 1'b1);
  assign r_smallCounter_willOverflow = (r_smallCounter_willOverflowIfInc && r_smallCounter_willIncrement);
  always @(*) begin
    r_smallCounter_valueNext = (r_smallCounter_value + r_smallCounter_willIncrement);
    if(r_smallCounter_willClear) begin
      r_smallCounter_valueNext = 1'b0;
    end
  end

  assign io_out1 = r_state1;
  assign io_out2 = r_state2;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_state1 <= 1600'h0;
      r_state2 <= 1600'h0;
      r_roundCounter_value <= 5'h0;
      r_smallCounter_value <= 1'b0;
      r_keccakState <= States_sIdle;
    end else begin
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCounter_value <= r_smallCounter_valueNext;
      r_state1 <= r_iota1_io_iotaOut;
      r_state2 <= r_iota2_io_iotaOut;
      case(r_keccakState)
        States_sIdle : begin
          r_keccakState <= States_sIdle;
          if(io_enable) begin
            r_state1 <= io_in1;
            r_state2 <= io_in2;
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

//Iota replaced by Iota

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

module ChiMasked (
  input      [1599:0] io_chiIn1,
  input      [1599:0] io_chiIn2,
  output reg [1599:0] io_chiOut1,
  output reg [1599:0] io_chiOut2,
  input               io_clk,
  input               io_reset
);

  wire       [63:0]   sBoxMasked_25_io_c1;
  wire       [63:0]   sBoxMasked_25_io_c2;
  wire       [63:0]   sBoxMasked_25_io_a1;
  wire       [63:0]   sBoxMasked_25_io_a2;
  wire       [63:0]   sBoxMasked_25_io_b1;
  wire       [63:0]   sBoxMasked_25_io_b2;
  wire       [63:0]   sBoxMasked_26_io_c1;
  wire       [63:0]   sBoxMasked_26_io_c2;
  wire       [63:0]   sBoxMasked_26_io_a1;
  wire       [63:0]   sBoxMasked_26_io_a2;
  wire       [63:0]   sBoxMasked_26_io_b1;
  wire       [63:0]   sBoxMasked_26_io_b2;
  wire       [63:0]   sBoxMasked_27_io_c1;
  wire       [63:0]   sBoxMasked_27_io_c2;
  wire       [63:0]   sBoxMasked_27_io_a1;
  wire       [63:0]   sBoxMasked_27_io_a2;
  wire       [63:0]   sBoxMasked_27_io_b1;
  wire       [63:0]   sBoxMasked_27_io_b2;
  wire       [63:0]   sBoxMasked_28_io_c1;
  wire       [63:0]   sBoxMasked_28_io_c2;
  wire       [63:0]   sBoxMasked_28_io_a1;
  wire       [63:0]   sBoxMasked_28_io_a2;
  wire       [63:0]   sBoxMasked_28_io_b1;
  wire       [63:0]   sBoxMasked_28_io_b2;
  wire       [63:0]   sBoxMasked_29_io_c1;
  wire       [63:0]   sBoxMasked_29_io_c2;
  wire       [63:0]   sBoxMasked_29_io_a1;
  wire       [63:0]   sBoxMasked_29_io_a2;
  wire       [63:0]   sBoxMasked_29_io_b1;
  wire       [63:0]   sBoxMasked_29_io_b2;
  wire       [63:0]   sBoxMasked_30_io_c1;
  wire       [63:0]   sBoxMasked_30_io_c2;
  wire       [63:0]   sBoxMasked_30_io_a1;
  wire       [63:0]   sBoxMasked_30_io_a2;
  wire       [63:0]   sBoxMasked_30_io_b1;
  wire       [63:0]   sBoxMasked_30_io_b2;
  wire       [63:0]   sBoxMasked_31_io_c1;
  wire       [63:0]   sBoxMasked_31_io_c2;
  wire       [63:0]   sBoxMasked_31_io_a1;
  wire       [63:0]   sBoxMasked_31_io_a2;
  wire       [63:0]   sBoxMasked_31_io_b1;
  wire       [63:0]   sBoxMasked_31_io_b2;
  wire       [63:0]   sBoxMasked_32_io_c1;
  wire       [63:0]   sBoxMasked_32_io_c2;
  wire       [63:0]   sBoxMasked_32_io_a1;
  wire       [63:0]   sBoxMasked_32_io_a2;
  wire       [63:0]   sBoxMasked_32_io_b1;
  wire       [63:0]   sBoxMasked_32_io_b2;
  wire       [63:0]   sBoxMasked_33_io_c1;
  wire       [63:0]   sBoxMasked_33_io_c2;
  wire       [63:0]   sBoxMasked_33_io_a1;
  wire       [63:0]   sBoxMasked_33_io_a2;
  wire       [63:0]   sBoxMasked_33_io_b1;
  wire       [63:0]   sBoxMasked_33_io_b2;
  wire       [63:0]   sBoxMasked_34_io_c1;
  wire       [63:0]   sBoxMasked_34_io_c2;
  wire       [63:0]   sBoxMasked_34_io_a1;
  wire       [63:0]   sBoxMasked_34_io_a2;
  wire       [63:0]   sBoxMasked_34_io_b1;
  wire       [63:0]   sBoxMasked_34_io_b2;
  wire       [63:0]   sBoxMasked_35_io_c1;
  wire       [63:0]   sBoxMasked_35_io_c2;
  wire       [63:0]   sBoxMasked_35_io_a1;
  wire       [63:0]   sBoxMasked_35_io_a2;
  wire       [63:0]   sBoxMasked_35_io_b1;
  wire       [63:0]   sBoxMasked_35_io_b2;
  wire       [63:0]   sBoxMasked_36_io_c1;
  wire       [63:0]   sBoxMasked_36_io_c2;
  wire       [63:0]   sBoxMasked_36_io_a1;
  wire       [63:0]   sBoxMasked_36_io_a2;
  wire       [63:0]   sBoxMasked_36_io_b1;
  wire       [63:0]   sBoxMasked_36_io_b2;
  wire       [63:0]   sBoxMasked_37_io_c1;
  wire       [63:0]   sBoxMasked_37_io_c2;
  wire       [63:0]   sBoxMasked_37_io_a1;
  wire       [63:0]   sBoxMasked_37_io_a2;
  wire       [63:0]   sBoxMasked_37_io_b1;
  wire       [63:0]   sBoxMasked_37_io_b2;
  wire       [63:0]   sBoxMasked_38_io_c1;
  wire       [63:0]   sBoxMasked_38_io_c2;
  wire       [63:0]   sBoxMasked_38_io_a1;
  wire       [63:0]   sBoxMasked_38_io_a2;
  wire       [63:0]   sBoxMasked_38_io_b1;
  wire       [63:0]   sBoxMasked_38_io_b2;
  wire       [63:0]   sBoxMasked_39_io_c1;
  wire       [63:0]   sBoxMasked_39_io_c2;
  wire       [63:0]   sBoxMasked_39_io_a1;
  wire       [63:0]   sBoxMasked_39_io_a2;
  wire       [63:0]   sBoxMasked_39_io_b1;
  wire       [63:0]   sBoxMasked_39_io_b2;
  wire       [63:0]   sBoxMasked_40_io_c1;
  wire       [63:0]   sBoxMasked_40_io_c2;
  wire       [63:0]   sBoxMasked_40_io_a1;
  wire       [63:0]   sBoxMasked_40_io_a2;
  wire       [63:0]   sBoxMasked_40_io_b1;
  wire       [63:0]   sBoxMasked_40_io_b2;
  wire       [63:0]   sBoxMasked_41_io_c1;
  wire       [63:0]   sBoxMasked_41_io_c2;
  wire       [63:0]   sBoxMasked_41_io_a1;
  wire       [63:0]   sBoxMasked_41_io_a2;
  wire       [63:0]   sBoxMasked_41_io_b1;
  wire       [63:0]   sBoxMasked_41_io_b2;
  wire       [63:0]   sBoxMasked_42_io_c1;
  wire       [63:0]   sBoxMasked_42_io_c2;
  wire       [63:0]   sBoxMasked_42_io_a1;
  wire       [63:0]   sBoxMasked_42_io_a2;
  wire       [63:0]   sBoxMasked_42_io_b1;
  wire       [63:0]   sBoxMasked_42_io_b2;
  wire       [63:0]   sBoxMasked_43_io_c1;
  wire       [63:0]   sBoxMasked_43_io_c2;
  wire       [63:0]   sBoxMasked_43_io_a1;
  wire       [63:0]   sBoxMasked_43_io_a2;
  wire       [63:0]   sBoxMasked_43_io_b1;
  wire       [63:0]   sBoxMasked_43_io_b2;
  wire       [63:0]   sBoxMasked_44_io_c1;
  wire       [63:0]   sBoxMasked_44_io_c2;
  wire       [63:0]   sBoxMasked_44_io_a1;
  wire       [63:0]   sBoxMasked_44_io_a2;
  wire       [63:0]   sBoxMasked_44_io_b1;
  wire       [63:0]   sBoxMasked_44_io_b2;
  wire       [63:0]   sBoxMasked_45_io_c1;
  wire       [63:0]   sBoxMasked_45_io_c2;
  wire       [63:0]   sBoxMasked_45_io_a1;
  wire       [63:0]   sBoxMasked_45_io_a2;
  wire       [63:0]   sBoxMasked_45_io_b1;
  wire       [63:0]   sBoxMasked_45_io_b2;
  wire       [63:0]   sBoxMasked_46_io_c1;
  wire       [63:0]   sBoxMasked_46_io_c2;
  wire       [63:0]   sBoxMasked_46_io_a1;
  wire       [63:0]   sBoxMasked_46_io_a2;
  wire       [63:0]   sBoxMasked_46_io_b1;
  wire       [63:0]   sBoxMasked_46_io_b2;
  wire       [63:0]   sBoxMasked_47_io_c1;
  wire       [63:0]   sBoxMasked_47_io_c2;
  wire       [63:0]   sBoxMasked_47_io_a1;
  wire       [63:0]   sBoxMasked_47_io_a2;
  wire       [63:0]   sBoxMasked_47_io_b1;
  wire       [63:0]   sBoxMasked_47_io_b2;
  wire       [63:0]   sBoxMasked_48_io_c1;
  wire       [63:0]   sBoxMasked_48_io_c2;
  wire       [63:0]   sBoxMasked_48_io_a1;
  wire       [63:0]   sBoxMasked_48_io_a2;
  wire       [63:0]   sBoxMasked_48_io_b1;
  wire       [63:0]   sBoxMasked_48_io_b2;
  wire       [63:0]   sBoxMasked_49_io_c1;
  wire       [63:0]   sBoxMasked_49_io_c2;
  wire       [63:0]   sBoxMasked_49_io_a1;
  wire       [63:0]   sBoxMasked_49_io_a2;
  wire       [63:0]   sBoxMasked_49_io_b1;
  wire       [63:0]   sBoxMasked_49_io_b2;
  wire       [63:0]   sBoxMasked_25_io_res1;
  wire       [63:0]   sBoxMasked_25_io_res2;
  wire       [63:0]   sBoxMasked_26_io_res1;
  wire       [63:0]   sBoxMasked_26_io_res2;
  wire       [63:0]   sBoxMasked_27_io_res1;
  wire       [63:0]   sBoxMasked_27_io_res2;
  wire       [63:0]   sBoxMasked_28_io_res1;
  wire       [63:0]   sBoxMasked_28_io_res2;
  wire       [63:0]   sBoxMasked_29_io_res1;
  wire       [63:0]   sBoxMasked_29_io_res2;
  wire       [63:0]   sBoxMasked_30_io_res1;
  wire       [63:0]   sBoxMasked_30_io_res2;
  wire       [63:0]   sBoxMasked_31_io_res1;
  wire       [63:0]   sBoxMasked_31_io_res2;
  wire       [63:0]   sBoxMasked_32_io_res1;
  wire       [63:0]   sBoxMasked_32_io_res2;
  wire       [63:0]   sBoxMasked_33_io_res1;
  wire       [63:0]   sBoxMasked_33_io_res2;
  wire       [63:0]   sBoxMasked_34_io_res1;
  wire       [63:0]   sBoxMasked_34_io_res2;
  wire       [63:0]   sBoxMasked_35_io_res1;
  wire       [63:0]   sBoxMasked_35_io_res2;
  wire       [63:0]   sBoxMasked_36_io_res1;
  wire       [63:0]   sBoxMasked_36_io_res2;
  wire       [63:0]   sBoxMasked_37_io_res1;
  wire       [63:0]   sBoxMasked_37_io_res2;
  wire       [63:0]   sBoxMasked_38_io_res1;
  wire       [63:0]   sBoxMasked_38_io_res2;
  wire       [63:0]   sBoxMasked_39_io_res1;
  wire       [63:0]   sBoxMasked_39_io_res2;
  wire       [63:0]   sBoxMasked_40_io_res1;
  wire       [63:0]   sBoxMasked_40_io_res2;
  wire       [63:0]   sBoxMasked_41_io_res1;
  wire       [63:0]   sBoxMasked_41_io_res2;
  wire       [63:0]   sBoxMasked_42_io_res1;
  wire       [63:0]   sBoxMasked_42_io_res2;
  wire       [63:0]   sBoxMasked_43_io_res1;
  wire       [63:0]   sBoxMasked_43_io_res2;
  wire       [63:0]   sBoxMasked_44_io_res1;
  wire       [63:0]   sBoxMasked_44_io_res2;
  wire       [63:0]   sBoxMasked_45_io_res1;
  wire       [63:0]   sBoxMasked_45_io_res2;
  wire       [63:0]   sBoxMasked_46_io_res1;
  wire       [63:0]   sBoxMasked_46_io_res2;
  wire       [63:0]   sBoxMasked_47_io_res1;
  wire       [63:0]   sBoxMasked_47_io_res2;
  wire       [63:0]   sBoxMasked_48_io_res1;
  wire       [63:0]   sBoxMasked_48_io_res2;
  wire       [63:0]   sBoxMasked_49_io_res1;
  wire       [63:0]   sBoxMasked_49_io_res2;

  SBoxMasked sBoxMasked_25 (
    .io_c1       (sBoxMasked_25_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_25_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_25_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_25_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_25_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_25_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_25_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_25_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_26 (
    .io_c1       (sBoxMasked_26_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_26_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_26_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_26_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_26_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_26_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_26_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_26_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_27 (
    .io_c1       (sBoxMasked_27_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_27_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_27_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_27_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_27_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_27_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_27_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_27_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_28 (
    .io_c1       (sBoxMasked_28_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_28_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_28_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_28_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_28_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_28_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_28_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_28_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_29 (
    .io_c1       (sBoxMasked_29_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_29_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_29_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_29_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_29_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_29_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_29_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_29_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_30 (
    .io_c1       (sBoxMasked_30_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_30_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_30_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_30_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_30_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_30_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_30_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_30_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_31 (
    .io_c1       (sBoxMasked_31_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_31_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_31_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_31_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_31_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_31_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_31_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_31_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_32 (
    .io_c1       (sBoxMasked_32_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_32_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_32_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_32_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_32_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_32_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_32_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_32_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_33 (
    .io_c1       (sBoxMasked_33_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_33_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_33_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_33_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_33_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_33_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_33_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_33_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_34 (
    .io_c1       (sBoxMasked_34_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_34_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_34_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_34_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_34_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_34_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_34_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_34_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_35 (
    .io_c1       (sBoxMasked_35_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_35_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_35_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_35_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_35_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_35_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_35_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_35_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_36 (
    .io_c1       (sBoxMasked_36_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_36_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_36_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_36_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_36_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_36_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_36_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_36_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_37 (
    .io_c1       (sBoxMasked_37_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_37_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_37_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_37_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_37_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_37_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_37_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_37_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_38 (
    .io_c1       (sBoxMasked_38_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_38_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_38_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_38_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_38_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_38_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_38_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_38_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_39 (
    .io_c1       (sBoxMasked_39_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_39_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_39_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_39_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_39_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_39_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_39_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_39_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_40 (
    .io_c1       (sBoxMasked_40_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_40_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_40_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_40_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_40_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_40_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_40_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_40_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_41 (
    .io_c1       (sBoxMasked_41_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_41_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_41_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_41_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_41_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_41_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_41_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_41_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_42 (
    .io_c1       (sBoxMasked_42_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_42_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_42_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_42_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_42_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_42_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_42_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_42_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_43 (
    .io_c1       (sBoxMasked_43_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_43_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_43_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_43_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_43_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_43_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_43_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_43_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_44 (
    .io_c1       (sBoxMasked_44_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_44_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_44_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_44_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_44_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_44_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_44_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_44_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_45 (
    .io_c1       (sBoxMasked_45_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_45_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_45_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_45_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_45_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_45_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_45_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_45_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_46 (
    .io_c1       (sBoxMasked_46_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_46_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_46_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_46_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_46_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_46_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_46_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_46_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_47 (
    .io_c1       (sBoxMasked_47_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_47_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_47_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_47_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_47_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_47_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_47_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_47_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_48 (
    .io_c1       (sBoxMasked_48_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_48_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_48_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_48_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_48_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_48_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_48_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_48_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  SBoxMasked sBoxMasked_49 (
    .io_c1       (sBoxMasked_49_io_c1[63:0]    ), //i
    .io_c2       (sBoxMasked_49_io_c2[63:0]    ), //i
    .io_a1       (sBoxMasked_49_io_a1[63:0]    ), //i
    .io_a2       (sBoxMasked_49_io_a2[63:0]    ), //i
    .io_b1       (sBoxMasked_49_io_b1[63:0]    ), //i
    .io_b2       (sBoxMasked_49_io_b2[63:0]    ), //i
    .io_res1     (sBoxMasked_49_io_res1[63:0]  ), //o
    .io_res2     (sBoxMasked_49_io_res2[63:0]  ), //o
    .io_clk      (io_clk                       ), //i
    .io_reset    (io_reset                     )  //i
  );
  assign sBoxMasked_25_io_c1 = io_chiIn1[1599 : 1536];
  assign sBoxMasked_25_io_c2 = io_chiIn2[1599 : 1536];
  assign sBoxMasked_25_io_a1 = io_chiIn1[1535 : 1472];
  assign sBoxMasked_25_io_a2 = io_chiIn2[1535 : 1472];
  assign sBoxMasked_25_io_b1 = io_chiIn1[1471 : 1408];
  assign sBoxMasked_25_io_b2 = io_chiIn2[1471 : 1408];
  always @(*) begin
    io_chiOut1[1599 : 1536] = sBoxMasked_25_io_res1;
    io_chiOut1[1535 : 1472] = sBoxMasked_26_io_res1;
    io_chiOut1[1471 : 1408] = sBoxMasked_27_io_res1;
    io_chiOut1[1407 : 1344] = sBoxMasked_28_io_res1;
    io_chiOut1[1343 : 1280] = sBoxMasked_29_io_res1;
    io_chiOut1[1279 : 1216] = sBoxMasked_30_io_res1;
    io_chiOut1[1215 : 1152] = sBoxMasked_31_io_res1;
    io_chiOut1[1151 : 1088] = sBoxMasked_32_io_res1;
    io_chiOut1[1087 : 1024] = sBoxMasked_33_io_res1;
    io_chiOut1[1023 : 960] = sBoxMasked_34_io_res1;
    io_chiOut1[959 : 896] = sBoxMasked_35_io_res1;
    io_chiOut1[895 : 832] = sBoxMasked_36_io_res1;
    io_chiOut1[831 : 768] = sBoxMasked_37_io_res1;
    io_chiOut1[767 : 704] = sBoxMasked_38_io_res1;
    io_chiOut1[703 : 640] = sBoxMasked_39_io_res1;
    io_chiOut1[639 : 576] = sBoxMasked_40_io_res1;
    io_chiOut1[575 : 512] = sBoxMasked_41_io_res1;
    io_chiOut1[511 : 448] = sBoxMasked_42_io_res1;
    io_chiOut1[447 : 384] = sBoxMasked_43_io_res1;
    io_chiOut1[383 : 320] = sBoxMasked_44_io_res1;
    io_chiOut1[319 : 256] = sBoxMasked_45_io_res1;
    io_chiOut1[255 : 192] = sBoxMasked_46_io_res1;
    io_chiOut1[191 : 128] = sBoxMasked_47_io_res1;
    io_chiOut1[127 : 64] = sBoxMasked_48_io_res1;
    io_chiOut1[63 : 0] = sBoxMasked_49_io_res1;
  end

  always @(*) begin
    io_chiOut2[1599 : 1536] = sBoxMasked_25_io_res2;
    io_chiOut2[1535 : 1472] = sBoxMasked_26_io_res2;
    io_chiOut2[1471 : 1408] = sBoxMasked_27_io_res2;
    io_chiOut2[1407 : 1344] = sBoxMasked_28_io_res2;
    io_chiOut2[1343 : 1280] = sBoxMasked_29_io_res2;
    io_chiOut2[1279 : 1216] = sBoxMasked_30_io_res2;
    io_chiOut2[1215 : 1152] = sBoxMasked_31_io_res2;
    io_chiOut2[1151 : 1088] = sBoxMasked_32_io_res2;
    io_chiOut2[1087 : 1024] = sBoxMasked_33_io_res2;
    io_chiOut2[1023 : 960] = sBoxMasked_34_io_res2;
    io_chiOut2[959 : 896] = sBoxMasked_35_io_res2;
    io_chiOut2[895 : 832] = sBoxMasked_36_io_res2;
    io_chiOut2[831 : 768] = sBoxMasked_37_io_res2;
    io_chiOut2[767 : 704] = sBoxMasked_38_io_res2;
    io_chiOut2[703 : 640] = sBoxMasked_39_io_res2;
    io_chiOut2[639 : 576] = sBoxMasked_40_io_res2;
    io_chiOut2[575 : 512] = sBoxMasked_41_io_res2;
    io_chiOut2[511 : 448] = sBoxMasked_42_io_res2;
    io_chiOut2[447 : 384] = sBoxMasked_43_io_res2;
    io_chiOut2[383 : 320] = sBoxMasked_44_io_res2;
    io_chiOut2[319 : 256] = sBoxMasked_45_io_res2;
    io_chiOut2[255 : 192] = sBoxMasked_46_io_res2;
    io_chiOut2[191 : 128] = sBoxMasked_47_io_res2;
    io_chiOut2[127 : 64] = sBoxMasked_48_io_res2;
    io_chiOut2[63 : 0] = sBoxMasked_49_io_res2;
  end

  assign sBoxMasked_26_io_c1 = io_chiIn1[1535 : 1472];
  assign sBoxMasked_26_io_c2 = io_chiIn2[1535 : 1472];
  assign sBoxMasked_26_io_a1 = io_chiIn1[1471 : 1408];
  assign sBoxMasked_26_io_a2 = io_chiIn2[1471 : 1408];
  assign sBoxMasked_26_io_b1 = io_chiIn1[1407 : 1344];
  assign sBoxMasked_26_io_b2 = io_chiIn2[1407 : 1344];
  assign sBoxMasked_27_io_c1 = io_chiIn1[1471 : 1408];
  assign sBoxMasked_27_io_c2 = io_chiIn2[1471 : 1408];
  assign sBoxMasked_27_io_a1 = io_chiIn1[1407 : 1344];
  assign sBoxMasked_27_io_a2 = io_chiIn2[1407 : 1344];
  assign sBoxMasked_27_io_b1 = io_chiIn1[1343 : 1280];
  assign sBoxMasked_27_io_b2 = io_chiIn2[1343 : 1280];
  assign sBoxMasked_28_io_c1 = io_chiIn1[1407 : 1344];
  assign sBoxMasked_28_io_c2 = io_chiIn2[1407 : 1344];
  assign sBoxMasked_28_io_a1 = io_chiIn1[1343 : 1280];
  assign sBoxMasked_28_io_a2 = io_chiIn2[1343 : 1280];
  assign sBoxMasked_28_io_b1 = io_chiIn1[1599 : 1536];
  assign sBoxMasked_28_io_b2 = io_chiIn2[1599 : 1536];
  assign sBoxMasked_29_io_c1 = io_chiIn1[1343 : 1280];
  assign sBoxMasked_29_io_c2 = io_chiIn2[1343 : 1280];
  assign sBoxMasked_29_io_a1 = io_chiIn1[1599 : 1536];
  assign sBoxMasked_29_io_a2 = io_chiIn2[1599 : 1536];
  assign sBoxMasked_29_io_b1 = io_chiIn1[1535 : 1472];
  assign sBoxMasked_29_io_b2 = io_chiIn2[1535 : 1472];
  assign sBoxMasked_30_io_c1 = io_chiIn1[1279 : 1216];
  assign sBoxMasked_30_io_c2 = io_chiIn2[1279 : 1216];
  assign sBoxMasked_30_io_a1 = io_chiIn1[1215 : 1152];
  assign sBoxMasked_30_io_a2 = io_chiIn2[1215 : 1152];
  assign sBoxMasked_30_io_b1 = io_chiIn1[1151 : 1088];
  assign sBoxMasked_30_io_b2 = io_chiIn2[1151 : 1088];
  assign sBoxMasked_31_io_c1 = io_chiIn1[1215 : 1152];
  assign sBoxMasked_31_io_c2 = io_chiIn2[1215 : 1152];
  assign sBoxMasked_31_io_a1 = io_chiIn1[1151 : 1088];
  assign sBoxMasked_31_io_a2 = io_chiIn2[1151 : 1088];
  assign sBoxMasked_31_io_b1 = io_chiIn1[1087 : 1024];
  assign sBoxMasked_31_io_b2 = io_chiIn2[1087 : 1024];
  assign sBoxMasked_32_io_c1 = io_chiIn1[1151 : 1088];
  assign sBoxMasked_32_io_c2 = io_chiIn2[1151 : 1088];
  assign sBoxMasked_32_io_a1 = io_chiIn1[1087 : 1024];
  assign sBoxMasked_32_io_a2 = io_chiIn2[1087 : 1024];
  assign sBoxMasked_32_io_b1 = io_chiIn1[1023 : 960];
  assign sBoxMasked_32_io_b2 = io_chiIn2[1023 : 960];
  assign sBoxMasked_33_io_c1 = io_chiIn1[1087 : 1024];
  assign sBoxMasked_33_io_c2 = io_chiIn2[1087 : 1024];
  assign sBoxMasked_33_io_a1 = io_chiIn1[1023 : 960];
  assign sBoxMasked_33_io_a2 = io_chiIn2[1023 : 960];
  assign sBoxMasked_33_io_b1 = io_chiIn1[1279 : 1216];
  assign sBoxMasked_33_io_b2 = io_chiIn2[1279 : 1216];
  assign sBoxMasked_34_io_c1 = io_chiIn1[1023 : 960];
  assign sBoxMasked_34_io_c2 = io_chiIn2[1023 : 960];
  assign sBoxMasked_34_io_a1 = io_chiIn1[1279 : 1216];
  assign sBoxMasked_34_io_a2 = io_chiIn2[1279 : 1216];
  assign sBoxMasked_34_io_b1 = io_chiIn1[1215 : 1152];
  assign sBoxMasked_34_io_b2 = io_chiIn2[1215 : 1152];
  assign sBoxMasked_35_io_c1 = io_chiIn1[959 : 896];
  assign sBoxMasked_35_io_c2 = io_chiIn2[959 : 896];
  assign sBoxMasked_35_io_a1 = io_chiIn1[895 : 832];
  assign sBoxMasked_35_io_a2 = io_chiIn2[895 : 832];
  assign sBoxMasked_35_io_b1 = io_chiIn1[831 : 768];
  assign sBoxMasked_35_io_b2 = io_chiIn2[831 : 768];
  assign sBoxMasked_36_io_c1 = io_chiIn1[895 : 832];
  assign sBoxMasked_36_io_c2 = io_chiIn2[895 : 832];
  assign sBoxMasked_36_io_a1 = io_chiIn1[831 : 768];
  assign sBoxMasked_36_io_a2 = io_chiIn2[831 : 768];
  assign sBoxMasked_36_io_b1 = io_chiIn1[767 : 704];
  assign sBoxMasked_36_io_b2 = io_chiIn2[767 : 704];
  assign sBoxMasked_37_io_c1 = io_chiIn1[831 : 768];
  assign sBoxMasked_37_io_c2 = io_chiIn2[831 : 768];
  assign sBoxMasked_37_io_a1 = io_chiIn1[767 : 704];
  assign sBoxMasked_37_io_a2 = io_chiIn2[767 : 704];
  assign sBoxMasked_37_io_b1 = io_chiIn1[703 : 640];
  assign sBoxMasked_37_io_b2 = io_chiIn2[703 : 640];
  assign sBoxMasked_38_io_c1 = io_chiIn1[767 : 704];
  assign sBoxMasked_38_io_c2 = io_chiIn2[767 : 704];
  assign sBoxMasked_38_io_a1 = io_chiIn1[703 : 640];
  assign sBoxMasked_38_io_a2 = io_chiIn2[703 : 640];
  assign sBoxMasked_38_io_b1 = io_chiIn1[959 : 896];
  assign sBoxMasked_38_io_b2 = io_chiIn2[959 : 896];
  assign sBoxMasked_39_io_c1 = io_chiIn1[703 : 640];
  assign sBoxMasked_39_io_c2 = io_chiIn2[703 : 640];
  assign sBoxMasked_39_io_a1 = io_chiIn1[959 : 896];
  assign sBoxMasked_39_io_a2 = io_chiIn2[959 : 896];
  assign sBoxMasked_39_io_b1 = io_chiIn1[895 : 832];
  assign sBoxMasked_39_io_b2 = io_chiIn2[895 : 832];
  assign sBoxMasked_40_io_c1 = io_chiIn1[639 : 576];
  assign sBoxMasked_40_io_c2 = io_chiIn2[639 : 576];
  assign sBoxMasked_40_io_a1 = io_chiIn1[575 : 512];
  assign sBoxMasked_40_io_a2 = io_chiIn2[575 : 512];
  assign sBoxMasked_40_io_b1 = io_chiIn1[511 : 448];
  assign sBoxMasked_40_io_b2 = io_chiIn2[511 : 448];
  assign sBoxMasked_41_io_c1 = io_chiIn1[575 : 512];
  assign sBoxMasked_41_io_c2 = io_chiIn2[575 : 512];
  assign sBoxMasked_41_io_a1 = io_chiIn1[511 : 448];
  assign sBoxMasked_41_io_a2 = io_chiIn2[511 : 448];
  assign sBoxMasked_41_io_b1 = io_chiIn1[447 : 384];
  assign sBoxMasked_41_io_b2 = io_chiIn2[447 : 384];
  assign sBoxMasked_42_io_c1 = io_chiIn1[511 : 448];
  assign sBoxMasked_42_io_c2 = io_chiIn2[511 : 448];
  assign sBoxMasked_42_io_a1 = io_chiIn1[447 : 384];
  assign sBoxMasked_42_io_a2 = io_chiIn2[447 : 384];
  assign sBoxMasked_42_io_b1 = io_chiIn1[383 : 320];
  assign sBoxMasked_42_io_b2 = io_chiIn2[383 : 320];
  assign sBoxMasked_43_io_c1 = io_chiIn1[447 : 384];
  assign sBoxMasked_43_io_c2 = io_chiIn2[447 : 384];
  assign sBoxMasked_43_io_a1 = io_chiIn1[383 : 320];
  assign sBoxMasked_43_io_a2 = io_chiIn2[383 : 320];
  assign sBoxMasked_43_io_b1 = io_chiIn1[639 : 576];
  assign sBoxMasked_43_io_b2 = io_chiIn2[639 : 576];
  assign sBoxMasked_44_io_c1 = io_chiIn1[383 : 320];
  assign sBoxMasked_44_io_c2 = io_chiIn2[383 : 320];
  assign sBoxMasked_44_io_a1 = io_chiIn1[639 : 576];
  assign sBoxMasked_44_io_a2 = io_chiIn2[639 : 576];
  assign sBoxMasked_44_io_b1 = io_chiIn1[575 : 512];
  assign sBoxMasked_44_io_b2 = io_chiIn2[575 : 512];
  assign sBoxMasked_45_io_c1 = io_chiIn1[319 : 256];
  assign sBoxMasked_45_io_c2 = io_chiIn2[319 : 256];
  assign sBoxMasked_45_io_a1 = io_chiIn1[255 : 192];
  assign sBoxMasked_45_io_a2 = io_chiIn2[255 : 192];
  assign sBoxMasked_45_io_b1 = io_chiIn1[191 : 128];
  assign sBoxMasked_45_io_b2 = io_chiIn2[191 : 128];
  assign sBoxMasked_46_io_c1 = io_chiIn1[255 : 192];
  assign sBoxMasked_46_io_c2 = io_chiIn2[255 : 192];
  assign sBoxMasked_46_io_a1 = io_chiIn1[191 : 128];
  assign sBoxMasked_46_io_a2 = io_chiIn2[191 : 128];
  assign sBoxMasked_46_io_b1 = io_chiIn1[127 : 64];
  assign sBoxMasked_46_io_b2 = io_chiIn2[127 : 64];
  assign sBoxMasked_47_io_c1 = io_chiIn1[191 : 128];
  assign sBoxMasked_47_io_c2 = io_chiIn2[191 : 128];
  assign sBoxMasked_47_io_a1 = io_chiIn1[127 : 64];
  assign sBoxMasked_47_io_a2 = io_chiIn2[127 : 64];
  assign sBoxMasked_47_io_b1 = io_chiIn1[63 : 0];
  assign sBoxMasked_47_io_b2 = io_chiIn2[63 : 0];
  assign sBoxMasked_48_io_c1 = io_chiIn1[127 : 64];
  assign sBoxMasked_48_io_c2 = io_chiIn2[127 : 64];
  assign sBoxMasked_48_io_a1 = io_chiIn1[63 : 0];
  assign sBoxMasked_48_io_a2 = io_chiIn2[63 : 0];
  assign sBoxMasked_48_io_b1 = io_chiIn1[319 : 256];
  assign sBoxMasked_48_io_b2 = io_chiIn2[319 : 256];
  assign sBoxMasked_49_io_c1 = io_chiIn1[63 : 0];
  assign sBoxMasked_49_io_c2 = io_chiIn2[63 : 0];
  assign sBoxMasked_49_io_a1 = io_chiIn1[319 : 256];
  assign sBoxMasked_49_io_a2 = io_chiIn2[319 : 256];
  assign sBoxMasked_49_io_b1 = io_chiIn1[255 : 192];
  assign sBoxMasked_49_io_b2 = io_chiIn2[255 : 192];

endmodule

//RhoPi replaced by RhoPi

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
    io_rhoOut[959 : 896] = {_zz_io_rhoOut[62 : 0],_zz_io_rhoOut[63 : 63]};
    io_rhoOut[319 : 256] = {_zz_io_rhoOut_1[1 : 0],_zz_io_rhoOut_1[63 : 2]};
    io_rhoOut[1279 : 1216] = {_zz_io_rhoOut_2[35 : 0],_zz_io_rhoOut_2[63 : 36]};
    io_rhoOut[639 : 576] = {_zz_io_rhoOut_3[36 : 0],_zz_io_rhoOut_3[63 : 37]};
    io_rhoOut[575 : 512] = {_zz_io_rhoOut_4[27 : 0],_zz_io_rhoOut_4[63 : 28]};
    io_rhoOut[1535 : 1472] = {_zz_io_rhoOut_5[19 : 0],_zz_io_rhoOut_5[63 : 20]};
    io_rhoOut[895 : 832] = {_zz_io_rhoOut_6[57 : 0],_zz_io_rhoOut_6[63 : 58]};
    io_rhoOut[255 : 192] = {_zz_io_rhoOut_7[8 : 0],_zz_io_rhoOut_7[63 : 9]};
    io_rhoOut[1215 : 1152] = {_zz_io_rhoOut_8[43 : 0],_zz_io_rhoOut_8[63 : 44]};
    io_rhoOut[1151 : 1088] = {_zz_io_rhoOut_9[60 : 0],_zz_io_rhoOut_9[63 : 61]};
    io_rhoOut[511 : 448] = {_zz_io_rhoOut_10[53 : 0],_zz_io_rhoOut_10[63 : 54]};
    io_rhoOut[1471 : 1408] = {_zz_io_rhoOut_11[20 : 0],_zz_io_rhoOut_11[63 : 21]};
    io_rhoOut[831 : 768] = {_zz_io_rhoOut_12[38 : 0],_zz_io_rhoOut_12[63 : 39]};
    io_rhoOut[191 : 128] = {_zz_io_rhoOut_13[24 : 0],_zz_io_rhoOut_13[63 : 25]};
    io_rhoOut[127 : 64] = {_zz_io_rhoOut_14[22 : 0],_zz_io_rhoOut_14[63 : 23]};
    io_rhoOut[1087 : 1024] = {_zz_io_rhoOut_15[18 : 0],_zz_io_rhoOut_15[63 : 19]};
    io_rhoOut[447 : 384] = {_zz_io_rhoOut_16[48 : 0],_zz_io_rhoOut_16[63 : 49]};
    io_rhoOut[1407 : 1344] = {_zz_io_rhoOut_17[42 : 0],_zz_io_rhoOut_17[63 : 43]};
    io_rhoOut[767 : 704] = {_zz_io_rhoOut_18[55 : 0],_zz_io_rhoOut_18[63 : 56]};
    io_rhoOut[703 : 640] = {_zz_io_rhoOut_19[45 : 0],_zz_io_rhoOut_19[63 : 46]};
    io_rhoOut[63 : 0] = {_zz_io_rhoOut_20[61 : 0],_zz_io_rhoOut_20[63 : 62]};
    io_rhoOut[1023 : 960] = {_zz_io_rhoOut_21[2 : 0],_zz_io_rhoOut_21[63 : 3]};
    io_rhoOut[383 : 320] = {_zz_io_rhoOut_22[7 : 0],_zz_io_rhoOut_22[63 : 8]};
    io_rhoOut[1343 : 1280] = {_zz_io_rhoOut_23[49 : 0],_zz_io_rhoOut_23[63 : 50]};
  end

  assign _zz_io_rhoOut = io_rhoIn[1535 : 1472];
  assign _zz_io_rhoOut_1 = io_rhoIn[1471 : 1408];
  assign _zz_io_rhoOut_2 = io_rhoIn[1407 : 1344];
  assign _zz_io_rhoOut_3 = io_rhoIn[1343 : 1280];
  assign _zz_io_rhoOut_4 = io_rhoIn[1279 : 1216];
  assign _zz_io_rhoOut_5 = io_rhoIn[1215 : 1152];
  assign _zz_io_rhoOut_6 = io_rhoIn[1151 : 1088];
  assign _zz_io_rhoOut_7 = io_rhoIn[1087 : 1024];
  assign _zz_io_rhoOut_8 = io_rhoIn[1023 : 960];
  assign _zz_io_rhoOut_9 = io_rhoIn[959 : 896];
  assign _zz_io_rhoOut_10 = io_rhoIn[895 : 832];
  assign _zz_io_rhoOut_11 = io_rhoIn[831 : 768];
  assign _zz_io_rhoOut_12 = io_rhoIn[767 : 704];
  assign _zz_io_rhoOut_13 = io_rhoIn[703 : 640];
  assign _zz_io_rhoOut_14 = io_rhoIn[639 : 576];
  assign _zz_io_rhoOut_15 = io_rhoIn[575 : 512];
  assign _zz_io_rhoOut_16 = io_rhoIn[511 : 448];
  assign _zz_io_rhoOut_17 = io_rhoIn[447 : 384];
  assign _zz_io_rhoOut_18 = io_rhoIn[383 : 320];
  assign _zz_io_rhoOut_19 = io_rhoIn[319 : 256];
  assign _zz_io_rhoOut_20 = io_rhoIn[255 : 192];
  assign _zz_io_rhoOut_21 = io_rhoIn[191 : 128];
  assign _zz_io_rhoOut_22 = io_rhoIn[127 : 64];
  assign _zz_io_rhoOut_23 = io_rhoIn[63 : 0];

endmodule

//Theta replaced by Theta

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
  assign _zz_d = b[319 : 256];
  always @(*) begin
    d[63 : 0] = (b[127 : 64] ^ {_zz_d[62 : 0],_zz_d[63 : 63]});
    d[127 : 64] = (b[191 : 128] ^ {_zz_d_1[62 : 0],_zz_d_1[63 : 63]});
    d[191 : 128] = (b[255 : 192] ^ {_zz_d_2[62 : 0],_zz_d_2[63 : 63]});
    d[255 : 192] = (b[319 : 256] ^ {_zz_d_3[62 : 0],_zz_d_3[63 : 63]});
    d[319 : 256] = (b[63 : 0] ^ {_zz_d_4[62 : 0],_zz_d_4[63 : 63]});
  end

  assign _zz_d_1 = b[63 : 0];
  assign _zz_d_2 = b[127 : 64];
  assign _zz_d_3 = b[191 : 128];
  assign _zz_d_4 = b[255 : 192];
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

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

//SBoxMasked replaced by SBoxMasked

module SBoxMasked (
  input      [63:0]   io_c1,
  input      [63:0]   io_c2,
  input      [63:0]   io_a1,
  input      [63:0]   io_a2,
  input      [63:0]   io_b1,
  input      [63:0]   io_b2,
  output     [63:0]   io_res1,
  output     [63:0]   io_res2,
  input               io_clk,
  input               io_reset
);

  reg        [63:0]   a1b1;
  reg        [63:0]   a1b2;
  reg        [63:0]   a2b1;
  reg        [63:0]   a2b2;

  assign io_res1 = (a1b1 ^ a1b2);
  assign io_res2 = (a2b1 ^ a2b2);
  always @(posedge io_clk) begin
    a1b1 <= ((~ io_a1) & io_b1);
    a1b2 <= ((io_a1 & io_b2) ^ io_c1);
    a2b1 <= ((io_a2 & io_b1) ^ io_c2);
    a2b2 <= ((~ io_a2) & io_b2);
  end


endmodule
