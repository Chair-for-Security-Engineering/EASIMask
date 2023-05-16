package Adders

import spinal.core._

class SimpleAdder extends Component {
	val io = new Bundle {
		val x = in  Bits(4 bits)
		val y = in  Bits(4 bits)
		val z = out Bits(4 bits)
	}
	
	val dummy = Reg(Bool())
	io.z := B(U(io.x) + U(io.y))
}