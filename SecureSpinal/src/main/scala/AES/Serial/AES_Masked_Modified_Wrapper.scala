package AES.Serial

import spinal.core._
import spinal.lib._

class AES_Masked_Modified_Wrapper extends Component {
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(2*128 bits)
		val keyIn 		= in  Bits(2*128 bits)
		val m 				= in  Bits(28 bits)
		val dataOut 	= out Bits(2*128 bits)
		val done 			= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val dataInReg, keyReg, dataOutReg = Vec(Reg(Bits(128 bits)) init(0), 2)
		val resetAES, enableAES, sampleInputs, sampleOutputs = Bool()
		
		val aes = new AES_Masked_Modified
		aes.io.clk := io.clk
		aes.io.reset := resetAES
		aes.io.enable := enableAES
		aes.io.pt1 := dataInReg(0)
		aes.io.pt2 := dataInReg(1)
		aes.io.key1 := keyReg(0)
		aes.io.key2 := keyReg(1)
		aes.io.m := io.m
		
		when (sampleInputs) {
			dataInReg(0) := io.dataIn(255 downto 128)
			dataInReg(1) := io.dataIn(127 downto   0)
			keyReg(0) := io.keyIn(255 downto 128)
			keyReg(1) := io.keyIn(127 downto   0)
		} otherwise {
			dataInReg := dataInReg
			keyReg := keyReg
		}
		
		when (sampleOutputs) {
			dataOutReg(0) := aes.io.ct1
			dataOutReg(1) := aes.io.ct2
		} otherwise {
			dataOutReg := dataOutReg
		}
		
		io.dataOut := dataOutReg(0) ## dataOutReg(1)
		
		object AES_Masked_Modified_States extends SpinalEnum {
			val sIdle, sLoadData, sExecute, sWriteData, sDone = newElement()
		}
		
		import AES_Masked_Modified_States._
		val dutState = Reg(AES_Masked_Modified_States()) init(sIdle)
		
		switch (dutState) {
			is (sIdle) {
				dutState := sIdle
				
				resetAES := True
				enableAES := False
				sampleInputs := False
				sampleOutputs := False
				
				io.done := False
				
				when (io.enable) {
					dutState := sLoadData
				}
			}
			
			is (sLoadData) {
				dutState := sExecute
				
				resetAES := True
				enableAES := False
				sampleInputs := True
				sampleOutputs := False
				
				io.done := False
			}
			
			is (sExecute) {
				dutState := sExecute
				
				resetAES := False
				enableAES := True
				sampleInputs := False
				sampleOutputs := False
				
				io.done := False
				
				when (aes.io.done) {
					dutState := sWriteData
				}
			}
			
			is (sWriteData) {
				dutState := sDone
				
				resetAES := False
				enableAES := False
				sampleInputs := False
				sampleOutputs := True
				
				io.done := False
			}
			
			is (sDone) {
				dutState := sDone
				
				resetAES := True
				enableAES := False
				sampleInputs := False
				sampleOutputs := False
				
				io.done := True
			}
		}
	}
}

object GenerateAES_Masked_Modified_Wrapper {
	def main (args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Masked_Modified_Wrapper)
	}
}