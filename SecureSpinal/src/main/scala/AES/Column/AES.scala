package AES.Column

import spinal.core._
import spinal.lib.Counter

object States extends SpinalEnum {
	val sIdle, sExecute, sFinalRound, sDone = newElement()
}

class AES extends Component {
	import States._
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val enable 			= in  Bool()
		val plaintext 	= in  Bits(128 bits)
		val key 				= in  Bits(128 bits)
		val ciphertext 	= out Bits(128 bits)
		val done 				= out Bool()
	}
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg = Vec(Vec(Reg(Bits(8 bits)), 4), 4)
		val keyReg = Vec(Vec(Reg(Bits(8 bits)), 4), 4)
		
		val roundCounter = Counter(1, 9)
		val smallCounter = Counter(5)
		val roundConstant = Reg(Bits(8 bits)) init(1)
		val w0, w1, w2, w3, sboxOut = Vec(Bits(8 bits), 4)
		
		val addroundkey = new AddRoundKey
		val sbox1, sbox2, sbox3, sbox4 = new CanrightSBox
		val mixcolumns = new MixColumns
		val shiftrows = new ShiftRows
		
		val aesState = Reg(States()) init(sIdle)
		
		for (i <- 0 until 4) {
			w0(i) := keyReg(i)(0) ^ sboxOut((i+1)%4) ^ Vec(List(roundConstant, B(0), B(0), B(0)))(i)
			w1(i) := keyReg(i)(1) ^ w0(i)
			w2(i) := keyReg(i)(2) ^ w1(i)
			w3(i) := keyReg(i)(3) ^ w2(i)
		}
		sboxOut := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
		
		shiftrows.io.srIn := stateReg
		when (smallCounter.value === 0) {
			addroundkey.io.stateIn := Vec(stateReg(0)(0), stateReg(1)(1), stateReg(2)(2), stateReg(3)(3))
			addroundkey.io.key := Vec(keyReg(0)(0), keyReg(1)(1), keyReg(2)(2), keyReg(3)(3))
			sbox1.io.subBytesInput := addroundkey.io.stateOut(0)
			sbox2.io.subBytesInput := addroundkey.io.stateOut(1)
			sbox3.io.subBytesInput := addroundkey.io.stateOut(2)
			sbox4.io.subBytesInput := addroundkey.io.stateOut(3)
			mixcolumns.io.mcIn := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
			when (aesState === sExecute) {
				stateReg(0)(0) := mixcolumns.io.mcOut(0)
				stateReg(1)(1) := mixcolumns.io.mcOut(1)
				stateReg(2)(2) := mixcolumns.io.mcOut(2)
				stateReg(3)(3) := mixcolumns.io.mcOut(3)
			} elsewhen (aesState === sFinalRound) {
				stateReg(0)(0) := sbox1.io.subBytesOutput
				stateReg(1)(1) := sbox2.io.subBytesOutput
				stateReg(2)(2) := sbox3.io.subBytesOutput
				stateReg(3)(3) := sbox4.io.subBytesOutput
			} otherwise {
				stateReg(0)(0) := addroundkey.io.stateOut(0)
				stateReg(1)(1) := addroundkey.io.stateOut(1)
				stateReg(2)(2) := addroundkey.io.stateOut(2)
				stateReg(3)(3) := addroundkey.io.stateOut(3)
			}
		} elsewhen (smallCounter.value === 1) {
			addroundkey.io.stateIn := Vec(stateReg(0)(1), stateReg(1)(2), stateReg(2)(3), stateReg(3)(0))
			addroundkey.io.key := Vec(keyReg(0)(1), keyReg(1)(2), keyReg(2)(3), keyReg(3)(0))
			sbox1.io.subBytesInput := addroundkey.io.stateOut(0)
			sbox2.io.subBytesInput := addroundkey.io.stateOut(1)
			sbox3.io.subBytesInput := addroundkey.io.stateOut(2)
			sbox4.io.subBytesInput := addroundkey.io.stateOut(3)
			mixcolumns.io.mcIn := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
			when (aesState === sExecute) {
				stateReg(0)(1) := mixcolumns.io.mcOut(0)
				stateReg(1)(2) := mixcolumns.io.mcOut(1)
				stateReg(2)(3) := mixcolumns.io.mcOut(2)
				stateReg(3)(0) := mixcolumns.io.mcOut(3)
			} elsewhen (aesState === sFinalRound) {
				stateReg(0)(1) := sbox1.io.subBytesOutput
				stateReg(1)(2) := sbox2.io.subBytesOutput
				stateReg(2)(3) := sbox3.io.subBytesOutput
				stateReg(3)(0) := sbox4.io.subBytesOutput
			} otherwise {
				stateReg(0)(1) := addroundkey.io.stateOut(0)
				stateReg(1)(2) := addroundkey.io.stateOut(1)
				stateReg(2)(3) := addroundkey.io.stateOut(2)
				stateReg(3)(0) := addroundkey.io.stateOut(3)
			}
		} elsewhen (smallCounter.value === 2) {
			addroundkey.io.stateIn := Vec(stateReg(0)(2), stateReg(1)(3), stateReg(2)(0), stateReg(3)(1))
			addroundkey.io.key := Vec(keyReg(0)(2), keyReg(1)(3), keyReg(2)(0), keyReg(3)(1))
			sbox1.io.subBytesInput := addroundkey.io.stateOut(0)
			sbox2.io.subBytesInput := addroundkey.io.stateOut(1)
			sbox3.io.subBytesInput := addroundkey.io.stateOut(2)
			sbox4.io.subBytesInput := addroundkey.io.stateOut(3)
			mixcolumns.io.mcIn := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
			when (aesState === sExecute) {
				stateReg(0)(2) := mixcolumns.io.mcOut(0)
				stateReg(1)(3) := mixcolumns.io.mcOut(1)
				stateReg(2)(0) := mixcolumns.io.mcOut(2)
				stateReg(3)(1) := mixcolumns.io.mcOut(3)
			} elsewhen (aesState === sFinalRound) {
				stateReg(0)(2) := sbox1.io.subBytesOutput
				stateReg(1)(3) := sbox2.io.subBytesOutput
				stateReg(2)(0) := sbox3.io.subBytesOutput
				stateReg(3)(1) := sbox4.io.subBytesOutput
			} otherwise {
				stateReg(0)(2) := addroundkey.io.stateOut(0)
				stateReg(1)(3) := addroundkey.io.stateOut(1)
				stateReg(2)(0) := addroundkey.io.stateOut(2)
				stateReg(3)(1) := addroundkey.io.stateOut(3)
			}
		} elsewhen (smallCounter.value === 3) {
			addroundkey.io.stateIn := Vec(stateReg(0)(3), stateReg(1)(0), stateReg(2)(1), stateReg(3)(2))
			addroundkey.io.key := Vec(keyReg(0)(3), keyReg(1)(0), keyReg(2)(1), keyReg(3)(2))
			sbox1.io.subBytesInput := addroundkey.io.stateOut(0)
			sbox2.io.subBytesInput := addroundkey.io.stateOut(1)
			sbox3.io.subBytesInput := addroundkey.io.stateOut(2)
			sbox4.io.subBytesInput := addroundkey.io.stateOut(3)
			mixcolumns.io.mcIn := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
			when (aesState === sExecute) {
				stateReg(0)(3) := mixcolumns.io.mcOut(0)
				stateReg(1)(0) := mixcolumns.io.mcOut(1)
				stateReg(2)(1) := mixcolumns.io.mcOut(2)
				stateReg(3)(2) := mixcolumns.io.mcOut(3)
			} elsewhen (aesState === sFinalRound) {
				stateReg(0)(3) := sbox1.io.subBytesOutput
				stateReg(1)(0) := sbox2.io.subBytesOutput
				stateReg(2)(1) := sbox3.io.subBytesOutput
				stateReg(3)(2) := sbox4.io.subBytesOutput
			} otherwise {
				stateReg(0)(3) := addroundkey.io.stateOut(0)
				stateReg(1)(0) := addroundkey.io.stateOut(1)
				stateReg(2)(1) := addroundkey.io.stateOut(2)
				stateReg(3)(2) := addroundkey.io.stateOut(3)
			}
		} otherwise {
			stateReg := shiftrows.io.srOut
			addroundkey.io.stateIn := Vec(stateReg(0)(0), stateReg(1)(1), stateReg(2)(2), stateReg(3)(3))
			addroundkey.io.key := Vec(keyReg(0)(0), keyReg(1)(1), keyReg(2)(2), keyReg(3)(3))
			sbox1.io.subBytesInput := keyReg(0)(3)
			sbox2.io.subBytesInput := keyReg(1)(3)
			sbox3.io.subBytesInput := keyReg(2)(3)
			sbox4.io.subBytesInput := keyReg(3)(3)
			mixcolumns.io.mcIn := Vec(sbox1.io.subBytesOutput, sbox2.io.subBytesOutput, sbox3.io.subBytesOutput, sbox4.io.subBytesOutput)
			for (i <- 0 until 4) {
				keyReg(i)(0) := w0(i)
				keyReg(i)(1) := w1(i)
				keyReg(i)(2) := w2(i)
				keyReg(i)(3) := w3(i)
			}
		}
		
		io.ciphertext := stateToVector(stateReg)
		
		switch(aesState) {
			is(sIdle) {
				aesState := sIdle
				roundCounter.clear()
				stateReg := vectorToState(io.plaintext)
				keyReg := vectorToState(io.key)
				when(io.enable) {
					aesState := sExecute
				}
			}
			
			is(sExecute) {
				aesState := sExecute
				smallCounter.increment()
				when (smallCounter.willOverflow) {
					roundCounter.increment()
					when (U(roundConstant) < 0x80) {
						roundConstant := roundConstant |<< 1
					} otherwise {
						roundConstant := (roundConstant |<< 1) ^ 0x1B
					}
				}
				when (roundCounter.willOverflow) {
					aesState := sFinalRound
				}
				/*when (U(roundConstant) < 0x80) {
					roundConstant := roundConstant |<< 1
				} otherwise {
					roundConstant := (roundConstant |<< 1) ^ 0x1B
				}*/
			}
			
			is (sFinalRound) {
				//stateReg := shiftrows.io.srOut
				smallCounter.increment()
				when (smallCounter.willOverflow) {
					aesState := sDone
				}
			}
			
			is (sDone) {
				smallCounter.increment()
				when (smallCounter.value === 4) {
					io.done := True
				}
			}
		}
	}
	
	
	
	def vectorToState (vec : Bits): Vec[Vec[Bits]] = {
		val ret = Vec(Vec(Bits(8 bits), 4), 4)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				ret(j)(i) := vec(127-i*32-j*8 downto 120-i*32-j*8)
			}
		}
		ret
	}
	
	def stateToVector (state : Vec[Vec[Bits]]): Bits = {
		val ret = Bits(128 bits)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				ret(127-32*i-8*j downto 120-32*i-8*j) := state(j)(i)
			}
		}
		ret
	}
}