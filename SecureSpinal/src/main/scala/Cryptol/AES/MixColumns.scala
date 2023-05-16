package Cryptol.AES

import spinal.core._

class MixColumns extends Component {
	val io = new Bundle {
		val mcIn 	= in  Bits(128 bits)
		val mcOut = out Bits(128 bits)
	}
	
	for (i <- 0 until 4) {
		val mixcolum = new MixColumn
		mixcolum.io.mixColumnsInput := io.mcIn(127-32*i downto 96-32*i)
		io.mcOut(127-32*i downto 96-32*i) := mixcolum.io.mixColumnsOutput
	}
}