package AES.JRB

import AES.DOM.{MixColumns, ShiftRows}
import spinal.core._

case class AES_QuarterRound_1stOrder() extends Component {
	val io = new Bundle {
		val clk = in  Bool()
		val reset = in  Bool()
		val p = in  Vec(Bits(32 bits), 2)
		val r = in  Bits(4*18 bits)
		val c = out Vec(Bits(32 bits), 2)
	}
	
	ClockDomainStack.set(ClockDomain(io.clk, io.reset))
	
	val sboxOut, mixColumnsOut = Vec(Bits(32 bits), 2)
	
	for (i <- 0 until 4) {
		val sbox = new SBox(shares = 2)
		sbox.io.clk := io.clk
		sbox.io.reset := ~io.reset
		sbox.io.a( 7 downto 0) := io.p(0)(8*i+7 downto 8*i)
		sbox.io.a(15 downto 8) := io.p(1)(8*i+7 downto 8*i)
		sbox.io.r := io.r(18*i+17 downto 18*i)
		sboxOut(0)(8*i+7 downto 8*i) := sbox.io.b( 7 downto 0)
		sboxOut(1)(8*i+7 downto 8*i) := sbox.io.b(15 downto 8)
	}
	
	for (i <- 0 until 2) {
		val mixColumns = new MixColumns
		mixColumns.io.mixColumnsInput := sboxOut(i)
		mixColumnsOut(i) := mixColumns.io.mixColumnsOutput
	}
	
	io.c(0) := mixColumnsOut(0)
	io.c(1) := mixColumnsOut(1)
}

object AES_QuarterRound_1stOrder extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/JRB/RTL").generate(AES_QuarterRound_1stOrder())
}