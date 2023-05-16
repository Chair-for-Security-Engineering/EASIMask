package Cryptol.KECCAK

import spinal.core._

class RhoPi extends Component {
	val io = new Bundle {
		val rhoIn 	= in  Bits(1600 bits)
		val rhoOut 	= out Bits(1600 bits)
	}
	
	val rotations = Seq(0, 1, 62, 28, 27, 36, 44, 6, 55, 20, 3, 10, 43, 25, 39, 41, 45, 15, 21, 8, 18, 2, 61, 56, 14)
	var j = 0
	for (i <- 0 until 25) {
		io.rhoOut((24-j)*64+63 downto (24-j)*64) := io.rhoIn((24-i)*64+63 downto (24-i)*64).rotateLeft(rotations(i))
		if ((i%5==4)) j = (j + 1)%25
		else j = (j + 10)%25
	}
	
	/*io.rhoOut(1599 downto 1536) := io.rhoIn(1599 downto 1536).rotateLeft( 0)
	io.rhoOut(1535 downto 1472) := io.rhoIn(1215 downto 1152).rotateLeft(44)
	io.rhoOut(1471 downto 1408) := io.rhoIn( 831 downto  768).rotateLeft(43)
	io.rhoOut(1407 downto 1344) := io.rhoIn( 447 downto  384).rotateLeft(21)
	io.rhoOut(1343 downto 1280) := io.rhoIn(  63 downto    0).rotateLeft(14)
	io.rhoOut(1279 downto 1216) := io.rhoIn(1407 downto 1344).rotateLeft(28)
	io.rhoOut(1215 downto 1152) := io.rhoIn(1023 downto  960).rotateLeft(20)
	io.rhoOut(1151 downto 1088) := io.rhoIn( 959 downto  896).rotateLeft( 3)
	io.rhoOut(1087 downto 1024) := io.rhoIn( 575 downto  512).rotateLeft(45)
	io.rhoOut(1023 downto  960) := io.rhoIn( 191 downto  128).rotateLeft(61)
	io.rhoOut( 959 downto  896) := io.rhoIn(1535 downto 1472).rotateLeft( 1)
	io.rhoOut( 895 downto  832) := io.rhoIn(1151 downto 1088).rotateLeft( 6)
	io.rhoOut( 831 downto  768) := io.rhoIn( 767 downto  704).rotateLeft(25)
	io.rhoOut( 767 downto  704) := io.rhoIn( 383 downto  320).rotateLeft( 8)
	io.rhoOut( 703 downto  640) := io.rhoIn( 319 downto  256).rotateLeft(18)
	io.rhoOut( 639 downto  576) := io.rhoIn(1343 downto 1280).rotateLeft(27)
	io.rhoOut( 575 downto  512) := io.rhoIn(1279 downto 1216).rotateLeft(36)
	io.rhoOut( 511 downto  448) := io.rhoIn( 895 downto  832).rotateLeft(10)
	io.rhoOut( 447 downto  384) := io.rhoIn( 511 downto  448).rotateLeft(15)
	io.rhoOut( 383 downto  320) := io.rhoIn( 127 downto   64).rotateLeft(56)
	io.rhoOut( 319 downto  256) := io.rhoIn(1471 downto 1408).rotateLeft(62)
	io.rhoOut( 255 downto  192) := io.rhoIn(1087 downto 1024).rotateLeft(55)
	io.rhoOut( 191 downto  128) := io.rhoIn( 703 downto  640).rotateLeft(39)
	io.rhoOut( 127 downto   64) := io.rhoIn( 639 downto  576).rotateLeft(41)
	io.rhoOut(  63 downto    0) := io.rhoIn( 255 downto  192).rotateLeft( 2)*/
}

class RhoPi800 extends Component {
	val io = new Bundle {
		val rhoIn 	= in  Bits(800 bits)
		val rhoOut 	= out Bits(800 bits)
	}
	
