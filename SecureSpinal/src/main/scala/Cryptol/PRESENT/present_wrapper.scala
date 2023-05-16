package Cryptol.PRESENT

import spinal.core._
import spinal.lib.fsm._

class present_wrapper (numShares : Int) extends Component {
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(numShares*64 bits)//Vec(Bits(64 bits), numShares)
		val key 			= in  Bits(numShares*80 bits)//Vec(Bits(80 bits), numShares)
		val dataOut 	= out Bits(numShares*64 bits)//Vec(Bits(64 bits), numShares)
		val done 			= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset))
	{
		val dataInReg = Vec(Reg(Bits(64 bits)) init (0), numShares)
		val keyReg = Vec(Reg(Bits(80 bits)) init (0), numShares)
		val dataOutReg = Vec(Reg(Bits(64 bits)) init (0), numShares)
		val enablePresentEncrypt = Reg(Bool()) init (False)
		
		val sampleInputs, sampleOutputs = Bool()
		
		enablePresentEncrypt := False
		
		sampleInputs := False
		sampleOutputs := False
		
		val presentEncrypt = new presentEncryptMasked
		presentEncrypt.io.clk := io.clk
		presentEncrypt.io.reset := True
		presentEncrypt.io.enable := enablePresentEncrypt
		presentEncrypt.io.plaintext1 := dataInReg(0)
		presentEncrypt.io.plaintext2 := dataInReg(1)
		presentEncrypt.io.plaintext3 := dataInReg(2)
		presentEncrypt.io.key1 := keyReg(0)
		presentEncrypt.io.key2 := keyReg(1)
		presentEncrypt.io.key3 := keyReg(2)
		
		when(sampleInputs) {
			//dataInReg(0) := io.dataIn()
			for (i <- 0 until numShares) {
				dataInReg(i) := io.dataIn(64 * i + 63 downto 64 * i)
				keyReg(i) := io.key(80 * i + 79 downto 80 * i)
			}
			//keyReg := io.key
		}
		
		when(sampleOutputs) {
			dataOutReg(0) := presentEncrypt.io.ciphertext1
			dataOutReg(1) := presentEncrypt.io.ciphertext2
			dataOutReg(2) := presentEncrypt.io.ciphertext3
		}
		
		io.done := False
		io.dataOut := dataOutReg(0) ## dataOutReg(1) ## dataOutReg(2)
		
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
				enablePresentEncrypt := True
				presentEncrypt.io.reset := False
				dutState := sExecute
			}
			
			is(sExecute) {
				dutState := sExecute
				presentEncrypt.io.reset := False
				when(presentEncrypt.io.done) {
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