package Cryptol.PRESENT

import spinal.core._
import spinal.lib._

class sboxLayer extends Component {
	val io = new Bundle {
		val stateIn  	= in  Bits(64 bits)
		val stateOut 	= out Bits(64 bits)
	}
	
	for (i <- 0 until 16) {
		val sbox = new SBox()
		sbox.io.input := U(io.stateIn(4 * i + 3 downto 4 * i))
		io.stateOut(4 * i + 3 downto 4 * i) := B(sbox.io.output)
	}
}

class sboxLayerShared extends Component {
	val io = new Bundle {
		val stateIn1	= in  Bits(64 bits)
		val stateIn2	= in  Bits(64 bits)
		val stateIn3	= in  Bits(64 bits)
		val stateOut1 = out Bits(64 bits)
		val stateOut2 = out Bits(64 bits)
		val stateOut3 = out Bits(64 bits)
	}
	
	for (i <- 0 until 16) {
		val sbox = new MaskedSBox
		sbox.io.in1 := io.stateIn1(4*i+3 downto 4*i)
		sbox.io.in2 := io.stateIn2(4*i+3 downto 4*i)
		sbox.io.in3 := io.stateIn3(4*i+3 downto 4*i)
		io.stateOut1(4*i+3 downto 4*i) := sbox.io.out1
		io.stateOut2(4*i+3 downto 4*i) := sbox.io.out2
		io.stateOut3(4*i+3 downto 4*i) := sbox.io.out3
	}
}
