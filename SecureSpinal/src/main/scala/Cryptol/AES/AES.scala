package Cryptol.AES

import spinal.core._

import spinal.lib.Counter

class AES extends Component {
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val pt1 		= in  Bits(128 bits)
		val pt2 		= in  Bits(128 bits)
		val key1 		= in  Bits(128 bits)
		val key2 		= in  Bits(128 bits)
		val m 			= in  Bits(760 bits)
		val ct1			= out Bits(128 bits)
		val ct2 		= out Bits(128 bits)
		val done 		= out Bool()
	}
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg1, stateReg2 = Reg(Bits(128 bits)) init (0)
		val keyReg1, keyReg2 = Reg(Bits(128 bits)) init(0)
		
		val roundConstant = Reg(Bits(8 bits)) init(1)
		val sampleKeySchedule = Reg(Bool()) init(False)
		val roundCounter = Counter(1, 10)
		val smallCtr = Counter(5)
		
		val keyschedule = new KeySchedule
		keyschedule.io.clk := io.clk
		keyschedule.io.reset := io.reset
		keyschedule.io.sampleInput := False
		keyschedule.io.keyIn1 := keyReg1
		keyschedule.io.keyIn2 := keyReg2
		keyschedule.io.roundConstant := roundConstant
		keyschedule.io.m := io.m(759 downto 608)
		keyReg1 := keyschedule.io.keyOut1
		keyReg2 := keyschedule.io.keyOut2
		
		val addroundkey1, addroundkey2 = new AddRoundKey
		addroundkey1.io.arkIn := stateReg1
		addroundkey1.io.key := keyReg1
		addroundkey2.io.arkIn := stateReg2
		addroundkey2.io.key := keyReg2
		
		val subbytes = new SubBytes
		subbytes.io.clk := io.clk
		subbytes.io.reset := io.reset
		subbytes.io.sbIn1 := addroundkey1.io.arkOut
		subbytes.io.sbIn2 := addroundkey2.io.arkOut
		subbytes.io.mask := io.m(607 downto 0)
		
		val shiftrows1, shiftrows2 = new ShiftRows
		shiftrows1.io.shiftRowsInput := subbytes.io.sbOut1
		shiftrows2.io.shiftRowsInput := subbytes.io.sbOut2
		
		val mixcolumns1, mixcolumns2 = new MixColumns
		mixcolumns1.io.mcIn := shiftrows1.io.shiftRowsOutput
		stateReg1 := mixcolumns1.io.mcOut
		mixcolumns2.io.mcIn := shiftrows2.io.shiftRowsOutput
		stateReg2 := mixcolumns2.io.mcOut
		
		when (roundCounter === 10) {
			stateReg1 := shiftrows1.io.shiftRowsOutput
			stateReg2 := shiftrows2.io.shiftRowsOutput
		}
		
		io.ct1 := addroundkey1.io.arkOut
		io.ct2 := addroundkey2.io.arkOut
		
		object States extends SpinalEnum {
			val sIdle, sExecute, sFinalRound, sDone = newElement()
		}
		
		import States._
		val aesState = Reg(States()) init (sIdle)
		
		switch (aesState) {
			is (sIdle) {
				roundCounter.clear()
				when (io.enable) {
					aesState := sExecute
					keyReg1 := io.key1
					keyReg2 := io.key2
					stateReg1 := io.pt1
					stateReg2 := io.pt2
				}
			}
			
			is (sExecute) {
				smallCtr.increment()
				when (smallCtr.value === 0) {
					keyschedule.io.sampleInput := True
				}
				when (smallCtr.willOverflow) {
					roundCounter.increment()
					when (U(roundConstant) < 0x80) {
						roundConstant := (roundConstant |<< 1)
					} otherwise {
						roundConstant := (roundConstant |<< 1) ^ 0x1B
					}
				}
				when (roundCounter.willOverflow) {
					aesState := sDone
				}
			}
			
			is (sDone) {
				io.done := True
			}
		}
	}
}

object generateHDL {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/AES/RTL", oneFilePerComponent = false).generate(new AES)
	}
}