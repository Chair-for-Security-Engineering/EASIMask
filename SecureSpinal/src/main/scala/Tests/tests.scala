package Tests

import AES.DOM.AddRoundKey
import AES.Plain._
import spinal.core._
import spinal.lib.fsm._
import spinal.lib.{Counter, MajorityVote}

import java.io.File
import scala.:+
import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, HashMap}
import scala.io.Source



case class SmallSBox() extends Component {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val a 		= in  Bits(8 bits)
		val b 		= out Bits(8 bits)
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		io.b := ~io.a
	}
}

object SmallSBox extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(SmallSBox())
	SpinalConfig(mode = Verilog, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(SmallSBox())
}

case class SmallSBoxMasked() extends Component {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val a 		= in  Vec(Bits(8 bits), 2)
		val r 		= in  Bits(8 bits)
		val b 		= out Vec(Bits(8 bits), 2)
	}
	
	io.b(1) := ~io.a(1) ^ io.r
	io.b(0) := io.a(0) ^ io.r
}

object SmallSBoxMasked extends App {
	SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(SmallSBoxMasked())
	SpinalConfig(mode = Verilog, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(SmallSBoxMasked())
}

case class SBoxBB() extends BlackBox {
	val io = new Bundle {
		val io_clk 		= in  Bool()
		val io_reset 	= in  Bool()
		val io_a_0 		= in  Bits(8 bits)
		val io_a_1 		= in  Bits(8 bits)
		val io_r			= in  Bits(8 bits)
		val io_b_0 		= out Bits(8 bits)
		val io_b_1 		= out Bits(8 bits)
	}
	
	noIoPrefix()
}

class test extends Component {
	val io = new Bundle {
		val clk 	= in  Bool()
		val reset = in  Bool()
		val p 		= in  Bits(8 bits)
		val k 		= in  Bits(8 bits)
		val c 		= out Bits(8 bits)
	}
	
	io.p.share
	io.k.share
	io.c.share
	
	/*val addkey = new AddRoundKey
	addkey.setAsLinear
	addkey.io.akIn := io.p
	addkey.io.rk := io.k
	io.c := addkey.io.akOut*/
	
	for (i <- 0 until 1) {
		val sbox = SmallSBox()
		sbox.setAsNonLinear
		//sbox.setAsReplace("AES.Matrix.SBox", 38, "mask")
		//sbox.setAsReplace("Tests.SBoxMasked", 12, "m")
		sbox.io.a := io.p(8*i+7 downto 8*i+0)
		io.c(8*i+7 downto 8*i+0) := sbox.io.b
	}
	
	/*val sbox = SmallSBox()
	sbox.setAsNonLinear
	//sbox.setAsReplace("Tests.SBoxBB", 12, "")
	sbox.io.clk := io.clk
	sbox.io.reset := io.reset
	sbox.io.a := io.p
	io.c := sbox.io.b*/
}

class SBox extends Component {
	val io = new Bundle {
		val a = in  Bits(8 bits)
		val b = out Bits(8 bits)
	}
	io.b := ~io.a
}

class SBoxMasked extends Component {
	val io = new Bundle {
		val clk = in  Bool()
		val reset = in  Bool()
		val a  = in  Vec(Bits(8 bits), 2)
		val m  = in  Bits(12 bits)
		val b  = out Vec(Bits(8 bits), 2)
	}
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		//io.b := io.a(0) ^ io.a(1)
		io.b(0) := io.a(0)
		io.b(1) := io.a(1)
	}
}

class Sub extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val a = in Bits(8 bits)
		val m = in Bits(12 bits)
		val b = out Bits(8 bits)
	}
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		io.b := io.a
	}
}

class TestSub extends Component {
	val io = new Bundle {
		val a = in  Bits(128 bits)
		val b = in  Bits(128 bits)
		val c = out Bits(128 bits)
	}
	
