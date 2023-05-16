package Cryptol.PRESENT

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class presentEncrypt extends Component {
	val io = new Bundle {
		val enable 			= in  Bool()
		val plaintext 	= in  Bits(64 bits)
		val key 				= in  Bits(80 bits)
		val ciphertext 	= out Bits(64 bits)
		val done 				= out Bool()
		//noIoPrefix()
	}
	
	io.ciphertext := 0
	io.done := False
	
	val state = Reg(Bits(64 bits)) init(0)
	val keyReg = Reg(Bits(80 bits)) init(0)
	val roundKey = Bits(64 bits)
	val ctr = Counter(1, 31)
	
	roundKey := keyReg(79 downto 16)
	
	val addroundkey = new addRoundKey
	addroundkey.setAsLinear
	addroundkey.io.stateIn := state
	addroundkey.io.key := roundKey
	
	val updatekey = new updateKey
	updatekey.io.keyIn := keyReg
	updatekey.io.round := ctr
	keyReg := updatekey.io.keyOut
	
	
	val sboxlayer = new sboxLayer
	sboxlayer.io.stateIn := addroundkey.io.stateOut
	
	val permutation = new permutation
	permutation.setAsLinear
	permutation.io.stateIn := sboxlayer.io.stateOut
	state := permutation.io.stateOut
	
	val fsm = new StateMachine {
		val sIdle = new State with EntryPoint {
			whenIsActive {
				ctr.clear()
				when (io.enable) {
					goto(sExecute)
				}
			}
			onExit {
				state := io.plaintext
				keyReg := io.key
			}
		}
		
		val sExecute = new State {
			whenIsActive {
				//assert((io.plaintext1^io.plaintext2^io.plaintext3) == io.plaintext)
				//assert((io.key1^io.key2^io.key3) == io.key)
				ctr.increment()
				when (ctr.willOverflow) {
					goto(sDone)
				}
			}
		}
		
		val sDone = new State {
			whenIsActive {
				io.done := True
				io.ciphertext := addroundkey.io.stateOut
			}
		}
	}
}

class presentEncryptMasked extends Component {
	val io = new Bundle {
		val clk 				= in  Bool()
		val reset 			= in  Bool()
		val enable 			= in  Bool()
		val plaintext1 	= in  Bits(64 bits)
		val plaintext2 	= in  Bits(64 bits)
		val plaintext3 	= in  Bits(64 bits)
		val key1				= in  Bits(80 bits)
		val key2				= in  Bits(80 bits)
		val key3				= in  Bits(80 bits)
		val ciphertext1 = out Bits(64 bits)
		val ciphertext2 = out Bits(64 bits)
		val ciphertext3 = out Bits(64 bits)
		val done 				= out Bool()
		//noIoPrefix()
	}

	val r = new ClockingArea(ClockDomain(io.clk, io.reset))
	{
		io.done := False
		
		val state1 = Reg(Bits(64 bits)) init (0)
		val state2, state3 = Reg(Bits(64 bits)) init (0)
		val keyReg1, keyReg2, keyReg3 = Reg(Bits(80 bits)) init (0)
		val roundKey1, roundKey2, roundKey3 = Bits(64 bits)
		val ctr = Counter(1, 31)
		val smallCtr = Counter(0, 1)
		
		roundKey1 := keyReg1(79 downto 16)
		roundKey2 := keyReg2(79 downto 16)
		roundKey3 := keyReg3(79 downto 16)
		
		val addroundkey1, addroundkey2, addroundkey3 = new addRoundKey
		addroundkey1.io.stateIn := state1
		addroundkey1.io.key := roundKey1
		addroundkey2.io.stateIn := state2
		addroundkey2.io.key := roundKey2
		addroundkey3.io.stateIn := state3
		addroundkey3.io.key := roundKey3
		
		val updatekeyshared = new updateKeyShared
		updatekeyshared.io.keyIn1 := keyReg1
		updatekeyshared.io.keyIn2 := keyReg2
		updatekeyshared.io.keyIn3 := keyReg3
		updatekeyshared.io.round := B(ctr)
		keyReg1 := updatekeyshared.io.keyOut1
		keyReg2 := updatekeyshared.io.keyOut2
		keyReg3 := updatekeyshared.io.keyOut3
		
		val sboxlayershared = new sboxLayerShared
		sboxlayershared.io.stateIn1 := addroundkey1.io.stateOut
		sboxlayershared.io.stateIn2 := addroundkey2.io.stateOut
		sboxlayershared.io.stateIn3 := addroundkey3.io.stateOut
		
		val permutation1, permutation2, permutation3 = new permutation
		permutation1.io.stateIn := sboxlayershared.io.stateOut1
		permutation2.io.stateIn := sboxlayershared.io.stateOut2
		permutation3.io.stateIn := sboxlayershared.io.stateOut3
		
		state1 := permutation1.io.stateOut
		state2 := permutation2.io.stateOut
		state3 := permutation3.io.stateOut
		
		io.ciphertext1 := addroundkey1.io.stateOut
		io.ciphertext2 := addroundkey2.io.stateOut
		io.ciphertext3 := addroundkey3.io.stateOut
		
		object States extends SpinalEnum {
			val sIdle, sExecute, sDone = newElement()
		}
		
		import States._
		val presentState = Reg(States()) init (sIdle)
		
		switch(presentState) {
			is(sIdle) {
				presentState := sIdle
				ctr.clear()
				smallCtr.clear()
				when(io.enable) {
					presentState := sExecute
					state1 := io.plaintext1
					state2 := io.plaintext2
					state3 := io.plaintext3
					keyReg1 := io.key1
					keyReg2 := io.key2
					keyReg3 := io.key3
				}
			}
			
			is(sExecute) {
				presentState := sExecute
				smallCtr.increment()
				when(smallCtr.willOverflow) {
					ctr.increment()
				}
				when(ctr.willOverflow) {
					presentState := sDone
				}
			}
			
			is(sDone) {
				presentState := sDone
				io.done := True
			}
		}
	}
}

object generateHDL {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, netlistFileName = "presentEncryptAutoMasked.vhd", targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL", applyMasking = false).generate(new presentEncryptMasked)
		//SpinalVhdl(new presentEncrypt)
		//SpinalVerilog(new presentEncrypt)
	}
}
