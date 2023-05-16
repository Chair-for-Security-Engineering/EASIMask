package AES.DOM

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random
import scala.collection.mutable.ArrayBuffer

class DomIndepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomIndepMul] = null
	val d = 8
	val n = d+1
	val randBits = d*(d+1)/2
	val numTests = 10*d
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomIndepMul(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomIndepMul(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until numTests) {
				val a, b, c, m = ArrayBuffer[Boolean]()
				for (j <- 0 until n) {
					a += Random.nextBoolean(); b += Random.nextBoolean()
				}
				a += false; b += false
				for (j <- 0 until n) {
					a(n) ^= a(j); b(n) ^= b(j)
				}
				for (j <- 0 until randBits) {
					m += Random.nextBoolean()
				}
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				for (j <- 0 until randBits) {
					dut.io.m(j) #= m(j)
				}
				dut.clockDomain.waitSampling(2)
				var res = false
				for (j <- 0 until n) {
					res ^= dut.io.z(j).toBoolean
				}
				assert(res == (a(0)&b(0)))
			}
		}
	}
}

class DomIndepMul4Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomIndepMul4Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomIndepMul4Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomIndepMul4Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b, c, m = ArrayBuffer[Boolean]()
				for (j <- 0 until 4) {
					a += Random.nextBoolean(); b += Random.nextBoolean()
				}
				for (j <- 0 until 6) {
					m += Random.nextBoolean()
				}
				a += a(0)^a(1)^a(2)^a(3); b += b(0)^b(1)^b(2)^b(3)
				for (j <- 0 until 4) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				for (j <- 0 until 6) {
					dut.io.m(j) #= m(j)
				}
				dut.clockDomain.waitSampling(2)
				for (j <- 0 until 4) {
					c += dut.io.z(j).toBoolean
				}
				assert((c(0)^c(1)^c(2)^c(3)) == (a(0)&b(0)))
			}
		}
	}
}

class DomIndepMul3Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomIndepMul3Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomIndepMul3Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomIndepMul3Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b, c, m = ArrayBuffer[Boolean]()
				for (j <- 0 until 3) {
					a += Random.nextBoolean(); b += Random.nextBoolean(); m += Random.nextBoolean()
				}
				a += a(0)^a(1)^a(2); b += b(0)^b(1)^b(2)
				for (j <- 0 until 3) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
					dut.io.m(j) #= m(j)
				}
				dut.clockDomain.waitSampling(2)
				for (j <- 0 until 3) {
					c += dut.io.z(j).toBoolean
				}
				assert((c(0)^c(1)^c(2)) == (a(0)&b(0)))
			}
		}
	}
}

class DomIndepMul2Shares_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomIndepMul2Shares] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new DomIndepMul2Shares)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new DomIndepMul2Shares)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 10) {
				val x, y, x1, y1, m = Random.nextBoolean()
				val x2 = x ^ x1; val y2 = y ^ y1
				dut.io.x(1) #= x1
				dut.io.x(0) #= x2
				dut.io.y(1) #= y1
				dut.io.y(0) #= y2
				dut.io.m #= m
				dut.clockDomain.waitSampling(2)
				assert((dut.io.z(1).toBoolean^dut.io.z(0).toBoolean) == (x&y))
			}
		}
	}
}