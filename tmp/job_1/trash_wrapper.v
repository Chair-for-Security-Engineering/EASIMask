// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : trash_wrapper
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module trash_wrapper (
  input               io_resetFull,
  input               io_enable,
  input      [191:0]  io_plaintext,
  input      [191:0]  io_key,
  output reg [191:0]  io_ciphertext,
  output reg          io_done,
  input               clk,
  input               reset
);
  localparam States_sIdle = 2'd0;
  localparam States_sSampleInputs = 2'd1;
  localparam States_sExecute = 2'd2;
  localparam States_sDone = 2'd3;

  wire       [63:0]   cipher_io_ct1;
  wire       [63:0]   cipher_io_ct2;
  wire       [63:0]   cipher_io_ct3;
  wire                cipher_io_done;
  reg        [63:0]   plaintextReg_0;
  reg        [63:0]   plaintextReg_1;
  reg        [63:0]   plaintextReg_2;
  reg        [63:0]   keyReg_0;
  reg        [63:0]   keyReg_1;
  reg        [63:0]   keyReg_2;
  reg        [63:0]   ciphertextReg_0;
  reg        [63:0]   ciphertextReg_1;
  reg        [63:0]   ciphertextReg_2;
  reg                 cipherEnable;
  reg                 cipherDone;
  reg        [1:0]    dutState;
  `ifndef SYNTHESIS
  reg [103:0] dutState_string;
  `endif


  trash cipher (
    .io_enable    (cipherEnable          ), //i
    .io_pt1       (plaintextReg_0[63:0]  ), //i
    .io_pt2       (plaintextReg_1[63:0]  ), //i
    .io_pt3       (plaintextReg_2[63:0]  ), //i
    .io_key1      (keyReg_0[63:0]        ), //i
    .io_key2      (keyReg_1[63:0]        ), //i
    .io_key3      (keyReg_2[63:0]        ), //i
    .io_ct1       (cipher_io_ct1[63:0]   ), //o
    .io_ct2       (cipher_io_ct2[63:0]   ), //o
    .io_ct3       (cipher_io_ct3[63:0]   ), //o
    .io_done      (cipher_io_done        ), //o
    .clk          (clk                   ), //i
    .reset        (reset                 )  //i
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(dutState)
      States_sIdle : dutState_string = "sIdle        ";
      States_sSampleInputs : dutState_string = "sSampleInputs";
      States_sExecute : dutState_string = "sExecute     ";
      States_sDone : dutState_string = "sDone        ";
      default : dutState_string = "?????????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(dutState)
      States_sIdle : begin
      end
      States_sSampleInputs : begin
      end
      States_sExecute : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  always @(*) begin
    io_ciphertext[191 : 128] = ciphertextReg_0;
    io_ciphertext[127 : 64] = ciphertextReg_1;
    io_ciphertext[63 : 0] = ciphertextReg_2;
  end

  always @(posedge clk or posedge reset) begin
    if(reset) begin
      plaintextReg_0 <= 64'h0;
      plaintextReg_1 <= 64'h0;
      plaintextReg_2 <= 64'h0;
      keyReg_0 <= 64'h0;
      keyReg_1 <= 64'h0;
      keyReg_2 <= 64'h0;
      ciphertextReg_0 <= 64'h0;
      ciphertextReg_1 <= 64'h0;
      ciphertextReg_2 <= 64'h0;
      cipherEnable <= 1'b0;
      dutState <= States_sIdle;
    end else begin
      case(dutState)
        States_sIdle : begin
          dutState <= States_sIdle;
          if(io_enable) begin
            dutState <= States_sSampleInputs;
          end
        end
        States_sSampleInputs : begin
          plaintextReg_0 <= io_plaintext[191 : 128];
          plaintextReg_1 <= io_plaintext[127 : 64];
          plaintextReg_2 <= io_plaintext[63 : 0];
          keyReg_0 <= io_key[191 : 128];
          keyReg_1 <= io_key[127 : 64];
          keyReg_2 <= io_key[63 : 0];
          cipherEnable <= 1'b1;
          dutState <= States_sExecute;
        end
        States_sExecute : begin
          dutState <= States_sExecute;
          if(cipher_io_done) begin
            ciphertextReg_0 <= cipher_io_ct1;
            ciphertextReg_1 <= cipher_io_ct2;
            ciphertextReg_2 <= cipher_io_ct3;
            dutState <= States_sDone;
          end
        end
        default : begin
        end
      endcase
    end
  end

  always @(posedge clk) begin
    cipherDone <= cipher_io_done;
  end


endmodule

module trash (
  input               io_enable,
  input      [63:0]   io_pt1,
  input      [63:0]   io_pt2,
  input      [63:0]   io_pt3,
  input      [63:0]   io_key1,
  input      [63:0]   io_key2,
  input      [63:0]   io_key3,
  output     [63:0]   io_ct1,
  output     [63:0]   io_ct2,
  output     [63:0]   io_ct3,
  output reg          io_done,
  input               clk,
  input               reset
);
  localparam States_1_sIdle = 2'd0;
  localparam States_1_sExecute = 2'd1;
  localparam States_1_sDone = 2'd2;

  reg        [63:0]   state1;
  reg        [63:0]   state2;
  reg        [63:0]   state3;
  reg        [1:0]    state;
  `ifndef SYNTHESIS
  reg [63:0] state_string;
  `endif


  `ifndef SYNTHESIS
  always @(*) begin
    case(state)
      States_1_sIdle : state_string = "sIdle   ";
      States_1_sExecute : state_string = "sExecute";
      States_1_sDone : state_string = "sDone   ";
      default : state_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(state)
      States_1_sIdle : begin
      end
      States_1_sExecute : begin
      end
      default : begin
        io_done = 1'b1;
      end
    endcase
  end

  assign io_ct1 = state1;
  assign io_ct2 = state2;
  assign io_ct3 = state3;
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state1 <= 64'h0;
      state2 <= 64'h0;
      state3 <= 64'h0;
      state <= States_1_sIdle;
    end else begin
      case(state)
        States_1_sIdle : begin
          state <= States_1_sIdle;
          if(io_enable) begin
            state <= States_1_sExecute;
          end
        end
        States_1_sExecute : begin
          state1 <= (io_pt1 ^ io_key1);
          state2 <= (io_pt2 ^ io_key2);
          state3 <= (io_pt3 ^ io_key3);
          state <= States_1_sDone;
        end
        default : begin
        end
      endcase
    end
  end


endmodule
