package AES.TI

import spinal.core._

/*
	3-shared TI inversion in GF(2^8)
 */

class G256InvTIMasked3 extends Component {
	val io = new Bundle {
		val t = in  Vec(Bits(8 bits), 3)
		val x = out Vec(Bits(8 bits), 3)
	}
	
	val dummy = Reg(Bool()) init(False)
	
	val a, b, c, d, e, f, p, q = Vec(Bits(4 bits), 3)
	
	for (i <- 0 until 3) {
		a(i) := io.t(i)(7 downto 4)
		b(i) := io.t(i)(3 downto 0)
	}
	
	for (i <- 0 until 3) {
		f(i) := a(i) ^ b(i)
	}
	
	for (i <- 0 until 3) {
		val sqSc = new G16SqSc
		sqSc.io.t := f(i)
		c(i) := sqSc.io.x
	}
	
	val mul1, mul2, mul3 = new G16MulTIMasked3
	mul1.io.x := a
	mul1.io.y := b
	d := mul1.io.z
	
	val inv = new G16InvTIMasked3
	for (i <- 0 until 3) {
		inv.io.t(i) := c(i)^d(i)
		e(i) := inv.io.x(i)
	}
	
	mul2.io.x := e
	mul2.io.y := b
	p := mul2.io.z
	
	mul3.io.x := e
	mul3.io.y := a
	q := mul3.io.z
	
	for (i <- 0 until 3) {
		io.x(i) := p(i) ## q(i)
	}
}


/*
	3-shared TI inversion in GF(2^4)
	Inputs:		t: Input
	Outputs:	x: Output
 */

class G16InvTIMasked3 extends Component {
	val io = new Bundle {
		val t = in  Vec(Bits(4 bits), 3)
		val x = out Vec(Bits(4 bits), 3)
	}
	
	val dummy = Reg(Bool()) init(False)
	val a, b, c, d, e, f, p, q = Vec(Bits(2 bits), 3)
	
	for (i <- 0 until 3) {
		a(i) := io.t(i)(3 downto 2)
		b(i) := io.t(i)(1 downto 0)
	}
	
	/* f = a^b */
	for (i <- 0 until 3) {
		f(i) := a(i) ^ b(i)
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	
	/* d = a*b, with 3-shared G4Mul */
	for (i <- 0 until 3) {
		mul1.io.x(i) := a(i)
		mul1.io.y(i) := b(i)
		d(i) := mul1.io.z(i)
	}
	
	/* c = nu*f^2 */
	for (i <- 0 until 3) {
		val square = new G4Sq
		val scale = new G4ScaleN
		square.io.t := f(i)
		scale.io.t := square.io.x
		c(i) := scale.io.x
	}
	
	/* e = (c^d)^-1 */
	for (i <- 0 until 3) {
		val inv = new G4Sq
		inv.io.t := c(i)^d(i)
		e(i) := inv.io.x
	}
	
	/* p = e*b, q = e*a */
	for (i <- 0 until 3) {
		mul2.io.x(i) := e(i)
		mul2.io.y(i) := b(i)
		p(i) := mul2.io.z(i)
		
		mul3.io.x(i) := e(i)
		mul3.io.y(i) := a(i)
		q(i) := mul3.io.z(i)
	}
	
	/* x = p||q */
	for (i <- 0 until 3) {
		io.x(i) := p(i) ## q(i)
	}
}


/*
	3-share TI masked implementation of the multiplication in GF(2^4)
	Inputs:		x: first 3-shared input
						y: second 3-shared input
	Outputs:	z: 3-shared result
 */

class G16MulTIMasked3 extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), 3)
		val y = in  Vec(Bits(4 bits), 3)
		val z = out Vec(Bits(4 bits), 3)
	}
	
	val dummy = Reg(Bool()) init(False)
	val a, b, c, d, e, f, g, h, p, q = Vec(Bits(2 bits), 3)
	
	for (i <- 0 until 3) {
		a(i) := io.x(i)(3 downto 2)
		b(i) := io.x(i)(1 downto 0)
		c(i) := io.y(i)(3 downto 2)
		d(i) := io.y(i)(1 downto 0)
	}
	
	val mul1, mul2, mul3 = new G4MulTIMasked3
	
	/* e = (a^b)*(c^d), done with the masked G4 multiplier */
	for (i <- 0 until 3) {
		mul1.io.x(i) := a(i)^b(i)
		mul1.io.y(i) := c(i)^d(i)
		e(i) := mul1.io.z(i)
	}
	
	/* Scale all 3 shares of e individually as the operation is linear */
	val scale0, scale1, scale2 = new G4ScaleN
	scale0.io.t := e(0)
	f(0) := scale0.io.x
	scale1.io.t := e(1)
	f(1) := scale1.io.x
	scale2.io.t := e(2)
	f(2) := scale2.io.x
	
	/* g = a*c */
	for (i <- 0 until 3) {
		mul2.io.x(i) := a(i)
		mul2.io.y(i) := c(i)
		g(i) := mul2.io.z(i)
	}
	
	/* h = b*d */
	for (i <- 0 until 3) {
		mul3.io.x(i) := b(i)
		mul3.io.y(i) := d(i)
		h(i) := mul3.io.z(i)
	}
	
	/* p = f^g, q = f^h */
	for (i <- 0 until 3) {
		p(i) := f(i) ^ g(i)
		q(i) := f(i) ^ h(i)
	}
	
	/* z = p||q */
	for (i <- 0 until 3) {
		io.z(i) := p(i) ## q(i)
	}
}

