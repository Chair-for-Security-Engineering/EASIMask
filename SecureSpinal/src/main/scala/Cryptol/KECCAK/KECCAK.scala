package Cryptol.KECCAK

import spinal.core._
import spinal.lib._

object States extends SpinalEnum {
	val sIdle, sExecute, sDone = newElement()
}

class KECCAK extends Component {
	import States._
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val enable 		= in  Bool()
		val keccakIn 	= in  Bits(1600 bits)
		val keccakOut = out Bits(1600 bits)
		val done 			= out Bool()
	}
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state = Reg(Bits(1600 bits)) init(0)
		val roundCounter = Counter(24)
		val thetaIn, thetaOut, rhoOut, chiOut, iotaOut = Bits(1600 bits)
		val current = Vec(Vec(Bits(64 bits), 5), 5)
		
		for (i <- 0 until 5) {
			for (j <- 0 until 5) {
				current(i)(j) := iotaOut((4-i)*320+(4-j)*64+63 downto (4-i)*320+(4-j)*64)
			}
		}
		
		io.keccakOut := state
		thetaIn := state
		
		val theta = new Theta
		theta.io.thetaIn := thetaIn
		thetaOut := theta.io.thetaOut
		
		val rhopi = new RhoPi
		rhopi.io.rhoIn := thetaOut
		rhoOut := rhopi.io.rhoOut
		
		val chi = new Chi
		chi.io.chiIn := rhoOut
		chiOut := chi.io.chiOut
		
		val iota = new Iota
		iota.io.iotaIn := chiOut
		iota.io.round := roundCounter.value
		iotaOut := iota.io.iotaOut
		
		state := iotaOut
		
		val keccakState = Reg(States()) init (sIdle)
		
		switch (keccakState) {
			is (sIdle) {
				keccakState := sIdle
				roundCounter.clear()
				when (io.enable) {
					state := io.keccakIn
					keccakState := sExecute
				}
			}
			
			is (sExecute) {
				keccakState := sExecute
				roundCounter.increment()
				when (roundCounter.willOverflow) {
					keccakState := sDone
				}
			}
			
			is (sDone) {
				keccakState := sDone
				io.done := True
			}
		}
	}
}

class KECCAK400 extends Component {
	import States._
	val io = new Bundle {
		val clk 			= in  Bool()
		val reset 		= in  Bool()
		val enable 		= in  Bool()
		val keccakIn 	= in  Bits(400 bits)
		val keccakOut = out Bits(400 bits)
		val done 			= out Bool()
	}
	
	io.done := False
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state = Reg(Bits(400 bits)) init(0)
		val roundCounter = Counter(24)
		val thetaIn, thetaOut, rhoOut, chiOut, iotaOut = Bits(400 bits)
		
		io.keccakOut := state
		thetaIn := state
		
		val theta = new Theta400
		theta.io.thetaIn := thetaIn
		thetaOut := theta.io.thetaOut
		
		val rhopi = new RhoPi400
		rhopi.io.rhoIn := thetaOut
		rhoOut := rhopi.io.rhoOut
		
		val chi = new Chi400
		chi.io.chiIn := rhoOut
		chiOut := chi.io.chiOut
		
		val iota = new Iota400
		iota.io.iotaIn := chiOut
		iota.io.round := roundCounter.value
		iotaOut := iota.io.iotaOut
		
		state := iotaOut
		
		val keccakState = Reg(States()) init (sIdle)
		
		switch (keccakState) {
			is (sIdle) {
				keccakState := sIdle
				roundCounter.clear()
				when (io.enable) {
					state := io.keccakIn
					keccakState := sExecute
				}
			}
			
			is (sExecute) {
				keccakState := sExecute
				roundCounter.increment()
				when (roundCounter.willOverflow) {
					keccakState := sDone
				}
			}
			
			is (sDone) {
				keccakState := sDone
				io.done := True
			}
		}
	}
}

object generateKeccak400 {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "/home/fabusbo/Schreibtisch/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/Cryptol/KECCAK/RTL").generate(new KECCAK400)
	}
}

