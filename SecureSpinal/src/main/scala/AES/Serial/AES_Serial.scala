package AES.Serial

import spinal.core._
import spinal.lib._

object States extends SpinalEnum {
	val sIdle, sInit, sRound, sFinalKeyAdd, sDone = newElement()
}

class AES_Serial extends Component {
	import States._
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val enable 			= in  Bool()
		val plaintext 	= slave  Stream(Bits(8 bits))
		val key 				= slave  Stream(Bits(8 bits))
		val ciphertext 	= master Stream(Bits(8 bits))
		val done 				= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val keyReg 	 = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val aesState = Reg(States()) init(sIdle)
		
		val round = Counter(1, 10)
		val control = Counter(21)
		val roundConstant = Reg(Bits(8 bits)) init(1)
		val rc = Bits(8 bits)
		val finalRound = Bool()
		finalRound := round.value === 10
		
		val addroundkey = new AddRoundKey
		when (aesState === sInit) {
			addroundkey.io.a := io.plaintext.payload
			addroundkey.io.k := io.key.payload
		} otherwise {
			addroundkey.io.a := stateReg(0)(0)
			addroundkey.io.k := keyReg(0)(0)
		}
		
		val sbox = new CanrightSBox
		when (control.value < 16) {
			sbox.io.subBytesInput := addroundkey.io.b
		} otherwise {
			sbox.io.subBytesInput := keyReg(1)(3)
		}
		
		val mixcolumns = new MixColumns
		mixcolumns.io.mcIn1 := stateReg(0)(0)
		mixcolumns.io.mcIn2 := stateReg(1)(0)
		mixcolumns.io.mcIn3 := stateReg(2)(0)
		mixcolumns.io.mcIn4 := stateReg(3)(0)
		
		when (control.value === 17) {
			rc := roundConstant
		} otherwise {
			rc := 0
		}
		
