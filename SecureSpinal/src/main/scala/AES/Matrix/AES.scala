package AES.Matrix

import AES.Plain.CanrightSBox
import spinal.core._
import spinal.lib.Counter

object States extends SpinalEnum {
	val sIdle, sExecute, sFinalRound, sDone = newElement()
}

class AES extends Component {
	import States._
	
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val enable 			= in  Bool()
		val plaintext 	= in  Bits(128 bits)
		val key 				= in  Bits(128 bits)
		val ciphertext 	= out Bits(128 bits)
		val done 				= out Bool()
	}
	
	io.plaintext.share
	io.key.share
	io.ciphertext.share
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val keyReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4)
		val roundCounter = Counter(1, 9)
		val roundConstant = Reg(Bits(8 bits)) init(1)
		
		val addroundkey = new AddRoundKey
		addroundkey.setAsLinear
		addroundkey.io.state := stateReg
		addroundkey.io.key := keyReg
		//stateReg := addroundkey.io.result
		
		val shiftrows = new ShiftRows
		shiftrows.setAsLinear
		
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				val sbox = new CanrightSBox
				sbox.setAsNonLinear
				sbox.setAsReplace("AES.Matrix.SBox", 38, "mask")
				sbox.io.subBytesInput := addroundkey.io.result(i)(j)
				shiftrows.io.srIn(i)(j) := sbox.io.subBytesOutput
			}
		}
		
		/*val a = Vec(Vec(Bits(8 bits), 4), 4)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				a(i)(j) := stateReg(i)(j) ^ keyReg(i)(j)
			}
		}*/
		
		for (i <- 0 until 4) {
			val mixcolumns = new MixColumns
			mixcolumns.setAsLinear
			mixcolumns.io.mcIn1 := shiftrows.io.srOut(0)(i)
			mixcolumns.io.mcIn2 := shiftrows.io.srOut(1)(i)
			mixcolumns.io.mcIn3 := shiftrows.io.srOut(2)(i)
			mixcolumns.io.mcIn4 := shiftrows.io.srOut(3)(i)
			stateReg(0)(i) := mixcolumns.io.mcOut1
			stateReg(1)(i) := mixcolumns.io.mcOut2
			stateReg(2)(i) := mixcolumns.io.mcOut3
			stateReg(3)(i) := mixcolumns.io.mcOut4
		}
		
		val keyschedule = new KeySchedule
		keyschedule.io.keyIn := keyReg
		keyschedule.io.constant := roundConstant
		keyReg := keyschedule.io.keyOut
		
		io.ciphertext := stateToVector(addroundkey.io.result)
		
		//shiftrows.io.srIn := addroundkey.io.result
		//stateReg := shiftrows.io.srOut
		
		val aesState = Reg(States()) init (sIdle)
		
		switch(aesState) {
			is(sIdle) {
				aesState := sIdle
				roundCounter.clear()
				stateReg := vectorToState(io.plaintext)
				keyReg := vectorToState(io.key)
				when(io.enable) {
					aesState := sExecute
				}
			}
			
			is(sExecute) {
				aesState := sExecute
				roundCounter.increment()
				when (roundCounter.willOverflow) {
					aesState := sFinalRound
				}
				when (U(roundConstant) < 0x80) {
					roundConstant := roundConstant |<< 1
				} otherwise {
					roundConstant := (roundConstant |<< 1) ^ 0x1B
				}
			}
			
			is (sFinalRound) {
				stateReg := shiftrows.io.srOut
				aesState := sDone
			}
			
			is (sDone) {
				io.done := True
			}
		}
	}
	
	 def vectorToState (vec : Bits): Vec[Vec[Bits]] = {
		 val ret = Vec(Vec(Bits(8 bits), 4), 4)
		 for (i <- 0 until 4) {
			 for (j <- 0 until 4) {
				 ret(j)(i) := vec(127-i*32-j*8 downto 120-i*32-j*8)
			 }
		 }
		 ret
	 }
	
	def stateToVector (state : Vec[Vec[Bits]]): Bits = {
		val ret = Bits(128 bits)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				ret(127-32*i-8*j downto 120-32*i-8*j) := state(j)(i)
			}
		}
		ret
	}
}

object GenerateAES {
	def main (args: Array[String]): Unit = {
		val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", applyMasking = true).generate(new AES)
	}
}