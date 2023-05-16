package AES.Serial

import spinal.core._
import spinal.lib._

object States2 extends SpinalEnum {
	val sIdle, sInit, sRound, sDone = newElement()
}

/**
	* A serial AES implementation where the number of rounds can be changed.
	* Will execute rounds-1 normal rounds and the final round without MixColumns.
	* The minimum value for rounds should be 2 (one normal and one final round)
	* @param rounds The number of rounds
	*/
case class AES(rounds : Int) extends Component {
	import States2._
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val pt 			= slave  Stream(Bits(32 bits))
		val key 		= slave  Stream(Bits(32 bits))
		val ct 			= master Stream(Bits(32 bits))
		val done 		= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val keyReg 	 = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val aesState = Reg(States2()) init(sIdle)
		
		val round = Counter(1, rounds)
		val control = Counter(21)
		when (control.willOverflow) {
			round.increment()
		}
		val roundConstant = Reg(Bits(8 bits)) init(1)
		val rc = Bits(8 bits)
		val finalKeyAdd = Bool()
		val finalRound = Bool()
		val initRotation = Bool()
		val stateRotation = Bool()
		val shiftRowsRotation = Bool()
		val mixColumnsRotation = Bool()
		val keyRotation = Bool()
		val keyRotation2 = Bool()
		val keyRCRotation = Bool()
		val finalRotation = Bool()
		
		val addroundkey = new AddRoundKey
		addroundkey.io.a := stateReg(0)(0)
		addroundkey.io.k := keyReg(0)(0)
		
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
		
		when (initRotation) {
			//Get input into state, take output out in the end
			stateReg(0)(0) := stateReg(0)(1)
			stateReg(0)(1) := stateReg(0)(2)
			stateReg(0)(2) := stateReg(0)(3)
			stateReg(0)(3) := io.pt.payload(31 downto 24)
			stateReg(1)(0) := stateReg(1)(1)
			stateReg(1)(1) := stateReg(1)(2)
			stateReg(1)(2) := stateReg(1)(3)
			stateReg(1)(3) := io.pt.payload(23 downto 16)
			stateReg(2)(0) := stateReg(2)(1)
			stateReg(2)(1) := stateReg(2)(2)
			stateReg(2)(2) := stateReg(2)(3)
			stateReg(2)(3) := io.pt.payload(15 downto  8)
			stateReg(3)(0) := stateReg(3)(1)
			stateReg(3)(1) := stateReg(3)(2)
			stateReg(3)(2) := stateReg(3)(3)
			stateReg(3)(3) := io.pt.payload( 7 downto  0)
			when (finalRotation) {
				stateReg(0)(3) := stateReg(0)(0)
				stateReg(1)(3) := stateReg(1)(0)
				stateReg(2)(3) := stateReg(2)(0)
				stateReg(3)(3) := stateReg(3)(0)
			}
		} elsewhen (stateRotation) {
			//Normal movement of the state during a round, output of the SBox is input again at the end of the state
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
			when (finalKeyAdd) {
				stateReg(3)(3) := addroundkey.io.b
			}
		} elsewhen (shiftRowsRotation) {
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
		} elsewhen (mixColumnsRotation) {
			//MixColumns or skip MixColumns in the final round
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
			stateReg(0)(3) := mixcolumns.io.mcOut1
			stateReg(1)(3) := mixcolumns.io.mcOut2
			stateReg(2)(3) := mixcolumns.io.mcOut3
			stateReg(3)(3) := mixcolumns.io.mcOut4
			when (finalRound)  {
				stateReg(0)(3) := stateReg(0)(0)
				stateReg(1)(3) := stateReg(1)(0)
				stateReg(2)(3) := stateReg(2)(0)
				stateReg(3)(3) := stateReg(3)(0)
			}
		}
		
		when (initRotation) {
			//Get key into the keyReg
			keyReg(0)(0) := keyReg(0)(1)
			keyReg(0)(1) := keyReg(0)(2)
			keyReg(0)(2) := keyReg(0)(3)
			keyReg(0)(3) := io.key.payload(31 downto 24)
			keyReg(1)(0) := keyReg(1)(1)
			keyReg(1)(1) := keyReg(1)(2)
			keyReg(1)(2) := keyReg(1)(3)
			keyReg(1)(3) := io.key.payload(23 downto 16)
			keyReg(2)(0) := keyReg(2)(1)
			keyReg(2)(1) := keyReg(2)(2)
			keyReg(2)(2) := keyReg(2)(3)
			keyReg(2)(3) := io.key.payload(15 downto  8)
			keyReg(3)(0) := keyReg(3)(1)
			keyReg(3)(1) := keyReg(3)(2)
			keyReg(3)(2) := keyReg(3)(3)
			keyReg(3)(3) := io.key.payload( 7 downto  0)
		} elsewhen (keyRotation) {
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
			keyReg(3)(0) := keyReg(0)(1)
			keyReg(3)(1) := keyReg(0)(2)
			keyReg(3)(2) := keyReg(0)(3)
			keyReg(3)(3) := keyReg(0)(0)
			
			when (keyRotation2) {
				keyReg(3)(0) := keyReg(0)(0) ^ keyReg(0)(1)
				keyReg(3)(1) := keyReg(0)(2)
				keyReg(3)(2) := keyReg(0)(3)
				keyReg(3)(3) := keyReg(0)(0)
			}
			
		} elsewhen (keyRCRotation) {
			keyReg(0)(0) := keyReg(1)(0)
			keyReg(1)(0) := keyReg(2)(0)
			keyReg(2)(0) := keyReg(3)(0)
			keyReg(3)(0) := sbox.io.subBytesOutput ^ keyReg(0)(0) ^ rc
			keyReg(1)(3) := keyReg(2)(3)
			keyReg(2)(3) := keyReg(3)(3)
			keyReg(3)(3) := keyReg(0)(3)
			keyReg(0)(3) := keyReg(1)(3)
		}
		
		io.pt.ready := False
		io.key.ready := False
		io.ct.valid := False
		io.ct.payload := stateReg(0)(0) ## stateReg(1)(0) ## stateReg(2)(0) ## stateReg(3)(0)
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
				aesState := sIdle
				
				initRotation := False
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keyRCRotation := False
				finalRotation := False
				finalRound := False
				finalKeyAdd := False
				
				stateReg.foreach(s => s.foreach(x => x := 0))
				keyReg.foreach(s => s.foreach(x => x := 0))
				round.clear()
				control.clear()
				roundConstant := 1
				when (io.enable) {
					aesState := sInit
				}
			}
			
			is (sInit) {
				aesState := sInit
				
				initRotation := False
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keyRCRotation := False
				finalRotation := False
				finalRound := False
				finalKeyAdd := False
				
				io.pt.ready := True
				io.key.ready := True
				
				when (io.pt.fire && io.key.fire) {
					initRotation := True
					control.increment()
				}
				
				when (control.value === 3) {
					control.clear()
					aesState := sRound
				}
			}
			
			is (sRound) {
				aesState := sRound
				
				initRotation := False
				finalRotation := False
				finalRound := round.value === round.end-1
				finalKeyAdd := round.value === round.end
				
				when (control.value < 16) {
					stateRotation := True
				} otherwise {
					stateRotation := False
				}
				
				when (control.value === 16) {
					shiftRowsRotation := True
				} otherwise {
					shiftRowsRotation := False
				}
				
				when (control.value > 16) {
					mixColumnsRotation := True
				} otherwise {
					mixColumnsRotation := False
				}
				
				when (control.value < 16) {
					keyRotation := True
					when (control.value < 12 && round.value > 1) {
						keyRotation2 := True
					} otherwise {
						keyRotation2 := False
					}
				} otherwise {
					keyRotation := False
					keyRotation2 := False
				}
				
				when (control.value >= 17) {
					keyRCRotation := True
				} otherwise {
					keyRCRotation := False
				}
				
				control.increment()
				when (round.value === round.end && control.value === 15) {
					aesState := sDone
					control.clear()
				}
			}
			
			is (sDone) {
				aesState := sDone
				
				initRotation := True
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keyRCRotation := False
				finalRotation := True
				finalRound := False
				finalKeyAdd := False
				
				io.ct.valid := True
				when (io.ct.fire) {
					control.increment()
					when (control.value === 3) {
						io.done := True
						aesState := sIdle
					}
				}
			}
		}
	}
}

object AES extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "C:\\Users\\fabusbo\\Desktop\\VE" +
	 "-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES(rounds = 11))
	SpinalConfig(mode = Verilog, targetDirectory = "C:\\Users\\fabusbo\\Desktop" +
	 "\\VE-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES(rounds = 11))
}