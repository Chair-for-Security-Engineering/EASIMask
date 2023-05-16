package AES.TI

import spinal.core._
import util.control.Breaks._


/**
	* Inversion in GF(&#94;8), masked with a Threshold Implementation.
	* The security order can be specified.
	* @param order The desired security order
	* @param x The value to be inverted
	* @return z: The result of the inversion
	*
	*/
class G256InvTIMaskedN (order: Int) extends Component {
	
	val n: Int = 2*order+1
	
	val io = new Bundle {
		val x = in  Vec(Bits(8 bits), n)
		val z = out Vec(Bits(8 bits), n)
	}
	
	val dummy = Reg(Bool()) init(False) //Only for simulation with timing
	
	val a, b, c, d, e, f, p, q = Vec(Bits(4 bits), n)
	val mul1, mul2, mul3 = new G16MulTIMaskedN(order)
	val inv = new G16InvTIMaskedN(order)
	
	for (i <- 0 until n) {
		a(i) := io.x(i)(7 downto 4)
		b(i) := io.x(i)(3 downto 0)
	}
	
	//f := a ^ b
	for (i <- 0 until n) {
		f(i) := a(i) ^ b(i)
		inv.io.x(i) := c(i) ^ d(i)
		io.z(i) := p(i) ## q(i)
	}
	
	/* c = Scale(f^2) */
	for (i <- 0 until n) {
		val sqSc = new G16SqSc
		sqSc.io.t := f(i)
		c(i) := sqSc.io.x
	}
	
	/* d = a*b */
	mul1.io.x := a
	mul1.io.y := b
	d := mul1.io.z
	
	/* e = (c^d)^(-1) */
	//inv.io.x := c ^ d
	e := inv.io.z
	
	/* p = e*b, q = e*a */
	mul2.io.x := e
	mul2.io.y := b
	p := mul2.io.z
	
	mul3.io.x := e
	mul3.io.y := a
	q := mul3.io.z
	
	//io.z := p ## q
}

/**
	* Inversion in GF(2&#94;4), masked with a Threshold Implementation.
	* The security order can be specified on the input.
	* @param order The desired security order
	* @param x The value to be inverted
	* @return z: Result of the inversion
	*
	*/
class G16InvTIMaskedN (order: Int) extends Component {
	
	val n: Int = 2*order+1
	
	val io = new Bundle {
		val x = in  Vec(Bits(4 bits), n)
		val z = out Vec(Bits(4 bits), n)
	}
	
	val dummy = Reg(Bool()) init(False) //Only for simulation with timing
	
	val a, b, c, d, e, f, p, q = Vec(Bits(2 bits), n)
	val mul1, mul2, mul3 = new G4MulTIMaskedN(order)
	
	for (i <- 0 until n) {
		a(i) := io.x(i)(3 downto 2)
		b(i) := io.x(i)(1 downto 0)
	}
	
	//f := a ^ b
	for (i <- 0 until n) {
		f(i) := a(i) ^ b(i)
		io.z(i) := p(i) ## q(i)
	}
	
	/* d = a*b */
	mul1.io.x := a
	mul1.io.y := b
	d := mul1.io.z
	
	/* c = Scale(f^2) */
	for (i <- 0 until n) {
		val square = new G4Sq
		val scale = new G4ScaleN
		square.io.t := f(i)
		scale.io.t := square.io.x
		c(i) := scale.io.x
	}
	
	/* e = (c^d)^(-1) */
	for (i <- 0 until n) {
		val inv = new G4Sq
		inv.io.t := c(i)^d(i)
		e(i) := inv.io.x
	}
	
	/* p = e*b, q = e*a */
	mul2.io.x := e
	mul2.io.y := b
	p := mul2.io.z
	
	mul3.io.x := e
	mul3.io.y := a
	q := mul3.io.z
	
	//io.z := p ## q
}

/**
	* Multiplication in GF(2&#94;4), masked with a Threshold Implementation.
	* The security order can be specified as an input
	* @param order The desired security order
	* @param x First multiplication input
	* @param y Second multiplication input
	* @return z: Result of the multiplication
	*/

