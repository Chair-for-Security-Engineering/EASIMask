package AES.MaskedCanright

import spinal.core._

/* ShiftRows operation, identical to unmasked version as it is linear */

class ShiftRows() extends Component {
	val io = new Bundle {
		val shiftRowsInput 	= in  Bits(128 bits)
		val shiftRowsOutput = out Bits(128 bits)
	}
	
	val a = Bits(128 bits)
	a := io.shiftRowsInput
	
	io.shiftRowsOutput := a(127 downto 120) ## a( 87 downto  80) ##
   a( 47 downto  40) ## a(  7 downto   0) ## a( 95 downto  88) ##
	 a( 55 downto  48) ## a( 15 downto   8) ## a(103 downto  96) ##
   a( 63 downto  56) ## a( 23 downto  16) ## a(111 downto 104) ##
	 a( 71 downto  64) ## a( 31 downto  24) ## a(119 downto 112) ##
	 a( 79 downto  72) ## a( 39 downto  32)
}
