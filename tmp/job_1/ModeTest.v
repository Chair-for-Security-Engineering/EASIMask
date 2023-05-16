// Generator : SpinalHDL v1.6.2    git head : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e
// Component : ModeTest
// Git hash  : 685405804ac0fa51f884fe0ee6813ba6f1f31e4e

`timescale 1ns/1ps 

module ModeTest (
  input               io_reset,
  input      [127:0]  io_pt,
  input      [127:0]  io_key,
  output reg [127:0]  io_ct,
  output reg          io_done,
  input               clk,
  input               reset
);

  wire       [3:0]    _zz_ctr_valueNext;
  wire       [0:0]    _zz_ctr_valueNext_1;
  reg        [127:0]  state;
  reg                 ctr_willIncrement;
  reg                 ctr_willClear;
  reg        [3:0]    ctr_valueNext;
  reg        [3:0]    ctr_value;
  wire                ctr_willOverflowIfInc;
  wire                ctr_willOverflow;
  reg                 io_reset_regNext;
  wire                when_tests_l204;
  wire                ctr_willIncrement_const;

  assign _zz_ctr_valueNext_1 = ctr_willIncrement;
  assign _zz_ctr_valueNext = {3'd0, _zz_ctr_valueNext_1};
  assign ctr_willIncrement_const = 1'b0;
  always @(*) begin
      ctr_willIncrement = ctr_willIncrement_const;
      ctr_willIncrement = 1'b1;
  end

  always @(*) begin
    ctr_willClear = 1'b0;
    if(io_reset) begin
      ctr_willClear = 1'b1;
    end
  end

  assign ctr_willOverflowIfInc = (ctr_value == 4'b1001);
  assign ctr_willOverflow = (ctr_willOverflowIfInc && ctr_willIncrement);
  always @(*) begin
    if(ctr_willOverflow) begin
      ctr_valueNext = 4'b0000;
    end else begin
      ctr_valueNext = (ctr_value + _zz_ctr_valueNext);
    end
    if(ctr_willClear) begin
      ctr_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    io_done = 1'b0;
    if(ctr_willOverflow) begin
      io_done = 1'b1;
    end
  end

  always @(*) begin
    io_ct = 128'h0;
    if(ctr_willOverflow) begin
      io_ct = state;
    end
  end

  assign when_tests_l204 = ((! io_reset) && io_reset_regNext);
  always @(posedge clk or posedge reset) begin
    if(reset) begin
      state <= 128'h0;
      ctr_value <= 4'b0000;
    end else begin
      ctr_value <= ctr_valueNext;
      if(when_tests_l204) begin
        state <= (~ (io_pt ^ io_key));
      end else begin
        if(io_reset) begin
          state <= 128'h0;
        end
      end
    end
  end

  always @(posedge clk) begin
    io_reset_regNext <= io_reset;
  end


endmodule
