package AES.MaskedCanright

import spinal.core._

/* Masked AES Encryption implementation with 2 shares using the
	 Canright AES SBox, 1 cycle per round, 11 total are needed
*  Inputs: 	p: Shared plaintext
* 					k: Shared key
* 					m: Fresh randomness
*  Outputs: c: Shared ciphertext
*  */

class AESEncryptMasked extends Component {
	val io = new Bundle {
		val reset	= in  Bool()
		val p			= in  Vec(Bits(128 bits), 2)
		val k			= in  Vec(Bits(128 bits), 2)
		val m			= in  Bits(160 bits)
		val c			= out Vec(Bits(128 bits), 2)
		val done	= out Bool()
	}
	
	val stateRegister = Vec(Reg(Bits(128 bits)) init(0), 2)
	val keyRegister	= Vec(Reg(Bits(128 bits)) init(0), 2)
	val round = Reg(UInt(4 bits)) init(0)
	val roundConstant = Reg(Bits(8 bits)) init(1)
	val incRC, lastRound = Reg(Bool()) init(False)
	
	val KA, SB, SR, MC = Vec(Bits(128 bits), 2)
	
	/* Key Addition */
	val addKey = new AddRoundKeyMasked
	addKey.io.a := stateRegister
	addKey.io.k := keyRegister
	KA := addKey.io.b
	
	/* SBoxes */
	for(i <- 0 until 16) {
		val sBox = new CanrightSBoxMasked
		sBox.io.A := KA(0)(8*i+7 downto 8*i)
		sBox.io.M := KA(1)(8*i+7 downto 8*i)
		sBox.io.S := io.m(159-8*i downto 152-8*i)
		SB(1)(8*i+7 downto 8*i) := io.m(159-8*i downto 152-8*i)
		SB(0)(8*i+7 downto 8*i) := sBox.io.Q
 	}
	
	/* ShiftRows */
	for (i <- 0 until 2) {
		val shiftRows = new ShiftRows
		shiftRows.io.shiftRowsInput := SB(i)
		SR(i) := shiftRows.io.shiftRowsOutput
	}
	
	/* MixColumns */
	for (i <- 0 until 2) {
		for (j <- 0 until 4) {
			val mixColumns = new MixColumns
			mixColumns.io.mixColumnsInput := SR(i)(32*j+31 downto 32*j)
			MC(i)(32*j+31 downto 32*j) := mixColumns.io.mixColumnsOutput
		}
	}
	
	/* KeySchedule */
	val keySchedule = new KeyScheduleMasked
	keySchedule.io.keyScheduleInput := keyRegister
	keySchedule.io.m := io.m(31 downto 0)
	keySchedule.io.RC := roundConstant
	keyRegister := keySchedule.io.keyScheduleOutput
	
	/* Reset values, increase Round Counter when reset is low */
	when (io.reset) {
		round := 0
		lastRound := False
		incRC := False
	} otherwise {
		round := round + 1
		incRC := True
	}
	
	/* Calculate the round constant when incRC is high, otherwise set RC to 1 */
	when (incRC) {
		when (U(roundConstant) < 0x80) {
			roundConstant := (roundConstant << 1)(7 downto 0)
		} otherwise {
			roundConstant := (roundConstant << 1)(7 downto 0) ^ 0x1B
		}
	} otherwise {
		roundConstant := 1
	}
	
	/* Set lastRound for the last round */
	when (round === 9) {
		lastRound := True
	} otherwise {
		lastRound := False
	}
	
	/* Set stateRegister and keyRegister to inputs when reset falls
	*  Set stateRegister to the output of ShiftRows in the last round,
	*  else set it to the output of MixColumns
	*  */
	when (io.reset.fall()) {
		stateRegister := io.p
		keyRegister := io.k
	} elsewhen (lastRound) {
		stateRegister := SR
	} otherwise {
		stateRegister := MC
	}
	
	/* Set done to high when the last round is done */
	io.c := KA
	when (lastRound.fall()) {
		io.done := True
	} otherwise {
		io.done := False
	}
}
