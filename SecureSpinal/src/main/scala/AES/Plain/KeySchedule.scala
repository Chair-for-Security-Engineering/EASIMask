package AES.Plain

import spinal.core._
//import spinal.tester.AES.CanrightSBox.SubBytes

class KeySchedule() extends Component {
	val io = new Bundle {
		val keyScheduleInput 	= in  Bits(128 bits)
		val roundConstant 		= in  Bits(8 bits)
		val keyScheduleOutput 	= out Bits(128 bits)
	}
	
	val w1, w2, w3, w0 = Bits(32 bits)
	val sBoxOut = Bits(32 bits)
	
	for (i <- 0  until 4) {
		val sBox = new SubBytes()
		sBox.io.subBytesInput := io.keyScheduleInput(31-8*i downto 24-8*i)
		sBoxOut(31-8*i downto 24-8*i) := sBox.io.subBytesOutput
	}
	
	w0 := io.keyScheduleInput(127 downto 96) ^ (sBoxOut(23 downto 0) ## sBoxOut(31 downto 24)) ^ (B(io.roundConstant.resizeLeft(32)))
	w1 := io.keyScheduleInput( 95 downto 64) ^ w0
	w2 := io.keyScheduleInput( 63 downto 32) ^ w1
	w3 := io.keyScheduleInput( 31 downto  0) ^ w2
	
	io.keyScheduleOutput := w0 ## w1 ## w2 ## w3
}
