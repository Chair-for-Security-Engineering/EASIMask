package Cryptol.AES

import spinal.core._

class KeySchedule extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val sampleInput = in Bool()
		val keyIn1 = in Bits(128 bits)
		val keyIn2 = in Bits(128 bits)
		val roundConstant = in Bits(8 bits)
		val m = in Bits(152 bits)
		val keyOut1 = out Bits(128 bits)
		val keyOut2 = out Bits(128 bits)
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		
		val reg1, reg2 = Reg(Bits(128 bits)) init(0)
		
		val w00, w01, w10, w11, w20, w21, w30, w31, rc = Bits(32 bits)
		val sBoxOut0, sBoxOut1 = Bits(32 bits)
		
		when(io.sampleInput) {
			reg1 := io.keyIn1
			reg2 := io.keyIn2
		}
		
		for (i <- 0 until 4) {
			val sb = new SBox
			sb.io.clk := io.clk
			sb.io.reset := io.reset
			sb.io.sbox_in := io.keyIn1(31-8*i downto 24-8*i) ## io.keyIn2(31-8*i downto 24-8*i)
			sb.io.mask := io.m(151-38*i downto 114-38*i)
			sBoxOut0(31-8*i downto 24-8*i) := sb.io.sbox_out(15 downto 8)
			sBoxOut1(31-8*i downto 24-8*i) := sb.io.sbox_out( 7 downto 0)
		}
		
		rc := io.roundConstant << 24
		
		w00 := reg1(127 downto 96) ^ (sBoxOut0(23 downto 0) ## sBoxOut0(31 downto 24)) ^ rc
		w01 := reg2(127 downto 96) ^ (sBoxOut1(23 downto 0) ## sBoxOut1(31 downto 24))
		w10 := reg1( 95 downto 64) ^ w00
		w11 := reg2( 95 downto 64) ^ w01
		w20 := reg1( 63 downto 32) ^ w10
		w21 := reg2( 63 downto 32) ^ w11
		w30 := reg1( 31 downto  0) ^ w20
		w31 := reg2( 31 downto  0) ^ w21
		
		io.keyOut1 := w00 ## w10 ## w20 ## w30
		io.keyOut2 := w01 ## w11 ## w21 ## w31
		
	}
}