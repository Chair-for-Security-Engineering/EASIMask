package AES.Plain

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable._

class AESEncrypt_TB extends AnyFunSuite {
	var compiled: SimCompiled[AESEncrypt] = null
	var i = 0
	
	test("compile") {
		compiled = SimConfig.withWave.compile(new AESEncrypt)
	}
	
	/*test("generateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "tester/src/main/scala/spinal/tester/AES/Plain/RTL").generate(new AESEncrypt)
		SpinalConfig(mode = Verilog, targetDirectory = "tester/src/main/scala/spinal/tester/AES/Plain/RTL").generate(new AESEncrypt)
	}*/
	
	test("testbench") {
		compiled.doSim(seed = 42) {dut =>
		 	/*val plaintexts = ArrayBuffer[BigInt](BigInt("6BC1BEE22E409F96E93D7E117393172A", 16),
				BigInt("AE2D8A571E03AC9C9EB76FAC45AF8E51", 16))
			val ciphertexts = ArrayBuffer[BigInt](BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16),
				BigInt("F5D3D58503B9699DE785895A96FDBAAF", 16))*/
		 
			dut.clockDomain.forkStimulus(10)
			dut.io.reset #= true
			dut.clockDomain.waitSampling(1)
			
			val plaintext = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
			val key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)
			val ciphertext = BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16)
			
			//for(i <- 0 until 2) {
				//dut.io.plaintext #= plaintexts(i)
				dut.io.plaintext #= plaintext
				dut.io.key #= key
				dut.io.reset #= false
				dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
				//assert(ciphertexts(i) == dut.io.ciphertext.toBigInt)
				assert(ciphertext == dut.io.ciphertext.toBigInt)
				dut.io.reset #= true
				dut.clockDomain.waitSampling(10)
			//}
			//dut.io.plaintext #= 0x6BC1BEE22E409F96E93D7E117393172A
		}
	}
}