	io.rhoOut(799 downto 768) := io.rhoIn(799 downto 768).rotateLeft( 0)
	io.rhoOut(767 downto 736) := io.rhoIn(607 downto 576).rotateLeft(44)
	io.rhoOut(735 downto 704) := io.rhoIn( 415 downto  384).rotateLeft(43)
	io.rhoOut(703 downto 672) := io.rhoIn( 223 downto  192).rotateLeft(21)
	io.rhoOut(671 downto 640) := io.rhoIn(  31 downto    0).rotateLeft(14)
	io.rhoOut(639 downto 608) := io.rhoIn(703 downto 672).rotateLeft(28)
	io.rhoOut(607 downto 576) := io.rhoIn(511 downto 480).rotateLeft(20)
	io.rhoOut(575 downto 544) := io.rhoIn( 479 downto  448).rotateLeft( 3)
	io.rhoOut(543 downto 512) := io.rhoIn( 287 downto  256).rotateLeft(45)
	io.rhoOut(511 downto 480) := io.rhoIn(95 downto   64).rotateLeft(61)
	io.rhoOut( 479 downto  448) := io.rhoIn(767 downto 736).rotateLeft( 1)
	io.rhoOut( 447 downto  416) := io.rhoIn(575 downto 544).rotateLeft( 6)
	io.rhoOut( 415 downto  384) := io.rhoIn( 383 downto  352).rotateLeft(25)
	io.rhoOut( 383 downto  352) := io.rhoIn( 191 downto  160).rotateLeft( 8)
	io.rhoOut( 351 downto  320) := io.rhoIn( 159 downto  128).rotateLeft(18)
	io.rhoOut( 319 downto  288) := io.rhoIn(671 downto 640).rotateLeft(27)
	io.rhoOut( 287 downto  256) := io.rhoIn(639 downto 608).rotateLeft(36)
	io.rhoOut( 255 downto  224) := io.rhoIn( 447 downto  416).rotateLeft(10)
	io.rhoOut( 223 downto  192) := io.rhoIn( 255 downto  224).rotateLeft(15)
	io.rhoOut( 191 downto  160) := io.rhoIn( 63 downto   32).rotateLeft(56)
	io.rhoOut( 159 downto  128) := io.rhoIn(735 downto 704).rotateLeft(62)
	io.rhoOut( 127 downto   96) := io.rhoIn(543 downto 512).rotateLeft(55)
	io.rhoOut( 95 downto   64) := io.rhoIn( 351 downto  320).rotateLeft(39)
	io.rhoOut( 63 downto   32) := io.rhoIn( 319 downto  288).rotateLeft(41)
	io.rhoOut( 31 downto    0) := io.rhoIn( 127 downto   96).rotateLeft( 2)
}

class RhoPi400 extends Component {
	val io = new Bundle {
		val rhoIn 	= in  Bits(400 bits)
		val rhoOut 	= out Bits(400 bits)
	}
	
	val rotations = Seq(0, 1, 62, 28, 27, 36, 44, 6, 55, 20, 3, 10, 43, 25, 39, 41, 45, 15, 21, 8, 18, 2, 61, 56, 14)
	var j = 0
	for (i <- 0 until 25) {
		io.rhoOut((24-j)*16+15 downto (24-j)*16) := io.rhoIn((24-i)*16+15 downto (24-i)*16).rotateLeft(rotations(i))
		if ((i%5==4)) j = (j + 1)%25
		else j = (j + 10)%25
	}
	
	/*io.rhoOut(1599 downto 1536) := io.rhoIn(1599 downto 1536).rotateLeft( 0)
	io.rhoOut(1535 downto 1472) := io.rhoIn(1215 downto 1152).rotateLeft(44)
	io.rhoOut(1471 downto 1408) := io.rhoIn( 831 downto  768).rotateLeft(43)
	io.rhoOut(1407 downto 1344) := io.rhoIn( 447 downto  384).rotateLeft(21)
	io.rhoOut(1343 downto 1280) := io.rhoIn(  63 downto    0).rotateLeft(14)
	io.rhoOut(1279 downto 1216) := io.rhoIn(1407 downto 1344).rotateLeft(28)
	io.rhoOut(1215 downto 1152) := io.rhoIn(1023 downto  960).rotateLeft(20)
	io.rhoOut(1151 downto 1088) := io.rhoIn( 959 downto  896).rotateLeft( 3)
	io.rhoOut(1087 downto 1024) := io.rhoIn( 575 downto  512).rotateLeft(45)
	io.rhoOut(1023 downto  960) := io.rhoIn( 191 downto  128).rotateLeft(61)
	io.rhoOut( 959 downto  896) := io.rhoIn(1535 downto 1472).rotateLeft( 1)
	io.rhoOut( 895 downto  832) := io.rhoIn(1151 downto 1088).rotateLeft( 6)
	io.rhoOut( 831 downto  768) := io.rhoIn( 767 downto  704).rotateLeft(25)
	io.rhoOut( 767 downto  704) := io.rhoIn( 383 downto  320).rotateLeft( 8)
	io.rhoOut( 703 downto  640) := io.rhoIn( 319 downto  256).rotateLeft(18)
	io.rhoOut( 639 downto  576) := io.rhoIn(1343 downto 1280).rotateLeft(27)
	io.rhoOut( 575 downto  512) := io.rhoIn(1279 downto 1216).rotateLeft(36)
	io.rhoOut( 511 downto  448) := io.rhoIn( 895 downto  832).rotateLeft(10)
	io.rhoOut( 447 downto  384) := io.rhoIn( 511 downto  448).rotateLeft(15)
	io.rhoOut( 383 downto  320) := io.rhoIn( 127 downto   64).rotateLeft(56)
	io.rhoOut( 319 downto  256) := io.rhoIn(1471 downto 1408).rotateLeft(62)
	io.rhoOut( 255 downto  192) := io.rhoIn(1087 downto 1024).rotateLeft(55)
	io.rhoOut( 191 downto  128) := io.rhoIn( 703 downto  640).rotateLeft(39)
	io.rhoOut( 127 downto   64) := io.rhoIn( 639 downto  576).rotateLeft(41)
	io.rhoOut(  63 downto    0) := io.rhoIn( 255 downto  192).rotateLeft( 2)*/
}