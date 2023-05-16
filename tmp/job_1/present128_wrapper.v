// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : present128_wrapper
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module present128_wrapper (
  input               io_resetFull,
  input               io_enable,
  input      [191:0]  io_dataIn,
  input      [383:0]  io_key,
  output     [191:0]  io_dataOut,
  output reg          io_done,
  input               clk,
  input               reset
);
  localparam States_sIdle = 2'd0;
  localparam States_sLoadData = 2'd1;
  localparam States_sExecute = 2'd2;
  localparam States_sDone = 2'd3;

  wire       [63:0]   presentEncrypt_io_ciphertext1;
  wire       [63:0]   presentEncrypt_io_ciphertext2;
  wire       [63:0]   presentEncrypt_io_ciphertext3;
  wire                presentEncrypt_io_done;
  reg        [63:0]   dataInReg_0;
  reg        [63:0]   dataInReg_1;
  reg        [63:0]   dataInReg_2;
  reg        [127:0]  keyReg_0;
  reg        [127:0]  keyReg_1;
  reg        [127:0]  keyReg_2;
  reg        [63:0]   dataOutReg_0;
  reg        [63:0]   dataOutReg_1;
  reg        [63:0]   dataOutReg_2;
  reg                 enablePresentEncrypt;
  wire                sampleInputs;
  wire                sampleOutputs;
  reg        [1:0]    dutState;
  `ifndef SYNTHESIS
  reg [71:0] dutState_string;
  `endif


  present128 presentEncrypt (
    .io_enable         (enablePresentEncrypt                 ), //i
    .io_plaintext1     (dataInReg_0[63:0]                    ), //i
    .io_plaintext2     (dataInReg_1[63:0]                    ), //i
    .io_plaintext3     (dataInReg_2[63:0]                    ), //i
    .io_key1           (keyReg_0[127:0]                      ), //i
    .io_key2           (keyReg_1[127:0]                      ), //i
    .io_key3           (keyReg_2[127:0]                      ), //i
    .io_ciphertext1    (presentEncrypt_io_ciphertext1[63:0]  ), //o
    .io_ciphertext2    (presentEncrypt_io_ciphertext2[63:0]  ), //o
    .io_ciphertext3    (presentEncrypt_io_ciphertext3[63:0]  ), //o
    .io_done           (presentEncrypt_io_done               ), //o
    .clk               (clk                                  ), //i
    .reset             (reset                                )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(dutState)
      States_sIdle : dutState_string = "sIdle    ";
      States_sLoadData : dutState_string = "sLoadData";
      States_sExecute : dutState_string = "sExecute ";
      States_sDone : dutState_string = "sDone    ";
      default : dutState_string = "?????????";
    endcase
  end
  `endif

  assign sampleInputs = 1'b0;
  assign sampleOutputs = 1'b0;
  always @(*) begin
    io_done = 1'b0;
    case(dutState)
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

  assign io_dataOut = {{dataOutReg_0,dataOutReg_1},dataOutReg_2};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      dataInReg_0 <= 64'h0;
      dataInReg_1 <= 64'h0;
      dataInReg_2 <= 64'h0;
      keyReg_0 <= 128'h0;
      keyReg_1 <= 128'h0;
      keyReg_2 <= 128'h0;
      dataOutReg_0 <= 64'h0;
      dataOutReg_1 <= 64'h0;
      dataOutReg_2 <= 64'h0;
      enablePresentEncrypt <= 1'b0;
      dutState <= States_sIdle;
    end else begin
      enablePresentEncrypt <= 1'b0;
      case(dutState)
        States_sIdle : begin
          dutState <= States_sIdle;
          if(io_enable) begin
            dutState <= States_sLoadData;
          end
        end
        States_sLoadData : begin
          dataInReg_0 <= io_dataIn[63 : 0];
          keyReg_0 <= io_key[127 : 0];
          dataInReg_1 <= io_dataIn[127 : 64];
          keyReg_1 <= io_key[255 : 128];
          dataInReg_2 <= io_dataIn[191 : 128];
          keyReg_2 <= io_key[383 : 256];
          enablePresentEncrypt <= 1'b1;
          dutState <= States_sExecute;
        end
        States_sExecute : begin
          dutState <= States_sExecute;
          if(presentEncrypt_io_done) begin
            dataOutReg_0 <= presentEncrypt_io_ciphertext1;
            dataOutReg_1 <= presentEncrypt_io_ciphertext2;
            dataOutReg_2 <= presentEncrypt_io_ciphertext3;
            dutState <= States_sDone;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

module present128 (
  input               io_enable,
  input      [63:0]   io_plaintext1,
  input      [63:0]   io_plaintext2,
  input      [63:0]   io_plaintext3,
  input      [127:0]  io_key1,
  input      [127:0]  io_key2,
  input      [127:0]  io_key3,
  output reg [63:0]   io_ciphertext1,
  output reg [63:0]   io_ciphertext2,
  output reg [63:0]   io_ciphertext3,
  output reg          io_done,
  input               clk,
  input               reset
);
  localparam States_1_sIdle = 2'd0;
  localparam States_1_sExecute = 2'd1;
  localparam States_1_sDone = 2'd2;

  wire       [4:0]    updatekeyshared_io_round;
  wire       [63:0]   addroundkey1_io_stateOut;
  wire       [63:0]   addroundkey2_io_stateOut;
  wire       [63:0]   addroundkey3_io_stateOut;
  wire       [127:0]  updatekeyshared_io_keyOut1;
  wire       [127:0]  updatekeyshared_io_keyOut2;
  wire       [127:0]  updatekeyshared_io_keyOut3;
  wire       [63:0]   sboxlayershared_1_io_stateOut1;
  wire       [63:0]   sboxlayershared_1_io_stateOut2;
  wire       [63:0]   sboxlayershared_1_io_stateOut3;
  wire       [63:0]   permutation1_io_stateOut;
  wire       [63:0]   permutation2_io_stateOut;
  wire       [63:0]   permutation3_io_stateOut;
  wire       [4:0]    _zz_ctr_valueNext;
  wire       [0:0]    _zz_ctr_valueNext_1;
  reg        [63:0]   state1;
  reg        [63:0]   state2;
  reg        [63:0]   state3;
  reg        [127:0]  keyReg1;
  reg        [127:0]  keyReg2;
  reg        [127:0]  keyReg3;
  wire       [63:0]   roundKey1;
  wire       [63:0]   roundKey2;
  wire       [63:0]   roundKey3;
  reg                 ctr_willIncrement;
  reg                 ctr_willClear;
  reg        [4:0]    ctr_valueNext;
  reg        [4:0]    ctr_value;
  wire                ctr_willOverflowIfInc;
  wire                ctr_willOverflow;
  reg                 smallCtr_willIncrement;
  reg                 smallCtr_willClear;
  reg        [0:0]    smallCtr_valueNext;
  reg        [0:0]    smallCtr_value;
  wire                smallCtr_willOverflowIfInc;
  wire                smallCtr_willOverflow;
  reg        [1:0]    presentState;
  `ifndef SYNTHESIS
  reg [63:0] presentState_string;
  `endif


  assign _zz_ctr_valueNext_1 = ctr_willIncrement;
  assign _zz_ctr_valueNext = {4'd0, _zz_ctr_valueNext_1};
  addRoundKey addroundkey1 (
    .io_stateIn     (state1[63:0]                    ), //i
    .io_key         (roundKey1[63:0]                 ), //i
    .io_stateOut    (addroundkey1_io_stateOut[63:0]  )  //o
  );
  addRoundKey addroundkey2 (
    .io_stateIn     (state2[63:0]                    ), //i
    .io_key         (roundKey2[63:0]                 ), //i
    .io_stateOut    (addroundkey2_io_stateOut[63:0]  )  //o
  );
  addRoundKey addroundkey3 (
    .io_stateIn     (state3[63:0]                    ), //i
    .io_key         (roundKey3[63:0]                 ), //i
    .io_stateOut    (addroundkey3_io_stateOut[63:0]  )  //o
  );
  updateKey128Shared updatekeyshared (
    .io_keyIn1     (keyReg1[127:0]                     ), //i
    .io_keyIn2     (keyReg2[127:0]                     ), //i
    .io_keyIn3     (keyReg3[127:0]                     ), //i
    .io_round      (updatekeyshared_io_round[4:0]      ), //i
    .io_keyOut1    (updatekeyshared_io_keyOut1[127:0]  ), //o
    .io_keyOut2    (updatekeyshared_io_keyOut2[127:0]  ), //o
    .io_keyOut3    (updatekeyshared_io_keyOut3[127:0]  ), //o
    .clk           (clk                                ), //i
    .reset         (reset                              )  //i
  );
  sboxLayerShared sboxlayershared_1 (
    .io_stateIn1     (addroundkey1_io_stateOut[63:0]        ), //i
    .io_stateIn2     (addroundkey2_io_stateOut[63:0]        ), //i
    .io_stateIn3     (addroundkey3_io_stateOut[63:0]        ), //i
    .io_stateOut1    (sboxlayershared_1_io_stateOut1[63:0]  ), //o
    .io_stateOut2    (sboxlayershared_1_io_stateOut2[63:0]  ), //o
    .io_stateOut3    (sboxlayershared_1_io_stateOut3[63:0]  ), //o
    .clk             (clk                                   ), //i
    .reset           (reset                                 )  //i
  );
  permutation permutation1 (
    .io_stateIn     (sboxlayershared_1_io_stateOut1[63:0]  ), //i
    .io_stateOut    (permutation1_io_stateOut[63:0]        )  //o
  );
  permutation permutation2 (
    .io_stateIn     (sboxlayershared_1_io_stateOut2[63:0]  ), //i
    .io_stateOut    (permutation2_io_stateOut[63:0]        )  //o
  );
  permutation permutation3 (
    .io_stateIn     (sboxlayershared_1_io_stateOut3[63:0]  ), //i
    .io_stateOut    (permutation3_io_stateOut[63:0]        )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(presentState)
      States_1_sIdle : presentState_string = "sIdle   ";
      States_1_sExecute : presentState_string = "sExecute";
      States_1_sDone : presentState_string = "sDone   ";
      default : presentState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_ciphertext1 = 64'h0;
    case(presentState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
      end
      default : begin
        io_ciphertext1 = addroundkey1_io_stateOut;
      end
    endcase
  end

  always @(*) begin
    io_ciphertext2 = 64'h0;
    case(presentState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
      end
      default : begin
        io_ciphertext2 = addroundkey2_io_stateOut;
      end
    endcase
  end

  always @(*) begin
    io_ciphertext3 = 64'h0;
    case(presentState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
      end
      default : begin
        io_ciphertext3 = addroundkey3_io_stateOut;
      end
    endcase
  end

  always @(*) begin
    io_done = 1'b0;
    case(presentState)
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
    ctr_willIncrement = 1'b0;
    case(presentState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
        if(smallCtr_willOverflow) begin
          ctr_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctr_willClear = 1'b0;
    case(presentState)
      States_1_sIdle : begin
        ctr_willClear = 1'b1;
      end
      States_1_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign ctr_willOverflowIfInc = (ctr_value == 5'h1f);
  assign ctr_willOverflow = (ctr_willOverflowIfInc && ctr_willIncrement);
  always @(*) begin
    if(ctr_willOverflow) begin
      ctr_valueNext = 5'h01;
    end else begin
      ctr_valueNext = (ctr_value + _zz_ctr_valueNext);
    end
    if(ctr_willClear) begin
      ctr_valueNext = 5'h01;
    end
  end

  always @(*) begin
    smallCtr_willIncrement = 1'b0;
    case(presentState)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
        smallCtr_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    smallCtr_willClear = 1'b0;
    case(presentState)
      States_1_sIdle : begin
        smallCtr_willClear = 1'b1;
      end
      States_1_sExecute : begin
      end
      default : begin
      end
    endcase
  end

  assign smallCtr_willOverflowIfInc = (smallCtr_value == 1'b1);
  assign smallCtr_willOverflow = (smallCtr_willOverflowIfInc && smallCtr_willIncrement);
  always @(*) begin
    smallCtr_valueNext = (smallCtr_value + smallCtr_willIncrement);
    if(smallCtr_willClear) begin
      smallCtr_valueNext = 1'b0;
    end
  end

  assign roundKey1 = keyReg1[127 : 64];
  assign roundKey2 = keyReg2[127 : 64];
  assign roundKey3 = keyReg3[127 : 64];
  assign updatekeyshared_io_round = ctr_value;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state1 <= 64'h0;
      state2 <= 64'h0;
      state3 <= 64'h0;
      keyReg1 <= 128'h0;
      keyReg2 <= 128'h0;
      keyReg3 <= 128'h0;
      ctr_value <= 5'h01;
      smallCtr_value <= 1'b0;
      presentState <= States_1_sIdle;
    end else begin
      ctr_value <= ctr_valueNext;
      smallCtr_value <= smallCtr_valueNext;
      keyReg1 <= updatekeyshared_io_keyOut1;
      keyReg2 <= updatekeyshared_io_keyOut2;
      keyReg3 <= updatekeyshared_io_keyOut3;
      state1 <= permutation1_io_stateOut;
      state2 <= permutation2_io_stateOut;
      state3 <= permutation3_io_stateOut;
      case(presentState)
        States_1_sIdle : begin
          presentState <= States_1_sIdle;
          if(io_enable) begin
            presentState <= States_1_sExecute;
            state1 <= io_plaintext1;
            state2 <= io_plaintext2;
            state3 <= io_plaintext3;
            keyReg1 <= io_key1;
            keyReg2 <= io_key2;
            keyReg3 <= io_key3;
          end
        end
        States_1_sExecute : begin
          presentState <= States_1_sExecute;
          if(ctr_willOverflow) begin
            presentState <= States_1_sDone;
          end
        end
        default : begin
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
  input               clk,
  input               reset
);

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
  wire       [3:0]    maskedSBox_33_io_in1;
  wire       [3:0]    maskedSBox_33_io_in2;
  wire       [3:0]    maskedSBox_33_io_in3;
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
  wire       [3:0]    maskedSBox_33_io_out1;
  wire       [3:0]    maskedSBox_33_io_out2;
  wire       [3:0]    maskedSBox_33_io_out3;

  MaskedSBox maskedSBox_18 (
    .io_in1     (maskedSBox_18_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_18_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_18_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_18_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_18_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_18_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_19 (
    .io_in1     (maskedSBox_19_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_19_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_19_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_19_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_19_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_19_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_20 (
    .io_in1     (maskedSBox_20_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_20_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_20_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_20_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_20_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_20_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_21 (
    .io_in1     (maskedSBox_21_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_21_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_21_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_21_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_21_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_21_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_22 (
    .io_in1     (maskedSBox_22_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_22_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_22_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_22_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_22_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_22_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_23 (
    .io_in1     (maskedSBox_23_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_23_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_23_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_23_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_23_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_23_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_24 (
    .io_in1     (maskedSBox_24_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_24_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_24_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_24_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_24_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_24_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_25 (
    .io_in1     (maskedSBox_25_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_25_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_25_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_25_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_25_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_25_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_26 (
    .io_in1     (maskedSBox_26_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_26_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_26_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_26_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_26_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_26_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_27 (
    .io_in1     (maskedSBox_27_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_27_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_27_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_27_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_27_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_27_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_28 (
    .io_in1     (maskedSBox_28_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_28_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_28_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_28_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_28_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_28_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_29 (
    .io_in1     (maskedSBox_29_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_29_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_29_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_29_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_29_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_29_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_30 (
    .io_in1     (maskedSBox_30_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_30_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_30_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_30_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_30_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_30_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_31 (
    .io_in1     (maskedSBox_31_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_31_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_31_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_31_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_31_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_31_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_32 (
    .io_in1     (maskedSBox_32_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_32_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_32_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_32_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_32_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_32_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  MaskedSBox maskedSBox_33 (
    .io_in1     (maskedSBox_33_io_in1[3:0]   ), //i
    .io_in2     (maskedSBox_33_io_in2[3:0]   ), //i
    .io_in3     (maskedSBox_33_io_in3[3:0]   ), //i
    .io_out1    (maskedSBox_33_io_out1[3:0]  ), //o
    .io_out2    (maskedSBox_33_io_out2[3:0]  ), //o
    .io_out3    (maskedSBox_33_io_out3[3:0]  ), //o
    .clk        (clk                         ), //i
    .reset      (reset                       )  //i
  );
  assign maskedSBox_18_io_in1 = io_stateIn1[3 : 0];
  assign maskedSBox_18_io_in2 = io_stateIn2[3 : 0];
  assign maskedSBox_18_io_in3 = io_stateIn3[3 : 0];
  always @(*) begin
    io_stateOut1[3 : 0] = maskedSBox_18_io_out1;
    io_stateOut1[7 : 4] = maskedSBox_19_io_out1;
    io_stateOut1[11 : 8] = maskedSBox_20_io_out1;
    io_stateOut1[15 : 12] = maskedSBox_21_io_out1;
    io_stateOut1[19 : 16] = maskedSBox_22_io_out1;
    io_stateOut1[23 : 20] = maskedSBox_23_io_out1;
    io_stateOut1[27 : 24] = maskedSBox_24_io_out1;
    io_stateOut1[31 : 28] = maskedSBox_25_io_out1;
    io_stateOut1[35 : 32] = maskedSBox_26_io_out1;
    io_stateOut1[39 : 36] = maskedSBox_27_io_out1;
    io_stateOut1[43 : 40] = maskedSBox_28_io_out1;
    io_stateOut1[47 : 44] = maskedSBox_29_io_out1;
    io_stateOut1[51 : 48] = maskedSBox_30_io_out1;
    io_stateOut1[55 : 52] = maskedSBox_31_io_out1;
    io_stateOut1[59 : 56] = maskedSBox_32_io_out1;
    io_stateOut1[63 : 60] = maskedSBox_33_io_out1;
  end

  always @(*) begin
    io_stateOut2[3 : 0] = maskedSBox_18_io_out2;
    io_stateOut2[7 : 4] = maskedSBox_19_io_out2;
    io_stateOut2[11 : 8] = maskedSBox_20_io_out2;
    io_stateOut2[15 : 12] = maskedSBox_21_io_out2;
    io_stateOut2[19 : 16] = maskedSBox_22_io_out2;
    io_stateOut2[23 : 20] = maskedSBox_23_io_out2;
    io_stateOut2[27 : 24] = maskedSBox_24_io_out2;
    io_stateOut2[31 : 28] = maskedSBox_25_io_out2;
    io_stateOut2[35 : 32] = maskedSBox_26_io_out2;
    io_stateOut2[39 : 36] = maskedSBox_27_io_out2;
    io_stateOut2[43 : 40] = maskedSBox_28_io_out2;
    io_stateOut2[47 : 44] = maskedSBox_29_io_out2;
    io_stateOut2[51 : 48] = maskedSBox_30_io_out2;
    io_stateOut2[55 : 52] = maskedSBox_31_io_out2;
    io_stateOut2[59 : 56] = maskedSBox_32_io_out2;
    io_stateOut2[63 : 60] = maskedSBox_33_io_out2;
  end

  always @(*) begin
    io_stateOut3[3 : 0] = maskedSBox_18_io_out3;
    io_stateOut3[7 : 4] = maskedSBox_19_io_out3;
    io_stateOut3[11 : 8] = maskedSBox_20_io_out3;
    io_stateOut3[15 : 12] = maskedSBox_21_io_out3;
    io_stateOut3[19 : 16] = maskedSBox_22_io_out3;
    io_stateOut3[23 : 20] = maskedSBox_23_io_out3;
    io_stateOut3[27 : 24] = maskedSBox_24_io_out3;
    io_stateOut3[31 : 28] = maskedSBox_25_io_out3;
    io_stateOut3[35 : 32] = maskedSBox_26_io_out3;
    io_stateOut3[39 : 36] = maskedSBox_27_io_out3;
    io_stateOut3[43 : 40] = maskedSBox_28_io_out3;
    io_stateOut3[47 : 44] = maskedSBox_29_io_out3;
    io_stateOut3[51 : 48] = maskedSBox_30_io_out3;
    io_stateOut3[55 : 52] = maskedSBox_31_io_out3;
    io_stateOut3[59 : 56] = maskedSBox_32_io_out3;
    io_stateOut3[63 : 60] = maskedSBox_33_io_out3;
  end

  assign maskedSBox_19_io_in1 = io_stateIn1[7 : 4];
  assign maskedSBox_19_io_in2 = io_stateIn2[7 : 4];
  assign maskedSBox_19_io_in3 = io_stateIn3[7 : 4];
  assign maskedSBox_20_io_in1 = io_stateIn1[11 : 8];
  assign maskedSBox_20_io_in2 = io_stateIn2[11 : 8];
  assign maskedSBox_20_io_in3 = io_stateIn3[11 : 8];
  assign maskedSBox_21_io_in1 = io_stateIn1[15 : 12];
  assign maskedSBox_21_io_in2 = io_stateIn2[15 : 12];
  assign maskedSBox_21_io_in3 = io_stateIn3[15 : 12];
  assign maskedSBox_22_io_in1 = io_stateIn1[19 : 16];
  assign maskedSBox_22_io_in2 = io_stateIn2[19 : 16];
  assign maskedSBox_22_io_in3 = io_stateIn3[19 : 16];
  assign maskedSBox_23_io_in1 = io_stateIn1[23 : 20];
  assign maskedSBox_23_io_in2 = io_stateIn2[23 : 20];
  assign maskedSBox_23_io_in3 = io_stateIn3[23 : 20];
  assign maskedSBox_24_io_in1 = io_stateIn1[27 : 24];
  assign maskedSBox_24_io_in2 = io_stateIn2[27 : 24];
  assign maskedSBox_24_io_in3 = io_stateIn3[27 : 24];
  assign maskedSBox_25_io_in1 = io_stateIn1[31 : 28];
  assign maskedSBox_25_io_in2 = io_stateIn2[31 : 28];
  assign maskedSBox_25_io_in3 = io_stateIn3[31 : 28];
  assign maskedSBox_26_io_in1 = io_stateIn1[35 : 32];
  assign maskedSBox_26_io_in2 = io_stateIn2[35 : 32];
  assign maskedSBox_26_io_in3 = io_stateIn3[35 : 32];
  assign maskedSBox_27_io_in1 = io_stateIn1[39 : 36];
  assign maskedSBox_27_io_in2 = io_stateIn2[39 : 36];
  assign maskedSBox_27_io_in3 = io_stateIn3[39 : 36];
  assign maskedSBox_28_io_in1 = io_stateIn1[43 : 40];
  assign maskedSBox_28_io_in2 = io_stateIn2[43 : 40];
  assign maskedSBox_28_io_in3 = io_stateIn3[43 : 40];
  assign maskedSBox_29_io_in1 = io_stateIn1[47 : 44];
  assign maskedSBox_29_io_in2 = io_stateIn2[47 : 44];
  assign maskedSBox_29_io_in3 = io_stateIn3[47 : 44];
  assign maskedSBox_30_io_in1 = io_stateIn1[51 : 48];
  assign maskedSBox_30_io_in2 = io_stateIn2[51 : 48];
  assign maskedSBox_30_io_in3 = io_stateIn3[51 : 48];
  assign maskedSBox_31_io_in1 = io_stateIn1[55 : 52];
  assign maskedSBox_31_io_in2 = io_stateIn2[55 : 52];
  assign maskedSBox_31_io_in3 = io_stateIn3[55 : 52];
  assign maskedSBox_32_io_in1 = io_stateIn1[59 : 56];
  assign maskedSBox_32_io_in2 = io_stateIn2[59 : 56];
  assign maskedSBox_32_io_in3 = io_stateIn3[59 : 56];
  assign maskedSBox_33_io_in1 = io_stateIn1[63 : 60];
  assign maskedSBox_33_io_in2 = io_stateIn2[63 : 60];
  assign maskedSBox_33_io_in3 = io_stateIn3[63 : 60];

endmodule

module updateKey128Shared (
  input      [127:0]  io_keyIn1,
  input      [127:0]  io_keyIn2,
  input      [127:0]  io_keyIn3,
  input      [4:0]    io_round,
  output     [127:0]  io_keyOut1,
  output     [127:0]  io_keyOut2,
  output     [127:0]  io_keyOut3,
  input               clk,
  input               reset
);

  wire       [3:0]    sbox1_io_in1;
  wire       [3:0]    sbox1_io_in2;
  wire       [3:0]    sbox1_io_in3;
  wire       [3:0]    sbox2_io_in1;
  wire       [3:0]    sbox2_io_in2;
  wire       [3:0]    sbox2_io_in3;
  wire       [3:0]    sbox1_io_out1;
  wire       [3:0]    sbox1_io_out2;
  wire       [3:0]    sbox1_io_out3;
  wire       [3:0]    sbox2_io_out1;
  wire       [3:0]    sbox2_io_out2;
  wire       [3:0]    sbox2_io_out3;
  wire       [127:0]  k11;
  wire       [127:0]  k12;
  wire       [127:0]  k13;
  wire       [127:0]  k21;
  wire       [127:0]  k22;
  wire       [127:0]  k23;
  wire       [127:0]  k31;
  wire       [127:0]  k32;
  wire       [127:0]  k33;
  reg        [127:0]  k11Reg;
  reg        [127:0]  k12Reg;
  reg        [127:0]  k13Reg;

  MaskedSBox sbox1 (
    .io_in1     (sbox1_io_in1[3:0]   ), //i
    .io_in2     (sbox1_io_in2[3:0]   ), //i
    .io_in3     (sbox1_io_in3[3:0]   ), //i
    .io_out1    (sbox1_io_out1[3:0]  ), //o
    .io_out2    (sbox1_io_out2[3:0]  ), //o
    .io_out3    (sbox1_io_out3[3:0]  ), //o
    .clk        (clk                 ), //i
    .reset      (reset               )  //i
  );
  MaskedSBox sbox2 (
    .io_in1     (sbox2_io_in1[3:0]   ), //i
    .io_in2     (sbox2_io_in2[3:0]   ), //i
    .io_in3     (sbox2_io_in3[3:0]   ), //i
    .io_out1    (sbox2_io_out1[3:0]  ), //o
    .io_out2    (sbox2_io_out2[3:0]  ), //o
    .io_out3    (sbox2_io_out3[3:0]  ), //o
    .clk        (clk                 ), //i
    .reset      (reset               )  //i
  );
  assign sbox1_io_in1 = k11[127 : 124];
  assign sbox1_io_in2 = k12[127 : 124];
  assign sbox1_io_in3 = k13[127 : 124];
  assign sbox2_io_in1 = k11[123 : 120];
  assign sbox2_io_in2 = k12[123 : 120];
  assign sbox2_io_in3 = k13[123 : 120];
  assign k11 = {io_keyIn1[66 : 0],io_keyIn1[127 : 67]};
  assign k12 = {io_keyIn2[66 : 0],io_keyIn2[127 : 67]};
  assign k13 = {io_keyIn3[66 : 0],io_keyIn3[127 : 67]};
  assign k21 = {{sbox1_io_out1,sbox2_io_out1},k11Reg[119 : 0]};
  assign k22 = {{sbox1_io_out2,sbox2_io_out2},k12Reg[119 : 0]};
  assign k23 = {{sbox1_io_out3,sbox2_io_out3},k13Reg[119 : 0]};
  assign k31 = {{k21[127 : 67],(k21[66 : 62] ^ io_round)},k21[61 : 0]};
  assign k32 = {{k22[127 : 67],k22[66 : 62]},k22[61 : 0]};
  assign k33 = {{k23[127 : 67],k23[66 : 62]},k23[61 : 0]};
  assign io_keyOut1 = k31;
  assign io_keyOut2 = k32;
  assign io_keyOut3 = k33;
  always @(posedge clk) begin
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

//MaskedSBox replaced by MaskedSBox

module MaskedSBox (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output     [3:0]    io_out1,
  output     [3:0]    io_out2,
  output     [3:0]    io_out3,
  input               clk,
  input               reset
);

  wire       [3:0]    G_io_out1;
  wire       [3:0]    G_io_out2;
  wire       [3:0]    G_io_out3;
  wire       [3:0]    F_io_out1;
  wire       [3:0]    F_io_out2;
  wire       [3:0]    F_io_out3;
  reg        [3:0]    GOut1;
  reg        [3:0]    GOut2;
  reg        [3:0]    GOut3;
  reg                 dummy;

  MaskedG G (
    .io_in1     (io_in1[3:0]     ), //i
    .io_in2     (io_in2[3:0]     ), //i
    .io_in3     (io_in3[3:0]     ), //i
    .io_out1    (G_io_out1[3:0]  ), //o
    .io_out2    (G_io_out2[3:0]  ), //o
    .io_out3    (G_io_out3[3:0]  )  //o
  );
  MaskedF F (
    .io_in1     (GOut1[3:0]      ), //i
    .io_in2     (GOut2[3:0]      ), //i
    .io_in3     (GOut3[3:0]      ), //i
    .io_out1    (F_io_out1[3:0]  ), //o
    .io_out2    (F_io_out2[3:0]  ), //o
    .io_out3    (F_io_out3[3:0]  ), //o
    .clk        (clk             ), //i
    .reset      (reset           )  //i
  );
  assign io_out1 = F_io_out1;
  assign io_out2 = F_io_out2;
  assign io_out3 = F_io_out3;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      GOut1 <= 4'b0000;
      GOut2 <= 4'b0000;
      GOut3 <= 4'b0000;
    end else begin
      GOut1 <= G_io_out1;
      GOut2 <= G_io_out2;
      GOut3 <= G_io_out3;
    end
  end


endmodule

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

//MaskedF replaced by MaskedF

//MaskedG replaced by MaskedG

module MaskedF (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output reg [3:0]    io_out1,
  output reg [3:0]    io_out2,
  output reg [3:0]    io_out3,
  input               clk,
  input               reset
);

  reg                 dummy;
  wire                x1;
  wire                x2;
  wire                x3;
  wire                y1;
  wire                y2;
  wire                y3;
  wire                z1;
  wire                z2;
  wire                z3;
  wire                w1;
  wire                w2;
  wire                w3;
  wire                f13;
  wire                f12;
  wire                f11;
  wire                f10;
  wire                f23;
  wire                f22;
  wire                f21;
  wire                f20;
  wire                f33;
  wire                f32;
  wire                f31;
  wire                f30;

  assign x1 = io_in1[3];
  assign x2 = io_in2[3];
  assign x3 = io_in3[3];
  assign y1 = io_in1[2];
  assign y2 = io_in2[2];
  assign y3 = io_in3[2];
  assign z1 = io_in1[1];
  assign z2 = io_in2[1];
  assign z3 = io_in3[1];
  assign w1 = io_in1[0];
  assign w2 = io_in2[0];
  assign w3 = io_in3[0];
  assign f13 = (((((y2 ^ z2) ^ w2) ^ (x2 && w2)) ^ (x2 && w3)) ^ (x3 && w2));
  assign f12 = (((x2 ^ (z2 && w2)) ^ (z2 && w3)) ^ (z3 && w2));
  assign f11 = ((((y2 ^ z2) ^ (x2 && w2)) ^ (x2 && w3)) ^ (x3 && w2));
  assign f10 = (((z2 ^ (y2 && w2)) ^ (y2 && w3)) ^ (y3 && w2));
  assign f23 = (((((y3 ^ z3) ^ w3) ^ (x3 && w3)) ^ (x1 && w3)) ^ (x3 && w1));
  assign f22 = (((x3 ^ (z3 && w3)) ^ (z1 && w3)) ^ (z3 && w1));
  assign f21 = ((((y3 ^ z3) ^ (x3 && w3)) ^ (x1 && w3)) ^ (x3 && w1));
  assign f20 = (((z3 ^ (y3 && w3)) ^ (y1 && w3)) ^ (y3 && w1));
  assign f33 = (((((y1 ^ z1) ^ w1) ^ (x1 && w1)) ^ (x1 && w2)) ^ (x2 && w1));
  assign f32 = (((x1 ^ (z1 && w1)) ^ (z1 && w2)) ^ (z2 && w1));
  assign f31 = ((((y1 ^ z1) ^ (x1 && w1)) ^ (x1 && w2)) ^ (x2 && w1));
  assign f30 = (((z1 ^ (y1 && w1)) ^ (y1 && w2)) ^ (y2 && w1));
  always @(*) begin
    io_out1[3] = f13;
    io_out1[2] = f12;
    io_out1[1] = f11;
    io_out1[0] = f10;
  end

  always @(*) begin
    io_out2[3] = f23;
    io_out2[2] = f22;
    io_out2[1] = f21;
    io_out2[0] = f20;
  end

  always @(*) begin
    io_out3[3] = f33;
    io_out3[2] = f32;
    io_out3[1] = f31;
    io_out3[0] = f30;
  end


endmodule

module MaskedG (
  input      [3:0]    io_in1,
  input      [3:0]    io_in2,
  input      [3:0]    io_in3,
  output reg [3:0]    io_out1,
  output reg [3:0]    io_out2,
  output reg [3:0]    io_out3
);

  wire                _zz_g10;
  wire                _zz_g10_1;
  wire                _zz_g20;
  wire                x1;
  wire                x2;
  wire                x3;
  wire                y1;
  wire                y2;
  wire                y3;
  wire                z1;
  wire                z2;
  wire                z3;
  wire                w1;
  wire                w2;
  wire                w3;
  wire                g13;
  wire                g12;
  wire                g11;
  wire                g10;
  wire                g23;
  wire                g22;
  wire                g21;
  wire                g20;
  wire                g33;
  wire                g32;
  wire                g31;
  wire                g30;

  assign _zz_g10 = (1'b1 ^ w2);
  assign _zz_g10_1 = (x2 && y2);
  assign _zz_g20 = (x3 && y3);
  assign x1 = io_in1[3];
  assign x2 = io_in2[3];
  assign x3 = io_in3[3];
  assign y1 = io_in1[2];
  assign y2 = io_in2[2];
  assign y3 = io_in3[2];
  assign z1 = io_in1[1];
  assign z2 = io_in2[1];
  assign z3 = io_in3[1];
  assign w1 = io_in1[0];
  assign w2 = io_in2[0];
  assign w3 = io_in3[0];
  assign g13 = ((y2 ^ z2) ^ w2);
  assign g12 = ((1'b1 ^ y2) ^ z2);
  assign g11 = ((((((((1'b1 ^ x2) ^ z2) ^ (y2 && w2)) ^ (y2 && w3)) ^ (y3 && w2)) ^ (z2 && w2)) ^ (z2 && w3)) ^ (z3 && w2));
  assign g10 = (((((((((_zz_g10 ^ _zz_g10_1) ^ (x2 && y3)) ^ (x3 && y2)) ^ (x2 && z2)) ^ (x2 && z3)) ^ (x3 && z2)) ^ (y2 && z2)) ^ (y2 && z3)) ^ (y3 && z2));
  assign g23 = ((y3 ^ z3) ^ w3);
  assign g22 = (y3 ^ z3);
  assign g21 = (((((((x3 ^ z3) ^ (y3 && w3)) ^ (y1 && w3)) ^ (y3 && w1)) ^ (z3 && w3)) ^ (z1 && w3)) ^ (z3 && w1));
  assign g20 = (((((((((w3 ^ _zz_g20) ^ (x1 && y3)) ^ (x3 && y1)) ^ (x3 && z3)) ^ (x1 && z3)) ^ (x3 && z1)) ^ (y3 && z3)) ^ (y1 && z3)) ^ (y3 && z1));
  assign g33 = ((y1 ^ z1) ^ w1);
  assign g32 = (y1 ^ z1);
  assign g31 = (((((((x1 ^ z1) ^ (y1 && w1)) ^ (y1 && w2)) ^ (y2 && w1)) ^ (z1 && w1)) ^ (z1 && w2)) ^ (z2 && w1));
  assign g30 = (((((((((w1 ^ (x1 && y1)) ^ (x1 && y2)) ^ (x2 && y1)) ^ (x1 && z1)) ^ (x1 && z2)) ^ (x2 && z1)) ^ (y1 && z1)) ^ (y1 && z2)) ^ (y2 && z1));
  always @(*) begin
    io_out1[3] = g13;
    io_out1[2] = g12;
    io_out1[1] = g11;
    io_out1[0] = g10;
  end

  always @(*) begin
    io_out2[3] = g23;
    io_out2[2] = g22;
    io_out2[1] = g21;
    io_out2[0] = g20;
  end

  always @(*) begin
    io_out3[3] = g33;
    io_out3[2] = g32;
    io_out3[1] = g31;
    io_out3[0] = g30;
  end


endmodule
