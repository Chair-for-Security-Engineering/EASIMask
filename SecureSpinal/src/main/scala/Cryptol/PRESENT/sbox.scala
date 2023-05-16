package Cryptol.PRESENT

import spinal.core._
import spinal.lib._

class SBox() extends Component {
	val io = new Bundle {
		val input 	= in  UInt(4 bits)
		val output 	= out UInt(4 bits)
	}
	
	switch(io.input) {
		is( 0) {io.output := U"4'hC"}
		is( 1) {io.output := U"4'h5"}
		is( 2) {io.output := U"4'h6"}
		is( 3) {io.output := U"4'hB"}
		is( 4) {io.output := U"4'h9"}
		is( 5) {io.output := U"4'h0"}
		is( 6) {io.output := U"4'hA"}
		is( 7) {io.output := U"4'hD"}
		is( 8) {io.output := U"4'h3"}
		is( 9) {io.output := U"4'hE"}
		is(10) {io.output := U"4'hF"}
		is(11) {io.output := U"4'h8"}
		is(12) {io.output := U"4'h4"}
		is(13) {io.output := U"4'h7"}
		is(14) {io.output := U"4'h1"}
		is(15) {io.output := U"4'h2"}
	}
}

class G extends Component {
	val io = new Bundle {
		val input = in Bits(4 bits)
		val output = out Bits(4 bits)
	}
	
	val x = io.input(3)
	val y = io.input(2)
	val z = io.input(1)
	val w = io.input(0)
	val dummy = Reg(Bool())
	
	io.output(3) := y ^ z ^ w
	io.output(2) := True ^ y ^ z
	io.output(1) := True ^ x ^ z ^ (y & w) ^ (z & w)
	io.output(0) := True ^ w ^ (x & y) ^ (x & z) ^ (y & z)
}

class MaskedSBox extends Component {
	val io = new Bundle {
		val in1 	= in  Bits(4 bits)
		val in2 	= in  Bits(4 bits)
		val in3 	= in  Bits(4 bits)
		val out1 	= out Bits(4 bits)
		val out2 	= out Bits(4 bits)
		val out3 	= out Bits(4 bits)
	}
	
	val GOut1, GOut2, GOut3 = Reg(Bits(4 bits)) init(0)
	
	val g1 = new G1
	g1.io.X2 := io.in2
	g1.io.X3 := io.in3
	GOut1 := g1.io.Y
	
	val g2 = new G2
	g2.io.X1 := io.in1
	g2.io.X3 := io.in3
	GOut2 := g2.io.Y
	
	val g3 = new G3
	g3.io.X1 := io.in1
	g3.io.X2 := io.in2
	GOut3 := g3.io.Y
	
	val f1 = new F1
	f1.io.R2 := GOut2
	f1.io.R3 := GOut3
	io.out1 := f1.io.Y
	
	val f2 = new F2
	f2.io.R1 := GOut1
	f2.io.R3 := GOut3
	io.out2 := f2.io.Y
	
	val f3 = new F3
	f3.io.R1 := GOut1
	f3.io.R2 := GOut2
	io.out3 := f3.io.Y
}

class G1 extends Component {
	val io = new Bundle {
		val X2 	= in  Bits(4 bits)
		val X3 	= in  Bits(4 bits)
		val Y 	= out Bits(4 bits)
	}
	
	val X2 = io.X2
	val X3 = io.X3
	
	io.Y(3) := X2(2) ^ X2(1) ^ X2(0)
	io.Y(2) := True ^ X2(2) ^ X2(1)
	io.Y(1) := True ^ X2(3) ^ X2(1) ^ (X2(2) & X2(0)) ^ (X2(2) & X3(0)) ^ (X3(2) & X2(0)) ^ (X2(1) & X2(0)) ^ (X2(1) & X3(0)) ^ (X3(1) & X2(0))
	io.Y(0) := True ^ X2(0) ^ (X2(3) & X2(2)) ^ (X2(3) & X3(2)) ^ (X3(3) & X2(2)) ^ (X2(3) & X2(1)) ^ (X2(3) & X3(1)) ^ (X3(3) & X2(1)) ^ (X2(2) & X2(1)) ^ (X2(2) & X3(1)) ^ (X3(2) & X2(1))
}

class G2 extends Component {
	val io = new Bundle {
		val X1  = in  Bits(4 bits)
		val X3 	= in  Bits(4 bits)
		val Y 	= out Bits(4 bits)
	}
	
	val X1 = io.X1
	val X3 = io.X3
	
