package AES.Serial

import spinal.core._
import spinal.lib._

case class AES_Masked(rounds : Int) extends Component {
	import States2._
	val io = new Bundle {
		val clk 		= in Bool()
		val reset 	= in Bool()
		val enable 	= in Bool()
		val pt1 		= slave Stream(Bits(32 bits))
		val pt2 		= slave Stream(Bits(32 bits))
		val key1 		= slave Stream(Bits(32 bits))
		val key2 		= slave Stream(Bits(32 bits))
		val m 			= in Bits(28 bits)
		val ct1 		= master Stream(Bits(32 bits))
		val ct2 		= master Stream(Bits(32 bits))
		val done 		= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg 	= Vec(Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4), 2)
		val keyReg 		= Vec(Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4), 2)
		val fsmState 	= Reg(States2()) init(sIdle)
		
		val round = Counter(1, rounds)
		val control = Counter(25)
		when (control.willOverflow) {
			round.increment()
		}
		val roundConstant = Reg(Bits(8 bits)) init(1)
		when (control.willOverflow) {
			when (U(roundConstant) < 0x80) {
				roundConstant := roundConstant |<< 1
			} otherwise {
				roundConstant := (roundConstant |<< 1) ^ 0x1B
			}
		}
		
		val rc = Bits(8 bits)
		val initRotation = Bool()
		val stateRotation = Bool()
		val shiftRowsRotation = Bool()
		val mixColumnsRotation, mixColumnsRotation1, mixColumnsRotation2 = Bool()
		val keyRotation = Bool()
		val keyRotation2 = Bool()
		val keySboxRotation = Bool()
		val keyRCRotation = Bool()
		val finalKeyAdd = Bool()
		val finalRound = Bool()
		
		val addroundkey1, addroundkey2 = new AddRoundKey
		addroundkey1.io.a := stateReg(0)(0)(0)
		addroundkey1.io.k := keyReg(0)(0)(0)
		addroundkey2.io.a := stateReg(1)(0)(0)
		addroundkey2.io.k := keyReg(1)(0)(0)
		
		val sbox = new SBoxMasked
		sbox.io.clk := io.clk
		sbox.io.reset := io.reset
		
		when (control.value < 16) {
			sbox.io.sbIn0 := addroundkey1.io.b
			sbox.io.sbIn1 := addroundkey2.io.b
		} otherwise {
			sbox.io.sbIn0 := keyReg(0)(1)(3)
			sbox.io.sbIn1 := keyReg(1)(1)(3)
		}
		sbox.io.m := io.m
		
		
		val mixcolumns1, mixcolumns2 = new MixColumns
		mixcolumns1.io.mcIn1 := stateReg(0)(0)(0)
		mixcolumns1.io.mcIn2 := stateReg(0)(1)(0)
		mixcolumns1.io.mcIn3 := stateReg(0)(2)(0)
		mixcolumns1.io.mcIn4 := stateReg(0)(3)(0)
		mixcolumns2.io.mcIn1 := stateReg(1)(0)(0)
		mixcolumns2.io.mcIn2 := stateReg(1)(1)(0)
		mixcolumns2.io.mcIn3 := stateReg(1)(2)(0)
		mixcolumns2.io.mcIn4 := stateReg(1)(3)(0)
		
		when (stateRotation) {
			stateReg(0)(0)(0) := stateReg(0)(1)(0)
			stateReg(0)(1)(0) := stateReg(0)(2)(0)
			stateReg(0)(2)(0) := stateReg(0)(3)(0)
			stateReg(0)(3)(0) := stateReg(0)(0)(1)
			stateReg(0)(0)(1) := stateReg(0)(1)(1)
			stateReg(0)(1)(1) := stateReg(0)(2)(1)
			stateReg(0)(2)(1) := stateReg(0)(3)(1)
			stateReg(0)(3)(1) := stateReg(0)(0)(2)
			stateReg(0)(0)(2) := stateReg(0)(1)(2)
			stateReg(0)(1)(2) := stateReg(0)(2)(2)
			stateReg(0)(2)(2) := stateReg(0)(3)(2)
			stateReg(0)(3)(2) := stateReg(0)(0)(3)
			stateReg(0)(0)(3) := stateReg(0)(1)(3)
			stateReg(0)(1)(3) := stateReg(0)(2)(3)
			stateReg(0)(2)(3) := stateReg(0)(3)(3)
			stateReg(0)(3)(3) := sbox.io.sbOut0
			when (finalKeyAdd) {
				stateReg(0)(3)(3) := addroundkey1.io.b
			}
			
			stateReg(1)(0)(0) := stateReg(1)(1)(0)
			stateReg(1)(1)(0) := stateReg(1)(2)(0)
			stateReg(1)(2)(0) := stateReg(1)(3)(0)
			stateReg(1)(3)(0) := stateReg(1)(0)(1)
			stateReg(1)(0)(1) := stateReg(1)(1)(1)
			stateReg(1)(1)(1) := stateReg(1)(2)(1)
			stateReg(1)(2)(1) := stateReg(1)(3)(1)
			stateReg(1)(3)(1) := stateReg(1)(0)(2)
			stateReg(1)(0)(2) := stateReg(1)(1)(2)
			stateReg(1)(1)(2) := stateReg(1)(2)(2)
			stateReg(1)(2)(2) := stateReg(1)(3)(2)
			stateReg(1)(3)(2) := stateReg(1)(0)(3)
			stateReg(1)(0)(3) := stateReg(1)(1)(3)
			stateReg(1)(1)(3) := stateReg(1)(2)(3)
			stateReg(1)(2)(3) := stateReg(1)(3)(3)
			stateReg(1)(3)(3) := sbox.io.sbOut1
			when (finalKeyAdd) {
				stateReg(1)(3)(3) := addroundkey2.io.b
			}
		} elsewhen (shiftRowsRotation) {
			stateReg(0)(0)(0) := stateReg(0)(0)(0)
			stateReg(0)(0)(1) := stateReg(0)(0)(1)
			stateReg(0)(0)(2) := stateReg(0)(0)(2)
			stateReg(0)(0)(3) := stateReg(0)(0)(3)
			stateReg(0)(1)(0) := stateReg(0)(1)(1)
			stateReg(0)(1)(1) := stateReg(0)(1)(2)
			stateReg(0)(1)(2) := stateReg(0)(1)(3)
			stateReg(0)(1)(3) := stateReg(0)(1)(0)
			stateReg(0)(2)(0) := stateReg(0)(2)(2)
			stateReg(0)(2)(1) := stateReg(0)(2)(3)
			stateReg(0)(2)(2) := stateReg(0)(2)(0)
			stateReg(0)(2)(3) := stateReg(0)(2)(1)
			stateReg(0)(3)(0) := stateReg(0)(3)(3)
			stateReg(0)(3)(1) := stateReg(0)(3)(0)
			stateReg(0)(3)(2) := stateReg(0)(3)(1)
			stateReg(0)(3)(3) := stateReg(0)(3)(2)
			
			stateReg(1)(0)(0) := stateReg(1)(0)(0)
			stateReg(1)(0)(1) := stateReg(1)(0)(1)
			stateReg(1)(0)(2) := stateReg(1)(0)(2)
			stateReg(1)(0)(3) := stateReg(1)(0)(3)
			stateReg(1)(1)(0) := stateReg(1)(1)(1)
			stateReg(1)(1)(1) := stateReg(1)(1)(2)
			stateReg(1)(1)(2) := stateReg(1)(1)(3)
			stateReg(1)(1)(3) := stateReg(1)(1)(0)
			stateReg(1)(2)(0) := stateReg(1)(2)(2)
			stateReg(1)(2)(1) := stateReg(1)(2)(3)
			stateReg(1)(2)(2) := stateReg(1)(2)(0)
			stateReg(1)(2)(3) := stateReg(1)(2)(1)
			stateReg(1)(3)(0) := stateReg(1)(3)(3)
			stateReg(1)(3)(1) := stateReg(1)(3)(0)
			stateReg(1)(3)(2) := stateReg(1)(3)(1)
			stateReg(1)(3)(3) := stateReg(1)(3)(2)
		} elsewhen (mixColumnsRotation) {
			when (mixColumnsRotation1) {
				stateReg(0)(0)(0) := stateReg(0)(0)(1)
				stateReg(0)(1)(0) := stateReg(0)(1)(1)
				stateReg(0)(2)(0) := stateReg(0)(2)(1)
				stateReg(0)(3)(0) := stateReg(0)(3)(1)
				stateReg(0)(0)(1) := stateReg(0)(0)(2)
				stateReg(0)(1)(1) := stateReg(0)(1)(2)
				stateReg(0)(2)(1) := stateReg(0)(2)(2)
				stateReg(0)(3)(1) := stateReg(0)(3)(2)
				stateReg(0)(0)(2) := stateReg(0)(0)(3)
				stateReg(0)(1)(2) := stateReg(0)(1)(3)
				stateReg(0)(2)(2) := stateReg(0)(2)(3)
				stateReg(0)(3)(2) := stateReg(0)(3)(3)
				stateReg(0)(0)(3) := mixcolumns1.io.mcOut1
				stateReg(0)(1)(3) := mixcolumns1.io.mcOut2
				stateReg(0)(2)(3) := mixcolumns1.io.mcOut3
				stateReg(0)(3)(3) := mixcolumns1.io.mcOut4
				when(initRotation) {
					stateReg(0)(0)(3) := io.pt1.payload(31 downto 24)
					stateReg(0)(1)(3) := io.pt1.payload(23 downto 16)
					stateReg(0)(2)(3) := io.pt1.payload(15 downto 8)
					stateReg(0)(3)(3) := io.pt1.payload(7 downto 0)
				}
				when(finalRound) {
					stateReg(0)(0)(3) := stateReg(0)(0)(0)
					stateReg(0)(1)(3) := stateReg(0)(1)(0)
					stateReg(0)(2)(3) := stateReg(0)(2)(0)
					stateReg(0)(3)(3) := stateReg(0)(3)(0)
				}
			}
			
			when (mixColumnsRotation2) {
				stateReg(1)(0)(0) := stateReg(1)(0)(1)
				stateReg(1)(1)(0) := stateReg(1)(1)(1)
				stateReg(1)(2)(0) := stateReg(1)(2)(1)
				stateReg(1)(3)(0) := stateReg(1)(3)(1)
				stateReg(1)(0)(1) := stateReg(1)(0)(2)
				stateReg(1)(1)(1) := stateReg(1)(1)(2)
				stateReg(1)(2)(1) := stateReg(1)(2)(2)
				stateReg(1)(3)(1) := stateReg(1)(3)(2)
				stateReg(1)(0)(2) := stateReg(1)(0)(3)
				stateReg(1)(1)(2) := stateReg(1)(1)(3)
				stateReg(1)(2)(2) := stateReg(1)(2)(3)
				stateReg(1)(3)(2) := stateReg(1)(3)(3)
				stateReg(1)(0)(3) := mixcolumns2.io.mcOut1
				stateReg(1)(1)(3) := mixcolumns2.io.mcOut2
				stateReg(1)(2)(3) := mixcolumns2.io.mcOut3
				stateReg(1)(3)(3) := mixcolumns2.io.mcOut4
				when (initRotation) {
					stateReg(1)(0)(3) := io.pt2.payload(31 downto 24)
					stateReg(1)(1)(3) := io.pt2.payload(23 downto 16)
					stateReg(1)(2)(3) := io.pt2.payload(15 downto  8)
					stateReg(1)(3)(3) := io.pt2.payload( 7 downto  0)}
				when(finalRound) {
					stateReg(1)(0)(3) := stateReg(1)(0)(0)
					stateReg(1)(1)(3) := stateReg(1)(1)(0)
					stateReg(1)(2)(3) := stateReg(1)(2)(0)
					stateReg(1)(3)(3) := stateReg(1)(3)(0)
				}
			}
		}
		
		when (initRotation) {
			when (mixColumnsRotation1) {
				keyReg(0)(0)(3) := io.key1.payload(31 downto 24)
				keyReg(0)(1)(3) := io.key1.payload(23 downto 16)
				keyReg(0)(2)(3) := io.key1.payload(15 downto 8)
				keyReg(0)(3)(3) := io.key1.payload(7 downto 0)
				keyReg(0)(0)(0) := keyReg(0)(0)(1)
				keyReg(0)(0)(1) := keyReg(0)(0)(2)
				keyReg(0)(0)(2) := keyReg(0)(0)(3)
				keyReg(0)(1)(0) := keyReg(0)(1)(1)
				keyReg(0)(1)(1) := keyReg(0)(1)(2)
				keyReg(0)(1)(2) := keyReg(0)(1)(3)
				keyReg(0)(2)(0) := keyReg(0)(2)(1)
				keyReg(0)(2)(1) := keyReg(0)(2)(2)
				keyReg(0)(2)(2) := keyReg(0)(2)(3)
				keyReg(0)(3)(0) := keyReg(0)(3)(1)
				keyReg(0)(3)(1) := keyReg(0)(3)(2)
				keyReg(0)(3)(2) := keyReg(0)(3)(3)
			}
			
			when (mixColumnsRotation2) {
				keyReg(1)(0)(3) := io.key2.payload(31 downto 24)
				keyReg(1)(1)(3) := io.key2.payload(23 downto 16)
				keyReg(1)(2)(3) := io.key2.payload(15 downto 8)
				keyReg(1)(3)(3) := io.key2.payload(7 downto 0)
				keyReg(1)(0)(0) := keyReg(1)(0)(1)
				keyReg(1)(0)(1) := keyReg(1)(0)(2)
				keyReg(1)(0)(2) := keyReg(1)(0)(3)
				keyReg(1)(1)(0) := keyReg(1)(1)(1)
				keyReg(1)(1)(1) := keyReg(1)(1)(2)
				keyReg(1)(1)(2) := keyReg(1)(1)(3)
				keyReg(1)(2)(0) := keyReg(1)(2)(1)
				keyReg(1)(2)(1) := keyReg(1)(2)(2)
				keyReg(1)(2)(2) := keyReg(1)(2)(3)
				keyReg(1)(3)(0) := keyReg(1)(3)(1)
				keyReg(1)(3)(1) := keyReg(1)(3)(2)
				keyReg(1)(3)(2) := keyReg(1)(3)(3)
			}
		}	elsewhen (keyRotation) {
			keyReg(0)(0)(0) := keyReg(0)(1)(0)
			keyReg(0)(1)(0) := keyReg(0)(2)(0)
			keyReg(0)(2)(0) := keyReg(0)(3)(0)
			keyReg(0)(0)(1) := keyReg(0)(1)(1)
			keyReg(0)(1)(1) := keyReg(0)(2)(1)
			keyReg(0)(2)(1) := keyReg(0)(3)(1)
			keyReg(0)(0)(2) := keyReg(0)(1)(2)
			keyReg(0)(1)(2) := keyReg(0)(2)(2)
			keyReg(0)(2)(2) := keyReg(0)(3)(2)
			keyReg(0)(0)(3) := keyReg(0)(1)(3)
			keyReg(0)(1)(3) := keyReg(0)(2)(3)
			keyReg(0)(2)(3) := keyReg(0)(3)(3)
			keyReg(0)(3)(0) := keyReg(0)(0)(1)
			keyReg(0)(3)(1) := keyReg(0)(0)(2)
			keyReg(0)(3)(2) := keyReg(0)(0)(3)
			keyReg(0)(3)(3) := keyReg(0)(0)(0)
			
			keyReg(1)(0)(0) := keyReg(1)(1)(0)
			keyReg(1)(1)(0) := keyReg(1)(2)(0)
			keyReg(1)(2)(0) := keyReg(1)(3)(0)
			keyReg(1)(0)(1) := keyReg(1)(1)(1)
			keyReg(1)(1)(1) := keyReg(1)(2)(1)
			keyReg(1)(2)(1) := keyReg(1)(3)(1)
			keyReg(1)(0)(2) := keyReg(1)(1)(2)
			keyReg(1)(1)(2) := keyReg(1)(2)(2)
			keyReg(1)(2)(2) := keyReg(1)(3)(2)
			keyReg(1)(0)(3) := keyReg(1)(1)(3)
			keyReg(1)(1)(3) := keyReg(1)(2)(3)
			keyReg(1)(2)(3) := keyReg(1)(3)(3)
			keyReg(1)(3)(0) := keyReg(1)(0)(1)
			keyReg(1)(3)(1) := keyReg(1)(0)(2)
			keyReg(1)(3)(2) := keyReg(1)(0)(3)
			keyReg(1)(3)(3) := keyReg(1)(0)(0)
			
			when (keyRotation2) {
				keyReg(0)(3)(0) := keyReg(0)(0)(0) ^ keyReg(0)(0)(1)
				keyReg(0)(3)(1) := keyReg(0)(0)(2)
				keyReg(0)(3)(2) := keyReg(0)(0)(3)
				keyReg(0)(3)(3) := keyReg(0)(0)(0)
				
				keyReg(1)(3)(0) := keyReg(1)(0)(0) ^ keyReg(1)(0)(1)
				keyReg(1)(3)(1) := keyReg(1)(0)(2)
				keyReg(1)(3)(2) := keyReg(1)(0)(3)
				keyReg(1)(3)(3) := keyReg(1)(0)(0)
			}
		} elsewhen (keySboxRotation) {
			keyReg(0)(1)(3) := keyReg(0)(2)(3)
			keyReg(0)(2)(3) := keyReg(0)(3)(3)
			keyReg(0)(3)(3) := keyReg(0)(0)(3)
			keyReg(0)(0)(3) := keyReg(0)(1)(3)
			
			keyReg(1)(1)(3) := keyReg(1)(2)(3)
			keyReg(1)(2)(3) := keyReg(1)(3)(3)
			keyReg(1)(3)(3) := keyReg(1)(0)(3)
			keyReg(1)(0)(3) := keyReg(1)(1)(3)
		} elsewhen (keyRCRotation) {
			keyReg(0)(0)(0) := keyReg(0)(1)(0)
			keyReg(0)(1)(0) := keyReg(0)(2)(0)
			keyReg(0)(2)(0) := keyReg(0)(3)(0)
			keyReg(0)(3)(0) := sbox.io.sbOut0 ^ keyReg(0)(0)(0) ^ rc
			
			keyReg(1)(0)(0) := keyReg(1)(1)(0)
			keyReg(1)(1)(0) := keyReg(1)(2)(0)
			keyReg(1)(2)(0) := keyReg(1)(3)(0)
			keyReg(1)(3)(0) := sbox.io.sbOut1 ^ keyReg(1)(0)(0)
		}
		
		io.pt1.ready := False
		io.pt2.ready := False
		io.key1.ready := False
		io.key2.ready := False
		io.ct1.valid := False
		io.ct2.valid := False
		io.ct1.payload := stateReg(0)(0)(0) ## stateReg(0)(1)(0) ## stateReg(0)(2)(0) ## stateReg(0)(3)(0)
		io.ct2.payload := stateReg(1)(0)(0) ## stateReg(1)(1)(0) ## stateReg(1)(2)(0) ## stateReg(1)(3)(0)
		io.done := False
		
		switch (fsmState) {
			is (sIdle) {
				fsmState := sIdle
				
				stateReg(0).foreach(a => a.foreach(b => b := 0))
				stateReg(1).foreach(a => a.foreach(b => b := 0))
				keyReg(0).foreach(a => a.foreach(b => b := 0))
				keyReg(1).foreach(a => a.foreach(b => b := 0))
				round.clear()
				control.clear()
				roundConstant := 1
				
				initRotation := False
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				mixColumnsRotation1 := False
				mixColumnsRotation2 := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				when (io.enable) {
					fsmState := sInit
				}
			}
			
			is (sInit) {
				fsmState := sInit
				
				initRotation := False
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				mixColumnsRotation1 := False
				mixColumnsRotation2 := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				when (control.value < 4) {
					io.pt1.ready := True
					io.key1.ready := True
				} otherwise {
					io.pt2.ready := True
					io.key2.ready := True
				}
				
				when ((io.pt1.fire && io.key1.fire) || (io.pt2.fire && io.key2.fire)) {
					control.increment()
				}
				
				when (io.pt1.fire && io.key1.fire) {
					mixColumnsRotation := True
					mixColumnsRotation1 := True
					initRotation := True
				}
				when (io.pt2.fire && io.key2.fire) {
					mixColumnsRotation := True
					mixColumnsRotation2 := True
					initRotation := True
				}
				
				when (control.value === 7) {
					fsmState := sRound
					control.clear()
				}
			}
			
			is (sRound) {
				fsmState := sRound
				
				initRotation := False
				control.increment()
				finalRound := round.value === round.end-1
				finalKeyAdd := round.value === round.end
				
				when (control.value < 20) {
					stateRotation := True
					when (control.value === 15 && round.value === round.end) {
						fsmState := sDone
						control.clear()
					}
				} otherwise {
					stateRotation := False
				}
				
				when (control.value === 20) {
					shiftRowsRotation := True
				} otherwise {
					shiftRowsRotation := False
				}
				
				when (control.value > 20) {
					mixColumnsRotation := True
					mixColumnsRotation1 := True
					mixColumnsRotation2 := True
				} otherwise {
					mixColumnsRotation := False
					mixColumnsRotation1 := False
					mixColumnsRotation2 := False
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
				
				when (control.value >= 16 && control.value < 20) {
					keySboxRotation := True
				} otherwise {
					keySboxRotation := False
				}
				
				when (control.value === 20) {
					rc := roundConstant
				} otherwise {
					rc := 0
				}
				
				when (control.value >= 20 && control.value < 24) {
					keyRCRotation := True
				} otherwise {
					keyRCRotation := False
				}
			}
			
			is (sDone) {
				fsmState := sDone
				
				initRotation := False
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				mixColumnsRotation1 := False
				mixColumnsRotation2 := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				when (control < 4) {
					io.ct1.valid := True
				} otherwise {
					io.ct2.valid := True
				}
				
				when (io.ct1.fire) {
					control.increment()
					mixColumnsRotation := True
					mixColumnsRotation1 := True
					finalRound := True
					
				}
				
				when (io.ct2.fire) {
					control.increment()
					mixColumnsRotation := True
					mixColumnsRotation2 := True
					finalRound := True
				}
				
				when (control.value === 8) {
					io.done := True
					fsmState := sIdle
				}
			}
		}
	}
}

object GenerateAESMasked {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Masked(11))
		SpinalConfig(mode = Verilog, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Masked(11))
	}
}