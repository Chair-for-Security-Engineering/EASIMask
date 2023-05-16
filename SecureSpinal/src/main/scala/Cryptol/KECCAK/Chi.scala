package Cryptol.KECCAK

import spinal.core._

class ChiMasked extends Component {
	val io = new Bundle {
		val chiIn1 	= in  Bits(1600 bits)
		val chiIn2 	= in  Bits(1600 bits)
		val chiOut1 = out Bits(1600 bits)
		val chiOut2 = out Bits(1600 bits)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			val sbox = new SBoxMasked
			sbox.io.c1 := io.chiIn1((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64)
			sbox.io.c2 := io.chiIn2((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64)
			sbox.io.a1 := io.chiIn1((4-i)*320+((4-j-1+5)%5)*64+63 downto (4-i)*320+((4-j-1+5)%5)*64)
			sbox.io.a2 := io.chiIn2((4-i)*320+((4-j-1+5)%5)*64+63 downto (4-i)*320+((4-j-1+5)%5)*64)
			sbox.io.b1 := io.chiIn1((4-i)*320+((4-j-2+5)%5)*64+63 downto (4-i)*320+((4-j-2+5)%5)*64)
			sbox.io.b2 := io.chiIn2((4-i)*320+((4-j-2+5)%5)*64+63 downto (4-i)*320+((4-j-2+5)%5)*64)
			io.chiOut1((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64) := sbox.io.res1
			io.chiOut2((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64) := sbox.io.res2
		}
	}
}

class ChiMasked800 extends Component {
	val io = new Bundle {
		val chiIn1 	= in  Bits(800 bits)
		val chiIn2 	= in  Bits(800 bits)
		val chiOut1 = out Bits(800 bits)
		val chiOut2 = out Bits(800 bits)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			val sbox = new SBoxMasked32
			sbox.io.c1 := io.chiIn1((4-i)*160+(4-j)*32+31 downto (4-i)*160+(4-j)*32)
			sbox.io.c2 := io.chiIn2((4-i)*160+(4-j)*32+31 downto (4-i)*160+(4-j)*32)
			sbox.io.a1 := io.chiIn1((4-i)*160+((4-j-1+5)%5)*32+31 downto (4-i)*160+((4-j-1+5)%5)*32)
			sbox.io.a2 := io.chiIn2((4-i)*160+((4-j-1+5)%5)*32+31 downto (4-i)*160+((4-j-1+5)%5)*32)
			sbox.io.b1 := io.chiIn1((4-i)*160+((4-j-2+5)%5)*32+31 downto (4-i)*160+((4-j-2+5)%5)*32)
			sbox.io.b2 := io.chiIn2((4-i)*160+((4-j-2+5)%5)*32+31 downto (4-i)*160+((4-j-2+5)%5)*32)
			io.chiOut1((4-i)*160+(4-j)*32+31 downto (4-i)*160+(4-j)*32) := sbox.io.res1
			io.chiOut2((4-i)*160+(4-j)*32+31 downto (4-i)*160+(4-j)*32) := sbox.io.res2
		}
	}
}

class SBoxMasked32 extends Component {
	val io = new Bundle {
		val c1 	= in  Bits(32 bits)
		val c2 	= in  Bits(32 bits)
		val a1 	= in  Bits(32 bits)
		val a2 	= in  Bits(32 bits)
		val b1 	= in  Bits(32 bits)
		val b2 	= in  Bits(32 bits)
		val res1 	= out Bits(32 bits)
		val res2 	= out Bits(32 bits)
	}
	
	val a1b1, a1b2, a2b1, a2b2 = Reg(Bits(32 bits))
	a1b1 := ~io.a1 & io.b1
	a1b2 := (io.a1 & io.b2) ^ io.c1
	a2b1 := (io.a2 & io.b1) ^ io.c2
	a2b2 := ~io.a2 & io.b2
	
	io.res1 := a1b1 ^ a1b2
	io.res2 := a2b1 ^ a2b2
}

class ChiMasked400 extends Component {
	val io = new Bundle {
		val chiIn1 	= in  Bits(400 bits)
		val chiIn2 	= in  Bits(400 bits)
		val chiOut1 = out Bits(400 bits)
		val chiOut2 = out Bits(400 bits)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			val sbox = new SBoxMasked16
			sbox.io.c1 := io.chiIn1((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16)
			sbox.io.c2 := io.chiIn2((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16)
			sbox.io.a1 := io.chiIn1((4-i)*80+((4-j-1+5)%5)*16+15 downto (4-i)*80+((4-j-1+5)%5)*16)
			sbox.io.a2 := io.chiIn2((4-i)*80+((4-j-1+5)%5)*16+15 downto (4-i)*80+((4-j-1+5)%5)*16)
			sbox.io.b1 := io.chiIn1((4-i)*80+((4-j-2+5)%5)*16+15 downto (4-i)*80+((4-j-2+5)%5)*16)
			sbox.io.b2 := io.chiIn2((4-i)*80+((4-j-2+5)%5)*16+15 downto (4-i)*80+((4-j-2+5)%5)*16)
			io.chiOut1((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16) := sbox.io.res1
			io.chiOut2((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16) := sbox.io.res2
		}
	}
}

class SBoxMasked16 extends Component {
	val io = new Bundle {
		val c1 	= in  Bits(16 bits)
		val c2 	= in  Bits(16 bits)
		val a1 	= in  Bits(16 bits)
		val a2 	= in  Bits(16 bits)
		val b1 	= in  Bits(16 bits)
		val b2 	= in  Bits(16 bits)
		val res1 	= out Bits(16 bits)
		val res2 	= out Bits(16 bits)
	}
	
	val a1b1, a1b2, a2b1, a2b2 = Reg(Bits(16 bits))
	a1b1 := ~io.a1 & io.b1
	a1b2 := (io.a1 & io.b2) ^ io.c1
	a2b1 := (io.a2 & io.b1) ^ io.c2
	a2b2 := ~io.a2 & io.b2
	
	io.res1 := a1b1 ^ a1b2
	io.res2 := a2b1 ^ a2b2
}

class SBoxMasked extends Component {
	val io = new Bundle {
		val c1 	= in  Bits(64 bits)
		val c2 	= in  Bits(64 bits)
		val a1 	= in  Bits(64 bits)
		val a2 	= in  Bits(64 bits)
		val b1 	= in  Bits(64 bits)
		val b2 	= in  Bits(64 bits)
		val res1 	= out Bits(64 bits)
		val res2 	= out Bits(64 bits)
	}
	
	val a1b1, a1b2, a2b1, a2b2 = Reg(Bits(64 bits))
	a1b1 := ~io.a1 & io.b1
	a1b2 := (io.a1 & io.b2) ^ io.c1
	a2b1 := (io.a2 & io.b1) ^ io.c2
	a2b2 := ~io.a2 & io.b2
	
	io.res1 := a1b1 ^ a1b2
	io.res2 := a2b1 ^ a2b2
}

class Chi extends Component {
	val io = new Bundle {
		val chiIn 	= in  Bits(1600 bits)
		val chiOut 	= out Bits(1600 bits)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			val sbox = new SBox
			sbox.io.a1 := io.chiIn((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64)
			sbox.io.a2 := io.chiIn((4-i)*320+((4-j-1+5)%5)*64+63 downto (4-i)*320+((4-j-1+5)%5)*64)
			sbox.io.a3 := io.chiIn((4-i)*320+((4-j-2+5)%5)*64+63 downto (4-i)*320+((4-j-2+5)%5)*64)
			io.chiOut((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64) := sbox.io.res
		}
	}
}

class SBox extends Component {
	val io = new Bundle {
		val a1 	= in  Bits(64 bits)
		val a2 	= in  Bits(64 bits)
		val a3 	= in  Bits(64 bits)
		val res = out Bits(64 bits)
	}
	
	io.res := io.a1 ^ (~io.a2 & io.a3)
}

class Chi400 extends Component {
	val io = new Bundle {
		val chiIn 	= in  Bits(400 bits)
		val chiOut 	= out Bits(400 bits)
	}
	
	for (i <- 0 until 5) {
		for (j <- 0 until 5) {
			val sbox = new SBox16
			sbox.io.a1 := io.chiIn((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16)
			sbox.io.a2 := io.chiIn((4-i)*80+((4-j-1+5)%5)*16+15 downto (4-i)*80+((4-j-1+5)%5)*16)
			sbox.io.a3 := io.chiIn((4-i)*80+((4-j-2+5)%5)*16+15 downto (4-i)*80+((4-j-2+5)%5)*16)
			io.chiOut((4-i)*80+(4-j)*16+15 downto (4-i)*80+(4-j)*16) := sbox.io.res
		}
	}
}

class SBox16 extends Component {
	val io = new Bundle {
		val a1 	= in  Bits(16 bits)
		val a2 	= in  Bits(16 bits)
		val a3 	= in  Bits(16 bits)
		val res = out Bits(16 bits)
	}
	
	io.res := io.a1 ^ (~io.a2 & io.a3)
}