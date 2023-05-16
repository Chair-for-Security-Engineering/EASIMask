package AES.Serial

import spinal.core._

class aes_sbox_wrapper extends BlackBox {
	val io = new Bundle {
		val clk 			= in Bool()
		val reset 		= in Bool()
		val sbox_in 	= in Bits(16 bits)
		val mask 			= in Bits(38 bits)
		val sbox_out 	= out Bits(16 bits)
	}
	
	noIoPrefix()
	addRTLPath(s"/rtl/aes_sbox_wrapper.vhd")
}

class SBox extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val sbox_in = in Bits(16 bits)
		val mask = in Bits(38 bits)
		val sbox_out = out Bits(16 bits)
	}
	
	val sb1 = new aes_sbox_wrapper
	sb1.io.clk := io.clk
	sb1.io.reset := io.reset
	sb1.io.sbox_in := io.sbox_in
	sb1.io.mask := io.mask
	io.sbox_out := sb1.io.sbox_out
}