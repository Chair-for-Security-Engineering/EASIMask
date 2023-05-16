package AES.Serial

import spinal.core._
import spinal.lib._

class AES_Masked_Wrapper extends Component {
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset			= in  Bool()
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(2*128 bits)
		val key 			= in  Bits(2*128 bits)
		val m 				= in  Bits(28 bits)
		val dataOut 	= out Bits(2*128 bits)
		val done 			= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val dataInReg0 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val dataInReg1 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val keyReg0 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val keyReg1 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val dataOutReg0 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val dataOutReg1 = Vec(Reg(Bits(32 bits)) init(0), 4)
		val enableAES, resetAES = Bool()
		val ctr = Counter(0, 7)
		
		val sampleInputs, sampleOutputs = Bool()
		
		val aesMasked = new AES_Masked(11)
		aesMasked.io.clk := io.clk
		aesMasked.io.reset := resetAES
		aesMasked.io.enable := enableAES
		
		aesMasked.io.pt1.valid := False
		aesMasked.io.key1.valid := False
		aesMasked.io.pt1.payload := dataInReg0(ctr.value(1 downto 0))
		aesMasked.io.pt2.payload := dataInReg1(ctr.value(1 downto 0))
		
		aesMasked.io.pt2.valid := False
		aesMasked.io.key2.valid := False
		aesMasked.io.key1.payload := keyReg0(ctr.value(1 downto 0))
		aesMasked.io.key2.payload := keyReg1(ctr.value(1 downto 0))
		
		aesMasked.io.ct1.ready := False
		aesMasked.io.ct2.ready := False
		aesMasked.io.m := io.m
		io.dataOut := dataOutReg0(0) ## dataOutReg0(1) ## dataOutReg0(2) ## dataOutReg0(3) ## dataOutReg1(0) ## dataOutReg1(1) ## dataOutReg1(2) ## dataOutReg1(3)
		io.done := False
		
		when (sampleInputs) {
			dataInReg0(0) := io.dataIn(255 downto 224)
			dataInReg0(1) := io.dataIn(223 downto 192)
			dataInReg0(2) := io.dataIn(191 downto 160)
			dataInReg0(3) := io.dataIn(159 downto 128)
			dataInReg1(0) := io.dataIn(127 downto  96)
			dataInReg1(1) := io.dataIn( 95 downto  64)
			dataInReg1(2) := io.dataIn( 63 downto  32)
			dataInReg1(3) := io.dataIn( 31 downto   0)
			keyReg0(0) := io.key(255 downto 224)
			keyReg0(1) := io.key(223 downto 192)
			keyReg0(2) := io.key(191 downto 160)
			keyReg0(3) := io.key(159 downto 128)
			keyReg1(0) := io.key(127 downto  96)
			keyReg1(1) := io.key( 95 downto  64)
			keyReg1(2) := io.key( 63 downto  32)
			keyReg1(3) := io.key( 31 downto   0)
		} otherwise {
			dataInReg0 := dataInReg0
			dataInReg1 := dataInReg1
			keyReg0 := keyReg0
			keyReg1 := keyReg1
		}
		
		when (sampleOutputs) {
			when (aesMasked.io.ct1.fire) {
				dataOutReg0(0) := dataOutReg0(1)
				dataOutReg0(1) := dataOutReg0(2)
				dataOutReg0(2) := dataOutReg0(3)
				dataOutReg0(3) := aesMasked.io.ct1.payload
			}
			when (aesMasked.io.ct2.fire) {
				dataOutReg1(0) := dataOutReg1(1)
				dataOutReg1(1) := dataOutReg1(2)
				dataOutReg1(2) := dataOutReg1(3)
				dataOutReg1(3) := aesMasked.io.ct2.payload
			}
		} otherwise {
			dataOutReg0 := dataOutReg0
			dataOutReg1 := dataOutReg1
		}
		
		object States extends SpinalEnum {
			val sIdle, sLoadData, sExecute, sWriteData, sDone = newElement()
		}
		
		import States._
		val dutState = Reg(States()) init (sIdle)
		
		switch (dutState) {
			is (sIdle) {
				dutState := sIdle
				
				sampleInputs := False
				sampleOutputs := False
				
				resetAES := True
				enableAES := False
				
				ctr.clear()
				when (io.enable) {
					dutState := sLoadData
				}
			}
			
			is (sLoadData) {
				dutState := sExecute
				
				sampleInputs := True
				sampleOutputs := False
				
				resetAES := True
				enableAES := False
			}
			
			is (sExecute) {
				dutState := sExecute
				
				sampleInputs := False
				sampleOutputs := False
				
				resetAES := False
				enableAES := True
				
				when (aesMasked.io.pt1.ready && aesMasked.io.key1.ready) {
					aesMasked.io.pt1.valid := True
					aesMasked.io.key1.valid := True
					ctr.increment()
				}
				
				when (aesMasked.io.pt2.ready && aesMasked.io.key2.ready) {
					aesMasked.io.pt2.valid := True
					aesMasked.io.key2.valid := True
					ctr.increment()
				}
				
				when (aesMasked.io.done) {
					dutState := sWriteData
					ctr.clear()
				}
			}
			
			is (sWriteData) {
				dutState := sWriteData
				
				sampleInputs := False
				sampleOutputs := True
				
				resetAES := False
				enableAES := True
				
				when (ctr.value < 4) {
					aesMasked.io.ct1.ready := True
				} otherwise {
					aesMasked.io.ct2.ready := True
				}
				
				ctr.increment()
				when (ctr.value === 7) {
					dutState := sDone
				}
			}
			
			is (sDone) {
				io.done := True
				
				sampleInputs := False
				sampleOutputs := False
				
				resetAES := True
				enableAES := False
			}
		}
	}
}

object generateAES_Masked_Wrapper {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL", oneFilePerComponent = false).generate(new AES_Masked_Wrapper)
	}
}