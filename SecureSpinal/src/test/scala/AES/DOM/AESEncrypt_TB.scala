package AES.DOM

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random

class AESEncryptDOM_TB extends AnyFunSuite {
	var compiled: SimCompiled[AESEncryptDOM] = null
	var i = 0
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new AESEncryptDOM)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.io.reset #= true
			dut.clockDomain.waitSampling(1)
			
			val plaintext = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
			val key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)
			val ciphertext = BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16)
			
			val p0, k0 = BigInt(128, Random)
			val p1 = plaintext ^ p0
			val k1 = key ^ k0
			
			dut.io.p0 #= p0
			dut.io.p1 #= p1
			dut.io.k0 #= k0
			dut.io.k1 #= k1
			dut.io.m #= BigInt(760, Random)
			dut.io.reset #= false
			var j = 0
			while (!dut.io.done.toBoolean) {
				dut.clockDomain.waitSampling(1)
				j += 1
				if (j == 5) {
					dut.io.m #= BigInt(760, Random)
					j = 0
				}
			}
			val res = dut.io.c0.toBigInt ^ dut.io.c1.toBigInt
			assert(res == ciphertext)
			//dut.clockDomain.waitSampling(100)
		}
	}
}