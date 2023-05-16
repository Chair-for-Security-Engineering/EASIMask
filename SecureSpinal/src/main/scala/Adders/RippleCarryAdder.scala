package Adders

import spinal.core._

class RippleCarryAdder extends Component {
	val io = new Bundle {
		val x = in  Bits(4 bits)
		val y = in  Bits(4 bits)
		val z = out Bits(4 bits)
	}
	
	val dummy = Reg(Bool())
	val c0 = False
	val s0 = io.x(0) ^ io.y(0) ^ c0
	val c1 = (io.x(0) & io.y(0)) ^ (io.x(0) & c0) ^ (io.y(0) & c0)
	val s1 = io.x(1) ^ io.y(1) ^ c1
	val c2 = (io.x(1) & io.y(1)) ^ (io.x(1) & c1) ^ (io.y(1) & c1)
	val s2 = io.x(2) ^ io.y(2) ^ c2
	val c3 = (io.x(2) & io.y(2)) ^ (io.x(2) & c2) ^ (io.y(2) & c2)
	val s3 = io.x(3) ^ io.y(3) ^ c3
	
	io.z := s3 ## s2 ## s1 ## s0
}

class RippleCarryAdderNBit(n : Int) extends Component {
	val io = new Bundle {
		val x = in  Bits(n bits)
		val y = in  Bits(n bits)
		val z = out Bits(n bits)
	}
	
	val dummy = Reg(Bool())
	val c = Vec(Bool(), n)
	val s = Vec(Bool(), n)
	c(0) := False
	
	for (i <- 1 until n) {
		c(i) := (io.x(i-1) & io.y(i-1)) ^ (io.x(i-1) & c(i-1)) ^ (io.y(i-1) & c(i-1))
	}
	
	for (i <- 0 until n) {
		s(i) := io.x(i) ^ io.y(i) ^ c(i)
		io.z(i) := s(i)
	}
}