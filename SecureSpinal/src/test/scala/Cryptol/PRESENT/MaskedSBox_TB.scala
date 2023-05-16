package Cryptol.PRESENT

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class MaskedSBox_TB extends AnyFunSuite {
	var compiled: SimCompiled[MaskedSBox] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new MaskedSBox)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new MaskedSBox)
	}
	
	val sbox = Seq(0xC, 0x5, 0x6, 0xB, 0x9, 0x0, 0xA, 0xD, 0x3, 0xE, 0xF, 0x8, 0x4, 0x7, 0x1, 0x2)
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			/*dut.io.in1 #= 0
			dut.io.in2 #= 0
			dut.io.in3 #= 0*/
			for (_ <- 0 until 100) {
				for (i <- 0 until 16) {
					val in1, in2 = BigInt(4, Random)
					val in3 = i ^ in1 ^ in2
					dut.io.in1 #= in1
					dut.io.in2 #= in2
					dut.io.in3 #= in3
					dut.clockDomain.waitSampling(2)
					//println(sbox(i), (dut.io.out1.toBigInt ^ dut.io.out2.toBigInt ^ dut.io.out3.toBigInt))
					assert((dut.io.out1.toBigInt ^ dut.io.out2.toBigInt ^ dut.io.out3.toBigInt) == sbox(i))
				}
			}
			//println((dut.io.out1.toBigInt) ^ dut.io.out2.toBigInt ^ dut.io.out3.toBigInt)
		}
	}
}