		when (control.value < 16) {
			//Normal transition for stateReg
			stateReg(0)(0) := stateReg(1)(0)
			stateReg(1)(0) := stateReg(2)(0)
			stateReg(2)(0) := stateReg(3)(0)
			stateReg(3)(0) := stateReg(0)(1)
			stateReg(0)(1) := stateReg(1)(1)
			stateReg(1)(1) := stateReg(2)(1)
			stateReg(2)(1) := stateReg(3)(1)
			stateReg(3)(1) := stateReg(0)(2)
			stateReg(0)(2) := stateReg(1)(2)
			stateReg(1)(2) := stateReg(2)(2)
			stateReg(2)(2) := stateReg(3)(2)
			stateReg(3)(2) := stateReg(0)(3)
			stateReg(0)(3) := stateReg(1)(3)
			stateReg(1)(3) := stateReg(2)(3)
			stateReg(2)(3) := stateReg(3)(3)
			stateReg(3)(3) := sbox.io.subBytesOutput
			when (aesState === sFinalKeyAdd) {
				stateReg(3)(3) := addroundkey.io.b
			} elsewhen (aesState === sDone) {
				stateReg(0)(0) := stateReg(0)(1)
				stateReg(1)(0) := stateReg(1)(1)
				stateReg(2)(0) := stateReg(2)(1)
				stateReg(3)(0) := stateReg(3)(1)
				stateReg(0)(1) := stateReg(0)(2)
				stateReg(1)(1) := stateReg(1)(2)
				stateReg(2)(1) := stateReg(2)(2)
				stateReg(3)(1) := stateReg(3)(2)
				stateReg(0)(2) := stateReg(0)(3)
				stateReg(1)(2) := stateReg(1)(3)
				stateReg(2)(2) := stateReg(2)(3)
				stateReg(3)(2) := stateReg(3)(3)
				stateReg(0)(3) := stateReg(1)(0)
				stateReg(1)(3) := stateReg(2)(0)
				stateReg(2)(3) := stateReg(3)(0)
			}
		} elsewhen (control.value === 16 && aesState =/= sFinalKeyAdd) {
			//ShiftRows
			stateReg(0)(0) := stateReg(0)(0)
			stateReg(0)(1) := stateReg(0)(1)
			stateReg(0)(2) := stateReg(0)(2)
			stateReg(0)(3) := stateReg(0)(3)
			stateReg(1)(0) := stateReg(1)(1)
			stateReg(1)(1) := stateReg(1)(2)
			stateReg(1)(2) := stateReg(1)(3)
			stateReg(1)(3) := stateReg(1)(0)
			stateReg(2)(0) := stateReg(2)(2)
			stateReg(2)(1) := stateReg(2)(3)
			stateReg(2)(2) := stateReg(2)(0)
			stateReg(2)(3) := stateReg(2)(1)
			stateReg(3)(0) := stateReg(3)(3)
			stateReg(3)(1) := stateReg(3)(0)
			stateReg(3)(2) := stateReg(3)(1)
			stateReg(3)(3) := stateReg(3)(2)
		} elsewhen (control.value === 16 && aesState === sFinalKeyAdd) {
			stateReg(0)(0) := stateReg(0)(0)
			stateReg(0)(1) := stateReg(1)(0)
			stateReg(0)(2) := stateReg(2)(0)
			stateReg(0)(3) := stateReg(3)(0)
			stateReg(1)(0) := stateReg(0)(1)
			stateReg(1)(1) := stateReg(1)(1)
			stateReg(1)(2) := stateReg(2)(1)
			stateReg(1)(3) := stateReg(3)(1)
			stateReg(2)(0) := stateReg(0)(2)
			stateReg(2)(1) := stateReg(1)(2)
			stateReg(2)(2) := stateReg(2)(2)
			stateReg(2)(3) := stateReg(3)(2)
			stateReg(3)(0) := stateReg(0)(3)
			stateReg(3)(1) := stateReg(1)(3)
			stateReg(3)(2) := stateReg(2)(3)
			stateReg(3)(3) := stateReg(3)(3)
		} otherwise {
			stateReg(0)(0) := stateReg(0)(1)
			stateReg(1)(0) := stateReg(1)(1)
			stateReg(2)(0) := stateReg(2)(1)
			stateReg(3)(0) := stateReg(3)(1)
			stateReg(0)(1) := stateReg(0)(2)
			stateReg(1)(1) := stateReg(1)(2)
			stateReg(2)(1) := stateReg(2)(2)
			stateReg(3)(1) := stateReg(3)(2)
			stateReg(0)(2) := stateReg(0)(3)
			stateReg(1)(2) := stateReg(1)(3)
			stateReg(2)(2) := stateReg(2)(3)
			stateReg(3)(2) := stateReg(3)(3)
			when (!finalRound) {
				stateReg(0)(3) := mixcolumns.io.mcOut1
				stateReg(1)(3) := mixcolumns.io.mcOut2
				stateReg(2)(3) := mixcolumns.io.mcOut3
				stateReg(3)(3) := mixcolumns.io.mcOut4
			} otherwise {
				stateReg(0)(3) := stateReg(0)(0)
				stateReg(1)(3) := stateReg(1)(0)
				stateReg(2)(3) := stateReg(2)(0)
				stateReg(3)(3) := stateReg(3)(0)
			}
		}
		
