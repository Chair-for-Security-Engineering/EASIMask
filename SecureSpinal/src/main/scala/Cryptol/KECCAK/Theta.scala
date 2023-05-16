package Cryptol.KECCAK

import spinal.core._

class Theta extends Component {
	val io = new Bundle {
		val thetaIn 	= in  Bits(1600 bits)
		val thetaOut 	= out Bits(1600 bits)
	}
	
	val b = Bits(320 bits)
	b := io.thetaIn(1599 downto 1280) ^ io.thetaIn(1279 downto 960) ^ io.thetaIn(959 downto 640) ^ io.thetaIn(639 downto 320) ^ io.thetaIn(319 downto 0)
	
	val d = Bits(320 bits)
	for (i <- 0 until 5) {
		d(64*i+63 downto 64*i) := b(64*((i+1)%5)+63 downto 64*((i+1)%5)) ^ b(64*((i+4)%5)+63 downto 64*((i+4)%5)).rotateLeft(1)
	}
	/*d(319 downto 256) := b( 63 downto   0) ^ b(255 downto 192).rotateLeft(1)
	d(255 downto 192) := b(319 downto 256) ^ b(191 downto 128).rotateLeft(1)
	d(191 downto 128) := b(255 downto 192) ^ b(127 downto  64).rotateLeft(1)
	d(127 downto  64) := b(191 downto 128) ^ b( 63 downto   0).rotateLeft(1)
	d( 63 downto   0) := b(127 downto  64) ^ b(319 downto 256).rotateLeft(1)*/
	
	for (i <- 0 until 25) {
		io.thetaOut(64*(24-i)+63 downto 64*(24-i)) := io.thetaIn(64*(24-i)+63 downto 64*(24-i)) ^ d((4-(i%5))*64+63 downto (4-(i%5))*64)
	}
	
	/*io.thetaOut(1599 downto 1536) := io.thetaIn(1599 downto 1536) ^ d(319 downto 256)
	io.thetaOut(1535 downto 1472) := io.thetaIn(1535 downto 1472) ^ d(255 downto 192)
	io.thetaOut(1471 downto 1408) := io.thetaIn(1471 downto 1408) ^ d(191 downto 128)
	io.thetaOut(1407 downto 1344) := io.thetaIn(1407 downto 1344) ^ d(127 downto  64)
	io.thetaOut(1343 downto 1280) := io.thetaIn(1343 downto 1280) ^ d( 63 downto   0)
	io.thetaOut(1279 downto 1216) := io.thetaIn(1279 downto 1216) ^ d(319 downto 256)
	io.thetaOut(1215 downto 1152) := io.thetaIn(1215 downto 1152) ^ d(255 downto 192)
	io.thetaOut(1151 downto 1088) := io.thetaIn(1151 downto 1088) ^ d(191 downto 128)
	io.thetaOut(1087 downto 1024) := io.thetaIn(1087 downto 1024) ^ d(127 downto  64)
	io.thetaOut(1023 downto  960) := io.thetaIn(1023 downto  960) ^ d( 63 downto   0)
	io.thetaOut( 959 downto  896) := io.thetaIn( 959 downto  896) ^ d(319 downto 256)
	io.thetaOut( 895 downto  832) := io.thetaIn( 895 downto  832) ^ d(255 downto 192)
	io.thetaOut( 831 downto  768) := io.thetaIn( 831 downto  768) ^ d(191 downto 128)
	io.thetaOut( 767 downto  704) := io.thetaIn( 767 downto  704) ^ d(127 downto  64)
	io.thetaOut( 703 downto  640) := io.thetaIn( 703 downto  640) ^ d( 63 downto   0)
	io.thetaOut( 639 downto  576) := io.thetaIn( 639 downto  576) ^ d(319 downto 256)
	io.thetaOut( 575 downto  512) := io.thetaIn( 575 downto  512) ^ d(255 downto 192)
	io.thetaOut( 511 downto  448) := io.thetaIn( 511 downto  448) ^ d(191 downto 128)
	io.thetaOut( 447 downto  384) := io.thetaIn( 447 downto  384) ^ d(127 downto  64)
	io.thetaOut( 383 downto  320) := io.thetaIn( 383 downto  320) ^ d( 63 downto   0)
	io.thetaOut( 319 downto  256) := io.thetaIn( 319 downto  256) ^ d(319 downto 256)
	io.thetaOut( 255 downto  192) := io.thetaIn( 255 downto  192) ^ d(255 downto 192)
	io.thetaOut( 191 downto  128) := io.thetaIn( 191 downto  128) ^ d(191 downto 128)
	io.thetaOut( 127 downto   64) := io.thetaIn( 127 downto   64) ^ d(127 downto  64)
	io.thetaOut(  63 downto    0) := io.thetaIn(  63 downto    0) ^ d( 63 downto   0)*/
	
}

