package AES.DOM

import AES.Plain._
import spinal.core._

class GFMul (gf: Int) extends Component {
	assert(List(4, 16).contains(gf))
	
	var n: Int = 0
	if (gf == 16) n = 4
	else n = 2
	
	val io = new Bundle {
		val x = in  Bits(n bits)
		val y = in  Bits(n bits)
		val z = out Bits(n bits)
	}
	
	val dummy = Reg(Bool())
	val a, b, c, d, e, f, g, h, p, q = Bits(n/2 bits)
	a := io.x(n-1 downto n/2)
	b := io.x(n/2-1 downto 0)
	c := io.y(n-1 downto n/2)
	d := io.y(n/2-1 downto 0)
	
	if (gf == 16) {
		val mul1, mul2, mul3 = new GFMul(4)
		val scale = new G4ScaleN
		
		mul1.io.x := a ^ b
		mul1.io.y := c ^ d
		e := mul1.io.z
		scale.io.t := e
		f := scale.io.x
		mul2.io.x := a
		mul2.io.y := c
		g := mul2.io.z
		mul3.io.x := b
		mul3.io.y := d
		h := mul3.io.z
	}
	else {
		e := (a^b) & (c^d)
		f := e
		g := a & c
		h := b & d
	}
	
	p := g ^ f
	q := h ^ f
	
	io.z := p ## q
}

class G256Inv2Shares5Stages extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(8 bits), 2)
		val m = in  Bits(38 bits)
		val z = out Vec(Bits(8 bits), 2)
	}
	
	val a, b, d, e, f, p, q = Vec(Bits(4 bits), 2)
	val a1, a2, a3, b1, b2, b3, c = Vec(Reg(Bits(4 bits)) init(0), 2)
	val mul1 = new G16Mul2SharesDepMul
	val mul2, mul3 = new G16Mul2SharesIndepMul
	val inv = new G16Inv2SharesDep
	
	for (i <- 0 until 2) {
		a(i) := io.x(i)(7 downto 4)
		b(i) := io.x(i)(3 downto 0)
		a1(i) := a(i)
		a2(i) := a1(i)
		a3(i) := a2(i)
		b1(i) := b(i)
		b2(i) := b1(i)
		b3(i) := b2(i)
	}
	
	for (i <- 0 until 2) {
		val sqSc = new G16SqSc
		sqSc.io.t := a(i) ^ b(i)
		c(i) := sqSc.io.x
	}
	
	mul1.io.x := a
	mul1.io.y := b
	mul1.io.m := io.m(37 downto 26)
	d := mul1.io.z
	
	//inv.io.x := c ^ d
	inv.io.x(1) := c(1) ^ d(1)
	inv.io.x(0) := c(0) ^ d(0)
	inv.io.m := io.m(25 downto 8)
	f := inv.io.z
	
	mul2.io.x := b3
	mul2.io.y := f
	mul2.io.m := io.m(7 downto 4)
	p := mul2.io.z
	
	mul3.io.x := a3
	mul3.io.y := f
	mul3.io.m := io.m(3 downto 0)
	q := mul3.io.z
	
	//io.z := p ## q
	io.z(1) := p(1) ## q(1)
	io.z(0) := p(0) ## q(0)
}

class G16Inv2SharesDep extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), 2)
		val m = in  Bits(18 bits)
		val z = out Vec(Bits(4 bits), 2)
	}
	
	val a, b, d, e, p, q = Vec(Bits(2 bits), 2)
	val c, a1, b1 = Vec(Reg(Bits(2 bits)) init(0), 2)
	val mul1, mul2, mul3 = new G4Mul2SharesDepMul
	
	for (i <- 0 until 2) {
		a(i) := io.x(i)(3 downto 2)
		b(i) := io.x(i)(1 downto 0)
		a1(i) := a(i)
		b1(i) := b(i)
		
		val square = new G4Sq
		val scale = new G4ScaleN
		square.io.t := a(i) ^ b(i)
		scale.io.t := square.io.x
		c(i) := scale.io.x
		
		val inv = new G4Sq
		inv.io.t := c(i) ^ d(i)
		e(i) := inv.io.x
	}
	
	mul1.io.x := a
	mul1.io.y := b
	mul1.io.m := io.m(17 downto 12)
	d := mul1.io.z
	
	mul2.io.x := b1
	mul2.io.y := e
	mul2.io.m := io.m(11 downto 6)
	p := mul2.io.z
	
	mul3.io.x := a1
	mul3.io.y := e
	mul3.io.m := io.m(5 downto 0)
	q := mul3.io.z
	
	//io.z := p ## q
	io.z(1) := p(1) ## q(1)
	io.z(0) := p(0) ## q(0)
}

