// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : KECCAK_Wrapper
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module KECCAK_Wrapper (
  input               io_clk,
  input               io_reset,
  input               io_resetFull,
  input               io_enable,
  input      [799:0]  io_dataIn,
  output     [799:0]  io_dataOut,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sLoadData = 2'd1;
  localparam States_sExecute = 2'd2;
  localparam States_sDone = 2'd3;

  wire       [399:0]  r_keccak_io_out1;
  wire       [399:0]  r_keccak_io_out2;
  wire                r_keccak_io_done;
  reg        [399:0]  r_dataInReg_0;
  reg        [399:0]  r_dataInReg_1;
  reg        [399:0]  r_dataOutReg_0;
  reg        [399:0]  r_dataOutReg_1;
  reg                 r_enableKeccak;
  reg                 r_resetKeccak;
  reg                 r_sampleInputs;
  reg                 r_sampleOutputs;
  reg        [1:0]    r_dutState;
  `ifndef SYNTHESIS
  reg [71:0] r_dutState_string;
  `endif


  KECCAKMasked400 r_keccak (
    .io_clk       (io_clk                   ), //i
    .io_reset     (r_resetKeccak            ), //i
    .io_enable    (r_enableKeccak           ), //i
    .io_in1       (r_dataInReg_0[399:0]     ), //i
    .io_in2       (r_dataInReg_1[399:0]     ), //i
    .io_out1      (r_keccak_io_out1[399:0]  ), //o
    .io_out2      (r_keccak_io_out2[399:0]  ), //o
    .io_done      (r_keccak_io_done         )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_dutState)
      States_sIdle : r_dutState_string = "sIdle    ";
      States_sLoadData : r_dutState_string = "sLoadData";
      States_sExecute : r_dutState_string = "sExecute ";
      States_sDone : r_dutState_string = "sDone    ";
      default : r_dutState_string = "?????????";
    endcase
  end
  `endif

  always @(*) begin
    r_sampleInputs = 1'b0;
    case(r_dutState)
      States_sIdle : begin
      end
      States_sLoadData : begin
        r_sampleInputs = 1'b1;
      end
      States_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_sampleOutputs = 1'b0;
    case(r_dutState)
      States_sIdle : begin
      end
      States_sLoadData : begin
      end
      States_sExecute : begin
        if(r_keccak_io_done) begin
          r_sampleOutputs = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_done = 1'b0;
    case(r_dutState)
      States_sIdle : begin
      end
      States_sLoadData : begin
      end
      States_sExecute : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign io_dataOut = {r_dataOutReg_0,r_dataOutReg_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_dataInReg_0 <= 400'h0;
      r_dataInReg_1 <= 400'h0;
      r_dataOutReg_0 <= 400'h0;
      r_dataOutReg_1 <= 400'h0;
      r_enableKeccak <= 1'b0;
      r_resetKeccak <= 1'b1;
      r_dutState <= States_sIdle;
    end else begin
      if(r_sampleInputs) begin
        r_dataInReg_0 <= io_dataIn[399 : 0];
        r_dataInReg_1 <= io_dataIn[799 : 400];
      end
      if(r_sampleOutputs) begin
        r_dataOutReg_0 <= r_keccak_io_out1;
        r_dataOutReg_1 <= r_keccak_io_out2;
      end
      case(r_dutState)
        States_sIdle : begin
          r_dutState <= States_sIdle;
          r_enableKeccak <= 1'b0;
          r_resetKeccak <= 1'b1;
          if(io_enable) begin
            r_dutState <= States_sLoadData;
          end
        end
        States_sLoadData : begin
          r_enableKeccak <= 1'b1;
          r_resetKeccak <= 1'b0;
          r_dutState <= States_sExecute;
        end
        States_sExecute : begin
          r_dutState <= States_sExecute;
          if(r_keccak_io_done) begin
            r_dutState <= States_sDone;
          end
        end
        default : begin
          r_dutState <= States_sDone;
        end
      endcase
    end
  end


endmodule

module KECCAKMasked400 (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [399:0]  io_in1,
  input      [399:0]  io_in2,
  output     [399:0]  io_out1,
  output     [399:0]  io_out2,
  output reg          io_done
);
  localparam States_1_sIdle = 2'd0;
  localparam States_1_sExecute = 2'd1;
  localparam States_1_sDone = 2'd2;

  wire       [399:0]  r_theta1_io_thetaOut;
  wire       [399:0]  r_theta2_io_thetaOut;
  wire       [399:0]  r_rhopi1_io_rhoOut;
  wire       [399:0]  r_rhopi2_io_rhoOut;
  wire       [399:0]  r_chi_io_chiOut1;
  wire       [399:0]  r_chi_io_chiOut2;
  wire       [399:0]  r_iota1_io_iotaOut;
  wire       [4:0]    _zz_r_roundCounter_valueNext;
  wire       [0:0]    _zz_r_roundCounter_valueNext_1;
  reg        [399:0]  r_state1;
  reg        [399:0]  r_state2;
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
  Theta400 r_theta1 (
    .io_thetaIn     (r_state1[399:0]              ), //i
    .io_thetaOut    (r_theta1_io_thetaOut[399:0]  )  //o
  );
  Theta400 r_theta2 (
    .io_thetaIn     (r_state2[399:0]              ), //i
    .io_thetaOut    (r_theta2_io_thetaOut[399:0]  )  //o
  );
  RhoPi400 r_rhopi1 (
    .io_rhoIn     (r_theta1_io_thetaOut[399:0]  ), //i
    .io_rhoOut    (r_rhopi1_io_rhoOut[399:0]    )  //o
  );
  RhoPi400 r_rhopi2 (
    .io_rhoIn     (r_theta2_io_thetaOut[399:0]  ), //i
    .io_rhoOut    (r_rhopi2_io_rhoOut[399:0]    )  //o
  );
  ChiMasked400 r_chi (
    .io_chiIn1     (r_rhopi1_io_rhoOut[399:0]  ), //i
    .io_chiIn2     (r_rhopi2_io_rhoOut[399:0]  ), //i
    .io_chiOut1    (r_chi_io_chiOut1[399:0]    ), //o
    .io_chiOut2    (r_chi_io_chiOut2[399:0]    ), //o
    .io_clk        (io_clk                     ), //i
    .io_reset      (io_reset                   )  //i
  );
  Iota400 r_iota1 (
    .io_iotaIn     (r_chi_io_chiOut1[399:0]    ), //i
    .io_round      (r_roundCounter_value[4:0]  ), //i
    .io_iotaOut    (r_iota1_io_iotaOut[399:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_keccakState)
      States_1_sIdle : r_keccakState_string = "sIdle   ";
      States_1_sExecute : r_keccakState_string = "sExecute";
      States_1_sDone : r_keccakState_string = "sDone   ";
      default : r_keccakState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(r_keccakState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willIncrement = 1'b0;
    case(r_keccakState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
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
      States_1_sIdle : begin
        r_roundCounter_willClear = 1'b1;
      end
      States_1_sExecute : begin
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
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
        r_smallCounter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_smallCounter_willClear = 1'b0;
    case(r_keccakState)
      States_1_sIdle : begin
        r_smallCounter_willClear = 1'b1;
      end
      States_1_sExecute : begin
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
      r_state1 <= 400'h0;
      r_state2 <= 400'h0;
      r_roundCounter_value <= 5'h0;
      r_smallCounter_value <= 1'b0;
      r_keccakState <= States_1_sIdle;
    end else begin
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCounter_value <= r_smallCounter_valueNext;
      r_state1 <= r_iota1_io_iotaOut;
      r_state2 <= r_chi_io_chiOut2;
      case(r_keccakState)
        States_1_sIdle : begin
          r_keccakState <= States_1_sIdle;
          if(io_enable) begin
            r_state1 <= io_in1;
            r_state2 <= io_in2;
            r_keccakState <= States_1_sExecute;
          end
        end
        States_1_sExecute : begin
          r_keccakState <= States_1_sExecute;
          if(r_roundCounter_willOverflow) begin
            r_keccakState <= States_1_sDone;
          end
        end
        default : begin
          r_keccakState <= States_1_sDone;
        end
      endcase
    end
  end


endmodule

module Iota400 (
  input      [399:0]  io_iotaIn,
  input      [4:0]    io_round,
  output     [399:0]  io_iotaOut
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
  assign io_iotaOut = {(io_iotaIn[399 : 384] ^ roundConstant[15 : 0]),io_iotaIn[383 : 0]};

endmodule

module ChiMasked400 (
  input      [399:0]  io_chiIn1,
  input      [399:0]  io_chiIn2,
  output reg [399:0]  io_chiOut1,
  output reg [399:0]  io_chiOut2,
  input               io_clk,
  input               io_reset
);

  wire       [15:0]   sBoxMasked16_25_io_c1;
  wire       [15:0]   sBoxMasked16_25_io_c2;
  wire       [15:0]   sBoxMasked16_25_io_a1;
  wire       [15:0]   sBoxMasked16_25_io_a2;
  wire       [15:0]   sBoxMasked16_25_io_b1;
  wire       [15:0]   sBoxMasked16_25_io_b2;
  wire       [15:0]   sBoxMasked16_26_io_c1;
  wire       [15:0]   sBoxMasked16_26_io_c2;
  wire       [15:0]   sBoxMasked16_26_io_a1;
  wire       [15:0]   sBoxMasked16_26_io_a2;
  wire       [15:0]   sBoxMasked16_26_io_b1;
  wire       [15:0]   sBoxMasked16_26_io_b2;
  wire       [15:0]   sBoxMasked16_27_io_c1;
  wire       [15:0]   sBoxMasked16_27_io_c2;
  wire       [15:0]   sBoxMasked16_27_io_a1;
  wire       [15:0]   sBoxMasked16_27_io_a2;
  wire       [15:0]   sBoxMasked16_27_io_b1;
  wire       [15:0]   sBoxMasked16_27_io_b2;
  wire       [15:0]   sBoxMasked16_28_io_c1;
  wire       [15:0]   sBoxMasked16_28_io_c2;
  wire       [15:0]   sBoxMasked16_28_io_a1;
  wire       [15:0]   sBoxMasked16_28_io_a2;
  wire       [15:0]   sBoxMasked16_28_io_b1;
  wire       [15:0]   sBoxMasked16_28_io_b2;
  wire       [15:0]   sBoxMasked16_29_io_c1;
  wire       [15:0]   sBoxMasked16_29_io_c2;
  wire       [15:0]   sBoxMasked16_29_io_a1;
  wire       [15:0]   sBoxMasked16_29_io_a2;
  wire       [15:0]   sBoxMasked16_29_io_b1;
  wire       [15:0]   sBoxMasked16_29_io_b2;
  wire       [15:0]   sBoxMasked16_30_io_c1;
  wire       [15:0]   sBoxMasked16_30_io_c2;
  wire       [15:0]   sBoxMasked16_30_io_a1;
  wire       [15:0]   sBoxMasked16_30_io_a2;
  wire       [15:0]   sBoxMasked16_30_io_b1;
  wire       [15:0]   sBoxMasked16_30_io_b2;
  wire       [15:0]   sBoxMasked16_31_io_c1;
  wire       [15:0]   sBoxMasked16_31_io_c2;
  wire       [15:0]   sBoxMasked16_31_io_a1;
  wire       [15:0]   sBoxMasked16_31_io_a2;
  wire       [15:0]   sBoxMasked16_31_io_b1;
  wire       [15:0]   sBoxMasked16_31_io_b2;
  wire       [15:0]   sBoxMasked16_32_io_c1;
  wire       [15:0]   sBoxMasked16_32_io_c2;
  wire       [15:0]   sBoxMasked16_32_io_a1;
  wire       [15:0]   sBoxMasked16_32_io_a2;
  wire       [15:0]   sBoxMasked16_32_io_b1;
  wire       [15:0]   sBoxMasked16_32_io_b2;
  wire       [15:0]   sBoxMasked16_33_io_c1;
  wire       [15:0]   sBoxMasked16_33_io_c2;
  wire       [15:0]   sBoxMasked16_33_io_a1;
  wire       [15:0]   sBoxMasked16_33_io_a2;
  wire       [15:0]   sBoxMasked16_33_io_b1;
  wire       [15:0]   sBoxMasked16_33_io_b2;
  wire       [15:0]   sBoxMasked16_34_io_c1;
  wire       [15:0]   sBoxMasked16_34_io_c2;
  wire       [15:0]   sBoxMasked16_34_io_a1;
  wire       [15:0]   sBoxMasked16_34_io_a2;
  wire       [15:0]   sBoxMasked16_34_io_b1;
  wire       [15:0]   sBoxMasked16_34_io_b2;
  wire       [15:0]   sBoxMasked16_35_io_c1;
  wire       [15:0]   sBoxMasked16_35_io_c2;
  wire       [15:0]   sBoxMasked16_35_io_a1;
  wire       [15:0]   sBoxMasked16_35_io_a2;
  wire       [15:0]   sBoxMasked16_35_io_b1;
  wire       [15:0]   sBoxMasked16_35_io_b2;
  wire       [15:0]   sBoxMasked16_36_io_c1;
  wire       [15:0]   sBoxMasked16_36_io_c2;
  wire       [15:0]   sBoxMasked16_36_io_a1;
  wire       [15:0]   sBoxMasked16_36_io_a2;
  wire       [15:0]   sBoxMasked16_36_io_b1;
  wire       [15:0]   sBoxMasked16_36_io_b2;
  wire       [15:0]   sBoxMasked16_37_io_c1;
  wire       [15:0]   sBoxMasked16_37_io_c2;
  wire       [15:0]   sBoxMasked16_37_io_a1;
  wire       [15:0]   sBoxMasked16_37_io_a2;
  wire       [15:0]   sBoxMasked16_37_io_b1;
  wire       [15:0]   sBoxMasked16_37_io_b2;
  wire       [15:0]   sBoxMasked16_38_io_c1;
  wire       [15:0]   sBoxMasked16_38_io_c2;
  wire       [15:0]   sBoxMasked16_38_io_a1;
  wire       [15:0]   sBoxMasked16_38_io_a2;
  wire       [15:0]   sBoxMasked16_38_io_b1;
  wire       [15:0]   sBoxMasked16_38_io_b2;
  wire       [15:0]   sBoxMasked16_39_io_c1;
  wire       [15:0]   sBoxMasked16_39_io_c2;
  wire       [15:0]   sBoxMasked16_39_io_a1;
  wire       [15:0]   sBoxMasked16_39_io_a2;
  wire       [15:0]   sBoxMasked16_39_io_b1;
  wire       [15:0]   sBoxMasked16_39_io_b2;
  wire       [15:0]   sBoxMasked16_40_io_c1;
  wire       [15:0]   sBoxMasked16_40_io_c2;
  wire       [15:0]   sBoxMasked16_40_io_a1;
  wire       [15:0]   sBoxMasked16_40_io_a2;
  wire       [15:0]   sBoxMasked16_40_io_b1;
  wire       [15:0]   sBoxMasked16_40_io_b2;
  wire       [15:0]   sBoxMasked16_41_io_c1;
  wire       [15:0]   sBoxMasked16_41_io_c2;
  wire       [15:0]   sBoxMasked16_41_io_a1;
  wire       [15:0]   sBoxMasked16_41_io_a2;
  wire       [15:0]   sBoxMasked16_41_io_b1;
  wire       [15:0]   sBoxMasked16_41_io_b2;
  wire       [15:0]   sBoxMasked16_42_io_c1;
  wire       [15:0]   sBoxMasked16_42_io_c2;
  wire       [15:0]   sBoxMasked16_42_io_a1;
  wire       [15:0]   sBoxMasked16_42_io_a2;
  wire       [15:0]   sBoxMasked16_42_io_b1;
  wire       [15:0]   sBoxMasked16_42_io_b2;
  wire       [15:0]   sBoxMasked16_43_io_c1;
  wire       [15:0]   sBoxMasked16_43_io_c2;
  wire       [15:0]   sBoxMasked16_43_io_a1;
  wire       [15:0]   sBoxMasked16_43_io_a2;
  wire       [15:0]   sBoxMasked16_43_io_b1;
  wire       [15:0]   sBoxMasked16_43_io_b2;
  wire       [15:0]   sBoxMasked16_44_io_c1;
  wire       [15:0]   sBoxMasked16_44_io_c2;
  wire       [15:0]   sBoxMasked16_44_io_a1;
  wire       [15:0]   sBoxMasked16_44_io_a2;
  wire       [15:0]   sBoxMasked16_44_io_b1;
  wire       [15:0]   sBoxMasked16_44_io_b2;
  wire       [15:0]   sBoxMasked16_45_io_c1;
  wire       [15:0]   sBoxMasked16_45_io_c2;
  wire       [15:0]   sBoxMasked16_45_io_a1;
  wire       [15:0]   sBoxMasked16_45_io_a2;
  wire       [15:0]   sBoxMasked16_45_io_b1;
  wire       [15:0]   sBoxMasked16_45_io_b2;
  wire       [15:0]   sBoxMasked16_46_io_c1;
  wire       [15:0]   sBoxMasked16_46_io_c2;
  wire       [15:0]   sBoxMasked16_46_io_a1;
  wire       [15:0]   sBoxMasked16_46_io_a2;
  wire       [15:0]   sBoxMasked16_46_io_b1;
  wire       [15:0]   sBoxMasked16_46_io_b2;
  wire       [15:0]   sBoxMasked16_47_io_c1;
  wire       [15:0]   sBoxMasked16_47_io_c2;
  wire       [15:0]   sBoxMasked16_47_io_a1;
  wire       [15:0]   sBoxMasked16_47_io_a2;
  wire       [15:0]   sBoxMasked16_47_io_b1;
  wire       [15:0]   sBoxMasked16_47_io_b2;
  wire       [15:0]   sBoxMasked16_48_io_c1;
  wire       [15:0]   sBoxMasked16_48_io_c2;
  wire       [15:0]   sBoxMasked16_48_io_a1;
  wire       [15:0]   sBoxMasked16_48_io_a2;
  wire       [15:0]   sBoxMasked16_48_io_b1;
  wire       [15:0]   sBoxMasked16_48_io_b2;
  wire       [15:0]   sBoxMasked16_49_io_c1;
  wire       [15:0]   sBoxMasked16_49_io_c2;
  wire       [15:0]   sBoxMasked16_49_io_a1;
  wire       [15:0]   sBoxMasked16_49_io_a2;
  wire       [15:0]   sBoxMasked16_49_io_b1;
  wire       [15:0]   sBoxMasked16_49_io_b2;
  wire       [15:0]   sBoxMasked16_25_io_res1;
  wire       [15:0]   sBoxMasked16_25_io_res2;
  wire       [15:0]   sBoxMasked16_26_io_res1;
  wire       [15:0]   sBoxMasked16_26_io_res2;
  wire       [15:0]   sBoxMasked16_27_io_res1;
  wire       [15:0]   sBoxMasked16_27_io_res2;
  wire       [15:0]   sBoxMasked16_28_io_res1;
  wire       [15:0]   sBoxMasked16_28_io_res2;
  wire       [15:0]   sBoxMasked16_29_io_res1;
  wire       [15:0]   sBoxMasked16_29_io_res2;
  wire       [15:0]   sBoxMasked16_30_io_res1;
  wire       [15:0]   sBoxMasked16_30_io_res2;
  wire       [15:0]   sBoxMasked16_31_io_res1;
  wire       [15:0]   sBoxMasked16_31_io_res2;
  wire       [15:0]   sBoxMasked16_32_io_res1;
  wire       [15:0]   sBoxMasked16_32_io_res2;
  wire       [15:0]   sBoxMasked16_33_io_res1;
  wire       [15:0]   sBoxMasked16_33_io_res2;
  wire       [15:0]   sBoxMasked16_34_io_res1;
  wire       [15:0]   sBoxMasked16_34_io_res2;
  wire       [15:0]   sBoxMasked16_35_io_res1;
  wire       [15:0]   sBoxMasked16_35_io_res2;
  wire       [15:0]   sBoxMasked16_36_io_res1;
  wire       [15:0]   sBoxMasked16_36_io_res2;
  wire       [15:0]   sBoxMasked16_37_io_res1;
  wire       [15:0]   sBoxMasked16_37_io_res2;
  wire       [15:0]   sBoxMasked16_38_io_res1;
  wire       [15:0]   sBoxMasked16_38_io_res2;
  wire       [15:0]   sBoxMasked16_39_io_res1;
  wire       [15:0]   sBoxMasked16_39_io_res2;
  wire       [15:0]   sBoxMasked16_40_io_res1;
  wire       [15:0]   sBoxMasked16_40_io_res2;
  wire       [15:0]   sBoxMasked16_41_io_res1;
  wire       [15:0]   sBoxMasked16_41_io_res2;
  wire       [15:0]   sBoxMasked16_42_io_res1;
  wire       [15:0]   sBoxMasked16_42_io_res2;
  wire       [15:0]   sBoxMasked16_43_io_res1;
  wire       [15:0]   sBoxMasked16_43_io_res2;
  wire       [15:0]   sBoxMasked16_44_io_res1;
  wire       [15:0]   sBoxMasked16_44_io_res2;
  wire       [15:0]   sBoxMasked16_45_io_res1;
  wire       [15:0]   sBoxMasked16_45_io_res2;
  wire       [15:0]   sBoxMasked16_46_io_res1;
  wire       [15:0]   sBoxMasked16_46_io_res2;
  wire       [15:0]   sBoxMasked16_47_io_res1;
  wire       [15:0]   sBoxMasked16_47_io_res2;
  wire       [15:0]   sBoxMasked16_48_io_res1;
  wire       [15:0]   sBoxMasked16_48_io_res2;
  wire       [15:0]   sBoxMasked16_49_io_res1;
  wire       [15:0]   sBoxMasked16_49_io_res2;

  SBoxMasked16 sBoxMasked16_25 (
    .io_c1       (sBoxMasked16_25_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_25_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_25_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_25_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_25_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_25_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_25_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_25_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_26 (
    .io_c1       (sBoxMasked16_26_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_26_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_26_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_26_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_26_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_26_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_26_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_26_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_27 (
    .io_c1       (sBoxMasked16_27_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_27_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_27_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_27_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_27_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_27_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_27_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_27_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_28 (
    .io_c1       (sBoxMasked16_28_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_28_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_28_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_28_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_28_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_28_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_28_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_28_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_29 (
    .io_c1       (sBoxMasked16_29_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_29_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_29_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_29_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_29_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_29_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_29_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_29_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_30 (
    .io_c1       (sBoxMasked16_30_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_30_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_30_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_30_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_30_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_30_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_30_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_30_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_31 (
    .io_c1       (sBoxMasked16_31_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_31_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_31_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_31_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_31_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_31_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_31_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_31_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_32 (
    .io_c1       (sBoxMasked16_32_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_32_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_32_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_32_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_32_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_32_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_32_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_32_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_33 (
    .io_c1       (sBoxMasked16_33_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_33_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_33_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_33_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_33_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_33_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_33_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_33_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_34 (
    .io_c1       (sBoxMasked16_34_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_34_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_34_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_34_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_34_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_34_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_34_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_34_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_35 (
    .io_c1       (sBoxMasked16_35_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_35_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_35_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_35_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_35_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_35_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_35_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_35_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_36 (
    .io_c1       (sBoxMasked16_36_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_36_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_36_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_36_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_36_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_36_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_36_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_36_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_37 (
    .io_c1       (sBoxMasked16_37_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_37_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_37_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_37_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_37_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_37_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_37_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_37_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_38 (
    .io_c1       (sBoxMasked16_38_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_38_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_38_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_38_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_38_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_38_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_38_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_38_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_39 (
    .io_c1       (sBoxMasked16_39_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_39_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_39_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_39_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_39_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_39_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_39_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_39_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_40 (
    .io_c1       (sBoxMasked16_40_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_40_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_40_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_40_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_40_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_40_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_40_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_40_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_41 (
    .io_c1       (sBoxMasked16_41_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_41_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_41_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_41_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_41_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_41_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_41_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_41_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_42 (
    .io_c1       (sBoxMasked16_42_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_42_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_42_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_42_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_42_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_42_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_42_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_42_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_43 (
    .io_c1       (sBoxMasked16_43_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_43_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_43_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_43_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_43_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_43_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_43_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_43_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_44 (
    .io_c1       (sBoxMasked16_44_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_44_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_44_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_44_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_44_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_44_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_44_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_44_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_45 (
    .io_c1       (sBoxMasked16_45_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_45_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_45_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_45_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_45_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_45_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_45_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_45_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_46 (
    .io_c1       (sBoxMasked16_46_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_46_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_46_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_46_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_46_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_46_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_46_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_46_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_47 (
    .io_c1       (sBoxMasked16_47_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_47_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_47_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_47_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_47_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_47_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_47_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_47_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_48 (
    .io_c1       (sBoxMasked16_48_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_48_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_48_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_48_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_48_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_48_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_48_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_48_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  SBoxMasked16 sBoxMasked16_49 (
    .io_c1       (sBoxMasked16_49_io_c1[15:0]    ), //i
    .io_c2       (sBoxMasked16_49_io_c2[15:0]    ), //i
    .io_a1       (sBoxMasked16_49_io_a1[15:0]    ), //i
    .io_a2       (sBoxMasked16_49_io_a2[15:0]    ), //i
    .io_b1       (sBoxMasked16_49_io_b1[15:0]    ), //i
    .io_b2       (sBoxMasked16_49_io_b2[15:0]    ), //i
    .io_res1     (sBoxMasked16_49_io_res1[15:0]  ), //o
    .io_res2     (sBoxMasked16_49_io_res2[15:0]  ), //o
    .io_clk      (io_clk                         ), //i
    .io_reset    (io_reset                       )  //i
  );
  assign sBoxMasked16_25_io_c1 = io_chiIn1[399 : 384];
  assign sBoxMasked16_25_io_c2 = io_chiIn2[399 : 384];
  assign sBoxMasked16_25_io_a1 = io_chiIn1[383 : 368];
  assign sBoxMasked16_25_io_a2 = io_chiIn2[383 : 368];
  assign sBoxMasked16_25_io_b1 = io_chiIn1[367 : 352];
  assign sBoxMasked16_25_io_b2 = io_chiIn2[367 : 352];
  always @(*) begin
    io_chiOut1[399 : 384] = sBoxMasked16_25_io_res1;
    io_chiOut1[383 : 368] = sBoxMasked16_26_io_res1;
    io_chiOut1[367 : 352] = sBoxMasked16_27_io_res1;
    io_chiOut1[351 : 336] = sBoxMasked16_28_io_res1;
    io_chiOut1[335 : 320] = sBoxMasked16_29_io_res1;
    io_chiOut1[319 : 304] = sBoxMasked16_30_io_res1;
    io_chiOut1[303 : 288] = sBoxMasked16_31_io_res1;
    io_chiOut1[287 : 272] = sBoxMasked16_32_io_res1;
    io_chiOut1[271 : 256] = sBoxMasked16_33_io_res1;
    io_chiOut1[255 : 240] = sBoxMasked16_34_io_res1;
    io_chiOut1[239 : 224] = sBoxMasked16_35_io_res1;
    io_chiOut1[223 : 208] = sBoxMasked16_36_io_res1;
    io_chiOut1[207 : 192] = sBoxMasked16_37_io_res1;
    io_chiOut1[191 : 176] = sBoxMasked16_38_io_res1;
    io_chiOut1[175 : 160] = sBoxMasked16_39_io_res1;
    io_chiOut1[159 : 144] = sBoxMasked16_40_io_res1;
    io_chiOut1[143 : 128] = sBoxMasked16_41_io_res1;
    io_chiOut1[127 : 112] = sBoxMasked16_42_io_res1;
    io_chiOut1[111 : 96] = sBoxMasked16_43_io_res1;
    io_chiOut1[95 : 80] = sBoxMasked16_44_io_res1;
    io_chiOut1[79 : 64] = sBoxMasked16_45_io_res1;
    io_chiOut1[63 : 48] = sBoxMasked16_46_io_res1;
    io_chiOut1[47 : 32] = sBoxMasked16_47_io_res1;
    io_chiOut1[31 : 16] = sBoxMasked16_48_io_res1;
    io_chiOut1[15 : 0] = sBoxMasked16_49_io_res1;
  end

  always @(*) begin
    io_chiOut2[399 : 384] = sBoxMasked16_25_io_res2;
    io_chiOut2[383 : 368] = sBoxMasked16_26_io_res2;
    io_chiOut2[367 : 352] = sBoxMasked16_27_io_res2;
    io_chiOut2[351 : 336] = sBoxMasked16_28_io_res2;
    io_chiOut2[335 : 320] = sBoxMasked16_29_io_res2;
    io_chiOut2[319 : 304] = sBoxMasked16_30_io_res2;
    io_chiOut2[303 : 288] = sBoxMasked16_31_io_res2;
    io_chiOut2[287 : 272] = sBoxMasked16_32_io_res2;
    io_chiOut2[271 : 256] = sBoxMasked16_33_io_res2;
    io_chiOut2[255 : 240] = sBoxMasked16_34_io_res2;
    io_chiOut2[239 : 224] = sBoxMasked16_35_io_res2;
    io_chiOut2[223 : 208] = sBoxMasked16_36_io_res2;
    io_chiOut2[207 : 192] = sBoxMasked16_37_io_res2;
    io_chiOut2[191 : 176] = sBoxMasked16_38_io_res2;
    io_chiOut2[175 : 160] = sBoxMasked16_39_io_res2;
    io_chiOut2[159 : 144] = sBoxMasked16_40_io_res2;
    io_chiOut2[143 : 128] = sBoxMasked16_41_io_res2;
    io_chiOut2[127 : 112] = sBoxMasked16_42_io_res2;
    io_chiOut2[111 : 96] = sBoxMasked16_43_io_res2;
    io_chiOut2[95 : 80] = sBoxMasked16_44_io_res2;
    io_chiOut2[79 : 64] = sBoxMasked16_45_io_res2;
    io_chiOut2[63 : 48] = sBoxMasked16_46_io_res2;
    io_chiOut2[47 : 32] = sBoxMasked16_47_io_res2;
    io_chiOut2[31 : 16] = sBoxMasked16_48_io_res2;
    io_chiOut2[15 : 0] = sBoxMasked16_49_io_res2;
  end

  assign sBoxMasked16_26_io_c1 = io_chiIn1[383 : 368];
  assign sBoxMasked16_26_io_c2 = io_chiIn2[383 : 368];
  assign sBoxMasked16_26_io_a1 = io_chiIn1[367 : 352];
  assign sBoxMasked16_26_io_a2 = io_chiIn2[367 : 352];
  assign sBoxMasked16_26_io_b1 = io_chiIn1[351 : 336];
  assign sBoxMasked16_26_io_b2 = io_chiIn2[351 : 336];
  assign sBoxMasked16_27_io_c1 = io_chiIn1[367 : 352];
  assign sBoxMasked16_27_io_c2 = io_chiIn2[367 : 352];
  assign sBoxMasked16_27_io_a1 = io_chiIn1[351 : 336];
  assign sBoxMasked16_27_io_a2 = io_chiIn2[351 : 336];
  assign sBoxMasked16_27_io_b1 = io_chiIn1[335 : 320];
  assign sBoxMasked16_27_io_b2 = io_chiIn2[335 : 320];
  assign sBoxMasked16_28_io_c1 = io_chiIn1[351 : 336];
  assign sBoxMasked16_28_io_c2 = io_chiIn2[351 : 336];
  assign sBoxMasked16_28_io_a1 = io_chiIn1[335 : 320];
  assign sBoxMasked16_28_io_a2 = io_chiIn2[335 : 320];
  assign sBoxMasked16_28_io_b1 = io_chiIn1[399 : 384];
  assign sBoxMasked16_28_io_b2 = io_chiIn2[399 : 384];
  assign sBoxMasked16_29_io_c1 = io_chiIn1[335 : 320];
  assign sBoxMasked16_29_io_c2 = io_chiIn2[335 : 320];
  assign sBoxMasked16_29_io_a1 = io_chiIn1[399 : 384];
  assign sBoxMasked16_29_io_a2 = io_chiIn2[399 : 384];
  assign sBoxMasked16_29_io_b1 = io_chiIn1[383 : 368];
  assign sBoxMasked16_29_io_b2 = io_chiIn2[383 : 368];
  assign sBoxMasked16_30_io_c1 = io_chiIn1[319 : 304];
  assign sBoxMasked16_30_io_c2 = io_chiIn2[319 : 304];
  assign sBoxMasked16_30_io_a1 = io_chiIn1[303 : 288];
  assign sBoxMasked16_30_io_a2 = io_chiIn2[303 : 288];
  assign sBoxMasked16_30_io_b1 = io_chiIn1[287 : 272];
  assign sBoxMasked16_30_io_b2 = io_chiIn2[287 : 272];
  assign sBoxMasked16_31_io_c1 = io_chiIn1[303 : 288];
  assign sBoxMasked16_31_io_c2 = io_chiIn2[303 : 288];
  assign sBoxMasked16_31_io_a1 = io_chiIn1[287 : 272];
  assign sBoxMasked16_31_io_a2 = io_chiIn2[287 : 272];
  assign sBoxMasked16_31_io_b1 = io_chiIn1[271 : 256];
  assign sBoxMasked16_31_io_b2 = io_chiIn2[271 : 256];
  assign sBoxMasked16_32_io_c1 = io_chiIn1[287 : 272];
  assign sBoxMasked16_32_io_c2 = io_chiIn2[287 : 272];
  assign sBoxMasked16_32_io_a1 = io_chiIn1[271 : 256];
  assign sBoxMasked16_32_io_a2 = io_chiIn2[271 : 256];
  assign sBoxMasked16_32_io_b1 = io_chiIn1[255 : 240];
  assign sBoxMasked16_32_io_b2 = io_chiIn2[255 : 240];
  assign sBoxMasked16_33_io_c1 = io_chiIn1[271 : 256];
  assign sBoxMasked16_33_io_c2 = io_chiIn2[271 : 256];
  assign sBoxMasked16_33_io_a1 = io_chiIn1[255 : 240];
  assign sBoxMasked16_33_io_a2 = io_chiIn2[255 : 240];
  assign sBoxMasked16_33_io_b1 = io_chiIn1[319 : 304];
  assign sBoxMasked16_33_io_b2 = io_chiIn2[319 : 304];
  assign sBoxMasked16_34_io_c1 = io_chiIn1[255 : 240];
  assign sBoxMasked16_34_io_c2 = io_chiIn2[255 : 240];
  assign sBoxMasked16_34_io_a1 = io_chiIn1[319 : 304];
  assign sBoxMasked16_34_io_a2 = io_chiIn2[319 : 304];
  assign sBoxMasked16_34_io_b1 = io_chiIn1[303 : 288];
  assign sBoxMasked16_34_io_b2 = io_chiIn2[303 : 288];
  assign sBoxMasked16_35_io_c1 = io_chiIn1[239 : 224];
  assign sBoxMasked16_35_io_c2 = io_chiIn2[239 : 224];
  assign sBoxMasked16_35_io_a1 = io_chiIn1[223 : 208];
  assign sBoxMasked16_35_io_a2 = io_chiIn2[223 : 208];
  assign sBoxMasked16_35_io_b1 = io_chiIn1[207 : 192];
  assign sBoxMasked16_35_io_b2 = io_chiIn2[207 : 192];
  assign sBoxMasked16_36_io_c1 = io_chiIn1[223 : 208];
  assign sBoxMasked16_36_io_c2 = io_chiIn2[223 : 208];
  assign sBoxMasked16_36_io_a1 = io_chiIn1[207 : 192];
  assign sBoxMasked16_36_io_a2 = io_chiIn2[207 : 192];
  assign sBoxMasked16_36_io_b1 = io_chiIn1[191 : 176];
  assign sBoxMasked16_36_io_b2 = io_chiIn2[191 : 176];
  assign sBoxMasked16_37_io_c1 = io_chiIn1[207 : 192];
  assign sBoxMasked16_37_io_c2 = io_chiIn2[207 : 192];
  assign sBoxMasked16_37_io_a1 = io_chiIn1[191 : 176];
  assign sBoxMasked16_37_io_a2 = io_chiIn2[191 : 176];
  assign sBoxMasked16_37_io_b1 = io_chiIn1[175 : 160];
  assign sBoxMasked16_37_io_b2 = io_chiIn2[175 : 160];
  assign sBoxMasked16_38_io_c1 = io_chiIn1[191 : 176];
  assign sBoxMasked16_38_io_c2 = io_chiIn2[191 : 176];
  assign sBoxMasked16_38_io_a1 = io_chiIn1[175 : 160];
  assign sBoxMasked16_38_io_a2 = io_chiIn2[175 : 160];
  assign sBoxMasked16_38_io_b1 = io_chiIn1[239 : 224];
  assign sBoxMasked16_38_io_b2 = io_chiIn2[239 : 224];
  assign sBoxMasked16_39_io_c1 = io_chiIn1[175 : 160];
  assign sBoxMasked16_39_io_c2 = io_chiIn2[175 : 160];
  assign sBoxMasked16_39_io_a1 = io_chiIn1[239 : 224];
  assign sBoxMasked16_39_io_a2 = io_chiIn2[239 : 224];
  assign sBoxMasked16_39_io_b1 = io_chiIn1[223 : 208];
  assign sBoxMasked16_39_io_b2 = io_chiIn2[223 : 208];
  assign sBoxMasked16_40_io_c1 = io_chiIn1[159 : 144];
  assign sBoxMasked16_40_io_c2 = io_chiIn2[159 : 144];
  assign sBoxMasked16_40_io_a1 = io_chiIn1[143 : 128];
  assign sBoxMasked16_40_io_a2 = io_chiIn2[143 : 128];
  assign sBoxMasked16_40_io_b1 = io_chiIn1[127 : 112];
  assign sBoxMasked16_40_io_b2 = io_chiIn2[127 : 112];
  assign sBoxMasked16_41_io_c1 = io_chiIn1[143 : 128];
  assign sBoxMasked16_41_io_c2 = io_chiIn2[143 : 128];
  assign sBoxMasked16_41_io_a1 = io_chiIn1[127 : 112];
  assign sBoxMasked16_41_io_a2 = io_chiIn2[127 : 112];
  assign sBoxMasked16_41_io_b1 = io_chiIn1[111 : 96];
  assign sBoxMasked16_41_io_b2 = io_chiIn2[111 : 96];
  assign sBoxMasked16_42_io_c1 = io_chiIn1[127 : 112];
  assign sBoxMasked16_42_io_c2 = io_chiIn2[127 : 112];
  assign sBoxMasked16_42_io_a1 = io_chiIn1[111 : 96];
  assign sBoxMasked16_42_io_a2 = io_chiIn2[111 : 96];
  assign sBoxMasked16_42_io_b1 = io_chiIn1[95 : 80];
  assign sBoxMasked16_42_io_b2 = io_chiIn2[95 : 80];
  assign sBoxMasked16_43_io_c1 = io_chiIn1[111 : 96];
  assign sBoxMasked16_43_io_c2 = io_chiIn2[111 : 96];
  assign sBoxMasked16_43_io_a1 = io_chiIn1[95 : 80];
  assign sBoxMasked16_43_io_a2 = io_chiIn2[95 : 80];
  assign sBoxMasked16_43_io_b1 = io_chiIn1[159 : 144];
  assign sBoxMasked16_43_io_b2 = io_chiIn2[159 : 144];
  assign sBoxMasked16_44_io_c1 = io_chiIn1[95 : 80];
  assign sBoxMasked16_44_io_c2 = io_chiIn2[95 : 80];
  assign sBoxMasked16_44_io_a1 = io_chiIn1[159 : 144];
  assign sBoxMasked16_44_io_a2 = io_chiIn2[159 : 144];
  assign sBoxMasked16_44_io_b1 = io_chiIn1[143 : 128];
  assign sBoxMasked16_44_io_b2 = io_chiIn2[143 : 128];
  assign sBoxMasked16_45_io_c1 = io_chiIn1[79 : 64];
  assign sBoxMasked16_45_io_c2 = io_chiIn2[79 : 64];
  assign sBoxMasked16_45_io_a1 = io_chiIn1[63 : 48];
  assign sBoxMasked16_45_io_a2 = io_chiIn2[63 : 48];
  assign sBoxMasked16_45_io_b1 = io_chiIn1[47 : 32];
  assign sBoxMasked16_45_io_b2 = io_chiIn2[47 : 32];
  assign sBoxMasked16_46_io_c1 = io_chiIn1[63 : 48];
  assign sBoxMasked16_46_io_c2 = io_chiIn2[63 : 48];
  assign sBoxMasked16_46_io_a1 = io_chiIn1[47 : 32];
  assign sBoxMasked16_46_io_a2 = io_chiIn2[47 : 32];
  assign sBoxMasked16_46_io_b1 = io_chiIn1[31 : 16];
  assign sBoxMasked16_46_io_b2 = io_chiIn2[31 : 16];
  assign sBoxMasked16_47_io_c1 = io_chiIn1[47 : 32];
  assign sBoxMasked16_47_io_c2 = io_chiIn2[47 : 32];
  assign sBoxMasked16_47_io_a1 = io_chiIn1[31 : 16];
  assign sBoxMasked16_47_io_a2 = io_chiIn2[31 : 16];
  assign sBoxMasked16_47_io_b1 = io_chiIn1[15 : 0];
  assign sBoxMasked16_47_io_b2 = io_chiIn2[15 : 0];
  assign sBoxMasked16_48_io_c1 = io_chiIn1[31 : 16];
  assign sBoxMasked16_48_io_c2 = io_chiIn2[31 : 16];
  assign sBoxMasked16_48_io_a1 = io_chiIn1[15 : 0];
  assign sBoxMasked16_48_io_a2 = io_chiIn2[15 : 0];
  assign sBoxMasked16_48_io_b1 = io_chiIn1[79 : 64];
  assign sBoxMasked16_48_io_b2 = io_chiIn2[79 : 64];
  assign sBoxMasked16_49_io_c1 = io_chiIn1[15 : 0];
  assign sBoxMasked16_49_io_c2 = io_chiIn2[15 : 0];
  assign sBoxMasked16_49_io_a1 = io_chiIn1[79 : 64];
  assign sBoxMasked16_49_io_a2 = io_chiIn2[79 : 64];
  assign sBoxMasked16_49_io_b1 = io_chiIn1[63 : 48];
  assign sBoxMasked16_49_io_b2 = io_chiIn2[63 : 48];

endmodule

//RhoPi400 replaced by RhoPi400

module RhoPi400 (
  input      [399:0]  io_rhoIn,
  output reg [399:0]  io_rhoOut
);

  wire       [15:0]   _zz_io_rhoOut_24;
  wire       [15:0]   _zz_io_rhoOut;
  wire       [15:0]   _zz_io_rhoOut_1;
  wire       [15:0]   _zz_io_rhoOut_2;
  wire       [15:0]   _zz_io_rhoOut_3;
  wire       [15:0]   _zz_io_rhoOut_4;
  wire       [15:0]   _zz_io_rhoOut_5;
  wire       [15:0]   _zz_io_rhoOut_6;
  wire       [15:0]   _zz_io_rhoOut_7;
  wire       [15:0]   _zz_io_rhoOut_8;
  wire       [15:0]   _zz_io_rhoOut_9;
  wire       [15:0]   _zz_io_rhoOut_10;
  wire       [15:0]   _zz_io_rhoOut_11;
  wire       [15:0]   _zz_io_rhoOut_12;
  wire       [15:0]   _zz_io_rhoOut_13;
  wire       [15:0]   _zz_io_rhoOut_14;
  wire       [15:0]   _zz_io_rhoOut_15;
  wire       [15:0]   _zz_io_rhoOut_16;
  wire       [15:0]   _zz_io_rhoOut_17;
  wire       [15:0]   _zz_io_rhoOut_18;
  wire       [15:0]   _zz_io_rhoOut_19;
  wire       [15:0]   _zz_io_rhoOut_20;
  wire       [15:0]   _zz_io_rhoOut_21;
  wire       [15:0]   _zz_io_rhoOut_22;
  wire       [15:0]   _zz_io_rhoOut_23;

  assign _zz_io_rhoOut_24 = io_rhoIn[399 : 384];
  always @(*) begin
    io_rhoOut[399 : 384] = _zz_io_rhoOut_24[15 : 0];
    io_rhoOut[239 : 224] = {_zz_io_rhoOut[14 : 0],_zz_io_rhoOut[15 : 15]};
    io_rhoOut[79 : 64] = {_zz_io_rhoOut_1[1 : 0],_zz_io_rhoOut_1[15 : 2]};
    io_rhoOut[319 : 304] = {_zz_io_rhoOut_2[3 : 0],_zz_io_rhoOut_2[15 : 4]};
    io_rhoOut[159 : 144] = {_zz_io_rhoOut_3[4 : 0],_zz_io_rhoOut_3[15 : 5]};
    io_rhoOut[143 : 128] = {_zz_io_rhoOut_4[11 : 0],_zz_io_rhoOut_4[15 : 12]};
    io_rhoOut[383 : 368] = {_zz_io_rhoOut_5[3 : 0],_zz_io_rhoOut_5[15 : 4]};
    io_rhoOut[223 : 208] = {_zz_io_rhoOut_6[9 : 0],_zz_io_rhoOut_6[15 : 10]};
    io_rhoOut[63 : 48] = {_zz_io_rhoOut_7[8 : 0],_zz_io_rhoOut_7[15 : 9]};
    io_rhoOut[303 : 288] = {_zz_io_rhoOut_8[11 : 0],_zz_io_rhoOut_8[15 : 12]};
    io_rhoOut[287 : 272] = {_zz_io_rhoOut_9[12 : 0],_zz_io_rhoOut_9[15 : 13]};
    io_rhoOut[127 : 112] = {_zz_io_rhoOut_10[5 : 0],_zz_io_rhoOut_10[15 : 6]};
    io_rhoOut[367 : 352] = {_zz_io_rhoOut_11[4 : 0],_zz_io_rhoOut_11[15 : 5]};
    io_rhoOut[207 : 192] = {_zz_io_rhoOut_12[6 : 0],_zz_io_rhoOut_12[15 : 7]};
    io_rhoOut[47 : 32] = {_zz_io_rhoOut_13[8 : 0],_zz_io_rhoOut_13[15 : 9]};
    io_rhoOut[31 : 16] = {_zz_io_rhoOut_14[6 : 0],_zz_io_rhoOut_14[15 : 7]};
    io_rhoOut[271 : 256] = {_zz_io_rhoOut_15[2 : 0],_zz_io_rhoOut_15[15 : 3]};
    io_rhoOut[111 : 96] = {_zz_io_rhoOut_16[0 : 0],_zz_io_rhoOut_16[15 : 1]};
    io_rhoOut[351 : 336] = {_zz_io_rhoOut_17[10 : 0],_zz_io_rhoOut_17[15 : 11]};
    io_rhoOut[191 : 176] = {_zz_io_rhoOut_18[7 : 0],_zz_io_rhoOut_18[15 : 8]};
    io_rhoOut[175 : 160] = {_zz_io_rhoOut_19[13 : 0],_zz_io_rhoOut_19[15 : 14]};
    io_rhoOut[15 : 0] = {_zz_io_rhoOut_20[13 : 0],_zz_io_rhoOut_20[15 : 14]};
    io_rhoOut[255 : 240] = {_zz_io_rhoOut_21[2 : 0],_zz_io_rhoOut_21[15 : 3]};
    io_rhoOut[95 : 80] = {_zz_io_rhoOut_22[7 : 0],_zz_io_rhoOut_22[15 : 8]};
    io_rhoOut[335 : 320] = {_zz_io_rhoOut_23[1 : 0],_zz_io_rhoOut_23[15 : 2]};
  end

  assign _zz_io_rhoOut = io_rhoIn[383 : 368];
  assign _zz_io_rhoOut_1 = io_rhoIn[367 : 352];
  assign _zz_io_rhoOut_2 = io_rhoIn[351 : 336];
  assign _zz_io_rhoOut_3 = io_rhoIn[335 : 320];
  assign _zz_io_rhoOut_4 = io_rhoIn[319 : 304];
  assign _zz_io_rhoOut_5 = io_rhoIn[303 : 288];
  assign _zz_io_rhoOut_6 = io_rhoIn[287 : 272];
  assign _zz_io_rhoOut_7 = io_rhoIn[271 : 256];
  assign _zz_io_rhoOut_8 = io_rhoIn[255 : 240];
  assign _zz_io_rhoOut_9 = io_rhoIn[239 : 224];
  assign _zz_io_rhoOut_10 = io_rhoIn[223 : 208];
  assign _zz_io_rhoOut_11 = io_rhoIn[207 : 192];
  assign _zz_io_rhoOut_12 = io_rhoIn[191 : 176];
  assign _zz_io_rhoOut_13 = io_rhoIn[175 : 160];
  assign _zz_io_rhoOut_14 = io_rhoIn[159 : 144];
  assign _zz_io_rhoOut_15 = io_rhoIn[143 : 128];
  assign _zz_io_rhoOut_16 = io_rhoIn[127 : 112];
  assign _zz_io_rhoOut_17 = io_rhoIn[111 : 96];
  assign _zz_io_rhoOut_18 = io_rhoIn[95 : 80];
  assign _zz_io_rhoOut_19 = io_rhoIn[79 : 64];
  assign _zz_io_rhoOut_20 = io_rhoIn[63 : 48];
  assign _zz_io_rhoOut_21 = io_rhoIn[47 : 32];
  assign _zz_io_rhoOut_22 = io_rhoIn[31 : 16];
  assign _zz_io_rhoOut_23 = io_rhoIn[15 : 0];

endmodule

//Theta400 replaced by Theta400

module Theta400 (
  input      [399:0]  io_thetaIn,
  output reg [399:0]  io_thetaOut
);

  wire       [79:0]   b;
  reg        [79:0]   d;
  wire       [15:0]   _zz_d;
  wire       [15:0]   _zz_d_1;
  wire       [15:0]   _zz_d_2;
  wire       [15:0]   _zz_d_3;
  wire       [15:0]   _zz_d_4;

  assign b = ((((io_thetaIn[399 : 320] ^ io_thetaIn[319 : 240]) ^ io_thetaIn[239 : 160]) ^ io_thetaIn[159 : 80]) ^ io_thetaIn[79 : 0]);
  assign _zz_d = b[79 : 64];
  always @(*) begin
    d[15 : 0] = (b[31 : 16] ^ {_zz_d[14 : 0],_zz_d[15 : 15]});
    d[31 : 16] = (b[47 : 32] ^ {_zz_d_1[14 : 0],_zz_d_1[15 : 15]});
    d[47 : 32] = (b[63 : 48] ^ {_zz_d_2[14 : 0],_zz_d_2[15 : 15]});
    d[63 : 48] = (b[79 : 64] ^ {_zz_d_3[14 : 0],_zz_d_3[15 : 15]});
    d[79 : 64] = (b[15 : 0] ^ {_zz_d_4[14 : 0],_zz_d_4[15 : 15]});
  end

  assign _zz_d_1 = b[15 : 0];
  assign _zz_d_2 = b[31 : 16];
  assign _zz_d_3 = b[47 : 32];
  assign _zz_d_4 = b[63 : 48];
  always @(*) begin
    io_thetaOut[399 : 384] = (io_thetaIn[399 : 384] ^ d[79 : 64]);
    io_thetaOut[383 : 368] = (io_thetaIn[383 : 368] ^ d[63 : 48]);
    io_thetaOut[367 : 352] = (io_thetaIn[367 : 352] ^ d[47 : 32]);
    io_thetaOut[351 : 336] = (io_thetaIn[351 : 336] ^ d[31 : 16]);
    io_thetaOut[335 : 320] = (io_thetaIn[335 : 320] ^ d[15 : 0]);
    io_thetaOut[319 : 304] = (io_thetaIn[319 : 304] ^ d[79 : 64]);
    io_thetaOut[303 : 288] = (io_thetaIn[303 : 288] ^ d[63 : 48]);
    io_thetaOut[287 : 272] = (io_thetaIn[287 : 272] ^ d[47 : 32]);
    io_thetaOut[271 : 256] = (io_thetaIn[271 : 256] ^ d[31 : 16]);
    io_thetaOut[255 : 240] = (io_thetaIn[255 : 240] ^ d[15 : 0]);
    io_thetaOut[239 : 224] = (io_thetaIn[239 : 224] ^ d[79 : 64]);
    io_thetaOut[223 : 208] = (io_thetaIn[223 : 208] ^ d[63 : 48]);
    io_thetaOut[207 : 192] = (io_thetaIn[207 : 192] ^ d[47 : 32]);
    io_thetaOut[191 : 176] = (io_thetaIn[191 : 176] ^ d[31 : 16]);
    io_thetaOut[175 : 160] = (io_thetaIn[175 : 160] ^ d[15 : 0]);
    io_thetaOut[159 : 144] = (io_thetaIn[159 : 144] ^ d[79 : 64]);
    io_thetaOut[143 : 128] = (io_thetaIn[143 : 128] ^ d[63 : 48]);
    io_thetaOut[127 : 112] = (io_thetaIn[127 : 112] ^ d[47 : 32]);
    io_thetaOut[111 : 96] = (io_thetaIn[111 : 96] ^ d[31 : 16]);
    io_thetaOut[95 : 80] = (io_thetaIn[95 : 80] ^ d[15 : 0]);
    io_thetaOut[79 : 64] = (io_thetaIn[79 : 64] ^ d[79 : 64]);
    io_thetaOut[63 : 48] = (io_thetaIn[63 : 48] ^ d[63 : 48]);
    io_thetaOut[47 : 32] = (io_thetaIn[47 : 32] ^ d[47 : 32]);
    io_thetaOut[31 : 16] = (io_thetaIn[31 : 16] ^ d[31 : 16]);
    io_thetaOut[15 : 0] = (io_thetaIn[15 : 0] ^ d[15 : 0]);
  end


endmodule

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

//SBoxMasked16 replaced by SBoxMasked16

module SBoxMasked16 (
  input      [15:0]   io_c1,
  input      [15:0]   io_c2,
  input      [15:0]   io_a1,
  input      [15:0]   io_a2,
  input      [15:0]   io_b1,
  input      [15:0]   io_b2,
  output     [15:0]   io_res1,
  output     [15:0]   io_res2,
  input               io_clk,
  input               io_reset
);

  reg        [15:0]   a1b1;
  reg        [15:0]   a1b2;
  reg        [15:0]   a2b1;
  reg        [15:0]   a2b2;

  assign io_res1 = (a1b1 ^ a1b2);
  assign io_res2 = (a2b1 ^ a2b2);
  always @(posedge io_clk) begin
    a1b1 <= ((~ io_a1) & io_b1);
    a1b2 <= ((io_a1 & io_b2) ^ io_c1);
    a2b1 <= ((io_a2 & io_b1) ^ io_c2);
    a2b2 <= ((~ io_a2) & io_b2);
  end


endmodule
