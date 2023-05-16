package Cryptol.ChaCha20

import spinal.core._
import spinal.core.sim._
import org.scalatest.funsuite.AnyFunSuite

import scala.util.Random

class ChaCha20_TB extends AnyFunSuite {
	var compiled: SimCompiled[ChaCha20] = null
	
	test("Compile") {
		compiled = SimConfig.withWave.compile(new ChaCha20)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/ChaCha20/RTL").generate(new ChaCha20)
	}
	
	test ("Testbench") {
		compiled.doSim(seed = 42) {dut =>
			
			dut.io.enable #= false
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			sleep(160)
			dut.io.reset #= true
			sleep(100)
			
			dut.io.reset #= false
			dut.io.enable #= true
			//val p1 = BigInt("D300000000000000", 16)
			val p1 = BigInt("00000000000000D3", 16)
			val p2 = BigInt("0000000000000000", 16)
			val p3 = BigInt("0000000000000000", 16)
			val p4 = BigInt("0000000000000000", 16)
			val p5 = BigInt("0000000000000000", 16)
			val p6 = BigInt("0000000000000000", 16)
			val p7 = BigInt("0000000000000000", 16)
			val p8 = BigInt("0000000000000000", 16)
			val p9 = BigInt("0000000000000000", 16)
			val p10 = BigInt("0000000000000000", 16)
			val p11 = BigInt("0000000000000000", 16)
			val p12 = BigInt("0000000000000000", 16)
			val p13 = BigInt("0000000000000000", 16)
			val p14 = BigInt("0000000000000000", 16)
			val p15 = BigInt("0000000000000000", 16)
			val p16 = BigInt("0000000000000000", 16)
			val p17 = BigInt("0000000000000000", 16)
			//val p18 = BigInt("0000000000000080", 16)
			val p18 = BigInt("8000000000000000", 16)
			val p19 = BigInt("0000000000000000", 16)
			val p20 = BigInt("0000000000000000", 16)
			val p21 = BigInt("0000000000000000", 16)
			val p22 = BigInt("0000000000000000", 16)
			val p23 = BigInt("0000000000000000", 16)
			val p24 = BigInt("0000000000000000", 16)
			val p25 = BigInt("0000000000000000", 16)
			/*dut.io.keccakIn #= ((p1 << (24*64)) | (p2 << (23*64)) | (p3 << (22*64)) | (p4 << (21*64)) | (p5 << (20*64)) | (p6 << (19*64)) | (p7 << (18*64))
			 | (p8 << (17*64)) | (p9 << (16*64)) | (p10 << (15*64)) | (p11 << (14*64)) | (p12 << (13*64)) | (p13 << (12*64)) | (p14 << (11*64)) | (p15 << (10*64))
			 | (p16 << (9*64)) | (p17 << (8*64)) | (p18 << (7*64)) | (p19 << (6*64)) | (p20 << (5*64)) | (p21 << (4*64)) | (p22 << (3*64)) | (p23 << (2*64))
			 | (p24 << (1*64)) | (p25 << (0*64)))*/
			dut.io.plaintext #= 0
			dut.io.key #= BigInt("000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f", 16)
			dut.io.ctr #= 1
			dut.io.nonce #= BigInt("000000090000004A00000000", 16)
			waitUntil(dut.io.done.toBoolean)
			sleep(10)
			//assert(dut.io.keccakOut.toBigInt == BigInt("17D7BA96DAD5BAFFEC6867DC0602338901336BCA2DB3B1AE332F9D94AB7496485C7F6690901C88E8D5B5A90007ACDEE7AC876F3510A7D2EBF48E7BEFDB247D1DA3F31DCE491DBD19FD629B636F6324ECF368868A6199E68AC58137ECC110F360EB862F2D60E9D9E7CF6A39DEC09CAFA66B0E6595807E8295F79A5BDECDF5ACDA39AFBE43C624B1171748F66155B01C40A85077E9F1D020F8A2711F1FE4857FC45A3F80F39C84D996A412A212414FF12CEB710001685B10B3F8180FACC2E54B6B3C12D4415B85ADBC", 16))
			//println(dut.io.keccakOut.toBigInt.toString(16).toUpperCase())
		}
	}
}