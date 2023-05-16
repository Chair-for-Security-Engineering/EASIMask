package Cryptol.PRESENT

import spinal.core._
import spinal.lib._

class addRoundKey() extends Component {
	val io = new Bundle {
		val stateIn  	= in  Bits(64 bits)
		val key 		= in  Bits(64 bits)
		val stateOut 	= out Bits(64 bits)
	}
	
	io.stateOut := io.stateIn ^ io.key
}
