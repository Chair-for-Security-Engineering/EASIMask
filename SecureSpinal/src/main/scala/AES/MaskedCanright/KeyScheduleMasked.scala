package AES.MaskedCanright

import spinal.core._

/* Masked Key Schedule of the AES Encryption, using the Canright SBox
	 Inputs: 	keyScheduleInput:		shared key
	 					m:									new mask for the output of the SBox
	 					RC:									round constant
	 Outputs:	keyScheduleOutput:	updated shared key
 */

class KeyScheduleMasked extends Component {
	val io = new Bundle {
		val keyScheduleInput 	= in  Vec(Bits(128 bits), 2)
		val m									= in  Bits(32 bits)
		val RC								= in  Bits(8 bits)
		val keyScheduleOutput	= out Vec(Bits(128 bits), 2)
	}
	
	val w1, w2, w3, w4, SB, m1, m2, m3, m4 = Bits(32 bits)
	
	/* Calculate the SBox of the 4 rightmost bytes, mask with the new mask */
	for (i <- 0 until 4) {
		val sBox = new CanrightSBoxMasked
		sBox.io.A := io.keyScheduleInput(0)(31-8*i downto 24-8*i)
		sBox.io.M := io.keyScheduleInput(1)(31-8*i downto 24-8*i)
		sBox.io.S := io.m(31-8*i downto 24-8*i)
		SB(31-8*i downto 24-8*i) := sBox.io.Q
	}
	
	/* Set the updated key and the updated mask */
	w1 := io.keyScheduleInput(0)(127 downto 96) ^ (SB(23 downto 0) ## SB(31 downto 24)) ^ io.RC.resizeLeft(32)
	w2 := io.keyScheduleInput(0)( 95 downto 64) ^ w1
	w3 := io.keyScheduleInput(0)( 63 downto 32) ^ w2
	w4 := io.keyScheduleInput(0)( 31 downto  0) ^ w3
	
	m1 := io.keyScheduleInput(1)(127 downto 96) ^ (io.m(23 downto 0) ## io.m(31 downto 24))
	m2 := io.keyScheduleInput(1)( 95 downto 64) ^ m1
	m3 := io.keyScheduleInput(1)( 63 downto 32) ^ m2
	m4 := io.keyScheduleInput(1)( 31 downto  0) ^ m3
	
	io.keyScheduleOutput(0) := w1 ## w2 ## w3 ## w4
	io.keyScheduleOutput(1) := m1 ## m2 ## m3 ## m4
}
