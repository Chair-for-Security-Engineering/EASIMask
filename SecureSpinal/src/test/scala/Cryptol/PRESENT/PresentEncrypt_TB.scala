package Cryptol.PRESENT

import spinal.core._
import spinal.core.sim._
import org.scalatest.funsuite.AnyFunSuite

class PresentEncrypt_TB extends AnyFunSuite {
	var compiled: SimCompiled[presentEncrypt] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new presentEncrypt)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new presentEncrypt)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			
			dut.io.enable #= false
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.assertReset()
			sleep(160)
			
			dut.clockDomain.deassertReset()
			dut.io.plaintext #= BigInt("0000000000000000", 16)
			dut.io.key #= BigInt("00000000000000000000", 16)
			dut.io.enable #= true
			
			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			assert(dut.io.ciphertext.toBigInt == BigInt("5579C1387B228445", 16))
			dut.io.enable #= false
			dut.clockDomain.assertReset()
			sleep(100)
			
			dut.clockDomain.deassertReset()
			dut.io.plaintext #= BigInt("0000000000000000", 16)
			dut.io.key #= BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			dut.io.enable #= true
			
			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			assert(dut.io.ciphertext.toBigInt == BigInt("E72C46C0F5945049", 16))
			dut.io.enable #= false
			dut.clockDomain.assertReset()
			sleep(100)
			
			dut.clockDomain.deassertReset()
			dut.io.plaintext #= BigInt("1234567890ABCDEF", 16)
			dut.io.key #= BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			dut.io.enable #= true
			
			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			assert(dut.io.ciphertext.toBigInt == BigInt("BC28817D85561BFC", 16))
			dut.io.enable #= false
			dut.clockDomain.assertReset()
			//sleep(100)
		}
	}
}