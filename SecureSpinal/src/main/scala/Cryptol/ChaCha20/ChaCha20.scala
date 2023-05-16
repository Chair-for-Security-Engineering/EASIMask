package Cryptol.ChaCha20

import spinal.core._
import spinal.lib._

object States extends SpinalEnum {
	val sIdle, sExecute, sFinalAdd, sDone = newElement()
}

class ChaCha20 extends Component {
	import States._
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val enable 			= in  Bool()
		val plaintext 	= in  Bits(256 bits)
		val key 				= in  Bits(256 bits)
		val ctr			 		= in  Bits(32 bits)
		val nonce 			= in  Bits(96 bits)
		val ciphertext 	= out Bits(256 bits)
		val done 				= out Bool()
	}
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state = Vec(Vec(Reg(UInt(32 bits)) init (0), 4), 4)
		val initialState = Vec(Vec(UInt(32 bits), 4), 4)
		val roundCounter = Counter(20)
		val keyStream = Bits(512 bits)
		
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				keyStream((3-i)*128+(3-j)*32+31 downto (3-i)*128+(3-j)*32) := B(state(i)(j))
			}
		}
		
		io.ciphertext := keyStream(511 downto 256) ^ io.plaintext
		
		
		initialState(0)(0) := U"32'h61707865"
		initialState(0)(1) := U"32'h3320646e"
		initialState(0)(2) := U"32'h79622d32"
		initialState(0)(3) := U"32'h6b206574"
		initialState(3)(0) := U(io.ctr)
		
		for (i <- 0 until 3) {
			val nonceWord = io.nonce((2-i)*32+31 downto (2-i)*32)
			initialState(3)(i+1) := U(nonceWord(7 downto 0) ## nonceWord(15 downto 8) ## nonceWord(23 downto 16) ## nonceWord(31 downto 24))
		}
		
		for (i <- 0 until 2) {
			for (j <- 0 until 4) {
				val keyWord = io.key((1-i)*128+(3-j)*32+31 downto (1-i)*128+(3-j)*32)
				initialState(i+1)(j) := U(keyWord(7 downto 0) ## keyWord(15 downto 8) ## keyWord(23 downto 16) ## keyWord(31 downto 24))
			}
		}
		
		val qr1, qr2, qr3, qr4 = new QuarterRound
		when (~roundCounter.value(0)) {
			qr1.io.a := state(0)(0)
			state(0)(0) := qr1.io.e
			qr1.io.b := state(1)(0)
			state(1)(0) := qr1.io.f
			qr1.io.c := state(2)(0)
			state(2)(0) := qr1.io.g
			qr1.io.d := state(3)(0)
			state(3)(0) := qr1.io.h
			
			qr2.io.a := state(0)(1)
			state(0)(1) := qr2.io.e
			qr2.io.b := state(1)(1)
			state(1)(1) := qr2.io.f
			qr2.io.c := state(2)(1)
			state(2)(1) := qr2.io.g
			qr2.io.d := state(3)(1)
			state(3)(1) := qr2.io.h
			
			qr3.io.a := state(0)(2)
			state(0)(2) := qr3.io.e
			qr3.io.b := state(1)(2)
			state(1)(2) := qr3.io.f
			qr3.io.c := state(2)(2)
			state(2)(2) := qr3.io.g
			qr3.io.d := state(3)(2)
			state(3)(2) := qr3.io.h
			
			qr4.io.a := state(0)(3)
			state(0)(3) := qr4.io.e
			qr4.io.b := state(1)(3)
			state(1)(3) := qr4.io.f
			qr4.io.c := state(2)(3)
			state(2)(3) := qr4.io.g
			qr4.io.d := state(3)(3)
			state(3)(3) := qr4.io.h
		} otherwise {
			qr1.io.a := state(0)(0)
			state(0)(0) := qr1.io.e
			qr1.io.b := state(1)(1)
			state(1)(1) := qr1.io.f
			qr1.io.c := state(2)(2)
			state(2)(2) := qr1.io.g
			qr1.io.d := state(3)(3)
			state(3)(3) := qr1.io.h
			
			qr2.io.a := state(0)(1)
			state(0)(1) := qr2.io.e
			qr2.io.b := state(1)(2)
			state(1)(2) := qr2.io.f
			qr2.io.c := state(2)(3)
			state(2)(3) := qr2.io.g
			qr2.io.d := state(3)(0)
			state(3)(0) := qr2.io.h
			
			qr3.io.a := state(0)(2)
			state(0)(2) := qr3.io.e
			qr3.io.b := state(1)(3)
			state(1)(3) := qr3.io.f
			qr3.io.c := state(2)(0)
			state(2)(0) := qr3.io.g
			qr3.io.d := state(3)(1)
			state(3)(1) := qr3.io.h
			
			qr4.io.a := state(0)(3)
			state(0)(3) := qr4.io.e
			qr4.io.b := state(1)(0)
			state(1)(0) := qr4.io.f
			qr4.io.c := state(2)(1)
			state(2)(1) := qr4.io.g
			qr4.io.d := state(3)(2)
			state(3)(2) := qr4.io.h
		}
		
		val chachaState = Reg(States()) init(sIdle)
		
		switch (chachaState) {
			is (sIdle) {
				chachaState := sIdle
				roundCounter.clear()
				when (io.enable) {
					chachaState := sExecute
					state := initialState
				}
			}
			
			is (sExecute) {
				chachaState := sExecute
				roundCounter.increment()
				when (roundCounter.willOverflow) {
					chachaState := sFinalAdd
				}
			}
			
			is (sFinalAdd) {
				for (i <- 0 until 4) {
					for (j <- 0 until 4) {
						state(i)(j) := state(i)(j) + initialState(i)(j)
					}
				}
				//state := state
				chachaState := sDone
			}
			
			is (sDone) {
				io.done := True
				chachaState := sDone
			}
		}
	}
}

object generateChaCha {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/ChaCha20/RTL").generate(new ChaCha20)
	}
}