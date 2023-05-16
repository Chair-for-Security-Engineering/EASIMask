package Cryptol.PRESENT

import spinal.core._
import spinal.core.sim._
import org.scalatest.funsuite.AnyFunSuite

class present128_TB extends AnyFunSuite {
	var compiled: SimCompiled[present128] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new present128)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new present128)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			
			dut.io.enable #= false
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.assertReset()
			sleep(160)
			
			dut.clockDomain.deassertReset()
			dut.io.plaintext1 #= BigInt("0000000000000000", 16)
			dut.io.plaintext2 #= BigInt("0000000000000000", 16)
			dut.io.plaintext3 #= BigInt("0000000000000000", 16)
			dut.io.key1 #= BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)
			dut.io.key2 #= BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)
			dut.io.key3 #= BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)
			dut.io.enable #= true
			
			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			val ciphertext = dut.io.ciphertext1.toBigInt^dut.io.ciphertext2.toBigInt^dut.io.ciphertext3.toBigInt
			println(ciphertext.toString(16).toUpperCase())
			//assert(dut.io.ciphertext.toBigInt == BigInt("5579C1387B228445", 16))
			dut.io.enable #= false
			dut.clockDomain.assertReset()
			sleep(100)
			
//			dut.clockDomain.deassertReset()
//			dut.io.plaintext #= BigInt("0000000000000000", 16)
//			dut.io.key #= BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
//			dut.io.enable #= true
//
//			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
//			assert(dut.io.ciphertext.toBigInt == BigInt("E72C46C0F5945049", 16))
//			dut.io.enable #= false
//			dut.clockDomain.assertReset()
//			sleep(100)
//
//			dut.clockDomain.deassertReset()
//			dut.io.plaintext #= BigInt("1234567890ABCDEF", 16)
//			dut.io.key #= BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
//			dut.io.enable #= true
//
//			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
//			assert(dut.io.ciphertext.toBigInt == BigInt("BC28817D85561BFC", 16))
//			dut.io.enable #= false
//			dut.clockDomain.assertReset()
			//sleep(100)
		}
	}
}