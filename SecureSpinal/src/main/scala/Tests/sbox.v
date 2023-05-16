module sbox(sboxIn, sboxOut, clk);
	input clk;
	input [1:0] sboxIn;
	output reg [1:0] sboxOut;

	always @ (posedge clk) begin
		case(sboxIn)
			2'b00: sboxOut <= 2;
			2'b01: sboxOut <= 0;
			2'b10: sboxOut <= 3;
			2'b11: sboxOut <= 1;
		endcase
	end
endmodule
