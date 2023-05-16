package Cryptol.PRESENT

import spinal.core._
import spinal.core.sim._
import org.scalatest.funsuite.AnyFunSuite

import scala.util.Random

class PresentEncryptMasked_TB extends AnyFunSuite {
	var compiled: SimCompiled[presentEncryptMasked] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new presentEncryptMasked)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new presentEncryptMasked)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			
			dut.io.enable #= false
			//dut.clockDomain.forkStimulus(10)
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			

			//dut.clockDomain.assertReset()
			sleep(160)
			dut.io.reset #= true
			sleep(20)
			//dut.clockDomain.waitSampling(10)
			
			dut.io.reset #= true
			sleep(20)
			//dut.clockDomain.deassertReset()
			//dut.io.plaintext #= BigInt("0000000000000000", 16)
			var pt = BigInt("0000000000000000", 16)
			var pt1, pt2 = BigInt(64, Random)
			var pt3 = pt ^ pt1 ^ pt2
			dut.io.plaintext1 #= pt1
			dut.io.plaintext2 #= pt2
			dut.io.plaintext3 #= pt3
			var key = BigInt("00000000000000000000", 16)
			var key1, key2 = BigInt(80, Random)
			var key3 = key ^ key1 ^ key2
			dut.io.key1 #= key1
			dut.io.key2 #= key2
			dut.io.key3 #= key3
			//dut.io.key #= BigInt("00000000000000000000", 16)
			sleep(10)
			dut.io.enable #= true
			dut.io.reset #= false
			
			//dut.clockDomain.waitSampling(100)
			waitUntil(dut.io.done.toBoolean)
			sleep(10)
			//dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			//println(BigInt("5579C1387B228445", 16), (dut.io.ciphertext1.toBigInt^dut.io.ciphertext2.toBigInt^dut.io.ciphertext3.toBigInt))
			assert((dut.io.ciphertext1.toBigInt^dut.io.ciphertext2.toBigInt^dut.io.ciphertext3.toBigInt) == BigInt("5579C1387B228445", 16))
			
			dut.io.enable #= false
			//dut.clockDomain.assertReset()
			dut.io.reset #= true
			sleep(100)
			//dut.clockDomain.waitSampling(10)

			//dut.clockDomain.deassertReset()
			//dut.io.plaintext #= BigInt("0000000000000000", 16)
			pt = BigInt("0000000000000000", 16)
			pt1 = BigInt(64, Random)
			pt2 = BigInt(64, Random)
			pt3 = pt ^ pt1 ^ pt2
			dut.io.plaintext1 #= pt1
			dut.io.plaintext2 #= pt2
			dut.io.plaintext3 #= pt3
			//dut.io.key #= BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			key = BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			key1 = BigInt(80, Random)
			key2 = BigInt(80, Random)
			key3 = key ^ key1 ^ key2
			dut.io.key1 #= key1
			dut.io.key2 #= key2
			dut.io.key3 #= key3
			sleep(10)
			dut.io.enable #= true
			dut.io.reset #= false
			
			//dut.clockDomain.waitSampling(100)
			//dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			waitUntil(dut.io.done.toBoolean)
			assert((dut.io.ciphertext1.toBigInt^dut.io.ciphertext2.toBigInt^dut.io.ciphertext3.toBigInt) == BigInt("E72C46C0F5945049", 16))
			
			dut.io.enable #= false
			dut.io.reset #= true
			//dut.clockDomain.assertReset()
			sleep(100)
			//dut.clockDomain.deassertReset()
			
			pt = BigInt("1234567890ABCDEF", 16)
			pt1 = BigInt(64, Random)
			pt2 = BigInt(64, Random)
			pt3 = pt ^ pt1 ^ pt2
			dut.io.plaintext1 #= pt1
			dut.io.plaintext2 #= pt2
			dut.io.plaintext3 #= pt3
			key = BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			key1 = BigInt(80, Random)
			key2 = BigInt(80, Random)
			key3 = key ^ key1 ^ key2
			dut.io.key1 #= key1
			dut.io.key2 #= key2
			dut.io.key3 #= key3
			sleep(10)
			dut.io.enable #= true
			dut.io.reset #= false
			
			waitUntil(dut.io.done.toBoolean)
			//dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			var ciphertext = (dut.io.ciphertext1.toBigInt^dut.io.ciphertext2.toBigInt^dut.io.ciphertext3.toBigInt)
			println(ciphertext.toString(16).toUpperCase)
			//assert(dut.io.ciphertext.toBigInt == BigInt("BC28817D85561BFC", 16))
		}
	}
}