class G16MulTIMaskedN (order: Int) extends Component {
	
	val n: Int = 2*order+1
	
	val io = new Bundle {
		val x = in	Vec(Bits(4 bits), n)
		val y = in  Vec(Bits(4 bits), n)
		val z = out Vec(Bits(4 bits), n)
	}
	
	val dummy = Reg(Bool()) init(False) //Only for simulation with timing
	val a, b, c, d, e, f, g, h, p, q = Vec(Bits(2 bits), n)
	
	for (i <- 0 until n) {
		a(i) := io.x(i)(3 downto 2)
		b(i) := io.x(i)(1 downto 0)
		c(i) := io.y(i)(3 downto 2)
		d(i) := io.y(i)(1 downto 0)
	}
	
	val mul1, mul2, mul3 = new G4MulTIMaskedN(order)
	
	/* e = (a^b)*(c^d) */
	//mul1.io.x := a ^ b
	//mul1.io.y := c ^ d
	for (i <- 0 until n) {
		mul1.io.x(i) := a(i) ^ b(i)
		mul1.io.y(i) := c(i) ^ d(i)
		p(i) := f(i) ^ g(i)
		q(i) := f(i) ^ h(i)
		io.z(i) := p(i) ## q(i)
	}
	e := mul1.io.z
	
	/* f = Scale(e) */
	for (i <- 0 until n) {
		val scale = new G4ScaleN
		scale.io.t := e(i)
		f(i) := scale.io.x
	}
	
	/* g = a*c */
	mul2.io.x := a
	mul2.io.y := c
	g := mul2.io.z
	
	/* h = b*d */
	mul3.io.x := b
	mul3.io.y := d
	h := mul3.io.z
	
	//p := f ^ g
	//q := f ^ h
	
	//io.z := p ## q
}

/**
	* Multiplication in GF(2&#94;2), masked with a Threshold Implementation.
	* The security order of the design can be specified in the input.
	* @param order Desired security order
	* @param x First 2-bit input
	* @param y Second 2-bit input
	* @return z: Result of the multiplication
	*
	* @todo Ensure uniformity
	*/
class G4MulTIMaskedN(order: Int) extends Component {
	
	val n: Int = 2*order+1
	
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), n)
		val y = in  Vec(Bits(2 bits), n)
		val z = out Vec(Bits(2 bits), n)
	}
	
	val dummy = Reg(Bool()) init(False) //Only for simulation
	
	val a, b, c, d = Vec(Bool(), n)
	val e, f = Vec(Bits(n bits), n)
	val ac, ad, bc, bd = Vec(Bool(), n*n)
	
	/* a and c are the left bits of x/y, b and d the right ones */
	for (i <- 0 until n) {
		a(i) := io.x(i)(1)
		b(i) := io.x(i)(0)
		c(i) := io.y(i)(1)
		d(i) := io.y(i)(0)
	}
	
	/* All the AND combinations between a/b and c/d. ac(0) = a(0) & c(0), ac(1) = a(0) & c(1), ac(5) = a(1) & c(0) etc. */
	for (i <- 0 until n) {
		for (j <- 0 until n) {
			ac(n*i+j) := a(i) & c(j)
			ad(n*i+j) := a(i) & d(j)
			bc(n*i+j) := b(i) & c(j)
			bd(n*i+j) := b(i) & d(j)
		}
	}
	
	var ind: Int = 0
	var taken = Array.ofDim[Boolean](n, n)
	var indices = Array.ofDim[Int](n)
	
	for (i <- 0 until n) {
		indices(i) = 1
	}
	
	/**
		* Quite ugly way to distribute the intermediate values to e and f, ensuring 1) Correctness and 2) Non-completeness
		* First, distribute values with i=j: (i,j) = (1,1) -> 0, (2,2) -> 1, ...m (0,0) -> 4, and set the according value in the
		* array taken to true
		*/
	for (i <- 0 until n) {
		for (j <- 0 until n) {
			if (i == j) {
				if (i != 0) {
					ind = i - 1
				}
				else {
					ind = i + n - 1
				}
				taken(i)(j) = true
				e(0)(ind) := bc(n*i+j) ^ ad(n*i+j) ^ bd(n*i+j)
				f(0)(ind) := bc(n*i+j) ^ ad(n*i+j) ^ ac(n*i+j)
			}
		}
	}
	
	/**
		* Second, distribute the remaining values. Choose the earliest available and possible,
		* then go to the next group of 5 (increment i)
		*/
	for (k <- 0 until n) {
		for (i <- 0 until n) {
			breakable {
				for (j <- 0 until n) {
					if ((k != i) && (k != j) && !taken(i)(j)) {
						taken(i)(j) = true
						e(indices(k))(k) := e(indices(k)-1)(k) ^ bc(n*i+j) ^ ad(n*i+j) ^ bd(n*i+j)
						f(indices(k))(k) := f(indices(k)-1)(k) ^ bc(n*i+j) ^ ad(n*i+j) ^ ac(n*i+j)
						indices(k) = indices(k) + 1
						break
					}
				}
			}
		}
	}
	
	/* Set the output as the concatenation of e and f */
	for (i <- 0 until n) {
		io.z(i) := e(n-1)(i) ## f(n-1)(i)
	}
}

