package AES.DOM

import spinal.core._

class AESEncryptDOM extends Component {
	val io = new Bundle {
		val reset	= in  Bool()
		val p0 		= in  Bits(128 bits)
		val p1 		= in  Bits(128 bits)
		val k0 		= in  Bits(128 bits)
		val k1 		= in  Bits(128 bits)
		val m			= in  Bits(760 bits)
		val c0 		= out Bits(128 bits)
		val c1 		= out Bits(128 bits)
		val done 	= out Bool()
	}
	
	val stateReg0, stateReg1, keyReg0, keyReg1 = Reg(Bits(128 bits)) init(0)
	val roundCounter = Reg(UInt(4 bits)) init(0)
	val roundConstant = Reg(Bits(8 bits)) init(1)
	val p, k = Bits(128 bits)
	val i = Reg(UInt(3 bits)) init(0)
	val done = Reg(Bool()) init(False)
	
	p := stateReg0 ^ stateReg1
	k := keyReg0 ^ keyReg1
	
	val ak0, ak1 = new AddRoundKey()
	val sr0, sr1 = new ShiftRows
	
	for (j <- 0 until 16) {
		val sb = new SBox
		sb.io.sbIn0 := stateReg0(127-8*j downto 120-8*j)
		sb.io.sbIn1 := stateReg1(127-8*j downto 120-8*j)
		sb.io.m := io.m(759-38*j downto 722-38*j)
		sr0.io.shiftRowsInput(127-8*j downto 120-8*j) := sb.io.sbOut0
		sr1.io.shiftRowsInput(127-8*j downto 120-8*j) := sb.io.sbOut1
	}
	
	for (j <- 0 until 4) {
		val mc0, mc1 = new MixColumns
		mc0.io.mixColumnsInput := sr0.io.shiftRowsOutput(127-32*j downto 96-32*j)
		mc1.io.mixColumnsInput := sr1.io.shiftRowsOutput(127-32*j downto 96-32*j)
		ak0.io.akIn(127-32*j downto 96-32*j) := mc0.io.mixColumnsOutput
		ak1.io.akIn(127-32*j downto 96-32*j) := mc1.io.mixColumnsOutput
	}
	
	val ks = new KeySchedule
	when (io.reset.fall()) {
		ks.io.ksIn0 := io.k0
		ks.io.ksIn1 := io.k1
	} otherwise {
		ks.io.ksIn0 := keyReg0
		ks.io.ksIn1 := keyReg1
	}
	ks.io.rc := roundConstant
	ks.io.m := io.m(151 downto 0)
	
	when (io.reset.fall()) {
		keyReg0 := io.k0
		keyReg1 := io.k1
	} elsewhen (i === 4) {
		keyReg0 := ks.io.ksOut0
		keyReg1 := ks.io.ksOut1
	}
	
	when (io.reset.fall()) {
		ak0.io.akIn := io.p0
		ak0.io.rk := io.k0
		stateReg0 := ak0.io.akOut
		ak1.io.akIn := io.p1
		ak1.io.rk := io.k1
		stateReg1 := ak1.io.akOut
	} elsewhen (roundCounter <= 0x9) {
		ak0.io.rk := keyReg0
		stateReg0 := ak0.io.akOut
		ak1.io.rk := keyReg1
		stateReg1 := ak1.io.akOut
	} otherwise {
		ak0.io.akIn := sr0.io.shiftRowsOutput
		ak0.io.rk := keyReg0
		stateReg0 := ak0.io.akOut
		ak1.io.akIn := sr1.io.shiftRowsOutput
		ak1.io.rk := keyReg1
		stateReg1 := ak1.io.akOut
	}
	
	when (io.reset || (i === 4)) {
		i := 0
	} otherwise {
		i := i + 1
	}
	
	when (io.reset) {
		roundConstant := 1
	} elsewhen (i === 4) {
		when (U(roundConstant) < 0x80) {
			roundConstant := (roundConstant |<< 1)
		} otherwise {
			roundConstant := (roundConstant |<< 1) ^ 0x1B
		}
	}
	
	when (io.reset) {
		roundCounter := 0
	} elsewhen (i === 4) {
		roundCounter := roundCounter + 1
	}
	
	io.c0 := stateReg0
	io.c1 := stateReg1
	
	io.done := done
	done := False
	when (roundCounter === 10) {
		done := True
	}
}