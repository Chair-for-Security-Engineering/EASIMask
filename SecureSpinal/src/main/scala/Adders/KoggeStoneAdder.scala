package Adders

import spinal.core._

class KoggeStoneAdder extends Component {
	val io = new Bundle {
		val x = in  Bits(4 bits)
		val y = in  Bits(4 bits)
		val z = out Bits(4 bits)
	}
	
	val dummy = Reg(Bool())
	val G00, G01, G02, G03, P00, P01, P02, P03 = Bool()
	val G11, G12, G13, P11, P12, P13 = Bool()
	val G22, G23, P22, P23 = Bool()
	val c0, c1, c2, c3 = Bool()
	val s0, s1, s2, s3 = Bool()
	
	c0 := False
	
	G00 := io.x(0) & io.y(0)
	G01 := io.x(1) & io.y(1)
	G02 := io.x(2) & io.y(2)
	G03 := io.x(3) & io.y(3)
	P00 := io.x(0) ^ io.y(0)
	P01 := io.x(1) ^ io.y(1)
	P02 := io.x(2) ^ io.y(2)
	P03 := io.x(3) ^ io.y(3)
	
	G11 := (P01 & G00) ^ G01
	P11 := P01 & P00
	G12 := (P02 & G01) ^ G02
	P12 := P02 & P01
	G13 := (P03 & G02) ^ G03
	P13 := P03 & P02
	
	G22 := (P12 & G00) ^ G12
	P22 := P12 & P00
	G23 := (P13 & G11) ^ G13
	P23 := P13 & P11
	
	c1 := G00
	c2 := G11
	c3 := G22
	
	s0 := io.x(0) ^ io.y(0) ^ c0
	s1 := io.x(1) ^ io.y(1) ^ c1
	s2 := io.x(2) ^ io.y(2) ^ c2
	s3 := io.x(3) ^ io.y(3) ^ c3
	
	io.z := s3 ## s2 ## s1 ## s0
}