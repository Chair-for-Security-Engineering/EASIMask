package AES.JRB

import spinal.core._

class aes_sbox_wrapper(shares : Int) extends BlackBox {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val a 		= in  Bits(8*shares bits)
		val r 		= in  Bits(18*(shares*(shares-1)/2) bits)
		val b 		= out Bits(8*shares bits)
	}
	
	noIoPrefix()
	addRTLPath(s"/RTL/aes_sbox_wrapper.vhd")
}

class SBox(shares : Int) extends Component {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val a 		= in  Bits(8*shares bits)
		val r 		= in  Bits(18*(shares*(shares-1)/2) bits)
		val b 		= out Bits(8*shares bits)
	}
	
	val sbox = new aes_sbox_wrapper(shares)
	sbox.io.clk := io.clk
	sbox.io.reset := io.reset
	sbox.io.a := io.a
	sbox.io.r := io.r
	io.b := sbox.io.b
}