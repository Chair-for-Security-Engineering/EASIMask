package AES.Matrix

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class AES_TB extends AnyFunSuite {
	var compiled: SimCompiled[AES] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new AES)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Matrix/RTL").generate(new AES)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			//dut.clockDomain.forkStimulus(10)
			dut.io.enable #= false
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			dut.io.reset #= true
			sleep (160)
			
			dut.io.reset #= false
			var pt = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
			dut.io.plaintext #= pt
			var key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)

			dut.io.key #= key
			dut.io.enable #= true
			
			waitUntil(dut.io.done.toBoolean)
			//sleep(500)
			//var ciphertext = (dut.io.dataOut(0).toBigInt^dut.io.dataOut(1).toBigInt^dut.io.dataOut(2).toBigInt)
			//println(pt1.toString(16).toUpperCase, pt2.toString(16).toUpperCase, pt3.toString(16).toUpperCase)
			//	println(key1.toString(16).toUpperCase, key2.toString(16).toUpperCase, key3.toString(16).toUpperCase)
			//println(ct1.toString(16).toUpperCase, ct2.toString(16).toUpperCase, ct3.toString(16).toUpperCase, ciphertext.toString(16).toUpperCase)
			assert(dut.io.ciphertext.toBigInt == BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16))
			dut.io.enable #= false
			sleep (100)
			dut.io.reset #= true
			//dut.io.enable #= false
			
			sleep (100)
		}
	}
}