package AES.Software

import scala.math.BigInt.int2bigInt
import scala.math._

class Polynomial (initValue: Int, gf: Int) {
	
	var value: Int = initValue
	
	var galoisField = gf
	
	var irreduciblePolynomial: Int = 0x1B
	if (gf == 16) irreduciblePolynomial = 0x9
	else if (gf == 4) irreduciblePolynomial = 0x7
	
	def setValue (value: Int): Unit = {
		this.value = value
	}
	
	def getValue: Int = {
		this.value
	}
	
	def getValueAsHex: String = {
		getValue.toHexString
	}
	
	def addPoly (a: Polynomial, b: Polynomial): Polynomial = {
		val c = new Polynomial(a.value^b.value, a.galoisField)
		c
	}
	
	def subtractPoly (a: Polynomial, b: Polynomial): Unit = {
		this.addPoly(a, b)
	}
	
	def log2(a: Int): Int = (log10(a)/log10(2.0)).toInt
	
	def multiplyPoly (a: Int, b: Int, gf: Int, irreduciblePoly: Int): Int = {
		val index = log2(gf)-1
		var ret: Int = 0
		if (gf == 256) ret = 0xFF
		else if (gf == 16) ret = 0xF
		var msb: Boolean = false
		var aValue: Int = a
		var bValue: Int = b
		var c: Int = 0
		while (bValue != 0) {
			if ((bValue & 0x1) == 1) c = c ^ aValue
			bValue = bValue >> 1
			msb = ((aValue >> index) & 0x1) == 1
			aValue = aValue << 1
			if (msb) aValue = aValue ^ irreduciblePoly
		}
		
		c & ret
	}
	
	def g4Mul (x: Int, y: Int): Int = {
		val a = (x & 0x2) >> 1
		val b = x & 0x1
		val c = (y & 0x2) >> 1
		val d = y & 0x1
		val e = (a^b) & (c^d)
		val p = (a&c) ^ e
		val q = (b&d) ^ e
		((p << 1) | q)
	}
	
	def g4ScaleN (x: Int) : Int = {
		val a = (x & 0x2) >> 1
		val b = x & 0x1
		val p = b
		val q = a ^ b
		((p << 1) | q)
	}
	
	def g4ScaleN2 (x: Int) : Int = {
		val a = (x & 0x2) >> 1
		val b = x & 0x1
		val p = a ^ b
		val q = a
		((p << 1) | q)
	}
	
	def g4Sq (x: Int): Int = {
		val a = (x & 0x2) >> 1
		val b = x & 0x1
		((b << 1) | a)
	}
	
	def g16Mul (x: Int, y: Int): Int = {
		val a = (x & 0xC) >> 2
		val b = x & 0x3
		val c = (y & 0xC) >> 2
		val d = y & 0x3
		val e = g4Mul(a^b, c^d)
		val f = g4ScaleN(e)
		val p = g4Mul(a, c) ^ f
		val q = g4Mul(b, d) ^ f
		((p << 2) | q)
	}
	
	def g16SqScl (x: Int): Int = {
		val a = (x & 0xC) >> 2
		val b = x & 0x3
		val p = g4Sq(a^b)
		val q = g4ScaleN2(g4Sq(b))
		((p << 2) | q)
	}
	
	def g16Inv(x: Int): Int = {
		val a = (x & 0xC) >> 2
		val b = x & 0x3
		val c = g4ScaleN(g4Sq(a ^ b))
		val d = g4Mul(a, b)
		val e = g4Sq(c ^ d)
		val p = g4Mul(e, b)
		val q = g4Mul(e, a)
		((p << 2) | q)
	}
	
	def multiplyPoly16 (a: Polynomial, b: Polynomial): Polynomial = {
		val c = new Polynomial(0, 16)
		val mul = multiplyPoly(a.value, b.value, 16, a.irreduciblePolynomial)
		//println(mul)
		c.setValue(mul)
		c
	}
	
	def multiplyPoly256 (a: Polynomial, b: Polynomial): Polynomial = {
		val c = new Polynomial(0, 256)
		val mul = multiplyPoly(a.value, b.value, 256, a.irreduciblePolynomial)
		c.setValue(mul)
		c
	}
	
	def multiplyPoly (a: Polynomial, b: Polynomial): Unit = {
		val c = multiplyPoly(a.value, b.value, a.galoisField, a.irreduciblePolynomial)
		this.setValue(c&0xFF)
	}
	
	def invertPoly16 (a: Polynomial): Polynomial = {
		val b = new Polynomial(0, 16)
		if (a.getValue == 0) b.setValue(0)
		else {
			for (i <- 0 until 16) {
				if (multiplyPoly(a.getValue, i, 16, a.irreduciblePolynomial) == 1) b.setValue(i)
			}
		}
		
		b
	}
	
	def invertPolyBruteForce (a: Polynomial): Unit = {
		val b, c = new Polynomial(0, 256)
		if (a.getValue == 0) this.setValue(0)
		else {
			for (i <- 0 until 256) {
				b.setValue(i)
				c.multiplyPoly(a, b)
				if (c.getValue == 1) this.setValue(i)
			}
		}
	}
	
	def hex2poly : String = {
		var ret: String = ""
		var first = true
		if (value == 0) ret += s"0"
		var index = value.bitLength - 1
		while (index >= 0) {
			if (((value >> index) & 0x1) == 1) {
				if (!first) ret += s" + "
				first = false
				if (index == 0) ret += s"1"
				else if (index == 1) ret += s"x"
				else ret += s"x^${index}"
			}
			index = index - 1
		}
		ret
	}
	
	def invertPoly256 (t: Polynomial): Polynomial = {
		val a = (t.value & 0xF0) >> 4
		val b = (t.value & 0x0F)
		val c = g16SqScl(a ^ b)
		val d = g16Mul(a, b)
		val e = g16Inv(c ^ d)
		val p = g16Mul(e, b)
		val q = g16Mul(e, a)
		new Polynomial((p << 4) | q, 256)
	}
}

class PolynomialGF16 (initValue: Int) {
	
	var value: Int = initValue
	
	val irreduciblePolynomial: Int = 0x13
	
	def setValue(value: Int): Unit = this.value = value
	
	def getValue: Int = this.value
	
	def getValueAsHex: String = getValue.toHexString
	
	def addPoly (a: PolynomialGF16, b: PolynomialGF16): Unit = {
		this.setValue(a.value ^ b.value)
	}
	
	def subtractPoly (a: PolynomialGF16, b: PolynomialGF16): Unit = {
		this.addPoly(a, b)
	}
	
	def multiplyPoly4 (a: Int, b: Int): Int = {
		var c = 0
		var aValue = a
		var bValue = b
		while (bValue != 0) {
			if ((bValue & 0x1) == 1) c = c ^ bValue
			bValue = bValue >> 1
			val msb = ((aValue >> 3) & 0x1) == 1
			aValue = aValue << 1
			if (msb) aValue = aValue ^ 0x11
		}
		
		c
	}
	
	def multiplyPoly4 (a: PolynomialGF16, b: PolynomialGF16): Unit = {
		val c = multiplyPoly4(a.value, b.value)
		this.setValue(c)
	}
	
	def invertPolyBruteForce (a: PolynomialGF16): Unit = {
		if (a.getValue == 0) this.setValue(0)
		else {
			for (i <- 0 until 16) {
				if (multiplyPoly4(a.getValue, i) == 1) this.setValue(i)
			}
		}
	}
	
	//def invertPoly (a: PolynomialGF1)
}