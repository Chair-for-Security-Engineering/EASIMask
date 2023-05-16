package AES.MaskedCanright

import spinal.core._

/* Canright SBox for AES as a masked and an unmasked version */

/* Masked Canright SBox
*  Inputs:	A:	1st share of the input
* 					M:	2nd share of the input (= input mask)
*  					S:	2nd share of the output (= output mask)
*  Outputs:	Q: 	1st share of the output
*  (S^Q) = SBox(A^M)
*  */


class CanrightSBoxMasked extends Component {
	val io = new Bundle {
		val A = in  Bits(8 bits)
		val M = in  Bits(8 bits)
		val S = in  Bits(8 bits)
		val Q = out Bits(8 bits)
	}
	
	val dummy = Reg(Bool()) init(False)
	val ATransformed, MTransformed, STransformed, AInv = Bits(8 bits)
	
	val inv = new G256InvMaskedOptimized
	
	/* Transform A and M from polynomial to normal basis. Assume S
	*  is in normal basis after applying the affine transform of the SBox
	*  -> need to apply inverse affine transform at the start
	*   */
	val transform1, transform2, transform3 = new NewBasis
	transform1.io.input := io.A
	transform1.io.direction := False
	ATransformed := transform1.io.output
	
	transform2.io.input := io.M
	transform2.io.direction := False
	MTransformed := transform2.io.output
	
	STransformed(7) := io.S(7)^io.S(4)
	STransformed(6) := io.S(6)^io.S(4)^io.S(1)^io.S(0)
	STransformed(5) := io.S(6)^io.S(4)
	STransformed(4) := io.S(6)^io.S(3)^io.S(1)^io.S(0)
	STransformed(3) := io.S(7)^io.S(6)^io.S(4)
	STransformed(2) := io.S(7)^io.S(5)^io.S(2)
	STransformed(1) := io.S(4)^io.S(3)^io.S(0)
	STransformed(0) := io.S(6)^io.S(5)^io.S(4)^io.S(1)^io.S(0)
	
	/* Invert A */
	inv.io.A := ATransformed
	inv.io.M := MTransformed
	inv.io.S := STransformed
	AInv := inv.io.AInv
	
	/* Transform a^(-1) back */
	transform3.io.input := AInv
	transform3.io.direction := True
	io.Q := transform3.io.output ^ B"8'h63"
}

/* Unmasked Canright SBox */

class CanrightSBox extends Component {
	val io = new Bundle {
		val subBytesInput		= in  Bits(8 bits)
		val subBytesOutput	= out Bits(8 bits)
	}
	
	val dummy = Reg(Bool()) init(False)
	val t, x = Bits(8 bits)
	
	/* Convert input from polynomial to normal basis */
	val convertBasis1, convertBasis2 = new NewBasis
	convertBasis1.io.input := io.subBytesInput
	convertBasis1.io.direction := False
	t := convertBasis1.io.output
	
	/* Invert */
	val inv = new G256Inv
	inv.io.t := t
	x := inv.io.x
	
	/* Transform back, combined with affine from SBox */
	convertBasis2.io.input := x
	convertBasis2.io.direction := True
	
	/* XOR and set output */
	io.subBytesOutput := convertBasis2.io.output ^ B"8'h63"
}