	io.Y(3) := X3(2) ^ X3(1) ^ X3(0)
	io.Y(2) := X3(2) ^ X3(1)
	io.Y(1) := X3(3) ^ X3(1) ^ (X3(2) & X3(0)) ^ (X3(2) & X1(0)) ^ (X1(2) & X3(0)) ^ (X3(1) & X3(0)) ^ (X3(1) & X1(0)) ^ (X1(1) & X3(0))
	io.Y(0) := X3(0) ^ (X3(3) & X3(2)) ^ (X3(3) & X1(2)) ^ (X1(3) & X3(2)) ^ (X3(3) & X3(1)) ^ (X3(3) & X1(1)) ^ (X1(3) & X3(1)) ^ (X3(2) & X3(1)) ^ (X3(2) & X1(1)) ^ (X1(2) & X3(1))
}

class G3 extends Component {
	val io = new Bundle {
		val X1  = in  Bits(4 bits)
		val X2  = in  Bits(4 bits)
		val Y   = out Bits(4 bits)
	}
	
	val X1 = io.X1
	val X2 = io.X2
	
	io.Y(3) := X1(2) ^ X1(1) ^ X1(0)
	io.Y(2) := X1(2) ^ X1(1)
	io.Y(1) := X1(3) ^ X1(1) ^ (X1(2) & X1(0)) ^ (X1(2) & X2(0)) ^ (X2(2) & X1(0)) ^ (X1(1) & X1(0)) ^ (X1(1) & X2(0)) ^ (X2(1) & X1(0))
	io.Y(0) := X1(0) ^ (X1(3) & X1(2)) ^ (X1(3) & X2(2)) ^ (X2(3) & X1(2)) ^ (X1(3) & X1(1)) ^ (X1(3) & X2(1)) ^ (X2(3) & X1(1)) ^ (X1(2) & X1(1)) ^ (X1(2) & X2(1)) ^ (X2(2) & X1(1))
}

class F1 extends Component {
	val io = new Bundle {
		val R2  = in  Bits(4 bits)
		val R3  = in  Bits(4 bits)
		val Y   = out Bits(4 bits)
	}
	
	val R2 = io.R2
	val R3 = io.R3
	
	io.Y(3) := R2(2) ^ R2(1) ^ R2(0) ^ (R2(3) & R2(0)) ^ (R2(3) & R3(0)) ^ (R3(3) & R2(0))
	io.Y(2) := R2(3) ^ (R2(1) & R2(0)) ^ (R2(1) & R3(0)) ^ (R3(1) & R2(0))
	io.Y(1) := R2(2) ^ R2(1) ^ (R2(3) & R2(0)) ^ (R2(3) & R3(0)) ^ (R3(3) & R2(0))
	io.Y(0) := R2(1) ^ (R2(2) & R2(0)) ^ (R2(2) & R3(0)) ^ (R3(2) & R2(0))
}

class F2 extends Component {
	val io = new Bundle {
		val R1  = in  Bits(4 bits)
		val R3  = in  Bits(4 bits)
		val Y   = out Bits(4 bits)
	}
	
	val R1 = io.R1
	val R3 = io.R3
	
	io.Y(3) := R3(2) ^ R3(1) ^ R3(0) ^ (R3(3) & R3(0)) ^ (R1(3) & R3(0)) ^ (R3(3) & R1(0))
	io.Y(2) := R3(3) ^ (R3(1) & R3(0)) ^ (R1(1) & R3(0)) ^ (R3(1) & R1(0))
	io.Y(1) := R3(2) ^ R3(1) ^ (R3(3) & R3(0)) ^ (R1(3) & R3(0)) ^ (R3(3) & R1(0))
	io.Y(0) := R3(1) ^ (R3(2) & R3(0)) ^ (R1(2) & R3(0)) ^ (R3(2) & R1(0))
}

class F3 extends Component {
	val io = new Bundle {
		val R1  = in  Bits(4 bits)
		val R2	= in  Bits(4 bits)
		val Y 	= out Bits(4 bits)
	}
	
	val R1 = io.R1
	val R2 = io.R2
	
	io.Y(3) := R1(2) ^ R1(1) ^ R1(0) ^ (R1(3) & R1(0)) ^ (R1(3) & R2(0)) ^ (R2(3) & R1(0));
	io.Y(2) := R1(3) ^ (R1(1) & R1(0)) ^ (R1(1) & R2(0)) ^ (R2(1) & R1(0));
	io.Y(1) := R1(2) ^ R1(1) ^ (R1(3) & R1(0)) ^ (R1(3) & R2(0)) ^ (R2(3) & R1(0));
	io.Y(0) := R1(1) ^ (R1(2) & R1(0)) ^ (R1(2) & R2(0)) ^ (R2(2) & R1(0));
}

class MaskedG extends Component {
	val io = new Bundle {
		val in1 = in Bits (4 bits)
		val in2 = in Bits (4 bits)
		val in3 = in Bits (4 bits)
		val out1 = out Bits (4 bits)
		val out2 = out Bits (4 bits)
		val out3 = out Bits (4 bits)
	}

