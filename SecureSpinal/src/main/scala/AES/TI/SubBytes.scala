package AES.TI

import AES.MaskedCanright.NewBasis
import spinal.core._

class SBoxTI extends Component {
	val io = new Bundle {
		val SBoxIn	= in  Vec(Bits(8 bits), 3)
		val m				= in  Bits(48 bits)
		val SBoxOut	= out Vec(Bits(8 bits), 3)
	}
	
	val dummy = Reg(Bool()) init(False)
	
	val inv = new G256InvTIRegRemasked
	inv.io.m := io.m
	
	for (i <- 0 until 3) {
		val changeBase1 = new NewBasis
		changeBase1.io.input := io.SBoxIn(i)
		changeBase1.io.direction := False
		inv.io.t(i) := changeBase1.io.output
	}
	
	for (i <- 0 until 3) {
		val changeBase2 = new NewBasis
		changeBase2.io.input := inv.io.x(i)
		changeBase2.io.direction := True
		io.SBoxOut(i) := changeBase2.io.output ^ B"8'h63"
	}
}

/*
	Inversion in GF(2^8), masked with a TI
	Inputs:		t: 3-shared input
						m: new mask bits for the reshared registers
	Outputs:	x: 3-shared result of the inversion
 */

class G256InvTIRegRemasked extends Component {
	val io = new Bundle {
		val t = in  Vec(Bits(8 bits), 3)
		val m = in  Bits(48 bits)
		val x = out Vec(Bits(8 bits), 3)
	}
	
	val a, b, d, f, p, q = Vec(Bits(4 bits), 3)
	val a1, a2, a3, b1, b2, b3, c = Reg(Vec(Bits(4 bits), 3))
	val e = new RemaskedRegister(4)
	e.io.m(0) := io.m(7 downto 4)
	e.io.m(1) := io.m(3 downto 0)
	
	/* a and a1 (Reg) are the upper half of the input, b and b1 (Reg) are
	* the lower half
  */
	for (i <- 0 until 3) {
		a(i) := io.t(i)(7 downto 4)
		b(i) := io.t(i)(3 downto 0)
		a1(i) := a(i)
		b1(i) := b(i)
	}
	
	/* f = a^b */
	for (i <- 0 until 3) {
		f(i) := a(i) ^ b(i)
	}
	
	/* c = SquareScale(f) */
	for (i <- 0 until 3) {
		val sqSc = new G16SqSc
		sqSc.io.t := f(i)
		c(i) := sqSc.io.x
	}
	
	/* d = a*b */
	val mul1 = new G16MulTIRegRemask
	mul1.io.a := a
	mul1.io.b := b
	mul1.io.m := io.m(47 downto 36)
	d := mul1.io.c
	
	/* e = (c^d)^-1 */
	val inv = new G16InvTIRegRemasked
	inv.io.m := io.m(11 downto 8)
	for (i <- 0 until 3) {
		inv.io.a(i) := c(i) ^ d(i)
		e.io.a(i) := inv.io.b(i)
	}
	
	/* Propagate a and b through the register chain */
	a2 := a1
	a3 := a2
	b2 := b1
	b3 := b2
	
	/* q = a3*e */
	val mul2, mul3 = new G16MulTIRegRemask
	mul2.io.a := a3
	mul2.io.b := e.io.b
	mul2.io.m := io.m(35 downto 24)
	q := mul2.io.c
	
	/* p = b3*e */
	mul3.io.a := b3
	mul3.io.b := e.io.b
	mul3.io.m := io.m(23 downto 12)
	p := mul3.io.c
	
	/* x = p||q */
	for (i <- 0 until 3) {
		io.x(i) := p(i) ## q(i)
	}
}

class RemaskedRegister (n: Int) extends Component {
	val io = new Bundle {
		val a	= in  Vec(Bits(n bits), 3)
		val m = in  Vec(Bits(n bits), 2)
		val b = out Vec(Bits(n bits), 3)
	}
	
	val a = Reg(Vec(Bits(n bits), 3))
	val m = Reg(Bits(n bits))
	
	a(0) := io.a(0)
	a(1) := io.a(1) ^ io.m(0)
	a(2) := io.a(2) ^ io.m(1)
	m := io.m(0) ^ io.m(1)
	
