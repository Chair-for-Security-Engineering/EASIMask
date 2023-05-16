package Cryptol.AES

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class AES_Wrapper_TB extends AnyFunSuite {
	var compiled: SimCompiled[AES_Wrapper] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new AES_Wrapper)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new AES_Wrapper)
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
			var pt1 = BigInt(128, Random)
			var pt2 = pt ^ pt1
			/*dut.io.dataIn(0) #= pt1
			dut.io.dataIn(1) #= pt2
			dut.io.dataIn(2) #= pt3*/
			/*dut.io.dataIn(0*64+63 downto 0*64) #= pt1
			dut.io.dataIn(1*64+63 downto 1*64) #= pt2
			dut.io.dataIn(2*64+63 downto 2*64) #= pt3*/
			dut.io.dataIn #= ((pt2 << 1*128) | (pt1 << 0))
			var key = BigInt("2B7E151628AED2A6ABF7158809CF4F3C", 16)
			var key1 = BigInt(128, Random)
			var key2 = key ^ key1
			/*dut.io.key(0) #= key1
			dut.io.key(1) #= key2
			dut.io.key(2) #= key3*/
			dut.io.key #= ((key2 << 1*128) | (key1 << 0))
			dut.io.enable #= true
			
			waitUntil(dut.io.done.toBoolean)
			sleep(10)
			var ct1 = (dut.io.dataOut.toBigInt >> 1*128) & BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)
			var ct2 = (dut.io.dataOut.toBigInt >> 0*128) & BigInt("FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF", 16)
			//var ciphertext = (dut.io.dataOut(0).toBigInt^dut.io.dataOut(1).toBigInt^dut.io.dataOut(2).toBigInt)
			var ciphertext = ct1 ^ ct2
			//println(pt1.toString(16).toUpperCase, pt2.toString(16).toUpperCase, pt3.toString(16).toUpperCase)
		//	println(key1.toString(16).toUpperCase, key2.toString(16).toUpperCase, key3.toString(16).toUpperCase)
			//println(ct1.toString(16).toUpperCase, ct2.toString(16).toUpperCase, ct3.toString(16).toUpperCase, ciphertext.toString(16).toUpperCase)
			assert(ciphertext == BigInt("3AD77BB40D7A3660A89ECAF32466EF97", 16))
			dut.io.enable #= false
			sleep (100)
			dut.io.reset #= true
			//dut.io.enable #= false
			
			sleep (100)
		}
	}
}