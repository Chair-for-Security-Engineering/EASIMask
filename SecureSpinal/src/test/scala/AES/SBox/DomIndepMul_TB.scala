package AES.SBox

import spinal.core._
import spinal.core.sim._

import scala.util.Random
import org.scalatest.funsuite.AnyFunSuite

import scala.collection.mutable.ArrayBuffer
import AES.Software.Polynomial

import scala.math.BigDecimal.int2bigDecimal

class DomIndepMul_TB extends AnyFunSuite {
	var compiled: SimCompiled[DomIndepMul] = null
	
	test ("Compile") {
		compiled = SimConfig.withWave.compile(new DomIndepMul)
	}
	
	test ("GenerateHDL") {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/SBox/RTL").generate(new DomIndepMul)
		SpinalConfig(mode = Verilog, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/SBox/RTL").generate(new DomIndepMul)
	}
	
	test ("Testbench") {
		compiled.doSim (seed = 42) {dut =>
			ClockDomain(dut.io.clk, dut.io.reset).forkStimulus(10)
			dut.io.reset #= true
			sleep(160)
			
			for (i <- 0 until 100) {
				dut.io.reset #= true
				sleep (100)
				dut.io.reset #= false
				val a, b = ArrayBuffer[BigInt]()
				for (j <- 0 until 3) {
					a += BigInt(4, Random)
					b += BigInt(4, Random)
				}
				a += a(0) ^ a(1) ^ a(2)
				b += b(0) ^ b(1) ^ b(2)
				for (j <- 0 until 3) {
					dut.io.x(j) #= a(j+1)
					dut.io.y(j) #= b(j+1)
					dut.io.m(j) #= 0
				}
				sleep(20)
				val response = dut.io.z(0).toBigInt ^ dut.io.z(1).toBigInt ^ dut.io.z(2).toBigInt
				val p = new Polynomial(0, 16)
				val result = p.g16Mul(a(0).toInt, b(0).toInt)
				//println("Inputs: " + a(0).toString(16) + b(0).toString(16))
				//println("Response: " + response.toString(16))
				//println("Correct Result: " + result.toBigInt.toString(16))
				assert(response == result)
				dut.io.reset #= true
				sleep(100)
			}
		}
	}
}