		when (control.value < 16) {
			//Normal transitions for keyReg
			keyReg(0)(0) := keyReg(1)(0)
			keyReg(1)(0) := keyReg(2)(0)
			keyReg(2)(0) := keyReg(3)(0)
			keyReg(0)(1) := keyReg(1)(1)
			keyReg(1)(1) := keyReg(2)(1)
			keyReg(2)(1) := keyReg(3)(1)
			keyReg(0)(2) := keyReg(1)(2)
			keyReg(1)(2) := keyReg(2)(2)
			keyReg(2)(2) := keyReg(3)(2)
			keyReg(0)(3) := keyReg(1)(3)
			keyReg(1)(3) := keyReg(2)(3)
			keyReg(2)(3) := keyReg(3)(3)
			
			when (aesState === sInit) {
				keyReg(3)(0) := keyReg(0)(1)
				keyReg(3)(1) := keyReg(0)(2)
				keyReg(3)(2) := keyReg(0)(3)
				keyReg(3)(3) := io.key.payload
			} elsewhen (control.value < 12) {
				keyReg(3)(0) := keyReg(0)(0) ^ keyReg(0)(1)
				keyReg(3)(1) := keyReg(0)(2)
				keyReg(3)(2) := keyReg(0)(3)
				keyReg(3)(3) := keyReg(0)(0)
			} otherwise {
				keyReg(3)(0) := keyReg(0)(0)
				keyReg(3)(1) := keyReg(0)(1)
				keyReg(3)(2) := keyReg(0)(2)
				keyReg(3)(3) := keyReg(0)(3)
			}
		} elsewhen (control.value === 16 && aesState === sRound) {
			keyReg(0)(0) := keyReg(0)(1)
			keyReg(1)(0) := keyReg(1)(1)
			keyReg(2)(0) := keyReg(2)(1)
			keyReg(3)(0) := keyReg(3)(1)
			keyReg(0)(1) := keyReg(0)(2)
			keyReg(1)(1) := keyReg(1)(2)
			keyReg(2)(1) := keyReg(2)(2)
			keyReg(3)(1) := keyReg(3)(2)
			keyReg(0)(2) := keyReg(0)(3)
			keyReg(1)(2) := keyReg(1)(3)
			keyReg(2)(2) := keyReg(2)(3)
			keyReg(3)(2) := keyReg(3)(3)
			keyReg(0)(3) := keyReg(0)(0)
			keyReg(1)(3) := keyReg(1)(0)
			keyReg(2)(3) := keyReg(2)(0)
			keyReg(3)(3) := keyReg(3)(0)
		} elsewhen (control.value >= 17) {
			//sbox.io.subBytesInput := keyReg(0)(0)
			keyReg(0)(0) := keyReg(1)(0)
			keyReg(1)(0) := keyReg(2)(0)
			keyReg(2)(0) := keyReg(3)(0)
			keyReg(3)(0) := sbox.io.subBytesOutput ^ keyReg(0)(0) ^ rc
			keyReg(1)(3) := keyReg(2)(3)
			keyReg(2)(3) := keyReg(3)(3)
			keyReg(3)(3) := keyReg(0)(3)
			keyReg(0)(3) := keyReg(1)(3)
		}
		
		io.plaintext.ready := False
		io.key.ready := False
		io.ciphertext.valid := False
		io.ciphertext.payload := 0
		io.done := False
		
		when (control.willOverflow) {
			when (U(roundConstant) < 0x80) {
				roundConstant := roundConstant |<< 1
			} otherwise {
				roundConstant := (roundConstant |<< 1) ^ 0x1B
			}
		}
		
		switch (aesState) {
			is (sIdle) {
				aesState := sInit
				stateReg.foreach(s => s.foreach(x => x := 0))
				keyReg.foreach(s => s.foreach(x => x := 0))
				round.clear()
				control.clear()
				when (io.enable) {
					aesState := sInit
				}
			}
			
			is (sInit) {
				aesState := sInit
				control.increment()
				io.plaintext.ready := True
				io.key.ready := True
				
				when (control.willOverflow) {
					control.clear()
					round.increment()
					aesState := sRound
				}
			}
			
			is (sRound) {
				aesState := sRound
				control.increment()
				when (control.willOverflow) {
					round.increment()
				}
				when (round.willOverflow) {
					aesState := sFinalKeyAdd
				}
			}
			
			is (sFinalKeyAdd) {
				aesState := sFinalKeyAdd
				control.increment()
				when (control.value === 16) {
					aesState := sDone
					control.clear()
				}
			}
			
			is (sDone) {
				aesState := sDone
				control.increment()
				io.ciphertext.valid := True
				io.ciphertext.payload := stateReg(0)(0)
				when (control.value === 15) {
					io.done := True
				}
			}
		}
	}
}