package Tests

import spinal.core._

class skjdvfbks extends Component {
	val io = new Bundle {
		val clk = in Bool()
		val reset = in Bool()
		val blockReady = in Bool()
		val pt = out Bits(128 bits)
		val ct = in Bits(128 bits)
		val finalBlock = in Bool()
		val key = in Bits(128 bits)
		val iv = in Bits(128 bits)
		val blockDone = out Bool()
		val done = out Bool()
	}
	val CA = new ClockingArea(ClockDomain(clock = io.clk, reset = io.reset)) {
		val bc = new ModeTest
		val reset = Reg(Bool()) init(True)
		val iv = Reg(Bits(128 bits)) init(io.iv)
		val ctReg = Reg(Bits(128 bits)) init(io.ct)
		bc.io.clk := io.clk
		bc.io.pt := iv
		bc.io.key := io.key
		io.blockDone := False
		io.done := False
		io.pt := bc.io.ct ^ ctReg
		when (bc.io.done) {
			iv := ctReg
		}
		bc.io.reset := reset
		when (io.reset) {
			reset := True
			iv := io.iv
		} elsewhen (io.blockReady) {
			reset := False
			ctReg := io.ct
		}
		when (bc.io.done) {
			io.blockDone := True
			bc.io.reset := True
			when (io.finalBlock) {
				io.done := True
			}
		}
	}
}
class ModeTest_toSpinal extends Component {
	val io = new Bundle {
		val clk = in  Bool()
		val reset = in  Bool()
		val pt = in  Bits(128 bits)
		val key = in  Bits(128 bits)
		val ct = out Bits(128 bits)
		val done = out Bool()
	}

	val CA = new ClockingArea(ClockDomain(clock = io.clk, reset = io.reset))
	{

		val state = Reg(Bits(128 bits)) init(0)
		val ctr_willIncrement = Bool()
		ctr_willIncrement := False
		val ctr_willClear = Bool()
		ctr_willClear := False
		val ctr_valueNext = UInt(4 bits)
		ctr_value := ctr_valueNext
		val ctr_value = Reg(UInt(4 bits)) init(0)
		val ctr_willOverflowIfInc = Bool()
		ctr_willOverflowIfInc := (ctr_value === 9)
		val ctr_willOverflow = Bool()
		ctr_willOverflow := (ctr_willOverflowIfInc & ctr_willIncrement)
		when (ctr_willOverflow) {
			ctr_valueNext := 0
		} otherwise {
			ctr_valueNext := (ctr_value + (U(B(ctr_willIncrement)).resize(4)))
		}
		when (ctr_willClear) {
			ctr_valueNext := 0
		}

		ctr_willIncrement := True
		io.done := False
		io.ct := 0
		when (io.reset) {
			ctr_willClear := True
		}

		val io_reset_regNext = Reg(Bool())
		io_reset_regNext := io.reset
		val when_tests_l241 = Bool()
		when_tests_l241 := ((~io.reset) & io_reset_regNext)
		when (when_tests_l241) {
			state := (~(io.pt ^ io.key))
		} elsewhen (io.reset) {
			state := 0
		}


		when (ctr_willOverflow) {
			io.ct := state
			io.done := True
		}

	}
}