class G4MulTIMasked3 extends Component {
	val io = new Bundle {
		val x = in 	Vec(Bits(2 bits), 3)
		val y = in 	Vec(Bits(2 bits), 3)
		val z = out Vec(Bits(2 bits), 3)
	}
	
	val dummy = Reg(Bool()) init(False)
	val a1, a2, a3, b1, b2, b3, c1, c2, c3, d1, d2, d3, e1, e2, e3, f1, f2, f3 = Bool()
	val a1c1, a1c2, a1c3, a1d1, a1d2, a1d3 = Bool()
	val a2c1, a2c2, a2c3, a2d1, a2d2, a2d3 = Bool()
	val a3c1, a3c2, a3c3, a3d1, a3d2, a3d3 = Bool()
	val b1c1, b1c2, b1c3, b1d1, b1d2, b1d3 = Bool()
	val b2c1, b2c2, b2c3, b2d1, b2d2, b2d3 = Bool()
	val b3c1, b3c2, b3c3, b3d1, b3d2, b3d3 = Bool()
	
	val a, b, c, d = Vec(Bool(), 3)
	val ac, ad, bc, bd = Vec(Bool(), 9)
	
	for (i <- 0 until 3) {
		a(i) := io.x(i)(1)
		b(i) := io.x(i)(0)
		c(i) := io.y(i)(1)
		d(i) := io.y(i)(0)
	}
	
	for (i <- 0 until 3) {
		for (j <- 0 until 3) {
			ac(3*i+j) := a(i) & c(j)
			ad(3*i+j) := a(i) & d(j)
			bc(3*i+j) := b(i) & c(j)
			bd(3*i+j) := b(i) & d(j)
		}
	}
	
	a1 := io.x(0)(1)
	a2 := io.x(1)(1)
	a3 := io.x(2)(1)
	b1 := io.x(0)(0)
	b2 := io.x(1)(0)
	b3 := io.x(2)(0)
	c1 := io.y(0)(1)
	c2 := io.y(1)(1)
	c3 := io.y(2)(1)
	d1 := io.y(0)(0)
	d2 := io.y(1)(0)
	d3 := io.y(2)(0)
	
	a1c1 := a1 & c1
	a1c2 := a1 & c2
	a1c3 := a1 & c3
	a1d1 := a1 & d1
	a1d2 := a1 & d2
	a1d3 := a1 & d3
	
	a2c1 := a2 & c1
	a2c2 := a2 & c2
	a2c3 := a2 & c3
	a2d1 := a2 & d1
	a2d2 := a2 & d2
	a2d3 := a2 & d3
	
