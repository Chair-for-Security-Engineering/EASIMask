package Cryptol.ChaCha20

import spinal.core._
import spinal.core.sim._
import org.scalatest.funsuite.AnyFunSuite

import scala.util.Random

class QuarterRound_TB extends AnyFunSuite {
	var compiled: SimCompiled[QuarterRound] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new QuarterRound)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/ChaCha20/RTL").generate(new QuarterRound)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			
			dut.clockDomain.forkStimulus(10)
			sleep(160)
			sleep(100)
			
			dut.io.a #= BigInt("11111111", 16)
			dut.io.b #= BigInt("01020304", 16)
			dut.io.c #= BigInt("9b8d6f43", 16)
			dut.io.d #= BigInt("01234567", 16)
			dut.clockDomain.waitSampling(10)
		}
	}
}