	io.b(0) := a(0) ^ m
	io.b(1) := a(1)
	io.b(2) := a(2)
}

class G256InvTIRegNoRemask extends Component {
	val io = new Bundle {
		val t = in  Vec(Bits(8 bits), 3)
		val x = out Vec(Bits(8 bits), 3)
	}
	
	val a, b, d, f, p, q = Vec(Bits(4 bits), 3)
	val a1, a2, a3, b1, b2, b3, c, e = Reg(Vec(Bits(4 bits), 3))
	
	for (i <- 0 until 3) {
		a(i) := io.t(i)(7 downto 4)
		b(i) := io.t(i)(3 downto 0)
		a1(i) := a(i)
		b1(i) := b(i)
	}
	
	/* f = a^b */
	for (i <- 0 until 3) {
		f(i) := a(i) ^ b(i)
	}
	
	/* c = SquareScale(f) */
	for (i <- 0 until 3) {
		val sqSc = new G16SqSc
		sqSc.io.t := f(i)
		c(i) := sqSc.io.x
	}
	
	/* d = a*b */
	val mul1 = new G16MulTIReg
	mul1.io.a := a
	mul1.io.b := b
	d := mul1.io.c
	
	/* e = (c^d)^-1 */
	val inv = new G16InvTIReg
	for (i <- 0 until 3) {
		inv.io.a(i) := c(i) ^ d(i)
		e(i) := inv.io.b(i)
	}
	
	for (i <- 0 until 3) {
		a2(i) := a1(i)
		b2(i) := b1(i)
		a3(i) := a2(i)
		b3(i) := b2(i)
	}
	
	val mul2, mul3 = new G16MulTIReg
	mul2.io.a := a3
	mul2.io.b := e
	q := mul2.io.c
	
	mul3.io.a := b3
	mul3.io.b := e
	p := mul3.io.c
	
	for (i <- 0 until 3) {
		io.x(i) := p(i) ## q(i)
	}
}

class G16InvTIRegRemasked extends Component {
	val io = new Bundle {
		val a = in  Vec(Bits(4 bits), 3)
		val m = in  Bits(4 bits)
		val b = out Vec(Bits(4 bits), 3)
	}
	
	val a, b, f, e, p, q = Vec(Bits(2 bits), 3)
	val aReg, bReg, c = Reg(Vec(Bits(2 bits), 3))
	val d = new RemaskedRegister(2)
	d.io.m(0) := io.m(3 downto 2)
	d.io.m(1) := io.m(1 downto 0)
	
	for (i <- 0 until 3) {
		a(i) := io.a(i)(3 downto 2)
		aReg(i) := io.a(i)(3 downto 2)
		b(i) := io.a(i)(1 downto 0)
		bReg(i) := io.a(i)(1 downto 0)
	}
	
	for (i <- 0 until 3) {
		val scale = new G4ScaleN
		val sq = new G4Sq
		sq.io.t := a(i) ^ b(i)
		scale.io.t := sq.io.x
		c(i) := scale.io.x
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	mul1.io.x := a
	mul1.io.y := b
	d.io.a := mul1.io.z
	
	for (i <- 0 until 3) {
		val inv = new G4Sq
		inv.io.t := c(i) ^ d.io.b(i)
		e(i) := inv.io.x
	}
	
	mul2.io.x := bReg
	mul2.io.y := e
	p := mul2.io.z
	
	mul3.io.x := aReg
	mul3.io.y := e
	q := mul3.io.z
	
	for (i <- 0 until 3) {
		io.b(i) := p(i) ## q(i)
	}
}

class G16InvTIReg extends Component {
	val io = new Bundle {
		val a = in  Vec(Bits(4 bits), 3)
		val b = out Vec(Bits(4 bits), 3)
	}
	
	val a, b, f, e, p, q = Vec(Bits(2 bits), 3)
	val aReg, bReg, c, d = Reg(Vec(Bits(2 bits), 3))
	
	for (i <- 0 until 3) {
		a(i) := io.a(i)(3 downto 2)
		aReg(i) := io.a(i)(3 downto 2)
		b(i) := io.a(i)(1 downto 0)
		bReg(i) := io.a(i)(1 downto 0)
	}
	
