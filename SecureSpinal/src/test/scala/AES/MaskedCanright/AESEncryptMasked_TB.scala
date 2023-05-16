package AES.MaskedCanright

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable._
import scala.util.Random

class AESEncryptMasked_TB extends AnyFunSuite {
	var compiled: SimCompiled[AESEncryptMasked] = null
	var i = 0
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new AESEncryptMasked)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "tester/src/main/scala/spinal/tester/AES/MaskedCanright/RTL").generate(new AESEncryptMasked)
		SpinalConfig(mode = Verilog, targetDirectory = "tester/src/main/scala/spinal/tester/AES/MaskedCanright/RTL").generate(new AESEncryptMasked)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.io.reset #= true
			dut.clockDomain.waitSampling(1)
			
			val plaintexts = ArrayBuffer[BigInt](BigInt("6BC1BEE22E409F96E93D7E117393172A", 16),
				BigInt("AE2D8A571E03AC9C9EB76FAC45AF8E51", 16))
			val key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)
			val ciphertexts = ArrayBuffer[BigInt](BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16),
				BigInt("F5D3D58503B9699DE785895A96FDBAAF", 16))
			
			for(i <- 0 until 2) {
				var j = 0
				val p1, k1 = BigInt(128, Random)
				val p2 = plaintexts(i) ^ p1
				val k2 = key ^ k1
				
				dut.io.p(0) #= p1
				dut.io.p(1) #= p2
				dut.io.k(0) #= k1
				dut.io.k(1) #= k2
				dut.io.m #= BigInt(160, Random)
				dut.io.reset #= false
				while ((j < 100) && !dut.io.done.toBoolean) {
					j = j + 1
					dut.io.m #= BigInt(256, Random)
					dut.clockDomain.waitSampling(1)
				}
				
				assert((dut.io.c(0).toBigInt^dut.io.c(1).toBigInt) == ciphertexts(i))
				dut.io.reset #= true
				dut.clockDomain.waitSampling(10)
			}
		}
	}
}
