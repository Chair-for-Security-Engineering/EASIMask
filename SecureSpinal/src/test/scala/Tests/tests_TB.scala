package Tests

import org.scalatest.funsuite.AnyFunSuite
import spinal.core._
import spinal.core.sim._

import scala.collection.mutable.ArrayBuffer

/*class ModeTestECB_TB extends AnyFunSuite {
	var compiled: SimCompiled[ModeTest_ECB] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new ModeTest_ECB)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			val plaintexts = ArrayBuffer[BigInt](
				BigInt("6BC1BEE22E409F96E93D7E117393172A", 16),
				BigInt("AE2D8A571E03AC9C9EB76FAC45AF8E51", 16),
				BigInt("00010203040506070809101112131415", 16))
			val key = BigInt("00010001000100010001000100010001", 16)
			val ciphertexts = ArrayBuffer[BigInt]()
			dut.clockDomain.forkStimulus(10)
			
			//dut.io.reset #= true
			//dut.io.reset #= true
			dut.clockDomain.assertReset()
			dut.io.blockReady #= false
			dut.io.finalBlock #= false
			var i = 0
			for (i <- plaintexts.indices) {
				//dut.io.reset #= false
				dut.clockDomain.deassertReset()
				dut.io.pt #= plaintexts(i)
				dut.io.key #= key
				dut.io.blockReady #= true
				if (i == plaintexts.length-1) dut.io.finalBlock #= true
				dut.clockDomain.waitSampling(1)
				dut.io.blockReady #= false
				dut.clockDomain.waitSamplingWhere(dut.io.blockDone.toBoolean)
				ciphertexts += dut.io.ct.toBigInt
			}
			if (dut.io.done.toBoolean) println("Done")
			for (i <- plaintexts.indices) {
				assert((plaintexts(i)^key^BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)) == ciphertexts(i))
			}
		}
	}
}

class tests_TB extends AnyFunSuite {
	var compiled: SimCompiled[ModeTest] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new ModeTest)
	}
	
	test("Testbench") {
		compiled.doSim(42) {dut =>
			dut.clockDomain.forkStimulus(10)
			dut.clockDomain.waitSampling(1)
			
			dut.io.reset #= true
			dut.clockDomain.waitSampling(1)
			dut.io.reset #= false
			dut.io.pt  #= BigInt("00010203040506070809101112131415", 16)
			dut.io.key #= BigInt("00010001000100010001000100010001", 16)
			dut.clockDomain.waitSamplingWhere(dut.io.done.toBoolean)
			println(dut.io.ct)
		}
	}
}*/