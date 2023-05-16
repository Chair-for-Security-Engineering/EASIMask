package AES.MaskedCanright

import spinal.core._

/*  Shared key addition
		Inputs:		a: Shared state
							k: Shared key
		Outputs:	b: Shared result of key addition
* */

class AddRoundKeyMasked extends Component {
	val io = new Bundle {
		val a			= in  Vec(Bits(128 bits), 2)
		val k			= in  Vec(Bits(128 bits), 2)
		val b 		= out Vec(Bits(128 bits), 2)
	}
	
	for(i <- 0 until 2) {
		io.b(i) := io.a(i) ^ io.k(i)
	}
}
