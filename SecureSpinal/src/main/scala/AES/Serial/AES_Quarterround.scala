package AES.Serial

import spinal.core._
import spinal.lib._

object QuarterroundStates extends SpinalEnum {
	val sIdle, sInit, sExecute, sDone = newElement()
}

case class AES_Quarterround() extends Component {
	
	import QuarterroundStates._
	
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val p 			= in  Bits(32 bits)
		val k 			= in  Bits(32 bits)
		val c 			= out Bits(32 bits)
		val done 		= out Bool()
	}
	
	ClockDomainStack.set(ClockDomain(io.clk, io.reset))
	
	val aesState = Reg(QuarterroundStates()) init(sIdle)
	val stateReg = Vec(Reg(Bits(8 bits)) init(0), 4)
	val keyReg = Vec(Reg(Bits(8 bits)) init(0), 4)
	val ctr = Counter(0, 4)
	
	val initData = Bool()
	val stateRotation = Bool()
	val mixColumnsRotation = Bool()
	
	val addroundkey = new AddRoundKey
	addroundkey.io.a := stateReg(0)
	addroundkey.io.k := keyReg(0)
	
	val sbox = new CanrightSBox
	sbox.io.subBytesInput := addroundkey.io.b
	
	val mixcolumns = new MixColumns
	mixcolumns.io.mcIn1 := stateReg(0)
	mixcolumns.io.mcIn2 := stateReg(1)
	mixcolumns.io.mcIn3 := stateReg(2)
	mixcolumns.io.mcIn4 := stateReg(3)
	
	io.c := stateReg(0) ## stateReg(1) ## stateReg(2) ## stateReg(3)
	
	when (initData) {
		stateReg(0) := io.p(31 downto 24)
		stateReg(1) := io.p(23 downto 16)
		stateReg(2) := io.p(15 downto  8)
		stateReg(3) := io.p( 7 downto  0)
		keyReg(0) 	:= io.k(31 downto 24)
		keyReg(1) 	:= io.k(23 downto 16)
		keyReg(2) 	:= io.k(15 downto  8)
		keyReg(3) 	:= io.k( 7 downto  0)
	}
	
	when (stateRotation) {
		stateReg(0) := stateReg(1)
		stateReg(1) := stateReg(2)
		stateReg(2) := stateReg(3)
		stateReg(3) := sbox.io.subBytesOutput
	}
	
	when (mixColumnsRotation) {
		stateReg(0) := mixcolumns.io.mcOut1
		stateReg(1) := mixcolumns.io.mcOut2
		stateReg(2) := mixcolumns.io.mcOut3
		stateReg(3) := mixcolumns.io.mcOut4
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
			when (ctr.value < 4) {
				stateRotation := True
			} otherwise {
				stateRotation := False
			}
			when (ctr.value === 4) {
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

object AES_Quarterround extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "C:\\Users\\fabusbo\\Desktop\\VE" +
	 "-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES_Quarterround())
	SpinalConfig(mode = Verilog, targetDirectory = "C:\\Users\\fabusbo\\Desktop" +
	 "\\VE-HEP\\ap3\\SpinalHDL\\SecureSpinal\\src\\main\\scala\\AES\\Serial\\RTL").generate(AES_Quarterround())
}