class Theta800 extends Component {
	val io = new Bundle {
		val thetaIn 	= in  Bits(800 bits)
		val thetaOut 	= out Bits(800 bits)
	}
	
	val b = Bits(160 bits)
	b := io.thetaIn(799 downto 640) ^ io.thetaIn(639 downto 480) ^ io.thetaIn(479 downto 320) ^ io.thetaIn(319 downto 160) ^ io.thetaIn(159 downto 0)
	
	val d = Bits(160 bits)
	d(159 downto 128) := b( 31 downto   0) ^ b(127 downto  96).rotateLeft(1)
	d(127 downto  96) := b(159 downto 128) ^ b( 95 downto  64).rotateLeft(1)
	d( 95 downto  64) := b(127 downto  96) ^ b( 63 downto  32).rotateLeft(1)
	d( 63 downto  32) := b( 95 downto  64) ^ b( 31 downto   0).rotateLeft(1)
	d( 31 downto   0) := b( 63 downto  32) ^ b(159 downto 128).rotateLeft(1)
	
	io.thetaOut(799 downto 768) := io.thetaIn(799 downto 768) ^ d(159 downto 128)
	io.thetaOut(767 downto 736) := io.thetaIn(767 downto 736) ^ d(127 downto  96)
	io.thetaOut(735 downto 704) := io.thetaIn(735 downto 704) ^ d(95 downto  64)
	io.thetaOut(703 downto 672) := io.thetaIn(703 downto 672) ^ d(63 downto  32)
	io.thetaOut(671 downto 640) := io.thetaIn(671 downto 640) ^ d( 31 downto   0)
	io.thetaOut(639 downto 608) := io.thetaIn(639 downto 608) ^ d(159 downto 128)
	io.thetaOut(607 downto 576) := io.thetaIn(607 downto 576) ^ d(127 downto  96)
	io.thetaOut(575 downto 544) := io.thetaIn(575 downto 544) ^ d(95 downto  64)
	io.thetaOut(543 downto 512) := io.thetaIn(543 downto 512) ^ d(63 downto  32)
	io.thetaOut(511 downto 480) := io.thetaIn(511 downto 480) ^ d( 31 downto   0)
	io.thetaOut( 479 downto  448) := io.thetaIn( 479 downto  448) ^ d(159 downto 128)
	io.thetaOut( 447 downto  416) := io.thetaIn( 447 downto  416) ^ d(127 downto  96)
	io.thetaOut( 415 downto  384) := io.thetaIn( 415 downto  384) ^ d(95 downto  64)
	io.thetaOut( 383 downto  352) := io.thetaIn( 383 downto  352) ^ d(63 downto  32)
	io.thetaOut( 351 downto  320) := io.thetaIn( 351 downto  320) ^ d( 31 downto   0)
	io.thetaOut( 319 downto  288) := io.thetaIn( 319 downto  288) ^ d(159 downto 128)
	io.thetaOut( 287 downto  256) := io.thetaIn( 287 downto  256) ^ d(127 downto  96)
	io.thetaOut( 255 downto  224) := io.thetaIn( 255 downto  224) ^ d(95 downto  64)
	io.thetaOut( 223 downto  192) := io.thetaIn( 223 downto  192) ^ d(63 downto  32)
	io.thetaOut( 191 downto  160) := io.thetaIn( 191 downto  160) ^ d( 31 downto   0)
	io.thetaOut( 159 downto  128) := io.thetaIn( 159 downto  128) ^ d(159 downto 128)
	io.thetaOut( 127 downto   96) := io.thetaIn( 127 downto   96) ^ d(127 downto  96)
	io.thetaOut(  95 downto   64) := io.thetaIn( 95 downto   64) ^ d(95 downto  64)
	io.thetaOut(  63 downto   32) := io.thetaIn( 63 downto   32) ^ d(63 downto  32)
	io.thetaOut(  31 downto    0) := io.thetaIn( 31 downto    0) ^ d( 31 downto   0)
}

class Theta400 extends Component {
	val io = new Bundle {
		val thetaIn 	= in  Bits(400 bits)
		val thetaOut 	= out Bits(400 bits)
	}
	
