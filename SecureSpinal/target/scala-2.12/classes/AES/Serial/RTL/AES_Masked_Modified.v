// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : AES_Masked_Modified
// Git hash  : 5dddc5a360ffe28dad22b1b12d714c1fa8824bd3

`timescale 1ns/1ps 

module AES_Masked_Modified (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [127:0]  io_pt1,
  input      [127:0]  io_pt2,
  input      [127:0]  io_key1,
  input      [127:0]  io_key2,
  input      [27:0]   io_m,
  output reg [127:0]  io_ct1,
  output reg [127:0]  io_ct2,
  output reg          io_done
);
  localparam States2_sIdle = 2'd0;
  localparam States2_sInit = 2'd1;
  localparam States2_sRound = 2'd2;
  localparam States2_sDone = 2'd3;

  reg        [7:0]    r_sbox_io_sbIn0;
  reg        [7:0]    r_sbox_io_sbIn1;
  wire       [7:0]    r_addroundkey1_io_b;
  wire       [7:0]    r_addroundkey2_io_b;
  wire       [7:0]    r_sbox_io_sbOut0;
  wire       [7:0]    r_sbox_io_sbOut1;
  wire       [7:0]    r_mixcolumns1_io_mcOut1;
  wire       [7:0]    r_mixcolumns1_io_mcOut2;
  wire       [7:0]    r_mixcolumns1_io_mcOut3;
  wire       [7:0]    r_mixcolumns1_io_mcOut4;
  wire       [7:0]    r_mixcolumns2_io_mcOut1;
  wire       [7:0]    r_mixcolumns2_io_mcOut2;
  wire       [7:0]    r_mixcolumns2_io_mcOut3;
  wire       [7:0]    r_mixcolumns2_io_mcOut4;
  wire       [3:0]    _zz_r_round_valueNext;
  wire       [0:0]    _zz_r_round_valueNext_1;
  wire       [1:0]    _zz_r_control1_valueNext;
  wire       [0:0]    _zz_r_control1_valueNext_1;
  wire       [1:0]    _zz_r_control2_valueNext;
  wire       [0:0]    _zz_r_control2_valueNext_1;
  wire       [4:0]    _zz_r_control_valueNext;
  wire       [0:0]    _zz_r_control_valueNext_1;
  wire       [7:0]    _zz_r_roundConstant;
  reg        [7:0]    r_stateReg_0_0_0;
  reg        [7:0]    r_stateReg_0_0_1;
  reg        [7:0]    r_stateReg_0_0_2;
  reg        [7:0]    r_stateReg_0_0_3;
  reg        [7:0]    r_stateReg_0_1_0;
  reg        [7:0]    r_stateReg_0_1_1;
  reg        [7:0]    r_stateReg_0_1_2;
  reg        [7:0]    r_stateReg_0_1_3;
  reg        [7:0]    r_stateReg_0_2_0;
  reg        [7:0]    r_stateReg_0_2_1;
  reg        [7:0]    r_stateReg_0_2_2;
  reg        [7:0]    r_stateReg_0_2_3;
  reg        [7:0]    r_stateReg_0_3_0;
  reg        [7:0]    r_stateReg_0_3_1;
  reg        [7:0]    r_stateReg_0_3_2;
  reg        [7:0]    r_stateReg_0_3_3;
  reg        [7:0]    r_stateReg_1_0_0;
  reg        [7:0]    r_stateReg_1_0_1;
  reg        [7:0]    r_stateReg_1_0_2;
  reg        [7:0]    r_stateReg_1_0_3;
  reg        [7:0]    r_stateReg_1_1_0;
  reg        [7:0]    r_stateReg_1_1_1;
  reg        [7:0]    r_stateReg_1_1_2;
  reg        [7:0]    r_stateReg_1_1_3;
  reg        [7:0]    r_stateReg_1_2_0;
  reg        [7:0]    r_stateReg_1_2_1;
  reg        [7:0]    r_stateReg_1_2_2;
  reg        [7:0]    r_stateReg_1_2_3;
  reg        [7:0]    r_stateReg_1_3_0;
  reg        [7:0]    r_stateReg_1_3_1;
  reg        [7:0]    r_stateReg_1_3_2;
  reg        [7:0]    r_stateReg_1_3_3;
  reg        [7:0]    r_keyReg_0_0_0;
  reg        [7:0]    r_keyReg_0_0_1;
  reg        [7:0]    r_keyReg_0_0_2;
  reg        [7:0]    r_keyReg_0_0_3;
  reg        [7:0]    r_keyReg_0_1_0;
  reg        [7:0]    r_keyReg_0_1_1;
  reg        [7:0]    r_keyReg_0_1_2;
  reg        [7:0]    r_keyReg_0_1_3;
  reg        [7:0]    r_keyReg_0_2_0;
  reg        [7:0]    r_keyReg_0_2_1;
  reg        [7:0]    r_keyReg_0_2_2;
  reg        [7:0]    r_keyReg_0_2_3;
  reg        [7:0]    r_keyReg_0_3_0;
  reg        [7:0]    r_keyReg_0_3_1;
  reg        [7:0]    r_keyReg_0_3_2;
  reg        [7:0]    r_keyReg_0_3_3;
  reg        [7:0]    r_keyReg_1_0_0;
  reg        [7:0]    r_keyReg_1_0_1;
  reg        [7:0]    r_keyReg_1_0_2;
  reg        [7:0]    r_keyReg_1_0_3;
  reg        [7:0]    r_keyReg_1_1_0;
  reg        [7:0]    r_keyReg_1_1_1;
  reg        [7:0]    r_keyReg_1_1_2;
  reg        [7:0]    r_keyReg_1_1_3;
  reg        [7:0]    r_keyReg_1_2_0;
  reg        [7:0]    r_keyReg_1_2_1;
  reg        [7:0]    r_keyReg_1_2_2;
  reg        [7:0]    r_keyReg_1_2_3;
  reg        [7:0]    r_keyReg_1_3_0;
  reg        [7:0]    r_keyReg_1_3_1;
  reg        [7:0]    r_keyReg_1_3_2;
  reg        [7:0]    r_keyReg_1_3_3;
  reg        [1:0]    r_fsmState;
  reg                 r_round_willIncrement;
  reg                 r_round_willClear;
  reg        [3:0]    r_round_valueNext;
  reg        [3:0]    r_round_value;
  wire                r_round_willOverflowIfInc;
  wire                r_round_willOverflow;
  wire                r_control1_willIncrement;
  reg                 r_control1_willClear;
  reg        [1:0]    r_control1_valueNext;
  reg        [1:0]    r_control1_value;
  wire                r_control1_willOverflowIfInc;
  wire                r_control1_willOverflow;
  wire                r_control2_willIncrement;
  reg                 r_control2_willClear;
  reg        [1:0]    r_control2_valueNext;
  reg        [1:0]    r_control2_value;
  wire                r_control2_willOverflowIfInc;
  wire                r_control2_willOverflow;
  reg                 r_control_willIncrement;
  reg                 r_control_willClear;
  reg        [4:0]    r_control_valueNext;
  reg        [4:0]    r_control_value;
  wire                r_control_willOverflowIfInc;
  wire                r_control_willOverflow;
  reg        [7:0]    r_roundConstant;
  wire                when_AES_Masked_Modified_l36;
  reg        [7:0]    r_rc;
  reg                 r_stateRotation;
  reg                 r_shiftRowsRotation;
  reg                 r_mixColumnsRotation;
  reg                 r_keyRotation;
  reg                 r_keyRotation2;
  reg                 r_keySboxRotation;
  reg                 r_keyRCRotation;
  reg                 r_finalKeyAdd;
  reg                 r_finalRound;
  wire                when_AES_Masked_Modified_l74;
  wire                when_AES_Masked_Modified_l407;
  wire                when_AES_Masked_Modified_l409;
  wire                when_AES_Masked_Modified_l417;
  wire                when_AES_Masked_Modified_l423;
  wire                when_AES_Masked_Modified_l429;
  wire                when_AES_Masked_Modified_l431;
  wire                when_AES_Masked_Modified_l441;
  wire                when_AES_Masked_Modified_l447;
  wire                when_AES_Masked_Modified_l453;
  `ifndef SYNTHESIS
  reg [47:0] r_fsmState_string;
  `endif


  assign _zz_r_round_valueNext_1 = r_round_willIncrement;
  assign _zz_r_round_valueNext = {3'd0, _zz_r_round_valueNext_1};
  assign _zz_r_control1_valueNext_1 = r_control1_willIncrement;
  assign _zz_r_control1_valueNext = {1'd0, _zz_r_control1_valueNext_1};
  assign _zz_r_control2_valueNext_1 = r_control2_willIncrement;
  assign _zz_r_control2_valueNext = {1'd0, _zz_r_control2_valueNext_1};
  assign _zz_r_control_valueNext_1 = r_control_willIncrement;
  assign _zz_r_control_valueNext = {4'd0, _zz_r_control_valueNext_1};
  assign _zz_r_roundConstant = (r_roundConstant <<< 1);
  AddRoundKey r_addroundkey1 (
    .io_a    (r_stateReg_0_0_0[7:0]     ), //i
    .io_k    (r_keyReg_0_0_0[7:0]       ), //i
    .io_b    (r_addroundkey1_io_b[7:0]  )  //o
  );
  AddRoundKey r_addroundkey2 (
    .io_a    (r_stateReg_1_0_0[7:0]     ), //i
    .io_k    (r_keyReg_1_0_0[7:0]       ), //i
    .io_b    (r_addroundkey2_io_b[7:0]  )  //o
  );
  SBoxMasked r_sbox (
    .io_clk       (io_clk                 ), //i
    .io_reset     (io_reset               ), //i
    .io_sbIn0     (r_sbox_io_sbIn0[7:0]   ), //i
    .io_sbIn1     (r_sbox_io_sbIn1[7:0]   ), //i
    .io_m         (io_m[27:0]             ), //i
    .io_sbOut0    (r_sbox_io_sbOut0[7:0]  ), //o
    .io_sbOut1    (r_sbox_io_sbOut1[7:0]  )  //o
  );
  MixColumns r_mixcolumns1 (
    .io_mcIn1     (r_stateReg_0_0_0[7:0]         ), //i
    .io_mcIn2     (r_stateReg_0_1_0[7:0]         ), //i
    .io_mcIn3     (r_stateReg_0_2_0[7:0]         ), //i
    .io_mcIn4     (r_stateReg_0_3_0[7:0]         ), //i
    .io_mcOut1    (r_mixcolumns1_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (r_mixcolumns1_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (r_mixcolumns1_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (r_mixcolumns1_io_mcOut4[7:0]  )  //o
  );
  MixColumns r_mixcolumns2 (
    .io_mcIn1     (r_stateReg_1_0_0[7:0]         ), //i
    .io_mcIn2     (r_stateReg_1_1_0[7:0]         ), //i
    .io_mcIn3     (r_stateReg_1_2_0[7:0]         ), //i
    .io_mcIn4     (r_stateReg_1_3_0[7:0]         ), //i
    .io_mcOut1    (r_mixcolumns2_io_mcOut1[7:0]  ), //o
    .io_mcOut2    (r_mixcolumns2_io_mcOut2[7:0]  ), //o
    .io_mcOut3    (r_mixcolumns2_io_mcOut3[7:0]  ), //o
    .io_mcOut4    (r_mixcolumns2_io_mcOut4[7:0]  )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_fsmState)
      States2_sIdle : r_fsmState_string = "sIdle ";
      States2_sInit : r_fsmState_string = "sInit ";
      States2_sRound : r_fsmState_string = "sRound";
      States2_sDone : r_fsmState_string = "sDone ";
      default : r_fsmState_string = "??????";
    endcase
  end
  `endif

  always @(*) begin
    r_round_willIncrement = 1'b0;
    if(r_control_willOverflow) begin
      r_round_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    r_round_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_round_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_round_willOverflowIfInc = (r_round_value == 4'b1011);
  assign r_round_willOverflow = (r_round_willOverflowIfInc && r_round_willIncrement);
  always @(*) begin
    if(r_round_willOverflow) begin
      r_round_valueNext = 4'b0001;
    end else begin
      r_round_valueNext = (r_round_value + _zz_r_round_valueNext);
    end
    if(r_round_willClear) begin
      r_round_valueNext = 4'b0001;
    end
  end

  assign r_control1_willIncrement = 1'b0;
  always @(*) begin
    r_control1_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control1_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_control1_willOverflowIfInc = (r_control1_value == 2'b11);
  assign r_control1_willOverflow = (r_control1_willOverflowIfInc && r_control1_willIncrement);
  always @(*) begin
    r_control1_valueNext = (r_control1_value + _zz_r_control1_valueNext);
    if(r_control1_willClear) begin
      r_control1_valueNext = 2'b00;
    end
  end

  assign r_control2_willIncrement = 1'b0;
  always @(*) begin
    r_control2_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control2_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
      end
    endcase
  end

  assign r_control2_willOverflowIfInc = (r_control2_value == 2'b11);
  assign r_control2_willOverflow = (r_control2_willOverflowIfInc && r_control2_willIncrement);
  always @(*) begin
    r_control2_valueNext = (r_control2_value + _zz_r_control2_valueNext);
    if(r_control2_willClear) begin
      r_control2_valueNext = 2'b00;
    end
  end

  always @(*) begin
    r_control_willIncrement = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        r_control_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_control_willClear = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
        r_control_willClear = 1'b1;
      end
      States2_sInit : begin
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l407) begin
          if(when_AES_Masked_Modified_l409) begin
            r_control_willClear = 1'b1;
          end
        end
      end
      default : begin
      end
    endcase
  end

  assign r_control_willOverflowIfInc = (r_control_value == 5'h18);
  assign r_control_willOverflow = (r_control_willOverflowIfInc && r_control_willIncrement);
  always @(*) begin
    if(r_control_willOverflow) begin
      r_control_valueNext = 5'h0;
    end else begin
      r_control_valueNext = (r_control_value + _zz_r_control_valueNext);
    end
    if(r_control_willClear) begin
      r_control_valueNext = 5'h0;
    end
  end

  assign when_AES_Masked_Modified_l36 = (r_roundConstant < 8'h80);
  assign when_AES_Masked_Modified_l74 = (r_control_value < 5'h10);
  always @(*) begin
    if(when_AES_Masked_Modified_l74) begin
      r_sbox_io_sbIn0 = r_addroundkey1_io_b;
    end else begin
      r_sbox_io_sbIn0 = r_keyReg_0_1_3;
    end
  end

  always @(*) begin
    if(when_AES_Masked_Modified_l74) begin
      r_sbox_io_sbIn1 = r_addroundkey2_io_b;
    end else begin
      r_sbox_io_sbIn1 = r_keyReg_1_1_3;
    end
  end

  always @(*) begin
    io_ct1 = 128'h0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        io_ct1 = {{{{{{{{{{{{{{{r_stateReg_0_0_0,r_stateReg_0_1_0},r_stateReg_0_2_0},r_stateReg_0_3_0},r_stateReg_0_0_1},r_stateReg_0_1_1},r_stateReg_0_2_1},r_stateReg_0_3_1},r_stateReg_0_0_2},r_stateReg_0_1_2},r_stateReg_0_2_2},r_stateReg_0_3_2},r_stateReg_0_0_3},r_stateReg_0_1_3},r_stateReg_0_2_3},r_stateReg_0_3_3};
      end
    endcase
  end

  always @(*) begin
    io_ct2 = 128'h0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        io_ct2 = {{{{{{{{{{{{{{{r_stateReg_1_0_0,r_stateReg_1_1_0},r_stateReg_1_2_0},r_stateReg_1_3_0},r_stateReg_1_0_1},r_stateReg_1_1_1},r_stateReg_1_2_1},r_stateReg_1_3_1},r_stateReg_1_0_2},r_stateReg_1_1_2},r_stateReg_1_2_2},r_stateReg_1_3_2},r_stateReg_1_0_3},r_stateReg_1_1_3},r_stateReg_1_2_3},r_stateReg_1_3_3};
      end
    endcase
  end

  always @(*) begin
    io_done = 1'b0;
    case(r_fsmState)
      States2_sIdle : begin
      end
      States2_sInit : begin
      end
      States2_sRound : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_stateRotation = 1'b0;
      end
      States2_sInit : begin
        r_stateRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l407) begin
          r_stateRotation = 1'b1;
        end else begin
          r_stateRotation = 1'b0;
        end
      end
      default : begin
        r_stateRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_shiftRowsRotation = 1'b0;
      end
      States2_sInit : begin
        r_shiftRowsRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l417) begin
          r_shiftRowsRotation = 1'b1;
        end else begin
          r_shiftRowsRotation = 1'b0;
        end
      end
      default : begin
        r_shiftRowsRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_mixColumnsRotation = 1'b0;
      end
      States2_sInit : begin
        r_mixColumnsRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l423) begin
          r_mixColumnsRotation = 1'b1;
        end else begin
          r_mixColumnsRotation = 1'b0;
        end
      end
      default : begin
        r_mixColumnsRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_keyRotation = 1'b0;
      end
      States2_sInit : begin
        r_keyRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l429) begin
          r_keyRotation = 1'b1;
        end else begin
          r_keyRotation = 1'b0;
        end
      end
      default : begin
        r_keyRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_keyRotation2 = 1'b0;
      end
      States2_sInit : begin
        r_keyRotation2 = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l429) begin
          if(when_AES_Masked_Modified_l431) begin
            r_keyRotation2 = 1'b1;
          end else begin
            r_keyRotation2 = 1'b0;
          end
        end else begin
          r_keyRotation2 = 1'b0;
        end
      end
      default : begin
        r_keyRotation2 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_keySboxRotation = 1'b0;
      end
      States2_sInit : begin
        r_keySboxRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l441) begin
          r_keySboxRotation = 1'b1;
        end else begin
          r_keySboxRotation = 1'b0;
        end
      end
      default : begin
        r_keySboxRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_keyRCRotation = 1'b0;
      end
      States2_sInit : begin
        r_keyRCRotation = 1'b0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l453) begin
          r_keyRCRotation = 1'b1;
        end else begin
          r_keyRCRotation = 1'b0;
        end
      end
      default : begin
        r_keyRCRotation = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_rc = 8'h0;
      end
      States2_sInit : begin
        r_rc = 8'h0;
      end
      States2_sRound : begin
        if(when_AES_Masked_Modified_l447) begin
          r_rc = r_roundConstant;
        end else begin
          r_rc = 8'h0;
        end
      end
      default : begin
        r_rc = 8'h0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_finalRound = 1'b0;
      end
      States2_sInit : begin
        r_finalRound = 1'b0;
      end
      States2_sRound : begin
        r_finalRound = (r_round_value == 4'b1010);
      end
      default : begin
        r_finalRound = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(r_fsmState)
      States2_sIdle : begin
        r_finalKeyAdd = 1'b0;
      end
      States2_sInit : begin
        r_finalKeyAdd = 1'b0;
      end
      States2_sRound : begin
        r_finalKeyAdd = (r_round_value == 4'b1011);
      end
      default : begin
        r_finalKeyAdd = 1'b0;
      end
    endcase
  end

  assign when_AES_Masked_Modified_l407 = (r_control_value < 5'h14);
  assign when_AES_Masked_Modified_l409 = ((r_control_value == 5'h0f) && (r_round_value == 4'b1011));
  assign when_AES_Masked_Modified_l417 = (r_control_value == 5'h14);
  assign when_AES_Masked_Modified_l423 = (5'h14 < r_control_value);
  assign when_AES_Masked_Modified_l429 = (r_control_value < 5'h10);
  assign when_AES_Masked_Modified_l431 = ((r_control_value < 5'h0c) && (4'b0001 < r_round_value));
  assign when_AES_Masked_Modified_l441 = ((5'h10 <= r_control_value) && (r_control_value < 5'h14));
  assign when_AES_Masked_Modified_l447 = (r_control_value == 5'h14);
  assign when_AES_Masked_Modified_l453 = ((5'h14 <= r_control_value) && (r_control_value < 5'h18));
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_stateReg_0_0_0 <= 8'h0;
      r_stateReg_0_0_1 <= 8'h0;
      r_stateReg_0_0_2 <= 8'h0;
      r_stateReg_0_0_3 <= 8'h0;
      r_stateReg_0_1_0 <= 8'h0;
      r_stateReg_0_1_1 <= 8'h0;
      r_stateReg_0_1_2 <= 8'h0;
      r_stateReg_0_1_3 <= 8'h0;
      r_stateReg_0_2_0 <= 8'h0;
      r_stateReg_0_2_1 <= 8'h0;
      r_stateReg_0_2_2 <= 8'h0;
      r_stateReg_0_2_3 <= 8'h0;
      r_stateReg_0_3_0 <= 8'h0;
      r_stateReg_0_3_1 <= 8'h0;
      r_stateReg_0_3_2 <= 8'h0;
      r_stateReg_0_3_3 <= 8'h0;
      r_stateReg_1_0_0 <= 8'h0;
      r_stateReg_1_0_1 <= 8'h0;
      r_stateReg_1_0_2 <= 8'h0;
      r_stateReg_1_0_3 <= 8'h0;
      r_stateReg_1_1_0 <= 8'h0;
      r_stateReg_1_1_1 <= 8'h0;
      r_stateReg_1_1_2 <= 8'h0;
      r_stateReg_1_1_3 <= 8'h0;
      r_stateReg_1_2_0 <= 8'h0;
      r_stateReg_1_2_1 <= 8'h0;
      r_stateReg_1_2_2 <= 8'h0;
      r_stateReg_1_2_3 <= 8'h0;
      r_stateReg_1_3_0 <= 8'h0;
      r_stateReg_1_3_1 <= 8'h0;
      r_stateReg_1_3_2 <= 8'h0;
      r_stateReg_1_3_3 <= 8'h0;
      r_keyReg_0_0_0 <= 8'h0;
      r_keyReg_0_0_1 <= 8'h0;
      r_keyReg_0_0_2 <= 8'h0;
      r_keyReg_0_0_3 <= 8'h0;
      r_keyReg_0_1_0 <= 8'h0;
      r_keyReg_0_1_1 <= 8'h0;
      r_keyReg_0_1_2 <= 8'h0;
      r_keyReg_0_1_3 <= 8'h0;
      r_keyReg_0_2_0 <= 8'h0;
      r_keyReg_0_2_1 <= 8'h0;
      r_keyReg_0_2_2 <= 8'h0;
      r_keyReg_0_2_3 <= 8'h0;
      r_keyReg_0_3_0 <= 8'h0;
      r_keyReg_0_3_1 <= 8'h0;
      r_keyReg_0_3_2 <= 8'h0;
      r_keyReg_0_3_3 <= 8'h0;
      r_keyReg_1_0_0 <= 8'h0;
      r_keyReg_1_0_1 <= 8'h0;
      r_keyReg_1_0_2 <= 8'h0;
      r_keyReg_1_0_3 <= 8'h0;
      r_keyReg_1_1_0 <= 8'h0;
      r_keyReg_1_1_1 <= 8'h0;
      r_keyReg_1_1_2 <= 8'h0;
      r_keyReg_1_1_3 <= 8'h0;
      r_keyReg_1_2_0 <= 8'h0;
      r_keyReg_1_2_1 <= 8'h0;
      r_keyReg_1_2_2 <= 8'h0;
      r_keyReg_1_2_3 <= 8'h0;
      r_keyReg_1_3_0 <= 8'h0;
      r_keyReg_1_3_1 <= 8'h0;
      r_keyReg_1_3_2 <= 8'h0;
      r_keyReg_1_3_3 <= 8'h0;
      r_fsmState <= States2_sIdle;
      r_round_value <= 4'b0001;
      r_control1_value <= 2'b00;
      r_control2_value <= 2'b00;
      r_control_value <= 5'h0;
      r_roundConstant <= 8'h01;
    end else begin
      r_round_value <= r_round_valueNext;
      r_control1_value <= r_control1_valueNext;
      r_control2_value <= r_control2_valueNext;
      r_control_value <= r_control_valueNext;
      if(r_control_willOverflow) begin
        if(when_AES_Masked_Modified_l36) begin
          r_roundConstant <= (r_roundConstant <<< 1);
        end else begin
          r_roundConstant <= (_zz_r_roundConstant ^ 8'h1b);
        end
      end
      if(r_stateRotation) begin
        r_stateReg_0_0_0 <= r_stateReg_0_1_0;
        r_stateReg_0_1_0 <= r_stateReg_0_2_0;
        r_stateReg_0_2_0 <= r_stateReg_0_3_0;
        r_stateReg_0_3_0 <= r_stateReg_0_0_1;
        r_stateReg_0_0_1 <= r_stateReg_0_1_1;
        r_stateReg_0_1_1 <= r_stateReg_0_2_1;
        r_stateReg_0_2_1 <= r_stateReg_0_3_1;
        r_stateReg_0_3_1 <= r_stateReg_0_0_2;
        r_stateReg_0_0_2 <= r_stateReg_0_1_2;
        r_stateReg_0_1_2 <= r_stateReg_0_2_2;
        r_stateReg_0_2_2 <= r_stateReg_0_3_2;
        r_stateReg_0_3_2 <= r_stateReg_0_0_3;
        r_stateReg_0_0_3 <= r_stateReg_0_1_3;
        r_stateReg_0_1_3 <= r_stateReg_0_2_3;
        r_stateReg_0_2_3 <= r_stateReg_0_3_3;
        r_stateReg_0_3_3 <= r_sbox_io_sbOut0;
        if(r_finalKeyAdd) begin
          r_stateReg_0_3_3 <= r_addroundkey1_io_b;
        end
        r_stateReg_1_0_0 <= r_stateReg_1_1_0;
        r_stateReg_1_1_0 <= r_stateReg_1_2_0;
        r_stateReg_1_2_0 <= r_stateReg_1_3_0;
        r_stateReg_1_3_0 <= r_stateReg_1_0_1;
        r_stateReg_1_0_1 <= r_stateReg_1_1_1;
        r_stateReg_1_1_1 <= r_stateReg_1_2_1;
        r_stateReg_1_2_1 <= r_stateReg_1_3_1;
        r_stateReg_1_3_1 <= r_stateReg_1_0_2;
        r_stateReg_1_0_2 <= r_stateReg_1_1_2;
        r_stateReg_1_1_2 <= r_stateReg_1_2_2;
        r_stateReg_1_2_2 <= r_stateReg_1_3_2;
        r_stateReg_1_3_2 <= r_stateReg_1_0_3;
        r_stateReg_1_0_3 <= r_stateReg_1_1_3;
        r_stateReg_1_1_3 <= r_stateReg_1_2_3;
        r_stateReg_1_2_3 <= r_stateReg_1_3_3;
        r_stateReg_1_3_3 <= r_sbox_io_sbOut1;
        if(r_finalKeyAdd) begin
          r_stateReg_1_3_3 <= r_addroundkey2_io_b;
        end
      end else begin
        if(r_shiftRowsRotation) begin
          r_stateReg_0_0_0 <= r_stateReg_0_0_0;
          r_stateReg_0_0_1 <= r_stateReg_0_0_1;
          r_stateReg_0_0_2 <= r_stateReg_0_0_2;
          r_stateReg_0_0_3 <= r_stateReg_0_0_3;
          r_stateReg_0_1_0 <= r_stateReg_0_1_1;
          r_stateReg_0_1_1 <= r_stateReg_0_1_2;
          r_stateReg_0_1_2 <= r_stateReg_0_1_3;
          r_stateReg_0_1_3 <= r_stateReg_0_1_0;
          r_stateReg_0_2_0 <= r_stateReg_0_2_2;
          r_stateReg_0_2_1 <= r_stateReg_0_2_3;
          r_stateReg_0_2_2 <= r_stateReg_0_2_0;
          r_stateReg_0_2_3 <= r_stateReg_0_2_1;
          r_stateReg_0_3_0 <= r_stateReg_0_3_3;
          r_stateReg_0_3_1 <= r_stateReg_0_3_0;
          r_stateReg_0_3_2 <= r_stateReg_0_3_1;
          r_stateReg_0_3_3 <= r_stateReg_0_3_2;
          r_stateReg_1_0_0 <= r_stateReg_1_0_0;
          r_stateReg_1_0_1 <= r_stateReg_1_0_1;
          r_stateReg_1_0_2 <= r_stateReg_1_0_2;
          r_stateReg_1_0_3 <= r_stateReg_1_0_3;
          r_stateReg_1_1_0 <= r_stateReg_1_1_1;
          r_stateReg_1_1_1 <= r_stateReg_1_1_2;
          r_stateReg_1_1_2 <= r_stateReg_1_1_3;
          r_stateReg_1_1_3 <= r_stateReg_1_1_0;
          r_stateReg_1_2_0 <= r_stateReg_1_2_2;
          r_stateReg_1_2_1 <= r_stateReg_1_2_3;
          r_stateReg_1_2_2 <= r_stateReg_1_2_0;
          r_stateReg_1_2_3 <= r_stateReg_1_2_1;
          r_stateReg_1_3_0 <= r_stateReg_1_3_3;
          r_stateReg_1_3_1 <= r_stateReg_1_3_0;
          r_stateReg_1_3_2 <= r_stateReg_1_3_1;
          r_stateReg_1_3_3 <= r_stateReg_1_3_2;
        end else begin
          if(r_mixColumnsRotation) begin
            r_stateReg_0_0_0 <= r_stateReg_0_0_1;
            r_stateReg_0_1_0 <= r_stateReg_0_1_1;
            r_stateReg_0_2_0 <= r_stateReg_0_2_1;
            r_stateReg_0_3_0 <= r_stateReg_0_3_1;
            r_stateReg_0_0_1 <= r_stateReg_0_0_2;
            r_stateReg_0_1_1 <= r_stateReg_0_1_2;
            r_stateReg_0_2_1 <= r_stateReg_0_2_2;
            r_stateReg_0_3_1 <= r_stateReg_0_3_2;
            r_stateReg_0_0_2 <= r_stateReg_0_0_3;
            r_stateReg_0_1_2 <= r_stateReg_0_1_3;
            r_stateReg_0_2_2 <= r_stateReg_0_2_3;
            r_stateReg_0_3_2 <= r_stateReg_0_3_3;
            r_stateReg_0_0_3 <= r_mixcolumns1_io_mcOut1;
            r_stateReg_0_1_3 <= r_mixcolumns1_io_mcOut2;
            r_stateReg_0_2_3 <= r_mixcolumns1_io_mcOut3;
            r_stateReg_0_3_3 <= r_mixcolumns1_io_mcOut4;
            if(r_finalRound) begin
              r_stateReg_0_0_3 <= r_stateReg_0_0_0;
              r_stateReg_0_1_3 <= r_stateReg_0_1_0;
              r_stateReg_0_2_3 <= r_stateReg_0_2_0;
              r_stateReg_0_3_3 <= r_stateReg_0_3_0;
            end
            r_stateReg_1_0_0 <= r_stateReg_1_0_1;
            r_stateReg_1_1_0 <= r_stateReg_1_1_1;
            r_stateReg_1_2_0 <= r_stateReg_1_2_1;
            r_stateReg_1_3_0 <= r_stateReg_1_3_1;
            r_stateReg_1_0_1 <= r_stateReg_1_0_2;
            r_stateReg_1_1_1 <= r_stateReg_1_1_2;
            r_stateReg_1_2_1 <= r_stateReg_1_2_2;
            r_stateReg_1_3_1 <= r_stateReg_1_3_2;
            r_stateReg_1_0_2 <= r_stateReg_1_0_3;
            r_stateReg_1_1_2 <= r_stateReg_1_1_3;
            r_stateReg_1_2_2 <= r_stateReg_1_2_3;
            r_stateReg_1_3_2 <= r_stateReg_1_3_3;
            r_stateReg_1_0_3 <= r_mixcolumns2_io_mcOut1;
            r_stateReg_1_1_3 <= r_mixcolumns2_io_mcOut2;
            r_stateReg_1_2_3 <= r_mixcolumns2_io_mcOut3;
            r_stateReg_1_3_3 <= r_mixcolumns2_io_mcOut4;
            if(r_finalRound) begin
              r_stateReg_1_0_3 <= r_stateReg_1_0_0;
              r_stateReg_1_1_3 <= r_stateReg_1_1_0;
              r_stateReg_1_2_3 <= r_stateReg_1_2_0;
              r_stateReg_1_3_3 <= r_stateReg_1_3_0;
            end
          end
        end
      end
      if(r_keyRotation) begin
        r_keyReg_0_0_0 <= r_keyReg_0_1_0;
        r_keyReg_0_1_0 <= r_keyReg_0_2_0;
        r_keyReg_0_2_0 <= r_keyReg_0_3_0;
        r_keyReg_0_0_1 <= r_keyReg_0_1_1;
        r_keyReg_0_1_1 <= r_keyReg_0_2_1;
        r_keyReg_0_2_1 <= r_keyReg_0_3_1;
        r_keyReg_0_0_2 <= r_keyReg_0_1_2;
        r_keyReg_0_1_2 <= r_keyReg_0_2_2;
        r_keyReg_0_2_2 <= r_keyReg_0_3_2;
        r_keyReg_0_0_3 <= r_keyReg_0_1_3;
        r_keyReg_0_1_3 <= r_keyReg_0_2_3;
        r_keyReg_0_2_3 <= r_keyReg_0_3_3;
        r_keyReg_0_3_0 <= r_keyReg_0_0_1;
        r_keyReg_0_3_1 <= r_keyReg_0_0_2;
        r_keyReg_0_3_2 <= r_keyReg_0_0_3;
        r_keyReg_0_3_3 <= r_keyReg_0_0_0;
        r_keyReg_1_0_0 <= r_keyReg_1_1_0;
        r_keyReg_1_1_0 <= r_keyReg_1_2_0;
        r_keyReg_1_2_0 <= r_keyReg_1_3_0;
        r_keyReg_1_0_1 <= r_keyReg_1_1_1;
        r_keyReg_1_1_1 <= r_keyReg_1_2_1;
        r_keyReg_1_2_1 <= r_keyReg_1_3_1;
        r_keyReg_1_0_2 <= r_keyReg_1_1_2;
        r_keyReg_1_1_2 <= r_keyReg_1_2_2;
        r_keyReg_1_2_2 <= r_keyReg_1_3_2;
        r_keyReg_1_0_3 <= r_keyReg_1_1_3;
        r_keyReg_1_1_3 <= r_keyReg_1_2_3;
        r_keyReg_1_2_3 <= r_keyReg_1_3_3;
        r_keyReg_1_3_0 <= r_keyReg_1_0_1;
        r_keyReg_1_3_1 <= r_keyReg_1_0_2;
        r_keyReg_1_3_2 <= r_keyReg_1_0_3;
        r_keyReg_1_3_3 <= r_keyReg_1_0_0;
        if(r_keyRotation2) begin
          r_keyReg_0_3_0 <= (r_keyReg_0_0_0 ^ r_keyReg_0_0_1);
          r_keyReg_0_3_1 <= r_keyReg_0_0_2;
          r_keyReg_0_3_2 <= r_keyReg_0_0_3;
          r_keyReg_0_3_3 <= r_keyReg_0_0_0;
          r_keyReg_1_3_0 <= (r_keyReg_1_0_0 ^ r_keyReg_1_0_1);
          r_keyReg_1_3_1 <= r_keyReg_1_0_2;
          r_keyReg_1_3_2 <= r_keyReg_1_0_3;
          r_keyReg_1_3_3 <= r_keyReg_1_0_0;
        end
      end else begin
        if(r_keySboxRotation) begin
          r_keyReg_0_1_3 <= r_keyReg_0_2_3;
          r_keyReg_0_2_3 <= r_keyReg_0_3_3;
          r_keyReg_0_3_3 <= r_keyReg_0_0_3;
          r_keyReg_0_0_3 <= r_keyReg_0_1_3;
          r_keyReg_1_1_3 <= r_keyReg_1_2_3;
          r_keyReg_1_2_3 <= r_keyReg_1_3_3;
          r_keyReg_1_3_3 <= r_keyReg_1_0_3;
          r_keyReg_1_0_3 <= r_keyReg_1_1_3;
        end else begin
          if(r_keyRCRotation) begin
            r_keyReg_0_0_0 <= r_keyReg_0_1_0;
            r_keyReg_0_1_0 <= r_keyReg_0_2_0;
            r_keyReg_0_2_0 <= r_keyReg_0_3_0;
            r_keyReg_0_3_0 <= ((r_sbox_io_sbOut0 ^ r_keyReg_0_0_0) ^ r_rc);
            r_keyReg_1_0_0 <= r_keyReg_1_1_0;
            r_keyReg_1_1_0 <= r_keyReg_1_2_0;
            r_keyReg_1_2_0 <= r_keyReg_1_3_0;
            r_keyReg_1_3_0 <= (r_sbox_io_sbOut1 ^ r_keyReg_1_0_0);
          end
        end
      end
      case(r_fsmState)
        States2_sIdle : begin
          r_fsmState <= States2_sIdle;
          r_stateReg_0_0_0 <= 8'h0;
          r_stateReg_0_0_1 <= 8'h0;
          r_stateReg_0_0_2 <= 8'h0;
          r_stateReg_0_0_3 <= 8'h0;
          r_stateReg_0_1_0 <= 8'h0;
          r_stateReg_0_1_1 <= 8'h0;
          r_stateReg_0_1_2 <= 8'h0;
          r_stateReg_0_1_3 <= 8'h0;
          r_stateReg_0_2_0 <= 8'h0;
          r_stateReg_0_2_1 <= 8'h0;
          r_stateReg_0_2_2 <= 8'h0;
          r_stateReg_0_2_3 <= 8'h0;
          r_stateReg_0_3_0 <= 8'h0;
          r_stateReg_0_3_1 <= 8'h0;
          r_stateReg_0_3_2 <= 8'h0;
          r_stateReg_0_3_3 <= 8'h0;
          r_stateReg_1_0_0 <= 8'h0;
          r_stateReg_1_0_1 <= 8'h0;
          r_stateReg_1_0_2 <= 8'h0;
          r_stateReg_1_0_3 <= 8'h0;
          r_stateReg_1_1_0 <= 8'h0;
          r_stateReg_1_1_1 <= 8'h0;
          r_stateReg_1_1_2 <= 8'h0;
          r_stateReg_1_1_3 <= 8'h0;
          r_stateReg_1_2_0 <= 8'h0;
          r_stateReg_1_2_1 <= 8'h0;
          r_stateReg_1_2_2 <= 8'h0;
          r_stateReg_1_2_3 <= 8'h0;
          r_stateReg_1_3_0 <= 8'h0;
          r_stateReg_1_3_1 <= 8'h0;
          r_stateReg_1_3_2 <= 8'h0;
          r_stateReg_1_3_3 <= 8'h0;
          r_keyReg_0_0_0 <= 8'h0;
          r_keyReg_0_0_1 <= 8'h0;
          r_keyReg_0_0_2 <= 8'h0;
          r_keyReg_0_0_3 <= 8'h0;
          r_keyReg_0_1_0 <= 8'h0;
          r_keyReg_0_1_1 <= 8'h0;
          r_keyReg_0_1_2 <= 8'h0;
          r_keyReg_0_1_3 <= 8'h0;
          r_keyReg_0_2_0 <= 8'h0;
          r_keyReg_0_2_1 <= 8'h0;
          r_keyReg_0_2_2 <= 8'h0;
          r_keyReg_0_2_3 <= 8'h0;
          r_keyReg_0_3_0 <= 8'h0;
          r_keyReg_0_3_1 <= 8'h0;
          r_keyReg_0_3_2 <= 8'h0;
          r_keyReg_0_3_3 <= 8'h0;
          r_keyReg_1_0_0 <= 8'h0;
          r_keyReg_1_0_1 <= 8'h0;
          r_keyReg_1_0_2 <= 8'h0;
          r_keyReg_1_0_3 <= 8'h0;
          r_keyReg_1_1_0 <= 8'h0;
          r_keyReg_1_1_1 <= 8'h0;
          r_keyReg_1_1_2 <= 8'h0;
          r_keyReg_1_1_3 <= 8'h0;
          r_keyReg_1_2_0 <= 8'h0;
          r_keyReg_1_2_1 <= 8'h0;
          r_keyReg_1_2_2 <= 8'h0;
          r_keyReg_1_2_3 <= 8'h0;
          r_keyReg_1_3_0 <= 8'h0;
          r_keyReg_1_3_1 <= 8'h0;
          r_keyReg_1_3_2 <= 8'h0;
          r_keyReg_1_3_3 <= 8'h0;
          r_roundConstant <= 8'h01;
          if(io_enable) begin
            r_fsmState <= States2_sInit;
          end
        end
        States2_sInit : begin
          r_fsmState <= States2_sRound;
          r_stateReg_0_0_0 <= io_pt1[127 : 120];
          r_stateReg_0_1_0 <= io_pt1[119 : 112];
          r_stateReg_0_2_0 <= io_pt1[111 : 104];
          r_stateReg_0_3_0 <= io_pt1[103 : 96];
          r_stateReg_0_0_1 <= io_pt1[95 : 88];
          r_stateReg_0_1_1 <= io_pt1[87 : 80];
          r_stateReg_0_2_1 <= io_pt1[79 : 72];
          r_stateReg_0_3_1 <= io_pt1[71 : 64];
          r_stateReg_0_0_2 <= io_pt1[63 : 56];
          r_stateReg_0_1_2 <= io_pt1[55 : 48];
          r_stateReg_0_2_2 <= io_pt1[47 : 40];
          r_stateReg_0_3_2 <= io_pt1[39 : 32];
          r_stateReg_0_0_3 <= io_pt1[31 : 24];
          r_stateReg_0_1_3 <= io_pt1[23 : 16];
          r_stateReg_0_2_3 <= io_pt1[15 : 8];
          r_stateReg_0_3_3 <= io_pt1[7 : 0];
          r_stateReg_1_0_0 <= io_pt2[127 : 120];
          r_stateReg_1_1_0 <= io_pt2[119 : 112];
          r_stateReg_1_2_0 <= io_pt2[111 : 104];
          r_stateReg_1_3_0 <= io_pt2[103 : 96];
          r_stateReg_1_0_1 <= io_pt2[95 : 88];
          r_stateReg_1_1_1 <= io_pt2[87 : 80];
          r_stateReg_1_2_1 <= io_pt2[79 : 72];
          r_stateReg_1_3_1 <= io_pt2[71 : 64];
          r_stateReg_1_0_2 <= io_pt2[63 : 56];
          r_stateReg_1_1_2 <= io_pt2[55 : 48];
          r_stateReg_1_2_2 <= io_pt2[47 : 40];
          r_stateReg_1_3_2 <= io_pt2[39 : 32];
          r_stateReg_1_0_3 <= io_pt2[31 : 24];
          r_stateReg_1_1_3 <= io_pt2[23 : 16];
          r_stateReg_1_2_3 <= io_pt2[15 : 8];
          r_stateReg_1_3_3 <= io_pt2[7 : 0];
          r_keyReg_0_0_0 <= io_key1[127 : 120];
          r_keyReg_0_1_0 <= io_key1[119 : 112];
          r_keyReg_0_2_0 <= io_key1[111 : 104];
          r_keyReg_0_3_0 <= io_key1[103 : 96];
          r_keyReg_0_0_1 <= io_key1[95 : 88];
          r_keyReg_0_1_1 <= io_key1[87 : 80];
          r_keyReg_0_2_1 <= io_key1[79 : 72];
          r_keyReg_0_3_1 <= io_key1[71 : 64];
          r_keyReg_0_0_2 <= io_key1[63 : 56];
          r_keyReg_0_1_2 <= io_key1[55 : 48];
          r_keyReg_0_2_2 <= io_key1[47 : 40];
          r_keyReg_0_3_2 <= io_key1[39 : 32];
          r_keyReg_0_0_3 <= io_key1[31 : 24];
          r_keyReg_0_1_3 <= io_key1[23 : 16];
          r_keyReg_0_2_3 <= io_key1[15 : 8];
          r_keyReg_0_3_3 <= io_key1[7 : 0];
          r_keyReg_1_0_0 <= io_key2[127 : 120];
          r_keyReg_1_1_0 <= io_key2[119 : 112];
          r_keyReg_1_2_0 <= io_key2[111 : 104];
          r_keyReg_1_3_0 <= io_key2[103 : 96];
          r_keyReg_1_0_1 <= io_key2[95 : 88];
          r_keyReg_1_1_1 <= io_key2[87 : 80];
          r_keyReg_1_2_1 <= io_key2[79 : 72];
          r_keyReg_1_3_1 <= io_key2[71 : 64];
          r_keyReg_1_0_2 <= io_key2[63 : 56];
          r_keyReg_1_1_2 <= io_key2[55 : 48];
          r_keyReg_1_2_2 <= io_key2[47 : 40];
          r_keyReg_1_3_2 <= io_key2[39 : 32];
          r_keyReg_1_0_3 <= io_key2[31 : 24];
          r_keyReg_1_1_3 <= io_key2[23 : 16];
          r_keyReg_1_2_3 <= io_key2[15 : 8];
          r_keyReg_1_3_3 <= io_key2[7 : 0];
        end
        States2_sRound : begin
          r_fsmState <= States2_sRound;
          if(when_AES_Masked_Modified_l407) begin
            if(when_AES_Masked_Modified_l409) begin
              r_fsmState <= States2_sDone;
            end
          end
        end
        default : begin
          r_fsmState <= States2_sDone;
        end
      endcase
    end
  end


endmodule

//MixColumns replaced by MixColumns

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

module SBoxMasked (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_sbIn0,
  input      [7:0]    io_sbIn1,
  input      [27:0]   io_m,
  output     [7:0]    io_sbOut0,
  output     [7:0]    io_sbOut1
);

  wire       [7:0]    convert0_io_output;
  wire       [7:0]    convert1_io_output;
  wire       [7:0]    convert2_io_output;
  wire       [7:0]    convert3_io_output;
  wire       [7:0]    inv_io_z_0;
  wire       [7:0]    inv_io_z_1;

  NewBasis convert0 (
    .io_input        (io_sbIn0[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert0_io_output[7:0]  )  //o
  );
  NewBasis convert1 (
    .io_input        (io_sbIn1[7:0]            ), //i
    .io_direction    (1'b0                     ), //i
    .io_output       (convert1_io_output[7:0]  )  //o
  );
  NewBasis convert2 (
    .io_input        (inv_io_z_0[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert2_io_output[7:0]  )  //o
  );
  NewBasis convert3 (
    .io_input        (inv_io_z_1[7:0]          ), //i
    .io_direction    (1'b1                     ), //i
    .io_output       (convert3_io_output[7:0]  )  //o
  );
  G256Inv2Shares5Stages inv (
    .io_clk      (io_clk                   ), //i
    .io_reset    (io_reset                 ), //i
    .io_x_0      (convert0_io_output[7:0]  ), //i
    .io_x_1      (convert1_io_output[7:0]  ), //i
    .io_m        (io_m[27:0]               ), //i
    .io_z_0      (inv_io_z_0[7:0]          ), //o
    .io_z_1      (inv_io_z_1[7:0]          )  //o
  );
  assign io_sbOut0 = (convert2_io_output ^ 8'h63);
  assign io_sbOut1 = convert3_io_output;

endmodule

//AddRoundKey replaced by AddRoundKey

module AddRoundKey (
  input      [7:0]    io_a,
  input      [7:0]    io_k,
  output     [7:0]    io_b
);


  assign io_b = (io_a ^ io_k);

endmodule

module G256Inv2Shares5Stages (
  input               io_clk,
  input               io_reset,
  input      [7:0]    io_x_0,
  input      [7:0]    io_x_1,
  input      [27:0]   io_m,
  output     [7:0]    io_z_0,
  output     [7:0]    io_z_1
);

  wire       [7:0]    r_mul1_io_m;
  wire       [3:0]    r_mul2_io_m;
  wire       [3:0]    r_mul3_io_m;
  wire       [3:0]    r_inv_io_x_0;
  wire       [3:0]    r_inv_io_x_1;
  wire       [11:0]   r_inv_io_m;
  wire       [3:0]    g16SqSc_2_io_t;
  wire       [3:0]    g16SqSc_3_io_t;
  wire       [3:0]    r_mul1_io_z_0;
  wire       [3:0]    r_mul1_io_z_1;
  wire       [3:0]    r_mul2_io_z_0;
  wire       [3:0]    r_mul2_io_z_1;
  wire       [3:0]    r_mul3_io_z_0;
  wire       [3:0]    r_mul3_io_z_1;
  wire       [3:0]    r_inv_io_z_0;
  wire       [3:0]    r_inv_io_z_1;
  wire       [3:0]    g16SqSc_2_io_x;
  wire       [3:0]    g16SqSc_3_io_x;
  wire       [3:0]    r_a_0;
  wire       [3:0]    r_a_1;
  wire       [3:0]    r_b_0;
  wire       [3:0]    r_b_1;
  wire       [3:0]    r_d_0;
  wire       [3:0]    r_d_1;
  wire       [3:0]    r_e_0;
  wire       [3:0]    r_e_1;
  wire       [3:0]    r_f_0;
  wire       [3:0]    r_f_1;
  wire       [3:0]    r_p_0;
  wire       [3:0]    r_p_1;
  wire       [3:0]    r_q_0;
  wire       [3:0]    r_q_1;
  reg        [3:0]    r_a1_0;
  reg        [3:0]    r_a1_1;
  reg        [3:0]    r_a2_0;
  reg        [3:0]    r_a2_1;
  reg        [3:0]    r_a3_0;
  reg        [3:0]    r_a3_1;
  reg        [3:0]    r_b1_0;
  reg        [3:0]    r_b1_1;
  reg        [3:0]    r_b2_0;
  reg        [3:0]    r_b2_1;
  reg        [3:0]    r_b3_0;
  reg        [3:0]    r_b3_1;
  reg        [3:0]    r_c_0;
  reg        [3:0]    r_c_1;

  G16Mul2SharesDepMul r_mul1 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a_0[3:0]          ), //i
    .io_x_1      (r_a_1[3:0]          ), //i
    .io_y_0      (r_b_0[3:0]          ), //i
    .io_y_1      (r_b_1[3:0]          ), //i
    .io_m        (r_mul1_io_m[7:0]    ), //i
    .io_z_0      (r_mul1_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul1_io_z_1[3:0]  )  //o
  );
  G16Mul2SharesIndepMul r_mul2 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_b3_0[3:0]         ), //i
    .io_x_1      (r_b3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul2_io_m[3:0]    ), //i
    .io_z_0      (r_mul2_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul2_io_z_1[3:0]  )  //o
  );
  G16Mul2SharesIndepMul r_mul3 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a3_0[3:0]         ), //i
    .io_x_1      (r_a3_1[3:0]         ), //i
    .io_y_0      (r_f_0[3:0]          ), //i
    .io_y_1      (r_f_1[3:0]          ), //i
    .io_m        (r_mul3_io_m[3:0]    ), //i
    .io_z_0      (r_mul3_io_z_0[3:0]  ), //o
    .io_z_1      (r_mul3_io_z_1[3:0]  )  //o
  );
  G16Inv2SharesDep r_inv (
    .io_clk      (io_clk             ), //i
    .io_reset    (io_reset           ), //i
    .io_x_0      (r_inv_io_x_0[3:0]  ), //i
    .io_x_1      (r_inv_io_x_1[3:0]  ), //i
    .io_m        (r_inv_io_m[11:0]   ), //i
    .io_z_0      (r_inv_io_z_0[3:0]  ), //o
    .io_z_1      (r_inv_io_z_1[3:0]  )  //o
  );
  G16SqSc g16SqSc_2 (
    .io_t    (g16SqSc_2_io_t[3:0]  ), //i
    .io_x    (g16SqSc_2_io_x[3:0]  )  //o
  );
  G16SqSc g16SqSc_3 (
    .io_t    (g16SqSc_3_io_t[3:0]  ), //i
    .io_x    (g16SqSc_3_io_x[3:0]  )  //o
  );
  assign r_a_0 = io_x_0[7 : 4];
  assign r_b_0 = io_x_0[3 : 0];
  assign r_a_1 = io_x_1[7 : 4];
  assign r_b_1 = io_x_1[3 : 0];
  assign g16SqSc_2_io_t = (r_a_0 ^ r_b_0);
  assign g16SqSc_3_io_t = (r_a_1 ^ r_b_1);
  assign r_mul1_io_m = io_m[27 : 20];
  assign r_d_0 = r_mul1_io_z_0;
  assign r_d_1 = r_mul1_io_z_1;
  assign r_inv_io_x_0 = (r_c_0 ^ r_d_0);
  assign r_inv_io_x_1 = (r_c_1 ^ r_d_1);
  assign r_inv_io_m = io_m[19 : 8];
  assign r_f_0 = r_inv_io_z_0;
  assign r_f_1 = r_inv_io_z_1;
  assign r_mul2_io_m = io_m[7 : 4];
  assign r_p_0 = r_mul2_io_z_0;
  assign r_p_1 = r_mul2_io_z_1;
  assign r_mul3_io_m = io_m[3 : 0];
  assign r_q_0 = r_mul3_io_z_0;
  assign r_q_1 = r_mul3_io_z_1;
  assign io_z_0 = {r_p_0,r_q_0};
  assign io_z_1 = {r_p_1,r_q_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_a1_0 <= 4'b0000;
      r_a1_1 <= 4'b0000;
      r_a2_0 <= 4'b0000;
      r_a2_1 <= 4'b0000;
      r_a3_0 <= 4'b0000;
      r_a3_1 <= 4'b0000;
      r_b1_0 <= 4'b0000;
      r_b1_1 <= 4'b0000;
      r_b2_0 <= 4'b0000;
      r_b2_1 <= 4'b0000;
      r_b3_0 <= 4'b0000;
      r_b3_1 <= 4'b0000;
      r_c_0 <= 4'b0000;
      r_c_1 <= 4'b0000;
    end else begin
      r_a1_0 <= r_a_0;
      r_a2_0 <= r_a1_0;
      r_a3_0 <= r_a2_0;
      r_b1_0 <= r_b_0;
      r_b2_0 <= r_b1_0;
      r_b3_0 <= r_b2_0;
      r_a1_1 <= r_a_1;
      r_a2_1 <= r_a1_1;
      r_a3_1 <= r_a2_1;
      r_b1_1 <= r_b_1;
      r_b2_1 <= r_b1_1;
      r_b3_1 <= r_b2_1;
      r_c_0 <= g16SqSc_2_io_x;
      r_c_1 <= g16SqSc_3_io_x;
    end
  end


endmodule

//NewBasis replaced by NewBasis

//NewBasis replaced by NewBasis

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
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [11:0]   io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    r_mul1_io_m;
  wire       [3:0]    r_mul2_io_m;
  wire       [3:0]    r_mul3_io_m;
  wire       [1:0]    g4Sq_8_io_t;
  wire       [1:0]    g4Sq_9_io_t;
  wire       [1:0]    g4Sq_10_io_t;
  wire       [1:0]    g4Sq_11_io_t;
  wire       [1:0]    r_mul1_io_z_0;
  wire       [1:0]    r_mul1_io_z_1;
  wire       [1:0]    r_mul2_io_z_0;
  wire       [1:0]    r_mul2_io_z_1;
  wire       [1:0]    r_mul3_io_z_0;
  wire       [1:0]    r_mul3_io_z_1;
  wire       [1:0]    g4Sq_8_io_x;
  wire       [1:0]    g4ScaleN_16_io_x;
  wire       [1:0]    g4Sq_9_io_x;
  wire       [1:0]    g4Sq_10_io_x;
  wire       [1:0]    g4ScaleN_17_io_x;
  wire       [1:0]    g4Sq_11_io_x;
  wire       [1:0]    r_a_0;
  wire       [1:0]    r_a_1;
  wire       [1:0]    r_b_0;
  wire       [1:0]    r_b_1;
  wire       [1:0]    r_d_0;
  wire       [1:0]    r_d_1;
  wire       [1:0]    r_e_0;
  wire       [1:0]    r_e_1;
  wire       [1:0]    r_p_0;
  wire       [1:0]    r_p_1;
  wire       [1:0]    r_q_0;
  wire       [1:0]    r_q_1;
  reg        [1:0]    r_c_0;
  reg        [1:0]    r_c_1;
  reg        [1:0]    r_a1_0;
  reg        [1:0]    r_a1_1;
  reg        [1:0]    r_b1_0;
  reg        [1:0]    r_b1_1;

  G4Mul2SharesDepMul r_mul1 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a_0[1:0]          ), //i
    .io_x_1      (r_a_1[1:0]          ), //i
    .io_y_0      (r_b_0[1:0]          ), //i
    .io_y_1      (r_b_1[1:0]          ), //i
    .io_m        (r_mul1_io_m[3:0]    ), //i
    .io_z_0      (r_mul1_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul1_io_z_1[1:0]  )  //o
  );
  G4Mul2SharesDepMul r_mul2 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_b1_0[1:0]         ), //i
    .io_x_1      (r_b1_1[1:0]         ), //i
    .io_y_0      (r_e_0[1:0]          ), //i
    .io_y_1      (r_e_1[1:0]          ), //i
    .io_m        (r_mul2_io_m[3:0]    ), //i
    .io_z_0      (r_mul2_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul2_io_z_1[1:0]  )  //o
  );
  G4Mul2SharesDepMul r_mul3 (
    .io_clk      (io_clk              ), //i
    .io_reset    (io_reset            ), //i
    .io_x_0      (r_a1_0[1:0]         ), //i
    .io_x_1      (r_a1_1[1:0]         ), //i
    .io_y_0      (r_e_0[1:0]          ), //i
    .io_y_1      (r_e_1[1:0]          ), //i
    .io_m        (r_mul3_io_m[3:0]    ), //i
    .io_z_0      (r_mul3_io_z_0[1:0]  ), //o
    .io_z_1      (r_mul3_io_z_1[1:0]  )  //o
  );
  G4Sq g4Sq_8 (
    .io_t    (g4Sq_8_io_t[1:0]  ), //i
    .io_x    (g4Sq_8_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_16 (
    .io_t    (g4Sq_8_io_x[1:0]       ), //i
    .io_x    (g4ScaleN_16_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_9 (
    .io_t    (g4Sq_9_io_t[1:0]  ), //i
    .io_x    (g4Sq_9_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_10 (
    .io_t    (g4Sq_10_io_t[1:0]  ), //i
    .io_x    (g4Sq_10_io_x[1:0]  )  //o
  );
  G4ScaleN g4ScaleN_17 (
    .io_t    (g4Sq_10_io_x[1:0]      ), //i
    .io_x    (g4ScaleN_17_io_x[1:0]  )  //o
  );
  G4Sq g4Sq_11 (
    .io_t    (g4Sq_11_io_t[1:0]  ), //i
    .io_x    (g4Sq_11_io_x[1:0]  )  //o
  );
  assign r_a_0 = io_x_0[3 : 2];
  assign r_b_0 = io_x_0[1 : 0];
  assign g4Sq_8_io_t = (r_a_0 ^ r_b_0);
  assign g4Sq_9_io_t = (r_c_0 ^ r_d_0);
  assign r_e_0 = g4Sq_9_io_x;
  assign r_a_1 = io_x_1[3 : 2];
  assign r_b_1 = io_x_1[1 : 0];
  assign g4Sq_10_io_t = (r_a_1 ^ r_b_1);
  assign g4Sq_11_io_t = (r_c_1 ^ r_d_1);
  assign r_e_1 = g4Sq_11_io_x;
  assign r_mul1_io_m = io_m[11 : 8];
  assign r_d_0 = r_mul1_io_z_0;
  assign r_d_1 = r_mul1_io_z_1;
  assign r_mul2_io_m = io_m[7 : 4];
  assign r_p_0 = r_mul2_io_z_0;
  assign r_p_1 = r_mul2_io_z_1;
  assign r_mul3_io_m = io_m[3 : 0];
  assign r_q_0 = r_mul3_io_z_0;
  assign r_q_1 = r_mul3_io_z_1;
  assign io_z_0 = {r_p_0,r_q_0};
  assign io_z_1 = {r_p_1,r_q_1};
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_c_0 <= 2'b00;
      r_c_1 <= 2'b00;
      r_a1_0 <= 2'b00;
      r_a1_1 <= 2'b00;
      r_b1_0 <= 2'b00;
      r_b1_1 <= 2'b00;
    end else begin
      r_a1_0 <= r_a_0;
      r_b1_0 <= r_b_0;
      r_c_0 <= g4ScaleN_16_io_x;
      r_a1_1 <= r_a_1;
      r_b1_1 <= r_b_1;
      r_c_1 <= g4ScaleN_17_io_x;
    end
  end


endmodule

//G16Mul2SharesIndepMul replaced by G16Mul2SharesIndepMul

module G16Mul2SharesIndepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [3:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    r_mul1_io_x;
  wire       [3:0]    r_mul2_io_x;
  wire       [3:0]    r_mul3_io_x;
  wire       [3:0]    r_mul4_io_x;
  reg        [3:0]    r_r0;
  reg        [3:0]    r_r1;
  reg        [3:0]    r_r2;
  reg        [3:0]    r_r3;

  G16Mul r_mul1 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul1_io_x[3:0]  )  //o
  );
  G16Mul r_mul2 (
    .io_a    (io_x_0[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul2_io_x[3:0]  )  //o
  );
  G16Mul r_mul3 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_0[3:0]       ), //i
    .io_x    (r_mul3_io_x[3:0]  )  //o
  );
  G16Mul r_mul4 (
    .io_a    (io_x_1[3:0]       ), //i
    .io_b    (io_y_1[3:0]       ), //i
    .io_x    (r_mul4_io_x[3:0]  )  //o
  );
  assign io_z_0 = (r_r0 ^ r_r1);
  assign io_z_1 = (r_r2 ^ r_r3);
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_r0 <= 4'b0000;
      r_r1 <= 4'b0000;
      r_r2 <= 4'b0000;
      r_r3 <= 4'b0000;
    end else begin
      r_r0 <= r_mul1_io_x;
      r_r1 <= (r_mul2_io_x ^ io_m);
      r_r2 <= (r_mul3_io_x ^ io_m);
      r_r3 <= r_mul4_io_x;
    end
  end


endmodule

module G16Mul2SharesDepMul (
  input               io_clk,
  input               io_reset,
  input      [3:0]    io_x_0,
  input      [3:0]    io_x_1,
  input      [3:0]    io_y_0,
  input      [3:0]    io_y_1,
  input      [7:0]    io_m,
  output     [3:0]    io_z_0,
  output     [3:0]    io_z_1
);

  wire       [3:0]    g16Mul_18_io_b;
  wire       [3:0]    g16Mul_19_io_b;
  wire       [3:0]    g16Mul_14_io_x;
  wire       [3:0]    g16Mul_15_io_x;
  wire       [3:0]    g16Mul_16_io_x;
  wire       [3:0]    g16Mul_17_io_x;
  wire       [3:0]    g16Mul_18_io_x;
  wire       [3:0]    g16Mul_19_io_x;
  wire       [3:0]    r_xTimesBlindedY_0;
  wire       [3:0]    r_xTimesBlindedY_1;
  wire       [3:0]    r_xTimesM_0;
  wire       [3:0]    r_xTimesM_1;
  wire       [3:0]    r_xTimesY_0;
  wire       [3:0]    r_xTimesY_1;
  reg        [3:0]    r_blindedY_0;
  reg        [3:0]    r_blindedY_1;
  reg        [3:0]    r_xTimesMBlinded_0;
  reg        [3:0]    r_xTimesMBlinded_1;
  reg        [3:0]    r_X_0;
  reg        [3:0]    r_X_1;
  reg        [3:0]    r_Y_0;
  reg        [3:0]    r_Y_1;

  G16Mul g16Mul_14 (
    .io_a    (r_X_0[3:0]           ), //i
    .io_b    (r_blindedY_0[3:0]    ), //i
    .io_x    (g16Mul_14_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_15 (
    .io_a    (r_X_1[3:0]           ), //i
    .io_b    (r_blindedY_1[3:0]    ), //i
    .io_x    (g16Mul_15_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_16 (
    .io_a    (r_X_0[3:0]           ), //i
    .io_b    (r_Y_0[3:0]           ), //i
    .io_x    (g16Mul_16_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_17 (
    .io_a    (r_X_1[3:0]           ), //i
    .io_b    (r_Y_1[3:0]           ), //i
    .io_x    (g16Mul_17_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_18 (
    .io_a    (io_x_0[3:0]          ), //i
    .io_b    (g16Mul_18_io_b[3:0]  ), //i
    .io_x    (g16Mul_18_io_x[3:0]  )  //o
  );
  G16Mul g16Mul_19 (
    .io_a    (io_x_1[3:0]          ), //i
    .io_b    (g16Mul_19_io_b[3:0]  ), //i
    .io_x    (g16Mul_19_io_x[3:0]  )  //o
  );
  assign io_z_0 = ((r_xTimesY_0 ^ r_xTimesBlindedY_0) ^ r_xTimesMBlinded_0);
  assign io_z_1 = ((r_xTimesY_1 ^ r_xTimesBlindedY_1) ^ r_xTimesMBlinded_1);
  assign r_xTimesBlindedY_0 = g16Mul_14_io_x;
  assign r_xTimesBlindedY_1 = g16Mul_15_io_x;
  assign r_xTimesY_0 = g16Mul_16_io_x;
  assign r_xTimesY_1 = g16Mul_17_io_x;
  assign g16Mul_18_io_b = io_m[7 : 4];
  assign r_xTimesM_0 = g16Mul_18_io_x;
  assign g16Mul_19_io_b = io_m[7 : 4];
  assign r_xTimesM_1 = g16Mul_19_io_x;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_blindedY_0 <= 4'b0000;
      r_blindedY_1 <= 4'b0000;
      r_xTimesMBlinded_0 <= 4'b0000;
      r_xTimesMBlinded_1 <= 4'b0000;
      r_X_0 <= 4'b0000;
      r_X_1 <= 4'b0000;
      r_Y_0 <= 4'b0000;
      r_Y_1 <= 4'b0000;
    end else begin
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 ^ io_m[7 : 4]);
      r_blindedY_1 <= (io_y_0 ^ io_m[7 : 4]);
      r_xTimesMBlinded_0 <= (r_xTimesM_0 ^ io_m[3 : 0]);
      r_xTimesMBlinded_1 <= (r_xTimesM_1 ^ io_m[3 : 0]);
    end
  end


endmodule

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
  input               io_clk,
  input               io_reset,
  input      [1:0]    io_x_0,
  input      [1:0]    io_x_1,
  input      [1:0]    io_y_0,
  input      [1:0]    io_y_1,
  input      [3:0]    io_m,
  output     [1:0]    io_z_0,
  output     [1:0]    io_z_1
);

  wire       [1:0]    g4Mul_64_io_b;
  wire       [1:0]    g4Mul_65_io_b;
  wire       [1:0]    g4Mul_60_io_x;
  wire       [1:0]    g4Mul_61_io_x;
  wire       [1:0]    g4Mul_62_io_x;
  wire       [1:0]    g4Mul_63_io_x;
  wire       [1:0]    g4Mul_64_io_x;
  wire       [1:0]    g4Mul_65_io_x;
  wire       [1:0]    r_xTimesBlindedY_0;
  wire       [1:0]    r_xTimesBlindedY_1;
  wire       [1:0]    r_xTimesM_0;
  wire       [1:0]    r_xTimesM_1;
  wire       [1:0]    r_xTimesY_0;
  wire       [1:0]    r_xTimesY_1;
  reg        [1:0]    r_blindedY_0;
  reg        [1:0]    r_blindedY_1;
  reg        [1:0]    r_xTimesMBlinded_0;
  reg        [1:0]    r_xTimesMBlinded_1;
  reg        [1:0]    r_X_0;
  reg        [1:0]    r_X_1;
  reg        [1:0]    r_Y_0;
  reg        [1:0]    r_Y_1;

  G4Mul g4Mul_60 (
    .io_a    (r_X_0[1:0]          ), //i
    .io_b    (r_blindedY_0[1:0]   ), //i
    .io_x    (g4Mul_60_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_61 (
    .io_a    (r_X_1[1:0]          ), //i
    .io_b    (r_blindedY_1[1:0]   ), //i
    .io_x    (g4Mul_61_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_62 (
    .io_a    (r_X_0[1:0]          ), //i
    .io_b    (r_Y_0[1:0]          ), //i
    .io_x    (g4Mul_62_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_63 (
    .io_a    (r_X_1[1:0]          ), //i
    .io_b    (r_Y_1[1:0]          ), //i
    .io_x    (g4Mul_63_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_64 (
    .io_a    (io_x_0[1:0]         ), //i
    .io_b    (g4Mul_64_io_b[1:0]  ), //i
    .io_x    (g4Mul_64_io_x[1:0]  )  //o
  );
  G4Mul g4Mul_65 (
    .io_a    (io_x_1[1:0]         ), //i
    .io_b    (g4Mul_65_io_b[1:0]  ), //i
    .io_x    (g4Mul_65_io_x[1:0]  )  //o
  );
  assign io_z_0 = ((r_xTimesY_0 ^ r_xTimesBlindedY_0) ^ r_xTimesMBlinded_0);
  assign io_z_1 = ((r_xTimesY_1 ^ r_xTimesBlindedY_1) ^ r_xTimesMBlinded_1);
  assign r_xTimesBlindedY_0 = g4Mul_60_io_x;
  assign r_xTimesBlindedY_1 = g4Mul_61_io_x;
  assign r_xTimesY_0 = g4Mul_62_io_x;
  assign r_xTimesY_1 = g4Mul_63_io_x;
  assign g4Mul_64_io_b = io_m[3 : 2];
  assign r_xTimesM_0 = g4Mul_64_io_x;
  assign g4Mul_65_io_b = io_m[3 : 2];
  assign r_xTimesM_1 = g4Mul_65_io_x;
  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_blindedY_0 <= 2'b00;
      r_blindedY_1 <= 2'b00;
      r_xTimesMBlinded_0 <= 2'b00;
      r_xTimesMBlinded_1 <= 2'b00;
      r_X_0 <= 2'b00;
      r_X_1 <= 2'b00;
      r_Y_0 <= 2'b00;
      r_Y_1 <= 2'b00;
    end else begin
      r_X_0 <= io_x_0;
      r_X_1 <= io_x_1;
      r_Y_0 <= io_y_0;
      r_Y_1 <= io_y_1;
      r_blindedY_0 <= (io_y_1 ^ io_m[3 : 2]);
      r_blindedY_1 <= (io_y_0 ^ io_m[3 : 2]);
      r_xTimesMBlinded_0 <= (r_xTimesM_0 ^ io_m[1 : 0]);
      r_xTimesMBlinded_1 <= (r_xTimesM_1 ^ io_m[1 : 0]);
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

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

//G4ScaleN replaced by G4ScaleN

//G4Mul replaced by G4Mul

//G4Mul replaced by G4Mul

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