/**
	* A 5-shared multiplication in GF(2&#94;2)
	* @param x The first 5-shared factor
	* @param y The second 5-shared factor
	* @return z, the 5-shared result of the multiplication
	*/

class G4MulTIMasked5 extends Component {
	val io = new Bundle {
		val x = in  Vec(Bits(2 bits), 5)
		val y = in  Vec(Bits(2 bits), 5)
		val z = out Vec(Bits(2 bits), 5)
	}
	
	val dummy = Reg(Bool()) init(False)
	val a, b, c, d, e, f = Vec(Bool(), size = 5)
	val ac, ad, bc, bd = Vec(Bool(), size = 25)
	
	for (i <- 0 until 5) {
		a(i) := io.x(i)(1)
		b(i) := io.x(i)(0)
		c(i) := io.y(i)(1)
		d(i) := io.y(i)(0)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			ac(5*i+j) := a(i) & c(j)
			ad(5*i+j) := a(i) & d(j)
			bc(5*i+j) := b(i) & c(j)
			bd(5*i+j) := b(i) & d(j)
		}
	}
	
	e(0) := bc( 6) ^ ad( 6) ^ bd( 6) ^ bc( 7) ^ ad( 7) ^ bd( 7) ^ bc(11) ^ ad(11) ^ bd(11) ^
	 bc(16) ^ ad(16) ^ bd(16) ^ bc(21) ^ ad(21) ^ bd(21)
	e(1) := bc( 2) ^ ad(2 ) ^ bd( 2) ^ bc(10) ^ ad(10) ^ bd(10) ^ bc(12) ^ ad(12) ^ bd(12) ^
	 bc(15) ^ ad(15) ^ bd(15) ^ bc(20) ^ ad(20) ^ bd(20)
	e(2) := bc( 1) ^ ad( 1) ^ bd( 1) ^ bc( 5) ^ ad(5 ) ^ bd( 5) ^ bc(18) ^ ad(18) ^ bd(18) ^
	 bc(19) ^ ad(19) ^ bd(19) ^ bc(23) ^ ad(23) ^ bd(23)
	e(3) := bc( 4) ^ ad( 4) ^ bd( 4) ^ bc( 9) ^ ad( 9) ^ bd( 9) ^ bc(14) ^ ad(14) ^ bd(14) ^
	 bc(22) ^ ad(22) ^ bd(22) ^ bc(24) ^ ad(24) ^ bd(24)
	e(4) := bc( 0) ^ ad( 0) ^ bd( 0) ^ bc( 3) ^ ad( 3) ^ bd( 3) ^ bc( 8) ^ ad( 8) ^ bd( 8) ^
	 bc(13) ^ ad(13) ^ bd(13) ^ bc(17) ^ ad(17) ^ bd(17)
	
	f(0) := bc( 6) ^ ad( 6) ^ ac( 6) ^ bc( 7) ^ ad( 7) ^ ac( 7) ^ bc(11) ^ ad(11) ^ ac(11) ^
	 bc(16) ^ ad(16) ^ ac(16) ^ bc(21) ^ ad(21) ^ ac(21)
	f(1) := bc( 2) ^ ad( 2) ^ ac( 2) ^ bc(10) ^ ad(10) ^ ac(10) ^ bc(12) ^ ad(12) ^ ac(12) ^
	 bc(15) ^ ad(15) ^ ac(15) ^ bc(20) ^ ad(20) ^ ac(20)
	f(2) := bc( 1) ^ ad( 1) ^ ac( 1) ^ bc( 5) ^ ad( 5) ^ ac( 5) ^ bc(18) ^ ad(18) ^ ac(18) ^
	 bc(19) ^ ad(19) ^ ac(19) ^ bc(23) ^ ad(23) ^ ac(23)
	f(3) := bc( 4) ^ ad( 4) ^ ac( 4) ^ bc( 9) ^ ad( 9) ^ ac( 9) ^ bc(14) ^ ad(14) ^ ac(14) ^
	 bc(22) ^ ad(22) ^ ac(22) ^ bc(24) ^ ad(24) ^ ac(24)
	f(4) := bc( 0) ^ ad( 0) ^ ac( 0) ^ bc( 3) ^ ad( 3) ^ ac( 3) ^ bc( 8) ^ ad( 8) ^ ac( 8) ^
	 bc(13) ^ ad(13) ^ ac(13) ^ bc(17) ^ ad(17) ^ ac(17)
	
	for (i <- 0 until 5) {
		io.z(i)(1) := e(i)
		io.z(i)(0) := f(i)
	}
	
	/*val a1, a2, a3, a4, a5, b1, b2, b3, b4, b5, c1, c2, c3, c4, c5 = Bool()
	val d1, d2, d3, d4, d5, e1, e2, e3, e4, e5, f1, f2, f3, f4, f5 = Bool()
	val a1c1, a1c2, a1c3, a1c4, a1c5, a1d1, a1d2, a1d3, a1d4, a1d5 = Bool()
	val a2c1, a2c2, a2c3, a2c4, a2c5, a2d1, a2d2, a2d3, a2d4, a2d5 = Bool()
	val a3c1, a3c2, a3c3, a3c4, a3c5, a3d1, a3d2, a3d3, a3d4, a3d5 = Bool()
	val a4c1, a4c2, a4c3, a4c4, a4c5, a4d1, a4d2, a4d3, a4d4, a4d5 = Bool()
	val a5c1, a5c2, a5c3, a5c4, a5c5, a5d1, a5d2, a5d3, a5d4, a5d5 = Bool()
	val b1c1, b1c2, b1c3, b1c4, b1c5, b1d1, b1d2, b1d3, b1d4, b1d5 = Bool()
	val b2c1, b2c2, b2c3, b2c4, b2c5, b2d1, b2d2, b2d3, b2d4, b2d5 = Bool()
	val b3c1, b3c2, b3c3, b3c4, b3c5, b3d1, b3d2, b3d3, b3d4, b3d5 = Bool()
	val b4c1, b4c2, b4c3, b4c4, b4c5, b4d1, b4d2, b4d3, b4d4, b4d5 = Bool()
	val b5c1, b5c2, b5c3, b5c4, b5c5, b5d1, b5d2, b5d3, b5d4, b5d5 = Bool()
	
	a1 := io.x(0)(1)
	a2 := io.x(1)(1)
	a3 := io.x(2)(1)
	a4 := io.x(3)(1)
	a5 := io.x(4)(1)
	b1 := io.x(0)(0)
	b2 := io.x(1)(0)
	b3 := io.x(2)(0)
	b4 := io.x(3)(0)
	b5 := io.x(4)(0)
	c1 := io.y(0)(1)
	c2 := io.y(1)(1)
	c3 := io.y(2)(1)
	c4 := io.y(3)(1)
	c5 := io.y(4)(1)
	d1 := io.y(0)(0)
	d2 := io.y(1)(0)
	d3 := io.y(2)(0)
	d4 := io.y(3)(0)
	d5 := io.y(4)(0)
	
	a1c1 := a1 & c1
	a1c2 := a1 & c2
	a1c3 := a1 & c3
	a1c4 := a1 & c4
	a1c5 := a1 & c5
	a1d1 := a1 & d1
	a1d2 := a1 & d2
	a1d3 := a1 & d3
	a1d4 := a1 & d4
	a1d5 := a1 & d5
	
	a2c1 := a2 & c1
	a2c2 := a2 & c2
	a2c3 := a2 & c3
	a2c4 := a2 & c4
	a2c5 := a2 & c5
	a2d1 := a2 & d1
	a2d2 := a2 & d2
	a2d3 := a2 & d3
	a2d4 := a2 & d4
	a2d5 := a2 & d5
	
	a3c1 := a3 & c1
	a3c2 := a3 & c2
	a3c3 := a3 & c3
	a3c4 := a3 & c4
	a3c5 := a3 & c5
	a3d1 := a3 & d1
	a3d2 := a3 & d2
	a3d3 := a3 & d3
	a3d4 := a3 & d4
	a3d5 := a3 & d5
	
	a4c1 := a4 & c1
	a4c2 := a4 & c2
	a4c3 := a4 & c3
	a4c4 := a4 & c4
	a4c5 := a4 & c5
	a4d1 := a4 & d1
	a4d2 := a4 & d2
	a4d3 := a4 & d3
	a4d4 := a4 & d4
	a4d5 := a4 & d5
	
	a5c1 := a5 & c1
	a5c2 := a5 & c2
	a5c3 := a5 & c3
	a5c4 := a5 & c4
	a5c5 := a5 & c5
	a5d1 := a5 & d1
	a5d2 := a5 & d2
	a5d3 := a5 & d3
	a5d4 := a5 & d4
	a5d5 := a5 & d5
	
	b1c1 := b1 & c1
	b1c2 := b1 & c2
	b1c3 := b1 & c3
	b1c4 := b1 & c4
	b1c5 := b1 & c5
	b1d1 := b1 & d1
	b1d2 := b1 & d2
	b1d3 := b1 & d3
	b1d4 := b1 & d4
	b1d5 := b1 & d5
	
	b2c1 := b2 & c1
	b2c2 := b2 & c2
	b2c3 := b2 & c3
	b2c4 := b2 & c4
	b2c5 := b2 & c5
	b2d1 := b2 & d1
	b2d2 := b2 & d2
	b2d3 := b2 & d3
	b2d4 := b2 & d4
	b2d5 := b2 & d5
	
	b3c1 := b3 & c1
	b3c2 := b3 & c2
	b3c3 := b3 & c3
	b3c4 := b3 & c4
	b3c5 := b3 & c5
	b3d1 := b3 & d1
	b3d2 := b3 & d2
	b3d3 := b3 & d3
	b3d4 := b3 & d4
	b3d5 := b3 & d5
	
	b4c1 := b4 & c1
	b4c2 := b4 & c2
	b4c3 := b4 & c3
	b4c4 := b4 & c4
	b4c5 := b4 & c5
	b4d1 := b4 & d1
	b4d2 := b4 & d2
	b4d3 := b4 & d3
	b4d4 := b4 & d4
	b4d5 := b4 & d5
	
	b5c1 := b5 & c1
	b5c2 := b5 & c2
	b5c3 := b5 & c3
	b5c4 := b5 & c4
	b5c5 := b5 & c5
	b5d1 := b5 & d1
	b5d2 := b5 & d2
	b5d3 := b5 & d3
	b5d4 := b5 & d4
	b5d5 := b5 & d5
	
	e1 := b2c2 ^ a2d2 ^ b2d2 ^ b2c3 ^ a2d3 ^ b2d3 ^ b3c2 ^ a3d2 ^ b3d2 ^
	 b4c2 ^ a4d2 ^ b4d2 ^ b5c2 ^ a5d2 ^ b5d2
	 e2 := b1c3 ^ a1d3 ^ b1d3 ^ b3c1 ^ a3d1 ^ b3d1 ^ b3c3 ^ a3d3 ^ b3d3 ^
	 b4c1 ^ a4d1 ^ b4d1 ^ b5c1 ^ a5d1 ^ b5d1
	e3 := b1c2 ^ a1d2 ^ b1d2 ^ b2c1 ^ a2d1 ^ b2d1 ^ b4c4 ^ a4d4 ^ b4d4 ^
	 b4c5 ^ a4d5 ^ b4d5 ^ b5c4 ^ a5d4 ^ b5d4
	e4 := b1c5 ^ a1d5 ^ b1d5 ^ b2c5 ^ a2d5 ^ b2d5 ^ b3c5 ^ a3d5 ^ b3d5 ^
	 b5c3 ^ a5d3 ^ b5d3 ^ b5c5 ^ a5d5 ^ b5d5
	e5 := b1c1 ^ a1d1 ^ b1d1 ^ b1c4 ^ a1d4 ^ b1d4 ^ b2c4 ^ a2d4 ^ b2d4 ^
	 b3c4 ^ a3d4 ^ b3d4 ^ b4c3 ^ a4d3 ^ b4d3
	
	f1 := b2c2 ^ a2d2 ^ a2c2 ^ b2c3 ^ a2d3 ^ a2c3 ^ b3c2 ^ a3d2 ^ a3c2 ^
	 b4c2 ^ a4d2 ^ a4c2 ^ b5c2 ^ a5d2 ^ a5c2
	f2 := b1c3 ^ a1d3 ^ a1c3 ^ b3c1 ^ a3d1 ^ a3c1 ^ b3c3 ^ a3d3 ^ a3c3 ^
	 b4c1 ^ a4d1 ^ a4c1 ^ b5c1 ^ a5d1 ^ a5c1
	f3 := b1c2 ^ a1d2 ^ a1c2 ^ b2c1 ^ a2d1 ^ a2c1 ^ b4c4 ^ a4d4 ^ a4c4 ^
	 b4c5 ^ a4d5 ^ a4c5 ^ b5c4 ^ a5d4 ^ a5c4
	f4 := b1c5 ^ a1d5 ^ a1c5 ^ b2c5 ^ a2d5 ^ a2c5 ^ b3c5 ^ a3d5 ^ a3c5 ^
	 b5c3 ^ a5d3 ^ a5c3 ^ b5c5 ^ a5d5 ^ a5c5
	f5 := b1c1 ^ a1d1 ^ a1c1 ^ b1c4 ^ a1d4 ^ a1c4 ^ b2c4 ^ a2d4 ^ a2c4 ^
	 b3c4 ^ a3d4 ^ a3c4 ^ b4c3 ^ a4d3 ^ a4c3
	
	io.z(0)(1) := e1
	io.z(1)(1) := e2
	io.z(2)(1) := e3
	io.z(3)(1) := e4
	io.z(4)(1) := e5
	io.z(0)(0) := f1
	io.z(1)(0) := f2
	io.z(2)(0) := f3
	io.z(3)(0) := f4
	io.z(4)(0) := f5*/
}

/* Squaring and scaling with N in GF(2^4) */

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

/* Squaring in GF(2^2) */

class G4Sq extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := io.t(0) ## io.t(1)
}

/* Scaling with N in GF(2^2) */

class G4ScaleN extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := (io.t(0) ## (io.t(1)^io.t(0)))
}

/* Scaling with N^2 in GF(2^2) */

class G4ScaleN2 extends Component {
	val io = new Bundle {
		val t = in  Bits(2 bits)
		val x = out Bits(2 bits)
	}
	
	io.x := ((io.t(1)^io.t(0)) ## io.t(1))
}