	val a, b, c = UInt(128 bits)
	a := U(io.a)
	b := U(io.b)
	when (a(0)) {
		c := a
	} otherwise {
		c := b
	}
	//io.c := B(a) ^ (B(b) | io.a) ^ io.b
	io.c := B(a(63 downto 0).resize(128))
	//io.c := io.a ^ io.b
	
}


object test {
	def main(args: Array[String]): Unit = {
		/*val sBox = NonLinearModule(name = "Tests.SBox", randomness = 0, latency = 0)
		val sBoxMasked = NonLinearModule(name = "Tests.SBoxMasked", randomness = 12, latency = 0)
		val nonLinearModules = mutable.HashMap[String, NonLinearModule] (("Tests.SBox", sBoxMasked))
		val maskingConfig = MaskingConfig(applyMasking = true, numShares = 2, nonLinearModules = nonLinearModules)
		val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", applyMasking = true, maskingConfig = maskingConfig).generate(new test)
		*///report.mergeRTLSource()
		val sbox = NonLinearModule(name = "Tests.SBoxBB", randomness = 8, randomnessName = "io_r", latency = 0)
		val nonLinearModules = mutable.HashMap[String, NonLinearModule] (("Tests.SmallSBox", sbox))
		val maskingConfig = MaskingConfig(applyMasking = true, numShares = 2, nonLinearModules = nonLinearModules)
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", applyMasking = true, maskingConfig = maskingConfig).generate(new test)
	}
}

class TestAES extends Component {
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val p 			= in  Bits(128 bits)
		val k 			= in  Bits(128 bits)
		val c 			= out Bits(128 bits)
		val done 		= out Bool()
	}
	
	io.p.share
	io.k.share
	io.c.share
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg = Reg(Bits(128 bits))
		val keyReg = Reg(Bits(128 bits))
		val sBoxOut, shiftRowsOut, addRoundKeyOut, mixColumnsOut = Bits(128 bits)
		
		stateReg := io.p
		keyReg := io.k
		
		val addroundkey = new AddRoundKey
		addroundkey.setAsLinear
		addroundkey.io.akIn := stateReg
		addroundkey.io.rk := keyReg
		addRoundKeyOut := addroundkey.io.akOut
		
		//io.c := io.p
		//sBoxOut := 1
		
		for (i <- 0 until 16) {
			val sbox = new SBox
			sbox.setAsNonLinear
			sbox.setAsReplace("Tests.SBoxMasked", 12, "m")
			sbox.io.a := addRoundKeyOut(8*i+7 downto 8*i)
			sBoxOut(8*i+7 downto 8*i) := sbox.io.b
		}
		
		val shiftrows = new ShiftRows
		shiftrows.setAsLinear
		shiftrows.io.shiftRowsInput := sBoxOut
		shiftRowsOut := shiftrows.io.shiftRowsOutput
		
		for (i <- 0 until 4) {
			val mixcolumns = new MixColumns
			mixcolumns.setAsLinear
			mixcolumns.io.mixColumnsInput := shiftRowsOut(32*i+31 downto 32*i)
			mixColumnsOut(32*i+31 downto 32*i) := mixcolumns.io.mixColumnsOutput
		}
		
		io.c := mixColumnsOut
		io.done := False
	}
}

object GenerateTestAES {
	def main(args: Array[String]): Unit = {
		val sBoxMasked = NonLinearModule(name = "Tests.SBoxMasked", randomness = 12, latency = 0)
		val nonLinearModules = mutable.HashMap[String, NonLinearModule] (("Tests.SBox", sBoxMasked))
		val maskingConfig = MaskingConfig(applyMasking = true, numShares = 2, nonLinearModules = nonLinearModules)
		val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", netlistFileName = "TestAES.vhd", applyMasking = true, maskingConfig = maskingConfig).generate(new TestAES)
		//report.mergeRTLSource()
		//SpinalConfig(mode = Verilog, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(new test)
	}
}

