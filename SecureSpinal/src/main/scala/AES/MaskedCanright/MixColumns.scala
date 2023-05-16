package AES.MaskedCanright

import spinal.core._

/*
* MixColumns operation for AES. Identical to unshared MC as it is linear.
* Inputs:		mixColumnsInput: 	Input
* Outputs:	mixColumnsOutput:	Output
*/

class MixColumns extends Component {
	val io = new Bundle {
		val mixColumnsInput 	= in  Bits(32 bits)
		val mixColumnsOutput 	= out Bits(32 bits)
	}
	
	val a1, a2, a3, a0 = Bits(8 bits)
	
	a0 := io.mixColumnsInput(31 downto 24)
	a1 := io.mixColumnsInput(23 downto 16)
	a2 := io.mixColumnsInput(15 downto 8)
	a3 := io.mixColumnsInput(7 downto 0)
	
	/* Performs 02*a in GF(2^8). Shift left once, XOR with 0x11B if a 1
	*  was pushed out
	* */
	def timesTwo(a : Bits): Bits = {
		val b = Bits(9 bits)
		when (a(7)) {
			b := (a << 1) ^ 0x11B
		} otherwise {
			b := (a << 1)
		}
		b(7 downto 0)
	}
	
	/* Performs 03*a in GF(2^8) */
	def timesThree(a : Bits): Bits = {
		timesTwo(a) ^ a
	}

	io.mixColumnsOutput(31 downto 24) := timesTwo(a0) ^ timesThree(a1) ^ a2 ^ a3
	io.mixColumnsOutput(23 downto 16) := a0 ^ timesTwo(a1) ^ timesThree(a2) ^ a3
	io.mixColumnsOutput(15 downto  8) := a0 ^ a1 ^ timesTwo(a2) ^ timesThree(a3)
	io.mixColumnsOutput( 7 downto  0) := timesThree(a0) ^ a1 ^ a2 ^ timesTwo(a3)
}
