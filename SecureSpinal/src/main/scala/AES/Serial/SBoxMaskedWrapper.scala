package AES.Serial

import spinal.core._
import spinal.lib._

class SBoxMaskedWrapper extends Component {
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(2*8 bits)
		val m 				= in  Bits(28 bits)
		val dataOut 	= out Bits(2*8 bits)
		val done 			= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val dataInReg, dataOutReg = Vec(Reg(Bits(8 bits)) init(0), 2)
		val resetSBox, sampleInputs, sampleOutputs = Bool()
		val ctr = Counter(0, 3)
		
		val sbox = new SBoxMasked
		sbox.io.clk := io.clk
		sbox.io.reset := resetSBox
		sbox.io.sbIn0 := dataInReg(0)
		sbox.io.sbIn1 := dataInReg(1)
		sbox.io.m := io.m
		
		when (sampleInputs) {
			dataInReg(0) := io.dataIn(15 downto 8)
			dataInReg(1) := io.dataIn( 7 downto 0)
		} otherwise {
			dataInReg := dataInReg
		}
		
		when (sampleOutputs) {
			dataOutReg(0) := sbox.io.sbOut0
			dataOutReg(1) := sbox.io.sbOut1
		} otherwise {
			dataOutReg := dataOutReg
		}
		
		io.dataOut := dataOutReg(0) ## dataOutReg(1)
		
		object SBoxMaskedWrapperStates extends SpinalEnum {
			val sIdle, sLoadData, sExecute, sWriteData, sDone = newElement()
		}
		
		import SBoxMaskedWrapperStates._
		val dutState = Reg(SBoxMaskedWrapperStates()) init(sIdle)
		
		switch (dutState) {
			is (sIdle) {
				dutState := sIdle
				
				resetSBox := True
				sampleInputs := False
				sampleOutputs := False
				io.done := False
				
				ctr.clear()
				
				when (io.enable) {
					dutState := sLoadData
				}
			}
			
			is (sLoadData) {
				dutState := sExecute
				
				resetSBox := True
				sampleInputs := True
				sampleOutputs := False
				io.done := False
				
				ctr.clear()
			}
			
			is (sExecute) {
				dutState := sExecute
				
				resetSBox := False
				sampleInputs := False
				sampleOutputs := False
				io.done := False
				
				ctr.increment()
				
				when (ctr.willOverflow) {
					ctr.clear()
					dutState := sWriteData
				}
			}
			
			is (sWriteData) {
				dutState := sDone
				
				resetSBox := False
				sampleInputs := False
				sampleOutputs := True
				io.done := False
			}
			
			is (sDone) {
				dutState := sDone
				
				resetSBox := True
				sampleInputs := False
				sampleOutputs := False
				io.done := True
			}
		}
	}
}

object generateSBoxMaskedWrapper {
	def main (args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new SBoxMaskedWrapper)
	}
}