	val b = Bits(80 bits)
	b := io.thetaIn(399 downto 320) ^ io.thetaIn(319 downto 240) ^ io.thetaIn(239 downto 160) ^ io.thetaIn(159 downto 80) ^ io.thetaIn(79 downto 0)
	
	val d = Bits(80 bits)
	for (i <- 0 until 5) {
		d(16*i+15 downto 16*i) := b(16*((i+1)%5)+15 downto 16*((i+1)%5)) ^ b(16*((i+4)%5)+15 downto 16*((i+4)%5)).rotateLeft(1)
	}
	/*d(319 downto 256) := b( 63 downto   0) ^ b(255 downto 192).rotateLeft(1)
	d(255 downto 192) := b(319 downto 256) ^ b(191 downto 128).rotateLeft(1)
	d(191 downto 128) := b(255 downto 192) ^ b(127 downto  64).rotateLeft(1)
	d(127 downto  64) := b(191 downto 128) ^ b( 63 downto   0).rotateLeft(1)
	d( 63 downto   0) := b(127 downto  64) ^ b(319 downto 256).rotateLeft(1)*/
	
	for (i <- 0 until 25) {
		io.thetaOut(16*(24-i)+15 downto 16*(24-i)) := io.thetaIn(16*(24-i)+15 downto 16*(24-i)) ^ d((4-(i%5))*16+15 downto (4-(i%5))*16)
	}
	
	/*io.thetaOut(1599 downto 1536) := io.thetaIn(1599 downto 1536) ^ d(319 downto 256)
	io.thetaOut(1535 downto 1472) := io.thetaIn(1535 downto 1472) ^ d(255 downto 192)
	io.thetaOut(1471 downto 1408) := io.thetaIn(1471 downto 1408) ^ d(191 downto 128)
	io.thetaOut(1407 downto 1344) := io.thetaIn(1407 downto 1344) ^ d(127 downto  64)
	io.thetaOut(1343 downto 1280) := io.thetaIn(1343 downto 1280) ^ d( 63 downto   0)
	io.thetaOut(1279 downto 1216) := io.thetaIn(1279 downto 1216) ^ d(319 downto 256)
	io.thetaOut(1215 downto 1152) := io.thetaIn(1215 downto 1152) ^ d(255 downto 192)
	io.thetaOut(1151 downto 1088) := io.thetaIn(1151 downto 1088) ^ d(191 downto 128)
	io.thetaOut(1087 downto 1024) := io.thetaIn(1087 downto 1024) ^ d(127 downto  64)
	io.thetaOut(1023 downto  960) := io.thetaIn(1023 downto  960) ^ d( 63 downto   0)
	io.thetaOut( 959 downto  896) := io.thetaIn( 959 downto  896) ^ d(319 downto 256)
	io.thetaOut( 895 downto  832) := io.thetaIn( 895 downto  832) ^ d(255 downto 192)
	io.thetaOut( 831 downto  768) := io.thetaIn( 831 downto  768) ^ d(191 downto 128)
	io.thetaOut( 767 downto  704) := io.thetaIn( 767 downto  704) ^ d(127 downto  64)
	io.thetaOut( 703 downto  640) := io.thetaIn( 703 downto  640) ^ d( 63 downto   0)
	io.thetaOut( 639 downto  576) := io.thetaIn( 639 downto  576) ^ d(319 downto 256)
	io.thetaOut( 575 downto  512) := io.thetaIn( 575 downto  512) ^ d(255 downto 192)
	io.thetaOut( 511 downto  448) := io.thetaIn( 511 downto  448) ^ d(191 downto 128)
	io.thetaOut( 447 downto  384) := io.thetaIn( 447 downto  384) ^ d(127 downto  64)
	io.thetaOut( 383 downto  320) := io.thetaIn( 383 downto  320) ^ d( 63 downto   0)
	io.thetaOut( 319 downto  256) := io.thetaIn( 319 downto  256) ^ d(319 downto 256)
	io.thetaOut( 255 downto  192) := io.thetaIn( 255 downto  192) ^ d(255 downto 192)
	io.thetaOut( 191 downto  128) := io.thetaIn( 191 downto  128) ^ d(191 downto 128)
	io.thetaOut( 127 downto   64) := io.thetaIn( 127 downto   64) ^ d(127 downto  64)
	io.thetaOut(  63 downto    0) := io.thetaIn(  63 downto    0) ^ d( 63 downto   0)*/
	
}