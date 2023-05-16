// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : ChaCha20
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module ChaCha20 (
  input               io_clk,
  input               io_reset,
  input               io_enable,
  input      [255:0]  io_plaintext,
  input      [255:0]  io_key,
  input      [31:0]   io_ctr,
  input      [95:0]   io_nonce,
  output     [255:0]  io_ciphertext,
  output reg          io_done
);
  localparam States_sIdle = 2'd0;
  localparam States_sExecute = 2'd1;
  localparam States_sFinalAdd = 2'd2;
  localparam States_sDone = 2'd3;

  reg        [31:0]   r_qr1_io_a;
  reg        [31:0]   r_qr1_io_b;
  reg        [31:0]   r_qr1_io_c;
  reg        [31:0]   r_qr1_io_d;
  reg        [31:0]   r_qr2_io_a;
  reg        [31:0]   r_qr2_io_b;
  reg        [31:0]   r_qr2_io_c;
  reg        [31:0]   r_qr2_io_d;
  reg        [31:0]   r_qr3_io_a;
  reg        [31:0]   r_qr3_io_b;
  reg        [31:0]   r_qr3_io_c;
  reg        [31:0]   r_qr3_io_d;
  reg        [31:0]   r_qr4_io_a;
  reg        [31:0]   r_qr4_io_b;
  reg        [31:0]   r_qr4_io_c;
  reg        [31:0]   r_qr4_io_d;
  wire       [31:0]   r_qr1_io_e;
  wire       [31:0]   r_qr1_io_f;
  wire       [31:0]   r_qr1_io_g;
  wire       [31:0]   r_qr1_io_h;
  wire       [31:0]   r_qr2_io_e;
  wire       [31:0]   r_qr2_io_f;
  wire       [31:0]   r_qr2_io_g;
  wire       [31:0]   r_qr2_io_h;
  wire       [31:0]   r_qr3_io_e;
  wire       [31:0]   r_qr3_io_f;
  wire       [31:0]   r_qr3_io_g;
  wire       [31:0]   r_qr3_io_h;
  wire       [31:0]   r_qr4_io_e;
  wire       [31:0]   r_qr4_io_f;
  wire       [31:0]   r_qr4_io_g;
  wire       [31:0]   r_qr4_io_h;
  wire       [4:0]    _zz_r_roundCounter_valueNext;
  wire       [0:0]    _zz_r_roundCounter_valueNext_1;
  reg        [31:0]   r_state_0_0;
  reg        [31:0]   r_state_0_1;
  reg        [31:0]   r_state_0_2;
  reg        [31:0]   r_state_0_3;
  reg        [31:0]   r_state_1_0;
  reg        [31:0]   r_state_1_1;
  reg        [31:0]   r_state_1_2;
  reg        [31:0]   r_state_1_3;
  reg        [31:0]   r_state_2_0;
  reg        [31:0]   r_state_2_1;
  reg        [31:0]   r_state_2_2;
  reg        [31:0]   r_state_2_3;
  reg        [31:0]   r_state_3_0;
  reg        [31:0]   r_state_3_1;
  reg        [31:0]   r_state_3_2;
  reg        [31:0]   r_state_3_3;
  wire       [31:0]   r_initialState_0_0;
  wire       [31:0]   r_initialState_0_1;
  wire       [31:0]   r_initialState_0_2;
  wire       [31:0]   r_initialState_0_3;
  wire       [31:0]   r_initialState_1_0;
  wire       [31:0]   r_initialState_1_1;
  wire       [31:0]   r_initialState_1_2;
  wire       [31:0]   r_initialState_1_3;
  wire       [31:0]   r_initialState_2_0;
  wire       [31:0]   r_initialState_2_1;
  wire       [31:0]   r_initialState_2_2;
  wire       [31:0]   r_initialState_2_3;
  wire       [31:0]   r_initialState_3_0;
  wire       [31:0]   r_initialState_3_1;
  wire       [31:0]   r_initialState_3_2;
  wire       [31:0]   r_initialState_3_3;
  wire       [31:0]   r_finalState_0_0;
  wire       [31:0]   r_finalState_0_1;
  wire       [31:0]   r_finalState_0_2;
  wire       [31:0]   r_finalState_0_3;
  wire       [31:0]   r_finalState_1_0;
  wire       [31:0]   r_finalState_1_1;
  wire       [31:0]   r_finalState_1_2;
  wire       [31:0]   r_finalState_1_3;
  wire       [31:0]   r_finalState_2_0;
  wire       [31:0]   r_finalState_2_1;
  wire       [31:0]   r_finalState_2_2;
  wire       [31:0]   r_finalState_2_3;
  wire       [31:0]   r_finalState_3_0;
  wire       [31:0]   r_finalState_3_1;
  wire       [31:0]   r_finalState_3_2;
  wire       [31:0]   r_finalState_3_3;
  reg                 r_roundCounter_willIncrement;
  reg                 r_roundCounter_willClear;
  reg        [4:0]    r_roundCounter_valueNext;
  reg        [4:0]    r_roundCounter_value;
  wire                r_roundCounter_willOverflowIfInc;
  wire                r_roundCounter_willOverflow;
  wire       [31:0]   _zz_r_initialState_3_1;
  wire       [31:0]   _zz_r_initialState_3_2;
  wire       [31:0]   _zz_r_initialState_3_3;
  wire       [31:0]   _zz_r_initialState_1_0;
  wire       [31:0]   _zz_r_initialState_1_1;
  wire       [31:0]   _zz_r_initialState_1_2;
  wire       [31:0]   _zz_r_initialState_1_3;
  wire       [31:0]   _zz_r_initialState_2_0;
  wire       [31:0]   _zz_r_initialState_2_1;
  wire       [31:0]   _zz_r_initialState_2_2;
  wire       [31:0]   _zz_r_initialState_2_3;
  wire                when_ChaCha20_l52;
  reg        [1:0]    r_chachaState;
  `ifndef SYNTHESIS
  reg [71:0] r_chachaState_string;
  `endif


  assign _zz_r_roundCounter_valueNext_1 = r_roundCounter_willIncrement;
  assign _zz_r_roundCounter_valueNext = {4'd0, _zz_r_roundCounter_valueNext_1};
  QuarterRound r_qr1 (
    .io_a        (r_qr1_io_a[31:0]  ), //i
    .io_b        (r_qr1_io_b[31:0]  ), //i
    .io_c        (r_qr1_io_c[31:0]  ), //i
    .io_d        (r_qr1_io_d[31:0]  ), //i
    .io_e        (r_qr1_io_e[31:0]  ), //o
    .io_f        (r_qr1_io_f[31:0]  ), //o
    .io_g        (r_qr1_io_g[31:0]  ), //o
    .io_h        (r_qr1_io_h[31:0]  ), //o
    .io_clk      (io_clk            ), //i
    .io_reset    (io_reset          )  //i
  );
  QuarterRound r_qr2 (
    .io_a        (r_qr2_io_a[31:0]  ), //i
    .io_b        (r_qr2_io_b[31:0]  ), //i
    .io_c        (r_qr2_io_c[31:0]  ), //i
    .io_d        (r_qr2_io_d[31:0]  ), //i
    .io_e        (r_qr2_io_e[31:0]  ), //o
    .io_f        (r_qr2_io_f[31:0]  ), //o
    .io_g        (r_qr2_io_g[31:0]  ), //o
    .io_h        (r_qr2_io_h[31:0]  ), //o
    .io_clk      (io_clk            ), //i
    .io_reset    (io_reset          )  //i
  );
  QuarterRound r_qr3 (
    .io_a        (r_qr3_io_a[31:0]  ), //i
    .io_b        (r_qr3_io_b[31:0]  ), //i
    .io_c        (r_qr3_io_c[31:0]  ), //i
    .io_d        (r_qr3_io_d[31:0]  ), //i
    .io_e        (r_qr3_io_e[31:0]  ), //o
    .io_f        (r_qr3_io_f[31:0]  ), //o
    .io_g        (r_qr3_io_g[31:0]  ), //o
    .io_h        (r_qr3_io_h[31:0]  ), //o
    .io_clk      (io_clk            ), //i
    .io_reset    (io_reset          )  //i
  );
  QuarterRound r_qr4 (
    .io_a        (r_qr4_io_a[31:0]  ), //i
    .io_b        (r_qr4_io_b[31:0]  ), //i
    .io_c        (r_qr4_io_c[31:0]  ), //i
    .io_d        (r_qr4_io_d[31:0]  ), //i
    .io_e        (r_qr4_io_e[31:0]  ), //o
    .io_f        (r_qr4_io_f[31:0]  ), //o
    .io_g        (r_qr4_io_g[31:0]  ), //o
    .io_h        (r_qr4_io_h[31:0]  ), //o
    .io_clk      (io_clk            ), //i
    .io_reset    (io_reset          )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(r_chachaState)
      States_sIdle : r_chachaState_string = "sIdle    ";
      States_sExecute : r_chachaState_string = "sExecute ";
      States_sFinalAdd : r_chachaState_string = "sFinalAdd";
      States_sDone : r_chachaState_string = "sDone    ";
      default : r_chachaState_string = "?????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(r_chachaState)
      States_sIdle : begin
      end
      States_sExecute : begin
      end
      States_sFinalAdd : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign io_ciphertext = 256'h0;
  always @(*) begin
    r_roundCounter_willIncrement = 1'b0;
    case(r_chachaState)
      States_sIdle : begin
      end
      States_sExecute : begin
        r_roundCounter_willIncrement = 1'b1;
      end
      States_sFinalAdd : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    r_roundCounter_willClear = 1'b0;
    case(r_chachaState)
      States_sIdle : begin
        r_roundCounter_willClear = 1'b1;
      end
      States_sExecute : begin
      end
      States_sFinalAdd : begin
      end
      default : begin
      end
    endcase
  end

  assign r_roundCounter_willOverflowIfInc = (r_roundCounter_value == 5'h13);
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

  assign r_initialState_0_0 = 32'h61707865;
  assign r_initialState_0_1 = 32'h3320646e;
  assign r_initialState_0_2 = 32'h79622d32;
  assign r_initialState_0_3 = 32'h6b206574;
  assign r_initialState_3_0 = io_ctr;
  assign _zz_r_initialState_3_1 = io_nonce[95 : 64];
  assign r_initialState_3_1 = {{{_zz_r_initialState_3_1[7 : 0],_zz_r_initialState_3_1[15 : 8]},_zz_r_initialState_3_1[23 : 16]},_zz_r_initialState_3_1[31 : 24]};
  assign _zz_r_initialState_3_2 = io_nonce[63 : 32];
  assign r_initialState_3_2 = {{{_zz_r_initialState_3_2[7 : 0],_zz_r_initialState_3_2[15 : 8]},_zz_r_initialState_3_2[23 : 16]},_zz_r_initialState_3_2[31 : 24]};
  assign _zz_r_initialState_3_3 = io_nonce[31 : 0];
  assign r_initialState_3_3 = {{{_zz_r_initialState_3_3[7 : 0],_zz_r_initialState_3_3[15 : 8]},_zz_r_initialState_3_3[23 : 16]},_zz_r_initialState_3_3[31 : 24]};
  assign _zz_r_initialState_1_0 = io_key[255 : 224];
  assign r_initialState_1_0 = {{{_zz_r_initialState_1_0[7 : 0],_zz_r_initialState_1_0[15 : 8]},_zz_r_initialState_1_0[23 : 16]},_zz_r_initialState_1_0[31 : 24]};
  assign _zz_r_initialState_1_1 = io_key[223 : 192];
  assign r_initialState_1_1 = {{{_zz_r_initialState_1_1[7 : 0],_zz_r_initialState_1_1[15 : 8]},_zz_r_initialState_1_1[23 : 16]},_zz_r_initialState_1_1[31 : 24]};
  assign _zz_r_initialState_1_2 = io_key[191 : 160];
  assign r_initialState_1_2 = {{{_zz_r_initialState_1_2[7 : 0],_zz_r_initialState_1_2[15 : 8]},_zz_r_initialState_1_2[23 : 16]},_zz_r_initialState_1_2[31 : 24]};
  assign _zz_r_initialState_1_3 = io_key[159 : 128];
  assign r_initialState_1_3 = {{{_zz_r_initialState_1_3[7 : 0],_zz_r_initialState_1_3[15 : 8]},_zz_r_initialState_1_3[23 : 16]},_zz_r_initialState_1_3[31 : 24]};
  assign _zz_r_initialState_2_0 = io_key[127 : 96];
  assign r_initialState_2_0 = {{{_zz_r_initialState_2_0[7 : 0],_zz_r_initialState_2_0[15 : 8]},_zz_r_initialState_2_0[23 : 16]},_zz_r_initialState_2_0[31 : 24]};
  assign _zz_r_initialState_2_1 = io_key[95 : 64];
  assign r_initialState_2_1 = {{{_zz_r_initialState_2_1[7 : 0],_zz_r_initialState_2_1[15 : 8]},_zz_r_initialState_2_1[23 : 16]},_zz_r_initialState_2_1[31 : 24]};
  assign _zz_r_initialState_2_2 = io_key[63 : 32];
  assign r_initialState_2_2 = {{{_zz_r_initialState_2_2[7 : 0],_zz_r_initialState_2_2[15 : 8]},_zz_r_initialState_2_2[23 : 16]},_zz_r_initialState_2_2[31 : 24]};
  assign _zz_r_initialState_2_3 = io_key[31 : 0];
  assign r_initialState_2_3 = {{{_zz_r_initialState_2_3[7 : 0],_zz_r_initialState_2_3[15 : 8]},_zz_r_initialState_2_3[23 : 16]},_zz_r_initialState_2_3[31 : 24]};
  assign when_ChaCha20_l52 = (! r_roundCounter_value[0]);
  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr1_io_a = r_state_0_0;
    end else begin
      r_qr1_io_a = r_state_0_0;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr1_io_b = r_state_1_0;
    end else begin
      r_qr1_io_b = r_state_1_1;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr1_io_c = r_state_2_0;
    end else begin
      r_qr1_io_c = r_state_2_2;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr1_io_d = r_state_3_0;
    end else begin
      r_qr1_io_d = r_state_3_3;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr2_io_a = r_state_0_1;
    end else begin
      r_qr2_io_a = r_state_0_1;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr2_io_b = r_state_1_1;
    end else begin
      r_qr2_io_b = r_state_1_2;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr2_io_c = r_state_2_1;
    end else begin
      r_qr2_io_c = r_state_2_3;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr2_io_d = r_state_3_1;
    end else begin
      r_qr2_io_d = r_state_3_0;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr3_io_a = r_state_0_2;
    end else begin
      r_qr3_io_a = r_state_0_2;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr3_io_b = r_state_1_2;
    end else begin
      r_qr3_io_b = r_state_1_3;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr3_io_c = r_state_2_2;
    end else begin
      r_qr3_io_c = r_state_2_0;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr3_io_d = r_state_3_2;
    end else begin
      r_qr3_io_d = r_state_3_1;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr4_io_a = r_state_0_3;
    end else begin
      r_qr4_io_a = r_state_0_3;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr4_io_b = r_state_1_3;
    end else begin
      r_qr4_io_b = r_state_1_0;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr4_io_c = r_state_2_3;
    end else begin
      r_qr4_io_c = r_state_2_1;
    end
  end

  always @(*) begin
    if(when_ChaCha20_l52) begin
      r_qr4_io_d = r_state_3_3;
    end else begin
      r_qr4_io_d = r_state_3_2;
    end
  end

  always @(posedge io_clk or posedge io_reset) begin
    if(io_reset) begin
      r_state_0_0 <= 32'h0;
      r_state_0_1 <= 32'h0;
      r_state_0_2 <= 32'h0;
      r_state_0_3 <= 32'h0;
      r_state_1_0 <= 32'h0;
      r_state_1_1 <= 32'h0;
      r_state_1_2 <= 32'h0;
      r_state_1_3 <= 32'h0;
      r_state_2_0 <= 32'h0;
      r_state_2_1 <= 32'h0;
      r_state_2_2 <= 32'h0;
      r_state_2_3 <= 32'h0;
      r_state_3_0 <= 32'h0;
      r_state_3_1 <= 32'h0;
      r_state_3_2 <= 32'h0;
      r_state_3_3 <= 32'h0;
      r_roundCounter_value <= 5'h0;
      r_chachaState <= States_sIdle;
    end else begin
      r_roundCounter_value <= r_roundCounter_valueNext;
      if(when_ChaCha20_l52) begin
        r_state_0_0 <= r_qr1_io_e;
        r_state_1_0 <= r_qr1_io_f;
        r_state_2_0 <= r_qr1_io_g;
        r_state_3_0 <= r_qr1_io_h;
        r_state_0_1 <= r_qr2_io_e;
        r_state_1_1 <= r_qr2_io_f;
        r_state_2_1 <= r_qr2_io_g;
        r_state_3_1 <= r_qr2_io_h;
        r_state_0_2 <= r_qr3_io_e;
        r_state_1_2 <= r_qr3_io_f;
        r_state_2_2 <= r_qr3_io_g;
        r_state_3_2 <= r_qr3_io_h;
        r_state_0_3 <= r_qr4_io_e;
        r_state_1_3 <= r_qr4_io_f;
        r_state_2_3 <= r_qr4_io_g;
        r_state_3_3 <= r_qr4_io_h;
      end else begin
        r_state_0_0 <= r_qr1_io_e;
        r_state_1_1 <= r_qr1_io_f;
        r_state_2_2 <= r_qr1_io_g;
        r_state_3_3 <= r_qr1_io_h;
        r_state_0_1 <= r_qr2_io_e;
        r_state_1_2 <= r_qr2_io_f;
        r_state_2_3 <= r_qr2_io_g;
        r_state_3_0 <= r_qr2_io_h;
        r_state_0_2 <= r_qr3_io_e;
        r_state_1_3 <= r_qr3_io_f;
        r_state_2_0 <= r_qr3_io_g;
        r_state_3_1 <= r_qr3_io_h;
        r_state_0_3 <= r_qr4_io_e;
        r_state_1_0 <= r_qr4_io_f;
        r_state_2_1 <= r_qr4_io_g;
        r_state_3_2 <= r_qr4_io_h;
      end
      case(r_chachaState)
        States_sIdle : begin
          r_chachaState <= States_sIdle;
          if(io_enable) begin
            r_chachaState <= States_sExecute;
            r_state_0_0 <= r_initialState_0_0;
            r_state_0_1 <= r_initialState_0_1;
            r_state_0_2 <= r_initialState_0_2;
            r_state_0_3 <= r_initialState_0_3;
            r_state_1_0 <= r_initialState_1_0;
            r_state_1_1 <= r_initialState_1_1;
            r_state_1_2 <= r_initialState_1_2;
            r_state_1_3 <= r_initialState_1_3;
            r_state_2_0 <= r_initialState_2_0;
            r_state_2_1 <= r_initialState_2_1;
            r_state_2_2 <= r_initialState_2_2;
            r_state_2_3 <= r_initialState_2_3;
            r_state_3_0 <= r_initialState_3_0;
            r_state_3_1 <= r_initialState_3_1;
            r_state_3_2 <= r_initialState_3_2;
            r_state_3_3 <= r_initialState_3_3;
          end
        end
        States_sExecute : begin
          r_chachaState <= States_sExecute;
          if(r_roundCounter_willOverflow) begin
            r_chachaState <= States_sFinalAdd;
          end
        end
        States_sFinalAdd : begin
          r_chachaState <= States_sDone;
        end
        default : begin
          r_chachaState <= States_sDone;
        end
      endcase
    end
  end


endmodule

//QuarterRound replaced by QuarterRound

//QuarterRound replaced by QuarterRound

//QuarterRound replaced by QuarterRound

module QuarterRound (
  input      [31:0]   io_a,
  input      [31:0]   io_b,
  input      [31:0]   io_c,
  input      [31:0]   io_d,
  output     [31:0]   io_e,
  output     [31:0]   io_f,
  output     [31:0]   io_g,
  output     [31:0]   io_h,
  input               io_clk,
  input               io_reset
);

  reg                 dummy;
  wire       [31:0]   a1;
  wire       [31:0]   _zz_d1;
  wire       [31:0]   d1;
  wire       [31:0]   c1;
  wire       [31:0]   _zz_b1;
  wire       [31:0]   b1;
  wire       [31:0]   a2;
  wire       [31:0]   _zz_d2;
  wire       [31:0]   d2;
  wire       [31:0]   c2;
  wire       [31:0]   _zz_b2;
  wire       [31:0]   b2;

  assign a1 = (io_a + io_b);
  assign _zz_d1 = (a1 ^ io_d);
  assign d1 = {_zz_d1[15 : 0],_zz_d1[31 : 16]};
  assign c1 = (io_c + d1);
  assign _zz_b1 = (io_b ^ c1);
  assign b1 = {_zz_b1[19 : 0],_zz_b1[31 : 20]};
  assign a2 = (a1 + b1);
  assign _zz_d2 = (a2 ^ d1);
  assign d2 = {_zz_d2[23 : 0],_zz_d2[31 : 24]};
  assign c2 = (c1 + d2);
  assign _zz_b2 = (b1 ^ c2);
  assign b2 = {_zz_b2[24 : 0],_zz_b2[31 : 25]};
  assign io_e = a2;
  assign io_f = b2;
  assign io_g = c2;
  assign io_h = d2;

endmodule
