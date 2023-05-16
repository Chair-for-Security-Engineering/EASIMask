package AES.Serial

import spinal.core._

class SBoxMasked extends Component {
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val sbIn0 	= in  Bits(8 bits)
		val sbIn1 	= in  Bits(8 bits)
		val m 			= in  Bits(28 bits)
		val sbOut0 	= out Bits(8 bits)
		val sbOut1 	= out Bits(8 bits)
	}
	
	val convert0, convert1, convert2, convert3 = new NewBasis
	convert0.io.input := io.sbIn0
	convert0.io.direction := False
	
	convert1.io.input := io.sbIn1
	convert1.io.direction := False
	
	val inv = new G256Inv2Shares5Stages
	inv.io.clk := io.clk
	inv.io.reset := io.reset
	inv.io.x(0) := convert0.io.output
	inv.io.x(1) := convert1.io.output
	inv.io.m := io.m
	
	convert2.io.input := inv.io.z(0)
	convert2.io.direction := True
	
	convert3.io.input := inv.io.z(1)
	convert3.io.direction := True
	
	io.sbOut0 := convert2.io.output ^ B"8'h63"
	io.sbOut1 := convert3.io.output
}