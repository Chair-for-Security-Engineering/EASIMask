package Adders

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class KoggeStoneAdder_TB extends AnyFunSuite {
	var compiled: SimCompiled[KoggeStoneAdder] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new KoggeStoneAdder)
	}
	
	test ("Generate HDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Adders/RTL").generate(new KoggeStoneAdder)
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