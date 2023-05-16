package AES.DOM

import spinal.core._

class KeySchedule() extends Component {
	val io = new Bundle {
		val ksIn0 	= in  Bits(128 bits)
		val ksIn1 	= in  Bits(128 bits)
		val rc 			= in  Bits(8 bits)
		val m 			= in  Bits(152 bits)
		val ksOut0 	= out Bits(128 bits)
		val ksOut1 	= out Bits(128 bits)
	}
	
	val w00, w01, w10, w11, w20, w21, w30, w31, rc = Bits(32 bits)
	val sBoxOut0, sBoxOut1 = Bits(32 bits)
	
	for (i <- 0 until 4) {
		val sb = new SBox
		sb.io.sbIn0 := io.ksIn0(31-8*i downto 24-8*i)
		sb.io.sbIn1 := io.ksIn1(31-8*i downto 24-8*i)
		sb.io.m := io.m(151-38*i downto 114-38*i)
		sBoxOut0(31-8*i downto 24-8*i) := sb.io.sbOut0
		sBoxOut1(31-8*i downto 24-8*i) := sb.io.sbOut1
	}
	
	rc := io.rc << 24
	w00 := io.ksIn0(127 downto 96) ^ (sBoxOut0(23 downto 0) ## sBoxOut0(31 downto 24)) ^ (B(io.rc.resizeLeft(32)))
	w01 := io.ksIn1(127 downto 96) ^ (sBoxOut1(23 downto 0) ## sBoxOut1(31 downto 24))
	w10 := io.ksIn0( 95 downto 64) ^ w00
	w11 := io.ksIn1( 95 downto 64) ^ w01
	w20 := io.ksIn0( 63 downto 32) ^ w10
	w21 := io.ksIn1( 63 downto 32) ^ w11
	w30 := io.ksIn0( 31 downto  0) ^ w20
	w31 := io.ksIn1( 31 downto  0) ^ w21
	
	io.ksOut0 := w00 ## w10 ## w20 ## w30
	io.ksOut1 := w01 ## w11 ## w21 ## w31
}