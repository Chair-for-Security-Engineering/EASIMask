// Generator : SpinalHDL v1.6.2    git head : 47ae50d83f8f2535f984ba8e55c890dbe0ae9cc7
// Component : AESEncrypt
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module AESEncrypt (
  input               io_reset,
  input      [127:0]  io_plaintext,
  input      [127:0]  io_key,
  output     [127:0]  io_ciphertext,
  output reg          io_done,
  input               clk,
  input               reset
);

  reg        [127:0]  addRoundKey_1_io_addRoundKeyInput;
  reg        [127:0]  addRoundKey_1_io_roundKey;
  wire       [31:0]   mixColumns_4_io_mixColumnsInput;
  wire       [31:0]   mixColumns_5_io_mixColumnsInput;
  wire       [31:0]   mixColumns_6_io_mixColumnsInput;
  wire       [31:0]   mixColumns_7_io_mixColumnsInput;
  reg        [127:0]  keySchedule_1_io_keyScheduleInput;
  wire       [7:0]    subBytes_20_io_subBytesInput;
  wire       [7:0]    subBytes_21_io_subBytesInput;
  wire       [7:0]    subBytes_22_io_subBytesInput;
  wire       [7:0]    subBytes_23_io_subBytesInput;
  wire       [7:0]    subBytes_24_io_subBytesInput;
  wire       [7:0]    subBytes_25_io_subBytesInput;
  wire       [7:0]    subBytes_26_io_subBytesInput;
  wire       [7:0]    subBytes_27_io_subBytesInput;
  wire       [7:0]    subBytes_28_io_subBytesInput;
  wire       [7:0]    subBytes_29_io_subBytesInput;
  wire       [7:0]    subBytes_30_io_subBytesInput;
  wire       [7:0]    subBytes_31_io_subBytesInput;
  wire       [7:0]    subBytes_32_io_subBytesInput;
  wire       [7:0]    subBytes_33_io_subBytesInput;
  wire       [7:0]    subBytes_34_io_subBytesInput;
  wire       [7:0]    subBytes_35_io_subBytesInput;
  wire       [127:0]  addRoundKey_1_io_addRoundKeyOutput;
  wire       [127:0]  shiftRows_1_io_shiftRowsOutput;
  wire       [31:0]   mixColumns_4_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_5_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_6_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_7_io_mixColumnsOutput;
  wire       [127:0]  keySchedule_1_io_keyScheduleOutput;
  wire       [7:0]    subBytes_20_io_subBytesOutput;
  wire       [7:0]    subBytes_21_io_subBytesOutput;
  wire       [7:0]    subBytes_22_io_subBytesOutput;
  wire       [7:0]    subBytes_23_io_subBytesOutput;
  wire       [7:0]    subBytes_24_io_subBytesOutput;
  wire       [7:0]    subBytes_25_io_subBytesOutput;
  wire       [7:0]    subBytes_26_io_subBytesOutput;
  wire       [7:0]    subBytes_27_io_subBytesOutput;
  wire       [7:0]    subBytes_28_io_subBytesOutput;
  wire       [7:0]    subBytes_29_io_subBytesOutput;
  wire       [7:0]    subBytes_30_io_subBytesOutput;
  wire       [7:0]    subBytes_31_io_subBytesOutput;
  wire       [7:0]    subBytes_32_io_subBytesOutput;
  wire       [7:0]    subBytes_33_io_subBytesOutput;
  wire       [7:0]    subBytes_34_io_subBytesOutput;
  wire       [7:0]    subBytes_35_io_subBytesOutput;
  wire       [8:0]    _zz_roundConstant;
  wire       [8:0]    _zz_roundConstant_1;
  wire                dummy;
  reg        [127:0]  roundKey;
  reg        [127:0]  state;
  reg        [3:0]    round;
  reg        [7:0]    roundConstant;
  reg        [127:0]  subBytesOut;
  reg        [127:0]  shiftRowsOut;
  reg        [127:0]  mixColumnsOut;
  wire                when_AESEncrypt_l27;
  reg                 io_reset_regNext;
  wire                when_AESEncrypt_l44;
  reg                 io_reset_regNext_1;
  wire                when_AESEncrypt_l58;
  wire                when_AESEncrypt_l64;
  reg                 io_reset_regNext_2;
  wire                when_AESEncrypt_l68;
  wire                when_AESEncrypt_l69;
  wire                when_AESEncrypt_l77;

  assign _zz_roundConstant = ({1'd0,roundConstant} <<< 1);
  assign _zz_roundConstant_1 = ({1'd0,roundConstant} <<< 1);
  AddRoundKey addRoundKey_1 (
    .io_addRoundKeyInput     (addRoundKey_1_io_addRoundKeyInput[127:0]   ), //i
    .io_roundKey             (addRoundKey_1_io_roundKey[127:0]           ), //i
    .io_addRoundKeyOutput    (addRoundKey_1_io_addRoundKeyOutput[127:0]  )  //o
  );
  ShiftRows shiftRows_1 (
    .io_shiftRowsInput     (subBytesOut[127:0]                     ), //i
    .io_shiftRowsOutput    (shiftRows_1_io_shiftRowsOutput[127:0]  )  //o
  );
  MixColumns mixColumns_4 (
    .io_mixColumnsInput     (mixColumns_4_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_4_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_5 (
    .io_mixColumnsInput     (mixColumns_5_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_5_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_6 (
    .io_mixColumnsInput     (mixColumns_6_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_6_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_7 (
    .io_mixColumnsInput     (mixColumns_7_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_7_io_mixColumnsOutput[31:0]  )  //o
  );
  KeySchedule keySchedule_1 (
    .io_keyScheduleInput     (keySchedule_1_io_keyScheduleInput[127:0]   ), //i
    .io_roundConstant        (roundConstant[7:0]                         ), //i
    .io_keyScheduleOutput    (keySchedule_1_io_keyScheduleOutput[127:0]  )  //o
  );
  SubBytes_4 subBytes_20 (
    .io_subBytesInput     (subBytes_20_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_20_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_5 subBytes_21 (
    .io_subBytesInput     (subBytes_21_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_21_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_6 subBytes_22 (
    .io_subBytesInput     (subBytes_22_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_22_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_7 subBytes_23 (
    .io_subBytesInput     (subBytes_23_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_23_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_8 subBytes_24 (
    .io_subBytesInput     (subBytes_24_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_24_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_9 subBytes_25 (
    .io_subBytesInput     (subBytes_25_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_25_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_10 subBytes_26 (
    .io_subBytesInput     (subBytes_26_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_26_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_11 subBytes_27 (
    .io_subBytesInput     (subBytes_27_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_27_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_12 subBytes_28 (
    .io_subBytesInput     (subBytes_28_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_28_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_13 subBytes_29 (
    .io_subBytesInput     (subBytes_29_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_29_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_14 subBytes_30 (
    .io_subBytesInput     (subBytes_30_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_30_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_15 subBytes_31 (
    .io_subBytesInput     (subBytes_31_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_31_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_16 subBytes_32 (
    .io_subBytesInput     (subBytes_32_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_32_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_17 subBytes_33 (
    .io_subBytesInput     (subBytes_33_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_33_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_18 subBytes_34 (
    .io_subBytesInput     (subBytes_34_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_34_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_19 subBytes_35 (
    .io_subBytesInput     (subBytes_35_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_35_io_subBytesOutput[7:0]  )  //o
  );
  assign dummy = 1'b0;
  always @(*) begin
    addRoundKey_1_io_addRoundKeyInput = mixColumnsOut;
    if(when_AESEncrypt_l27) begin
      addRoundKey_1_io_addRoundKeyInput = shiftRowsOut;
    end
    if(when_AESEncrypt_l58) begin
      addRoundKey_1_io_addRoundKeyInput = io_plaintext;
    end
  end

  assign when_AESEncrypt_l27 = (round == 4'b1010);
  always @(*) begin
    addRoundKey_1_io_roundKey = roundKey;
    if(when_AESEncrypt_l58) begin
      addRoundKey_1_io_roundKey = io_key;
    end
  end

  always @(*) begin
    shiftRowsOut = shiftRows_1_io_shiftRowsOutput;
    if(io_reset) begin
      shiftRowsOut = 128'h0;
    end
  end

  assign mixColumns_4_io_mixColumnsInput = shiftRowsOut[127 : 96];
  always @(*) begin
    mixColumnsOut[127 : 96] = mixColumns_4_io_mixColumnsOutput;
    mixColumnsOut[95 : 64] = mixColumns_5_io_mixColumnsOutput;
    mixColumnsOut[63 : 32] = mixColumns_6_io_mixColumnsOutput;
    mixColumnsOut[31 : 0] = mixColumns_7_io_mixColumnsOutput;
    if(io_reset) begin
      mixColumnsOut = 128'h0;
    end
  end

  assign mixColumns_5_io_mixColumnsInput = shiftRowsOut[95 : 64];
  assign mixColumns_6_io_mixColumnsInput = shiftRowsOut[63 : 32];
  assign mixColumns_7_io_mixColumnsInput = shiftRowsOut[31 : 0];
  assign when_AESEncrypt_l44 = ((! io_reset) && io_reset_regNext);
  always @(*) begin
    if(when_AESEncrypt_l44) begin
      keySchedule_1_io_keyScheduleInput = io_key;
    end else begin
      keySchedule_1_io_keyScheduleInput = roundKey;
    end
  end

  assign subBytes_20_io_subBytesInput = state[7 : 0];
  always @(*) begin
    subBytesOut[7 : 0] = subBytes_20_io_subBytesOutput;
    subBytesOut[15 : 8] = subBytes_21_io_subBytesOutput;
    subBytesOut[23 : 16] = subBytes_22_io_subBytesOutput;
    subBytesOut[31 : 24] = subBytes_23_io_subBytesOutput;
    subBytesOut[39 : 32] = subBytes_24_io_subBytesOutput;
    subBytesOut[47 : 40] = subBytes_25_io_subBytesOutput;
    subBytesOut[55 : 48] = subBytes_26_io_subBytesOutput;
    subBytesOut[63 : 56] = subBytes_27_io_subBytesOutput;
    subBytesOut[71 : 64] = subBytes_28_io_subBytesOutput;
    subBytesOut[79 : 72] = subBytes_29_io_subBytesOutput;
    subBytesOut[87 : 80] = subBytes_30_io_subBytesOutput;
    subBytesOut[95 : 88] = subBytes_31_io_subBytesOutput;
    subBytesOut[103 : 96] = subBytes_32_io_subBytesOutput;
    subBytesOut[111 : 104] = subBytes_33_io_subBytesOutput;
    subBytesOut[119 : 112] = subBytes_34_io_subBytesOutput;
    subBytesOut[127 : 120] = subBytes_35_io_subBytesOutput;
    if(io_reset) begin
      subBytesOut = 128'h0;
    end
  end

  assign subBytes_21_io_subBytesInput = state[15 : 8];
  assign subBytes_22_io_subBytesInput = state[23 : 16];
  assign subBytes_23_io_subBytesInput = state[31 : 24];
  assign subBytes_24_io_subBytesInput = state[39 : 32];
  assign subBytes_25_io_subBytesInput = state[47 : 40];
  assign subBytes_26_io_subBytesInput = state[55 : 48];
  assign subBytes_27_io_subBytesInput = state[63 : 56];
  assign subBytes_28_io_subBytesInput = state[71 : 64];
  assign subBytes_29_io_subBytesInput = state[79 : 72];
  assign subBytes_30_io_subBytesInput = state[87 : 80];
  assign subBytes_31_io_subBytesInput = state[95 : 88];
  assign subBytes_32_io_subBytesInput = state[103 : 96];
  assign subBytes_33_io_subBytesInput = state[111 : 104];
  assign subBytes_34_io_subBytesInput = state[119 : 112];
  assign subBytes_35_io_subBytesInput = state[127 : 120];
  assign when_AESEncrypt_l58 = ((! io_reset) && io_reset_regNext_1);
  assign when_AESEncrypt_l64 = (4'b0001 <= round);
  assign when_AESEncrypt_l68 = (((! io_reset) && io_reset_regNext_2) || (8'h01 < roundConstant));
  assign when_AESEncrypt_l69 = (roundConstant < 8'h80);
  always @(*) begin
    io_done = 1'b0;
    if(when_AESEncrypt_l77) begin
      io_done = 1'b1;
    end
  end

  assign when_AESEncrypt_l77 = (round == 4'b1011);
  assign io_ciphertext = state;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      roundKey <= 128'h0;
      state <= 128'h0;
      round <= 4'b0000;
      roundConstant <= 8'h01;
    end else begin
      state <= addRoundKey_1_io_addRoundKeyOutput;
      roundKey <= keySchedule_1_io_keyScheduleOutput;
      if(when_AESEncrypt_l58) begin
        state <= addRoundKey_1_io_addRoundKeyOutput;
        round <= (round + 4'b0001);
      end else begin
        if(when_AESEncrypt_l64) begin
          round <= (round + 4'b0001);
        end
      end
      if(when_AESEncrypt_l68) begin
        if(when_AESEncrypt_l69) begin
          roundConstant <= _zz_roundConstant[7 : 0];
        end else begin
          roundConstant <= (_zz_roundConstant_1[7 : 0] ^ 8'h1b);
        end
      end
      if(io_reset) begin
        roundKey <= 128'h0;
        state <= 128'h0;
        round <= 4'b0000;
        roundConstant <= 8'h01;
      end
    end
  end

  always @(posedge clk) begin
    io_reset_regNext <= io_reset;
    io_reset_regNext_1 <= io_reset;
    io_reset_regNext_2 <= io_reset;
  end


endmodule

module SubBytes_19 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_35_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_18 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_34_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_17 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_33_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_16 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_32_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_15 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_31_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_14 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_30_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_13 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_29_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_12 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_28_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_11 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_27_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_10 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_26_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_9 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_25_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_8 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_24_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_7 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_23_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_6 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_22_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_5 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_21_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_4 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_subBytes_20_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module KeySchedule (
  input      [127:0]  io_keyScheduleInput,
  input      [7:0]    io_roundConstant,
  output     [127:0]  io_keyScheduleOutput
);

  wire       [7:0]    subBytes_20_io_subBytesInput;
  wire       [7:0]    subBytes_21_io_subBytesInput;
  wire       [7:0]    subBytes_22_io_subBytesInput;
  wire       [7:0]    subBytes_23_io_subBytesInput;
  wire       [7:0]    subBytes_20_io_subBytesOutput;
  wire       [7:0]    subBytes_21_io_subBytesOutput;
  wire       [7:0]    subBytes_22_io_subBytesOutput;
  wire       [7:0]    subBytes_23_io_subBytesOutput;
  wire       [31:0]   w1;
  wire       [31:0]   w2;
  wire       [31:0]   w3;
  wire       [31:0]   w0;
  reg        [31:0]   sBoxOut;

  SubBytes subBytes_20 (
    .io_subBytesInput     (subBytes_20_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_20_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_1 subBytes_21 (
    .io_subBytesInput     (subBytes_21_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_21_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_2 subBytes_22 (
    .io_subBytesInput     (subBytes_22_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_22_io_subBytesOutput[7:0]  )  //o
  );
  SubBytes_3 subBytes_23 (
    .io_subBytesInput     (subBytes_23_io_subBytesInput[7:0]   ), //i
    .io_subBytesOutput    (subBytes_23_io_subBytesOutput[7:0]  )  //o
  );
  assign subBytes_20_io_subBytesInput = io_keyScheduleInput[31 : 24];
  always @(*) begin
    sBoxOut[31 : 24] = subBytes_20_io_subBytesOutput;
    sBoxOut[23 : 16] = subBytes_21_io_subBytesOutput;
    sBoxOut[15 : 8] = subBytes_22_io_subBytesOutput;
    sBoxOut[7 : 0] = subBytes_23_io_subBytesOutput;
  end

  assign subBytes_21_io_subBytesInput = io_keyScheduleInput[23 : 16];
  assign subBytes_22_io_subBytesInput = io_keyScheduleInput[15 : 8];
  assign subBytes_23_io_subBytesInput = io_keyScheduleInput[7 : 0];
  assign w0 = ((io_keyScheduleInput[127 : 96] ^ {sBoxOut[23 : 0],sBoxOut[31 : 24]}) ^ {io_roundConstant,24'h0});
  assign w1 = (io_keyScheduleInput[95 : 64] ^ w0);
  assign w2 = (io_keyScheduleInput[63 : 32] ^ w1);
  assign w3 = (io_keyScheduleInput[31 : 0] ^ w2);
  assign io_keyScheduleOutput = {{{w0,w1},w2},w3};

endmodule

//MixColumns replaced by MixColumns

//MixColumns replaced by MixColumns

//MixColumns replaced by MixColumns

module MixColumns (
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
  wire                when_MixColumns_l20;
  reg        [8:0]    _zz_io_mixColumnsOutput_1;
  wire                when_MixColumns_l20_1;
  reg        [8:0]    _zz_io_mixColumnsOutput_2;
  wire                when_MixColumns_l20_2;
  reg        [8:0]    _zz_io_mixColumnsOutput_3;
  wire                when_MixColumns_l20_3;
  reg        [8:0]    _zz_io_mixColumnsOutput_4;
  wire                when_MixColumns_l20_4;
  reg        [8:0]    _zz_io_mixColumnsOutput_5;
  wire                when_MixColumns_l20_5;
  reg        [8:0]    _zz_io_mixColumnsOutput_6;
  wire                when_MixColumns_l20_6;
  reg        [8:0]    _zz_io_mixColumnsOutput_7;
  wire                when_MixColumns_l20_7;

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
  assign when_MixColumns_l20 = a0[7];
  always @(*) begin
    if(when_MixColumns_l20) begin
      _zz_io_mixColumnsOutput = (_zz__zz_io_mixColumnsOutput ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l20_1 = a1[7];
  always @(*) begin
    if(when_MixColumns_l20_1) begin
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

  assign when_MixColumns_l20_2 = a1[7];
  always @(*) begin
    if(when_MixColumns_l20_2) begin
      _zz_io_mixColumnsOutput_2 = (_zz__zz_io_mixColumnsOutput_2 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumns_l20_3 = a2[7];
  always @(*) begin
    if(when_MixColumns_l20_3) begin
      _zz_io_mixColumnsOutput_3 = (_zz__zz_io_mixColumnsOutput_3 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l20_4 = a2[7];
  always @(*) begin
    if(when_MixColumns_l20_4) begin
      _zz_io_mixColumnsOutput_4 = (_zz__zz_io_mixColumnsOutput_4 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_4 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l20_5 = a3[7];
  always @(*) begin
    if(when_MixColumns_l20_5) begin
      _zz_io_mixColumnsOutput_5 = (_zz__zz_io_mixColumnsOutput_5 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_5 = ({1'd0,a3} <<< 1);
    end
  end

  assign when_MixColumns_l20_6 = a0[7];
  always @(*) begin
    if(when_MixColumns_l20_6) begin
      _zz_io_mixColumnsOutput_6 = (_zz__zz_io_mixColumnsOutput_6 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_6 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l20_7 = a3[7];
  always @(*) begin
    if(when_MixColumns_l20_7) begin
      _zz_io_mixColumnsOutput_7 = (_zz__zz_io_mixColumnsOutput_7 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_7 = ({1'd0,a3} <<< 1);
    end
  end


endmodule

module ShiftRows (
  input      [127:0]  io_shiftRowsInput,
  output     [127:0]  io_shiftRowsOutput
);


  assign io_shiftRowsOutput = {{{{{{{{{{{{{{{io_shiftRowsInput[127 : 120],io_shiftRowsInput[87 : 80]},io_shiftRowsInput[47 : 40]},io_shiftRowsInput[7 : 0]},io_shiftRowsInput[95 : 88]},io_shiftRowsInput[55 : 48]},io_shiftRowsInput[15 : 8]},io_shiftRowsInput[103 : 96]},io_shiftRowsInput[63 : 56]},io_shiftRowsInput[23 : 16]},io_shiftRowsInput[111 : 104]},io_shiftRowsInput[71 : 64]},io_shiftRowsInput[31 : 24]},io_shiftRowsInput[119 : 112]},io_shiftRowsInput[79 : 72]},io_shiftRowsInput[39 : 32]};

endmodule

module AddRoundKey (
  input      [127:0]  io_addRoundKeyInput,
  input      [127:0]  io_roundKey,
  output     [127:0]  io_addRoundKeyOutput
);


  assign io_addRoundKeyOutput = (io_addRoundKeyInput ^ io_roundKey);

endmodule

module SubBytes_3 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_keySchedule_1_subBytes_23_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_2 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_keySchedule_1_subBytes_22_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes_1 (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_keySchedule_1_subBytes_21_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule

module SubBytes (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput
);

  wire       [7:0]    _zz_sbox_port0;
  wire       [7:0]    _zz_io_subBytesOutput;
  (* ram_style = "distributed" *) reg [7:0] sbox [0:255];

  initial begin
    $readmemb("AESEncrypt.v_toplevel_keySchedule_1_subBytes_20_sbox.bin",sbox);
  end
  assign _zz_sbox_port0 = sbox[_zz_io_subBytesOutput];
  assign _zz_io_subBytesOutput = io_subBytesInput;
  assign io_subBytesOutput = _zz_sbox_port0;

endmodule
