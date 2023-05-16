package AES.Serial

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class AES_TB extends AnyFunSuite {
	var compiled: SimCompiled[AES] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new AES(rounds = 11))
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES(rounds = 11))
		SpinalConfig(mode = Verilog, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES(rounds = 11))
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			//dut.clockDomain.forkStimulus(10)
			dut.io.enable #= false
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			dut.io.reset #= true
			dut.io.pt.valid #= false
			dut.io.key.valid #= false
			sleep (160)
			
			val plaintext = Seq(BigInt("6BC1BEE2", 16), BigInt("2E409F96", 16), BigInt("E93D7E11", 16), BigInt("7393172A", 16))
			val key 			= Seq(BigInt("2B7E1516", 16), BigInt("28AED2A6", 16), BigInt("ABF71588", 16), BigInt("09CF4F3C", 16))
			
			dut.io.reset #= false
			dut.io.enable #= true
			
			waitUntil(dut.io.pt.ready.toBoolean && dut.io.key.ready.toBoolean)
			sleep(1)
			if (dut.io.pt.ready.toBoolean && dut.io.key.ready.toBoolean) {
				for (i <- plaintext.indices) {
					dut.io.pt.valid #= true
					dut.io.pt.payload #= plaintext(i)
					dut.io.key.valid #= true
					dut.io.key.payload #= key(i)
					sleep(10)
				}
			}
			
			//sleep(10)
			dut.io.pt.valid #= false
			dut.io.key.valid #= false
			//sleep(500)
			waitUntil(dut.io.ct.valid.toBoolean)
			dut.io.ct.ready #= true
			sleep(10)
			assert(dut.io.ct.payload.toBigInt == BigInt("3AD77BB4", 16))
			sleep(10)
			assert(dut.io.ct.payload.toBigInt == BigInt("0D7A3660", 16))
			sleep(10)
			assert(dut.io.ct.payload.toBigInt == BigInt("A89ECAF3", 16))
			sleep(10)
			assert(dut.io.ct.payload.toBigInt == BigInt("2466EF97", 16))
			/*for (i <- 0 until 4) {
				sleep(10)
				println(dut.io.ct.payload.toBigInt.toString(16))
			}	*/		/*var pt = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
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
			
			sleep (100)*/
		}
	}
}