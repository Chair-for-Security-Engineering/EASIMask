package AES.Plain

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class AESEncryptWithFSM extends Component {
	val io = new Bundle {
		val reset 			= in  Bool()
		val plaintext 	= in  Bits(128 bits)
		val key 				= in  Bits(128 bits)
		val ciphertext 	= out Bits(128 bits)
		val done 				= out Bool()
	}
	
	val stateReg, keyReg = Reg(Bits(128 bits)) init(0)
	val roundConstant = Reg(Bits(8 bits)) init(1)
	val roundCounter = Counter(1, 9)
	
	val ak = new AddRoundKey
	val sr = new ShiftRows
	val ks = new KeySchedule
	
	ak.io.roundKey := keyReg
	stateReg := ak.io.addRoundKeyOutput
	
	ks.io.keyScheduleInput := keyReg
	ks.io.roundConstant := roundConstant
	keyReg := ks.io.keyScheduleOutput
	
	io.done := False
	io.ciphertext := stateReg
	
	for (i <- 0 until 16) {
		val sb = new SubBytes
		sb.io.subBytesInput := stateReg(127-8*i downto 120-8*i)
		sr.io.shiftRowsInput(127-8*i downto 120-8*i) := sb.io.subBytesOutput
	}
	
	for (i <- 0 until 4) {
		val mc = new MixColumns
		mc.io.mixColumnsInput := sr.io.shiftRowsOutput(127-32*i downto 96-32*i)
		ak.io.addRoundKeyInput(127-32*i downto 96-32*i) := mc.io.mixColumnsOutput
	}
	
	when (U(roundConstant) < 0x80) {
		roundConstant := roundConstant |<< 1
	} otherwise {
		roundConstant := (roundConstant |<< 1) ^ 0x1B
	}
	
	
	val fsm = new StateMachine {
		val sReset = new State with EntryPoint {
				onEntry(roundConstant := 1)
				whenIsActive {
					when (io.reset.fall()) {
						ak.io.addRoundKeyInput := io.plaintext
						ak.io.roundKey := io.key
						ks.io.keyScheduleInput := io.key
						goto(execute)
					}
					//roundConstant := 1
				}
		}
		val execute = new State {
			whenIsActive {
				roundCounter.increment()
				when (roundCounter.willOverflow) {
					goto(lastRound)
				}
			}
		}
		val lastRound = new State {
			whenIsActive {
				ak.io.addRoundKeyInput := sr.io.shiftRowsOutput
				io.ciphertext := ak.io.addRoundKeyOutput
				io.done := True
				exit()
			}
		}
	}
	
	//io.ciphertext := 0
	//io.done := False
}