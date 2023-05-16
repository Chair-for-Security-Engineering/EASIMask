package AES.DOM

import spinal.core._

class AddRoundKey() extends Component {
	val io = new Bundle {
		val akIn 	= in  Bits(128 bits)
		val rk 		= in  Bits(128 bits)
		val akOut = out Bits(128 bits)
	}
	
	io.akOut := io.akIn ^ io.rk
}
