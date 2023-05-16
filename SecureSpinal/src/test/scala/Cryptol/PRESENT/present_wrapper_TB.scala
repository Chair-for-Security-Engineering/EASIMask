package Cryptol.PRESENT

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

class present_wrapper_TB extends AnyFunSuite {
	var compiled: SimCompiled[present_wrapper] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new present_wrapper(3))
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/PRESENT/RTL").generate(new present_wrapper(3))
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			//dut.clockDomain.forkStimulus(10)
			dut.io.enable #= false
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			dut.io.reset #= true
			sleep (160)

			dut.io.reset #= false
			var pt = BigInt("0000000000000000", 16)
			var pt1 = BigInt(64, Random)
			var pt2 = BigInt(64, Random)
			var pt3 = pt ^ pt1 ^ pt2
			/*dut.io.dataIn(0) #= pt1
			dut.io.dataIn(1) #= pt2
			dut.io.dataIn(2) #= pt3*/
			/*dut.io.dataIn(0*64+63 downto 0*64) #= pt1
			dut.io.dataIn(1*64+63 downto 1*64) #= pt2
			dut.io.dataIn(2*64+63 downto 2*64) #= pt3*/
			dut.io.dataIn #= ((pt3 << 2*64) | (pt2 << 1*64) | (pt1 << 0))
			var key = BigInt("00000000000000000000", 16)
			var key1 = BigInt(80, Random)
			var key2 = BigInt(80, Random)
			var key3 = key ^ key1 ^ key2
			/*dut.io.key(0) #= key1
			dut.io.key(1) #= key2
			dut.io.key(2) #= key3*/
			dut.io.key #= ((key3 << 2*80) | (key2 << 1*80) | (key1 << 0))
			dut.io.enable #= true
			
			waitUntil(dut.io.done.toBoolean)
			sleep(10)
			var ct1 = (dut.io.dataOut.toBigInt >> 2*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			var ct2 = (dut.io.dataOut.toBigInt >> 1*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			var ct3 = (dut.io.dataOut.toBigInt >> 0*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			//var ciphertext = (dut.io.dataOut(0).toBigInt^dut.io.dataOut(1).toBigInt^dut.io.dataOut(2).toBigInt)
			var ciphertext = ct1 ^ ct2 ^ ct3
			println(pt1.toString(16).toUpperCase, pt2.toString(16).toUpperCase, pt3.toString(16).toUpperCase)
			println(key1.toString(16).toUpperCase, key2.toString(16).toUpperCase, key3.toString(16).toUpperCase)
			println(ct1.toString(16).toUpperCase, ct2.toString(16).toUpperCase, ct3.toString(16).toUpperCase, ciphertext.toString(16).toUpperCase)
			assert(ciphertext == BigInt("5579C1387B228445", 16))
			dut.io.enable #= false
			sleep (100)
			dut.io.reset #= true
			//dut.io.enable #= false
			
			sleep (100)
			
			dut.io.reset #= false
			pt = BigInt("0000000000000000", 16)
			pt1 = BigInt(64, Random)
			pt2 = BigInt(64, Random)
			pt3 = pt ^ pt1 ^ pt2
			/*dut.io.dataIn(0) #= pt1
			dut.io.dataIn(1) #= pt2
			dut.io.dataIn(2) #= pt3*/
			/*dut.io.dataIn(0*64+63 downto 0*64) #= pt1
			dut.io.dataIn(1*64+63 downto 1*64) #= pt2
			dut.io.dataIn(2*64+63 downto 2*64) #= pt3*/
			dut.io.dataIn #= ((pt3 << 2*64) | (pt2 << 1*64) | (pt1 << 0))
			key = BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
			key1 = BigInt(80, Random)
			key2 = BigInt(80, Random)
			key3 = key ^ key1 ^ key2
			/*dut.io.key(0) #= key1
			dut.io.key(1) #= key2
			dut.io.key(2) #= key3*/
			dut.io.key #= ((key3 << 2*80) | (key2 << 1*80) | (key1 << 0))
			dut.io.enable #= true
			
			waitUntil(dut.io.done.toBoolean)
			sleep(10)
			ct1 = (dut.io.dataOut.toBigInt >> 2*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			ct2 = (dut.io.dataOut.toBigInt >> 1*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			ct3 = (dut.io.dataOut.toBigInt >> 0*64) & BigInt("FFFFFFFFFFFFFFFF", 16)
			//var ciphertext = (dut.io.dataOut(0).toBigInt^dut.io.dataOut(1).toBigInt^dut.io.dataOut(2).toBigInt)
			ciphertext = ct1 ^ ct2 ^ ct3
			println(pt1.toString(16).toUpperCase, pt2.toString(16).toUpperCase, pt3.toString(16).toUpperCase)
			println(key1.toString(16).toUpperCase, key2.toString(16).toUpperCase, key3.toString(16).toUpperCase)
			assert(ciphertext == BigInt("E72C46C0F5945049", 16))
			dut.io.enable #= false
			sleep(100)
			dut.io.reset #= true
			
			sleep (100)
			
			for (_ <- 0 until 100) {
				dut.io.reset #= false
				pt = BigInt("1234567890ABCDEF", 16)
				pt1 = BigInt(64, Random)
				pt2 = BigInt(64, Random)
				pt3 = pt ^ pt1 ^ pt2
				dut.io.dataIn #= ((pt3 << 2 * 64) | (pt2 << 1 * 64) | (pt1 << 0))
				key = BigInt("FFFFFFFFFFFFFFFFFFFF", 16)
				key1 = BigInt(80, Random)
				key2 = BigInt(80, Random)
				key3 = key ^ key1 ^ key2
				dut.io.key #= ((key3 << 2 * 80) | (key2 << 1 * 80) | (key1 << 0))
				dut.io.enable #= true
				
				waitUntil(dut.io.done.toBoolean)
				sleep(10)
				dut.io.enable #= false
				sleep(100)
				ct1 = (dut.io.dataOut.toBigInt >> 2 * 64) & BigInt("FFFFFFFFFFFFFFFF", 16)
				ct2 = (dut.io.dataOut.toBigInt >> 1 * 64) & BigInt("FFFFFFFFFFFFFFFF", 16)
				ct3 = (dut.io.dataOut.toBigInt >> 0 * 64) & BigInt("FFFFFFFFFFFFFFFF", 16)
				//var ciphertext = (dut.io.dataOut(0).toBigInt^dut.io.dataOut(1).toBigInt^dut.io.dataOut(2).toBigInt)
				ciphertext = ct1 ^ ct2 ^ ct3
				println(pt1.toString(16).toUpperCase, pt2.toString(16).toUpperCase, pt3.toString(16).toUpperCase)
				println(key1.toString(16).toUpperCase, key2.toString(16).toUpperCase, key3.toString(16).toUpperCase)
				assert(ciphertext == BigInt("BC28817D85561BFC", 16))
				dut.io.reset #= true
				sleep(100)
			}
		}
	}
}