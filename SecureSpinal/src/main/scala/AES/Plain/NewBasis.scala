package AES.Plain

import spinal.core._

class NewBasis extends Component {
	val io = new Bundle {
		val input 		= in  Bits(8 bits)
		val direction	= in  Bool()
		val output		= out Bits(8 bits)
	}
	
	val dummy = Reg(Bool()) init(False)
	
	val a, b, c = Bits(8 bits)
	a := io.input
	
	b(7) := a(7)^a(6)^a(5)^a(2)^a(1)^a(0)
	b(6) := a(6)^a(5)^a(4)^a(0)
	b(5) := a(6)^a(5)^a(1)^a(0)
	b(4) := a(7)^a(6)^a(5)^a(0)
	b(3) := a(7)^a(4)^a(3)^a(1)^a(0)
	b(2) := a(0)
	b(1) := a(6)^a(5)^a(0)
	b(0) := a(6)^a(3)^a(2)^a(1)^a(0)
	
	c(7) := a(5)^a(3)
	c(6) := a(7)^a(3)
	c(5) := a(6)^a(0)
	c(4) := a(7)^a(5)^a(3)
	c(3) := a(7)^a(6)^a(5)^a(4)^a(3)
	c(2) := a(6)^a(5)^a(3)^a(2)^a(0)
	c(1) := a(5)^a(4)^a(1)
	c(0) := a(6)^a(4)^a(1)
	
	when (!io.direction) {
		io.output := b
	} otherwise {
		io.output := c
	}
}

object generateHDL {
	def main(args: Array[String]): Unit = {
		SpinalVhdl(new NewBasis)
	}
}