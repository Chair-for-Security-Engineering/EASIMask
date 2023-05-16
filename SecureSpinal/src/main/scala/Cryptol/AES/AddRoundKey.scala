package Cryptol.AES

import spinal.core._

class AddRoundKey extends Component {
	val io = new Bundle {
		val arkIn 	= in  Bits(128 bits)
		val key 		= in  Bits(128 bits)
		val arkOut 	= out Bits(128 bits)
	}
	
	io.arkOut := io.arkIn ^ io.key
}