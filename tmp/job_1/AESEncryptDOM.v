// Generator : SpinalHDL v1.6.2    git head : 47ae50d83f8f2535f984ba8e55c890dbe0ae9cc7
// Component : AESEncryptDOM
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module AESEncryptDOM (
  input               io_reset,
  input      [127:0]  io_p0,
  input      [127:0]  io_p1,
  input      [127:0]  io_k0,
  input      [127:0]  io_k1,
  input      [759:0]  io_m,
  output     [127:0]  io_c0,
  output     [127:0]  io_c1,
  output              io_done,
  input               clk,
  input               reset
);

  reg        [127:0]  ak0_io_akIn;
  reg        [127:0]  ak0_io_rk;
  reg        [127:0]  ak1_io_akIn;
  reg        [127:0]  ak1_io_rk;
  reg        [127:0]  sr0_io_shiftRowsInput;
  reg        [127:0]  sr1_io_shiftRowsInput;
  wire       [7:0]    sBox_20_io_sbIn0;
  wire       [7:0]    sBox_20_io_sbIn1;
  wire       [37:0]   sBox_20_io_m;
  wire       [7:0]    sBox_21_io_sbIn0;
  wire       [7:0]    sBox_21_io_sbIn1;
  wire       [37:0]   sBox_21_io_m;
  wire       [7:0]    sBox_22_io_sbIn0;
  wire       [7:0]    sBox_22_io_sbIn1;
  wire       [37:0]   sBox_22_io_m;
  wire       [7:0]    sBox_23_io_sbIn0;
  wire       [7:0]    sBox_23_io_sbIn1;
  wire       [37:0]   sBox_23_io_m;
  wire       [7:0]    sBox_24_io_sbIn0;
  wire       [7:0]    sBox_24_io_sbIn1;
  wire       [37:0]   sBox_24_io_m;
  wire       [7:0]    sBox_25_io_sbIn0;
  wire       [7:0]    sBox_25_io_sbIn1;
  wire       [37:0]   sBox_25_io_m;
  wire       [7:0]    sBox_26_io_sbIn0;
  wire       [7:0]    sBox_26_io_sbIn1;
  wire       [37:0]   sBox_26_io_m;
  wire       [7:0]    sBox_27_io_sbIn0;
  wire       [7:0]    sBox_27_io_sbIn1;
  wire       [37:0]   sBox_27_io_m;
  wire       [7:0]    sBox_28_io_sbIn0;
  wire       [7:0]    sBox_28_io_sbIn1;
  wire       [37:0]   sBox_28_io_m;
  wire       [7:0]    sBox_29_io_sbIn0;
  wire       [7:0]    sBox_29_io_sbIn1;
  wire       [37:0]   sBox_29_io_m;
  wire       [7:0]    sBox_30_io_sbIn0;
  wire       [7:0]    sBox_30_io_sbIn1;
  wire       [37:0]   sBox_30_io_m;
  wire       [7:0]    sBox_31_io_sbIn0;
  wire       [7:0]    sBox_31_io_sbIn1;
  wire       [37:0]   sBox_31_io_m;
  wire       [7:0]    sBox_32_io_sbIn0;
  wire       [7:0]    sBox_32_io_sbIn1;
  wire       [37:0]   sBox_32_io_m;
  wire       [7:0]    sBox_33_io_sbIn0;
  wire       [7:0]    sBox_33_io_sbIn1;
  wire       [37:0]   sBox_33_io_m;
  wire       [7:0]    sBox_34_io_sbIn0;
  wire       [7:0]    sBox_34_io_sbIn1;
  wire       [37:0]   sBox_34_io_m;
  wire       [7:0]    sBox_35_io_sbIn0;
  wire       [7:0]    sBox_35_io_sbIn1;
  wire       [37:0]   sBox_35_io_m;
  wire       [31:0]   mixColumns_8_io_mixColumnsInput;
  wire       [31:0]   mixColumns_9_io_mixColumnsInput;
  wire       [31:0]   mixColumns_10_io_mixColumnsInput;
  wire       [31:0]   mixColumns_11_io_mixColumnsInput;
  wire       [31:0]   mixColumns_12_io_mixColumnsInput;
  wire       [31:0]   mixColumns_13_io_mixColumnsInput;
  wire       [31:0]   mixColumns_14_io_mixColumnsInput;
  wire       [31:0]   mixColumns_15_io_mixColumnsInput;
  reg        [127:0]  ks_io_ksIn0;
  reg        [127:0]  ks_io_ksIn1;
  wire       [151:0]  ks_io_m;
  wire       [127:0]  ak0_io_akOut;
  wire       [127:0]  ak1_io_akOut;
  wire       [127:0]  sr0_io_shiftRowsOutput;
  wire       [127:0]  sr1_io_shiftRowsOutput;
  wire       [7:0]    sBox_20_io_sbOut0;
  wire       [7:0]    sBox_20_io_sbOut1;
  wire       [7:0]    sBox_21_io_sbOut0;
  wire       [7:0]    sBox_21_io_sbOut1;
  wire       [7:0]    sBox_22_io_sbOut0;
  wire       [7:0]    sBox_22_io_sbOut1;
  wire       [7:0]    sBox_23_io_sbOut0;
  wire       [7:0]    sBox_23_io_sbOut1;
  wire       [7:0]    sBox_24_io_sbOut0;
  wire       [7:0]    sBox_24_io_sbOut1;
  wire       [7:0]    sBox_25_io_sbOut0;
  wire       [7:0]    sBox_25_io_sbOut1;
  wire       [7:0]    sBox_26_io_sbOut0;
  wire       [7:0]    sBox_26_io_sbOut1;
  wire       [7:0]    sBox_27_io_sbOut0;
  wire       [7:0]    sBox_27_io_sbOut1;
  wire       [7:0]    sBox_28_io_sbOut0;
  wire       [7:0]    sBox_28_io_sbOut1;
  wire       [7:0]    sBox_29_io_sbOut0;
  wire       [7:0]    sBox_29_io_sbOut1;
  wire       [7:0]    sBox_30_io_sbOut0;
  wire       [7:0]    sBox_30_io_sbOut1;
  wire       [7:0]    sBox_31_io_sbOut0;
  wire       [7:0]    sBox_31_io_sbOut1;
  wire       [7:0]    sBox_32_io_sbOut0;
  wire       [7:0]    sBox_32_io_sbOut1;
  wire       [7:0]    sBox_33_io_sbOut0;
  wire       [7:0]    sBox_33_io_sbOut1;
  wire       [7:0]    sBox_34_io_sbOut0;
  wire       [7:0]    sBox_34_io_sbOut1;
  wire       [7:0]    sBox_35_io_sbOut0;
  wire       [7:0]    sBox_35_io_sbOut1;
  wire       [31:0]   mixColumns_8_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_9_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_10_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_11_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_12_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_13_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_14_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_15_io_mixColumnsOutput;
  wire       [127:0]  ks_io_ksOut0;
  wire       [127:0]  ks_io_ksOut1;
  wire       [7:0]    _zz_roundConstant;
  reg        [127:0]  stateReg0;
  reg        [127:0]  stateReg1;
  reg        [127:0]  keyReg0;
  reg        [127:0]  keyReg1;
  reg        [3:0]    roundCounter;
  reg        [7:0]    roundConstant;
  wire       [127:0]  p;
  wire       [127:0]  k;
  reg        [2:0]    i;
  reg                 done;
  reg                 io_reset_regNext;
  wire                when_AESEncrypt_l49;
  reg                 io_reset_regNext_1;
  wire                when_AESEncrypt_l59;
  wire                when_AESEncrypt_l62;
  reg                 io_reset_regNext_2;
  wire                when_AESEncrypt_l67;
  wire                when_AESEncrypt_l74;
  wire                when_AESEncrypt_l88;
  wire                when_AESEncrypt_l97;
  wire                when_AESEncrypt_l96;
  wire                when_AESEncrypt_l106;
  wire                when_AESEncrypt_l115;

  assign _zz_roundConstant = (roundConstant <<< 1);
  AddRoundKey ak0 (
    .io_akIn     (ak0_io_akIn[127:0]   ), //i
    .io_rk       (ak0_io_rk[127:0]     ), //i
    .io_akOut    (ak0_io_akOut[127:0]  )  //o
  );
  AddRoundKey ak1 (
    .io_akIn     (ak1_io_akIn[127:0]   ), //i
    .io_rk       (ak1_io_rk[127:0]     ), //i
    .io_akOut    (ak1_io_akOut[127:0]  )  //o
  );
  ShiftRows sr0 (
    .io_shiftRowsInput     (sr0_io_shiftRowsInput[127:0]   ), //i
    .io_shiftRowsOutput    (sr0_io_shiftRowsOutput[127:0]  )  //o
  );
  ShiftRows sr1 (
    .io_shiftRowsInput     (sr1_io_shiftRowsInput[127:0]   ), //i
    .io_shiftRowsOutput    (sr1_io_shiftRowsOutput[127:0]  )  //o
  );
  SBox sBox_20 (
    .io_sbIn0     (sBox_20_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_20_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_20_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_20_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_20_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_21 (
    .io_sbIn0     (sBox_21_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_21_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_21_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_21_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_21_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_22 (
    .io_sbIn0     (sBox_22_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_22_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_22_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_22_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_22_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_23 (
    .io_sbIn0     (sBox_23_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_23_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_23_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_23_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_23_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_24 (
    .io_sbIn0     (sBox_24_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_24_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_24_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_24_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_24_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_25 (
    .io_sbIn0     (sBox_25_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_25_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_25_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_25_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_25_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_26 (
    .io_sbIn0     (sBox_26_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_26_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_26_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_26_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_26_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_27 (
    .io_sbIn0     (sBox_27_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_27_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_27_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_27_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_27_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_28 (
    .io_sbIn0     (sBox_28_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_28_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_28_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_28_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_28_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_29 (
    .io_sbIn0     (sBox_29_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_29_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_29_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_29_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_29_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_30 (
    .io_sbIn0     (sBox_30_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_30_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_30_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_30_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_30_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_31 (
    .io_sbIn0     (sBox_31_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_31_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_31_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_31_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_31_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_32 (
    .io_sbIn0     (sBox_32_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_32_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_32_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_32_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_32_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_33 (
    .io_sbIn0     (sBox_33_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_33_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_33_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_33_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_33_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_34 (
    .io_sbIn0     (sBox_34_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_34_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_34_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_34_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_34_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_35 (
    .io_sbIn0     (sBox_35_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_35_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_35_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_35_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_35_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  MixColumns mixColumns_8 (
    .io_mixColumnsInput     (mixColumns_8_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_8_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_9 (
    .io_mixColumnsInput     (mixColumns_9_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_9_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_10 (
    .io_mixColumnsInput     (mixColumns_10_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_10_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_11 (
    .io_mixColumnsInput     (mixColumns_11_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_11_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_12 (
    .io_mixColumnsInput     (mixColumns_12_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_12_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_13 (
    .io_mixColumnsInput     (mixColumns_13_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_13_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_14 (
    .io_mixColumnsInput     (mixColumns_14_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_14_io_mixColumnsOutput[31:0]  )  //o
  );
  MixColumns mixColumns_15 (
    .io_mixColumnsInput     (mixColumns_15_io_mixColumnsInput[31:0]   ), //i
    .io_mixColumnsOutput    (mixColumns_15_io_mixColumnsOutput[31:0]  )  //o
  );
  KeySchedule ks (
    .io_ksIn0     (ks_io_ksIn0[127:0]   ), //i
    .io_ksIn1     (ks_io_ksIn1[127:0]   ), //i
    .io_rc        (roundConstant[7:0]   ), //i
    .io_m         (ks_io_m[151:0]       ), //i
    .io_ksOut0    (ks_io_ksOut0[127:0]  ), //o
    .io_ksOut1    (ks_io_ksOut1[127:0]  ), //o
    .clk          (clk                  ), //i
    .reset        (reset                )  //i
  );
  assign p = (stateReg0 ^ stateReg1);
  assign k = (keyReg0 ^ keyReg1);
  assign sBox_20_io_sbIn0 = stateReg0[127 : 120];
  assign sBox_20_io_sbIn1 = stateReg1[127 : 120];
  assign sBox_20_io_m = io_m[759 : 722];
  always @(*) begin
    sr0_io_shiftRowsInput[127 : 120] = sBox_20_io_sbOut0;
    sr0_io_shiftRowsInput[119 : 112] = sBox_21_io_sbOut0;
    sr0_io_shiftRowsInput[111 : 104] = sBox_22_io_sbOut0;
    sr0_io_shiftRowsInput[103 : 96] = sBox_23_io_sbOut0;
    sr0_io_shiftRowsInput[95 : 88] = sBox_24_io_sbOut0;
    sr0_io_shiftRowsInput[87 : 80] = sBox_25_io_sbOut0;
    sr0_io_shiftRowsInput[79 : 72] = sBox_26_io_sbOut0;
    sr0_io_shiftRowsInput[71 : 64] = sBox_27_io_sbOut0;
    sr0_io_shiftRowsInput[63 : 56] = sBox_28_io_sbOut0;
    sr0_io_shiftRowsInput[55 : 48] = sBox_29_io_sbOut0;
    sr0_io_shiftRowsInput[47 : 40] = sBox_30_io_sbOut0;
    sr0_io_shiftRowsInput[39 : 32] = sBox_31_io_sbOut0;
    sr0_io_shiftRowsInput[31 : 24] = sBox_32_io_sbOut0;
    sr0_io_shiftRowsInput[23 : 16] = sBox_33_io_sbOut0;
    sr0_io_shiftRowsInput[15 : 8] = sBox_34_io_sbOut0;
    sr0_io_shiftRowsInput[7 : 0] = sBox_35_io_sbOut0;
  end

  always @(*) begin
    sr1_io_shiftRowsInput[127 : 120] = sBox_20_io_sbOut1;
    sr1_io_shiftRowsInput[119 : 112] = sBox_21_io_sbOut1;
    sr1_io_shiftRowsInput[111 : 104] = sBox_22_io_sbOut1;
    sr1_io_shiftRowsInput[103 : 96] = sBox_23_io_sbOut1;
    sr1_io_shiftRowsInput[95 : 88] = sBox_24_io_sbOut1;
    sr1_io_shiftRowsInput[87 : 80] = sBox_25_io_sbOut1;
    sr1_io_shiftRowsInput[79 : 72] = sBox_26_io_sbOut1;
    sr1_io_shiftRowsInput[71 : 64] = sBox_27_io_sbOut1;
    sr1_io_shiftRowsInput[63 : 56] = sBox_28_io_sbOut1;
    sr1_io_shiftRowsInput[55 : 48] = sBox_29_io_sbOut1;
    sr1_io_shiftRowsInput[47 : 40] = sBox_30_io_sbOut1;
    sr1_io_shiftRowsInput[39 : 32] = sBox_31_io_sbOut1;
    sr1_io_shiftRowsInput[31 : 24] = sBox_32_io_sbOut1;
    sr1_io_shiftRowsInput[23 : 16] = sBox_33_io_sbOut1;
    sr1_io_shiftRowsInput[15 : 8] = sBox_34_io_sbOut1;
    sr1_io_shiftRowsInput[7 : 0] = sBox_35_io_sbOut1;
  end

  assign sBox_21_io_sbIn0 = stateReg0[119 : 112];
  assign sBox_21_io_sbIn1 = stateReg1[119 : 112];
  assign sBox_21_io_m = io_m[721 : 684];
  assign sBox_22_io_sbIn0 = stateReg0[111 : 104];
  assign sBox_22_io_sbIn1 = stateReg1[111 : 104];
  assign sBox_22_io_m = io_m[683 : 646];
  assign sBox_23_io_sbIn0 = stateReg0[103 : 96];
  assign sBox_23_io_sbIn1 = stateReg1[103 : 96];
  assign sBox_23_io_m = io_m[645 : 608];
  assign sBox_24_io_sbIn0 = stateReg0[95 : 88];
  assign sBox_24_io_sbIn1 = stateReg1[95 : 88];
  assign sBox_24_io_m = io_m[607 : 570];
  assign sBox_25_io_sbIn0 = stateReg0[87 : 80];
  assign sBox_25_io_sbIn1 = stateReg1[87 : 80];
  assign sBox_25_io_m = io_m[569 : 532];
  assign sBox_26_io_sbIn0 = stateReg0[79 : 72];
  assign sBox_26_io_sbIn1 = stateReg1[79 : 72];
  assign sBox_26_io_m = io_m[531 : 494];
  assign sBox_27_io_sbIn0 = stateReg0[71 : 64];
  assign sBox_27_io_sbIn1 = stateReg1[71 : 64];
  assign sBox_27_io_m = io_m[493 : 456];
  assign sBox_28_io_sbIn0 = stateReg0[63 : 56];
  assign sBox_28_io_sbIn1 = stateReg1[63 : 56];
  assign sBox_28_io_m = io_m[455 : 418];
  assign sBox_29_io_sbIn0 = stateReg0[55 : 48];
  assign sBox_29_io_sbIn1 = stateReg1[55 : 48];
  assign sBox_29_io_m = io_m[417 : 380];
  assign sBox_30_io_sbIn0 = stateReg0[47 : 40];
  assign sBox_30_io_sbIn1 = stateReg1[47 : 40];
  assign sBox_30_io_m = io_m[379 : 342];
  assign sBox_31_io_sbIn0 = stateReg0[39 : 32];
  assign sBox_31_io_sbIn1 = stateReg1[39 : 32];
  assign sBox_31_io_m = io_m[341 : 304];
  assign sBox_32_io_sbIn0 = stateReg0[31 : 24];
  assign sBox_32_io_sbIn1 = stateReg1[31 : 24];
  assign sBox_32_io_m = io_m[303 : 266];
  assign sBox_33_io_sbIn0 = stateReg0[23 : 16];
  assign sBox_33_io_sbIn1 = stateReg1[23 : 16];
  assign sBox_33_io_m = io_m[265 : 228];
  assign sBox_34_io_sbIn0 = stateReg0[15 : 8];
  assign sBox_34_io_sbIn1 = stateReg1[15 : 8];
  assign sBox_34_io_m = io_m[227 : 190];
  assign sBox_35_io_sbIn0 = stateReg0[7 : 0];
  assign sBox_35_io_sbIn1 = stateReg1[7 : 0];
  assign sBox_35_io_m = io_m[189 : 152];
  assign mixColumns_8_io_mixColumnsInput = sr0_io_shiftRowsOutput[127 : 96];
  assign mixColumns_9_io_mixColumnsInput = sr1_io_shiftRowsOutput[127 : 96];
  always @(*) begin
    ak0_io_akIn[127 : 96] = mixColumns_8_io_mixColumnsOutput;
    ak0_io_akIn[95 : 64] = mixColumns_10_io_mixColumnsOutput;
    ak0_io_akIn[63 : 32] = mixColumns_12_io_mixColumnsOutput;
    ak0_io_akIn[31 : 0] = mixColumns_14_io_mixColumnsOutput;
    if(when_AESEncrypt_l67) begin
      ak0_io_akIn = io_p0;
    end else begin
      if(!when_AESEncrypt_l74) begin
        ak0_io_akIn = sr0_io_shiftRowsOutput;
      end
    end
  end

  always @(*) begin
    ak1_io_akIn[127 : 96] = mixColumns_9_io_mixColumnsOutput;
    ak1_io_akIn[95 : 64] = mixColumns_11_io_mixColumnsOutput;
    ak1_io_akIn[63 : 32] = mixColumns_13_io_mixColumnsOutput;
    ak1_io_akIn[31 : 0] = mixColumns_15_io_mixColumnsOutput;
    if(when_AESEncrypt_l67) begin
      ak1_io_akIn = io_p1;
    end else begin
      if(!when_AESEncrypt_l74) begin
        ak1_io_akIn = sr1_io_shiftRowsOutput;
      end
    end
  end

  assign mixColumns_10_io_mixColumnsInput = sr0_io_shiftRowsOutput[95 : 64];
  assign mixColumns_11_io_mixColumnsInput = sr1_io_shiftRowsOutput[95 : 64];
  assign mixColumns_12_io_mixColumnsInput = sr0_io_shiftRowsOutput[63 : 32];
  assign mixColumns_13_io_mixColumnsInput = sr1_io_shiftRowsOutput[63 : 32];
  assign mixColumns_14_io_mixColumnsInput = sr0_io_shiftRowsOutput[31 : 0];
  assign mixColumns_15_io_mixColumnsInput = sr1_io_shiftRowsOutput[31 : 0];
  assign when_AESEncrypt_l49 = ((! io_reset) && io_reset_regNext);
  always @(*) begin
    if(when_AESEncrypt_l49) begin
      ks_io_ksIn0 = io_k0;
    end else begin
      ks_io_ksIn0 = keyReg0;
    end
  end

  always @(*) begin
    if(when_AESEncrypt_l49) begin
      ks_io_ksIn1 = io_k1;
    end else begin
      ks_io_ksIn1 = keyReg1;
    end
  end

  assign ks_io_m = io_m[151 : 0];
  assign when_AESEncrypt_l59 = ((! io_reset) && io_reset_regNext_1);
  assign when_AESEncrypt_l62 = (i == 3'b100);
  assign when_AESEncrypt_l67 = ((! io_reset) && io_reset_regNext_2);
  always @(*) begin
    if(when_AESEncrypt_l67) begin
      ak0_io_rk = io_k0;
    end else begin
      if(when_AESEncrypt_l74) begin
        ak0_io_rk = keyReg0;
      end else begin
        ak0_io_rk = keyReg0;
      end
    end
  end

  always @(*) begin
    if(when_AESEncrypt_l67) begin
      ak1_io_rk = io_k1;
    end else begin
      if(when_AESEncrypt_l74) begin
        ak1_io_rk = keyReg1;
      end else begin
        ak1_io_rk = keyReg1;
      end
    end
  end

  assign when_AESEncrypt_l74 = (roundCounter <= 4'b1001);
  assign when_AESEncrypt_l88 = (io_reset || (i == 3'b100));
  assign when_AESEncrypt_l97 = (roundConstant < 8'h80);
  assign when_AESEncrypt_l96 = (i == 3'b100);
  assign when_AESEncrypt_l106 = (i == 3'b100);
  assign io_c0 = stateReg0;
  assign io_c1 = stateReg1;
  assign io_done = done;
  assign when_AESEncrypt_l115 = (roundCounter == 4'b1010);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateReg0 <= 128'h0;
      stateReg1 <= 128'h0;
      keyReg0 <= 128'h0;
      keyReg1 <= 128'h0;
      roundCounter <= 4'b0000;
      roundConstant <= 8'h01;
      i <= 3'b000;
      done <= 1'b0;
    end else begin
      if(when_AESEncrypt_l59) begin
        keyReg0 <= io_k0;
        keyReg1 <= io_k1;
      end else begin
        if(when_AESEncrypt_l62) begin
          keyReg0 <= ks_io_ksOut0;
          keyReg1 <= ks_io_ksOut1;
        end
      end
      if(when_AESEncrypt_l67) begin
        stateReg0 <= ak0_io_akOut;
        stateReg1 <= ak1_io_akOut;
      end else begin
        if(when_AESEncrypt_l74) begin
          stateReg0 <= ak0_io_akOut;
          stateReg1 <= ak1_io_akOut;
        end else begin
          stateReg0 <= ak0_io_akOut;
          stateReg1 <= ak1_io_akOut;
        end
      end
      if(when_AESEncrypt_l88) begin
        i <= 3'b000;
      end else begin
        i <= (i + 3'b001);
      end
      if(io_reset) begin
        roundConstant <= 8'h01;
      end else begin
        if(when_AESEncrypt_l96) begin
          if(when_AESEncrypt_l97) begin
            roundConstant <= (roundConstant <<< 1);
          end else begin
            roundConstant <= (_zz_roundConstant ^ 8'h1b);
          end
        end
      end
      if(io_reset) begin
        roundCounter <= 4'b0000;
      end else begin
        if(when_AESEncrypt_l106) begin
          roundCounter <= (roundCounter + 4'b0001);
        end
      end
      done <= 1'b0;
      if(when_AESEncrypt_l115) begin
        done <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    io_reset_regNext <= io_reset;
    io_reset_regNext_1 <= io_reset;
    io_reset_regNext_2 <= io_reset;
  end


endmodule

module KeySchedule (
  input      [127:0]  io_ksIn0,
  input      [127:0]  io_ksIn1,
  input      [7:0]    io_rc,
  input      [151:0]  io_m,
  output     [127:0]  io_ksOut0,
  output     [127:0]  io_ksOut1,
  input               clk,
  input               reset
);

  wire       [7:0]    sBox_20_io_sbIn0;
  wire       [7:0]    sBox_20_io_sbIn1;
  wire       [37:0]   sBox_20_io_m;
  wire       [7:0]    sBox_21_io_sbIn0;
  wire       [7:0]    sBox_21_io_sbIn1;
  wire       [37:0]   sBox_21_io_m;
  wire       [7:0]    sBox_22_io_sbIn0;
  wire       [7:0]    sBox_22_io_sbIn1;
  wire       [37:0]   sBox_22_io_m;
  wire       [7:0]    sBox_23_io_sbIn0;
  wire       [7:0]    sBox_23_io_sbIn1;
  wire       [37:0]   sBox_23_io_m;
  wire       [7:0]    sBox_20_io_sbOut0;
  wire       [7:0]    sBox_20_io_sbOut1;
  wire       [7:0]    sBox_21_io_sbOut0;
  wire       [7:0]    sBox_21_io_sbOut1;
  wire       [7:0]    sBox_22_io_sbOut0;
  wire       [7:0]    sBox_22_io_sbOut1;
  wire       [7:0]    sBox_23_io_sbOut0;
  wire       [7:0]    sBox_23_io_sbOut1;
  wire       [31:0]   w00;
  wire       [31:0]   w01;
  wire       [31:0]   w10;
  wire       [31:0]   w11;
  wire       [31:0]   w20;
  wire       [31:0]   w21;
  wire       [31:0]   w30;
  wire       [31:0]   w31;
  wire       [31:0]   rc;
  reg        [31:0]   sBoxOut0;
  reg        [31:0]   sBoxOut1;

  SBox sBox_20 (
    .io_sbIn0     (sBox_20_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_20_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_20_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_20_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_20_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_21 (
    .io_sbIn0     (sBox_21_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_21_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_21_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_21_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_21_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_22 (
    .io_sbIn0     (sBox_22_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_22_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_22_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_22_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_22_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  SBox sBox_23 (
    .io_sbIn0     (sBox_23_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (sBox_23_io_sbIn1[7:0]   ), //i
    .io_m         (sBox_23_io_m[37:0]      ), //i
    .io_sbOut0    (sBox_23_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (sBox_23_io_sbOut1[7:0]  ), //o
    .clk          (clk                     ), //i
    .reset        (reset                   )  //i
  );
  assign sBox_20_io_sbIn0 = io_ksIn0[31 : 24];
  assign sBox_20_io_sbIn1 = io_ksIn1[31 : 24];
  assign sBox_20_io_m = io_m[151 : 114];
  always @(*) begin
    sBoxOut0[31 : 24] = sBox_20_io_sbOut0;
    sBoxOut0[23 : 16] = sBox_21_io_sbOut0;
    sBoxOut0[15 : 8] = sBox_22_io_sbOut0;
    sBoxOut0[7 : 0] = sBox_23_io_sbOut0;
  end

  always @(*) begin
    sBoxOut1[31 : 24] = sBox_20_io_sbOut1;
    sBoxOut1[23 : 16] = sBox_21_io_sbOut1;
    sBoxOut1[15 : 8] = sBox_22_io_sbOut1;
    sBoxOut1[7 : 0] = sBox_23_io_sbOut1;
  end

  assign sBox_21_io_sbIn0 = io_ksIn0[23 : 16];
  assign sBox_21_io_sbIn1 = io_ksIn1[23 : 16];
  assign sBox_21_io_m = io_m[113 : 76];
  assign sBox_22_io_sbIn0 = io_ksIn0[15 : 8];
  assign sBox_22_io_sbIn1 = io_ksIn1[15 : 8];
  assign sBox_22_io_m = io_m[75 : 38];
  assign sBox_23_io_sbIn0 = io_ksIn0[7 : 0];
  assign sBox_23_io_sbIn1 = io_ksIn1[7 : 0];
  assign sBox_23_io_m = io_m[37 : 0];
  assign rc = ({24'd0,io_rc} <<< 24);
  assign w00 = ((io_ksIn0[127 : 96] ^ {sBoxOut0[23 : 0],sBoxOut0[31 : 24]}) ^ {io_rc,24'h0});
  assign w01 = (io_ksIn1[127 : 96] ^ {sBoxOut1[23 : 0],sBoxOut1[31 : 24]});
  assign w10 = (io_ksIn0[95 : 64] ^ w00);
  assign w11 = (io_ksIn1[95 : 64] ^ w01);
  assign w20 = (io_ksIn0[63 : 32] ^ w10);
  assign w21 = (io_ksIn1[63 : 32] ^ w11);
  assign w30 = (io_ksIn0[31 : 0] ^ w20);
  assign w31 = (io_ksIn1[31 : 0] ^ w21);
  assign io_ksOut0 = {{{w00,w10},w20},w30};
  assign io_ksOut1 = {{{w01,w11},w21},w31};

endmodule

//MixColumns replaced by MixColumns

//MixColumns replaced by MixColumns

//MixColumns replaced by MixColumns

//MixColumns replaced by MixColumns

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

//ShiftRows replaced by ShiftRows

module ShiftRows (
  input      [127:0]  io_shiftRowsInput,
  output     [127:0]  io_shiftRowsOutput
);


  assign io_shiftRowsOutput = {{{{{{{{{{{{{{{io_shiftRowsInput[127 : 120],io_shiftRowsInput[87 : 80]},io_shiftRowsInput[47 : 40]},io_shiftRowsInput[7 : 0]},io_shiftRowsInput[95 : 88]},io_shiftRowsInput[55 : 48]},io_shiftRowsInput[15 : 8]},io_shiftRowsInput[103 : 96]},io_shiftRowsInput[63 : 56]},io_shiftRowsInput[23 : 16]},io_shiftRowsInput[111 : 104]},io_shiftRowsInput[71 : 64]},io_shiftRowsInput[31 : 24]},io_shiftRowsInput[119 : 112]},io_shiftRowsInput[79 : 72]},io_shiftRowsInput[39 : 32]};

endmodule

//AddRoundKey replaced by AddRoundKey

module AddRoundKey (
  input      [127:0]  io_akIn,
  input      [127:0]  io_rk,
  output     [127:0]  io_akOut
);


  assign io_akOut = (io_akIn ^ io_rk);

endmodule

//SBox replaced by SBox

//SBox replaced by SBox

//SBox replaced by SBox

module SBox (
  input      [7:0]    io_sbIn0,
  input      [7:0]    io_sbIn1,
  input      [37:0]   io_m,
  output     [7:0]    io_sbOut0,
  output     [7:0]    io_sbOut1,
  input               clk,
  input               reset
);

  wire       [7:0]    convert0_io_output;
  wire       [7:0]    convert1_io_output;
  wire       [7:0]    convert2_io_output;
  wire       [7:0]    convert3_io_output;
  wire       [7:0]    inv_io_z_0;
  wire       [7:0]    inv_io_z_1;
  reg                 dummy;

  NewBasis convert0 (
    .io_input        (io_sbIn0[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert0_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert1 (
    .io_input        (io_sbIn1[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert1_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert2 (
    .io_input        (inv_io_z_0[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert2_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  NewBasis convert3 (
    .io_input        (inv_io_z_1[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert3_io_output[7:0]  ), //o
    .clk             (clk                      ), //i
    .reset           (reset                    )  //i
  );
  G256Inv2Shares5Stages inv (
    .io_x_0    (convert0_io_output[7:0]  ), //i
    .io_x_1    (convert1_io_output[7:0]  ), //i
    .io_m      (io_m[37:0]               ), //i
    .io_z_0    (inv_io_z_0[7:0]          ), //o
    .io_z_1    (inv_io_z_1[7:0]          ), //o
    .clk       (clk                      ), //i
    .reset     (reset                    )  //i
  );
  assign io_sbOut0 = (convert2_io_output ^ 8'h63);
  assign io_sbOut1 = convert3_io_output;

endmodule

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256Inv2Shares5Stages replaced by G256Inv2Shares5Stages

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

module G256Inv2Shares5Stages (
  input      [7:0]    io_x_0,
  input      [7:0]    io_x_1,
  input      [37:0]   io_m,
  output     [7:0]    io_z_0,
  output     [7:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [11:0]   mul1_io_m;
  wire       [3:0]    mul2_io_m;
  wire       [3:0]    mul3_io_m;
  wire       [3:0]    inv_io_x_0;
  wire       [3:0]    inv_io_x_1;
  wire       [17:0]   inv_io_m;
  wire       [3:0]    g16SqSc_40_io_t;
  wire       [3:0]    g16SqSc_41_io_t;
  wire       [3:0]    mul1_io_z_0;
  wire       [3:0]    mul1_io_z_1;
  wire       [3:0]    mul2_io_z_0;
  wire       [3:0]    mul2_io_z_1;
  wire       [3:0]    mul3_io_z_0;
  wire       [3:0]    mul3_io_z_1;
  wire       [3:0]    inv_io_z_0;
  wire       [3:0]    inv_io_z_1;
  wire       [3:0]    g16SqSc_40_io_x;
  wire       [3:0]    g16SqSc_41_io_x;
  wire       [3:0]    a_0;
  wire       [3:0]    a_1;
  wire       [3:0]    b_0;
  wire       [3:0]    b_1;
  wire       [3:0]    d_0;
  wire       [3:0]    d_1;
  wire       [3:0]    e_0;
  wire       [3:0]    e_1;
  wire       [3:0]    f_0;
  wire       [3:0]    f_1;
  wire       [3:0]    p_0;
  wire       [3:0]    p_1;
  wire       [3:0]    q_0;
  wire       [3:0]    q_1;
  reg        [3:0]    a1_0;
  reg        [3:0]    a1_1;
  reg        [3:0]    a2_0;
  reg        [3:0]    a2_1;
  reg        [3:0]    a3_0;
  reg        [3:0]    a3_1;
  reg        [3:0]    b1_0;
  reg        [3:0]    b1_1;
  reg        [3:0]    b2_0;
  reg        [3:0]    b2_1;
  reg        [3:0]    b3_0;
  reg        [3:0]    b3_1;
  reg        [3:0]    c_0;
  reg        [3:0]    c_1;

  G16Mul2SharesDepMul mul1 (
    .io_x_0    (a_0[3:0]          ), //i
    .io_x_1    (a_1[3:0]          ), //i
    .io_y_0    (b_0[3:0]          ), //i
    .io_y_1    (b_1[3:0]          ), //i
    .io_m      (mul1_io_m[11:0]   ), //i
    .io_z_0    (mul1_io_z_0[3:0]  ), //o
    .io_z_1    (mul1_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Mul2SharesIndepMul mul2 (
    .io_x_0    (b3_0[3:0]         ), //i
    .io_x_1    (b3_1[3:0]         ), //i
    .io_y_0    (f_0[3:0]          ), //i
    .io_y_1    (f_1[3:0]          ), //i
    .io_m      (mul2_io_m[3:0]    ), //i
    .io_z_0    (mul2_io_z_0[3:0]  ), //o
    .io_z_1    (mul2_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Mul2SharesIndepMul mul3 (
    .io_x_0    (a3_0[3:0]         ), //i
    .io_x_1    (a3_1[3:0]         ), //i
    .io_y_0    (f_0[3:0]          ), //i
    .io_y_1    (f_1[3:0]          ), //i
    .io_m      (mul3_io_m[3:0]    ), //i
    .io_z_0    (mul3_io_z_0[3:0]  ), //o
    .io_z_1    (mul3_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G16Inv2SharesDep inv (
    .io_x_0    (inv_io_x_0[3:0]  ), //i
    .io_x_1    (inv_io_x_1[3:0]  ), //i
    .io_m      (inv_io_m[17:0]   ), //i
    .io_z_0    (inv_io_z_0[3:0]  ), //o
    .io_z_1    (inv_io_z_1[3:0]  ), //o
    .clk       (clk              ), //i
    .reset     (reset            )  //i
  );
  G16SqSc g16SqSc_40 (
    .io_t    (g16SqSc_40_io_t[3:0]  ), //i
    .io_x    (g16SqSc_40_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_41 (
    .io_t    (g16SqSc_41_io_t[3:0]  ), //i
    .io_x    (g16SqSc_41_io_x[3:0]  )  //o
  );
  assign a_0 = io_x_0[7 : 4];
  assign b_0 = io_x_0[3 : 0];
  assign a_1 = io_x_1[7 : 4];
  assign b_1 = io_x_1[3 : 0];
  assign g16SqSc_40_io_t = (a_0 ^ b_0);
  assign g16SqSc_41_io_t = (a_1 ^ b_1);
  assign mul1_io_m = io_m[37 : 26];
  assign d_0 = mul1_io_z_0;
  assign d_1 = mul1_io_z_1;
  assign inv_io_x_0 = (c_0 ^ d_0);
  assign inv_io_x_1 = (c_1 ^ d_1);
  assign inv_io_m = io_m[25 : 8];
  assign f_0 = inv_io_z_0;
  assign f_1 = inv_io_z_1;
  assign mul2_io_m = io_m[7 : 4];
  assign p_0 = mul2_io_z_0;
  assign p_1 = mul2_io_z_1;
  assign mul3_io_m = io_m[3 : 0];
  assign q_0 = mul3_io_z_0;
  assign q_1 = mul3_io_z_1;
  assign io_z_0 = {p_0,q_0};
  assign io_z_1 = {p_1,q_1};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      a1_0 <= 4'b0000;
      a1_1 <= 4'b0000;
      a2_0 <= 4'b0000;
      a2_1 <= 4'b0000;
      a3_0 <= 4'b0000;
      a3_1 <= 4'b0000;
      b1_0 <= 4'b0000;
      b1_1 <= 4'b0000;
      b2_0 <= 4'b0000;
      b2_1 <= 4'b0000;
      b3_0 <= 4'b0000;
      b3_1 <= 4'b0000;
      c_0 <= 4'b0000;
      c_1 <= 4'b0000;
    end else begin
      a1_0 <= a_0;
      a2_0 <= a1_0;
      a3_0 <= a2_0;
      b1_0 <= b_0;
      b2_0 <= b1_0;
      b3_0 <= b2_0;
      a1_1 <= a_1;
      a2_1 <= a1_1;
      a3_1 <= a2_1;
      b1_1 <= b_1;
      b2_1 <= b1_1;
      b3_1 <= b2_1;
      c_0 <= g16SqSc_40_io_x;
      c_1 <= g16SqSc_41_io_x;
    end
  end


endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

module NewBasis (
  input      [7:0]    io_input,
  input               io_direction,
  output reg [7:0]    io_output,
  input               clk,
  input               reset
);

  wire                dummy;
  wire       [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  wire                when_NewBasis_l35;

  assign dummy = 1'b0;
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

  assign when_NewBasis_l35 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l35) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Inv2SharesDep replaced by G16Inv2SharesDep

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesDepMul replaced by G16Mul2SharesDepMul

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
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [17:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [5:0]    mul1_io_m;
  wire       [5:0]    mul2_io_m;
  wire       [5:0]    mul3_io_m;
  wire       [1:0]    g4Sq_160_io_t;
  wire       [1:0]    g4Sq_161_io_t;
  wire       [1:0]    g4Sq_162_io_t;
  wire       [1:0]    g4Sq_163_io_t;
  wire       [1:0]    mul1_io_z_0;
  wire       [1:0]    mul1_io_z_1;
  wire       [1:0]    mul2_io_z_0;
  wire       [1:0]    mul2_io_z_1;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  wire       [1:0]    g4Sq_160_io_x;
  wire       [1:0]    g4ScaleN_320_io_x;
  wire       [1:0]    g4Sq_161_io_x;
  wire       [1:0]    g4Sq_162_io_x;
  wire       [1:0]    g4ScaleN_321_io_x;
  wire       [1:0]    g4Sq_163_io_x;
  wire       [1:0]    a_0;
  wire       [1:0]    a_1;
  wire       [1:0]    b_0;
  wire       [1:0]    b_1;
  wire       [1:0]    d_0;
  wire       [1:0]    d_1;
  wire       [1:0]    e_0;
  wire       [1:0]    e_1;
  wire       [1:0]    p_0;
  wire       [1:0]    p_1;
  wire       [1:0]    q_0;
  wire       [1:0]    q_1;
  reg        [1:0]    c_0;
  reg        [1:0]    c_1;
  reg        [1:0]    a1_0;
  reg        [1:0]    a1_1;
  reg        [1:0]    b1_0;
  reg        [1:0]    b1_1;

  G4Mul2SharesDepMul mul1 (
    .io_x_0    (a_0[1:0]          ), //i
    .io_x_1    (a_1[1:0]          ), //i
    .io_y_0    (b_0[1:0]          ), //i
    .io_y_1    (b_1[1:0]          ), //i
    .io_m      (mul1_io_m[5:0]    ), //i
    .io_z_0    (mul1_io_z_0[1:0]  ), //o
    .io_z_1    (mul1_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Mul2SharesDepMul mul2 (
    .io_x_0    (b1_0[1:0]         ), //i
    .io_x_1    (b1_1[1:0]         ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_m      (mul2_io_m[5:0]    ), //i
    .io_z_0    (mul2_io_z_0[1:0]  ), //o
    .io_z_1    (mul2_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Mul2SharesDepMul mul3 (
    .io_x_0    (a1_0[1:0]         ), //i
    .io_x_1    (a1_1[1:0]         ), //i
    .io_y_0    (e_0[1:0]          ), //i
    .io_y_1    (e_1[1:0]          ), //i
    .io_m      (mul3_io_m[5:0]    ), //i
    .io_z_0    (mul3_io_z_0[1:0]  ), //o
    .io_z_1    (mul3_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  G4Sq g4Sq_160 (
    .io_t    (g4Sq_160_io_t[1:0]  ), //i
    .io_x    (g4Sq_160_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_320 (
    .io_t    (g4Sq_160_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_320_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_161 (
    .io_t    (g4Sq_161_io_t[1:0]  ), //i
    .io_x    (g4Sq_161_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_162 (
    .io_t    (g4Sq_162_io_t[1:0]  ), //i
    .io_x    (g4Sq_162_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_321 (
    .io_t    (g4Sq_162_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_321_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_163 (
    .io_t    (g4Sq_163_io_t[1:0]  ), //i
    .io_x    (g4Sq_163_io_x[1:0]  )  //o
  );
  assign a_0 = io_x_0[3 : 2];
  assign b_0 = io_x_0[1 : 0];
  assign g4Sq_160_io_t = (a_0 ^ b_0);
  assign g4Sq_161_io_t = (c_0 ^ d_0);
  assign e_0 = g4Sq_161_io_x;
  assign a_1 = io_x_1[3 : 2];
  assign b_1 = io_x_1[1 : 0];
  assign g4Sq_162_io_t = (a_1 ^ b_1);
  assign g4Sq_163_io_t = (c_1 ^ d_1);
  assign e_1 = g4Sq_163_io_x;
  assign mul1_io_m = io_m[17 : 12];
  assign d_0 = mul1_io_z_0;
  assign d_1 = mul1_io_z_1;
  assign mul2_io_m = io_m[11 : 6];
  assign p_0 = mul2_io_z_0;
  assign p_1 = mul2_io_z_1;
  assign mul3_io_m = io_m[5 : 0];
  assign q_0 = mul3_io_z_0;
  assign q_1 = mul3_io_z_1;
  assign io_z_0 = {p_0,q_0};
  assign io_z_1 = {p_1,q_1};
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      c_0 <= 2'b00;
      c_1 <= 2'b00;
      a1_0 <= 2'b00;
      a1_1 <= 2'b00;
      b1_0 <= 2'b00;
      b1_1 <= 2'b00;
    end else begin
      a1_0 <= a_0;
      b1_0 <= b_0;
      c_0 <= g4ScaleN_320_io_x;
      a1_1 <= a_1;
      b1_1 <= b_1;
      c_1 <= g4ScaleN_321_io_x;
    end
  end


endmodule

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

module G16Mul2SharesDepMul (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    mul3_io_m;
  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_z_0;
  wire       [3:0]    mul3_io_z_1;
  reg        [3:0]    x_0;
  reg        [3:0]    x_1;
  reg        [3:0]    yz_0;
  reg        [3:0]    yz_1;
  wire       [3:0]    z_0;
  wire       [3:0]    z_1;
  wire       [3:0]    b;

  G16Mul mul1 (
    .io_a    (x_0[3:0]        ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (x_1[3:0]        ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul2SharesIndepMul mul3 (
    .io_x_0    (io_x_0[3:0]       ), //i
    .io_x_1    (io_x_1[3:0]       ), //i
    .io_y_0    (z_0[3:0]          ), //i
    .io_y_1    (z_1[3:0]          ), //i
    .io_m      (mul3_io_m[3:0]    ), //i
    .io_z_0    (mul3_io_z_0[3:0]  ), //o
    .io_z_1    (mul3_io_z_1[3:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  assign z_0 = io_m[7 : 4];
  assign z_1 = io_m[3 : 0];
  assign b = (yz_0 ^ yz_1);
  assign mul3_io_m = io_m[11 : 8];
  assign io_z_0 = (mul3_io_z_0 ^ mul1_io_x);
  assign io_z_1 = (mul3_io_z_1 ^ mul2_io_x);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      x_0 <= 4'b0000;
      x_1 <= 4'b0000;
      yz_0 <= 4'b0000;
      yz_1 <= 4'b0000;
    end else begin
      x_0 <= io_x_0;
      yz_0 <= (z_0 ^ io_y_0);
      x_1 <= io_x_1;
      yz_1 <= (z_1 ^ io_y_1);
    end
  end


endmodule

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G4Mul2SharesDepMul replaced by G4Mul2SharesDepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

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
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [5:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [1:0]    mul3_io_m;
  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_z_0;
  wire       [1:0]    mul3_io_z_1;
  reg        [1:0]    x_0;
  reg        [1:0]    x_1;
  reg        [1:0]    yz_0;
  reg        [1:0]    yz_1;
  wire       [1:0]    z_0;
  wire       [1:0]    z_1;
  wire       [1:0]    b;

  G4Mul mul1 (
    .io_a    (x_0[1:0]        ), //i
    .io_b    (b[1:0]          ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (x_1[1:0]        ), //i
    .io_b    (b[1:0]          ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul2SharesIndepMul mul3 (
    .io_x_0    (io_x_0[1:0]       ), //i
    .io_x_1    (io_x_1[1:0]       ), //i
    .io_y_0    (z_0[1:0]          ), //i
    .io_y_1    (z_1[1:0]          ), //i
    .io_m      (mul3_io_m[1:0]    ), //i
    .io_z_0    (mul3_io_z_0[1:0]  ), //o
    .io_z_1    (mul3_io_z_1[1:0]  ), //o
    .clk       (clk               ), //i
    .reset     (reset             )  //i
  );
  assign z_0 = io_m[3 : 2];
  assign z_1 = io_m[1 : 0];
  assign b = (yz_0 ^ yz_1);
  assign mul3_io_m = io_m[5 : 4];
  assign io_z_0 = (mul3_io_z_0 ^ mul1_io_x);
  assign io_z_1 = (mul3_io_z_1 ^ mul2_io_x);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      x_0 <= 2'b00;
      x_1 <= 2'b00;
      yz_0 <= 2'b00;
      yz_1 <= 2'b00;
    end else begin
      x_0 <= io_x_0;
      yz_0 <= (z_0 ^ io_y_0);
      x_1 <= io_x_1;
      yz_1 <= (z_1 ^ io_y_1);
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

module G16Mul2SharesIndepMul (
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_x;
  wire       [3:0]    mul4_io_x;
  reg        [3:0]    r0;
  reg        [3:0]    r1;
  reg        [3:0]    r2;
  reg        [3:0]    r3;

  G16Mul mul1 (
    .io_a    (io_x_0[3:0]     ), //i
    .io_b    (io_y_0[3:0]     ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (io_x_0[3:0]     ), //i
    .io_b    (io_y_1[3:0]     ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul mul3 (
    .io_a    (io_x_1[3:0]     ), //i
    .io_b    (io_y_0[3:0]     ), //i
    .io_x    (mul3_io_x[3:0]  )  //o
  );
  G16Mul mul4 (
    .io_a    (io_x_1[3:0]     ), //i
    .io_b    (io_y_1[3:0]     ), //i
    .io_x    (mul4_io_x[3:0]  )  //o
  );
  assign io_z_0 = (r0 ^ r1);
  assign io_z_1 = (r2 ^ r3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      r0 <= 4'b0000;
      r1 <= 4'b0000;
      r2 <= 4'b0000;
      r3 <= 4'b0000;
    end else begin
      r0 <= mul1_io_x;
      r1 <= (mul2_io_x ^ io_m);
      r2 <= (mul3_io_x ^ io_m);
      r3 <= mul4_io_x;
    end
  end


endmodule

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

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

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul2SharesIndepMul replaced by G4Mul2SharesIndepMul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

module G4Mul2SharesIndepMul (
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [1:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1,
  input               clk,
  input               reset
);

  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    mul4_io_x;
  wire       [1:0]    x0y0;
  wire       [1:0]    x0y1;
  wire       [1:0]    x1y0;
  wire       [1:0]    x1y1;
  reg        [1:0]    r0;
  reg        [1:0]    r1;
  reg        [1:0]    r2;
  reg        [1:0]    r3;

  G4Mul mul1 (
    .io_a    (io_x_0[1:0]     ), //i
    .io_b    (io_y_0[1:0]     ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (io_x_0[1:0]     ), //i
    .io_b    (io_y_1[1:0]     ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (io_x_1[1:0]     ), //i
    .io_b    (io_y_0[1:0]     ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  G4Mul mul4 (
    .io_a    (io_x_1[1:0]     ), //i
    .io_b    (io_y_1[1:0]     ), //i
    .io_x    (mul4_io_x[1:0]  )  //o
  );
  assign x0y0 = mul1_io_x;
  assign x0y1 = mul2_io_x;
  assign x1y0 = mul3_io_x;
  assign x1y1 = mul4_io_x;
  assign io_z_0 = (r0 ^ r1);
  assign io_z_1 = (r2 ^ r3);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      r0 <= 2'b00;
      r1 <= 2'b00;
      r2 <= 2'b00;
      r3 <= 2'b00;
    end else begin
      r0 <= x0y0;
      r1 <= (x0y1 ^ io_m);
      r2 <= (x1y0 ^ io_m);
      r3 <= x1y1;
    end
  end


endmodule

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

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

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
