// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : AES_Wrapper
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module AES_Wrapper (
  input               io_clk,
  input               io_reset,
  input               io_resetFull,
  input               io_enable,
  input      [255:0]  io_dataIn,
  input      [255:0]  io_key,
  input      [759:0]  io_mask,
  output     [255:0]  io_dataOut,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sLoadData = 2'd1;
  localparam States_sExecute = 2'd2;
  localparam States_sDone = 2'd3;

  reg                 r_aes_io_reset;
  wire       [127:0]  r_aes_io_ct1;
  wire       [127:0]  r_aes_io_ct2;
  wire                r_aes_io_done;
  reg        [127:0]  r_dataInReg_0;
  reg        [127:0]  r_dataInReg_1;
  reg        [127:0]  r_keyReg_0;
  reg        [127:0]  r_keyReg_1;
  reg        [127:0]  r_dataOutReg_0;
  reg        [127:0]  r_dataOutReg_1;
  reg                 r_enableAES;
  reg                 r_sampleInputs;
  reg                 r_sampleOutputs;
  reg        [1:0]    r_dutState;
  `ifndef SYNTHESIS
  reg [71:0] r_dutState_string;
  `endif


  AES r_aes (
    .io_clk       (io_clk                ), //i
    .io_reset     (r_aes_io_reset        ), //i
    .io_enable    (r_enableAES           ), //i
    .io_pt1       (r_dataInReg_0[127:0]  ), //i
    .io_pt2       (r_dataInReg_1[127:0]  ), //i
    .io_key1      (r_keyReg_0[127:0]     ), //i
    .io_key2      (r_keyReg_1[127:0]     ), //i
    .io_m         (io_mask[759:0]        ), //i
    .io_ct1       (r_aes_io_ct1[127:0]   ), //o
    .io_ct2       (r_aes_io_ct2[127:0]   ), //o
    .io_done      (r_aes_io_done         )  //o
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
        if(r_aes_io_done) begin
          r_sampleOutputs = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_aes_io_reset = 1'b1;
    case(r_dutState)
      States_sIdle : begin
      end
      States_sLoadData : begin
        r_aes_io_reset = 1'b0;
      end
      States_sExecute : begin
        r_aes_io_reset = 1'b0;
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
      r_dataInReg_0 <= 128'h0;
      r_dataInReg_1 <= 128'h0;
      r_keyReg_0 <= 128'h0;
      r_keyReg_1 <= 128'h0;
      r_dataOutReg_0 <= 128'h0;
      r_dataOutReg_1 <= 128'h0;
      r_enableAES <= 1'b0;
      r_dutState <= States_sIdle;
    end else begin
      r_enableAES <= 1'b0;
      if(r_sampleInputs) begin
        r_dataInReg_0 <= io_dataIn[127 : 0];
        r_keyReg_0 <= io_key[127 : 0];
        r_dataInReg_1 <= io_dataIn[255 : 128];
        r_keyReg_1 <= io_key[255 : 128];
      end
      if(r_sampleOutputs) begin
        r_dataOutReg_0 <= r_aes_io_ct1;
        r_dataOutReg_1 <= r_aes_io_ct2;
      end
      case(r_dutState)
        States_sIdle : begin
          r_dutState <= States_sIdle;
          if(io_enable) begin
            r_dutState <= States_sLoadData;
          end
        end
        States_sLoadData : begin
          r_enableAES <= 1'b1;
          r_dutState <= States_sExecute;
        end
        States_sExecute : begin
          r_dutState <= States_sExecute;
          if(r_aes_io_done) begin
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

module AES (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [127:0]  io_pt1,
  input      [127:0]  io_pt2,
  input      [127:0]  io_key1,
  input      [127:0]  io_key2,
  input      [759:0]  io_m,
  output     [127:0]  io_ct1,
  output     [127:0]  io_ct2,
  output reg          io_done
);
  localparam States_1_sIdle = 2'd0;
  localparam States_1_sExecute = 2'd1;
  localparam States_1_sFinalRound = 2'd2;
  localparam States_1_sDone = 2'd3;

  reg                 r_keyschedule_io_sampleInput;
  wire       [151:0]  r_keyschedule_io_m;
  wire       [607:0]  r_subbytes_io_mask;
  wire       [127:0]  r_keyschedule_io_keyOut1;
  wire       [127:0]  r_keyschedule_io_keyOut2;
  wire       [127:0]  r_addroundkey1_io_arkOut;
  wire       [127:0]  r_addroundkey2_io_arkOut;
  wire       [127:0]  r_subbytes_io_sbOut1;
  wire       [127:0]  r_subbytes_io_sbOut2;
  wire       [127:0]  r_shiftrows1_io_shiftRowsOutput;
  wire       [127:0]  r_shiftrows2_io_shiftRowsOutput;
  wire       [127:0]  r_mixcolumns1_io_mcOut;
  wire       [127:0]  r_mixcolumns2_io_mcOut;
  wire       [3:0]    _zz_r_roundCounter_valueNext;
  wire       [0:0]    _zz_r_roundCounter_valueNext_1;
  wire       [2:0]    _zz_r_smallCtr_valueNext;
  wire       [0:0]    _zz_r_smallCtr_valueNext_1;
  wire       [7:0]    _zz_r_roundConstant;
  reg        [127:0]  r_stateReg1;
  reg        [127:0]  r_stateReg2;
  reg        [127:0]  r_keyReg1;
  reg        [127:0]  r_keyReg2;
  reg        [7:0]    r_roundConstant;
  reg                 r_roundCounter_willIncrement;
  reg                 r_roundCounter_willClear;
  reg        [3:0]    r_roundCounter_valueNext;
  reg        [3:0]    r_roundCounter_value;
  wire                r_roundCounter_willOverflowIfInc;
  wire                r_roundCounter_willOverflow;
  reg                 r_smallCtr_willIncrement;
  wire                r_smallCtr_willClear;
  reg        [2:0]    r_smallCtr_valueNext;
  reg        [2:0]    r_smallCtr_value;
  wire                r_smallCtr_willOverflowIfInc;
  wire                r_smallCtr_willOverflow;
  wire       [127:0]  r_key;
  wire       [127:0]  r_state;
  wire       [127:0]  r_addroundkey;
  wire       [127:0]  r_subs;
  wire       [127:0]  r_shiftrows;
  wire       [127:0]  r_mixcolumns;
  wire                when_AES_l77;
  reg        [1:0]    r_aesState;
  wire                when_AES_l106;
  wire                when_AES_l111;
  `ifndef SYNTHESIS
  reg [87:0] r_aesState_string;
  `endif


  assign _zz_r_roundCounter_valueNext_1 = r_roundCounter_willIncrement;
  assign _zz_r_roundCounter_valueNext = {3'd0, _zz_r_roundCounter_valueNext_1};
  assign _zz_r_smallCtr_valueNext_1 = r_smallCtr_willIncrement;
  assign _zz_r_smallCtr_valueNext = {2'd0, _zz_r_smallCtr_valueNext_1};
  assign _zz_r_roundConstant = (r_roundConstant <<< 1);
  KeySchedule r_keyschedule (
    .io_clk              (io_clk                           ), //i
    .io_reset            (io_reset                         ), //i
    .io_sampleInput      (r_keyschedule_io_sampleInput     ), //i
    .io_keyIn1           (r_keyReg1[127:0]                 ), //i
    .io_keyIn2           (r_keyReg2[127:0]                 ), //i
    .io_roundConstant    (r_roundConstant[7:0]             ), //i
    .io_m                (r_keyschedule_io_m[151:0]        ), //i
    .io_keyOut1          (r_keyschedule_io_keyOut1[127:0]  ), //o
    .io_keyOut2          (r_keyschedule_io_keyOut2[127:0]  )  //o
  );
  AddRoundKey r_addroundkey1 (
    .io_arkIn     (r_stateReg1[127:0]               ), //i
    .io_key       (r_keyReg1[127:0]                 ), //i
    .io_arkOut    (r_addroundkey1_io_arkOut[127:0]  )  //o
  );
  AddRoundKey r_addroundkey2 (
    .io_arkIn     (r_stateReg2[127:0]               ), //i
    .io_key       (r_keyReg2[127:0]                 ), //i
    .io_arkOut    (r_addroundkey2_io_arkOut[127:0]  )  //o
  );
  SubBytes r_subbytes (
    .io_clk       (io_clk                           ), //i
    .io_reset     (io_reset                         ), //i
    .io_sbIn1     (r_addroundkey1_io_arkOut[127:0]  ), //i
    .io_sbIn2     (r_addroundkey2_io_arkOut[127:0]  ), //i
    .io_mask      (r_subbytes_io_mask[607:0]        ), //i
    .io_sbOut1    (r_subbytes_io_sbOut1[127:0]      ), //o
    .io_sbOut2    (r_subbytes_io_sbOut2[127:0]      )  //o
  );
  ShiftRows r_shiftrows1 (
    .io_shiftRowsInput     (r_subbytes_io_sbOut1[127:0]             ), //i
    .io_shiftRowsOutput    (r_shiftrows1_io_shiftRowsOutput[127:0]  )  //o
  );
  ShiftRows r_shiftrows2 (
    .io_shiftRowsInput     (r_subbytes_io_sbOut2[127:0]             ), //i
    .io_shiftRowsOutput    (r_shiftrows2_io_shiftRowsOutput[127:0]  )  //o
  );
  MixColumns r_mixcolumns1 (
    .io_mcIn     (r_shiftrows1_io_shiftRowsOutput[127:0]  ), //i
    .io_mcOut    (r_mixcolumns1_io_mcOut[127:0]           )  //o
  );
  MixColumns r_mixcolumns2 (
    .io_mcIn     (r_shiftrows2_io_shiftRowsOutput[127:0]  ), //i
    .io_mcOut    (r_mixcolumns2_io_mcOut[127:0]           )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_aesState)
      States_1_sIdle : r_aesState_string = "sIdle      ";
      States_1_sExecute : r_aesState_string = "sExecute   ";
      States_1_sFinalRound : r_aesState_string = "sFinalRound";
      States_1_sDone : r_aesState_string = "sDone      ";
      default : r_aesState_string = "???????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(r_aesState)
      States_1_sDone : begin
        io_done = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willIncrement = 1'b0;
    case(r_aesState)
      States_1_sExecute : begin
        if(r_smallCtr_willOverflow) begin
          r_roundCounter_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willClear = 1'b0;
    case(r_aesState)
      States_1_sIdle : begin
        r_roundCounter_willClear = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign r_roundCounter_willOverflowIfInc = (r_roundCounter_value == 4'b1010);
  assign r_roundCounter_willOverflow = (r_roundCounter_willOverflowIfInc && r_roundCounter_willIncrement);
  always @(*) begin
    if(r_roundCounter_willOverflow) begin
      r_roundCounter_valueNext = 4'b0001;
    end else begin
      r_roundCounter_valueNext = (r_roundCounter_value + _zz_r_roundCounter_valueNext);
    end
    if(r_roundCounter_willClear) begin
      r_roundCounter_valueNext = 4'b0001;
    end
  end

  always @(*) begin
    r_smallCtr_willIncrement = 1'b0;
    case(r_aesState)
      States_1_sExecute : begin
        r_smallCtr_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign r_smallCtr_willClear = 1'b0;
  assign r_smallCtr_willOverflowIfInc = (r_smallCtr_value == 3'b100);
  assign r_smallCtr_willOverflow = (r_smallCtr_willOverflowIfInc && r_smallCtr_willIncrement);
  always @(*) begin
    if(r_smallCtr_willOverflow) begin
      r_smallCtr_valueNext = 3'b000;
    end else begin
      r_smallCtr_valueNext = (r_smallCtr_value + _zz_r_smallCtr_valueNext);
    end
    if(r_smallCtr_willClear) begin
      r_smallCtr_valueNext = 3'b000;
    end
  end

  assign r_key = (r_keyReg1 ^ r_keyReg2);
  assign r_state = (r_stateReg1 ^ r_stateReg2);
  always @(*) begin
    r_keyschedule_io_sampleInput = 1'b0;
    case(r_aesState)
      States_1_sExecute : begin
        if(when_AES_l106) begin
          r_keyschedule_io_sampleInput = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  assign r_keyschedule_io_m = io_m[759 : 608];
  assign r_addroundkey = (r_addroundkey1_io_arkOut ^ r_addroundkey2_io_arkOut);
  assign r_subbytes_io_mask = io_m[607 : 0];
  assign r_subs = (r_subbytes_io_sbOut1 ^ r_subbytes_io_sbOut2);
  assign r_shiftrows = (r_shiftrows1_io_shiftRowsOutput ^ r_shiftrows2_io_shiftRowsOutput);
  assign r_mixcolumns = (r_mixcolumns1_io_mcOut ^ r_mixcolumns2_io_mcOut);
  assign when_AES_l77 = (r_roundCounter_value == 4'b1010);
  assign io_ct1 = r_addroundkey1_io_arkOut;
  assign io_ct2 = r_addroundkey2_io_arkOut;
  assign when_AES_l106 = (r_smallCtr_value == 3'b000);
  assign when_AES_l111 = (r_roundConstant < 8'h80);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_stateReg1 <= 128'h0;
      r_stateReg2 <= 128'h0;
      r_keyReg1 <= 128'h0;
      r_keyReg2 <= 128'h0;
      r_roundConstant <= 8'h01;
      r_roundCounter_value <= 4'b0001;
      r_smallCtr_value <= 3'b000;
      r_aesState <= States_1_sIdle;
    end else begin
      r_roundCounter_value <= r_roundCounter_valueNext;
      r_smallCtr_value <= r_smallCtr_valueNext;
      r_keyReg1 <= r_keyschedule_io_keyOut1;
      r_keyReg2 <= r_keyschedule_io_keyOut2;
      r_stateReg1 <= r_mixcolumns1_io_mcOut;
      r_stateReg2 <= r_mixcolumns2_io_mcOut;
      if(when_AES_l77) begin
        r_stateReg1 <= r_shiftrows1_io_shiftRowsOutput;
        r_stateReg2 <= r_shiftrows2_io_shiftRowsOutput;
      end
      case(r_aesState)
        States_1_sIdle : begin
          if(io_enable) begin
            r_aesState <= States_1_sExecute;
            r_keyReg1 <= io_key1;
            r_keyReg2 <= io_key2;
            r_stateReg1 <= io_pt1;
            r_stateReg2 <= io_pt2;
          end
        end
        States_1_sExecute : begin
          if(r_smallCtr_willOverflow) begin
            if(when_AES_l111) begin
              r_roundConstant <= (r_roundConstant <<< 1);
            end else begin
              r_roundConstant <= (_zz_r_roundConstant ^ 8'h1b);
            end
          end
          if(r_roundCounter_willOverflow) begin
            r_aesState <= States_1_sDone;
          end
        end
        default : begin
        end
      endcase
    end
  end


endmodule

//MixColumns replaced by MixColumns

module MixColumns (
  input      [127:0]  io_mcIn,
  output reg [127:0]  io_mcOut
);

  wire       [31:0]   mixColumn_8_io_mixColumnsInput;
  wire       [31:0]   mixColumn_9_io_mixColumnsInput;
  wire       [31:0]   mixColumn_10_io_mixColumnsInput;
  wire       [31:0]   mixColumn_11_io_mixColumnsInput;
  wire       [31:0]   mixColumn_8_io_mixColumnsOutput;
  wire       [31:0]   mixColumn_9_io_mixColumnsOutput;
  wire       [31:0]   mixColumn_10_io_mixColumnsOutput;
  wire       [31:0]   mixColumn_11_io_mixColumnsOutput;

  MixColumn mixColumn_8 (
    .io_mixColumnsInput     (mixColumn_8_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumn_8_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumn mixColumn_9 (
    .io_mixColumnsInput     (mixColumn_9_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumn_9_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumn mixColumn_10 (
    .io_mixColumnsInput     (mixColumn_10_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumn_10_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumn mixColumn_11 (
    .io_mixColumnsInput     (mixColumn_11_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumn_11_io_mixColumnsOutput[31:0]  )  //o
  );
  assign mixColumn_8_io_mixColumnsInput = io_mcIn[127 : 96];
  always @(*) begin
    io_mcOut[127 : 96] = mixColumn_8_io_mixColumnsOutput;
    io_mcOut[95 : 64] = mixColumn_9_io_mixColumnsOutput;
    io_mcOut[63 : 32] = mixColumn_10_io_mixColumnsOutput;
    io_mcOut[31 : 0] = mixColumn_11_io_mixColumnsOutput;
  end

  assign mixColumn_9_io_mixColumnsInput = io_mcIn[95 : 64];
  assign mixColumn_10_io_mixColumnsInput = io_mcIn[63 : 32];
  assign mixColumn_11_io_mixColumnsInput = io_mcIn[31 : 0];

endmodule

//ShiftRows replaced by ShiftRows

module ShiftRows (
  input      [127:0]  io_shiftRowsInput,
  output     [127:0]  io_shiftRowsOutput
);


  assign io_shiftRowsOutput = {{{{{{{{{{{{{{{io_shiftRowsInput[127 : 120],io_shiftRowsInput[87 : 80]},io_shiftRowsInput[47 : 40]},io_shiftRowsInput[7 : 0]},io_shiftRowsInput[95 : 88]},io_shiftRowsInput[55 : 48]},io_shiftRowsInput[15 : 8]},io_shiftRowsInput[103 : 96]},io_shiftRowsInput[63 : 56]},io_shiftRowsInput[23 : 16]},io_shiftRowsInput[111 : 104]},io_shiftRowsInput[71 : 64]},io_shiftRowsInput[31 : 24]},io_shiftRowsInput[119 : 112]},io_shiftRowsInput[79 : 72]},io_shiftRowsInput[39 : 32]};

endmodule

module SubBytes (
  input               io_clk,
  input               io_reset,
  input      [127:0]  io_sbIn1,
  input      [127:0]  io_sbIn2,
  input      [607:0]  io_mask,
  output reg [127:0]  io_sbOut1,
  output reg [127:0]  io_sbOut2
);

  wire       [15:0]   sBox_20_io_sbox_in;
  wire       [37:0]   sBox_20_io_mask;
  wire       [15:0]   sBox_21_io_sbox_in;
  wire       [37:0]   sBox_21_io_mask;
  wire       [15:0]   sBox_22_io_sbox_in;
  wire       [37:0]   sBox_22_io_mask;
  wire       [15:0]   sBox_23_io_sbox_in;
  wire       [37:0]   sBox_23_io_mask;
  wire       [15:0]   sBox_24_io_sbox_in;
  wire       [37:0]   sBox_24_io_mask;
  wire       [15:0]   sBox_25_io_sbox_in;
  wire       [37:0]   sBox_25_io_mask;
  wire       [15:0]   sBox_26_io_sbox_in;
  wire       [37:0]   sBox_26_io_mask;
  wire       [15:0]   sBox_27_io_sbox_in;
  wire       [37:0]   sBox_27_io_mask;
  wire       [15:0]   sBox_28_io_sbox_in;
  wire       [37:0]   sBox_28_io_mask;
  wire       [15:0]   sBox_29_io_sbox_in;
  wire       [37:0]   sBox_29_io_mask;
  wire       [15:0]   sBox_30_io_sbox_in;
  wire       [37:0]   sBox_30_io_mask;
  wire       [15:0]   sBox_31_io_sbox_in;
  wire       [37:0]   sBox_31_io_mask;
  wire       [15:0]   sBox_32_io_sbox_in;
  wire       [37:0]   sBox_32_io_mask;
  wire       [15:0]   sBox_33_io_sbox_in;
  wire       [37:0]   sBox_33_io_mask;
  wire       [15:0]   sBox_34_io_sbox_in;
  wire       [37:0]   sBox_34_io_mask;
  wire       [15:0]   sBox_35_io_sbox_in;
  wire       [37:0]   sBox_35_io_mask;
  wire       [15:0]   sBox_20_io_sbox_out;
  wire       [15:0]   sBox_21_io_sbox_out;
  wire       [15:0]   sBox_22_io_sbox_out;
  wire       [15:0]   sBox_23_io_sbox_out;
  wire       [15:0]   sBox_24_io_sbox_out;
  wire       [15:0]   sBox_25_io_sbox_out;
  wire       [15:0]   sBox_26_io_sbox_out;
  wire       [15:0]   sBox_27_io_sbox_out;
  wire       [15:0]   sBox_28_io_sbox_out;
  wire       [15:0]   sBox_29_io_sbox_out;
  wire       [15:0]   sBox_30_io_sbox_out;
  wire       [15:0]   sBox_31_io_sbox_out;
  wire       [15:0]   sBox_32_io_sbox_out;
  wire       [15:0]   sBox_33_io_sbox_out;
  wire       [15:0]   sBox_34_io_sbox_out;
  wire       [15:0]   sBox_35_io_sbox_out;

  SBox sBox_20 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_20_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_20_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_20_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_21 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_21_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_21_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_21_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_22 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_22_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_22_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_22_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_23 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_23_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_23_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_23_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_24 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_24_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_24_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_24_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_25 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_25_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_25_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_25_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_26 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_26_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_26_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_26_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_27 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_27_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_27_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_27_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_28 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_28_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_28_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_28_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_29 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_29_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_29_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_29_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_30 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_30_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_30_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_30_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_31 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_31_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_31_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_31_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_32 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_32_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_32_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_32_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_33 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_33_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_33_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_33_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_34 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_34_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_34_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_34_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_35 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_35_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_35_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_35_io_sbox_out[15:0]  )  //o
  );
  assign sBox_20_io_sbox_in = {io_sbIn1[127 : 120],io_sbIn2[127 : 120]};
  assign sBox_20_io_mask = io_mask[607 : 570];
  always @(*) begin
    io_sbOut1[127 : 120] = sBox_20_io_sbox_out[15 : 8];
    io_sbOut1[119 : 112] = sBox_21_io_sbox_out[15 : 8];
    io_sbOut1[111 : 104] = sBox_22_io_sbox_out[15 : 8];
    io_sbOut1[103 : 96] = sBox_23_io_sbox_out[15 : 8];
    io_sbOut1[95 : 88] = sBox_24_io_sbox_out[15 : 8];
    io_sbOut1[87 : 80] = sBox_25_io_sbox_out[15 : 8];
    io_sbOut1[79 : 72] = sBox_26_io_sbox_out[15 : 8];
    io_sbOut1[71 : 64] = sBox_27_io_sbox_out[15 : 8];
    io_sbOut1[63 : 56] = sBox_28_io_sbox_out[15 : 8];
    io_sbOut1[55 : 48] = sBox_29_io_sbox_out[15 : 8];
    io_sbOut1[47 : 40] = sBox_30_io_sbox_out[15 : 8];
    io_sbOut1[39 : 32] = sBox_31_io_sbox_out[15 : 8];
    io_sbOut1[31 : 24] = sBox_32_io_sbox_out[15 : 8];
    io_sbOut1[23 : 16] = sBox_33_io_sbox_out[15 : 8];
    io_sbOut1[15 : 8] = sBox_34_io_sbox_out[15 : 8];
    io_sbOut1[7 : 0] = sBox_35_io_sbox_out[15 : 8];
  end

  always @(*) begin
    io_sbOut2[127 : 120] = sBox_20_io_sbox_out[7 : 0];
    io_sbOut2[119 : 112] = sBox_21_io_sbox_out[7 : 0];
    io_sbOut2[111 : 104] = sBox_22_io_sbox_out[7 : 0];
    io_sbOut2[103 : 96] = sBox_23_io_sbox_out[7 : 0];
    io_sbOut2[95 : 88] = sBox_24_io_sbox_out[7 : 0];
    io_sbOut2[87 : 80] = sBox_25_io_sbox_out[7 : 0];
    io_sbOut2[79 : 72] = sBox_26_io_sbox_out[7 : 0];
    io_sbOut2[71 : 64] = sBox_27_io_sbox_out[7 : 0];
    io_sbOut2[63 : 56] = sBox_28_io_sbox_out[7 : 0];
    io_sbOut2[55 : 48] = sBox_29_io_sbox_out[7 : 0];
    io_sbOut2[47 : 40] = sBox_30_io_sbox_out[7 : 0];
    io_sbOut2[39 : 32] = sBox_31_io_sbox_out[7 : 0];
    io_sbOut2[31 : 24] = sBox_32_io_sbox_out[7 : 0];
    io_sbOut2[23 : 16] = sBox_33_io_sbox_out[7 : 0];
    io_sbOut2[15 : 8] = sBox_34_io_sbox_out[7 : 0];
    io_sbOut2[7 : 0] = sBox_35_io_sbox_out[7 : 0];
  end

  assign sBox_21_io_sbox_in = {io_sbIn1[119 : 112],io_sbIn2[119 : 112]};
  assign sBox_21_io_mask = io_mask[569 : 532];
  assign sBox_22_io_sbox_in = {io_sbIn1[111 : 104],io_sbIn2[111 : 104]};
  assign sBox_22_io_mask = io_mask[531 : 494];
  assign sBox_23_io_sbox_in = {io_sbIn1[103 : 96],io_sbIn2[103 : 96]};
  assign sBox_23_io_mask = io_mask[493 : 456];
  assign sBox_24_io_sbox_in = {io_sbIn1[95 : 88],io_sbIn2[95 : 88]};
  assign sBox_24_io_mask = io_mask[455 : 418];
  assign sBox_25_io_sbox_in = {io_sbIn1[87 : 80],io_sbIn2[87 : 80]};
  assign sBox_25_io_mask = io_mask[417 : 380];
  assign sBox_26_io_sbox_in = {io_sbIn1[79 : 72],io_sbIn2[79 : 72]};
  assign sBox_26_io_mask = io_mask[379 : 342];
  assign sBox_27_io_sbox_in = {io_sbIn1[71 : 64],io_sbIn2[71 : 64]};
  assign sBox_27_io_mask = io_mask[341 : 304];
  assign sBox_28_io_sbox_in = {io_sbIn1[63 : 56],io_sbIn2[63 : 56]};
  assign sBox_28_io_mask = io_mask[303 : 266];
  assign sBox_29_io_sbox_in = {io_sbIn1[55 : 48],io_sbIn2[55 : 48]};
  assign sBox_29_io_mask = io_mask[265 : 228];
  assign sBox_30_io_sbox_in = {io_sbIn1[47 : 40],io_sbIn2[47 : 40]};
  assign sBox_30_io_mask = io_mask[227 : 190];
  assign sBox_31_io_sbox_in = {io_sbIn1[39 : 32],io_sbIn2[39 : 32]};
  assign sBox_31_io_mask = io_mask[189 : 152];
  assign sBox_32_io_sbox_in = {io_sbIn1[31 : 24],io_sbIn2[31 : 24]};
  assign sBox_32_io_mask = io_mask[151 : 114];
  assign sBox_33_io_sbox_in = {io_sbIn1[23 : 16],io_sbIn2[23 : 16]};
  assign sBox_33_io_mask = io_mask[113 : 76];
  assign sBox_34_io_sbox_in = {io_sbIn1[15 : 8],io_sbIn2[15 : 8]};
  assign sBox_34_io_mask = io_mask[75 : 38];
  assign sBox_35_io_sbox_in = {io_sbIn1[7 : 0],io_sbIn2[7 : 0]};
  assign sBox_35_io_mask = io_mask[37 : 0];

endmodule

//AddRoundKey replaced by AddRoundKey

module AddRoundKey (
  input      [127:0]  io_arkIn,
  input      [127:0]  io_key,
  output     [127:0]  io_arkOut
);


  assign io_arkOut = (io_arkIn ^ io_key);

endmodule

module KeySchedule (
  input               io_clk,
  input               io_reset,
  input               io_sampleInput,
  input      [127:0]  io_keyIn1,
  input      [127:0]  io_keyIn2,
  input      [7:0]    io_roundConstant,
  input      [151:0]  io_m,
  output     [127:0]  io_keyOut1,
  output     [127:0]  io_keyOut2
);

  wire       [15:0]   sBox_20_io_sbox_in;
  wire       [37:0]   sBox_20_io_mask;
  wire       [15:0]   sBox_21_io_sbox_in;
  wire       [37:0]   sBox_21_io_mask;
  wire       [15:0]   sBox_22_io_sbox_in;
  wire       [37:0]   sBox_22_io_mask;
  wire       [15:0]   sBox_23_io_sbox_in;
  wire       [37:0]   sBox_23_io_mask;
  wire       [15:0]   sBox_20_io_sbox_out;
  wire       [15:0]   sBox_21_io_sbox_out;
  wire       [15:0]   sBox_22_io_sbox_out;
  wire       [15:0]   sBox_23_io_sbox_out;
  reg        [127:0]  r_reg1;
  reg        [127:0]  r_reg2;
  wire       [31:0]   r_w00;
  wire       [31:0]   r_w01;
  wire       [31:0]   r_w10;
  wire       [31:0]   r_w11;
  wire       [31:0]   r_w20;
  wire       [31:0]   r_w21;
  wire       [31:0]   r_w30;
  wire       [31:0]   r_w31;
  wire       [31:0]   r_rc;
  reg        [31:0]   r_sBoxOut0;
  reg        [31:0]   r_sBoxOut1;

  SBox sBox_20 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_20_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_20_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_20_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_21 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_21_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_21_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_21_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_22 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_22_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_22_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_22_io_sbox_out[15:0]  )  //o
  );
  SBox sBox_23 (
    .io_clk         (io_clk                     ), //i
    .io_reset       (io_reset                   ), //i
    .io_sbox_in     (sBox_23_io_sbox_in[15:0]   ), //i
    .io_mask        (sBox_23_io_mask[37:0]      ), //i
    .io_sbox_out    (sBox_23_io_sbox_out[15:0]  )  //o
  );
  assign sBox_20_io_sbox_in = {io_keyIn1[31 : 24],io_keyIn2[31 : 24]};
  assign sBox_20_io_mask = io_m[151 : 114];
  always @(*) begin
    r_sBoxOut0[31 : 24] = sBox_20_io_sbox_out[15 : 8];
    r_sBoxOut0[23 : 16] = sBox_21_io_sbox_out[15 : 8];
    r_sBoxOut0[15 : 8] = sBox_22_io_sbox_out[15 : 8];
    r_sBoxOut0[7 : 0] = sBox_23_io_sbox_out[15 : 8];
  end

  always @(*) begin
    r_sBoxOut1[31 : 24] = sBox_20_io_sbox_out[7 : 0];
    r_sBoxOut1[23 : 16] = sBox_21_io_sbox_out[7 : 0];
    r_sBoxOut1[15 : 8] = sBox_22_io_sbox_out[7 : 0];
    r_sBoxOut1[7 : 0] = sBox_23_io_sbox_out[7 : 0];
  end

  assign sBox_21_io_sbox_in = {io_keyIn1[23 : 16],io_keyIn2[23 : 16]};
  assign sBox_21_io_mask = io_m[113 : 76];
  assign sBox_22_io_sbox_in = {io_keyIn1[15 : 8],io_keyIn2[15 : 8]};
  assign sBox_22_io_mask = io_m[75 : 38];
  assign sBox_23_io_sbox_in = {io_keyIn1[7 : 0],io_keyIn2[7 : 0]};
  assign sBox_23_io_mask = io_m[37 : 0];
  assign r_rc = ({24'd0,io_roundConstant} <<< 24);
  assign r_w00 = ((r_reg1[127 : 96] ^ {r_sBoxOut0[23 : 0],r_sBoxOut0[31 : 24]}) ^ r_rc);
  assign r_w01 = (r_reg2[127 : 96] ^ {r_sBoxOut1[23 : 0],r_sBoxOut1[31 : 24]});
  assign r_w10 = (r_reg1[95 : 64] ^ r_w00);
  assign r_w11 = (r_reg2[95 : 64] ^ r_w01);
  assign r_w20 = (r_reg1[63 : 32] ^ r_w10);
  assign r_w21 = (r_reg2[63 : 32] ^ r_w11);
  assign r_w30 = (r_reg1[31 : 0] ^ r_w20);
  assign r_w31 = (r_reg2[31 : 0] ^ r_w21);
  assign io_keyOut1 = {{{r_w00,r_w10},r_w20},r_w30};
  assign io_keyOut2 = {{{r_w01,r_w11},r_w21},r_w31};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_reg1 <= 128'h0;
      r_reg2 <= 128'h0;
    end else begin
      if(io_sampleInput) begin
        r_reg1 <= io_keyIn1;
        r_reg2 <= io_keyIn2;
      end
    end
  end


endmodule

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

//MixColumn replaced by MixColumn

module MixColumn (
  input      [31:0]   io_mixColumnsInput,
  output reg [31:0]   io_mixColumnsOutput
);

  wire       [8:0]    _zz__zz_io_mixColumnsOutput;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_1;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_2;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_3;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_4;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_5;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_6;
  wire       [8:0]    _zz__zz_io_mixColumnsOutput_7;
  wire       [7:0]    a1;
  wire       [7:0]    a2;
  wire       [7:0]    a3;
  wire       [7:0]    a0;
  reg        [8:0]    _zz_io_mixColumnsOutput;
  wire                when_MixColumn_l20;
  reg        [8:0]    _zz_io_mixColumnsOutput_1;
  wire                when_MixColumn_l20_1;
  reg        [8:0]    _zz_io_mixColumnsOutput_2;
  wire                when_MixColumn_l20_2;
  reg        [8:0]    _zz_io_mixColumnsOutput_3;
  wire                when_MixColumn_l20_3;
  reg        [8:0]    _zz_io_mixColumnsOutput_4;
  wire                when_MixColumn_l20_4;
  reg        [8:0]    _zz_io_mixColumnsOutput_5;
  wire                when_MixColumn_l20_5;
  reg        [8:0]    _zz_io_mixColumnsOutput_6;
  wire                when_MixColumn_l20_6;
  reg        [8:0]    _zz_io_mixColumnsOutput_7;
  wire                when_MixColumn_l20_7;

  assign _zz__zz_io_mixColumnsOutput = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_1 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_2 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_3 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_4 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_5 = ({1'd0,a3} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_6 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mixColumnsOutput_7 = ({1'd0,a3} <<< 1);
  assign a0 = io_mixColumnsInput[31 : 24];
  assign a1 = io_mixColumnsInput[23 : 16];
  assign a2 = io_mixColumnsInput[15 : 8];
  assign a3 = io_mixColumnsInput[7 : 0];
  assign when_MixColumn_l20 = a0[7];
  always @(*) begin
    if(when_MixColumn_l20) begin
      _zz_io_mixColumnsOutput = (_zz__zz_io_mixColumnsOutput ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumn_l20_1 = a1[7];
  always @(*) begin
    if(when_MixColumn_l20_1) begin
      _zz_io_mixColumnsOutput_1 = (_zz__zz_io_mixColumnsOutput_1 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_1 = ({1'd0,a1} <<< 1);
    end
  end

  always @(*) begin
    io_mixColumnsOutput[31 : 24] = (((_zz_io_mixColumnsOutput[7 : 0] ^ (_zz_io_mixColumnsOutput_1[7 : 0] ^ a1)) ^ a2) ^ a3);
    io_mixColumnsOutput[23 : 16] = (((a0 ^ _zz_io_mixColumnsOutput_2[7 : 0]) ^ (_zz_io_mixColumnsOutput_3[7 : 0] ^ a2)) ^ a3);
    io_mixColumnsOutput[15 : 8] = (((a0 ^ a1) ^ _zz_io_mixColumnsOutput_4[7 : 0]) ^ (_zz_io_mixColumnsOutput_5[7 : 0] ^ a3));
    io_mixColumnsOutput[7 : 0] = ((((_zz_io_mixColumnsOutput_6[7 : 0] ^ a0) ^ a1) ^ a2) ^ _zz_io_mixColumnsOutput_7[7 : 0]);
  end

  assign when_MixColumn_l20_2 = a1[7];
  always @(*) begin
    if(when_MixColumn_l20_2) begin
      _zz_io_mixColumnsOutput_2 = (_zz__zz_io_mixColumnsOutput_2 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumn_l20_3 = a2[7];
  always @(*) begin
    if(when_MixColumn_l20_3) begin
      _zz_io_mixColumnsOutput_3 = (_zz__zz_io_mixColumnsOutput_3 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumn_l20_4 = a2[7];
  always @(*) begin
    if(when_MixColumn_l20_4) begin
      _zz_io_mixColumnsOutput_4 = (_zz__zz_io_mixColumnsOutput_4 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_4 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumn_l20_5 = a3[7];
  always @(*) begin
    if(when_MixColumn_l20_5) begin
      _zz_io_mixColumnsOutput_5 = (_zz__zz_io_mixColumnsOutput_5 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_5 = ({1'd0,a3} <<< 1);
    end
  end

  assign when_MixColumn_l20_6 = a0[7];
  always @(*) begin
    if(when_MixColumn_l20_6) begin
      _zz_io_mixColumnsOutput_6 = (_zz__zz_io_mixColumnsOutput_6 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_6 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumn_l20_7 = a3[7];
  always @(*) begin
    if(when_MixColumn_l20_7) begin
      _zz_io_mixColumnsOutput_7 = (_zz__zz_io_mixColumnsOutput_7 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_7 = ({1'd0,a3} <<< 1);
    end
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

module SBox (
  input               io_clk,
  input               io_reset,
  input      [15:0]   io_sbox_in,
  input      [37:0]   io_mask,
  output     [15:0]   io_sbox_out
);

  wire       [15:0]   sb1_sbox_out;

  aes_sbox_wrapper sb1 (
    .clk         (io_clk              ), //i
    .reset       (io_reset            ), //i
    .sbox_in     (io_sbox_in[15:0]    ), //i
    .mask        (io_mask[37:0]       ), //i
    .sbox_out    (sb1_sbox_out[15:0]  )  //o
  );
  assign io_sbox_out = sb1_sbox_out;

endmodule
