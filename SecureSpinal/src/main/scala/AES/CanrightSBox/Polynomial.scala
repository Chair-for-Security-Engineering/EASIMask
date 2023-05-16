package AES.CanrightSBox

import spinal.core._

class G256InvMasked extends Component {
	val io = new Bundle {
		val A 		= in  Bits(8 bits)
		val M 		= in  Bits(8 bits)
		val S 		= in  Bits(8 bits)
		val T 		= in  Bits(4 bits)
		val AInv 	= out Bits(8 bits)
	}
	
	val dummy = Reg(Bool()) init(False)
	val A1A0, A1, A0, M2, M1, M0, B, BInv, A1M0, A0M1, M1M0, C = Bits(4 bits)
	val S1, S0, A0B, A1B, A0T, A1T, M0B, M1B, M0T, M1T, A1Inv, A0Inv = Bits(4 bits)
	
	A1 := io.A(7 downto 4)
	A0 := io.A(3 downto 0)
	M1 := io.M(7 downto 4)
	M0 := io.M(3 downto 0)
	S1 := io.S(7 downto 4)
	S0 := io.S(3 downto 0)
	
	/* A1A0 = A1*A0 */
	val mul1 = new G16Mul
	mul1.io.a := A1
	mul1.io.b := A0
	A1A0 := mul1.io.x
	
	/* A1M0 = A1*M0 */
	val mul2 = new G16Mul
	mul2.io.a := A1
	mul2.io.b := M0
	A1M0 := mul2.io.x
	
	/* A0M1 = A0*M1 */
	val mul3 = new G16Mul
	mul3.io.a := A0
	mul3.io.b := M1
	A0M1 := mul3.io.x
	
	/* M1M0 = M1*M0 */
	val mul4 = new G16Mul
	mul4.io.a := M1
	mul4.io.b := M0
	M1M0 := mul4.io.x
	
	/* C = N*(A1+A0)^2 */
	val scale1 = new G16SqSc
	scale1.io.t := (A1^A0)
	C := scale1.io.x
	
	/* M2 = N*(M1+M0)^2 */
	val scale2 = new G16SqSc
	scale2.io.t := (M1^M0)
	M2 := scale2.io.x
	
	B := C ^ A1A0 ^ A1M0 ^ A0M1 ^ M1M0
	
	/* BInv = B^(-1) */
	val inv = new G16InvMasked
	inv.io.B := B
	inv.io.M := M2
	inv.io.T := io.T
	BInv := inv.io.BInv
	
	/* A0B = A0*BInv */
	val mul5 = new G16Mul
	mul5.io.a := A0
	mul5.io.b := BInv
	A0B := mul5.io.x
	
	/* A0T = A0*T */
	val mul6 = new G16Mul
	mul6.io.a := A0
	mul6.io.b := io.T
	A0T := mul6.io.x
	
	/* M0B = M0*BInv */
	val mul7 = new G16Mul
	mul7.io.a := M0
	mul7.io.b := BInv
	M0B := mul7.io.x
	
	/* M0T = M0*T */
	val mul8 = new G16Mul
	mul8.io.a := M0
	mul8.io.b := io.T
	M0T := mul8.io.x
	
	/* A1B = A1*BInv */
	val mul9 = new G16Mul
	mul9.io.a := A1
	mul9.io.b := BInv
	A1B := mul9.io.x
	
	/* A1T = A1*T */
	val mul10 = new G16Mul
	mul10.io.a := A1
	mul10.io.b := io.T
	A1T := mul10.io.x
	
	/* M1B = M1*BInv */
	val mul11 = new G16Mul
	mul11.io.a := M1
	mul11.io.b := BInv
	M1B := mul11.io.x
	
	/* M1T = M1*T */
	val mul12 = new G16Mul
	mul12.io.a := M1
	mul12.io.b := io.T
	M1T := mul12.io.x
	
	A1Inv := S1 ^ A0B ^ A0T ^ M0B ^ M0T
	A0Inv := S0 ^ A1B ^ A1T ^ M1B ^ M1T
	
	io.AInv := A1Inv ## A0Inv
}

class G16InvMasked extends Component {
	val io = new Bundle {
		val B 		= in  Bits(4 bits)
		val M 		= in  Bits(4 bits)
		val T 		= in  Bits(4 bits)
		val BInv 	= out Bits(4 bits)
	}
	
