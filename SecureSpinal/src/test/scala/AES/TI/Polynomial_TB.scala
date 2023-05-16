package AES.TI

import AES.Software.Polynomial
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random
import scala.collection.mutable.ArrayBuffer

class G256InvTIMaskedN_TB extends AnyFunSuite {
	var compiled: SimCompiled[G256InvTIMaskedN] = null
	val d = 6
	val n = 2*d+1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G256InvTIMaskedN(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/TI/RTL").generate(new G256InvTIMaskedN(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a = ArrayBuffer[BigInt]()
				a += i
				for (j <- 0 until n-1) {
					a += BigInt(8, Random)
				}
				a += 0
				for (j <- 0 until n) {
					a(n) = a(n) ^ a(j)
				}
				val c1 = new Polynomial(i, 256)
				val res = c1.invertPoly256(c1).getValue
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j+1)
				}
				dut.clockDomain.waitSampling(1)
				var ret: BigInt = 0
				for (j <- 0 until n) {
					ret ^= dut.io.z(j).toBigInt
				}
				assert(ret == res)
			}
		}
	}
}

class G16InvTIMaskedN_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16InvTIMaskedN] = null
	val d = 1
	val n = 2*d+1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16InvTIMaskedN(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/TI/RTL").generate(new G16InvTIMaskedN(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, c = ArrayBuffer[BigInt]()
				for (j <- 0 until n) {
					a += BigInt(4, Random)
				}
				a += 0
				for (j <- 0 until n) {
					a(n) = a(n) ^ a(j)
				}
				val c1 = new Polynomial(0, 256)
				val res = c1.g16Inv(a(0).toInt)
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j+1)
				}
				dut.clockDomain.waitSampling(1)
				var ret: BigInt = 0
				for (j <- 0 until n) {
					ret ^= dut.io.z(j).toBigInt
				}
				assert(ret == res)
			}
		}
	}
}

class G16MulTIMaskedN_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16MulTIMaskedN] = null
	val d = 1
	val n = 2*d+1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16MulTIMaskedN(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/TI/RTL").generate(new G16MulTIMaskedN(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 100) {
				val a, b, c = scala.collection.mutable.ArrayBuffer[BigInt]()
				for (j <- 0 until n) {
					a += BigInt(4, Random); b += BigInt(4, Random)
				}
				a += 0; b += 0
				for (j <- 0 until n) {
					a(n) = a(n) ^ a(j)
					b(n) = b(n) ^ b(j)
				}
				
				val c1 = new Polynomial(0, 256)
				val res = c1.g16Mul(a(0).toInt, b(0).toInt)
				
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				dut.clockDomain.waitSampling(1)
				var ret: BigInt = 0
				for (j <- 0 until n) {
					ret = ret ^ dut.io.z(j).toBigInt
				}
				
				assert(ret == res)
			}
		}
	}
}

class G4MulTIMaskedN_TB extends AnyFunSuite {
	var compiled: SimCompiled[G4MulTIMaskedN] = null
	val d = 4
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G4MulTIMaskedN(d))
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/TI/RTL").generate(new G4MulTIMaskedN(d))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			val n = 2*d+1
			for (i <- 0 until 100) {
				var a, b, c = scala.collection.mutable.ArrayBuffer[BigInt]()
				val a1, b1 = BigInt(2, Random)
				for (j <- 0 until n-1) {
					a += BigInt(2, Random)
					b += BigInt(2, Random)
				}
				a += a1; b += b1;
				for (j <- 0 until n-1) {
					a(n-1) = a(n-1) ^ a(j)
					b(n-1) = b(n-1) ^ b(j)
				}
				
				val c1 = new Polynomial(0, 256)
				val res = c1.g4Mul(a1.toInt, b1.toInt)
				
				for (j <- 0 until n) {
					dut.io.x(j) #= a(j)
					dut.io.y(j) #= b(j)
				}
				
				dut.clockDomain.waitSampling(1)
				
				for (j <- 0 until n) {
					c += dut.io.z(j).toBigInt
				}
				
				var ret: BigInt = 0
				for (i <- 0 until n) {
					ret = ret ^ c(i)
				}
				assert(ret == res)
				/*assert(((c(0)^c(1)^c(2)^c(3)^c(4)) & 0x2) == (res & 0x2))
				assert(((c(0)^c(1)^c(2)^c(3)^c(4)) & 0x1) == (res & 0x1))*/
			}
		}
	}
}

class G4MulTIMasked5_TB extends AnyFunSuite {
	var compiled: SimCompiled[G4MulTIMasked5] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G4MulTIMasked5)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/TI/RTL").generate(new G4MulTIMasked5)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			

			for (i <- 0 until 10) {
				var a, b, c = scala.collection.mutable.ArrayBuffer[BigInt]()
				val a1, b1 = BigInt(2, Random)
				for (j <- 0 until 4) {
					a += BigInt(2, Random)
					b += BigInt(2, Random)
				}
				a += a1; b += b1;
				for (j <- 0 until 4) {
					a(4) = a(4) ^ a(j)
					b(4) = b(4) ^ b(j)
				}
				
				val c1 = new Polynomial(0, 256)
				val res = c1.g4Mul(a1.toInt, b1.toInt)
				
				for (j <- 0 until 5) {
					dut.io.x(j) #= a(j)
					dut.io.y(j) #= b(j)
				}
				
				dut.clockDomain.waitSampling(1)
				
				for (j <- 0 until 5) {
					c += dut.io.z(j).toBigInt
				}
				
				assert((c(0)^c(1)^c(2)^c(3)^c(4)) == res)
			}
		}
	}
}