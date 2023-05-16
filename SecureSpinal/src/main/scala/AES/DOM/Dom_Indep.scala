package AES.DOM

import spinal.core._

/**
	* DOM-Indep multiplier, assuming independently shared inputs
	* The security order can be arbitrarily chosen
	* @param d The security order, must be >= 1
	* @param x The 1st input
	* @param y The 2nd input
	* @param m Additional randomness, d*(d+1)/2 bits
	* @return z = a&b
	*/
class DomIndepMul(d: Int) extends Component {
	val n: Int = d + 1
	val randBits: Int = d*(d+1)/2
	
	val io = new Bundle {
		val x = in  Vec(Bool(), n)
		val y = in  Vec(Bool(), n)
		val m = in  Vec(Bool(), randBits)
		val z = out Vec(Bool(), n)
	}
	
	val xy = Vec(Bool(), n*n)
	val z = Vec(Reg(Bool()) init(False), n*n)
	
	/* Perform all needed combinations of x(i) and y(j) (Calculation phase) */
	for (i <- 0 until n) {
		for (j <- 0 until n) {
			xy(n*i+j) := io.x(i) & io.y(j)
		}
	}
	
	/* Collect the indices for the randomness bits and save them in mIndices */
	/* Inititalize the array with (false, 0) */
	val mIndices = Array.ofDim[(Boolean, Int)](n, n)
	for (i <- 0 until n) {
		for (j <- 0 until n) {
			mIndices(i)(j) = (false, 0)
		}
	}
	var index: Int = 0
	/* If i=j, we don't need a random bit and we can mark this point as visited
	*  Else, we mark the point (i, j) as visited and set the index to the current
	*  index, the same applies for point (j, i) which gets the same index
	*  Then, we can increase the index */
	for (i <- 0 until n) {
		for (j <- 0 until n) {
			if (i == j) mIndices(i)(j) = (true, 0)
			else {
				if (!mIndices(i)(j)._1 && (mIndices(i)(j)._2 == 0)) {
					mIndices(i)(j) = (true, index)
					mIndices(j)(i) = (true, index)
					index += 1
				}
			}
		}
	}
	
	/* Add random bits if i!=j, and then write the results into a register (Resharing) */
	/* We can perform the Integration step in the same loop */
	for (i <- 0 until n) {
		var a = False
		for (j <- 0 until n) {
			if (i == j) z(n*i+j) := xy(n*i+j)
			else z(n*i+j) := xy(n*i+j) ^ io.m(mIndices(i)(j)._2)
			a ^= z(n*i+j)
		}
		io.z(i) := a
	}
}

/**
	* 1-bit multiplier (logical AND of two Booleans), masked with a 4-share DOM
	* 3nd order secure, assumes independent inputs
	* @param x 1st 4-shared input
	* @param y 2nd 4-shared input
	* @param m Additional randomness, 6 bits total
	* @return z = a&b
	*/
