// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : presentEncryptMasked
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module presentEncryptMasked (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [63:0]   io_plaintext1,
  input      [63:0]   io_plaintext2,
  input      [63:0]   io_plaintext3,
  input      [79:0]   io_key1,
  input      [79:0]   io_key2,
  input      [79:0]   io_key3,
  output     [63:0]   io_ciphertext1,
  output     [63:0]   io_ciphertext2,
  output     [63:0]   io_ciphertext3,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sExecute = 2'd1;
  localparam States_sDone = 2'd2;

  wire       [4:0]    r_updatekeyshared_io_round;
  wire       [63:0]   r_addroundkey1_io_stateOut;
  wire       [63:0]   r_addroundkey2_io_stateOut;
  wire       [63:0]   r_addroundkey3_io_stateOut;
  wire       [79:0]   r_updatekeyshared_io_keyOut1;
  wire       [79:0]   r_updatekeyshared_io_keyOut2;
  wire       [79:0]   r_updatekeyshared_io_keyOut3;
  wire       [63:0]   r_sboxlayershared_io_stateOut1;
  wire       [63:0]   r_sboxlayershared_io_stateOut2;
  wire       [63:0]   r_sboxlayershared_io_stateOut3;
  wire       [63:0]   r_permutation1_io_stateOut;
  wire       [63:0]   r_permutation2_io_stateOut;
  wire       [63:0]   r_permutation3_io_stateOut;
  wire       [4:0]    _zz_r_ctr_valueNext;
  wire       [0:0]    _zz_r_ctr_valueNext_1;
  reg        [63:0]   r_state1;
  reg        [63:0]   r_state2;
  reg        [63:0]   r_state3;
  reg        [79:0]   r_keyReg1;
  reg        [79:0]   r_keyReg2;
  reg        [79:0]   r_keyReg3;
  wire       [63:0]   r_roundKey1;
  wire       [63:0]   r_roundKey2;
  wire       [63:0]   r_roundKey3;
  reg                 r_ctr_willIncrement;
  reg                 r_ctr_willClear;
  reg        [4:0]    r_ctr_valueNext;
  reg        [4:0]    r_ctr_value;
  wire                r_ctr_willOverflowIfInc;
  wire                r_ctr_willOverflow;
  reg                 r_smallCtr_willIncrement;
  reg                 r_smallCtr_willClear;
  reg        [0:0]    r_smallCtr_valueNext;
  reg        [0:0]    r_smallCtr_value;
  wire                r_smallCtr_willOverflowIfInc;
  wire                r_smallCtr_willOverflow;
  reg        [1:0]    r_presentState;
  `ifndef SYNTHESIS
  reg [63:0] r_presentState_string;
  `endif


  assign _zz_r_ctr_valueNext_1 = r_ctr_willIncrement;
  assign _zz_r_ctr_valueNext = {4'd0, _zz_r_ctr_valueNext_1};
  addRoundKey r_addroundkey1 (
    .io_stateIn     (r_state1[63:0]                    ), //i
    .io_key         (r_roundKey1[63:0]                 ), //i
    .io_stateOut    (r_addroundkey1_io_stateOut[63:0]  )  //o
  );
  addRoundKey r_addroundkey2 (
    .io_stateIn     (r_state2[63:0]                    ), //i
    .io_key         (r_roundKey2[63:0]                 ), //i
    .io_stateOut    (r_addroundkey2_io_stateOut[63:0]  )  //o
  );
  addRoundKey r_addroundkey3 (
    .io_stateIn     (r_state3[63:0]                    ), //i
    .io_key         (r_roundKey3[63:0]                 ), //i
    .io_stateOut    (r_addroundkey3_io_stateOut[63:0]  )  //o
  );
  updateKeyShared r_updatekeyshared (
    .io_keyIn1     (r_keyReg1[79:0]                     ), //i
    .io_keyIn2     (r_keyReg2[79:0]                     ), //i
    .io_keyIn3     (r_keyReg3[79:0]                     ), //i
    .io_round      (r_updatekeyshared_io_round[4:0]     ), //i
    .io_keyOut1    (r_updatekeyshared_io_keyOut1[79:0]  ), //o
    .io_keyOut2    (r_updatekeyshared_io_keyOut2[79:0]  ), //o
    .io_keyOut3    (r_updatekeyshared_io_keyOut3[79:0]  ), //o
    .io_clk        (io_clk                              ), //i
    .io_reset      (io_reset                            )  //i
  );
  sboxLayerShared r_sboxlayershared (
    .io_stateIn1     (r_addroundkey1_io_stateOut[63:0]      ), //i
    .io_stateIn2     (r_addroundkey2_io_stateOut[63:0]      ), //i
    .io_stateIn3     (r_addroundkey3_io_stateOut[63:0]      ), //i
    .io_stateOut1    (r_sboxlayershared_io_stateOut1[63:0]  ), //o
    .io_stateOut2    (r_sboxlayershared_io_stateOut2[63:0]  ), //o
    .io_stateOut3    (r_sboxlayershared_io_stateOut3[63:0]  ), //o
    .io_clk          (io_clk                                ), //i
    .io_reset        (io_reset                              )  //i
  );
  permutation r_permutation1 (
    .io_stateIn     (r_sboxlayershared_io_stateOut1[63:0]  ), //i
    .io_stateOut    (r_permutation1_io_stateOut[63:0]      )  //o
  );
  permutation r_permutation2 (
    .io_stateIn     (r_sboxlayershared_io_stateOut2[63:0]  ), //i
    .io_stateOut    (r_permutation2_io_stateOut[63:0]      )  //o
  );
  permutation r_permutation3 (
    .io_stateIn     (r_sboxlayershared_io_stateOut3[63:0]  ), //i
    .io_stateOut    (r_permutation3_io_stateOut[63:0]      )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_presentState)
      States_sIdle : r_presentState_string = "sIdle   ";
      States_sExecute : r_presentState_string = "sExecute";
      States_sDone : r_presentState_string = "sDone   ";
      default : r_presentState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(r_presentState)
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
    r_ctr_willIncrement = 1'b0;
    case(r_presentState)
      States_sIdle : begin
      end
      States_sExecute : begin
        if(r_smallCtr_willOverflow) begin
          r_ctr_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_ctr_willClear = 1'b0;
    case(r_presentState)
      States_sIdle : begin
        r_ctr_willClear = 1'b1;
      end
      States_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign r_ctr_willOverflowIfInc = (r_ctr_value == 5'h1f);
  assign r_ctr_willOverflow = (r_ctr_willOverflowIfInc && r_ctr_willIncrement);
  always @(*) begin
    if(r_ctr_willOverflow) begin
      r_ctr_valueNext = 5'h01;
    end else begin
      r_ctr_valueNext = (r_ctr_value + _zz_r_ctr_valueNext);
    end
    if(r_ctr_willClear) begin
      r_ctr_valueNext = 5'h01;
    end
  end

  always @(*) begin
    r_smallCtr_willIncrement = 1'b0;
    case(r_presentState)
      States_sIdle : begin
      end
      States_sExecute : begin
        r_smallCtr_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_smallCtr_willClear = 1'b0;
    case(r_presentState)
      States_sIdle : begin
        r_smallCtr_willClear = 1'b1;
      end
      States_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign r_smallCtr_willOverflowIfInc = (r_smallCtr_value == 1'b1);
  assign r_smallCtr_willOverflow = (r_smallCtr_willOverflowIfInc && r_smallCtr_willIncrement);
  always @(*) begin
    r_smallCtr_valueNext = (r_smallCtr_value + r_smallCtr_willIncrement);
    if(r_smallCtr_willClear) begin
      r_smallCtr_valueNext = 1'b0;
    end
  end

  assign r_roundKey1 = r_keyReg1[79 : 16];
  assign r_roundKey2 = r_keyReg2[79 : 16];
  assign r_roundKey3 = r_keyReg3[79 : 16];
  assign r_updatekeyshared_io_round = r_ctr_value;
  assign io_ciphertext1 = r_addroundkey1_io_stateOut;
  assign io_ciphertext2 = r_addroundkey2_io_stateOut;
  assign io_ciphertext3 = r_addroundkey3_io_stateOut;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_state1 <= 64'h0;
      r_state2 <= 64'h0;
      r_state3 <= 64'h0;
      r_keyReg1 <= 80'h0;
      r_keyReg2 <= 80'h0;
      r_keyReg3 <= 80'h0;
      r_ctr_value <= 5'h01;
      r_smallCtr_value <= 1'b0;
      r_presentState <= States_sIdle;
    end else begin
      r_ctr_value <= r_ctr_valueNext;
      r_smallCtr_value <= r_smallCtr_valueNext;
      r_keyReg1 <= r_updatekeyshared_io_keyOut1;
      r_keyReg2 <= r_updatekeyshared_io_keyOut2;
      r_keyReg3 <= r_updatekeyshared_io_keyOut3;
      r_state1 <= r_permutation1_io_stateOut;
      r_state2 <= r_permutation2_io_stateOut;
      r_state3 <= r_permutation3_io_stateOut;
      case(r_presentState)
        States_sIdle : begin
          r_presentState <= States_sIdle;
          if(io_enable) begin
            r_presentState <= States_sExecute;
            r_state1 <= io_plaintext1;
            r_state2 <= io_plaintext2;
            r_state3 <= io_plaintext3;
            r_keyReg1 <= io_key1;
            r_keyReg2 <= io_key2;
            r_keyReg3 <= io_key3;
          end
        end
        States_sExecute : begin
          r_presentState <= States_sExecute;
          if(r_ctr_willOverflow) begin
            r_presentState <= States_sDone;
          end
        end
        default : begin
          r_presentState <= States_sDone;
        end
      endcase
    end
  end


endmodule

//permutation replaced by permutation

//permutation replaced by permutation

module permutation (
  input      [63:0]   io_stateIn,
  output reg [63:0]   io_stateOut
);


  always @(*) begin
    io_stateOut[0] = io_stateIn[0];
    io_stateOut[16] = io_stateIn[1];
    io_stateOut[32] = io_stateIn[2];
    io_stateOut[48] = io_stateIn[3];
    io_stateOut[1] = io_stateIn[4];
    io_stateOut[17] = io_stateIn[5];
    io_stateOut[33] = io_stateIn[6];
    io_stateOut[49] = io_stateIn[7];
    io_stateOut[2] = io_stateIn[8];
    io_stateOut[18] = io_stateIn[9];
    io_stateOut[34] = io_stateIn[10];
    io_stateOut[50] = io_stateIn[11];
    io_stateOut[3] = io_stateIn[12];
    io_stateOut[19] = io_stateIn[13];
    io_stateOut[35] = io_stateIn[14];
    io_stateOut[51] = io_stateIn[15];
    io_stateOut[4] = io_stateIn[16];
    io_stateOut[20] = io_stateIn[17];
    io_stateOut[36] = io_stateIn[18];
    io_stateOut[52] = io_stateIn[19];
    io_stateOut[5] = io_stateIn[20];
    io_stateOut[21] = io_stateIn[21];
    io_stateOut[37] = io_stateIn[22];
    io_stateOut[53] = io_stateIn[23];
    io_stateOut[6] = io_stateIn[24];
    io_stateOut[22] = io_stateIn[25];
    io_stateOut[38] = io_stateIn[26];
    io_stateOut[54] = io_stateIn[27];
    io_stateOut[7] = io_stateIn[28];
    io_stateOut[23] = io_stateIn[29];
    io_stateOut[39] = io_stateIn[30];
    io_stateOut[55] = io_stateIn[31];
    io_stateOut[8] = io_stateIn[32];
    io_stateOut[24] = io_stateIn[33];
    io_stateOut[40] = io_stateIn[34];
    io_stateOut[56] = io_stateIn[35];
    io_stateOut[9] = io_stateIn[36];
    io_stateOut[25] = io_stateIn[37];
    io_stateOut[41] = io_stateIn[38];
    io_stateOut[57] = io_stateIn[39];
    io_stateOut[10] = io_stateIn[40];
    io_stateOut[26] = io_stateIn[41];
    io_stateOut[42] = io_stateIn[42];
    io_stateOut[58] = io_stateIn[43];
    io_stateOut[11] = io_stateIn[44];
    io_stateOut[27] = io_stateIn[45];
    io_stateOut[43] = io_stateIn[46];
    io_stateOut[59] = io_stateIn[47];
    io_stateOut[12] = io_stateIn[48];
    io_stateOut[28] = io_stateIn[49];
    io_stateOut[44] = io_stateIn[50];
    io_stateOut[60] = io_stateIn[51];
    io_stateOut[13] = io_stateIn[52];
    io_stateOut[29] = io_stateIn[53];
    io_stateOut[45] = io_stateIn[54];
    io_stateOut[61] = io_stateIn[55];
    io_stateOut[14] = io_stateIn[56];
    io_stateOut[30] = io_stateIn[57];
    io_stateOut[46] = io_stateIn[58];
    io_stateOut[62] = io_stateIn[59];
    io_stateOut[15] = io_stateIn[60];
    io_stateOut[31] = io_stateIn[61];
    io_stateOut[47] = io_stateIn[62];
    io_stateOut[63] = io_stateIn[63];
  end


endmodule

module sboxLayerShared (
  input      [63:0]   io_stateIn1,
  input      [63:0]   io_stateIn2,
  input      [63:0]   io_stateIn3,
  output reg [63:0]   io_stateOut1,
  output reg [63:0]   io_stateOut2,
  output reg [63:0]   io_stateOut3,
  input               io_clk,
  input               io_reset
);

  wire       [3:0]    maskedSBox_17_io_in1;
  wire       [3:0]    maskedSBox_17_io_in2;
  wire       [3:0]    maskedSBox_17_io_in3;
  wire       [3:0]    maskedSBox_18_io_in1;
  wire       [3:0]    maskedSBox_18_io_in2;
  wire       [3:0]    maskedSBox_18_io_in3;
  wire       [3:0]    maskedSBox_19_io_in1;
  wire       [3:0]    maskedSBox_19_io_in2;
  wire       [3:0]    maskedSBox_19_io_in3;
  wire       [3:0]    maskedSBox_20_io_in1;
  wire       [3:0]    maskedSBox_20_io_in2;
  wire       [3:0]    maskedSBox_20_io_in3;
  wire       [3:0]    maskedSBox_21_io_in1;
  wire       [3:0]    maskedSBox_21_io_in2;
  wire       [3:0]    maskedSBox_21_io_in3;
  wire       [3:0]    maskedSBox_22_io_in1;
  wire       [3:0]    maskedSBox_22_io_in2;
  wire       [3:0]    maskedSBox_22_io_in3;
  wire       [3:0]    maskedSBox_23_io_in1;
  wire       [3:0]    maskedSBox_23_io_in2;
  wire       [3:0]    maskedSBox_23_io_in3;
  wire       [3:0]    maskedSBox_24_io_in1;
  wire       [3:0]    maskedSBox_24_io_in2;
  wire       [3:0]    maskedSBox_24_io_in3;
  wire       [3:0]    maskedSBox_25_io_in1;
  wire       [3:0]    maskedSBox_25_io_in2;
  wire       [3:0]    maskedSBox_25_io_in3;
  wire       [3:0]    maskedSBox_26_io_in1;
  wire       [3:0]    maskedSBox_26_io_in2;
  wire       [3:0]    maskedSBox_26_io_in3;
  wire       [3:0]    maskedSBox_27_io_in1;
  wire       [3:0]    maskedSBox_27_io_in2;
  wire       [3:0]    maskedSBox_27_io_in3;
  wire       [3:0]    maskedSBox_28_io_in1;
  wire       [3:0]    maskedSBox_28_io_in2;
  wire       [3:0]    maskedSBox_28_io_in3;
  wire       [3:0]    maskedSBox_29_io_in1;
  wire       [3:0]    maskedSBox_29_io_in2;
  wire       [3:0]    maskedSBox_29_io_in3;
  wire       [3:0]    maskedSBox_30_io_in1;
  wire       [3:0]    maskedSBox_30_io_in2;
  wire       [3:0]    maskedSBox_30_io_in3;
  wire       [3:0]    maskedSBox_31_io_in1;
  wire       [3:0]    maskedSBox_31_io_in2;
  wire       [3:0]    maskedSBox_31_io_in3;
  wire       [3:0]    maskedSBox_32_io_in1;
  wire       [3:0]    maskedSBox_32_io_in2;
  wire       [3:0]    maskedSBox_32_io_in3;
  wire       [3:0]    maskedSBox_17_io_out1;
  wire       [3:0]    maskedSBox_17_io_out2;
  wire       [3:0]    maskedSBox_17_io_out3;
  wire       [3:0]    maskedSBox_18_io_out1;
  wire       [3:0]    maskedSBox_18_io_out2;
  wire       [3:0]    maskedSBox_18_io_out3;
  wire       [3:0]    maskedSBox_19_io_out1;
  wire       [3:0]    maskedSBox_19_io_out2;
  wire       [3:0]    maskedSBox_19_io_out3;
  wire       [3:0]    maskedSBox_20_io_out1;
  wire       [3:0]    maskedSBox_20_io_out2;
  wire       [3:0]    maskedSBox_20_io_out3;
  wire       [3:0]    maskedSBox_21_io_out1;
  wire       [3:0]    maskedSBox_21_io_out2;
  wire       [3:0]    maskedSBox_21_io_out3;
  wire       [3:0]    maskedSBox_22_io_out1;
  wire       [3:0]    maskedSBox_22_io_out2;
  wire       [3:0]    maskedSBox_22_io_out3;
  wire       [3:0]    maskedSBox_23_io_out1;
  wire       [3:0]    maskedSBox_23_io_out2;
  wire       [3:0]    maskedSBox_23_io_out3;
  wire       [3:0]    maskedSBox_24_io_out1;
  wire       [3:0]    maskedSBox_24_io_out2;
  wire       [3:0]    maskedSBox_24_io_out3;
  wire       [3:0]    maskedSBox_25_io_out1;
  wire       [3:0]    maskedSBox_25_io_out2;
  wire       [3:0]    maskedSBox_25_io_out3;
  wire       [3:0]    maskedSBox_26_io_out1;
  wire       [3:0]    maskedSBox_26_io_out2;
  wire       [3:0]    maskedSBox_26_io_out3;
  wire       [3:0]    maskedSBox_27_io_out1;
  wire       [3:0]    maskedSBox_27_io_out2;
  wire       [3:0]    maskedSBox_27_io_out3;
  wire       [3:0]    maskedSBox_28_io_out1;
  wire       [3:0]    maskedSBox_28_io_out2;
  wire       [3:0]    maskedSBox_28_io_out3;
  wire       [3:0]    maskedSBox_29_io_out1;
  wire       [3:0]    maskedSBox_29_io_out2;
  wire       [3:0]    maskedSBox_29_io_out3;
  wire       [3:0]    maskedSBox_30_io_out1;
  wire       [3:0]    maskedSBox_30_io_out2;
  wire       [3:0]    maskedSBox_30_io_out3;
  wire       [3:0]    maskedSBox_31_io_out1;
  wire       [3:0]    maskedSBox_31_io_out2;
  wire       [3:0]    maskedSBox_31_io_out3;
  wire       [3:0]    maskedSBox_32_io_out1;
  wire       [3:0]    maskedSBox_32_io_out2;
  wire       [3:0]    maskedSBox_32_io_out3;

  MaskedSBox maskedSBox_17 (
    .io_in1      (maskedSBox_17_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_17_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_17_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_17_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_17_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_17_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_18 (
    .io_in1      (maskedSBox_18_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_18_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_18_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_18_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_18_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_18_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_19 (
    .io_in1      (maskedSBox_19_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_19_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_19_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_19_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_19_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_19_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_20 (
    .io_in1      (maskedSBox_20_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_20_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_20_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_20_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_20_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_20_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_21 (
    .io_in1      (maskedSBox_21_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_21_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_21_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_21_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_21_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_21_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_22 (
    .io_in1      (maskedSBox_22_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_22_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_22_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_22_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_22_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_22_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_23 (
    .io_in1      (maskedSBox_23_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_23_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_23_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_23_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_23_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_23_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_24 (
    .io_in1      (maskedSBox_24_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_24_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_24_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_24_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_24_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_24_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_25 (
    .io_in1      (maskedSBox_25_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_25_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_25_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_25_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_25_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_25_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_26 (
    .io_in1      (maskedSBox_26_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_26_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_26_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_26_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_26_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_26_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_27 (
    .io_in1      (maskedSBox_27_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_27_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_27_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_27_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_27_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_27_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_28 (
    .io_in1      (maskedSBox_28_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_28_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_28_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_28_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_28_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_28_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_29 (
    .io_in1      (maskedSBox_29_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_29_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_29_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_29_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_29_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_29_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_30 (
    .io_in1      (maskedSBox_30_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_30_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_30_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_30_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_30_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_30_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_31 (
    .io_in1      (maskedSBox_31_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_31_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_31_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_31_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_31_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_31_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  MaskedSBox maskedSBox_32 (
    .io_in1      (maskedSBox_32_io_in1[3:0]   ), //i
    .io_in2      (maskedSBox_32_io_in2[3:0]   ), //i
    .io_in3      (maskedSBox_32_io_in3[3:0]   ), //i
    .io_out1     (maskedSBox_32_io_out1[3:0]  ), //o
    .io_out2     (maskedSBox_32_io_out2[3:0]  ), //o
    .io_out3     (maskedSBox_32_io_out3[3:0]  ), //o
    .io_clk      (io_clk                      ), //i
    .io_reset    (io_reset                    )  //i
  );
  assign maskedSBox_17_io_in1 = io_stateIn1[3 : 0];
  assign maskedSBox_17_io_in2 = io_stateIn2[3 : 0];
  assign maskedSBox_17_io_in3 = io_stateIn3[3 : 0];
  always @(*) begin
    io_stateOut1[3 : 0] = maskedSBox_17_io_out1;
    io_stateOut1[7 : 4] = maskedSBox_18_io_out1;
    io_stateOut1[11 : 8] = maskedSBox_19_io_out1;
    io_stateOut1[15 : 12] = maskedSBox_20_io_out1;
    io_stateOut1[19 : 16] = maskedSBox_21_io_out1;
    io_stateOut1[23 : 20] = maskedSBox_22_io_out1;
    io_stateOut1[27 : 24] = maskedSBox_23_io_out1;
    io_stateOut1[31 : 28] = maskedSBox_24_io_out1;
    io_stateOut1[35 : 32] = maskedSBox_25_io_out1;
    io_stateOut1[39 : 36] = maskedSBox_26_io_out1;
    io_stateOut1[43 : 40] = maskedSBox_27_io_out1;
    io_stateOut1[47 : 44] = maskedSBox_28_io_out1;
    io_stateOut1[51 : 48] = maskedSBox_29_io_out1;
    io_stateOut1[55 : 52] = maskedSBox_30_io_out1;
    io_stateOut1[59 : 56] = maskedSBox_31_io_out1;
    io_stateOut1[63 : 60] = maskedSBox_32_io_out1;
  end

  always @(*) begin
    io_stateOut2[3 : 0] = maskedSBox_17_io_out2;
    io_stateOut2[7 : 4] = maskedSBox_18_io_out2;
    io_stateOut2[11 : 8] = maskedSBox_19_io_out2;
    io_stateOut2[15 : 12] = maskedSBox_20_io_out2;
    io_stateOut2[19 : 16] = maskedSBox_21_io_out2;
    io_stateOut2[23 : 20] = maskedSBox_22_io_out2;
    io_stateOut2[27 : 24] = maskedSBox_23_io_out2;
    io_stateOut2[31 : 28] = maskedSBox_24_io_out2;
    io_stateOut2[35 : 32] = maskedSBox_25_io_out2;
    io_stateOut2[39 : 36] = maskedSBox_26_io_out2;
    io_stateOut2[43 : 40] = maskedSBox_27_io_out2;
    io_stateOut2[47 : 44] = maskedSBox_28_io_out2;
    io_stateOut2[51 : 48] = maskedSBox_29_io_out2;
    io_stateOut2[55 : 52] = maskedSBox_30_io_out2;
    io_stateOut2[59 : 56] = maskedSBox_31_io_out2;
    io_stateOut2[63 : 60] = maskedSBox_32_io_out2;
  end

  always @(*) begin
    io_stateOut3[3 : 0] = maskedSBox_17_io_out3;
    io_stateOut3[7 : 4] = maskedSBox_18_io_out3;
    io_stateOut3[11 : 8] = maskedSBox_19_io_out3;
    io_stateOut3[15 : 12] = maskedSBox_20_io_out3;
    io_stateOut3[19 : 16] = maskedSBox_21_io_out3;
    io_stateOut3[23 : 20] = maskedSBox_22_io_out3;
    io_stateOut3[27 : 24] = maskedSBox_23_io_out3;
    io_stateOut3[31 : 28] = maskedSBox_24_io_out3;
    io_stateOut3[35 : 32] = maskedSBox_25_io_out3;
    io_stateOut3[39 : 36] = maskedSBox_26_io_out3;
    io_stateOut3[43 : 40] = maskedSBox_27_io_out3;
    io_stateOut3[47 : 44] = maskedSBox_28_io_out3;
    io_stateOut3[51 : 48] = maskedSBox_29_io_out3;
    io_stateOut3[55 : 52] = maskedSBox_30_io_out3;
    io_stateOut3[59 : 56] = maskedSBox_31_io_out3;
    io_stateOut3[63 : 60] = maskedSBox_32_io_out3;
  end

  assign maskedSBox_18_io_in1 = io_stateIn1[7 : 4];
  assign maskedSBox_18_io_in2 = io_stateIn2[7 : 4];
  assign maskedSBox_18_io_in3 = io_stateIn3[7 : 4];
  assign maskedSBox_19_io_in1 = io_stateIn1[11 : 8];
  assign maskedSBox_19_io_in2 = io_stateIn2[11 : 8];
  assign maskedSBox_19_io_in3 = io_stateIn3[11 : 8];
  assign maskedSBox_20_io_in1 = io_stateIn1[15 : 12];
  assign maskedSBox_20_io_in2 = io_stateIn2[15 : 12];
  assign maskedSBox_20_io_in3 = io_stateIn3[15 : 12];
  assign maskedSBox_21_io_in1 = io_stateIn1[19 : 16];
  assign maskedSBox_21_io_in2 = io_stateIn2[19 : 16];
  assign maskedSBox_21_io_in3 = io_stateIn3[19 : 16];
  assign maskedSBox_22_io_in1 = io_stateIn1[23 : 20];
  assign maskedSBox_22_io_in2 = io_stateIn2[23 : 20];
  assign maskedSBox_22_io_in3 = io_stateIn3[23 : 20];
  assign maskedSBox_23_io_in1 = io_stateIn1[27 : 24];
  assign maskedSBox_23_io_in2 = io_stateIn2[27 : 24];
  assign maskedSBox_23_io_in3 = io_stateIn3[27 : 24];
  assign maskedSBox_24_io_in1 = io_stateIn1[31 : 28];
  assign maskedSBox_24_io_in2 = io_stateIn2[31 : 28];
  assign maskedSBox_24_io_in3 = io_stateIn3[31 : 28];
  assign maskedSBox_25_io_in1 = io_stateIn1[35 : 32];
  assign maskedSBox_25_io_in2 = io_stateIn2[35 : 32];
  assign maskedSBox_25_io_in3 = io_stateIn3[35 : 32];
  assign maskedSBox_26_io_in1 = io_stateIn1[39 : 36];
  assign maskedSBox_26_io_in2 = io_stateIn2[39 : 36];
  assign maskedSBox_26_io_in3 = io_stateIn3[39 : 36];
  assign maskedSBox_27_io_in1 = io_stateIn1[43 : 40];
  assign maskedSBox_27_io_in2 = io_stateIn2[43 : 40];
  assign maskedSBox_27_io_in3 = io_stateIn3[43 : 40];
  assign maskedSBox_28_io_in1 = io_stateIn1[47 : 44];
  assign maskedSBox_28_io_in2 = io_stateIn2[47 : 44];
  assign maskedSBox_28_io_in3 = io_stateIn3[47 : 44];
  assign maskedSBox_29_io_in1 = io_stateIn1[51 : 48];
  assign maskedSBox_29_io_in2 = io_stateIn2[51 : 48];
  assign maskedSBox_29_io_in3 = io_stateIn3[51 : 48];
  assign maskedSBox_30_io_in1 = io_stateIn1[55 : 52];
  assign maskedSBox_30_io_in2 = io_stateIn2[55 : 52];
  assign maskedSBox_30_io_in3 = io_stateIn3[55 : 52];
  assign maskedSBox_31_io_in1 = io_stateIn1[59 : 56];
  assign maskedSBox_31_io_in2 = io_stateIn2[59 : 56];
  assign maskedSBox_31_io_in3 = io_stateIn3[59 : 56];
  assign maskedSBox_32_io_in1 = io_stateIn1[63 : 60];
  assign maskedSBox_32_io_in2 = io_stateIn2[63 : 60];
  assign maskedSBox_32_io_in3 = io_stateIn3[63 : 60];

endmodule

module updateKeyShared (
  input      [79:0]   io_keyIn1,
  input      [79:0]   io_keyIn2,
  input      [79:0]   io_keyIn3,
  input      [4:0]    io_round,
  output     [79:0]   io_keyOut1,
  output     [79:0]   io_keyOut2,
  output     [79:0]   io_keyOut3,
  input               io_clk,
  input               io_reset
);

  wire       [3:0]    sbox_io_in1;
  wire       [3:0]    sbox_io_in2;
  wire       [3:0]    sbox_io_in3;
  wire       [3:0]    sbox_io_out1;
  wire       [3:0]    sbox_io_out2;
  wire       [3:0]    sbox_io_out3;
  wire       [79:0]   k11;
  wire       [79:0]   k12;
  wire       [79:0]   k13;
  wire       [79:0]   k21;
  wire       [79:0]   k22;
  wire       [79:0]   k23;
  wire       [79:0]   k31;
  wire       [79:0]   k32;
  wire       [79:0]   k33;
  reg        [79:0]   k11Reg;
  reg        [79:0]   k12Reg;
  reg        [79:0]   k13Reg;

  MaskedSBox sbox (
    .io_in1      (sbox_io_in1[3:0]   ), //i
    .io_in2      (sbox_io_in2[3:0]   ), //i
    .io_in3      (sbox_io_in3[3:0]   ), //i
    .io_out1     (sbox_io_out1[3:0]  ), //o
    .io_out2     (sbox_io_out2[3:0]  ), //o
    .io_out3     (sbox_io_out3[3:0]  ), //o
    .io_clk      (io_clk             ), //i
    .io_reset    (io_reset           )  //i
  );
  assign sbox_io_in1 = k11[79 : 76];
  assign sbox_io_in2 = k12[79 : 76];
  assign sbox_io_in3 = k13[79 : 76];
  assign k11 = {io_keyIn1[18 : 0],io_keyIn1[79 : 19]};
  assign k12 = {io_keyIn2[18 : 0],io_keyIn2[79 : 19]};
  assign k13 = {io_keyIn3[18 : 0],io_keyIn3[79 : 19]};
  assign k21 = {sbox_io_out1,k11Reg[75 : 0]};
  assign k22 = {sbox_io_out2,k12Reg[75 : 0]};
  assign k23 = {sbox_io_out3,k13Reg[75 : 0]};
  assign k31 = {{k21[79 : 20],(k21[19 : 15] ^ io_round)},k21[14 : 0]};
  assign k32 = {{k22[79 : 20],(k22[19 : 15] ^ io_round)},k22[14 : 0]};
  assign k33 = {{k23[79 : 20],(k23[19 : 15] ^ io_round)},k23[14 : 0]};
  assign io_keyOut1 = k31;
  assign io_keyOut2 = k32;
  assign io_keyOut3 = k33;
  always @(posedge io_clk) begin
    k11Reg <= k11;
    k12Reg <= k12;
    k13Reg <= k13;
  end


endmodule

//addRoundKey replaced by addRoundKey

//addRoundKey replaced by addRoundKey

module addRoundKey (
  input      [63:0]   io_stateIn,
  input      [63:0]   io_key,
  output     [63:0]   io_stateOut
);


  assign io_stateOut = (io_stateIn ^ io_key);

endmodule

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

//MaskedSBox replaced by MaskedSBox

module MaskedSBox (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output     [3:0]    io_out1,
  output     [3:0]    io_out2,
  output     [3:0]    io_out3,
  input               io_clk,
  input               io_reset
);

  wire       [3:0]    g1_17_io_Y;
  wire       [3:0]    g2_17_io_Y;
  wire       [3:0]    g3_17_io_Y;
  wire       [3:0]    f1_17_io_Y;
  wire       [3:0]    f2_17_io_Y;
  wire       [3:0]    f3_17_io_Y;
  reg        [3:0]    GOut1;
  reg        [3:0]    GOut2;
  reg        [3:0]    GOut3;

  G1 g1_17 (
    .io_X2    (io_in2[3:0]      ), //i
    .io_X3    (io_in3[3:0]      ), //i
    .io_Y     (g1_17_io_Y[3:0]  )  //o
  );
  G2 g2_17 (
    .io_X1    (io_in1[3:0]      ), //i
    .io_X3    (io_in3[3:0]      ), //i
    .io_Y     (g2_17_io_Y[3:0]  )  //o
  );
  G3 g3_17 (
    .io_X1    (io_in1[3:0]      ), //i
    .io_X2    (io_in2[3:0]      ), //i
    .io_Y     (g3_17_io_Y[3:0]  )  //o
  );
  F1 f1_17 (
    .io_R2    (GOut2[3:0]       ), //i
    .io_R3    (GOut3[3:0]       ), //i
    .io_Y     (f1_17_io_Y[3:0]  )  //o
  );
  F2 f2_17 (
    .io_R1    (GOut1[3:0]       ), //i
    .io_R3    (GOut3[3:0]       ), //i
    .io_Y     (f2_17_io_Y[3:0]  )  //o
  );
  F3 f3_17 (
    .io_R1    (GOut1[3:0]       ), //i
    .io_R2    (GOut2[3:0]       ), //i
    .io_Y     (f3_17_io_Y[3:0]  )  //o
  );
  assign io_out1 = f1_17_io_Y;
  assign io_out2 = f2_17_io_Y;
  assign io_out3 = f3_17_io_Y;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      GOut1 <= 4'b0000;
      GOut2 <= 4'b0000;
      GOut3 <= 4'b0000;
    end else begin
      GOut1 <= g1_17_io_Y;
      GOut2 <= g2_17_io_Y;
      GOut3 <= g3_17_io_Y;
    end
  end


endmodule

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

//F3 replaced by F3

//F2 replaced by F2

//F1 replaced by F1

//G3 replaced by G3

//G2 replaced by G2

//G1 replaced by G1

module F3 (
  input      [3:0]    io_R1,
  input      [3:0]    io_R2,
  output reg [3:0]    io_Y
);


  always @(*) begin
    io_Y[3] = (((((io_R1[2] ^ io_R1[1]) ^ io_R1[0]) ^ (io_R1[3] && io_R1[0])) ^ (io_R1[3] && io_R2[0])) ^ (io_R2[3] && io_R1[0]));
    io_Y[2] = (((io_R1[3] ^ (io_R1[1] && io_R1[0])) ^ (io_R1[1] && io_R2[0])) ^ (io_R2[1] && io_R1[0]));
    io_Y[1] = ((((io_R1[2] ^ io_R1[1]) ^ (io_R1[3] && io_R1[0])) ^ (io_R1[3] && io_R2[0])) ^ (io_R2[3] && io_R1[0]));
    io_Y[0] = (((io_R1[1] ^ (io_R1[2] && io_R1[0])) ^ (io_R1[2] && io_R2[0])) ^ (io_R2[2] && io_R1[0]));
  end


endmodule

module F2 (
  input      [3:0]    io_R1,
  input      [3:0]    io_R3,
  output reg [3:0]    io_Y
);


  always @(*) begin
    io_Y[3] = (((((io_R3[2] ^ io_R3[1]) ^ io_R3[0]) ^ (io_R3[3] && io_R3[0])) ^ (io_R1[3] && io_R3[0])) ^ (io_R3[3] && io_R1[0]));
    io_Y[2] = (((io_R3[3] ^ (io_R3[1] && io_R3[0])) ^ (io_R1[1] && io_R3[0])) ^ (io_R3[1] && io_R1[0]));
    io_Y[1] = ((((io_R3[2] ^ io_R3[1]) ^ (io_R3[3] && io_R3[0])) ^ (io_R1[3] && io_R3[0])) ^ (io_R3[3] && io_R1[0]));
    io_Y[0] = (((io_R3[1] ^ (io_R3[2] && io_R3[0])) ^ (io_R1[2] && io_R3[0])) ^ (io_R3[2] && io_R1[0]));
  end


endmodule

module F1 (
  input      [3:0]    io_R2,
  input      [3:0]    io_R3,
  output reg [3:0]    io_Y
);


  always @(*) begin
    io_Y[3] = (((((io_R2[2] ^ io_R2[1]) ^ io_R2[0]) ^ (io_R2[3] && io_R2[0])) ^ (io_R2[3] && io_R3[0])) ^ (io_R3[3] && io_R2[0]));
    io_Y[2] = (((io_R2[3] ^ (io_R2[1] && io_R2[0])) ^ (io_R2[1] && io_R3[0])) ^ (io_R3[1] && io_R2[0]));
    io_Y[1] = ((((io_R2[2] ^ io_R2[1]) ^ (io_R2[3] && io_R2[0])) ^ (io_R2[3] && io_R3[0])) ^ (io_R3[3] && io_R2[0]));
    io_Y[0] = (((io_R2[1] ^ (io_R2[2] && io_R2[0])) ^ (io_R2[2] && io_R3[0])) ^ (io_R3[2] && io_R2[0]));
  end


endmodule

module G3 (
  input      [3:0]    io_X1,
  input      [3:0]    io_X2,
  output reg [3:0]    io_Y
);

  wire                _zz_io_Y;
  wire                _zz_io_Y_1;
  wire                _zz_io_Y_2;
  wire                _zz_io_Y_3;

  assign _zz_io_Y = io_X1[0];
  assign _zz_io_Y_1 = (io_X1[3] && io_X1[2]);
  assign _zz_io_Y_2 = io_X1[3];
  assign _zz_io_Y_3 = io_X2[2];
  always @(*) begin
    io_Y[3] = ((io_X1[2] ^ io_X1[1]) ^ io_X1[0]);
    io_Y[2] = (io_X1[2] ^ io_X1[1]);
    io_Y[1] = (((((((io_X1[3] ^ io_X1[1]) ^ (io_X1[2] && io_X1[0])) ^ (io_X1[2] && io_X2[0])) ^ (io_X2[2] && io_X1[0])) ^ (io_X1[1] && io_X1[0])) ^ (io_X1[1] && io_X2[0])) ^ (io_X2[1] && io_X1[0]));
    io_Y[0] = (((((((((_zz_io_Y ^ _zz_io_Y_1) ^ (_zz_io_Y_2 && _zz_io_Y_3)) ^ (io_X2[3] && io_X1[2])) ^ (io_X1[3] && io_X1[1])) ^ (io_X1[3] && io_X2[1])) ^ (io_X2[3] && io_X1[1])) ^ (io_X1[2] && io_X1[1])) ^ (io_X1[2] && io_X2[1])) ^ (io_X2[2] && io_X1[1]));
  end


endmodule

module G2 (
  input      [3:0]    io_X1,
  input      [3:0]    io_X3,
  output reg [3:0]    io_Y
);

  wire                _zz_io_Y;
  wire                _zz_io_Y_1;
  wire                _zz_io_Y_2;
  wire                _zz_io_Y_3;

  assign _zz_io_Y = io_X3[0];
  assign _zz_io_Y_1 = (io_X3[3] && io_X3[2]);
  assign _zz_io_Y_2 = io_X3[3];
  assign _zz_io_Y_3 = io_X1[2];
  always @(*) begin
    io_Y[3] = ((io_X3[2] ^ io_X3[1]) ^ io_X3[0]);
    io_Y[2] = (io_X3[2] ^ io_X3[1]);
    io_Y[1] = (((((((io_X3[3] ^ io_X3[1]) ^ (io_X3[2] && io_X3[0])) ^ (io_X3[2] && io_X1[0])) ^ (io_X1[2] && io_X3[0])) ^ (io_X3[1] && io_X3[0])) ^ (io_X3[1] && io_X1[0])) ^ (io_X1[1] && io_X3[0]));
    io_Y[0] = (((((((((_zz_io_Y ^ _zz_io_Y_1) ^ (_zz_io_Y_2 && _zz_io_Y_3)) ^ (io_X1[3] && io_X3[2])) ^ (io_X3[3] && io_X3[1])) ^ (io_X3[3] && io_X1[1])) ^ (io_X1[3] && io_X3[1])) ^ (io_X3[2] && io_X3[1])) ^ (io_X3[2] && io_X1[1])) ^ (io_X1[2] && io_X3[1]));
  end


endmodule

module G1 (
  input      [3:0]    io_X2,
  input      [3:0]    io_X3,
  output reg [3:0]    io_Y
);

  wire                _zz_io_Y;
  wire                _zz_io_Y_1;
  wire                _zz_io_Y_2;
  wire                _zz_io_Y_3;

  assign _zz_io_Y = (1'b1 ^ io_X2[0]);
  assign _zz_io_Y_1 = (io_X2[3] && io_X2[2]);
  assign _zz_io_Y_2 = io_X2[3];
  assign _zz_io_Y_3 = io_X3[2];
  always @(*) begin
    io_Y[3] = ((io_X2[2] ^ io_X2[1]) ^ io_X2[0]);
    io_Y[2] = ((1'b1 ^ io_X2[2]) ^ io_X2[1]);
    io_Y[1] = ((((((((1'b1 ^ io_X2[3]) ^ io_X2[1]) ^ (io_X2[2] && io_X2[0])) ^ (io_X2[2] && io_X3[0])) ^ (io_X3[2] && io_X2[0])) ^ (io_X2[1] && io_X2[0])) ^ (io_X2[1] && io_X3[0])) ^ (io_X3[1] && io_X2[0]));
    io_Y[0] = (((((((((_zz_io_Y ^ _zz_io_Y_1) ^ (_zz_io_Y_2 && _zz_io_Y_3)) ^ (io_X3[3] && io_X2[2])) ^ (io_X2[3] && io_X2[1])) ^ (io_X2[3] && io_X3[1])) ^ (io_X3[3] && io_X2[1])) ^ (io_X2[2] && io_X2[1])) ^ (io_X2[2] && io_X3[1])) ^ (io_X3[2] && io_X2[1]));
  end


endmodule
