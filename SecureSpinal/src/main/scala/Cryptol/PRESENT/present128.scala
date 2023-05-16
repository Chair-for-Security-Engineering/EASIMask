package Cryptol.PRESENT

import spinal.core._
import spinal.lib._

class present128 extends Component {
	val io = new Bundle {
		val enable 			= in  Bool()
		val plaintext1 	= in  Bits(64 bits)
		val plaintext2 	= in  Bits(64 bits)
		val plaintext3 	= in  Bits(64 bits)
		val key1				= in  Bits(128 bits)
		val key2				= in  Bits(128 bits)
		val key3				= in  Bits(128 bits)
		val ciphertext1 = out Bits(64 bits)
		val ciphertext2 = out Bits(64 bits)
		val ciphertext3 = out Bits(64 bits)
		val done 				= out Bool()
		//noIoPrefix()
	}
	
	io.ciphertext1 := 0
	io.ciphertext2 := 0
	io.ciphertext3 := 0
	io.done := False
	
	val state1, state2, state3 = Reg(Bits(64 bits)) init(0)
	val keyReg1, keyReg2, keyReg3 = Reg(Bits(128 bits)) init(0)
	val roundKey1, roundKey2, roundKey3 = Bits(64 bits)
	val ctr = Counter(1, 31)
	val smallCtr = Counter(0, 1)
	
	roundKey1 := keyReg1(127 downto 64)
	roundKey2 := keyReg2(127 downto 64)
	roundKey3 := keyReg3(127 downto 64)
	
	val addroundkey1, addroundkey2, addroundkey3 = new addRoundKey
	addroundkey1.io.stateIn := state1
	addroundkey1.io.key := roundKey1
	addroundkey2.io.stateIn := state2
	addroundkey2.io.key := roundKey2
	addroundkey3.io.stateIn := state3
	addroundkey3.io.key := roundKey3
	
	val updatekeyshared = new updateKey128Shared
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
	
	object States extends SpinalEnum {
		val sIdle, sExecute, sDone = newElement()
	}
	
	import States._
	val presentState = Reg(States()) init(sIdle)
	
	switch (presentState) {
		is (sIdle) {
			presentState := sIdle
			ctr.clear()
			smallCtr.clear()
			when (io.enable) {
				presentState := sExecute
				state1 := io.plaintext1
				state2 := io.plaintext2
				state3 := io.plaintext3
				keyReg1 := io.key1
				keyReg2 := io.key2
				keyReg3 := io.key3
			}
		}
		
		is (sExecute) {
			presentState := sExecute
			smallCtr.increment()
			when (smallCtr.willOverflow) {
				ctr.increment()
			}
			when (ctr.willOverflow) {
				presentState := sDone
			}
		}
		
		is (sDone) {
			io.done := True
			io.ciphertext1 := addroundkey1.io.stateOut
			io.ciphertext2 := addroundkey2.io.stateOut
			io.ciphertext3 := addroundkey3.io.stateOut
		}
	}
}
