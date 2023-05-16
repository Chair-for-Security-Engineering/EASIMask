package AES.DOM

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random
import scala.collection.mutable.ArrayBuffer

class DomDepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomDepMul] = null
	val d = 2
	val n = d+1
	val randBits = d*(d+1)/2+d+1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomDepMul(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomDepMul(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, b = ArrayBuffer[Boolean]()
				for (j <- 0 until n) {
					a += Random.nextBoolean(); b += Random.nextBoolean()
				}
				a += false; b += false
				for (j <- 0 until n) {
					a(n) ^= a(j); b(n) ^= b(j)
				}
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				for (j <- 0 until randBits) dut.io.m(j) #= Random.nextBoolean()
				dut.clockDomain.waitSampling(2)
				var res = false
				for (j <- 0 until n) res ^= dut.io.z(j).toBoolean
				assert(res == (a(0) & b(0)))
			}
		}
	}
}

class DomDepMul4Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomDepMul4Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomDepMul4Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomDepMul4Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 10) {
				val a, b = ArrayBuffer[Boolean]()
				for (j <- 0 until 4) {
					a += Random.nextBoolean(); b += Random.nextBoolean()
				}
				a += false; b += false
				for (j <- 0 until 4) {
					a(4) ^= a(j); b(4) ^= b(j)
				}
				for (j <- 0 until 4) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				for (j <- 0 until 10) {
					dut.io.m(j) #= Random.nextBoolean()
				}
				dut.clockDomain.waitSampling(2)
				var res = false
				//for (j <- 0 until 4) c += dut.io.z(j).toBoolean
				for (j <- 0 until 4) res ^= dut.io.z(j).toBoolean
				assert(res == (a(0)&b(0)))
			}
		}
	}
}

class DomDepMul3Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomDepMul3Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomDepMul3Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomDepMul3Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 10) {
				val a, b, c, m = ArrayBuffer[Boolean]()
				for (j <- 0 until 3) {
					a += Random.nextBoolean(); b += Random.nextBoolean()
				}
				a += a(0) ^ a(1) ^ a(2); b += b(0) ^ b(1) ^ b(2)
				for (j <- 0 until 6) {
					m += Random.nextBoolean()
				}
				for (j <- 0 until 3) {
					dut.io.x(j) #= a(j + 1)
					dut.io.y(j) #= b(j + 1)
				}
				for (j <- 0 until 6) dut.io.m(j) #= m(j)
				dut.clockDomain.waitSampling(2)
				for (j <- 0 until 3) c += dut.io.z(j).toBoolean
				var res = false
				for (j <- 0 until 3) res ^= c(j)
				assert(res == (a(0) & b(0)))
			}
		}
	}
}

class DomDepMul2Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomDepMul2Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomDepMul2Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomDepMul2Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 10) {
				val x, y, x1, y1, m0, m1, m2 = Random.nextBoolean()
				val x2 = x^x1; val y2 = y^y1
				dut.io.x(0) #= x1
				dut.io.x(1) #= x2
				dut.io.y(0) #= y1
				dut.io.y(1) #= y2
				dut.io.m(0) #= m0
				dut.io.m(1) #= m1
				dut.io.m(2) #= m2
				dut.clockDomain.waitSampling(2)
				assert((dut.io.z(0).toBoolean^dut.io.z(1).toBoolean) == (x&y))
			}
		}
	}
}