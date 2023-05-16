package AES.Column

import spinal.core._

class MixColumns extends Component {
	val io = new Bundle {
		val mcIn = in  Vec(Bits(8 bits), 4)
		val mcOut = out  Vec(Bits(8 bits), 4)
	}
	
	val a1, a2, a3, a0 = Bits(8 bits)
	
	a0 := io.mcIn(0)
	a1 := io.mcIn(1)
	a2 := io.mcIn(2)
	a3 := io.mcIn(3)
	
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

	io.mcOut(0) := timesTwo(a0) ^ timesThree(a1) ^ a2 ^ a3
	io.mcOut(1) := a0 ^ timesTwo(a1) ^ timesThree(a2) ^ a3
	io.mcOut(2) := a0 ^ a1 ^ timesTwo(a2) ^ timesThree(a3)
	io.mcOut(3) := timesThree(a0) ^ a1 ^ a2 ^ timesTwo(a3)
}