	val x1 = io.in1(3)
	val x2 = io.in2(3)
	val x3 = io.in3(3)
	val y1 = io.in1(2)
	val y2 = io.in2(2)
	val y3 = io.in3(2)
	val z1 = io.in1(1)
	val z2 = io.in2(1)
	val z3 = io.in3(1)
	val w1 = io.in1(0)
	val w2 = io.in2(0)
	val w3 = io.in3(0)
	

	
	
	val g13 = y2 ^ z2 ^ w2
	val g12 = True ^ y2 ^ z2
	val g11 = True ^ x2 ^ z2 ^ (y2 & w2) ^ (y2 & w3) ^ (y3 & w2) ^ (z2 & w2) ^ (z2 & w3) ^ (z3 & w2)
	val g10 = True ^ w2 ^ (x2&y2) ^ (x2&y3) ^ (x3&y2) ^ (x2&z2) ^ (x2&z3) ^ (x3&z2) ^ (y2&z2) ^ (y2&z3) ^ (y3&z2)
	val g23 = y3 ^ z3 ^ w3
	val g22 = y3 ^ z3
	val g21 = x3 ^ z3 ^ (y3&w3) ^ (y1&w3) ^ (y3&w1) ^ (z3&w3) ^ (z1&w3) ^ (z3&w1)
	val g20 = w3 ^ (x3&y3) ^ (x1&y3) ^ (x3&y1) ^ (x3&z3) ^ (x1&z3) ^ (x3&z1) ^ (y3&z3) ^ (y1&z3) ^ (y3&z1)
	val g33 = y1 ^ z1 ^ w1
	val g32 = y1 ^ z1
	val g31 = x1 ^ z1 ^ (y1&w1) ^ (y1&w2) ^ (y2&w1) ^ (z1&w1) ^ (z1&w2) ^ (z2&w1)
	val g30 = w1 ^ (x1&y1) ^ (x1&y2) ^ (x2&y1) ^ (x1&z1) ^ (x1&z2) ^ (x2&z1) ^ (y1&z1) ^ (y1&z2) ^ (y2&z1)
	
	io.out1(3) := g13
	io.out2(3) := g23
	io.out3(3) := g33
	io.out1(2) := g12
	io.out2(2) := g22
	io.out3(2) := g32
	io.out1(1) := g11
	io.out2(1) := g21
	io.out3(1) := g31
	io.out1(0) := g10
	io.out2(0) := g20
	io.out3(0) := g30
}

class MaskedF extends Component {
	val io = new Bundle {
		val in1 = in Bits (4 bits)
		val in2 = in Bits (4 bits)
		val in3 = in Bits (4 bits)
		val out1 = out Bits (4 bits)
		val out2 = out Bits (4 bits)
		val out3 = out Bits (4 bits)
	}
	val dummy = Reg(Bool())
	val x1 = io.in1(3)
	val x2 = io.in2(3)
	val x3 = io.in3(3)
	val y1 = io.in1(2)
	val y2 = io.in2(2)
	val y3 = io.in3(2)
	val z1 = io.in1(1)
	val z2 = io.in2(1)
	val z3 = io.in3(1)
	val w1 = io.in1(0)
	val w2 = io.in2(0)
	val w3 = io.in3(0)
	
	val f13 = y2 ^ z2 ^ w2 ^ (x2&w2) ^ (x2&w3) ^ (x3&w2)
	val f12 = x2 ^ (z2&w2) ^ (z2&w3) ^ (z3&w2)
	val f11 = y2 ^ z2 ^ (x2&w2) ^ (x2&w3) ^ (x3&w2)
	val f10 = z2 ^ (y2&w2) ^ (y2&w3) ^ (y3&w2)
	val f23 = y3 ^ z3 ^ w3 ^ (x3&w3) ^ (x1&w3) ^ (x3&w1)
	val f22 = x3 ^ (z3&w3) ^ (z1&w3) ^ (z3&w1)
	val f21 = y3 ^ z3 ^ (x3&w3) ^ (x1&w3) ^ (x3&w1)
	val f20 = z3 ^ (y3&w3) ^ (y1&w3) ^ (y3&w1)
	val f33 = y1 ^ z1 ^ w1 ^ (x1&w1) ^ (x1&w2) ^ (x2&w1)
	val f32 = x1 ^ (z1&w1) ^ (z1&w2) ^ (z2&w1)
	val f31 = y1 ^ z1 ^ (x1&w1) ^ (x1&w2) ^ (x2&w1)
	val f30 = z1 ^ (y1&w1) ^ (y1&w2) ^ (y2&w1)
	
	io.out1(3) := f13
	io.out2(3) := f23
	io.out3(3) := f33
	io.out1(2) := f12
	io.out2(2) := f22
	io.out3(2) := f32
	io.out1(1) := f11
	io.out2(1) := f21
	io.out3(1) := f31
	io.out1(0) := f10
	io.out2(0) := f20
	io.out3(0) := f30
}