class DomIndepMul4Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 4)
		val y = in  Vec(Bool(), 4)
		val m = in  Vec(Bool(), 6)
		val z = out Vec(Bool(), 4)
	}
	
	val xy = Vec(Bool(), 4*4)
	val z = Vec(Reg(Bool()) init(False), 4*4)
	
	for (i <- 0 until 4) {
		for (j <- 0 until 4) {
			xy(4*i+j) := io.x(i) & io.y(j)
		}
	}
	
	val mIndices = Array.ofDim[(Boolean, Int)](4, 4)
	for (i <- 0 until 4) {
		for (j <- 0 until 4) {
			mIndices(i)(j) = (false, 0)
		}
	}
	var index: Int = 0
	for (i <- 0 until 4) {
		for (j <- 0 until 4) {
			if (i == j) mIndices(i)(j) = (true, 0)
			else {
				if ((mIndices(i)(j)._1 == false) && (mIndices(i)(j)._2 == 0)) {
					mIndices(i)(j) = (true, index)
					mIndices(j)(i) = (true, index)
					index += 1
				}
			}
		}
	}
	
	for (i <- 0 until 4) {
		var a = False
		for (j <- 0 until 4) {
			if (i == j) z(4*i+j) := xy(4*i+j)
			else z(4*i+j) := xy(4*i+j) ^ io.m(mIndices(i)(j)._2)
			a ^= z(4*i+j)
		}
		io.z(i) := a
	}
	
	/*val x0, x1, x2, x3, y0, y1, y2, y3 = Bool()
	val m0, m1, m2, m3, m4, m5 = Bool()
	val x0y0, x0y1, x0y2, x0y3, x1y0, x1y1, x1y2, x1y3, x2y0, x2y1, x2y2, x2y3, x3y0, x3y1, x3y2, x3y3 = Bool()
	val z0, z1, z2, z3, z4, z5, z6, z7, z8, z9, z10, z11, z12, z13, z14, z15 = Reg(Bool())
	
	x0 := io.x(0); x1 := io.x(1); x2 := io.x(2); x3 := io.x(3)
	y0 := io.y(0); y1 := io.y(1); y2 := io.y(2); y3 := io.y(3)
	m0 := io.m(0); m1 := io.m(1); m2 := io.m(2); m3 := io.m(3); m4 := io.m(4); m5 := io.m(5)
	
	x0y0 := x0 & y0
	x0y1 := x0 & y1
	x0y2 := x0 & y2
	x0y3 := x0 & y3
	x1y0 := x1 & y0
	x1y1 := x1 & y1
	x1y2 := x1 & y2
	x1y3 := x1 & y3
	x2y0 := x2 & y0
	x2y1 := x2 & y1
	x2y2 := x2 & y2
	x2y3 := x2 & y3
	x3y0 := x3 & y0
	x3y1 := x3 & y1
	x3y2 := x3 & y2
	x3y3 := x3 & y3
	
	z0 := x0y0
	z1 := x0y1 ^ m0
	z2 := x0y2 ^ m1
	z3 := x0y3 ^ m2
	z4 := x1y0 ^ m0
	z5 := x1y1
	z6 := x1y2 ^ m3
	z7 := x1y3 ^ m4
	z8 := x2y0 ^ m1
	z9 := x2y1 ^ m3
	z10 := x2y2
	z11 := x2y3 ^ m5
	z12 := x3y0 ^ m2
	z13 := x3y1 ^ m4
	z14 := x3y2 ^ m5
	z15 := x3y3
	
	io.z(0) := z0 ^ z1 ^ z2 ^ z3
	io.z(1) := z4 ^ z5 ^ z6 ^ z7
	io.z(2) := z8 ^ z9 ^ z10 ^ z11
	io.z(3) := z12 ^ z13 ^ z14 ^ z15*/
}

/**
	* 1-bit multiplier (logical AND of two Booleans), masked with a 3-share DOM
	* 2nd order secure, assumes independent inputs
	* @param x 1st 3-shared input
	* @param y 2nd 3-shared input
	* @param m Additional randomness, 3 bits total
	* @return z = a&b
	*/
