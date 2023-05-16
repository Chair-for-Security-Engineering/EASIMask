package AES.Plain

import spinal.core._

class ShiftRows() extends Component {
	val io = new Bundle {
		val shiftRowsInput 	= in  Bits(128 bits)
		val shiftRowsOutput = out Bits(128 bits)
	}
	
	io.shiftRowsOutput :=
	 io.shiftRowsInput(127 downto 120) ##
	 io.shiftRowsInput( 87 downto  80) ##
     io.shiftRowsInput( 47 downto  40) ##
     io.shiftRowsInput(  7 downto   0) ##
     io.shiftRowsInput( 95 downto  88) ##
	 io.shiftRowsInput( 55 downto  48) ##
	 io.shiftRowsInput( 15 downto   8) ##
	 io.shiftRowsInput(103 downto  96) ##
     io.shiftRowsInput( 63 downto  56) ##
	 io.shiftRowsInput( 23 downto  16) ##
	 io.shiftRowsInput(111 downto 104) ##
	 io.shiftRowsInput( 71 downto  64) ##
	 io.shiftRowsInput( 31 downto  24) ##
	 io.shiftRowsInput(119 downto 112) ##
	 io.shiftRowsInput( 79 downto  72) ##
	 io.shiftRowsInput( 39 downto  32)
}
