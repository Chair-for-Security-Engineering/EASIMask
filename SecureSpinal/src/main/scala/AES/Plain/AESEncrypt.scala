package AES.Plain

import spinal.core._
import spinal.lib._
//import spinal.tester.AES.CanrightSBox.SubBytes

class AESEncrypt extends Component {
	val io = new Bundle {
		val reset 			= in  Bool()
		val plaintext 	= in  Bits(128 bits)
		val key 				= in  Bits(128 bits)
		val ciphertext 	= out Bits(128 bits)
		val done 				= out Bool()
	}
	
	val dummy = Reg(Bool()) init(False)
	val roundKey = Reg(Bits(128 bits)) init(0)
	val state = Reg(Bits(128 bits)) init(0)
	val round = Reg(UInt(4 bits)) init(0)
	val roundConstant = Reg(Bits(8 bits)) init(1)
	val counter = Counter(10)
	
	val subBytesOut = Bits(128 bits)
	val shiftRowsOut = Bits(128 bits)
	val mixColumnsOut = Bits(128 bits)
	
	val addRoundKey = new AddRoundKey()
	addRoundKey.io.addRoundKeyInput := mixColumnsOut
	when (round === 0xA) {
		addRoundKey.io.addRoundKeyInput := shiftRowsOut
	}
	addRoundKey.io.roundKey := roundKey
	state := addRoundKey.io.addRoundKeyOutput
	
	val shiftRows = new ShiftRows()
	shiftRows.io.shiftRowsInput := subBytesOut
	shiftRowsOut := shiftRows.io.shiftRowsOutput
	
	for (i <- 0 until 4) {
		val mixColumns  = new MixColumns()
		mixColumns.io.mixColumnsInput := shiftRowsOut(127-32*i downto 96-32*i)
		mixColumnsOut(127 -32*i downto 96-32*i) := mixColumns.io.mixColumnsOutput
	}
	
	val keySchedule = new KeySchedule()
	when (io.reset.fall()) {
		keySchedule.io.keyScheduleInput := io.key
	} otherwise {
		keySchedule.io.keyScheduleInput := roundKey
	}
	keySchedule.io.roundConstant := roundConstant
	roundKey := keySchedule.io.keyScheduleOutput
	
	for (i <- 0 until 16) {
		val subBytes = new SubBytes()
		subBytes.io.subBytesInput := state(8*i+7 downto 8*i+0)
		subBytesOut(8*i+7 downto 8*i+0) := subBytes.io.subBytesOutput
	}
	
	when (io.reset.fall()) {
		addRoundKey.io.addRoundKeyInput := io.plaintext
		addRoundKey.io.roundKey := io.key
		//roundKey := io.key
		state := addRoundKey.io.addRoundKeyOutput
		round := round + 1
		counter.increment()
	} elsewhen (round >= 1) {
		round := round + 1
		counter.increment()
	}
	
	when (io.reset.fall() || U(roundConstant) > 0x1) {
		when(U(roundConstant) < 0x80) {
			roundConstant := (roundConstant << 1) (7 downto 0)
		} otherwise {
			roundConstant := (roundConstant << 1) (7 downto 0) ^ 0x1B
		}
	}
	
	io.done := False
	when (round === 0xB) {
		io.done := True
	}
	io.ciphertext := state
	
	when (io.reset) {
		roundKey := 0
		state := 0
		round := 0
		counter.clear()
		roundConstant := 1
		subBytesOut := 0
		shiftRowsOut := 0
		mixColumnsOut := 0
	}
}
