package AES.Cryptol

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable._

class AesEncrypt_Pipelined_TB extends AnyFunSuite {
	var compiled: SimCompiled[AesEncrypt_Pipelined] = null
	var i = 0
	
	test("compile") {
		compiled = SimConfig.withWave.compile(new AesEncrypt_Pipelined)
	}
	
	test("generateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/Plain/RTL").generate(new AesEncrypt_Pipelined)
		//SpinalConfig(mode = Verilog, targetDirectory = "tester/src/main/scala/spinal/tester/AES/Plain/RTL").generate(new AESEncrypt)
	}
	
	test("testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			val plaintexts = ArrayBuffer[BigInt](BigInt("6BC1BEE22E409F96E93D7E117393172A", 16),
				BigInt("AE2D8A571E03AC9C9EB76FAC45AF8E51", 16))
			val ciphertexts = ArrayBuffer[BigInt](BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16),
				BigInt("F5D3D58503B9699DE785895A96FDBAAF", 16))
			
				
				dut.clockDomain.waitSampling(1)
				
				val plaintext = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
				val key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)
				val ciphertext = BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16)
				
				dut.io.pt #= plaintext
				dut.io.key #= key
				dut.clockDomain.waitSampling(1)
				dut.clockDomain.waitSamplingWhere(dut.io.dataValid.toBoolean)
				assert(dut.io.ret.toBigInt == ciphertext)
			
				//for(i <- 0 until 2) {
				dut.io.pt #= plaintexts(0)
				//dut.io.pt #= plaintext
				dut.io.key #= key
				dut.io.inputValid #= true
				dut.clockDomain.waitSampling(1)
				dut.io.pt #= plaintexts(1)
				//dut.clockDomain.waitSampling(100)
				//dut.clockDomain.waitSampling(100)
				dut.clockDomain.waitSamplingWhere(dut.io.dataValid.toBoolean)
				assert(dut.io.ret.toBigInt == ciphertexts(0))
				dut.clockDomain.waitSampling(1)
				assert(dut.io.ret.toBigInt == ciphertexts(1))
				//assert(ciphertexts(i) == dut.io.ret.toBigInt)
				//assert(ciphertext == dut.io.ret.toBigInt)
				dut.clockDomain.waitSampling(1)
				//}
				//dut.io.plaintext #= 0x6BC1BEE22E409F96E93D7E117393172A}
		}
	}
}
