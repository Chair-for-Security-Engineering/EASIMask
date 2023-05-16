package AES.DOM

import AES.Software
import AES.Software.{Polynomial, SBox}
import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.util.Random

class SBox_TB extends AnyFunSuite {
	var compiled: SimCompiled[SBox] = null
	
	test("Compile") {
		compiled = SimConfig.compile(new SBox)
	}
	test("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			for (i <- 0 until 256) {
				val a = i
				val a0 = BigInt(8, Random)
				val a1 = a0 ^ a
				dut.io.sbIn0 #= a0
				dut.io.sbIn1 #= a1
				dut.io.m #= BigInt(28, Random)
				dut.clockDomain.waitSampling(5)
				val c = new Software.SBox
				val ret = BigInt(c.SBoxLookUp(a))
				val res = dut.io.sbOut0.toBigInt ^ dut.io.sbOut1.toBigInt
				assert(res == ret)
			}
		}
	}
}