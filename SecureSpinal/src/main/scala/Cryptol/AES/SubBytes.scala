package Cryptol.AES

import spinal.core._

class SubBytes extends Component {
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val sbIn1 	= in  Bits(128 bits)
		val sbIn2 	= in  Bits(128 bits)
		val mask 		= in  Bits(608 bits)
		val sbOut1 	= out Bits(128 bits)
		val sbOut2 	= out Bits(128 bits)
	}
	
	for (i <- 0 until 16) {
		val sbox = new SBox
		sbox.io.clk := io.clk
		sbox.io.reset := io.reset
		sbox.io.sbox_in := io.sbIn1(127-8*i downto 120-8*i) ## io.sbIn2(127-8*i downto 120-8*i)
		sbox.io.mask := io.mask(607-38*i downto 570-38*i)
		io.sbOut1(127-8*i downto 120-8*i) := sbox.io.sbox_out(15 downto 8)
		io.sbOut2(127-8*i downto 120-8*i) := sbox.io.sbox_out(7 downto 0)
	}
}