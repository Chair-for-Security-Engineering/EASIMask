package AES.DOM

import spinal.core._

/**
	* DOM-Dep Multiplier for any input
	* The security order can be arbitrarily chosen
	* @param order The desired security order (= d)
	* @param x The 1st input
	* @param y The 2nd input
	* @param m Additional randomness
	* @return The result z = a&b
	*/
class DomDepMul(order: Int) extends Component {
	/* We need n = d+1 shares, d*(d+1)/2 random bits for the
	* DOM-indep multiplier and d+1 additional random bits for the resharing */
	val n: Int = order + 1
	val indepRandBits = order*(order+1)/2
	val randBits = indepRandBits+(order+1)
	
	val io = new Bundle {
		val x = in  Vec(Bool(), n)
		val y = in  Vec(Bool(), n)
		val m = in  Vec(Bool(), randBits)
		val z = out Vec(Bool(), n)
	}
	
	val a, x = Vec(Reg(Bool()) init(False), n)
	val b = Bool()
	val c, d = Vec(Bool(), n)
	
	/* Ugly way of performing b = a(0) ^ a(1) ^ ... ^ a(n-1) */
	for (j <- 0 until 1) {
		var e = False
		for (i <- 0 until n) {
			e ^= a(i)
		}
		b := e
	}
	
	for (i <- 0 until n) {
		a(i) := io.y(i) ^ io.m(i)
		c(i) := x(i) & b
		x(i) := io.x(i)
	}
	
	/* DOM-Indep multiplier with same security order to calculate x*m */
	val mul = new DomIndepMul(order)
	for (i <- 0 until n) {
		mul.io.x(i) := io.x(i)
		mul.io.y(i) := io.m(i)
		d(i) := mul.io.z(i)
	}
	for (i <- 0 until indepRandBits) {
		mul.io.m(i) := io.m(n+i)
	}
	
	for (i <- 0 until n) {
		io.z(i) := c(i) ^ d(i)
	}
}

/**
	* DOM-Dep Multiplier with 4 shares for any input
	* @param x The 1st 4-shared input
	* @param y The 2nd 4-shared input
	* @param m Additional randomness, 10 bits total
	* @return 4-shared result z = x&y
	*/
class DomDepMul4Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 4)
		val y = in  Vec(Bool(), 4)
		val m = in  Vec(Bool(), 10)
		val z = out Vec(Bool(), 4)
	}
	
	val a, x = Vec(Reg(Bool()) init(False), 4)
	var b = Bool()
	val c, d = Vec(Bool(), 4)
	
	for (j <- 0 until 1) {
		var e = False
		for (i <- 0 until 4) {
			e ^= a(i)
		}
		b := e
	}
	
	for (i <- 0 until 4) {
		a(i) := io.y(i) ^ io.m(i)
		x(i) := io.x(i)
		c(i) := x(i) & b
	}
	
	val mul = new DomIndepMul4Shares
	for (i <- 0 until 4) {
		mul.io.x(i) := io.x(i)
		mul.io.y(i) := io.m(i)
		d(i) := mul.io.z(i)
	}
	for (i <- 0 until 6) {
		mul.io.m(i) := io.m(4+i)
	}
	
	for (i <- 0 until 4) {
		io.z(i) := c(i) ^ d(i)
	}
}

/**
	* DOM-Dep Multiplier with 3 shares for any input
	* @param x The 1st 3-shared input
	* @param y The 2nd 3-shared input
	* @param m Additional randomness, 6 bits total
	* @return 3-shared result z = x&y
	*/
class DomDepMul3Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 3)
		val y = in  Vec(Bool(), 3)
		val m = in  Vec(Bool(), 6)
		val z = out Vec(Bool(), 3)
	}
	
	val a, x = Vec(Reg(Bool()) init(False), 3)
	val b = Bool()
	val c, d = Vec(Bool(), 3)
	
	a(0) := io.y(0) ^ io.m(0)
	a(1) := io.y(1) ^ io.m(1)
	a(2) := io.y(2) ^ io.m(2)
	
	x(0) := io.x(0)
	x(1) := io.x(1)
	x(2) := io.x(2)
	
	b := a(0) ^ a(1) ^ a(2)
	
	val mul = new DomIndepMul3Shares
	mul.io.x(0) := io.x(0)
	mul.io.x(1) := io.x(1)
	mul.io.x(2) := io.x(2)
	mul.io.y(0) := io.m(0)
	mul.io.y(1) := io.m(1)
	mul.io.y(2) := io.m(2)
	mul.io.m(0) := io.m(3)
	mul.io.m(1) := io.m(4)
	mul.io.m(2) := io.m(5)
	d(0) := mul.io.z(0)
	d(1) := mul.io.z(1)
	d(2) := mul.io.z(2)
	
	c(0) := x(0) & b
	c(1) := x(1) & b
	c(2) := x(2) & b
	
	io.z(0) := c(0) ^ d(0)
	io.z(1) := c(1) ^ d(1)
	io.z(2) := c(2) ^ d(2)
}

/**
	* DOM-Dep Multiplier with 2 shares for any input
	* @param x The 1st 2-shared input
	* @param y The 2nd 2-shared input
	* @param m Additional randomness, 3 bits total
	* @return 2-shared result z = x&y
	*/
class DomDepMul2Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 2)
		val y = in  Vec(Bool(), 2)
		val m = in  Vec(Bool(), 3)
		val z = out Vec(Bool(), 2)
	}
	
	val a, x = Vec(Reg(Bool()) init(False), 2)
	val b = Bool()
	val c, d = Vec(Bool(), 2)
	
	a(0) := io.y(0) ^ io.m(0)
	a(1) := io.y(1) ^ io.m(1)
	
	x(0) := io.x(0); x(1) := io.x(1)
	
	val mul = new DomIndepMul2Shares
	mul.io.x(0) := io.x(0); mul.io.x(1) := io.x(1)
	mul.io.y(0) := io.m(0); mul.io.y(1) := io.m(1)
	mul.io.m := io.m(2)
	d(0) := mul.io.z(0); d(1) := mul.io.z(1)
	
	b := a(0) ^ a(1)
	
	c(0) := x(0) & b; c(1) := x(1) & b
	
	io.z(0) := c(0) ^ d(0)
	io.z(1) := c(1) ^ d(1)
}