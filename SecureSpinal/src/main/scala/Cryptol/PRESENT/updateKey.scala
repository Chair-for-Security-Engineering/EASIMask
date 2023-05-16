package Cryptol.PRESENT

import spinal.core._
import spinal.lib._

class updateKey() extends Component {
	val io = new Bundle {
		val keyIn 	= in  Bits(80 bits)
		val round 	= in  UInt(5 bits)
		val keyOut 	= out Bits(80 bits)
	}
	
	val k1, k2, k3 = Bits(80 bits)
	
	val sbox = new SBox()
	sbox.io.input := U(k1(79 downto 76))
	
	k1 := io.keyIn(18 downto 0) ## io.keyIn(79 downto 19)
	k2 := B(sbox.io.output) ## k1(75 downto 0)
	k3 := k2(79 downto 20) ## (k2(19 downto 15) ^ B(io.round)) ## k2(14 downto 0)
	
	io.keyOut := k3
}

class updateKeyShared extends Component {
	val io = new Bundle {
		val keyIn1 	= in  Bits(80 bits)
		val keyIn2 	= in  Bits(80 bits)
		val keyIn3 	= in  Bits(80 bits)
		val round 	= in  Bits(5 bits)
		val keyOut1 = out Bits(80 bits)
		val keyOut2 = out Bits(80 bits)
		val keyOut3 = out Bits(80 bits)
	}
	
	val k11, k12, k13, k21, k22, k23, k31, k32, k33 = Bits(80 bits)
	
	val sbox = new MaskedSBox
	sbox.io.in1 := k11(79 downto 76)
	sbox.io.in2 := k12(79 downto 76)
	sbox.io.in3 := k13(79 downto 76)
	
	k11 := io.keyIn1(18 downto 0) ## io.keyIn1(79 downto 19)
	k12 := io.keyIn2(18 downto 0) ## io.keyIn2(79 downto 19)
	k13 := io.keyIn3(18 downto 0) ## io.keyIn3(79 downto 19)
	
	val k11Reg = RegNext(k11)
	val k12Reg = RegNext(k12)
	val k13Reg = RegNext(k13)
	
	k21 := sbox.io.out1 ## k11Reg(75 downto 0)
	k22 := sbox.io.out2 ## k12Reg(75 downto 0)
	k23 := sbox.io.out3 ## k13Reg(75 downto 0)
	
	k31 := k21(79 downto 20) ## (k21(19 downto 15) ^ B(io.round)) ## k21(14 downto 0)
	k32 := k22(79 downto 20) ## (k22(19 downto 15) ^ B(io.round)) ## k22(14 downto 0)
	k33 := k23(79 downto 20) ## (k23(19 downto 15) ^ B(io.round)) ## k23(14 downto 0)
	
	io.keyOut1 := k31
	io.keyOut2 := k32
	io.keyOut3 := k33
}

class updateKey128Shared extends Component {
	val io = new Bundle {
		val keyIn1 	= in  Bits(128 bits)
		val keyIn2 	= in  Bits(128 bits)
		val keyIn3 	= in  Bits(128 bits)
		val round 	= in  Bits(5 bits)
		val keyOut1 = out Bits(128 bits)
		val keyOut2 = out Bits(128 bits)
		val keyOut3 = out Bits(128 bits)
	}
	
	val k11, k12, k13, k21, k22, k23, k31, k32, k33 = Bits(128 bits)
	
	val sbox1, sbox2 = new MaskedSBox
	sbox1.io.in1 := k11(127 downto 124)
	sbox1.io.in2 := k12(127 downto 124)
	sbox1.io.in3 := k13(127 downto 124)
	sbox2.io.in1 := k11(123 downto 120)
	sbox2.io.in2 := k12(123 downto 120)
	sbox2.io.in3 := k13(123 downto 120)
	
	k11 := io.keyIn1.rotateLeft(61)
	k12 := io.keyIn2.rotateLeft(61)
	k13 := io.keyIn3.rotateLeft(61)
	//k11 := io.keyIn1(18 downto 0) ## io.keyIn1(79 downto 19)
	//k12 := io.keyIn2(18 downto 0) ## io.keyIn2(79 downto 19)
	//k13 := io.keyIn3(18 downto 0) ## io.keyIn3(79 downto 19)
	
	val k11Reg = RegNext(k11)
	val k12Reg = RegNext(k12)
	val k13Reg = RegNext(k13)
	
	k21 := sbox1.io.out1 ## sbox2.io.out1 ## k11Reg(119 downto 0)
	k22 := sbox1.io.out2 ## sbox2.io.out2 ## k12Reg(119 downto 0)
	k23 := sbox1.io.out3 ## sbox2.io.out3 ## k13Reg(119 downto 0)
	
	k31 := k21(127 downto 67) ## (k21(66 downto 62) ^ B(io.round)) ## k21(61 downto 0)
	k32 := k22(127 downto 67) ## k22(66 downto 62) ## k22(61 downto 0)
	k33 := k23(127 downto 67) ## k23(66 downto 62) ## k23(61 downto 0)
	
	io.keyOut1 := k31
	io.keyOut2 := k32
	io.keyOut3 := k33
}
