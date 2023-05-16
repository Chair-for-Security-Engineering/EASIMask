// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : trash
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

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
  localparam States_sIdle = 2'd0;
  localparam States_sExecute = 2'd1;
  localparam States_sDone = 2'd2;

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
      States_sIdle : state_string = "sIdle   ";
      States_sExecute : state_string = "sExecute";
      States_sDone : state_string = "sDone   ";
      default : state_string = "????????";
    endcase
  end
  `endif

  always @(*) begin
    io_done = 1'b0;
    case(state)
      States_sIdle : begin
      end
      States_sExecute : begin
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
      state <= States_sIdle;
    end else begin
      case(state)
        States_sIdle : begin
          state <= States_sIdle;
          if(io_enable) begin
            state <= States_sExecute;
          end
        end
        States_sExecute : begin
          state1 <= (io_pt1 ^ io_key1);
          state2 <= (io_pt2 ^ io_key2);
          state3 <= (io_pt3 ^ io_key3);
          state <= States_sDone;
        end
        default : begin
        end
      endcase
    end
  end


endmodule
