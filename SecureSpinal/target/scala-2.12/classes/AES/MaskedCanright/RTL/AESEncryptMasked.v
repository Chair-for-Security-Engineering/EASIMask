// Generator : SpinalHDL v1.6.1    git head : 8addf7fa9969a9cb92e967e4bc42178878175609
// Component : AESEncryptMasked
// Git hash  : 8addf7fa9969a9cb92e967e4bc42178878175609



module AESEncryptMasked (
  input               io_reset,
  input      [127:0]  io_p_0,
  input      [127:0]  io_p_1,
  input      [127:0]  io_k_0,
  input      [127:0]  io_k_1,
  input      [159:0]  io_m,
  output     [127:0]  io_c_0,
  output     [127:0]  io_c_1,
  output reg          io_done,
  input               clk,
  input               reset
);

  wire       [7:0]    canrightSBoxMasked_20_io_A;
  wire       [7:0]    canrightSBoxMasked_20_io_M;
  wire       [7:0]    canrightSBoxMasked_20_io_S;
  wire       [7:0]    canrightSBoxMasked_21_io_A;
  wire       [7:0]    canrightSBoxMasked_21_io_M;
  wire       [7:0]    canrightSBoxMasked_21_io_S;
  wire       [7:0]    canrightSBoxMasked_22_io_A;
  wire       [7:0]    canrightSBoxMasked_22_io_M;
  wire       [7:0]    canrightSBoxMasked_22_io_S;
  wire       [7:0]    canrightSBoxMasked_23_io_A;
  wire       [7:0]    canrightSBoxMasked_23_io_M;
  wire       [7:0]    canrightSBoxMasked_23_io_S;
  wire       [7:0]    canrightSBoxMasked_24_io_A;
  wire       [7:0]    canrightSBoxMasked_24_io_M;
  wire       [7:0]    canrightSBoxMasked_24_io_S;
  wire       [7:0]    canrightSBoxMasked_25_io_A;
  wire       [7:0]    canrightSBoxMasked_25_io_M;
  wire       [7:0]    canrightSBoxMasked_25_io_S;
  wire       [7:0]    canrightSBoxMasked_26_io_A;
  wire       [7:0]    canrightSBoxMasked_26_io_M;
  wire       [7:0]    canrightSBoxMasked_26_io_S;
  wire       [7:0]    canrightSBoxMasked_27_io_A;
  wire       [7:0]    canrightSBoxMasked_27_io_M;
  wire       [7:0]    canrightSBoxMasked_27_io_S;
  wire       [7:0]    canrightSBoxMasked_28_io_A;
  wire       [7:0]    canrightSBoxMasked_28_io_M;
  wire       [7:0]    canrightSBoxMasked_28_io_S;
  wire       [7:0]    canrightSBoxMasked_29_io_A;
  wire       [7:0]    canrightSBoxMasked_29_io_M;
  wire       [7:0]    canrightSBoxMasked_29_io_S;
  wire       [7:0]    canrightSBoxMasked_30_io_A;
  wire       [7:0]    canrightSBoxMasked_30_io_M;
  wire       [7:0]    canrightSBoxMasked_30_io_S;
  wire       [7:0]    canrightSBoxMasked_31_io_A;
  wire       [7:0]    canrightSBoxMasked_31_io_M;
  wire       [7:0]    canrightSBoxMasked_31_io_S;
  wire       [7:0]    canrightSBoxMasked_32_io_A;
  wire       [7:0]    canrightSBoxMasked_32_io_M;
  wire       [7:0]    canrightSBoxMasked_32_io_S;
  wire       [7:0]    canrightSBoxMasked_33_io_A;
  wire       [7:0]    canrightSBoxMasked_33_io_M;
  wire       [7:0]    canrightSBoxMasked_33_io_S;
  wire       [7:0]    canrightSBoxMasked_34_io_A;
  wire       [7:0]    canrightSBoxMasked_34_io_M;
  wire       [7:0]    canrightSBoxMasked_34_io_S;
  wire       [7:0]    canrightSBoxMasked_35_io_A;
  wire       [7:0]    canrightSBoxMasked_35_io_M;
  wire       [7:0]    canrightSBoxMasked_35_io_S;
  wire       [31:0]   mixColumns_8_io_mixColumnsInput;
  wire       [31:0]   mixColumns_9_io_mixColumnsInput;
  wire       [31:0]   mixColumns_10_io_mixColumnsInput;
  wire       [31:0]   mixColumns_11_io_mixColumnsInput;
  wire       [31:0]   mixColumns_12_io_mixColumnsInput;
  wire       [31:0]   mixColumns_13_io_mixColumnsInput;
  wire       [31:0]   mixColumns_14_io_mixColumnsInput;
  wire       [31:0]   mixColumns_15_io_mixColumnsInput;
  wire       [31:0]   keySchedule_io_m;
  wire       [127:0]  addKey_io_b_0;
  wire       [127:0]  addKey_io_b_1;
  wire       [7:0]    canrightSBoxMasked_20_io_Q;
  wire       [7:0]    canrightSBoxMasked_21_io_Q;
  wire       [7:0]    canrightSBoxMasked_22_io_Q;
  wire       [7:0]    canrightSBoxMasked_23_io_Q;
  wire       [7:0]    canrightSBoxMasked_24_io_Q;
  wire       [7:0]    canrightSBoxMasked_25_io_Q;
  wire       [7:0]    canrightSBoxMasked_26_io_Q;
  wire       [7:0]    canrightSBoxMasked_27_io_Q;
  wire       [7:0]    canrightSBoxMasked_28_io_Q;
  wire       [7:0]    canrightSBoxMasked_29_io_Q;
  wire       [7:0]    canrightSBoxMasked_30_io_Q;
  wire       [7:0]    canrightSBoxMasked_31_io_Q;
  wire       [7:0]    canrightSBoxMasked_32_io_Q;
  wire       [7:0]    canrightSBoxMasked_33_io_Q;
  wire       [7:0]    canrightSBoxMasked_34_io_Q;
  wire       [7:0]    canrightSBoxMasked_35_io_Q;
  wire       [127:0]  shiftRows_2_io_shiftRowsOutput;
  wire       [127:0]  shiftRows_3_io_shiftRowsOutput;
  wire       [31:0]   mixColumns_8_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_9_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_10_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_11_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_12_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_13_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_14_io_mixColumnsOutput;
  wire       [31:0]   mixColumns_15_io_mixColumnsOutput;
  wire       [127:0]  keySchedule_io_keyScheduleOutput_0;
  wire       [127:0]  keySchedule_io_keyScheduleOutput_1;
  wire       [8:0]    _zz_roundConstant;
  wire       [8:0]    _zz_roundConstant_1;
  reg        [127:0]  stateRegister_0;
  reg        [127:0]  stateRegister_1;
  reg        [127:0]  keyRegister_0;
  reg        [127:0]  keyRegister_1;
  reg        [3:0]    round;
  reg        [7:0]    roundConstant;
  reg                 incRC;
  reg                 lastRound;
  wire       [127:0]  KA_0;
  wire       [127:0]  KA_1;
  reg        [127:0]  SB_0;
  reg        [127:0]  SB_1;
  wire       [127:0]  SR_0;
  wire       [127:0]  SR_1;
  reg        [127:0]  MC_0;
  reg        [127:0]  MC_1;
  wire                when_AESEncryptMasked_l83;
  wire                when_AESEncryptMasked_l93;
  reg                 io_reset_regNext;
  wire                when_AESEncryptMasked_l103;
  reg                 lastRound_regNext;
  wire                when_AESEncryptMasked_l114;

  assign _zz_roundConstant = ({1'd0,roundConstant} <<< 1);
  assign _zz_roundConstant_1 = ({1'd0,roundConstant} <<< 1);
  AddRoundKeyMasked addKey (
    .io_a_0    (stateRegister_0[127:0]  ), //i
    .io_a_1    (stateRegister_1[127:0]  ), //i
    .io_k_0    (keyRegister_0[127:0]    ), //i
    .io_k_1    (keyRegister_1[127:0]    ), //i
    .io_b_0    (addKey_io_b_0[127:0]    ), //o
    .io_b_1    (addKey_io_b_1[127:0]    )  //o
  );
  CanrightSBoxMasked canrightSBoxMasked_20 (
    .io_A     (canrightSBoxMasked_20_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_20_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_20_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_20_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_21 (
    .io_A     (canrightSBoxMasked_21_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_21_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_21_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_21_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_22 (
    .io_A     (canrightSBoxMasked_22_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_22_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_22_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_22_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_23 (
    .io_A     (canrightSBoxMasked_23_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_23_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_23_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_23_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_24 (
    .io_A     (canrightSBoxMasked_24_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_24_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_24_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_24_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_25 (
    .io_A     (canrightSBoxMasked_25_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_25_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_25_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_25_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_26 (
    .io_A     (canrightSBoxMasked_26_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_26_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_26_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_26_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_27 (
    .io_A     (canrightSBoxMasked_27_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_27_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_27_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_27_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_28 (
    .io_A     (canrightSBoxMasked_28_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_28_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_28_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_28_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_29 (
    .io_A     (canrightSBoxMasked_29_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_29_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_29_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_29_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_30 (
    .io_A     (canrightSBoxMasked_30_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_30_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_30_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_30_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_31 (
    .io_A     (canrightSBoxMasked_31_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_31_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_31_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_31_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_32 (
    .io_A     (canrightSBoxMasked_32_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_32_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_32_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_32_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_33 (
    .io_A     (canrightSBoxMasked_33_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_33_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_33_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_33_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_34 (
    .io_A     (canrightSBoxMasked_34_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_34_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_34_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_34_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_35 (
    .io_A     (canrightSBoxMasked_35_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_35_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_35_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_35_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  ShiftRows shiftRows_2 (
    .io_shiftRowsInput     (SB_0[127:0]                            ), //i
    .io_shiftRowsOutput    (shiftRows_2_io_shiftRowsOutput[127:0]  )  //o
  );
  ShiftRows shiftRows_3 (
    .io_shiftRowsInput     (SB_1[127:0]                            ), //i
    .io_shiftRowsOutput    (shiftRows_3_io_shiftRowsOutput[127:0]  )  //o
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
  KeyScheduleMasked keySchedule (
    .io_keyScheduleInput_0     (keyRegister_0[127:0]                       ), //i
    .io_keyScheduleInput_1     (keyRegister_1[127:0]                       ), //i
    .io_m                      (keySchedule_io_m[31:0]                     ), //i
    .io_RC                     (roundConstant[7:0]                         ), //i
    .io_keyScheduleOutput_0    (keySchedule_io_keyScheduleOutput_0[127:0]  ), //o
    .io_keyScheduleOutput_1    (keySchedule_io_keyScheduleOutput_1[127:0]  ), //o
    .clk                       (clk                                        ), //i
    .reset                     (reset                                      )  //i
  );
  assign KA_0 = addKey_io_b_0;
  assign KA_1 = addKey_io_b_1;
  assign canrightSBoxMasked_20_io_A = KA_0[7 : 0];
  assign canrightSBoxMasked_20_io_M = KA_1[7 : 0];
  assign canrightSBoxMasked_20_io_S = io_m[159 : 152];
  always @(*) begin
    SB_1[7 : 0] = io_m[159 : 152];
    SB_1[15 : 8] = io_m[151 : 144];
    SB_1[23 : 16] = io_m[143 : 136];
    SB_1[31 : 24] = io_m[135 : 128];
    SB_1[39 : 32] = io_m[127 : 120];
    SB_1[47 : 40] = io_m[119 : 112];
    SB_1[55 : 48] = io_m[111 : 104];
    SB_1[63 : 56] = io_m[103 : 96];
    SB_1[71 : 64] = io_m[95 : 88];
    SB_1[79 : 72] = io_m[87 : 80];
    SB_1[87 : 80] = io_m[79 : 72];
    SB_1[95 : 88] = io_m[71 : 64];
    SB_1[103 : 96] = io_m[63 : 56];
    SB_1[111 : 104] = io_m[55 : 48];
    SB_1[119 : 112] = io_m[47 : 40];
    SB_1[127 : 120] = io_m[39 : 32];
  end

  always @(*) begin
    SB_0[7 : 0] = canrightSBoxMasked_20_io_Q;
    SB_0[15 : 8] = canrightSBoxMasked_21_io_Q;
    SB_0[23 : 16] = canrightSBoxMasked_22_io_Q;
    SB_0[31 : 24] = canrightSBoxMasked_23_io_Q;
    SB_0[39 : 32] = canrightSBoxMasked_24_io_Q;
    SB_0[47 : 40] = canrightSBoxMasked_25_io_Q;
    SB_0[55 : 48] = canrightSBoxMasked_26_io_Q;
    SB_0[63 : 56] = canrightSBoxMasked_27_io_Q;
    SB_0[71 : 64] = canrightSBoxMasked_28_io_Q;
    SB_0[79 : 72] = canrightSBoxMasked_29_io_Q;
    SB_0[87 : 80] = canrightSBoxMasked_30_io_Q;
    SB_0[95 : 88] = canrightSBoxMasked_31_io_Q;
    SB_0[103 : 96] = canrightSBoxMasked_32_io_Q;
    SB_0[111 : 104] = canrightSBoxMasked_33_io_Q;
    SB_0[119 : 112] = canrightSBoxMasked_34_io_Q;
    SB_0[127 : 120] = canrightSBoxMasked_35_io_Q;
  end

  assign canrightSBoxMasked_21_io_A = KA_0[15 : 8];
  assign canrightSBoxMasked_21_io_M = KA_1[15 : 8];
  assign canrightSBoxMasked_21_io_S = io_m[151 : 144];
  assign canrightSBoxMasked_22_io_A = KA_0[23 : 16];
  assign canrightSBoxMasked_22_io_M = KA_1[23 : 16];
  assign canrightSBoxMasked_22_io_S = io_m[143 : 136];
  assign canrightSBoxMasked_23_io_A = KA_0[31 : 24];
  assign canrightSBoxMasked_23_io_M = KA_1[31 : 24];
  assign canrightSBoxMasked_23_io_S = io_m[135 : 128];
  assign canrightSBoxMasked_24_io_A = KA_0[39 : 32];
  assign canrightSBoxMasked_24_io_M = KA_1[39 : 32];
  assign canrightSBoxMasked_24_io_S = io_m[127 : 120];
  assign canrightSBoxMasked_25_io_A = KA_0[47 : 40];
  assign canrightSBoxMasked_25_io_M = KA_1[47 : 40];
  assign canrightSBoxMasked_25_io_S = io_m[119 : 112];
  assign canrightSBoxMasked_26_io_A = KA_0[55 : 48];
  assign canrightSBoxMasked_26_io_M = KA_1[55 : 48];
  assign canrightSBoxMasked_26_io_S = io_m[111 : 104];
  assign canrightSBoxMasked_27_io_A = KA_0[63 : 56];
  assign canrightSBoxMasked_27_io_M = KA_1[63 : 56];
  assign canrightSBoxMasked_27_io_S = io_m[103 : 96];
  assign canrightSBoxMasked_28_io_A = KA_0[71 : 64];
  assign canrightSBoxMasked_28_io_M = KA_1[71 : 64];
  assign canrightSBoxMasked_28_io_S = io_m[95 : 88];
  assign canrightSBoxMasked_29_io_A = KA_0[79 : 72];
  assign canrightSBoxMasked_29_io_M = KA_1[79 : 72];
  assign canrightSBoxMasked_29_io_S = io_m[87 : 80];
  assign canrightSBoxMasked_30_io_A = KA_0[87 : 80];
  assign canrightSBoxMasked_30_io_M = KA_1[87 : 80];
  assign canrightSBoxMasked_30_io_S = io_m[79 : 72];
  assign canrightSBoxMasked_31_io_A = KA_0[95 : 88];
  assign canrightSBoxMasked_31_io_M = KA_1[95 : 88];
  assign canrightSBoxMasked_31_io_S = io_m[71 : 64];
  assign canrightSBoxMasked_32_io_A = KA_0[103 : 96];
  assign canrightSBoxMasked_32_io_M = KA_1[103 : 96];
  assign canrightSBoxMasked_32_io_S = io_m[63 : 56];
  assign canrightSBoxMasked_33_io_A = KA_0[111 : 104];
  assign canrightSBoxMasked_33_io_M = KA_1[111 : 104];
  assign canrightSBoxMasked_33_io_S = io_m[55 : 48];
  assign canrightSBoxMasked_34_io_A = KA_0[119 : 112];
  assign canrightSBoxMasked_34_io_M = KA_1[119 : 112];
  assign canrightSBoxMasked_34_io_S = io_m[47 : 40];
  assign canrightSBoxMasked_35_io_A = KA_0[127 : 120];
  assign canrightSBoxMasked_35_io_M = KA_1[127 : 120];
  assign canrightSBoxMasked_35_io_S = io_m[39 : 32];
  assign SR_0 = shiftRows_2_io_shiftRowsOutput;
  assign SR_1 = shiftRows_3_io_shiftRowsOutput;
  assign mixColumns_8_io_mixColumnsInput = SR_0[31 : 0];
  always @(*) begin
    MC_0[31 : 0] = mixColumns_8_io_mixColumnsOutput;
    MC_0[63 : 32] = mixColumns_9_io_mixColumnsOutput;
    MC_0[95 : 64] = mixColumns_10_io_mixColumnsOutput;
    MC_0[127 : 96] = mixColumns_11_io_mixColumnsOutput;
  end

  assign mixColumns_9_io_mixColumnsInput = SR_0[63 : 32];
  assign mixColumns_10_io_mixColumnsInput = SR_0[95 : 64];
  assign mixColumns_11_io_mixColumnsInput = SR_0[127 : 96];
  assign mixColumns_12_io_mixColumnsInput = SR_1[31 : 0];
  always @(*) begin
    MC_1[31 : 0] = mixColumns_12_io_mixColumnsOutput;
    MC_1[63 : 32] = mixColumns_13_io_mixColumnsOutput;
    MC_1[95 : 64] = mixColumns_14_io_mixColumnsOutput;
    MC_1[127 : 96] = mixColumns_15_io_mixColumnsOutput;
  end

  assign mixColumns_13_io_mixColumnsInput = SR_1[63 : 32];
  assign mixColumns_14_io_mixColumnsInput = SR_1[95 : 64];
  assign mixColumns_15_io_mixColumnsInput = SR_1[127 : 96];
  assign keySchedule_io_m = io_m[31 : 0];
  assign when_AESEncryptMasked_l83 = (roundConstant < 8'h80);
  assign when_AESEncryptMasked_l93 = (round == 4'b1001);
  assign when_AESEncryptMasked_l103 = ((! io_reset) && io_reset_regNext);
  assign io_c_0 = KA_0;
  assign io_c_1 = KA_1;
  assign when_AESEncryptMasked_l114 = ((! lastRound) && lastRound_regNext);
  always @(*) begin
    if(when_AESEncryptMasked_l114) begin
      io_done = 1'b1;
    end else begin
      io_done = 1'b0;
    end
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      stateRegister_0 <= 128'h0;
      stateRegister_1 <= 128'h0;
      keyRegister_0 <= 128'h0;
      keyRegister_1 <= 128'h0;
      round <= 4'b0000;
      roundConstant <= 8'h01;
      incRC <= 1'b0;
      lastRound <= 1'b0;
    end else begin
      keyRegister_0 <= keySchedule_io_keyScheduleOutput_0;
      keyRegister_1 <= keySchedule_io_keyScheduleOutput_1;
      if(io_reset) begin
        round <= 4'b0000;
        lastRound <= 1'b0;
        incRC <= 1'b0;
      end else begin
        round <= (round + 4'b0001);
        incRC <= 1'b1;
      end
      if(incRC) begin
        if(when_AESEncryptMasked_l83) begin
          roundConstant <= _zz_roundConstant[7 : 0];
        end else begin
          roundConstant <= (_zz_roundConstant_1[7 : 0] ^ 8'h1b);
        end
      end else begin
        roundConstant <= 8'h01;
      end
      if(when_AESEncryptMasked_l93) begin
        lastRound <= 1'b1;
      end else begin
        lastRound <= 1'b0;
      end
      if(when_AESEncryptMasked_l103) begin
        stateRegister_0 <= io_p_0;
        stateRegister_1 <= io_p_1;
        keyRegister_0 <= io_k_0;
        keyRegister_1 <= io_k_1;
      end else begin
        if(lastRound) begin
          stateRegister_0 <= SR_0;
          stateRegister_1 <= SR_1;
        end else begin
          stateRegister_0 <= MC_0;
          stateRegister_1 <= MC_1;
        end
      end
    end
  end

  always @(posedge clk) begin
    io_reset_regNext <= io_reset;
    lastRound_regNext <= lastRound;
  end


endmodule

module KeyScheduleMasked (
  input      [127:0]  io_keyScheduleInput_0,
  input      [127:0]  io_keyScheduleInput_1,
  input      [31:0]   io_m,
  input      [7:0]    io_RC,
  output     [127:0]  io_keyScheduleOutput_0,
  output     [127:0]  io_keyScheduleOutput_1,
  input               clk,
  input               reset
);

  wire       [7:0]    canrightSBoxMasked_20_io_A;
  wire       [7:0]    canrightSBoxMasked_20_io_M;
  wire       [7:0]    canrightSBoxMasked_20_io_S;
  wire       [7:0]    canrightSBoxMasked_21_io_A;
  wire       [7:0]    canrightSBoxMasked_21_io_M;
  wire       [7:0]    canrightSBoxMasked_21_io_S;
  wire       [7:0]    canrightSBoxMasked_22_io_A;
  wire       [7:0]    canrightSBoxMasked_22_io_M;
  wire       [7:0]    canrightSBoxMasked_22_io_S;
  wire       [7:0]    canrightSBoxMasked_23_io_A;
  wire       [7:0]    canrightSBoxMasked_23_io_M;
  wire       [7:0]    canrightSBoxMasked_23_io_S;
  wire       [7:0]    canrightSBoxMasked_20_io_Q;
  wire       [7:0]    canrightSBoxMasked_21_io_Q;
  wire       [7:0]    canrightSBoxMasked_22_io_Q;
  wire       [7:0]    canrightSBoxMasked_23_io_Q;
  wire       [31:0]   w1;
  wire       [31:0]   w2;
  wire       [31:0]   w3;
  wire       [31:0]   w4;
  reg        [31:0]   SB;
  wire       [31:0]   m1;
  wire       [31:0]   m2;
  wire       [31:0]   m3;
  wire       [31:0]   m4;

  CanrightSBoxMasked canrightSBoxMasked_20 (
    .io_A     (canrightSBoxMasked_20_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_20_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_20_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_20_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_21 (
    .io_A     (canrightSBoxMasked_21_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_21_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_21_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_21_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_22 (
    .io_A     (canrightSBoxMasked_22_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_22_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_22_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_22_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  CanrightSBoxMasked canrightSBoxMasked_23 (
    .io_A     (canrightSBoxMasked_23_io_A[7:0]  ), //i
    .io_M     (canrightSBoxMasked_23_io_M[7:0]  ), //i
    .io_S     (canrightSBoxMasked_23_io_S[7:0]  ), //i
    .io_Q     (canrightSBoxMasked_23_io_Q[7:0]  ), //o
    .clk      (clk                              ), //i
    .reset    (reset                            )  //i
  );
  assign canrightSBoxMasked_20_io_A = io_keyScheduleInput_0[31 : 24];
  assign canrightSBoxMasked_20_io_M = io_keyScheduleInput_1[31 : 24];
  assign canrightSBoxMasked_20_io_S = io_m[31 : 24];
  always @(*) begin
    SB[31 : 24] = canrightSBoxMasked_20_io_Q;
    SB[23 : 16] = canrightSBoxMasked_21_io_Q;
    SB[15 : 8] = canrightSBoxMasked_22_io_Q;
    SB[7 : 0] = canrightSBoxMasked_23_io_Q;
  end

  assign canrightSBoxMasked_21_io_A = io_keyScheduleInput_0[23 : 16];
  assign canrightSBoxMasked_21_io_M = io_keyScheduleInput_1[23 : 16];
  assign canrightSBoxMasked_21_io_S = io_m[23 : 16];
  assign canrightSBoxMasked_22_io_A = io_keyScheduleInput_0[15 : 8];
  assign canrightSBoxMasked_22_io_M = io_keyScheduleInput_1[15 : 8];
  assign canrightSBoxMasked_22_io_S = io_m[15 : 8];
  assign canrightSBoxMasked_23_io_A = io_keyScheduleInput_0[7 : 0];
  assign canrightSBoxMasked_23_io_M = io_keyScheduleInput_1[7 : 0];
  assign canrightSBoxMasked_23_io_S = io_m[7 : 0];
  assign w1 = ((io_keyScheduleInput_0[127 : 96] ^ {SB[23 : 0],SB[31 : 24]}) ^ {io_RC,24'h0});
  assign w2 = (io_keyScheduleInput_0[95 : 64] ^ w1);
  assign w3 = (io_keyScheduleInput_0[63 : 32] ^ w2);
  assign w4 = (io_keyScheduleInput_0[31 : 0] ^ w3);
  assign m1 = (io_keyScheduleInput_1[127 : 96] ^ {io_m[23 : 0],io_m[31 : 24]});
  assign m2 = (io_keyScheduleInput_1[95 : 64] ^ m1);
  assign m3 = (io_keyScheduleInput_1[63 : 32] ^ m2);
  assign m4 = (io_keyScheduleInput_1[31 : 0] ^ m3);
  assign io_keyScheduleOutput_0 = {{{w1,w2},w3},w4};
  assign io_keyScheduleOutput_1 = {{{m1,m2},m3},m4};

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
  wire                when_MixColumns_l29;
  reg        [8:0]    _zz_io_mixColumnsOutput_1;
  wire                when_MixColumns_l29_1;
  reg        [8:0]    _zz_io_mixColumnsOutput_2;
  wire                when_MixColumns_l29_2;
  reg        [8:0]    _zz_io_mixColumnsOutput_3;
  wire                when_MixColumns_l29_3;
  reg        [8:0]    _zz_io_mixColumnsOutput_4;
  wire                when_MixColumns_l29_4;
  reg        [8:0]    _zz_io_mixColumnsOutput_5;
  wire                when_MixColumns_l29_5;
  reg        [8:0]    _zz_io_mixColumnsOutput_6;
  wire                when_MixColumns_l29_6;
  reg        [8:0]    _zz_io_mixColumnsOutput_7;
  wire                when_MixColumns_l29_7;

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
  assign when_MixColumns_l29 = a0[7];
  always @(*) begin
    if(when_MixColumns_l29) begin
      _zz_io_mixColumnsOutput = (_zz__zz_io_mixColumnsOutput ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l29_1 = a1[7];
  always @(*) begin
    if(when_MixColumns_l29_1) begin
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

  assign when_MixColumns_l29_2 = a1[7];
  always @(*) begin
    if(when_MixColumns_l29_2) begin
      _zz_io_mixColumnsOutput_2 = (_zz__zz_io_mixColumnsOutput_2 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumns_l29_3 = a2[7];
  always @(*) begin
    if(when_MixColumns_l29_3) begin
      _zz_io_mixColumnsOutput_3 = (_zz__zz_io_mixColumnsOutput_3 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l29_4 = a2[7];
  always @(*) begin
    if(when_MixColumns_l29_4) begin
      _zz_io_mixColumnsOutput_4 = (_zz__zz_io_mixColumnsOutput_4 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_4 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l29_5 = a3[7];
  always @(*) begin
    if(when_MixColumns_l29_5) begin
      _zz_io_mixColumnsOutput_5 = (_zz__zz_io_mixColumnsOutput_5 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_5 = ({1'd0,a3} <<< 1);
    end
  end

  assign when_MixColumns_l29_6 = a0[7];
  always @(*) begin
    if(when_MixColumns_l29_6) begin
      _zz_io_mixColumnsOutput_6 = (_zz__zz_io_mixColumnsOutput_6 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_6 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l29_7 = a3[7];
  always @(*) begin
    if(when_MixColumns_l29_7) begin
      _zz_io_mixColumnsOutput_7 = (_zz__zz_io_mixColumnsOutput_7 ^ 9'h11b);
    end else begin
      _zz_io_mixColumnsOutput_7 = ({1'd0,a3} <<< 1);
    end
  end


endmodule

//ShiftRows replaced by ShiftRows

module ShiftRows (
  input      [127:0]  io_shiftRowsInput,
  output     [127:0]  io_shiftRowsOutput
);

  wire       [127:0]  a;

  assign a = io_shiftRowsInput;
  assign io_shiftRowsOutput = {{{{{{{{{{{{{{{a[127 : 120],a[87 : 80]},a[47 : 40]},a[7 : 0]},a[95 : 88]},a[55 : 48]},a[15 : 8]},a[103 : 96]},a[63 : 56]},a[23 : 16]},a[111 : 104]},a[71 : 64]},a[31 : 24]},a[119 : 112]},a[79 : 72]},a[39 : 32]};

endmodule

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

module AddRoundKeyMasked (
  input      [127:0]  io_a_0,
  input      [127:0]  io_a_1,
  input      [127:0]  io_k_0,
  input      [127:0]  io_k_1,
  output     [127:0]  io_b_0,
  output     [127:0]  io_b_1
);


  assign io_b_0 = (io_a_0 ^ io_k_0);
  assign io_b_1 = (io_a_1 ^ io_k_1);

endmodule

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

//CanrightSBoxMasked replaced by CanrightSBoxMasked

module CanrightSBoxMasked (
  input      [7:0]    io_A,
  input      [7:0]    io_M,
  input      [7:0]    io_S,
  output     [7:0]    io_Q,
  input               clk,
  input               reset
);

  wire       [7:0]    inv_io_AInv;
  wire       [7:0]    transform1_io_output;
  wire       [7:0]    transform2_io_output;
  wire       [7:0]    transform3_io_output;
  wire                dummy;
  wire       [7:0]    ATransformed;
  wire       [7:0]    MTransformed;
  reg        [7:0]    STransformed;
  wire       [7:0]    AInv;

  G256InvMaskedOptimized inv (
    .io_A       (ATransformed[7:0]  ), //i
    .io_M       (MTransformed[7:0]  ), //i
    .io_S       (STransformed[7:0]  ), //i
    .io_AInv    (inv_io_AInv[7:0]   ), //o
    .clk        (clk                ), //i
    .reset      (reset              )  //i
  );
  NewBasis transform1 (
    .io_input        (io_A[7:0]                  ), //i
    .io_direction    (1'b0                       ), //i
    .io_output       (transform1_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis transform2 (
    .io_input        (io_M[7:0]                  ), //i
    .io_direction    (1'b0                       ), //i
    .io_output       (transform2_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  NewBasis transform3 (
    .io_input        (AInv[7:0]                  ), //i
    .io_direction    (1'b1                       ), //i
    .io_output       (transform3_io_output[7:0]  ), //o
    .clk             (clk                        ), //i
    .reset           (reset                      )  //i
  );
  assign dummy = 1'b0;
  assign ATransformed = transform1_io_output;
  assign MTransformed = transform2_io_output;
  always @(*) begin
    STransformed[7] = (io_S[7] ^ io_S[4]);
    STransformed[6] = (((io_S[6] ^ io_S[4]) ^ io_S[1]) ^ io_S[0]);
    STransformed[5] = (io_S[6] ^ io_S[4]);
    STransformed[4] = (((io_S[6] ^ io_S[3]) ^ io_S[1]) ^ io_S[0]);
    STransformed[3] = ((io_S[7] ^ io_S[6]) ^ io_S[4]);
    STransformed[2] = ((io_S[7] ^ io_S[5]) ^ io_S[2]);
    STransformed[1] = ((io_S[4] ^ io_S[3]) ^ io_S[0]);
    STransformed[0] = ((((io_S[6] ^ io_S[5]) ^ io_S[4]) ^ io_S[1]) ^ io_S[0]);
  end

  assign AInv = inv_io_AInv;
  assign io_Q = (transform3_io_output ^ 8'h63);

endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

//G256InvMaskedOptimized replaced by G256InvMaskedOptimized

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
  wire                when_NewBasis_l45;

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

  assign when_NewBasis_l45 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l45) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

module G256InvMaskedOptimized (
  input      [7:0]    io_A,
  input      [7:0]    io_M,
  input      [7:0]    io_S,
  output     [7:0]    io_AInv,
  input               clk,
  input               reset
);

  wire       [3:0]    scale1_io_t;
  wire       [3:0]    scale2_io_t;
  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_x;
  wire       [3:0]    mul4_io_x;
  wire       [3:0]    mul5_io_x;
  wire       [3:0]    mul6_io_x;
  wire       [3:0]    mul7_io_x;
  wire       [3:0]    mul8_io_x;
  wire       [3:0]    scale1_io_x;
  wire       [3:0]    scale2_io_x;
  wire       [3:0]    inv_io_BInv;
  wire                dummy;
  wire       [3:0]    A1A0;
  wire       [3:0]    A1;
  wire       [3:0]    A0;
  wire       [3:0]    M2;
  wire       [3:0]    M1;
  wire       [3:0]    M0;
  wire       [3:0]    B;
  wire       [3:0]    BInv;
  wire       [3:0]    B2Inv;
  wire       [3:0]    A1M0;
  wire       [3:0]    A0M1;
  wire       [3:0]    M1M0;
  wire       [3:0]    M0XorM1;
  wire       [3:0]    C;
  wire       [3:0]    S1;
  wire       [3:0]    S0;
  wire       [3:0]    A0B;
  wire       [3:0]    A1B;
  wire       [3:0]    M0B;
  wire       [3:0]    M1B;
  wire       [3:0]    A1Inv;
  wire       [3:0]    A0Inv;

  G16Mul mul1 (
    .io_a    (A1[3:0]         ), //i
    .io_b    (A0[3:0]         ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (A1[3:0]         ), //i
    .io_b    (M0[3:0]         ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul mul3 (
    .io_a    (A0[3:0]         ), //i
    .io_b    (M1[3:0]         ), //i
    .io_x    (mul3_io_x[3:0]  )  //o
  );
  G16Mul mul4 (
    .io_a    (M1[3:0]         ), //i
    .io_b    (M0[3:0]         ), //i
    .io_x    (mul4_io_x[3:0]  )  //o
  );
  G16Mul mul5 (
    .io_a    (A0[3:0]         ), //i
    .io_b    (BInv[3:0]       ), //i
    .io_x    (mul5_io_x[3:0]  )  //o
  );
  G16Mul mul6 (
    .io_a    (M0[3:0]         ), //i
    .io_b    (BInv[3:0]       ), //i
    .io_x    (mul6_io_x[3:0]  )  //o
  );
  G16Mul mul7 (
    .io_a    (A1[3:0]         ), //i
    .io_b    (B2Inv[3:0]      ), //i
    .io_x    (mul7_io_x[3:0]  )  //o
  );
  G16Mul mul8 (
    .io_a    (M1[3:0]         ), //i
    .io_b    (B2Inv[3:0]      ), //i
    .io_x    (mul8_io_x[3:0]  )  //o
  );
  G16SqSc scale1 (
    .io_t    (scale1_io_t[3:0]  ), //i
    .io_x    (scale1_io_x[3:0]  )  //o
  );
  G16SqSc scale2 (
    .io_t    (scale2_io_t[3:0]  ), //i
    .io_x    (scale2_io_x[3:0]  )  //o
  );
  G16InvMaskedOptimized inv (
    .io_B       (B[3:0]            ), //i
    .io_M       (M2[3:0]           ), //i
    .io_M1      (M1[3:0]           ), //i
    .io_BInv    (inv_io_BInv[3:0]  )  //o
  );
  assign dummy = 1'b0;
  assign A1 = io_A[7 : 4];
  assign A0 = io_A[3 : 0];
  assign M1 = io_M[7 : 4];
  assign M0 = io_M[3 : 0];
  assign S1 = io_S[7 : 4];
  assign S0 = io_S[3 : 0];
  assign A1A0 = mul1_io_x;
  assign A1M0 = mul2_io_x;
  assign A0M1 = mul3_io_x;
  assign M1M0 = mul4_io_x;
  assign scale1_io_t = (A1 ^ A0);
  assign C = scale1_io_x;
  assign scale2_io_t = (M1 ^ M0);
  assign M2 = scale2_io_x;
  assign B = ((((C ^ A1A0) ^ A1M0) ^ A0M1) ^ M1M0);
  assign BInv = inv_io_BInv;
  assign A0B = mul5_io_x;
  assign M0B = mul6_io_x;
  assign A1B = mul7_io_x;
  assign M1B = mul8_io_x;
  assign M0XorM1 = (M0 ^ M1);
  assign B2Inv = (BInv ^ M0XorM1);
  assign A1Inv = ((((S1 ^ A0B) ^ A0M1) ^ M0B) ^ M1M0);
  assign A0Inv = ((((S0 ^ A1B) ^ A1M0) ^ M1B) ^ M1M0);
  assign io_AInv = {A1Inv,A0Inv};

endmodule

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16InvMaskedOptimized replaced by G16InvMaskedOptimized

//G16SqSc replaced by G16SqSc

//G16SqSc replaced by G16SqSc

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

//G16Mul replaced by G16Mul

module G16InvMaskedOptimized (
  input      [3:0]    io_B,
  input      [3:0]    io_M,
  input      [3:0]    io_M1,
  output     [3:0]    io_BInv
);

  wire       [1:0]    square_io_t;
  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    mul4_io_x;
  wire       [1:0]    mul5_io_x;
  wire       [1:0]    mul6_io_x;
  wire       [1:0]    mul7_io_x;
  wire       [1:0]    mul8_io_x;
  wire       [1:0]    square_io_x;
  wire       [1:0]    scale1_io_x;
  wire       [1:0]    inv_io_x;
  wire       [1:0]    scale2_io_x;
  wire       [1:0]    b1;
  wire       [1:0]    b0;
  wire       [1:0]    b1Inv;
  wire       [1:0]    b0Inv;
  wire       [1:0]    m2;
  wire       [1:0]    m1;
  wire       [1:0]    m0;
  wire       [1:0]    c;
  wire       [1:0]    d;
  wire       [1:0]    b1b0;
  wire       [1:0]    b1m0;
  wire       [1:0]    b0m1;
  wire       [1:0]    m1m0;
  wire       [1:0]    cInv;
  wire       [1:0]    c2Inv;
  wire       [1:0]    b0c;
  wire       [1:0]    b0m2;
  wire       [1:0]    m0c;
  wire       [1:0]    m0m2;
  wire       [1:0]    b1c;
  wire       [1:0]    b1m2;
  wire       [1:0]    m1c;
  wire       [1:0]    m1m2;
  wire       [1:0]    m1Xorm2;
  wire       [1:0]    m0Xorm1;

  G4Mul mul1 (
    .io_a    (b1[1:0]         ), //i
    .io_b    (b0[1:0]         ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (b1[1:0]         ), //i
    .io_b    (m0[1:0]         ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (b0[1:0]         ), //i
    .io_b    (m1[1:0]         ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  G4Mul mul4 (
    .io_a    (m1[1:0]         ), //i
    .io_b    (m0[1:0]         ), //i
    .io_x    (mul4_io_x[1:0]  )  //o
  );
  G4Mul mul5 (
    .io_a    (b0[1:0]         ), //i
    .io_b    (cInv[1:0]       ), //i
    .io_x    (mul5_io_x[1:0]  )  //o
  );
  G4Mul mul6 (
    .io_a    (m0[1:0]         ), //i
    .io_b    (cInv[1:0]       ), //i
    .io_x    (mul6_io_x[1:0]  )  //o
  );
  G4Mul mul7 (
    .io_a    (b1[1:0]         ), //i
    .io_b    (c2Inv[1:0]      ), //i
    .io_x    (mul7_io_x[1:0]  )  //o
  );
  G4Mul mul8 (
    .io_a    (m1[1:0]         ), //i
    .io_b    (c2Inv[1:0]      ), //i
    .io_x    (mul8_io_x[1:0]  )  //o
  );
  G4Sq square (
    .io_t    (square_io_t[1:0]  ), //i
    .io_x    (square_io_x[1:0]  )  //o
  );
  G4ScaleN scale1 (
    .io_t    (square_io_x[1:0]  ), //i
    .io_x    (scale1_io_x[1:0]  )  //o
  );
  G4Sq inv (
    .io_t    (c[1:0]         ), //i
    .io_x    (inv_io_x[1:0]  )  //o
  );
  G4ScaleN2 scale2 (
    .io_t    (m0Xorm1[1:0]      ), //i
    .io_x    (scale2_io_x[1:0]  )  //o
  );
  assign b1 = io_B[3 : 2];
  assign b0 = io_B[1 : 0];
  assign m1 = io_M[3 : 2];
  assign m0 = io_M[1 : 0];
  assign square_io_t = (b1 ^ b0);
  assign d = scale1_io_x;
  assign b1b0 = mul1_io_x;
  assign b1m0 = mul2_io_x;
  assign b0m1 = mul3_io_x;
  assign m1m0 = mul4_io_x;
  assign c = ((((d ^ b1b0) ^ b1m0) ^ b0m1) ^ m1m0);
  assign m1Xorm2 = (m1 ^ m2);
  assign m0Xorm1 = (m0 ^ m1);
  assign cInv = (inv_io_x ^ m1Xorm2);
  assign m2 = scale2_io_x;
  assign c2Inv = (cInv ^ m0Xorm1);
  assign b0c = mul5_io_x;
  assign m0c = mul6_io_x;
  assign b1c = mul7_io_x;
  assign m1c = mul8_io_x;
  assign b1Inv = ((((io_M1[3 : 2] ^ b0c) ^ b0m1) ^ m0c) ^ m1m0);
  assign b0Inv = ((((io_M1[1 : 0] ^ b1c) ^ b1m0) ^ m1c) ^ m1m0);
  assign io_BInv = {b1Inv,b0Inv};

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

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

//G4ScaleN2 replaced by G4ScaleN2

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

//G4Sq replaced by G4Sq

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

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

module G4Sq (
  input      [1:0]    io_t,
  output     [1:0]    io_x
);


  assign io_x = {io_t[0],io_t[1]};

endmodule

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