	for (i <- 0 until 3) {
		val scale = new G4ScaleN
		val sq = new G4Sq
		sq.io.t := a(i) ^ b(i)
		scale.io.t := sq.io.x
		c(i) := scale.io.x
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	mul1.io.x := a
	mul1.io.y := b
	d := mul1.io.z

	for (i <- 0 until 3) {
		val inv = new G4Sq
		inv.io.t := c(i) ^ d(i)
		e(i) := inv.io.x
	}
	
	mul2.io.x := bReg
	mul2.io.y := e
	p := mul2.io.z
	
	mul3.io.x := aReg
	mul3.io.y := e
	q := mul3.io.z
	
	for (i <- 0 until 3) {
		io.b(i) := p(i) ## q(i)
	}
}

/*
	3-shared Multiplier in GF(2^4), using reshared registers after the 3
	GF(2^2) multiplicators
 */

class G16MulTIRegRemask extends Component {
	val io = new Bundle {
		val a = in  Vec(Bits(4 bits), 3)
		val b = in  Vec(Bits(4 bits), 3)
		val m = in  Bits(12 bits)
		val c = out Vec(Bits(4 bits), 3)
	}
	
	val a, b, c, d, f, p, q = Vec(Bits(2 bits), 3)
	val e, g, h = new RemaskedRegister(2)
	e.io.m(0) := io.m(11 downto 10)
	e.io.m(1) := io.m(9 downto 8)
	g.io.m(0) := io.m(7 downto 6)
	g.io.m(1) := io.m(5 downto 4)
	h.io.m(0) := io.m(3 downto 2)
	h.io.m(1) := io.m(1 downto 0)
	
	for (i <- 0 until 3) {
		a(i) := io.a(i)(3 downto 2)
		b(i) := io.a(i)(1 downto 0)
		c(i) := io.b(i)(3 downto 2)
		d(i) := io.b(i)(1 downto 0)
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	for (i <- 0 until 3) {
		mul1.io.x(i) := a(i) ^ b(i)
		mul1.io.y(i) := c(i) ^ d(i)
		e.io.a(i) := mul1.io.z(i)
		
		mul2.io.x(i) := a(i)
		mul2.io.y(i) := c(i)
		g.io.a(i) := mul2.io.z(i)
		
		mul3.io.x(i) := b(i)
		mul3.io.y(i) := d(i)
		h.io.a(i) := mul3.io.z(i)
	}
	
	for (i <- 0 until 3) {
		val scale = new G4ScaleN
		scale.io.t := e.io.b(i)
		f(i) := scale.io.x
	}
	
	for (i <- 0 until 3) {
		p(i) := g.io.b(i) ^ f(i)
		q(i) := h.io.b(i) ^ f(i)
		io.c(i) := p(i) ## q(i)
	}
}

class G16MulTIReg extends Component {
	val io = new Bundle {
		val a = in  Vec(Bits(4 bits), 3)
		val b = in  Vec(Bits(4 bits), 3)
		val c = out Vec(Bits(4 bits), 3)
	}
	
	val a, b, c, d, f, p, q = Vec(Bits(2 bits), 3)
	val e, g, h = Reg(Vec(Bits(2 bits), 3))
	
	for (i <- 0 until 3) {
		a(i) := io.a(i)(3 downto 2)
		b(i) := io.a(i)(1 downto 0)
		c(i) := io.b(i)(3 downto 2)
		d(i) := io.b(i)(1 downto 0)
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	for (i <- 0 until 3) {
		mul1.io.x(i) := a(i) ^ b(i)
		mul1.io.y(i) := c(i) ^ d(i)
		e(i) := mul1.io.z(i)
		
		mul2.io.x(i) := a(i)
		mul2.io.y(i) := c(i)
		g(i) := mul2.io.z(i)
		
		mul3.io.x(i) := b(i)
		mul3.io.y(i) := d(i)
		h(i) := mul3.io.z(i)
	}
	
	for (i <- 0 until 3) {
		val scale = new G4ScaleN
		scale.io.t := e(i)
		f(i) := scale.io.x
	}
	
	for (i <- 0 until 3) {
		p(i) := g(i) ^ f(i)
		q(i) := h(i) ^ f(i)
		io.c(i) := p(i) ## q(i)
	}
}
