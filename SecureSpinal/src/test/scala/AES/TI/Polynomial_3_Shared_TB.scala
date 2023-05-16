package AES.TI

import AES.Software.Polynomial
import org.scalatest.funsuite.AnyFunSuite
import spinal.core
import spinal.core._
import spinal.core.sim._

import scala.util.Random


class G256InvTIMasked_3_TB extends AnyFunSuite {
	var compiled: SimCompiled[G256InvTIMasked3] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G256InvTIMasked3)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.io.t(0) #= 0
			dut.io.t(1) #= 0
			dut.io.t(2) #= 0
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a = i
				val a1, a2 = BigInt(8, Random)
				val a3 = a^a1^a2
				val c = new Polynomial(a, 256)
				val res = c.invertPoly256(c).getValue
				
				dut.io.t(0) #= a1
				dut.io.t(1) #= a2
				dut.io.t(2) #= a3
				
				dut.clockDomain.waitSampling(1)
				assert((dut.io.x(0).toBigInt^dut.io.x(1).toBigInt^dut.io.x(2).toBigInt) == res)
			}
		}
	}
}


class G16MulTIMasked_3_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16MulTIMasked3] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16MulTIMasked3)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			
			dut.io.x(0) #= 0
			dut.io.x(1) #= 0
			dut.io.x(2) #= 0
			dut.io.y(0) #= 0
			dut.io.y(1) #= 0
			dut.io.y(2) #= 0
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, b, a1, a2, b1, b2 = BigInt(4, Random)
				val a3 = a^a1^a2
				val b3 = b^b1^b2
				val c = new Polynomial(0, 16)
				val res = c.g16Mul(a.toInt, b.toInt)
				
				dut.io.x(0) #= a1
				dut.io.x(1) #= a2
				dut.io.x(2) #= a3
				dut.io.y(0) #= b1
				dut.io.y(1) #= b2
				dut.io.y(2) #= b3
				
				dut.clockDomain.waitSampling(1)
				assert((dut.io.z(0).toBigInt^dut.io.z(1).toBigInt^dut.io.z(2).toBigInt) == res)
			}
		}
	}
}


class G16InvTIMasked_3_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16InvTIMasked3] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16InvTIMasked3)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			
			dut.io.t(0) #= 0
			dut.io.t(1) #= 0
			dut.io.t(2) #= 0
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, a1, a2 = BigInt(4, Random)
				val a3 = a^a1^a2
				
				val c = new Polynomial(0, 16)
				val res = c.g16Inv(a.toInt)
				
				dut.io.t(0) #= a1
				dut.io.t(1) #= a2
				dut.io.t(2) #= a3
				
				dut.clockDomain.waitSampling(1)
				assert((dut.io.x(0).toBigInt^dut.io.x(1).toBigInt^dut.io.x(2).toBigInt) == res)
			}
		}
	}
}


class G4MulTIMasked_3_TB extends AnyFunSuite {
	var compiled: SimCompiled[G4MulTIMasked3] = null
	var i = 0
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G4MulTIMasked3)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(period = 10)
			dut.clockDomain.waitSampling(1)
			var j = 0
			for (i <- 0 until 100) {
				val a, b, a1, a2, b1, b2 = BigInt(2, Random)
				println(a, b)
				val a3 = a ^ a1 ^ a2
				val b3 = b ^ b1 ^ b2
				val c = new Polynomial(0, 256)
				val res = c.g4Mul(a.toInt, b.toInt)
				println(c.g4Mul(a.toInt, b.toInt))
				
				dut.io.x(0) #= a1
				dut.io.x(1) #= a2
				dut.io.x(2) #= a3
				dut.io.y(0) #= b1
				dut.io.y(1) #= b2
				dut.io.y(2) #= b3
				
				
				
				dut.clockDomain.waitSampling(1)
				assert((dut.io.z(0).toBigInt ^ dut.io.z(1).toBigInt ^ dut.io.z(2).toBigInt) == c.g4Mul(a.toInt, b.toInt))
			}
		}
	}
}