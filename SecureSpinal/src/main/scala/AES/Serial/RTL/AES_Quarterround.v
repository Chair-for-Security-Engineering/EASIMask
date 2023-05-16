// Generator : SpinalHDL v1.6.2    git head : b35dce327aac7da3d63fe591d87ab216ac6ce79b
// Component : AES_Quarterround
// Git hash  : b35dce327aac7da3d63fe591d87ab216ac6ce79b

`timescale 1ns/1ps 

module AES_Quarterround (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [31:0]   io_p,
  input      [31:0]   io_k,
  output     [31:0]   io_c,
  output reg          io_done
);
  localparam QuarterroundStates_sIdle = 2'd0;
  localparam QuarterroundStates_sInit = 2'd1;
  localparam QuarterroundStates_sExecute = 2'd2;
  localparam QuarterroundStates_sDone = 2'd3;

  wire       [7:0]    addroundkey_1_io_b;
  wire       [7:0]    sbox_io_subBytesOutput;
  wire       [7:0]    mixcolumns_1_io_mcOut1;
  wire       [7:0]    mixcolumns_1_io_mcOut2;
  wire       [7:0]    mixcolumns_1_io_mcOut3;
  wire       [7:0]    mixcolumns_1_io_mcOut4;
  wire       [2:0]    _zz_ctr_valueNext;
  wire       [0:0]    _zz_ctr_valueNext_1;
  reg        [1:0]    aesState;
  reg        [7:0]    stateReg_0;
  reg        [7:0]    stateReg_1;
  reg        [7:0]    stateReg_2;
  reg        [7:0]    stateReg_3;
  reg        [7:0]    keyReg_0;
  reg        [7:0]    keyReg_1;
  reg        [7:0]    keyReg_2;
  reg        [7:0]    keyReg_3;
  reg                 ctr_willIncrement;
  wire                ctr_willClear;
  reg        [2:0]    ctr_valueNext;
  reg        [2:0]    ctr_value;
  wire                ctr_willOverflowIfInc;
  wire                ctr_willOverflow;
  reg                 initData;
  reg                 stateRotation;
  reg                 mixColumnsRotation;
  wire                when_AES_Quarterround_l103;
  wire                when_AES_Quarterround_l108;
  `ifndef SYNTHESIS
  reg [63:0] aesState_string;
  `endif


  assign _zz_ctr_valueNext_1 = ctr_willIncrement;
  assign _zz_ctr_valueNext = {2'd0, _zz_ctr_valueNext_1};
  AddRoundKey addroundkey_1 (
    .io_a    (stateReg_0[7:0]          ), //i
    .io_k    (keyReg_0[7:0]            ), //i
    .io_b    (addroundkey_1_io_b[7:0]  )  //o
  );
  CanrightSBox sbox (
    .io_subBytesInput     (addroundkey_1_io_b[7:0]      ), //i
    .io_subBytesOutput    (sbox_io_subBytesOutput[7:0]  ), //o
    .io_clk               (io_clk                       ), //i
    .io_reset             (io_reset                     )  //i
  );
  MixColumns mixcolumns_1 (
    .io_mcIn1     (stateReg_0[7:0]              ), //i
    .io_mcIn2     (stateReg_1[7:0]              ), //i
    .io_mcIn3     (stateReg_2[7:0]              ), //i
    .io_mcIn4     (stateReg_3[7:0]              ), //i
    .io_mcOut1    (mixcolumns_1_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (mixcolumns_1_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (mixcolumns_1_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (mixcolumns_1_io_mcOut4[7:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : aesState_string = "sIdle   ";
      QuarterroundStates_sInit : aesState_string = "sInit   ";
      QuarterroundStates_sExecute : aesState_string = "sExecute";
      QuarterroundStates_sDone : aesState_string = "sDone   ";
      default : aesState_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    ctr_willIncrement = 1'b0;
    case(aesState)
      QuarterroundStates_sIdle : begin
      end
      QuarterroundStates_sInit : begin
      end
      QuarterroundStates_sExecute : begin
        ctr_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign ctr_willClear = 1'b0;
  assign ctr_willOverflowIfInc = (ctr_value == 3'b100);
  assign ctr_willOverflow = (ctr_willOverflowIfInc && ctr_willIncrement);
  always @(*) begin
    if(ctr_willOverflow) begin
      ctr_valueNext = 3'b000;
    end else begin
      ctr_valueNext = (ctr_value + _zz_ctr_valueNext);
    end
    if(ctr_willClear) begin
      ctr_valueNext = 3'b000;
    end
  end

  assign io_c = {{{stateReg_0,stateReg_1},stateReg_2},stateReg_3};
  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        initData = 1'b0;
      end
      QuarterroundStates_sInit : begin
        initData = 1'b1;
      end
      QuarterroundStates_sExecute : begin
        initData = 1'b0;
      end
      default : begin
        initData = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        stateRotation = 1'b0;
      end
      QuarterroundStates_sInit : begin
        stateRotation = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        if(when_AES_Quarterround_l103) begin
          stateRotation = 1'b1;
        end else begin
          stateRotation = 1'b0;
        end
      end
      default : begin
        stateRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        mixColumnsRotation = 1'b0;
      end
      QuarterroundStates_sInit : begin
        mixColumnsRotation = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        if(when_AES_Quarterround_l108) begin
          mixColumnsRotation = 1'b1;
        end else begin
          mixColumnsRotation = 1'b0;
        end
      end
      default : begin
        mixColumnsRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(aesState)
      QuarterroundStates_sIdle : begin
        io_done = 1'b0;
      end
      QuarterroundStates_sInit : begin
        io_done = 1'b0;
      end
      QuarterroundStates_sExecute : begin
        io_done = 1'b0;
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign when_AES_Quarterround_l103 = (ctr_value < 3'b100);
  assign when_AES_Quarterround_l108 = (ctr_value == 3'b100);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      aesState <= QuarterroundStates_sIdle;
      stateReg_0 <= 8'h0;
      stateReg_1 <= 8'h0;
      stateReg_2 <= 8'h0;
      stateReg_3 <= 8'h0;
      keyReg_0 <= 8'h0;
      keyReg_1 <= 8'h0;
      keyReg_2 <= 8'h0;
      keyReg_3 <= 8'h0;
      ctr_value <= 3'b000;
    end else begin
      ctr_value <= ctr_valueNext;
      if(initData) begin
        stateReg_0 <= io_p[31 : 24];
        stateReg_1 <= io_p[23 : 16];
        stateReg_2 <= io_p[15 : 8];
        stateReg_3 <= io_p[7 : 0];
        keyReg_0 <= io_k[31 : 24];
        keyReg_1 <= io_k[23 : 16];
        keyReg_2 <= io_k[15 : 8];
        keyReg_3 <= io_k[7 : 0];
      end
      if(stateRotation) begin
        stateReg_0 <= stateReg_1;
        stateReg_1 <= stateReg_2;
        stateReg_2 <= stateReg_3;
        stateReg_3 <= sbox_io_subBytesOutput;
      end
      if(mixColumnsRotation) begin
        stateReg_0 <= mixcolumns_1_io_mcOut1;
        stateReg_1 <= mixcolumns_1_io_mcOut2;
        stateReg_2 <= mixcolumns_1_io_mcOut3;
        stateReg_3 <= mixcolumns_1_io_mcOut4;
      end
      case(aesState)
        QuarterroundStates_sIdle : begin
          aesState <= QuarterroundStates_sIdle;
          if(io_enable) begin
            aesState <= QuarterroundStates_sInit;
          end
        end
        QuarterroundStates_sInit : begin
          aesState <= QuarterroundStates_sExecute;
        end
        QuarterroundStates_sExecute : begin
          aesState <= QuarterroundStates_sExecute;
          if(ctr_willOverflow) begin
            aesState <= QuarterroundStates_sDone;
          end
        end
        default : begin
          aesState <= QuarterroundStates_sIdle;
        end
      endcase
    end
  end


endmodule

module MixColumns (
  input      [7:0]    io_mcIn1,
  input      [7:0]    io_mcIn2,
  input      [7:0]    io_mcIn3,
  input      [7:0]    io_mcIn4,
  output     [7:0]    io_mcOut1,
  output     [7:0]    io_mcOut2,
  output     [7:0]    io_mcOut3,
  output     [7:0]    io_mcOut4
);

  wire       [8:0]    _zz__zz_io_mcOut1;
  wire       [8:0]    _zz__zz_io_mcOut1_1;
  wire       [8:0]    _zz__zz_io_mcOut2;
  wire       [8:0]    _zz__zz_io_mcOut2_1;
  wire       [8:0]    _zz__zz_io_mcOut3;
  wire       [8:0]    _zz__zz_io_mcOut3_1;
  wire       [8:0]    _zz__zz_io_mcOut4;
  wire       [8:0]    _zz__zz_io_mcOut4_1;
  wire       [7:0]    a1;
  wire       [7:0]    a2;
  wire       [7:0]    a3;
  wire       [7:0]    a0;
  reg        [8:0]    _zz_io_mcOut1;
  wire                when_MixColumns_l26;
  reg        [8:0]    _zz_io_mcOut1_1;
  wire                when_MixColumns_l26_1;
  reg        [8:0]    _zz_io_mcOut2;
  wire                when_MixColumns_l26_2;
  reg        [8:0]    _zz_io_mcOut2_1;
  wire                when_MixColumns_l26_3;
  reg        [8:0]    _zz_io_mcOut3;
  wire                when_MixColumns_l26_4;
  reg        [8:0]    _zz_io_mcOut3_1;
  wire                when_MixColumns_l26_5;
  reg        [8:0]    _zz_io_mcOut4;
  wire                when_MixColumns_l26_6;
  reg        [8:0]    _zz_io_mcOut4_1;
  wire                when_MixColumns_l26_7;

  assign _zz__zz_io_mcOut1 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2 = ({1'd0,a1} <<< 1);
  assign _zz__zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3 = ({1'd0,a2} <<< 1);
  assign _zz__zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
  assign _zz__zz_io_mcOut4 = ({1'd0,a0} <<< 1);
  assign _zz__zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
  assign a0 = io_mcIn1;
  assign a1 = io_mcIn2;
  assign a2 = io_mcIn3;
  assign a3 = io_mcIn4;
  assign when_MixColumns_l26 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26) begin
      _zz_io_mcOut1 = (_zz__zz_io_mcOut1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_1 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_1) begin
      _zz_io_mcOut1_1 = (_zz__zz_io_mcOut1_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut1_1 = ({1'd0,a1} <<< 1);
    end
  end

  assign io_mcOut1 = (((_zz_io_mcOut1[7 : 0] ^ (_zz_io_mcOut1_1[7 : 0] ^ a1)) ^ a2) ^ a3);
  assign when_MixColumns_l26_2 = a1[7];
  always @(*) begin
    if(when_MixColumns_l26_2) begin
      _zz_io_mcOut2 = (_zz__zz_io_mcOut2 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2 = ({1'd0,a1} <<< 1);
    end
  end

  assign when_MixColumns_l26_3 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_3) begin
      _zz_io_mcOut2_1 = (_zz__zz_io_mcOut2_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut2_1 = ({1'd0,a2} <<< 1);
    end
  end

  assign io_mcOut2 = (((a0 ^ _zz_io_mcOut2[7 : 0]) ^ (_zz_io_mcOut2_1[7 : 0] ^ a2)) ^ a3);
  assign when_MixColumns_l26_4 = a2[7];
  always @(*) begin
    if(when_MixColumns_l26_4) begin
      _zz_io_mcOut3 = (_zz__zz_io_mcOut3 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3 = ({1'd0,a2} <<< 1);
    end
  end

  assign when_MixColumns_l26_5 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_5) begin
      _zz_io_mcOut3_1 = (_zz__zz_io_mcOut3_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut3_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut3 = (((a0 ^ a1) ^ _zz_io_mcOut3[7 : 0]) ^ (_zz_io_mcOut3_1[7 : 0] ^ a3));
  assign when_MixColumns_l26_6 = a0[7];
  always @(*) begin
    if(when_MixColumns_l26_6) begin
      _zz_io_mcOut4 = (_zz__zz_io_mcOut4 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4 = ({1'd0,a0} <<< 1);
    end
  end

  assign when_MixColumns_l26_7 = a3[7];
  always @(*) begin
    if(when_MixColumns_l26_7) begin
      _zz_io_mcOut4_1 = (_zz__zz_io_mcOut4_1 ^ 9'h11b);
    end else begin
      _zz_io_mcOut4_1 = ({1'd0,a3} <<< 1);
    end
  end

  assign io_mcOut4 = ((((_zz_io_mcOut4[7 : 0] ^ a0) ^ a1) ^ a2) ^ _zz_io_mcOut4_1[7 : 0]);

endmodule

module CanrightSBox (
  input      [7:0]    io_subBytesInput,
  output     [7:0]    io_subBytesOutput,
  input               io_clk,
  input               io_reset
);

  wire       [7:0]    convertBasis1_io_output;
  wire       [7:0]    convertBasis2_io_output;
  wire       [7:0]    inv_io_x;
  wire                dummy;
  wire       [7:0]    t;
  wire       [7:0]    x;

  NewBasis convertBasis1 (
    .io_input        (io_subBytesInput[7:0]         ), //i
    .io_direction    (1'b0                          ), //i
    .io_output       (convertBasis1_io_output[7:0]  )  //o
  );
  NewBasis convertBasis2 (
    .io_input        (x[7:0]                        ), //i
    .io_direction    (1'b1                          ), //i
    .io_output       (convertBasis2_io_output[7:0]  )  //o
  );
  G256Inv inv (
    .io_t    (t[7:0]         ), //i
    .io_x    (inv_io_x[7:0]  )  //o
  );
  assign dummy = 1'b0;
  assign t = convertBasis1_io_output;
  assign x = inv_io_x;
  assign io_subBytesOutput = (convertBasis2_io_output ^ 8'h63);

endmodule

module AddRoundKey (
  input      [7:0]    io_a,
  input      [7:0]    io_k,
  output     [7:0]    io_b
);


  assign io_b = (io_a ^ io_k);

endmodule

module G256Inv (
  input      [7:0]    io_t,
  output     [7:0]    io_x
);

  wire       [3:0]    sqSc_io_t;
  wire       [3:0]    inv_io_t;
  wire       [3:0]    sqSc_io_x;
  wire       [3:0]    mul1_io_x;
  wire       [3:0]    mul2_io_x;
  wire       [3:0]    mul3_io_x;
  wire       [3:0]    inv_io_x;
  wire       [3:0]    a;
  wire       [3:0]    b;
  wire       [3:0]    c;
  wire       [3:0]    d;
  wire       [3:0]    e;
  wire       [3:0]    p;
  wire       [3:0]    q;

  G16SqSc sqSc (
    .io_t    (sqSc_io_t[3:0]  ), //i
    .io_x    (sqSc_io_x[3:0]  )  //o
  );
  G16Mul mul1 (
    .io_a    (a[3:0]          ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul1_io_x[3:0]  )  //o
  );
  G16Mul mul2 (
    .io_a    (e[3:0]          ), //i
    .io_b    (b[3:0]          ), //i
    .io_x    (mul2_io_x[3:0]  )  //o
  );
  G16Mul mul3 (
    .io_a    (e[3:0]          ), //i
    .io_b    (a[3:0]          ), //i
    .io_x    (mul3_io_x[3:0]  )  //o
  );
  G16Inv inv (
    .io_t    (inv_io_t[3:0]  ), //i
    .io_x    (inv_io_x[3:0]  )  //o
  );
  assign sqSc_io_t = (a ^ b);
  assign c = sqSc_io_x;
  assign d = mul1_io_x;
  assign inv_io_t = (c ^ d);
  assign e = inv_io_x;
  assign p = mul2_io_x;
  assign q = mul3_io_x;
  assign a = io_t[7 : 4];
  assign b = io_t[3 : 0];
  assign io_x = {p,q};

endmodule

//NewBasis replaced by NewBasis

module NewBasis (
  input      [7:0]    io_input,
  input               io_direction,
  output reg [7:0]    io_output
);

  wire       [7:0]    a;
  reg        [7:0]    b;
  reg        [7:0]    c;
  wire                when_NewBasis_l33;

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

  assign when_NewBasis_l33 = (! io_direction);
  always @(*) begin
    if(when_NewBasis_l33) begin
      io_output = b;
    end else begin
      io_output = c;
    end
  end


endmodule

module G16Inv (
  input      [3:0]    io_t,
  output     [3:0]    io_x
);

  wire       [1:0]    square1_io_t;
  wire       [1:0]    square2_io_t;
  wire       [1:0]    scale_io_x;
  wire       [1:0]    square1_io_x;
  wire       [1:0]    square2_io_x;
  wire       [1:0]    mul1_io_x;
  wire       [1:0]    mul2_io_x;
  wire       [1:0]    mul3_io_x;
  wire       [1:0]    a;
  wire       [1:0]    b;
  wire       [1:0]    c;
  wire       [1:0]    d;
  wire       [1:0]    e;
  wire       [1:0]    p;
  wire       [1:0]    q;
  wire       [1:0]    x;

  G4ScaleN scale (
    .io_t    (square1_io_x[1:0]  ), //i
    .io_x    (scale_io_x[1:0]    )  //o
  );
  G4Sq square1 (
    .io_t    (square1_io_t[1:0]  ), //i
    .io_x    (square1_io_x[1:0]  )  //o
  );
  G4Sq square2 (
    .io_t    (square2_io_t[1:0]  ), //i
    .io_x    (square2_io_x[1:0]  )  //o
  );
  G4Mul mul1 (
    .io_a    (a[1:0]          ), //i
    .io_b    (b[1:0]          ), //i
    .io_x    (mul1_io_x[1:0]  )  //o
  );
  G4Mul mul2 (
    .io_a    (e[1:0]          ), //i
    .io_b    (b[1:0]          ), //i
    .io_x    (mul2_io_x[1:0]  )  //o
  );
  G4Mul mul3 (
    .io_a    (e[1:0]          ), //i
    .io_b    (a[1:0]          ), //i
    .io_x    (mul3_io_x[1:0]  )  //o
  );
  assign square1_io_t = (a ^ b);
  assign c = scale_io_x;
  assign d = mul1_io_x;
  assign square2_io_t = (c ^ d);
  assign e = square2_io_x;
  assign p = mul2_io_x;
  assign q = mul3_io_x;
  assign a = io_t[3 : 2];
  assign b = io_t[1 : 0];
  assign io_x = {p,q};

endmodule

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

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Sq replaced by G4Sq

//G4Sq replaced by G4Sq

//G4ScaleN replaced by G4ScaleN

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