	val b1, b0, b1Inv, b0Inv, m2, m1, m0, c, d, b1b0, b1m0, b0m1, m1m0 = Bits(2 bits)
	val cInv, t1, t0, b0c, b0m2, m0c, m0m2, b1c, b1m2, m1c, m1m2 = Bits(2 bits)
	
	b1 := io.B(3 downto 2)
	b0 := io.B(1 downto 0)
	m1 := io.M(3 downto 2)
	m0 := io.M(1 downto 0)
	t1 := io.T(3 downto 2)
	t0 := io.T(1 downto 0)
	
	/* d = n*(b1+b0)^2 */
	val square = new G4Sq
	val scale1 = new G4ScaleN
	square.io.t := (b1^b0)
	scale1.io.t := square.io.x
	d := scale1.io.x
	
	/* b1b0 = b1*b0*/
	val mul1 = new G4Mul
	mul1.io.a := b1
	mul1.io.b := b0
	b1b0 := mul1.io.x
	
	/* b1m0 = b1*m0 */
	val mul2 = new G4Mul
	mul2.io.a := b1
	mul2.io.b := m0
	b1m0 := mul2.io.x
	
	/* b0m1 = b0*m1 */
	val mul3 = new G4Mul
	mul3.io.a := b0
	mul3.io.b := m1
	b0m1 := mul3.io.x
	
	/* m1m0 = m1*m0 */
	val mul4 = new G4Mul
	mul4.io.a := m1
	mul4.io.b := m0
	m1m0 := mul4.io.x
	
	c := d ^ b1b0 ^ b1m0 ^ b0m1 ^ m1m0
	
	/* cInv = c^(-1) */
	val inv = new G4Sq
	inv.io.t := c
	cInv := inv.io.x
	
	/* m2 = n^2*(m1+m0) */
	val scale2 = new G4ScaleN2
	scale2.io.t := (m1^m0)
	m2 := scale2.io.x
	
	/* b0c = b0*cInv */
	val mul5 = new G4Mul
	mul5.io.a := b0
	mul5.io.b := cInv
	b0c := mul5.io.x
	
	/* b0m2 = b0*m2 */
	val mul6 = new G4Mul
	mul6.io.a := b0
	mul6.io.b := m2
	b0m2 := mul6.io.x
	
	/* m0c = m0*cInv */
	val mul7 = new G4Mul
	mul7.io.a := m0
	mul7.io.b := cInv
	m0c := mul7.io.x
	
	/* m0m2 = m0*m2 */
	val mul8 = new G4Mul
	mul8.io.a := m0
	mul8.io.b := m2
	m0m2 := mul8.io.x
	
	/* b1c = b1*cInv */
	val mul9 = new G4Mul
	mul9.io.a := b1
	mul9.io.b := cInv
	b1c := mul9.io.x
	
	/* b1m2 = b1*m2 */
	val mul10 = new G4Mul
	mul10.io.a := b1
	mul10.io.b := m2
	b1m2 := mul10.io.x
	
	/* m1c = m1*cInv */
	val mul11 = new G4Mul
	mul11.io.a := m1
	mul11.io.b := cInv
	m1c := mul11.io.x
	
	/* m1m2 = m1*m2 */
	val mul12 = new G4Mul
	mul12.io.a := m1
	mul12.io.b := m2
	m1m2 := mul12.io.x
	
	b1Inv := t1 ^ b0c ^ b0m2 ^ m0c ^ m0m2
	b0Inv := t0 ^ b1c ^ b1m2 ^ m1c ^ m1m2
	
	io.BInv := b1Inv ## b0Inv
}

class G256InvMaskedOptimized extends Component {
	val io = new Bundle {
		val A 		= in  Bits(8 bits)
		val M 		= in  Bits(8 bits)
		val S 		= in  Bits(8 bits)
		val AInv 	= out Bits(8 bits)
	}
	
	val dummy = Reg(Bool()) init(False)
	val A1A0, A1, A0, M2, M1, M0, B, BInv, B2Inv, A1M0, A0M1, M1M0, M0XorM1, C = Bits(4 bits)
	val S1, S0, A0B, A1B, M0B, M1B, A1Inv, A0Inv = Bits(4 bits)
	
