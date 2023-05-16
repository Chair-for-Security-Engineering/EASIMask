package Cryptol.KECCAK

import spinal.core._

class KECCAK_Wrapper extends Component {
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(2*1600 bits)
		val dataOut 	= out Bits(2*1600 bits)
		val done 			= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val dataInReg = Vec(Reg(Bits(1600 bits)) init (0), 2)
		val dataOutReg = Vec(Reg(Bits(1600 bits)) init (0), 2)
		val enableKeccak = Reg(Bool()) init (False)
		val resetKeccak = Reg(Bool()) init(True)
		
		val sampleInputs, sampleOutputs = Bool()
		
		sampleInputs := False
		sampleOutputs := False
		
		val keccak = new KECCAKMasked
		keccak.io.clk := io.clk
		keccak.io.reset := resetKeccak
		keccak.io.enable := enableKeccak
		keccak.io.in1 := dataInReg(0)
		keccak.io.in2 := dataInReg(1)
		
		when(sampleInputs) {
			//dataInReg(0) := io.dataIn()
			for (i <- 0 until 2) {
				dataInReg(i) := io.dataIn(1600*i+1599 downto 1600*i)
			}
			//keyReg := io.key
		}
		
		when(sampleOutputs) {
			dataOutReg(0) := keccak.io.out1
			dataOutReg(1) := keccak.io.out2
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
				enableKeccak := False
				resetKeccak := True
				when(io.enable) {
					dutState := sLoadData
				}
			}
			
			is(sLoadData) {
				sampleInputs := True
				enableKeccak := True
				resetKeccak := False
				dutState := sExecute
			}
			
			is(sExecute) {
				dutState := sExecute
				when(keccak.io.done) {
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

object generateKECCAK_Wrapper {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/KECCAK/RTL", oneFilePerComponent = false).generate(new KECCAK_Wrapper)
	}
}