/*class G16Mul2SharesDepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), 2)
		val y = in  Vec(Bits(4 bits), 2)
		val m = in  Bits(8 bits)
		val z = out Vec(Bits(4 bits), 2)
	}
	
	val xR, yR = Vec(Reg(Bits(4 bits)) init(0), 2)
	yR(0) := io.y(1) ^ io.m(7 downto 4)
	yR(1) := io.y(0) ^ io.m(7 downto 4)
	
	for (i <- 0 until 2) {
		val mul1, mul2, mul3 = new G16Mul
		mul1.io.a := io.x(i)
		mul1.io.b := io.m(7 downto 4)
		xR(i) := mul1.io.x ^ io.m(3 downto 0)
		
		mul2.io.a := io.x(i)
		mul2.io.b := io.y(i)
		
		mul3.io.a := io.x(i)
		mul3.io.b := yR(i)
		
		io.z(i) := mul2.io.x ^ mul3.io.x ^ xR(i)
	}
}*/

class G16Mul2SharesDepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), 2)
		val y = in  Vec(Bits(4 bits), 2)
		val m = in  Bits(12 bits)
		val z = out Vec(Bits(4 bits), 2)
	}
	
	val x, yz = Vec(Reg(Bits(4 bits)) init(0), 2)
	val z = Vec(Bits(4 bits), 2)
	val b = Bits(4 bits)
	
	for (i <- 0 until 2) {
		z(i) := io.m(7-4*i downto 4-4*i)
		x(i) := io.x(i)
		yz(i) := z(i) ^ io.y(i)
	}
	
	b := yz(0) ^ yz(1)
	
	val mul1, mul2 = new G16Mul
	mul1.io.a := x(0)
	mul1.io.b := b
	
	mul2.io.a := x(1)
	mul2.io.b := b
	
	val mul3 = new G16Mul2SharesIndepMul
	mul3.io.x := io.x
	mul3.io.y := z
	mul3.io.m := io.m(11 downto 8)
	
	io.z(0) := mul3.io.z(0) ^ mul1.io.x
	io.z(1) := mul3.io.z(1) ^ mul2.io.x
}

class G4Mul2SharesDepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), 2)
		val y = in  Vec(Bits(2 bits), 2)
		val m = in  Bits(6 bits)
		val z = out Vec(Bits(2 bits), 2)
	}
	
	val x, yz = Vec(Reg(Bits(2 bits)) init(0), 2)
	val z = Vec(Bits(2 bits), 2)
	val b = Bits(2 bits)
	
	for (i <- 0 until 2) {
		z(i) := io.m(3-2*i downto 2-2*i)
		x(i) := io.x(i)
		yz(i) := z(i) ^ io.y(i)
	}
	
	b := yz(0) ^ yz(1)
	
	val mul1, mul2 = new G4Mul
	mul1.io.a := x(0)
	mul1.io.b := b
	
	mul2.io.a := x(1)
	mul2.io.b := b
	
	val mul3 = new G4Mul2SharesIndepMul
	mul3.io.x := io.x
	mul3.io.y := z
	mul3.io.m := io.m(5 downto 4)
	
	io.z(0) := mul3.io.z(0) ^ mul1.io.x
	io.z(1) := mul3.io.z(1) ^ mul2.io.x
}