class DomIndepMul3Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 3)
		val y = in  Vec(Bool(), 3)
		val m = in  Vec(Bool(), 3)
		val z = out Vec(Bool(), 3)
	}

	val xy = Vec(Bool(), 9)
	val a = Vec(Reg(Bool()) init(False), 9)
	
	for (i <- 0 until 3) {
		for (j <- 0 until 3) {
			xy(3*i+j) := io.x(i) & io.y(j)
		}
	}
	
	val mIndices = Array.ofDim[(Boolean, Int)](3, 3)
	for (i <- 0 until 3) {
		for (j <- 0 until 3) {
			mIndices(i)(j) = (false, 0)
		}
	}
	var index: Int = 0
	for (i <- 0 until 3) {
		for (j <- 0 until 3) {
			if (i == j) mIndices(i)(j) = (true, 0)
			else {
				if ((mIndices(i)(j)._1 == false) && (mIndices(i)(j)._2 == 0)) {
					mIndices(i)(j) = (true, index)
					mIndices(j)(i) = (true, index)
					index += 1
				}
			}
		}
	}
	
	for (i <- 0 until 3) {
		var z = False
		for (j <- 0 until 3) {
			if (i == j) a(3*i+j) := xy(3*i+j)
			else a(3*i+j) := xy(3*i+j) ^ io.m(mIndices(i)(j)._2)
			z ^= a(3*i+j)
		}
		io.z(i) := z
	}
	
	/*io.z(0) := a(0) ^ a(1) ^ a(2)
	io.z(1) := a(3) ^ a(4) ^ a(5)
	io.z(2) := a(6) ^ a(7) ^ a(8)*/
	
	/*val x0, x1, x2, y0, y1, y2, m0, m1, m2 = Bool()
	val x0y0, x0y1, x0y2, x1y0, x1y1, x1y2, x2y0, x2y1, x2y2 = Bool()
	val a0, a1, a2, a3, a4, a5, a6, a7, a8 = Reg(Bool())
	
	x0 := io.x(0); x1 := io.x(1); x2 := io.x(2)
	y0 := io.y(0); y1 := io.y(1); y2 := io.y(2)
	m0 := io.m(0); m1 := io.m(1); m2 := io.m(2)
	
	x0y0 := x0 & y0
	x0y1 := x0 & y1
	x0y2 := x0 & y2
	x1y0 := x1 & y0
	x1y1 := x1 & y1
	x1y2 := x1 & y2
	x2y0 := x2 & y0
	x2y1 := x2 & y1
	x2y2 := x2 & y2
	
	a0 := x0y0
	a1 := x0y1 ^ m0
	a2 := x0y2 ^ m1
	a3 := x1y0 ^ m0
	a4 := x1y1
	a5 := x1y2 ^ m2
	a6 := x2y0 ^ m1
	a7 := x2y1 ^ m2
	a8 := x2y2
	
	io.z(0) := a0 ^ a1 ^ a2
	io.z(1) := a3 ^ a4 ^ a5
	io.z(2) := a6 ^ a7 ^ a8*/
}

/**
	* 1-bit multiplier (logical AND of two Booleans), masked with a 2-share DOM
	* 1st-order secure, assumes independent inputs
	* @param x 1st 2-shared input
	* @param y 2nd 2-shared input
	* @param m Additional bit of randomness
	* @return z = a&b
	*/
class DomIndepMul2Shares extends Component {
	val io = new Bundle {
		val x = in  Vec(Bool(), 2)
		val y = in  Vec(Bool(), 2)
		val m = in  Bool()
		val z = out Vec(Bool(), 2)
	}
	
	val xy = Vec(Bool(), 4)
	val a = Vec(Reg(Bool()), 4)
	
	for (i <- 0 until 2) {
		for (j <- 0 until 2) {
			xy(2*i+j) := io.x(i) & io.y(j)
		}
	}
	
	for (i <- 0 until 2) {
		var z = False
		for (j <- 0 until 2) {
			if (i == j) a(2*i+j) := xy(2*i+j)
			else a(2*i+j) := xy(2*i+j) ^ io.m
			z ^= a(2*i+j)
		}
		io.z(i) := z
	}

	/*val x0, x1, y0, y1, m = Bool()
	val x0y0, x0y1, x1y0, x1y1 = Bool()
	val a0, a1, a2, a3 = Reg(Bool())
	
	x0 := io.x(0); x1 := io.x(1)
	y0 := io.y(0); y1 := io.y(1)
	m := io.m
	
	x0y0 := x0 & y0
	x0y1 := x0 & y1
	x1y0 := x1 & y0
	x1y1 := x1 & y1
	
	a0 := x0y0
	a1 := x0y1 ^ m
	a2 := x1y0 ^ m
	a3 := x1y1
	
	io.z(0) := a0 ^ a1
	io.z(1) := a2 ^ a3*/
}