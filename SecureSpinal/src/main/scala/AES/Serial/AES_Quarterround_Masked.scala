package AES.Serial

import spinal.core._
import spinal.lib._

case class AES_Quarterround_Masked() extends Component {
	
	import QuarterroundStates._
	
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val p1 			= in  Bits(32 bits)
		val p2 			= in  Bits(32 bits)
		val k1 			= in  Bits(32 bits)
		val k2 			= in  Bits(32 bits)
		val r 			= in  Bits(28 bits)
		val c1 			= out Bits(32 bits)
		val c2 			= out Bits(32 bits)
		val done 		= out Bool()
	}
	
	ClockDomainStack.set(ClockDomain(io.clk, io.reset))
	
	val aesState = Reg(QuarterroundStates()) init(sIdle)
	val stateReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 2)
	val keyReg = Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 2)
	val ctr = Counter(0, 8)
	
	val initData = Bool()
	val stateRotation = Bool()
	val mixColumnsRotation = Bool()
	
	val addroundkey1, addroundkey2 = new AddRoundKey
	addroundkey1.io.a := stateReg(0)(0)
	addroundkey1.io.k := keyReg(0)(0)
	addroundkey2.io.a := stateReg(1)(0)
	addroundkey2.io.k := keyReg(1)(0)
	
	val sbox = new SBoxMasked
	sbox.io.clk := io.clk
	sbox.io.reset := io.reset
	sbox.io.sbIn0 := addroundkey1.io.b
	sbox.io.sbIn1 := addroundkey2.io.b
	sbox.io.m := io.r
	
	val mixcolumns1, mixcolumns2 = new MixColumns
	mixcolumns1.io.mcIn1 := stateReg(0)(0)
	mixcolumns1.io.mcIn2 := stateReg(0)(1)
	mixcolumns1.io.mcIn3 := stateReg(0)(2)
	mixcolumns1.io.mcIn4 := stateReg(0)(3)
	mixcolumns2.io.mcIn1 := stateReg(1)(0)
	mixcolumns2.io.mcIn2 := stateReg(1)(1)
	mixcolumns2.io.mcIn3 := stateReg(1)(2)
	mixcolumns2.io.mcIn4 := stateReg(1)(3)
	
	io.c1 := stateReg(0)(0) ## stateReg(0)(1) ## stateReg(0)(2) ## stateReg(0)(3)
	io.c2 := stateReg(1)(0) ## stateReg(1)(1) ## stateReg(1)(2) ## stateReg(1)(3)
	
	when (initData) {
		stateReg(0)(0) := io.p1(31 downto 24)
		stateReg(0)(1) := io.p1(23 downto 16)
		stateReg(0)(2) := io.p1(15 downto  8)
		stateReg(0)(3) := io.p1( 7 downto  0)
		stateReg(1)(0) := io.p2(31 downto 24)
		stateReg(1)(1) := io.p2(23 downto 16)
		stateReg(1)(2) := io.p2(15 downto  8)
		stateReg(1)(3) := io.p2( 7 downto  0)
		keyReg(0)(0) 	:= io.k1(31 downto 24)
		keyReg(0)(1) 	:= io.k1(23 downto 16)
		keyReg(0)(2) 	:= io.k1(15 downto  8)
		keyReg(0)(3) 	:= io.k1( 7 downto  0)
		keyReg(1)(0) 	:= io.k2(31 downto 24)
		keyReg(1)(1) 	:= io.k2(23 downto 16)
		keyReg(1)(2) 	:= io.k2(15 downto  8)
		keyReg(1)(3) 	:= io.k2( 7 downto  0)
	}
	
	when (stateRotation) {
		stateReg(0)(0) := stateReg(0)(1)
		stateReg(0)(1) := stateReg(0)(2)
		stateReg(0)(2) := stateReg(0)(3)
		stateReg(0)(3) := sbox.io.sbOut0
		stateReg(1)(0) := stateReg(1)(1)
		stateReg(1)(1) := stateReg(1)(2)
		stateReg(1)(2) := stateReg(1)(3)
		stateReg(1)(3) := sbox.io.sbOut1
	}
	
	when (mixColumnsRotation) {
		stateReg(0)(0) := mixcolumns1.io.mcOut1
		stateReg(0)(1) := mixcolumns1.io.mcOut2
		stateReg(0)(2) := mixcolumns1.io.mcOut3
		stateReg(0)(3) := mixcolumns1.io.mcOut4
		stateReg(1)(0) := mixcolumns2.io.mcOut1
		stateReg(1)(1) := mixcolumns2.io.mcOut2
		stateReg(1)(2) := mixcolumns2.io.mcOut3
		stateReg(1)(3) := mixcolumns2.io.mcOut4
	}
	
	switch (aesState) {
		is (sIdle) {
			aesState := sIdle
			
			initData := False
			stateRotation := False
			mixColumnsRotation := False
			io.done := False
			
			when (io.enable) {
				aesState := sInit
			}
		}
		
		is (sInit) {
			initData := True
			stateRotation := False
			mixColumnsRotation := False
			io.done := False
			
			aesState := sExecute
		}
		
		is (sExecute) {
			aesState := sExecute
			ctr.increment()
			
			initData := False
			when (ctr.value < 8) {
				stateRotation := True
			} otherwise {
				stateRotation := False
			}
			when (ctr.value === 8) {
				mixColumnsRotation := True
			} otherwise {
				mixColumnsRotation := False
			}
			when (ctr.willOverflow) {
				aesState := sDone
			}
			io.done := False
		}
		
		is (sDone) {
			aesState := sIdle
			
			initData := False
			stateRotation := False
			mixColumnsRotation := False
			io.done := True
		}
	}
}

object AES_Quarterround_Masked extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "C:\\Users\\fabusbo\\Desktop\\VE" +
	 "-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES_Quarterround_Masked())
	SpinalConfig(mode = Verilog, targetDirectory = "C:\\Users\\fabusbo\\Desktop" +
	 "\\VE-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES_Quarterround_Masked())
}