package AES.Serial

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class AES_Serial_TB extends AnyFunSuite {
	var compiled: SimCompiled[AES_Serial] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new AES_Serial)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Serial)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			//dut.clockDomain.forkStimulus(10)
			dut.io.enable #= false
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			dut.io.reset #= true
			dut.io.plaintext.valid #= false
			dut.io.key.valid #= false
			sleep (160)
			
			val plaintext = Seq(0x6B, 0xC1, 0xBE, 0xE2, 0x2E, 0x40, 0x9F, 0x96, 0xE9, 0x3D, 0x7E, 0x11, 0x73, 0x93, 0x17, 0x2A)
			val key 			= Seq(0x2B, 0x7E, 0x15, 0x16, 0x28, 0xAE, 0xD2, 0xA6, 0xAB, 0xF7, 0x15, 0x88, 0x09, 0xCF, 0x4F, 0x3C)
			
			dut.io.reset #= false
			dut.io.enable #= true
			
			waitUntil(dut.io.plaintext.ready.toBoolean && dut.io.key.ready.toBoolean)
			//sleep(10)
			if (dut.io.plaintext.ready.toBoolean && dut.io.key.ready.toBoolean) {
				for (i <- plaintext.indices) {
					dut.io.plaintext.valid #= true
					dut.io.plaintext.payload #= plaintext(i)
					dut.io.key.valid #= true
					dut.io.key.payload #= key(i)
					sleep(10)
				}
			}
			
			sleep(10)
			dut.io.plaintext.valid #= false
			dut.io.key.valid #= false
			sleep(500)
			/*var pt = BigInt("6BC1BEE22E409F96E93D7E117393172A", 16)
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