	A1 := io.A(7 downto 4)
	A0 := io.A(3 downto 0)
	M1 := io.M(7 downto 4)
	M0 := io.M(3 downto 0)
	S1 := io.S(7 downto 4)
	S0 := io.S(3 downto 0)
	
	def mul(a: Bits, b: Bits, x: Bits, module: G16Mul): Unit = {
		module.io.a := a
		module.io.b := b
		x := module.io.x
	}
	
	val mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8 = new G16Mul
	
	/* A1A0 = A1*A0 */
	mul(A1, A0, A1A0, mul1)
	
	/* A1M0 = A1*M0 */
	mul(A1, M0, A1M0, mul2)
	
	/* A0M1 = A0*M1 */
	mul(A0, M1, A0M1, mul3)
	
	/* M1M0 = M1*M0 */
	mul(M1, M0, M1M0, mul4)
	
	/* C = N*(A1+A0)^2 */
	val scale1 = new G16SqSc
	scale1.io.t := (A1^A0)
	C := scale1.io.x
	
	/* M2 = N*(M1+M0)^2 */
	val scale2 = new G16SqSc
	scale2.io.t := (M1^M0)
	M2 := scale2.io.x
	
	B := C ^ A1A0 ^ A1M0 ^ A0M1 ^ M1M0
	
	/* BInv = B^(-1) */
	val inv = new G16InvMaskedOptimized
	inv.io.B := B
	inv.io.M := M2
	inv.io.M1 := M1
	BInv := inv.io.BInv
	
	/* A0B = A0*BInv */
	mul(A0, BInv, A0B, mul5)
	
	/* M0B = M0*BInv */
	mul(M0, BInv, M0B, mul6)
	
	/* A1B = A1*B2Inv */
	mul(A1, B2Inv, A1B, mul7)
	
	/* M1B = M1*B2Inv */
	mul(M1, B2Inv, M1B, mul8)
	
	M0XorM1 := M0 ^ M1
	B2Inv := BInv ^ M0XorM1
	
	A1Inv := S1 ^ A0B ^ A0M1 ^ M0B ^ M1M0
	A0Inv := S0 ^ A1B ^ A1M0 ^ M1B ^ M1M0
	
	io.AInv := A1Inv ## A0Inv
}

class G16InvMaskedOptimized extends Component {
	val io = new Bundle {
		val B 		= in  Bits(4 bits)
		val M 		= in  Bits(4 bits)
		val M1		= in  Bits(4 bits)
		val BInv 	= out Bits(4 bits)
	}
	
	def mul(a: Bits, b: Bits, x: Bits, module: G4Mul): Unit = {
		module.io.a := a
		module.io.b := b
		x := module.io.x
	}
	
	val b1, b0, b1Inv, b0Inv, m2, m1, m0, c, d, b1b0, b1m0, b0m1, m1m0 = Bits(2 bits)
	val cInv, c2Inv, b0c, b0m2, m0c, m0m2, b1c, b1m2, m1c, m1m2 = Bits(2 bits)
	val m1Xorm2, m0Xorm1 = Bits(2 bits)
	
	val mul1, mul2, mul3, mul4, mul5, mul6, mul7, mul8 = new G4Mul
	
	b1 := io.B(3 downto 2)
	b0 := io.B(1 downto 0)
	m1 := io.M(3 downto 2)
	m0 := io.M(1 downto 0)
	
	/* d = n*(b1+b0)^2 */
	val square = new G4Sq
	val scale1 = new G4ScaleN
	square.io.t := (b1^b0)
	scale1.io.t := square.io.x
	d := scale1.io.x
	
	/* b1b0 = b1*b0*/
	mul(b1, b0, b1b0, mul1)
	
	/* b1m0 = b1*m0 */
	mul(b1, m0, b1m0, mul2)
	
	/* b0m1 = b0*m1 */
	mul(b0, m1, b0m1, mul3)
	
	/* m1m0 = m1*m0 */
	mul(m1, m0, m1m0, mul4)
	
	c := d ^ b1b0 ^ b1m0 ^ b0m1 ^ m1m0
	m1Xorm2 := m1 ^ m2
	m0Xorm1 := m0 ^ m1
	
	/* cInv = c^(-1) */
	val inv = new G4Sq
	inv.io.t := c
	cInv := inv.io.x ^ m1Xorm2
	
