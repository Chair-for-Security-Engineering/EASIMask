package AES.Column

import spinal.core._

class AddRoundKey extends Component {
	val io = new Bundle {
		val stateIn = in Vec(Bits(8 bits), 4)
		val key = in Vec(Bits(8 bits), 4)
		val stateOut = out Vec(Bits(8 bits), 4)
	}
	
	for (i <- 0 until 4) {
		io.stateOut(i) := io.stateIn(i) ^ io.key(i)
	}
}