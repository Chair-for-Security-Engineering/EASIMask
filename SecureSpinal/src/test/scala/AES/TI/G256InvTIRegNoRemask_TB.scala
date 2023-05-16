package AES.TI

import AES.Software.{Polynomial, SBox}
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random

class SBoxTI_TB extends AnyFunSuite {
	var compiled: SimCompiled[SBoxTI] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new SBoxTI)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 3) {
				val a = i
				val a1, a2 = BigInt(8, Random)
				val a3 = a^a1^a2
				
				val c = new SBox
				val res = c.canrightSBox(new Polynomial(a, 256))
				
				dut.io.SBoxIn(0) #= a1
				dut.io.SBoxIn(1) #= a2
				dut.io.SBoxIn(2) #= a3
				dut.io.m #= BigInt(48, Random)
				
				dut.clockDomain.waitSampling(5)
				assert((dut.io.SBoxOut(0).toBigInt^dut.io.SBoxOut(1).toBigInt^dut.io.SBoxOut(2).toBigInt) == res)
			}
		}
	}
}

class G256InvTIRegRemasked_TB extends AnyFunSuite {
	var compiled: SimCompiled[G256InvTIRegRemasked] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G256InvTIRegRemasked)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.io.t.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a = i
				val a1, a2 = BigInt(8, Random)
				val a3 = a^a1^a2
				val c = new Polynomial(initValue = a, gf = 256)
				val res = c.invertPoly256(c).getValue
				
				dut.io.t(0) #= a1
				dut.io.t(1) #= a2
				dut.io.t(2) #= a3
				dut.io.m #= BigInt(48, Random)
				
				dut.clockDomain.waitSampling(5)
				assert((dut.io.x(0).toBigInt^dut.io.x(1).toBigInt^dut.io.x(2).toBigInt) == res)
			}
		}
	}
}

class G256InvTIRegNoRemask_TB extends AnyFunSuite {
	var compiled: SimCompiled[G256InvTIRegNoRemask] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G256InvTIRegNoRemask)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.io.t.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a = i
				val a1, a2 = BigInt(8, Random)
				val a3 = a^a1^a2
				val c = new Polynomial(initValue = a, gf = 256)
				val res = c.invertPoly256(c).getValue
				
				dut.io.t(0) #= a1
				dut.io.t(1) #= a2
				dut.io.t(2) #= a3
				
				dut.clockDomain.waitSampling(5)
				assert((dut.io.x(0).toBigInt^dut.io.x(1).toBigInt^dut.io.x(2).toBigInt) == res)
			}
		}
	}
}

class G16InvTIRegRemasked_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16InvTIRegRemasked] = null
	
	test("Compile") {
		compiled = SimConfig.compile(new G16InvTIRegRemasked)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.io.a.map(_ #= 0)
			dut.io.b.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, a1, a2 = BigInt(4, Random)
				val a3 = a^a1^a2
				val c = new Polynomial(0, 16)
				val res = c.g16Inv(a.toInt)
				
				dut.io.a(0) #= a1
				dut.io.a(1) #= a2
				dut.io.a(2) #= a3
				dut.io.m #= BigInt(4, Random)
				
				dut.clockDomain.waitSampling(2)
				assert((dut.io.b(0).toBigInt^dut.io.b(1).toBigInt^dut.io.b(2).toBigInt) == res)
			}
		}
	}
}

class G16InvTIReg_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16InvTIReg] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16InvTIReg)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.io.a.map(_ #= 0)
			dut.io.b.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, a1, a2 = BigInt(4, Random)
				val a3 = a^a1^a2
				val c = new Polynomial(0, 16)
				val res = c.g16Inv(a.toInt)
				
				dut.io.a(0) #= a1
				dut.io.a(1) #= a2
				dut.io.a(2) #= a3
				
				dut.clockDomain.waitSampling(2)
				assert((dut.io.b(0).toBigInt^dut.io.b(1).toBigInt^dut.io.b(2).toBigInt) == res)
			}
		}
	}
}

class G16MulTIRegRemask_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16MulTIRegRemask] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16MulTIRegRemask)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.io.a.map(_ #= 0)
			dut.io.b.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a, b, a1, a2, b1, b2 = BigInt(4, Random)
				val a3 = a^a1^a2
				val b3 = b^b1^b2
				val c = new Polynomial(0, 16)
				val res = c.g16Mul(a.toInt, b.toInt)
				
				dut.io.a(0) #= a1
				dut.io.a(1) #= a2
				dut.io.a(2) #= a3
				dut.io.b(0) #= b1
				dut.io.b(1) #= b2
				dut.io.b(2) #= b3
				dut.io.m #= BigInt(12, Random)
				
				dut.clockDomain.waitSampling(2)
				assert((dut.io.c(0).toBigInt^dut.io.c(1).toBigInt^dut.io.c(2).toBigInt) == res)
			}
		}
	}
}

class G16MulTIReg_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16MulTIReg] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16MulTIReg)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.io.a.map(_ #= 0)
			dut.io.b.map(_ #= 0)
			
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a, b, a1, a2, b1, b2 = BigInt(4, Random)
				val a3 = a^a1^a2
				val b3 = b^b1^b2
				val c = new Polynomial(0, 16)
				val res = c.g16Mul(a.toInt, b.toInt)
				
				dut.io.a(0) #= a1
				dut.io.a(1) #= a2
				dut.io.a(2) #= a3
				dut.io.b(0) #= b1
				dut.io.b(1) #= b2
				dut.io.b(2) #= b3
				
				dut.clockDomain.waitSampling(2)
				assert((dut.io.c(0).toBigInt^dut.io.c(1).toBigInt^dut.io.c(2).toBigInt) == res)
			}
		}
	}
}