class KECCAKMasked extends Component {
	import States._
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val in1 		= in  Bits(1600 bits)
		val in2 		= in  Bits(1600 bits)
		val out1 		= out Bits(1600 bits)
		val out2 		= out Bits(1600 bits)
		val done 		= out Bool()
	}
	
	io.done := False
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state1, state2 = Reg(Bits(1600 bits)) init(0)
		val roundCounter = Counter(24)
		val smallCounter = Counter(0, 1)
		
		io.out1 := state1
		io.out2 := state2
		
		val theta1, theta2 = new Theta
		theta1.io.thetaIn := state1
		theta2.io.thetaIn := state2
		
		val rhopi1, rhopi2 = new RhoPi
		rhopi1.io.rhoIn := theta1.io.thetaOut
		rhopi2.io.rhoIn := theta2.io.thetaOut
		
		val chi = new ChiMasked
		chi.io.chiIn1 := rhopi1.io.rhoOut
		chi.io.chiIn2 := rhopi2.io.rhoOut
		
		val iota1, iota2 = new Iota
		iota1.io.iotaIn := chi.io.chiOut1
		iota1.io.round := roundCounter
		state1 := iota1.io.iotaOut
		iota2.io.iotaIn := chi.io.chiOut2
		iota2.io.round := 25
		state2 := iota2.io.iotaOut
		
		val keccakState = Reg(States()) init (sIdle)
		
		switch (keccakState) {
			is (sIdle) {
				keccakState := sIdle
				roundCounter.clear()
				smallCounter.clear()
				when (io.enable) {
					state1 := io.in1
					state2 := io.in2
					keccakState := sExecute
				}
			}
			
			is (sExecute) {
				keccakState := sExecute
				smallCounter.increment()
				when (smallCounter.willOverflow) {
					roundCounter.increment()
				}
				when (roundCounter.willOverflow) {
					keccakState := sDone
				}
			}
			
			is (sDone) {
				keccakState := sDone
				io.done := True
			}
		}
	}
}

class KECCAKMasked800 extends Component {
	import States._
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val in1 		= in  Bits(800 bits)
		val in2 		= in  Bits(800 bits)
		val out1 		= out Bits(800 bits)
		val out2 		= out Bits(800 bits)
		val done 		= out Bool()
	}
	
	io.done := False
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state1, state2 = Reg(Bits(800 bits)) init(0)
		val roundCounter = Counter(22)
		val smallCounter = Counter(0, 1)
		
		io.out1 := state1
		io.out2 := state2
		
		val theta1, theta2 = new Theta800
		theta1.io.thetaIn := state1
		theta2.io.thetaIn := state2
		
		val rhopi1, rhopi2 = new RhoPi800
		rhopi1.io.rhoIn := theta1.io.thetaOut
		rhopi2.io.rhoIn := theta2.io.thetaOut
		
		val chi = new ChiMasked800
		chi.io.chiIn1 := rhopi1.io.rhoOut
		chi.io.chiIn2 := rhopi2.io.rhoOut
		
		val iota1 = new Iota800
		iota1.io.iotaIn := chi.io.chiOut1
		iota1.io.round := roundCounter
		state1 := iota1.io.iotaOut
		state2 := chi.io.chiOut2
		
		val keccakState = Reg(States()) init (sIdle)
		
		switch (keccakState) {
			is (sIdle) {
				keccakState := sIdle
				roundCounter.clear()
				smallCounter.clear()
				when (io.enable) {
					state1 := io.in1
					state2 := io.in2
					keccakState := sExecute
				}
			}
			
			is (sExecute) {
				keccakState := sExecute
				smallCounter.increment()
				when (smallCounter.willOverflow) {
					roundCounter.increment()
				}
				when (roundCounter.willOverflow) {
					keccakState := sDone
				}
			}
			
			is (sDone) {
				keccakState := sDone
				io.done := True
			}
		}
	}
}

class KECCAKMasked400 extends Component {
	import States._
	val io = new Bundle {
		val clk 		= in  Bool()
		val reset 	= in  Bool()
		val enable 	= in  Bool()
		val in1 		= in  Bits(400 bits)
		val in2 		= in  Bits(400 bits)
		val out1 		= out Bits(400 bits)
		val out2 		= out Bits(400 bits)
		val done 		= out Bool()
	}
	
	io.done := False
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val state1, state2 = Reg(Bits(400 bits)) init(0)
		val roundCounter = Counter(24)
		val smallCounter = Counter(0, 1)
		
		io.out1 := state1
		io.out2 := state2
		
		val theta1, theta2 = new Theta400
		theta1.io.thetaIn := state1
		theta2.io.thetaIn := state2
		
		val rhopi1, rhopi2 = new RhoPi400
		rhopi1.io.rhoIn := theta1.io.thetaOut
		rhopi2.io.rhoIn := theta2.io.thetaOut
		
		val chi = new ChiMasked400
		chi.io.chiIn1 := rhopi1.io.rhoOut
		chi.io.chiIn2 := rhopi2.io.rhoOut
		
		val iota1 = new Iota400
		iota1.io.iotaIn := chi.io.chiOut1
		iota1.io.round := roundCounter
		state1 := iota1.io.iotaOut
		state2 := chi.io.chiOut2
		
		val keccakState = Reg(States()) init (sIdle)
		
		switch (keccakState) {
			is (sIdle) {
				keccakState := sIdle
				roundCounter.clear()
				smallCounter.clear()
				when (io.enable) {
					state1 := io.in1
					state2 := io.in2
					keccakState := sExecute
				}
			}
			
			is (sExecute) {
				keccakState := sExecute
				smallCounter.increment()
				when (smallCounter.willOverflow) {
					roundCounter.increment()
				}
				when (roundCounter.willOverflow) {
					keccakState := sDone
				}
			}
			
			is (sDone) {
				keccakState := sDone
				io.done := True
			}
		}
	}
}