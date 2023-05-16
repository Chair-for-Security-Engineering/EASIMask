package AES.Matrix

import spinal.core._

class ShiftRows extends Component {
	val io = new Bundle {
		val srIn 	= in  Vec(Vec(Bits(8 bits), 4), 4)
		val srOut = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	for (i <- 0 until 4) {
		io.srOut(i) := rotate(io.srIn(i), i)
	}
	
	def rotate (a : Vec[Bits], rot : Int): Vec[Bits] = {
		val ret = Vec(Bits(8 bits), 4)
		for (i <- 0 until 4) {
			ret(i) := a((i+rot)%4)
		}
		ret
	}
}