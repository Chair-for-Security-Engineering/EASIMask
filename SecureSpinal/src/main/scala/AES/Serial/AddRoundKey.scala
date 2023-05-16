package AES.Serial

import spinal.core._

class AddRoundKey extends Component {
	val io = new Bundle {
		val a = in  Bits(8 bits)
		val k = in  Bits(8 bits)
		val b = out Bits(8 bits)
	}
	
	io.b := io.a ^ io.k
}