class ModeTest extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val pt = in Bits(128 bits)
		val key = in Bits(128 bits)
		val ct = out Bits(128 bits)
		val done = out Bool()
	}
	
	val CA = new ClockingArea(ClockDomain(clock = io.clk, reset = io.reset))
	{
		val state = Reg(Bits(128 bits)) init (0)
		
		val ctr = Counter(10)
		
		ctr.increment()
		io.done := False
		io.ct := 0
		
		when(io.reset) {
			ctr.clear()
		}
		when(io.reset.fall()) {
			state := ~(io.pt ^ io.key)
		} elsewhen (io.reset) {
			state := 0
		}
		
		when(ctr.willOverflow) {
			io.ct := state
			io.done := True
		}
	}
}

/*class ModeTest_ECB extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val blockReady = in Bool()
		val pt = in Bits(128 bits)
		val blocks = in UInt(64 bits)
		val finalBlock = in Bool()
		val key = in Bits(128 bits)
		val ct = out Bits(128 bits)
		val blockDone = out Bool()
		val done = out Bool()
	}
	
	val CA = new ClockingArea(ClockDomain(clock = io.clk, reset = io.reset))
	{
		val bc = new ModeTest
		val reset = Reg(Bool()) init (True)
		
		bc.io.clk := io.clk
		bc.io.reset := reset
		io.blockDone := False
		io.done := False
		
		when(io.reset) {
			reset := True
		} elsewhen (io.blockReady) {
			reset := False
		}
		
		bc.io.pt := io.pt
		bc.io.key := io.key
		
		io.ct := bc.io.ct
		when(bc.io.done) {
			io.blockDone := True
			bc.io.reset := True
			when(io.finalBlock) {
				io.done := True
			}
		}
	}
}*/

object ModeTest {
	def main(args: Array[String]): Unit = {
		//val test = new ModeTest
		val modeConfig = ModeConfig(mode = CFB, implementationType = Round, blockSize = 128, keySize = 128, direction = Dec)
		val report = SpinalConfig(mode = ToSpinal, targetDirectory = "SecureSpinal/src/main/scala/Tests", netlistFileName = "Test_ECB.scala", modeConfig = modeConfig).generate(new ModeTest)
	}
}

/*object ModeTest_ECB {
	def main(args: Array[String]): Unit = {
		val report = SpinalConfig(mode = ToSpinal, targetDirectory = "SecureSpinal/src/main/scala/Tests", netlistFileName = "Test_ECB.scala").generate(new ModeTest_ECB)
		//val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests").generate(new ModeTest_ECB)
	}
}*/

class SimpleCipher extends Component {
	val io = new Bundle {
		val clk = in  Bool()
		val reset = in  Bool()
		val enable = in  Bool()
		val plaintext = in  Vec(Bits(64 bits), 3)
		val key = in  Vec(Bits(64 bits), 3)
		val ciphertext = out  Vec(Bits(64 bits), 3)
		val done = out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		for (i <- 0 until 3) {
			val ak = new AK
			ak.io.a := io.plaintext(i)
			ak.io.k := io.key(i)
			io.ciphertext(i) := ak.io.b
		}
		io.done := True
	}
}

object generateSimpleCipher {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", netlistFileName = "SimpleCipher.vhd").generate(new SimpleCipher)
	}
}

class AK extends Component {
	val io = new Bundle {
		val a = in  Bits(64 bits)
		val k = in  Bits(64 bits)
		val b = out Bits(64 bits)
	}
	
	io.b := io.a ^ io.k
}

class Permute extends Component {
	val io = new Bundle {
		val a = in  Bits(64 bits)
		val b = out Bits(64 bits)
	}
	
	io.b := io.a.rotateLeft(3)
}

class SB extends Component {
	val io = new Bundle {
		val a = in  Bits(8 bits)
		val b = out Bits(8 bits)
	}
	
	io.b := (io.a(7 downto 4) & io.a(3 downto 0)) ## io.a(5 downto 2)
}