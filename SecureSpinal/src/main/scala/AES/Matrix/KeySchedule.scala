package AES.Matrix

import AES.Plain.CanrightSBox
import spinal.core._

class KeySchedule extends Component {
	val io = new Bundle {
		val keyIn 		= in Vec(Vec(Bits(8 bits), 4), 4)
		val constant 	= in  Bits(8 bits)
		val keyOut 		= out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	val w0, w1, w2, w3 = Vec(Bits(8 bits), 4)
	val sboxOut = Vec(Bits(8 bits), 4)
	//val constant = Vec(List(io.constant, B(0), B(0), B(0)))
	for (i <- 0 until 4) {
		val sbox = new CanrightSBox
		sbox.io.subBytesInput := io.keyIn(i)(3)
		sboxOut(i) := sbox.io.subBytesOutput
	}
	
	for (i <- 0 until 4) {
		w0(i) := io.keyIn(i)(0) ^ sboxOut((i+1)%4) ^ Vec(List(io.constant, B(0), B(0), B(0)))(i)
		w1(i) := io.keyIn(i)(1) ^ w0(i)
		w2(i) := io.keyIn(i)(2) ^ w1(i)
		w3(i) := io.keyIn(i)(3) ^ w2(i)
	}
	
	for (i <- 0 until 4) {
		io.keyOut(i)(0) := w0(i)
		io.keyOut(i)(1) := w1(i)
		io.keyOut(i)(2) := w2(i)
		io.keyOut(i)(3) := w3(i)
	}
}