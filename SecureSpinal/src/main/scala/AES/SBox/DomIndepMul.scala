package AES.SBox

import AES.Serial.G16Mul
import spinal.core._

class DomIndepMul extends Component {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val x 		= in  Vec(Bits(4 bits), 3)
		val y 		= in  Vec(Bits(4 bits), 3)
		val m 		= in  Vec(Bits(4 bits), 3)
		val z 		= out Vec(Bits(4 bits), 3)
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val r = Vec(Reg(Bits(4 bits)) init(0), 9)
		val mulOut = Vec(Bits(4 bits), 9)

		for (i <- 0 until 3) {
			for (j <- 0 until 3) {
				val mul = new G16Mul
				mul.io.a := io.x(i)
				mul.io.b := io.y(j)
				mulOut(3*i+j) := mul.io.x
			}
		}
		
		r(0) := mulOut(0)
		r(1) := mulOut(1) ^ io.m(0)
		r(2) := mulOut(2) ^ io.m(1)
		r(3) := mulOut(3) ^ io.m(0)
		r(4) := mulOut(4)
		r(5) := mulOut(5) ^ io.m(2)
		r(6) := mulOut(6) ^ io.m(1)
		r(7) := mulOut(7) ^ io.m(2)
		r(8) := mulOut(8)
		
		io.z(0) := r(0) ^ r(1) ^ r(2)
		io.z(1) := r(3) ^ r(4) ^ r(5)
		io.z(2) := r(6) ^ r(7) ^ r(8)
	}
}