package Cryptol.ChaCha20

import spinal.core._

class QuarterRound extends Component {
	val io = new Bundle {
		val a = in  UInt(32 bits)
		val b = in  UInt(32 bits)
		val c = in  UInt(32 bits)
		val d = in  UInt(32 bits)
		val e = out UInt(32 bits)
		val f = out UInt(32 bits)
		val g = out UInt(32 bits)
		val h = out UInt(32 bits)
	}
	
	val dummy = Reg(Bool())
	val a1 = io.a + io.b
	val d1 = (a1 ^ io.d).rotateLeft(16)
	
	val c1 = io.c + d1
	val b1 = (io.b ^ c1).rotateLeft(12)
	
	val a2 = a1 + b1
	val d2 = (a2 ^ d1).rotateLeft(8)
	
	val c2 = c1 + d2
	val b2 = (b1 ^ c2).rotateLeft(7)
	
	io.e := a2
	io.f := b2
	io.g := c2
	io.h := d2
}