/*class G4Mul2SharesDepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), 2)
		val y = in  Vec(Bits(2 bits), 2)
		val m = in  Bits(4 bits)
		val z = out Vec(Bits(2 bits), 2)
	}
	
	val yRemasked, xRemasked, xy = Vec(Reg(Bits(2 bits)) init(0), 2)
	
	yRemasked(0) := io.y(1) ^ io.m(3 downto 2)
	yRemasked(1) := io.y(0) ^ io.m(3 downto 2)
	
	for (i <- 0 until 2) {
		val mul1, mul2, mul3 = new G4Mul
		mul1.io.a := io.x(i)
		mul1.io.b := io.m(3 downto 2)
		xRemasked(i) := mul1.io.x ^ io.m(1 downto 0)
		
		mul2.io.a := io.x(i)
		mul2.io.b := io.y(i)
		xy(i) := mul2.io.x
		
		mul3.io.a := yRemasked(i)
		mul3.io.b := io.x(i)
		
		io.z(i) := mul2.io.x ^ mul3.io.x ^ xRemasked(i)
	}
}*/

class G16Mul2SharesIndepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), 2)
		val y = in  Vec(Bits(4 bits), 2)
		val m = in  Bits(4 bits)
		val z = out Vec(Bits(4 bits), 2)
	}
	
	val mul1, mul2, mul3, mul4 = new G16Mul
	val r0, r1, r2, r3 = Reg(Bits(4 bits)) init(0)
	
	mul1.io.a := io.x(0)
	mul1.io.b := io.y(0)
	r0 := mul1.io.x
	
	mul2.io.a := io.x(0)
	mul2.io.b := io.y(1)
	r1 := mul2.io.x ^ io.m
	
	mul3.io.a := io.x(1)
	mul3.io.b := io.y(0)
	r2 := mul3.io.x ^ io.m
	
	mul4.io.a := io.x(1)
	mul4.io.b := io.y(1)
	r3 := mul4.io.x
	
	io.z(0) := r0 ^ r1
	io.z(1) := r2 ^ r3
}

class G4Mul2SharesIndepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), 2)
		val y = in  Vec(Bits(2 bits), 2)
		val m = in  Bits(2 bits)
		val z = out Vec(Bits(2 bits), 2)
	}
	
	val mul1, mul2, mul3, mul4 = new G4Mul
	val x0y0, x0y1, x1y0, x1y1 = Bits(2 bits)
	val r0, r1, r2, r3 = Reg(Bits(2 bits)) init(0)
	
	mul1.io.a := io.x(0)
	mul1.io.b := io.y(0)
	x0y0 := mul1.io.x
	
	mul2.io.a := io.x(0)
	mul2.io.b := io.y(1)
	x0y1 := mul2.io.x
	
	mul3.io.a := io.x(1)
	mul3.io.b := io.y(0)
	x1y0 := mul3.io.x
	
	mul4.io.a := io.x(1)
	mul4.io.b := io.y(1)
	x1y1 := mul4.io.x
	
	r0 := x0y0
	r1 := x0y1 ^ io.m
	r2 := x1y0 ^ io.m
	r3 := x1y1
	
	io.z(0) := r0 ^ r1
	io.z(1) := r2 ^ r3
}

/*class G4Mul2SharesIndepMul extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), 2)
		val y = in  Vec(Bits(2 bits), 2)
		val m = in  Bits(2 bits)
		val z = out Vec(Bits(2 bits), 2)
	}
	
	val mul1, mul2, mul3, mul4 = new G4Mul
	val x0y0, x0y1, x1y0, x1y1 = Bits(2 bits)
	val r0, r1, r2, r3 = Reg(Bits(2 bits)) init(0)

	mul1.io.a := io.x(0)
	mul1.io.b := io.y(0)
	x0y0 := mul1.io.x
	
	mul2.io.a := io.x(0)
	mul2.io.b := io.y(1)
	x0y1 := mul2.io.x
	
	mul3.io.a := io.x(1)
	mul3.io.b := io.y(0)
	x1y0 := mul3.io.x
	
	mul4.io.a := io.x(1)
	mul4.io.b := io.y(1)
	x1y1 := mul4.io.x
	
	r0 := x0y0
	r1 := x0y1 ^ io.m
	r2 := x1y0 ^ io.m
	r3 := x1y1
	
	io.z(0) := r0 ^ r1
	io.z(1) := r2 ^ r3
}*/