package AES.Plain

import spinal.core._

class AddRoundKey() extends Component {
	val io = new Bundle {
		val addRoundKeyInput 	= in  Bits(128 bits)
		val roundKey 			= in  Bits(128 bits)
		val addRoundKeyOutput 	= out Bits(128 bits)
	}
	
	io.addRoundKeyOutput := io.addRoundKeyInput ^ io.roundKey
}
