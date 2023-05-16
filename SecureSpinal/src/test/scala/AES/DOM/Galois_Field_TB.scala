package AES.DOM

import AES.Software.Polynomial
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random
import scala.collection.mutable.ArrayBuffer

class GFMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[GFMul] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new GFMul(16))
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 10) {
				val a, b = BigInt(4, Random)
				dut.io.x #= a
				dut.io.y #= b
				val c = new Polynomial(0, 4)
				val res = c.g16Mul(a.toInt, b.toInt)
				dut.clockDomain.waitSampling(1)
				assert(dut.io.z.toInt == res)
			}
		}
	}
}

class G256Inv2Shares5Stages_TB extends AnyFunSuite {
	var compiled: SimCompiled[G256Inv2Shares5Stages] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G256Inv2Shares5Stages)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G256Inv2Shares5Stages)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			val ret = ArrayBuffer[BigInt]()
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(8, Random); b += BigInt(8, Random)
				}
				a += 0; b += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j); b(2) ^= b(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					//dut.io.y(j) #= b(j+1)
					//dut.io.m(j) #= BigInt(4, Random)
				}
				dut.io.m #= BigInt(38, Random)
				//dut.clockDomain.waitSampling(5)
				val c = new Polynomial(a(0).toInt, 256)
				ret += BigInt(c.invertPoly256(c).getValue)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				dut.clockDomain.waitSampling(1)
				if (i >= 5) {
					assert(ret(i-5) == res)
				}
				//assert(res == ret)
			}
		}
	}
}

class G16Inv2SharesDepPipelined_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16Inv2SharesDep] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16Inv2SharesDep)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			val res = ArrayBuffer[BigInt]()
			
			for (i <- 0 until 50) {
				val a = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(4, Random)
				}
				a += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
				}
				dut.io.m #= BigInt(12, Random)
				val c = new Polynomial(0, 256)
				res += c.g16Inv(a(0).toInt)
				var ret: BigInt = 0
				for (j <- 0 until 2) {
					ret ^= dut.io.z(j).toBigInt
				}
				dut.clockDomain.waitSampling(1)
				if (i >= 3) {
					assert(res(i-3) == ret)
				}
			}
		}
	}
}

class G16Inv2SharesDep_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16Inv2SharesDep] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16Inv2SharesDep)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G16Inv2SharesDep)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(4, Random)
				}
				a += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					//dut.io.y(j) #= b(j+1)
					//dut.io.m(j) #= BigInt(4, Random)
				}
				dut.io.m #= BigInt(12, Random)
				dut.clockDomain.waitSampling(3)
				val c = new Polynomial(0, 256)
				val ret = c.g16Inv(a(0).toInt)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				println(res, ret)
				assert(res == ret)
			}
		}
	}
}

class G16Mul2SharesDepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16Mul2SharesDepMul] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16Mul2SharesDepMul)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G16Mul2SharesDepMul)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(4, Random); b += BigInt(4, Random)
				}
				a += 0; b += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j); b(2) ^= b(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				dut.io.m #= BigInt(12, Random)
				dut.clockDomain.waitSampling(2)
				val c = new Polynomial(0, 256)
				val ret = c.g16Mul(a(0).toInt, b(0).toInt)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				assert(res == ret)
			}
		}
	}
}

class G4Mul2SharesDepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[G4Mul2SharesDepMul] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G4Mul2SharesDepMul)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G4Mul2SharesDepMul)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			val ret = ArrayBuffer[BigInt]()
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(2, Random); b += BigInt(2, Random)
				}
				a += 0; b += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j); b(2) ^= b(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				dut.io.m #= BigInt(6, Random)
				val c = new Polynomial(0, 256)
				ret += c.g4Mul(a(0).toInt, b(0).toInt)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				dut.clockDomain.waitSampling(1)
				if (i >= 2) {
					assert(ret(i-2) == res)
				}
				//assert(res == ret)
			}
		}
	}
}

class G16Mul2SharesInDepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[G16Mul2SharesIndepMul] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G16Mul2SharesIndepMul)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G16Mul2SharesIndepMul)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(4, Random); b += BigInt(4, Random)
				}
				a += 0; b += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j); b(2) ^= b(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				dut.io.m #= BigInt(4, Random)
				dut.clockDomain.waitSampling(2)
				val c = new Polynomial(0, 256)
				val ret = c.g16Mul(a(0).toInt, b(0).toInt)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				assert(res == ret)
			}
		}
	}
}

class G4Mul2SharesInDepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[G4Mul2SharesIndepMul] = null
	val d = 1
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new G4Mul2SharesIndepMul)
	}
	
	test("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/AES/DOM/RTL").generate(new G4Mul2SharesIndepMul)
	}
	
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 20) {
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 2) {
					a += BigInt(2, Random); b += BigInt(2, Random)
				}
				a += 0; b += 0
				for (j <- 0 until 2) {
					a(2) ^= a(j); b(2) ^= b(j)
				}
				for (j <- 0 until 2) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
				}
				dut.io.m #= BigInt(2, Random)
				dut.clockDomain.waitSampling(2)
				val c = new Polynomial(0, 256)
				val ret = c.g4Mul(a(0).toInt, b(0).toInt)
				var res: BigInt = 0
				for (j <- 0 until 2) res ^= dut.io.z(j).toBigInt
				assert(res == ret)
			}
		}
	}
}