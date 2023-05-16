package AES.Matrix

import spinal.core._

class AddRoundKey extends Component {
	val io = new Bundle {
		val state 	= in  Vec(Vec(Bits(8 bits), 4), 4)
		val key 		= in  Vec(Vec(Bits(8 bits), 4), 4)
		val result 	= out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	for (i <- 0 until 4) {
		for (j <- 0 until 4) {
			io.result(i)(j) := io.state(i)(j) ^ io.key(i)(j)
		}
	}
}