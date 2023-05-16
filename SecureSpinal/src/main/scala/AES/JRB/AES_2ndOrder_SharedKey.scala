package AES.JRB

import AES.DOM.{MixColumns, ShiftRows}
import spinal.core._

case class AES_2ndOrder_SharedKey() extends Component {
	val io = new Bundle {
		val clk = in  Bool()
		val reset = in  Bool()
		val p = in  Vec(Bits(128 bits), 3)
		val k = in  Vec(Bits(128 bits), 3)
		val r = in  Bits(16*54 bits)
		val c = out Vec(Bits(128 bits), 3)
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val sboxOut, shiftRowsOut, mixColumnsOut = Vec(Bits(128 bits), 3)
		
		for (i <- 0 until 16) {
			val sbox = new SBox(3)
			sbox.io.clk := io.clk
			sbox.io.reset := ~io.reset
			sbox.io.a( 7 downto  0) := io.p(0)(8*i+7 downto 8*i)
			sbox.io.a(15 downto  8) := io.p(1)(8*i+7 downto 8*i)
			sbox.io.a(23 downto 16) := io.p(2)(8*i+7 downto 8*i)
			sbox.io.r := io.r(54*i+53 downto 54*i)
			sboxOut(0)(8*i+7 downto 8*i) := sbox.io.b( 7 downto  0)
			sboxOut(1)(8*i+7 downto 8*i) := sbox.io.b(15 downto  8)
			sboxOut(2)(8*i+7 downto 8*i) := sbox.io.b(23 downto 16)
		}
		
		for (i <- 0 until 3) {
			val shiftrows = new ShiftRows
			shiftrows.io.shiftRowsInput := sboxOut(i)
			shiftRowsOut(i) := shiftrows.io.shiftRowsOutput
		}
		
		for (i <- 0 until 3) {
			for (j <- 0 until 4) {
				val mixcolumns = new MixColumns
				mixcolumns.io.mixColumnsInput := shiftRowsOut(i)(32*j+31 downto 32*j)
				mixColumnsOut(i)(32*j+31 downto 32*j) := mixcolumns.io.mixColumnsOutput
			}
		}
		
		io.c(0) := mixColumnsOut(0) ^ io.k(0)
		io.c(1) := mixColumnsOut(1) ^ io.k(1)
		io.c(2) := mixColumnsOut(2) ^ io.k(2)
	}
}

object AES_2ndOrder_SharedKey extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/JRB/RTL").generate(AES_2ndOrder_SharedKey())
}