	/* m2 = n^2*(m1+m0) */
	val scale2 = new G4ScaleN2
	scale2.io.t := (m0Xorm1)
	m2 := scale2.io.x
	
	c2Inv := cInv ^ m0Xorm1
	
	/* b0c = b0*cInv */
	mul(b0, cInv, b0c, mul5)
	
	/* m0c = m0*cInv */
	mul(m0, cInv, m0c, mul6)
	
	/* b1c = b1*c2Inv */
	mul(b1, c2Inv, b1c, mul7)
	
	/* m1c = m1*c2Inv */
	mul(m1, c2Inv, m1c, mul8)
	
	b1Inv := io.M1(3 downto 2) ^ b0c ^ b0m1 ^ m0c ^ m1m0
	b0Inv := io.M1(1 downto 0) ^ b1c ^ b1m0 ^ m1c ^ m1m0
	
	io.BInv := b1Inv ## b0Inv
}

class G256Inv extends Component {
	val io = new Bundle {
		val t	= in  Bits(8 bits)
		val x = out Bits(8 bits)
	}
	
	val a, b, c, d, e, p, q = Bits(4 bits)
	val sqSc = new G16SqSc
	val mul1, mul2, mul3 = new G16Mul
	val inv = new G16Inv
	
	sqSc.io.t := (a^b)
	c := sqSc.io.x
	
	mul1.io.a := a
	mul1.io.b := b
	d := mul1.io.x
	
	inv.io.t := (c^d)
	e := inv.io.x
	
	mul2.io.a := e
	mul2.io.b := b
	p := mul2.io.x
	
	mul3.io.a := e
	mul3.io.b := a
	q := mul3.io.x
	
	a := io.t(7 downto 4)
	b := io.t(3 downto 0)
	
	io.x := p ## q
}

class G16Mul extends Component {
	val io = new Bundle {
		val a = in  Bits(4 bits)
		val b = in  Bits(4 bits)
		val x = out Bits(4 bits)
	}
	
	val a, b, c, d, e, f, p, q = Bits(2 bits)
	val mul1, mul2, mul3 = new G4Mul
	val scale = new G4ScaleN
	mul1.io.a := (a^b)
	mul1.io.b := (c^d)
	e := mul1.io.x
	
	scale.io.t := e
	f := scale.io.x
	
	mul2.io.a := a
	mul2.io.b := c
	p := mul2.io.x ^ f
	
	mul3.io.a := b
	mul3.io.b := d
	q := mul3.io.x ^ f
	
	a := io.a(3 downto 2)
	b := io.a(1 downto 0)
	c := io.b(3 downto 2)
	d := io.b(1 downto 0)
	
	io.x := p ## q
}

class G16Inv extends Component {
	val io = new Bundle {
		val t = in  Bits(4 bits)
		val x = out Bits(4 bits)
	}
	
	val a, b, c, d, e, p, q, x = Bits(2 bits)
	val scale = new G4ScaleN
	val square1, square2 = new G4Sq
	val mul1, mul2, mul3 = new G4Mul
	
	square1.io.t := (a^b)
	
	scale.io.t := square1.io.x
	c := scale.io.x
	
	mul1.io.a := a
	mul1.io.b := b
	d := mul1.io.x
	
	square2.io.t := (c^d)
	e := square2.io.x
	
	mul2.io.a := e
	mul2.io.b := b
	p := mul2.io.x
	
	mul3.io.a := e
	mul3.io.b := a
	q := mul3.io.x
	
	a := io.t(3 downto 2)
	b := io.t(1 downto 0)
	
	io.x := p ## q
}

class G16SqSc extends Component {
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
}

class G4Sq extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := io.t(0) ## io.t(1)
}

class G4ScaleN extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := (io.t(0) ## (io.t(1)^io.t(0)))
}

class G4ScaleN2 extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := ((io.t(1)^io.t(0)) ## io.t(1))
}

class G4Mul extends Component {
	val io = new Bundle {
		val a = in  Bits(2 bits)
		val b = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	val a, b, c, d, e, p, q = Bits(1 bits)
	a := io.a(1).asBits
	b := io.a(0).asBits
	c := io.b(1).asBits
	d := io.b(0).asBits
	
	e := (a^b) & (c^d)
	p := (a&c)^e
	q := (b&d)^e
	
	io.x := p ## q
}