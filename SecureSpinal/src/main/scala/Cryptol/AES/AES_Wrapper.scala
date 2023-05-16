package Cryptol.AES

import spinal.core._

class AES_Wrapper extends Component {
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val resetFull 	= in  Bool()
		val enable 			= in  Bool()
		val dataIn 			= in  Bits(2*128 bits)
		val key 				= in  Bits(2*128 bits)
		val mask 				= in  Bits(760 bits)
		val dataOut 		= out Bits(2*128 bits)
		val done 				= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val dataInReg = Vec(Reg(Bits(128 bits)) init (0), 2)
		val keyReg = Vec(Reg(Bits(128 bits)) init (0), 2)
		val dataOutReg = Vec(Reg(Bits(128 bits)) init (0), 2)
		val enableAES = Reg(Bool()) init (False)
		
		val sampleInputs, sampleOutputs = Bool()
		
		enableAES := False
		
		sampleInputs := False
		sampleOutputs := False
		
		val aes = new AES
		aes.io.clk := io.clk
		aes.io.reset := True
		aes.io.enable := enableAES
		aes.io.pt1 := dataInReg(0)
		aes.io.pt2 := dataInReg(1)
		aes.io.m := io.mask
		aes.io.key1 := keyReg(0)
		aes.io.key2 := keyReg(1)
		
		when(sampleInputs) {
			//dataInReg(0) := io.dataIn()
			for (i <- 0 until 2) {
				dataInReg(i) := io.dataIn(128 * i + 127 downto 128 * i)
				keyReg(i) := io.key(128 * i + 127 downto 128 * i)
			}
			//keyReg := io.key
		}
		
		when(sampleOutputs) {
			dataOutReg(0) := aes.io.ct1
			dataOutReg(1) := aes.io.ct2
		}
		
		io.done := False
		io.dataOut := dataOutReg(0) ## dataOutReg(1)
		
		object States extends SpinalEnum {
			val sIdle, sLoadData, sExecute, sDone = newElement()
		}
		
		import States._
		val dutState = Reg(States()) init (sIdle)
		//dutState := sIdle
		
		switch(dutState) {
			is(sIdle) {
				dutState := sIdle
				when(io.enable) {
					dutState := sLoadData
				}
			}
			
			is(sLoadData) {
				sampleInputs := True
				enableAES := True
				aes.io.reset := False
				dutState := sExecute
			}
			
			is(sExecute) {
				dutState := sExecute
				aes.io.reset := False
				when(aes.io.done) {
					sampleOutputs := True
					dutState := sDone
				}
			}
			
			is(sDone) {
				dutState := sDone
				io.done := True
			}
		}
	}
}

object generateAES_Wrapper {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/AES/RTL", oneFilePerComponent = false).generate(new AES_Wrapper)
	}
}