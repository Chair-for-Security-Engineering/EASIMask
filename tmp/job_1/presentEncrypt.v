// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : presentEncrypt
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module presentEncrypt (
  input               io_enable,
  input      [63:0]   io_plaintext,
  input      [79:0]   io_key,
  output reg [63:0]   io_ciphertext,
  output reg          io_done,
  input               clk,
  input               reset
);
  localparam fsm_enumDef_BOOT = 2'd0;
  localparam fsm_enumDef_sIdle = 2'd1;
  localparam fsm_enumDef_sExecute = 2'd2;
  localparam fsm_enumDef_sDone = 2'd3;

  wire       [63:0]   addroundkey_1_io_stateOut;
  wire       [79:0]   updatekey_1_io_keyOut;
  wire       [63:0]   sboxlayer_1_io_stateOut;
  wire       [63:0]   permutation_1_io_stateOut;
  wire       [4:0]    _zz_ctr_valueNext;
  wire       [0:0]    _zz_ctr_valueNext_1;
  reg        [63:0]   state;
  reg        [79:0]   keyReg;
  wire       [63:0]   roundKey;
  reg                 ctr_willIncrement;
  reg                 ctr_willClear;
  reg        [4:0]    ctr_valueNext;
  reg        [4:0]    ctr_value;
  wire                ctr_willOverflowIfInc;
  wire                ctr_willOverflow;
  wire                fsm_wantExit;
  reg                 fsm_wantStart;
  wire                fsm_wantKill;
  reg        [1:0]    fsm_stateReg;
  reg        [1:0]    fsm_stateNext;
  wire                when_StateMachine_l219;
  `ifndef SYNTHESIS
  reg [63:0] fsm_stateReg_string;
  reg [63:0] fsm_stateNext_string;
  `endif


  assign _zz_ctr_valueNext_1 = ctr_willIncrement;
  assign _zz_ctr_valueNext = {4'd0, _zz_ctr_valueNext_1};
  addRoundKey addroundkey_1 (
    .io_stateIn     (state[63:0]                      ), //i
    .io_key         (roundKey[63:0]                   ), //i
    .io_stateOut    (addroundkey_1_io_stateOut[63:0]  )  //o
  );
  updateKey updatekey_1 (
    .io_keyIn     (keyReg[79:0]                 ), //i
    .io_round     (ctr_value[4:0]               ), //i
    .io_keyOut    (updatekey_1_io_keyOut[79:0]  )  //o
  );
  sboxLayer sboxlayer_1 (
    .io_stateIn     (addroundkey_1_io_stateOut[63:0]  ), //i
    .io_stateOut    (sboxlayer_1_io_stateOut[63:0]    )  //o
  );
  permutation permutation_1 (
    .io_stateIn     (sboxlayer_1_io_stateOut[63:0]    ), //i
    .io_stateOut    (permutation_1_io_stateOut[63:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(fsm_stateReg)
      fsm_enumDef_BOOT : fsm_stateReg_string = "BOOT    ";
      fsm_enumDef_sIdle : fsm_stateReg_string = "sIdle   ";
      fsm_enumDef_sExecute : fsm_stateReg_string = "sExecute";
      fsm_enumDef_sDone : fsm_stateReg_string = "sDone   ";
      default : fsm_stateReg_string = "????????";
    endcase
  end
  always @(*) begin
    case(fsm_stateNext)
      fsm_enumDef_BOOT : fsm_stateNext_string = "BOOT    ";
      fsm_enumDef_sIdle : fsm_stateNext_string = "sIdle   ";
      fsm_enumDef_sExecute : fsm_stateNext_string = "sExecute";
      fsm_enumDef_sDone : fsm_stateNext_string = "sDone   ";
      default : fsm_stateNext_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_ciphertext = 64'h0;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
      end
      fsm_enumDef_sExecute : begin
      end
      fsm_enumDef_sDone : begin
        io_ciphertext = addroundkey_1_io_stateOut;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    io_done = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
      end
      fsm_enumDef_sExecute : begin
      end
      fsm_enumDef_sDone : begin
        io_done = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctr_willIncrement = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
      end
      fsm_enumDef_sExecute : begin
        ctr_willIncrement = 1'b1;
      end
      fsm_enumDef_sDone : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctr_willClear = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
        ctr_willClear = 1'b1;
      end
      fsm_enumDef_sExecute : begin
      end
      fsm_enumDef_sDone : begin
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

  assign roundKey = keyReg[79 : 16];
  assign fsm_wantExit = 1'b0;
  always @(*) begin
    fsm_wantStart = 1'b0;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
      end
      fsm_enumDef_sExecute : begin
      end
      fsm_enumDef_sDone : begin
      end
      default : begin
        fsm_wantStart = 1'b1;
      end
    endcase
  end

  assign fsm_wantKill = 1'b0;
  always @(*) begin
    fsm_stateNext = fsm_stateReg;
    case(fsm_stateReg)
      fsm_enumDef_sIdle : begin
        if(io_enable) begin
          fsm_stateNext = fsm_enumDef_sExecute;
        end
      end
      fsm_enumDef_sExecute : begin
        if(ctr_willOverflow) begin
          fsm_stateNext = fsm_enumDef_sDone;
        end
      end
      fsm_enumDef_sDone : begin
      end
      default : begin
      end
    endcase
    if(fsm_wantStart) begin
      fsm_stateNext = fsm_enumDef_sIdle;
    end
    if(fsm_wantKill) begin
      fsm_stateNext = fsm_enumDef_BOOT;
    end
  end

  assign when_StateMachine_l219 = ((fsm_stateReg == fsm_enumDef_sIdle) && (! (fsm_stateNext == fsm_enumDef_sIdle)));
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 64'h0;
      keyReg <= 80'h0;
      ctr_value <= 5'h01;
      fsm_stateReg <= fsm_enumDef_BOOT;
    end else begin
      ctr_value <= ctr_valueNext;
      keyReg <= updatekey_1_io_keyOut;
      state <= permutation_1_io_stateOut;
      fsm_stateReg <= fsm_stateNext;
      if(when_StateMachine_l219) begin
        state <= io_plaintext;
        keyReg <= io_key;
      end
    end
  end


endmodule

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

module sboxLayer (
  input      [63:0]   io_stateIn,
  output reg [63:0]   io_stateOut
);

  wire       [3:0]    sBox_17_io_input;
  wire       [3:0]    sBox_18_io_input;
  wire       [3:0]    sBox_19_io_input;
  wire       [3:0]    sBox_20_io_input;
  wire       [3:0]    sBox_21_io_input;
  wire       [3:0]    sBox_22_io_input;
  wire       [3:0]    sBox_23_io_input;
  wire       [3:0]    sBox_24_io_input;
  wire       [3:0]    sBox_25_io_input;
  wire       [3:0]    sBox_26_io_input;
  wire       [3:0]    sBox_27_io_input;
  wire       [3:0]    sBox_28_io_input;
  wire       [3:0]    sBox_29_io_input;
  wire       [3:0]    sBox_30_io_input;
  wire       [3:0]    sBox_31_io_input;
  wire       [3:0]    sBox_32_io_input;
  wire       [3:0]    sBox_17_io_output;
  wire       [3:0]    sBox_18_io_output;
  wire       [3:0]    sBox_19_io_output;
  wire       [3:0]    sBox_20_io_output;
  wire       [3:0]    sBox_21_io_output;
  wire       [3:0]    sBox_22_io_output;
  wire       [3:0]    sBox_23_io_output;
  wire       [3:0]    sBox_24_io_output;
  wire       [3:0]    sBox_25_io_output;
  wire       [3:0]    sBox_26_io_output;
  wire       [3:0]    sBox_27_io_output;
  wire       [3:0]    sBox_28_io_output;
  wire       [3:0]    sBox_29_io_output;
  wire       [3:0]    sBox_30_io_output;
  wire       [3:0]    sBox_31_io_output;
  wire       [3:0]    sBox_32_io_output;

  SBox sBox_17 (
    .io_input     (sBox_17_io_input[3:0]   ), //i
    .io_output    (sBox_17_io_output[3:0]  )  //o
  );
  SBox sBox_18 (
    .io_input     (sBox_18_io_input[3:0]   ), //i
    .io_output    (sBox_18_io_output[3:0]  )  //o
  );
  SBox sBox_19 (
    .io_input     (sBox_19_io_input[3:0]   ), //i
    .io_output    (sBox_19_io_output[3:0]  )  //o
  );
  SBox sBox_20 (
    .io_input     (sBox_20_io_input[3:0]   ), //i
    .io_output    (sBox_20_io_output[3:0]  )  //o
  );
  SBox sBox_21 (
    .io_input     (sBox_21_io_input[3:0]   ), //i
    .io_output    (sBox_21_io_output[3:0]  )  //o
  );
  SBox sBox_22 (
    .io_input     (sBox_22_io_input[3:0]   ), //i
    .io_output    (sBox_22_io_output[3:0]  )  //o
  );
  SBox sBox_23 (
    .io_input     (sBox_23_io_input[3:0]   ), //i
    .io_output    (sBox_23_io_output[3:0]  )  //o
  );
  SBox sBox_24 (
    .io_input     (sBox_24_io_input[3:0]   ), //i
    .io_output    (sBox_24_io_output[3:0]  )  //o
  );
  SBox sBox_25 (
    .io_input     (sBox_25_io_input[3:0]   ), //i
    .io_output    (sBox_25_io_output[3:0]  )  //o
  );
  SBox sBox_26 (
    .io_input     (sBox_26_io_input[3:0]   ), //i
    .io_output    (sBox_26_io_output[3:0]  )  //o
  );
  SBox sBox_27 (
    .io_input     (sBox_27_io_input[3:0]   ), //i
    .io_output    (sBox_27_io_output[3:0]  )  //o
  );
  SBox sBox_28 (
    .io_input     (sBox_28_io_input[3:0]   ), //i
    .io_output    (sBox_28_io_output[3:0]  )  //o
  );
  SBox sBox_29 (
    .io_input     (sBox_29_io_input[3:0]   ), //i
    .io_output    (sBox_29_io_output[3:0]  )  //o
  );
  SBox sBox_30 (
    .io_input     (sBox_30_io_input[3:0]   ), //i
    .io_output    (sBox_30_io_output[3:0]  )  //o
  );
  SBox sBox_31 (
    .io_input     (sBox_31_io_input[3:0]   ), //i
    .io_output    (sBox_31_io_output[3:0]  )  //o
  );
  SBox sBox_32 (
    .io_input     (sBox_32_io_input[3:0]   ), //i
    .io_output    (sBox_32_io_output[3:0]  )  //o
  );
  assign sBox_17_io_input = io_stateIn[3 : 0];
  always @(*) begin
    io_stateOut[3 : 0] = sBox_17_io_output;
    io_stateOut[7 : 4] = sBox_18_io_output;
    io_stateOut[11 : 8] = sBox_19_io_output;
    io_stateOut[15 : 12] = sBox_20_io_output;
    io_stateOut[19 : 16] = sBox_21_io_output;
    io_stateOut[23 : 20] = sBox_22_io_output;
    io_stateOut[27 : 24] = sBox_23_io_output;
    io_stateOut[31 : 28] = sBox_24_io_output;
    io_stateOut[35 : 32] = sBox_25_io_output;
    io_stateOut[39 : 36] = sBox_26_io_output;
    io_stateOut[43 : 40] = sBox_27_io_output;
    io_stateOut[47 : 44] = sBox_28_io_output;
    io_stateOut[51 : 48] = sBox_29_io_output;
    io_stateOut[55 : 52] = sBox_30_io_output;
    io_stateOut[59 : 56] = sBox_31_io_output;
    io_stateOut[63 : 60] = sBox_32_io_output;
  end

  assign sBox_18_io_input = io_stateIn[7 : 4];
  assign sBox_19_io_input = io_stateIn[11 : 8];
  assign sBox_20_io_input = io_stateIn[15 : 12];
  assign sBox_21_io_input = io_stateIn[19 : 16];
  assign sBox_22_io_input = io_stateIn[23 : 20];
  assign sBox_23_io_input = io_stateIn[27 : 24];
  assign sBox_24_io_input = io_stateIn[31 : 28];
  assign sBox_25_io_input = io_stateIn[35 : 32];
  assign sBox_26_io_input = io_stateIn[39 : 36];
  assign sBox_27_io_input = io_stateIn[43 : 40];
  assign sBox_28_io_input = io_stateIn[47 : 44];
  assign sBox_29_io_input = io_stateIn[51 : 48];
  assign sBox_30_io_input = io_stateIn[55 : 52];
  assign sBox_31_io_input = io_stateIn[59 : 56];
  assign sBox_32_io_input = io_stateIn[63 : 60];

endmodule

module updateKey (
  input      [79:0]   io_keyIn,
  input      [4:0]    io_round,
  output     [79:0]   io_keyOut
);

  wire       [3:0]    sbox_17_io_input;
  wire       [3:0]    sbox_17_io_output;
  wire       [79:0]   k1;
  wire       [79:0]   k2;
  wire       [79:0]   k3;

  SBox sbox_17 (
    .io_input     (sbox_17_io_input[3:0]   ), //i
    .io_output    (sbox_17_io_output[3:0]  )  //o
  );
  assign sbox_17_io_input = k1[79 : 76];
  assign k1 = {io_keyIn[18 : 0],io_keyIn[79 : 19]};
  assign k2 = {sbox_17_io_output,k1[75 : 0]};
  assign k3 = {{k2[79 : 20],(k2[19 : 15] ^ io_round)},k2[14 : 0]};
  assign io_keyOut = k3;

endmodule

module addRoundKey (
  input      [63:0]   io_stateIn,
  input      [63:0]   io_key,
  output     [63:0]   io_stateOut
);


  assign io_stateOut = (io_stateIn ^ io_key);

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

module SBox (
  input      [3:0]    io_input,
  output reg [3:0]    io_output
);


  always @(*) begin
    case(io_input)
      4'b0000 : begin
        io_output = 4'b1100;
      end
      4'b0001 : begin
        io_output = 4'b0101;
      end
      4'b0010 : begin
        io_output = 4'b0110;
      end
      4'b0011 : begin
        io_output = 4'b1011;
      end
      4'b0100 : begin
        io_output = 4'b1001;
      end
      4'b0101 : begin
        io_output = 4'b0000;
      end
      4'b0110 : begin
        io_output = 4'b1010;
      end
      4'b0111 : begin
        io_output = 4'b1101;
      end
      4'b1000 : begin
        io_output = 4'b0011;
      end
      4'b1001 : begin
        io_output = 4'b1110;
      end
      4'b1010 : begin
        io_output = 4'b1111;
      end
      4'b1011 : begin
        io_output = 4'b1000;
      end
      4'b1100 : begin
        io_output = 4'b0100;
      end
      4'b1101 : begin
        io_output = 4'b0111;
      end
      4'b1110 : begin
        io_output = 4'b0001;
      end
      default : begin
        io_output = 4'b0010;
      end
    endcase
  end


endmodule