	a3c1 := a3 & c1
	a3c2 := a3 & c2
	a3c3 := a3 & c3
	a3d1 := a3 & d1
	a3d2 := a3 & d2
	a3d3 := a3 & d3
	
	b1c1 := b1 & c1
	b1c2 := b1 & c2
	b1c3 := b1 & c3
	b1d1 := b1 & d1
	b1d2 := b1 & d2
	b1d3 := b1 & d3
	
	b2c1 := b2 & c1
	b2c2 := b2 & c2
	b2c3 := b2 & c3
	b2d1 := b2 & d1
	b2d2 := b2 & d2
	b2d3 := b2 & d3
	
	b3c1 := b3 & c1
	b3c2 := b3 & c2
	b3c3 := b3 & c3
	b3d1 := b3 & d1
	b3d2 := b3 & d2
	b3d3 := b3 & d3
	
	e1 := ad(4) ^ ad(5) ^ ad(7) ^ bc(4) ^ bc(5) ^ bc(7) ^ bd(4) ^ bd(5) ^ bd(7) ^ a(2) ^ bc(4) ^ bc(8) ^ ac(4)
	e2 := ad(2) ^ ad(6) ^ ad(8) ^ bc(2) ^ bc(6) ^ bc(8) ^ bd(2) ^ bd(6) ^ bd(8) ^ a(0) ^ a(2) ^ d(0) ^ bc(0) ^ bc(8) ^ ad(0)
	e3 := ad(0) ^ ad(1) ^ ad(3) ^ bc(0) ^ bc(1) ^ bc(3) ^ bd(0) ^ bd(1) ^ bd(3) ^ a(0) ^ d(0) ^ bc(0) ^ bc(4) ^ ac(4) ^ ad(0)
	
	f1 := ac(4) ^ ac(5) ^ ac(7) ^ a2d2 ^ a2d3 ^ a3d2 ^ b2c2 ^ b2c3 ^ b3c2 ^ c(2) ^ d(2) ^ ac(4) ^ ac(8) ^ bd(4) ^ bd(8)
	f2 := ac(2) ^ ad(2) ^ ac(6) ^ ac(8) ^ ad(6) ^ ad(8) ^ bc(2) ^ bc(6) ^ bc(8) ^ c(2) ^ d(2) ^ ac(8) ^ bd(8) ^ bd(0)// ^ d1
	//I have no idea why, but if you replace a1d1 with the signal ad(0), the
	//simulation fails. Same for the others.
	f3 := ac(0) ^ ac(1) ^ a1d1 ^ a1d2 ^ ac(3) ^ a2d1 ^ b1c1 ^ b1c2 ^ b2c1 ^ a2c2 ^ b2d2 ^ b1d1// ^ d1
	
	io.z(0)(1) := e1
	io.z(1)(1) := e2
	io.z(2)(1) := e3
	io.z(0)(0) := f1
	io.z(1)(0) := f2
	io.z(2)(0) := f3
}

/* Squaring and scaling with N in GF(2^4) */

/*class G16SqSc extends Component {
	val io = new Bundle {
		val t = in Bits (4 bits)
		val x = out Bits (4 bits)
	}
	
	val a, b, c, p, q = Bits(2 bits)
	val square1, square2 = new G4Sq
	val scale = new G4ScaleN2
	
	square1.io.t := (a^b)
	p := square1.io.x
	
	square2.io.t := b
	c := square2.io.x
	
	scale.io.t := c
	q := scale.io.x
	
	a := io.t(3 downto 2)
	b := io.t(1 downto 0)
	
	io.x := p ## q
}*/

/* Squaring in GF(2^2) */

/*class G4Sq extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := io.t(0) ## io.t(1)
}*/

/* Scaling with N in GF(2^2) */

/*class G4ScaleN extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := (io.t(0) ## (io.t(1)^io.t(0)))
}*/

/* Scaling with N^2 in GF(2^2) */

/*class G4ScaleN2 extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := ((io.t(1)^io.t(0)) ## io.t(1))
}*/