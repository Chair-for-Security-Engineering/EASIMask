package Adders

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class RippleCarryAdder_TB extends AnyFunSuite {
	var compiled: SimCompiled[RippleCarryAdder] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new RippleCarryAdder)
	}
	
	test ("Generate HDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Adders/RTL").generate(new RippleCarryAdder)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.deassertReset()
			//dut.clockDomain.waitSampling(18)
			for (i <- 0 until 100) {
				val x, y = BigInt(4, Random)
				dut.io.x #= x
				dut.io.y #= y
				dut.clockDomain.waitSampling(1)
				val z = dut.io.z.toBigInt
				assert(z == (x+y)%16)
				dut.clockDomain.waitSampling(1)
			}
		}
	}
}


class RippleCarryAdderNBit_TB extends AnyFunSuite {
	var compiled: SimCompiled[RippleCarryAdderNBit] = null
	val n = 32
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new RippleCarryAdderNBit(n))
	}
	
	test ("Generate HDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Adders/RTL").generate(new RippleCarryAdderNBit(n))
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.deassertReset()
			//dut.clockDomain.waitSampling(18)
			for (i <- 0 until 100) {
				val x, y = BigInt(n, Random)
				dut.io.x #= x
				dut.io.y #= y
				dut.clockDomain.waitSampling(1)
				val z = dut.io.z.toBigInt
				val res = (x + y) & 0x7FFFFFFF
				println(z, res, (res & 0x7FFFFFFF))
				//println(x, y, (z& BigInt(0xFFFFFFFF)).toString(16).toUpperCase(), ((x+y)& BigInt(0xFFFFFFFF)).toString(16).toUpperCase())
				assert(z == res)
				dut.clockDomain.waitSampling(1)
			}
		}
	}
}