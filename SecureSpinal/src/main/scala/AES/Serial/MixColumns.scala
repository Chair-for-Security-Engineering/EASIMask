package AES.Serial

import spinal.core._

class MixColumns extends Component {
	val io = new Bundle {
		val mcIn1 	= in  Bits(8 bits)
		val mcIn2 	= in  Bits(8 bits)
		val mcIn3 	= in  Bits(8 bits)
		val mcIn4 	= in  Bits(8 bits)
		val mcOut1 	= out Bits(8 bits)
		val mcOut2 	= out Bits(8 bits)
		val mcOut3 	= out Bits(8 bits)
		val mcOut4 	= out Bits(8 bits)
	}
	
	val a1, a2, a3, a0 = Bits(8 bits)
	
	a0 := io.mcIn1
	a1 := io.mcIn2
	a2 := io.mcIn3
	a3 := io.mcIn4
	
	def timesTwo(a : Bits): Bits = {
		val b = Bits(9 bits)
		when (a(7)) {
			b := (a << 1) ^ 0x11B
		} otherwise {
			b := (a << 1)
		}
		b(7 downto 0)
	}
	
	def timesThree(a : Bits): Bits = {
		timesTwo(a) ^ a
	}

	io.mcOut1 := timesTwo(a0) ^ timesThree(a1) ^ a2 ^ a3
	io.mcOut2 := a0 ^ timesTwo(a1) ^ timesThree(a2) ^ a3
	io.mcOut3 := a0 ^ a1 ^ timesTwo(a2) ^ timesThree(a3)
	io.mcOut4 := timesThree(a0) ^ a1 ^ a2 ^ timesTwo(a3)
}
