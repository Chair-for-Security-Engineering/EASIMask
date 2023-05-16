package Cryptol.PRESENT

import spinal.core._

class present128_wrapper extends Component {
	val io = new Bundle {
		val resetFull = in  Bool()
		val enable 		= in  Bool()
		val dataIn 		= in  Bits(3*64 bits)//Vec(Bits(64 bits), numShares)
		val key 			= in  Bits(3*128 bits)//Vec(Bits(80 bits), numShares)
		val dataOut 	= out Bits(3*64 bits)//Vec(Bits(64 bits), numShares)
		val done 			= out Bool()
	}
	
	val dataInReg = Vec(Reg(Bits(64 bits)) init(0), 3)
	val keyReg = Vec(Reg(Bits(128 bits)) init(0), 3)
	val dataOutReg = Vec(Reg(Bits(64 bits)) init(0), 3)
	val enablePresentEncrypt = Reg(Bool()) init(False)
	
	val sampleInputs, sampleOutputs = Bool()
	
	enablePresentEncrypt := False
	
	sampleInputs := False
	sampleOutputs := False
	
	val presentEncrypt = new present128
	presentEncrypt.io.enable := enablePresentEncrypt
	presentEncrypt.io.plaintext1 := dataInReg(0)
	presentEncrypt.io.plaintext2 := dataInReg(1)
	presentEncrypt.io.plaintext3 := dataInReg(2)
	presentEncrypt.io.key1 := keyReg(0)
	presentEncrypt.io.key2 := keyReg(1)
	presentEncrypt.io.key3 := keyReg(2)
	
//	when (sampleInputs) {
//		//dataInReg(0) := io.dataIn()
//		for (i <- 0 until 3) {
//			dataInReg(i) := io.dataIn(64*i+63 downto 64*i)
//			keyReg(i) := io.key(128*i+127 downto 128*i)
//		}
//		//keyReg := io.key
//	}
	
//	when (sampleOutputs) {
//		dataOutReg(0) := presentEncrypt.io.ciphertext1
//		dataOutReg(1) := presentEncrypt.io.ciphertext2
//		dataOutReg(2) := presentEncrypt.io.ciphertext3
//	}
	
	io.done := False
	io.dataOut := dataOutReg(0) ## dataOutReg(1) ## dataOutReg(2)
	
	object States extends SpinalEnum {
		val sIdle, sLoadData, sExecute, sDone = newElement()
	}
	
	import States._
	val dutState = Reg(States()) init(sIdle)
	//dutState := sIdle
	
	switch (dutState) {
		is (sIdle) {
			dutState := sIdle
			when (io.enable) {
				dutState := sLoadData
			}
		}
		
		is (sLoadData) {
			for (i <- 0 until 3) {
				dataInReg(i) := io.dataIn(64*i+63 downto 64*i)
				keyReg(i) := io.key(128*i+127 downto 128*i)
			}
			enablePresentEncrypt := True
			dutState := sExecute
		}
		
		is (sExecute) {
			dutState := sExecute
			when (presentEncrypt.io.done) {
				//sampleOutputs := True
				dataOutReg(0) := presentEncrypt.io.ciphertext1
				dataOutReg(1) := presentEncrypt.io.ciphertext2
				dataOutReg(2) := presentEncrypt.io.ciphertext3
				dutState := sDone
			}
		}
		
		is (sDone) {
			//dutState := sDone
			io.done := True
		}
	}
	
	
	/*val fsm = new StateMachine {
		val sIdle = new State with EntryPoint {
			whenIsActive {
				when (io.enable) {
					goto (sLoadData)
				}
			}
		}
		
		val sLoadData = new State {
			whenIsActive {
				sampleInputs := True
				enablePresentEncrypt := True
				goto (sExecute)
			}
		}
		
		val sExecute = new State {
			whenIsActive {
				when (presentEncrypt.io.done) {
					sampleOutputs := True
					goto (sDone)
				}
			}
		}
		
		val sDone = new State {
			whenIsActive {
				io.done := True
			}
		}
	}*/
}