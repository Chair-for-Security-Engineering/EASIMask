package AES.Cryptol

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class AesEncrypt_Round extends Component {
	val io = new Bundle {
		val reset = in Bool()
		val pt = in Bits(128 bits)
		val key = in Bits(128 bits)
		val ret = out Bits(128 bits)
		val done = out Bool()
	}
	
	val state0 = Vec(Vec(Bits(8 bits), 4), 4)
	val rounds = Reg(Vec(Vec(Bits(8 bits), 4), 4))
	val keys = Reg(Vec(Vec(Bits(8 bits), 4), 4))
	val rcs = Reg(Bits(8 bits))
	val counter = Counter(9)
	
	io.ret := 0
	io.done := False
	
	val addroundkey = new AddRoundKey
	addroundkey.setAsLinear
	val subbytes = new SubBytes
	val shiftrows = new ShiftRows
	shiftrows.setAsLinear
	val mixcolumns = new MixColumns
	mixcolumns.setAsLinear
	val keyschedule = new KeySchedule
	//val nextrc = new NextRC
	
	addroundkey.io.s := mixcolumns.io.ret
	addroundkey.io.rk := keys
	state0 := addroundkey.io.ret
	rounds := addroundkey.io.ret
	subbytes.io.state := rounds
	shiftrows.io.state := subbytes.io.ret
	mixcolumns.io.state := shiftrows.io.ret
	keyschedule.io.key := keys
	keyschedule.io.c := rcs
	keys := keyschedule.io.ret
	//nextrc.io.rc := rcs
	//rcs := nextrc.io.ret
	rcs := NextRC(rcs)
	
	val fsm = new StateMachine {
		val sReset = new State with EntryPoint {
			onEntry(rcs := 0x1)
			whenIsActive {
				when(io.reset.fall()) {
					addroundkey.io.s := MsgToState(io.pt)
					addroundkey.io.rk := MsgToState(io.key)
					keyschedule.io.key := MsgToState(io.key)
					rounds := state0
					//rcs := nextrc.io.ret
					goto(sAESRound)
				}
			}
		}
		val sAESRound = new State {
			whenIsActive {
				counter.increment()
				when (counter.willOverflow) {
					goto(sAESFinalRound)
				}
			}
		}
		val sAESFinalRound = new State {
			whenIsActive {
				addroundkey.io.s := shiftrows.io.ret
				io.ret := StateToMsg(addroundkey.io.ret)
				io.done := True
				exit()
			}
		}
	}

	def NextRC (b : Bits): Bits = {
		val ret = Bits(b.getBitsWidth bits)
		when (b(7) === False) {
			ret := (b |<< 1)
		} otherwise {
			ret := (b |<< 1) ^ 0x1B
		}
		ret
	}
	
	def MsgToState(msg : Bits): Vec[Vec[Bits]] = {
		val ret = Vec(Vec(Bits(8 bits), 4), 4)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				ret(i)(j) := msg(127-8*i-32*j downto 120-8*i-32*j)
			}
		}
		ret
	}
	
	def StateToMsg(st : Vec[Vec[Bits]]): Bits = {
		val ret = Bits(128 bits)
		for (i <- 0 until 4) {
			for (j <- 0 until 4) {
				ret(127-8*i-32*j downto 120-8*i-32*j) := st(i)(j)
			}
		}
		ret
	}
}

class AddRoundKey extends Component {
	val io = new Bundle {
		val rk = in Vec(Vec(Bits(8 bits), 4), 4)
		val s = in Vec(Vec(Bits(8 bits), 4), 4)
		val ret = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	for (i <- 0 until 4) {
		for (j <- 0 until 4) {
			io.ret(i)(j) := io.rk(i)(j) ^ io.s(i)(j)
		}
	}
}

class MixColumns extends Component {
	val io = new Bundle {
		val state = in Vec(Vec(Bits(8 bits), 4), 4)
		val ret = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	val ret = Vec(Vec(Bits(8 bits), 4), 4)
	for (i <- 0 until 4) {
		val column = transpose(io.state)(i)
		/*val mixcolumn = new MixColumn
		mixcolumn.io.c := column
		ret(i) := mixcolumn.io.ret*/
		ret(i) := MixColumn(column)
	}
	io.ret := transpose(ret)
	
	def Mul2 (x : Bits): Bits = {
		val ret = Bits(8 bits)
		when (x(7) === False) {
			ret := (x |<< 1)
		} otherwise {
			ret := (x |<< 1) ^ 0x1B
		}
		ret
	}
	
	def Mul3 (x : Bits): Bits = {
		Mul2(x) ^ x
	}
	
	def MixColumn (c : Vec[Bits]): Vec[Bits] = {
		val ret = cloneOf(c)
		val a0 = c(0)
		val a1 = c(1)
		val a2 = c(2)
		val a3 = c(3)
		
		ret(0) := (Mul2(a0) ^ Mul3(a1) ^ a2 ^ a3)
		ret(1) := (a0 ^ Mul2(a1) ^ Mul3(a2) ^ a3)
		ret(2) := (a0 ^ a1 ^ Mul2(a2) ^ Mul3(a3))
		ret(3) := (Mul3(a0) ^ a1 ^ a2 ^ Mul2(a3))
		
		ret
	}
	
	def transpose (a : Vec[Vec[Bits]]): Vec[Vec[Bits]] = {
		val ret = Vec(Vec(Bits(a(0)(0).getBitsWidth bits), a.length), a(0).length)
		for (i <- 0 until a.length) {
			for (j <- 0 until a(0).length) {
				ret(i)(j) := a(j)(i)
			}
		}
		ret
	}
}

class MixColumn extends Component {
	val io = new Bundle {
		val c = in Vec(Bits(8 bits), 4)
		val ret = out Vec(Bits(8 bits), 4)
	}
	val a0 = io.c(0)
	val a1 = io.c(1)
	val a2 = io.c(2)
	val a3 = io.c(3)
	
	io.ret(0) := (Mul2(a0) ^ Mul3(a1) ^ a2 ^ a3)
	io.ret(1) := (a0 ^ Mul2(a1) ^ Mul3(a2) ^ a3)
	io.ret(2) := (a0 ^ a1 ^ Mul2(a2) ^ Mul3(a3))
	io.ret(3) := (Mul3(a0) ^ a1 ^ a2 ^ Mul2(a3))
	
	
	def Mul2 (x : Bits): Bits = {
		val ret = Bits(8 bits)
		when (x(7) === False) {
			ret := (x |<< 1)
		} otherwise {
			ret := (x |<< 1) ^ 0x1B
		}
		ret
	}
	
	def Mul3 (x : Bits): Bits = {
		Mul2(x) ^ x
	}
}

class ShiftRows extends Component {
	val io = new Bundle {
		val state = in Vec(Vec(Bits(8 bits), 4), 4)
		val ret = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	for (i <- 0 until 4) {
		val shiftAmount = (0 until 4)(i)
		val row = io.state(i)
		io.ret(i) := rotLeft(row, shiftAmount)
	}
	
	def rotLeft (x : Vec[Bits], amount : Int): Vec[Bits] = {
		val ret = Vec(Bits(x(0).getWidth bits), x.length)
		for (i <- 0 until x.length) {
			ret(i) := x((i+amount) % x.length)
		}
		ret
	}
}

class NextRC extends Component {
	val io = new Bundle {
		val rc = in Bits(8 bits)
		val ret = out Bits(8 bits)
	}
	when (io.rc(7) === False) {
		io.ret := (io.rc |<< 1)
	} otherwise {
		io.ret := (io.rc |<< 1) ^ 0x1B
	}
}

class KeySchedule extends Component {
	val io = new Bundle {
		val key = in Vec(Vec(Bits(8 bits), 4), 4)
		val c = in Bits(8 bits)
		val ret = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	
	val keyT = transpose(io.key)
	val subword = new SubWord
	subword.io.bs := keyT(3)
	val w0 = Vec(Bits(8 bits), 4)
	val w1 = Vec(Bits(8 bits), 4)
	val w2 = Vec(Bits(8 bits), 4)
	val w3 = Vec(Bits(8 bits), 4)
	for (i <- 0 until 4) {
		w0(i) := keyT(0)(i) ^ (rotLeft(subword.io.ret, 1)(i)) ^ Vec(io.c, B(0, 8 bits), B(0, 8 bits), B(0, 8 bits))(i)
	}
	for (i <- 0 until 4) {
		w1(i) := keyT(1)(i) ^ w0(i)
	}
	for (i <- 0 until 4) {
		w2(i) := keyT(2)(i) ^ w1(i)
	}
	for (i <- 0 until 4) {
		w3(i) := keyT(3)(i) ^ w2(i)
	}
	io.ret := transpose(Vec(w0, w1, w2, w3))
	
	def transpose (a : Vec[Vec[Bits]]): Vec[Vec[Bits]] = {
		val ret = Vec(Vec(Bits(a(0)(0).getBitsWidth bits), a.length), a(0).length)
		for (i <- 0 until a.length) {
			for (j <- 0 until a(0).length) {
				ret(i)(j) := a(j)(i)
			}
		}
		ret
	}
	
	def rotLeft (x : Vec[Bits], amount : Int): Vec[Bits] = {
		val ret = Vec(Bits(x(0).getWidth bits), x.length)
		for (i <- 0 until x.length) {
			ret(i) := x((i+amount) % x.length)
		}
		ret
	}
}

class SubWord extends Component {
	val io = new Bundle {
		val bs = in Vec(Bits(8 bits), 4)
		val ret = out Vec(Bits(8 bits), 4)
	}
	for (i <- 0 until 4) {
		val subbyte = new SubByte
		subbyte.setAsNonLinear
		subbyte.io.b := io.bs(i)
		io.ret(i) := subbyte.io.ret
	}
}


class SubBytes extends Component {
	val io = new Bundle {
		val state = in Vec(Vec(Bits(8 bits), 4), 4)
		val ret = out Vec(Vec(Bits(8 bits), 4), 4)
	}
	for (i <- 0 until 4) {
		val row = io.state(i)
		for (j <- 0 until 4) {
			val b = row(j)
			val subbyte = new SubByte
			subbyte.setAsNonLinear
			subbyte.io.b := b
			io.ret(i)(j) := subbyte.io.ret
		}
	}
}

class SubByte extends Component {
	val io = new Bundle {
		val b = in Bits(8 bits)
		val ret = out Bits(8 bits)
	}

	val Sbox = Seq(
		0x63 ,0x7c ,0x77 ,0x7b ,0xf2 ,0x6b ,0x6f ,0xc5 ,0x30 ,0x01 ,0x67 ,0x2b ,0xfe ,0xd7 ,0xab ,0x76
		,0xca ,0x82 ,0xc9 ,0x7d ,0xfa ,0x59 ,0x47 ,0xf0 ,0xad ,0xd4 ,0xa2 ,0xaf ,0x9c ,0xa4 ,0x72 ,0xc0
		,0xb7 ,0xfd ,0x93 ,0x26 ,0x36 ,0x3f ,0xf7 ,0xcc ,0x34 ,0xa5 ,0xe5 ,0xf1 ,0x71 ,0xd8 ,0x31 ,0x15
		,0x04 ,0xc7 ,0x23 ,0xc3 ,0x18 ,0x96 ,0x05 ,0x9a ,0x07 ,0x12 ,0x80 ,0xe2 ,0xeb ,0x27 ,0xb2 ,0x75
		,0x09 ,0x83 ,0x2c ,0x1a ,0x1b ,0x6e ,0x5a ,0xa0 ,0x52 ,0x3b ,0xd6 ,0xb3 ,0x29 ,0xe3 ,0x2f ,0x84
		,0x53 ,0xd1 ,0x00 ,0xed ,0x20 ,0xfc ,0xb1 ,0x5b ,0x6a ,0xcb ,0xbe ,0x39 ,0x4a ,0x4c ,0x58 ,0xcf
		,0xd0 ,0xef ,0xaa ,0xfb ,0x43 ,0x4d ,0x33 ,0x85 ,0x45 ,0xf9 ,0x02 ,0x7f ,0x50 ,0x3c ,0x9f ,0xa8
		,0x51 ,0xa3 ,0x40 ,0x8f ,0x92 ,0x9d ,0x38 ,0xf5 ,0xbc ,0xb6 ,0xda ,0x21 ,0x10 ,0xff ,0xf3 ,0xd2
		,0xcd ,0x0c ,0x13 ,0xec ,0x5f ,0x97 ,0x44 ,0x17 ,0xc4 ,0xa7 ,0x7e ,0x3d ,0x64 ,0x5d ,0x19 ,0x73
		,0x60 ,0x81 ,0x4f ,0xdc ,0x22 ,0x2a ,0x90 ,0x88 ,0x46 ,0xee ,0xb8 ,0x14 ,0xde ,0x5e ,0x0b ,0xdb
		,0xe0 ,0x32 ,0x3a ,0x0a ,0x49 ,0x06 ,0x24 ,0x5c ,0xc2 ,0xd3 ,0xac ,0x62 ,0x91 ,0x95 ,0xe4 ,0x79
		,0xe7 ,0xc8 ,0x37 ,0x6d ,0x8d ,0xd5 ,0x4e ,0xa9 ,0x6c ,0x56 ,0xf4 ,0xea ,0x65 ,0x7a ,0xae ,0x08
		,0xba ,0x78 ,0x25 ,0x2e ,0x1c ,0xa6 ,0xb4 ,0xc6 ,0xe8 ,0xdd ,0x74 ,0x1f ,0x4b ,0xbd ,0x8b ,0x8a
		,0x70 ,0x3e ,0xb5 ,0x66 ,0x48 ,0x03 ,0xf6 ,0x0e ,0x61 ,0x35 ,0x57 ,0xb9 ,0x86 ,0xc1 ,0x1d ,0x9e
		,0xe1 ,0xf8 ,0x98 ,0x11 ,0x69 ,0xd9 ,0x8e ,0x94 ,0x9b ,0x1e ,0x87 ,0xe9 ,0xce ,0x55 ,0x28 ,0xdf
		,0x8c ,0xa1 ,0x89 ,0x0d ,0xbf ,0xe6 ,0x42 ,0x68 ,0x41 ,0x99 ,0x2d ,0x0f ,0xb0 ,0x54 ,0xbb ,0x16)
	
	io.ret := io.b.mux (
		0 -> B(Sbox(0), 8 bits),
		1 -> B(Sbox(1), 8 bits),
		2 -> B(Sbox(2), 8 bits),
		3 -> B(Sbox(3), 8 bits),
		4 -> B(Sbox(4), 8 bits),
		5 -> B(Sbox(5), 8 bits),
		6 -> B(Sbox(6), 8 bits),
		7 -> B(Sbox(7), 8 bits),
		8 -> B(Sbox(8), 8 bits),
		9 -> B(Sbox(9), 8 bits),
		10 -> B(Sbox(10), 8 bits),
		11 -> B(Sbox(11), 8 bits),
		12 -> B(Sbox(12), 8 bits),
		13 -> B(Sbox(13), 8 bits),
		14 -> B(Sbox(14), 8 bits),
		15 -> B(Sbox(15), 8 bits),
		16 -> B(Sbox(16), 8 bits),
		17 -> B(Sbox(17), 8 bits),
		18 -> B(Sbox(18), 8 bits),
		19 -> B(Sbox(19), 8 bits),
		20 -> B(Sbox(20), 8 bits),
		21 -> B(Sbox(21), 8 bits),
		22 -> B(Sbox(22), 8 bits),
		23 -> B(Sbox(23), 8 bits),
		24 -> B(Sbox(24), 8 bits),
		25 -> B(Sbox(25), 8 bits),
		26 -> B(Sbox(26), 8 bits),
		27 -> B(Sbox(27), 8 bits),
		28 -> B(Sbox(28), 8 bits),
		29 -> B(Sbox(29), 8 bits),
		30 -> B(Sbox(30), 8 bits),
		31 -> B(Sbox(31), 8 bits),
		32 -> B(Sbox(32), 8 bits),
		33 -> B(Sbox(33), 8 bits),
		34 -> B(Sbox(34), 8 bits),
		35 -> B(Sbox(35), 8 bits),
		36 -> B(Sbox(36), 8 bits),
		37 -> B(Sbox(37), 8 bits),
		38 -> B(Sbox(38), 8 bits),
		39 -> B(Sbox(39), 8 bits),
		40 -> B(Sbox(40), 8 bits),
		41 -> B(Sbox(41), 8 bits),
		42 -> B(Sbox(42), 8 bits),
		43 -> B(Sbox(43), 8 bits),
		44 -> B(Sbox(44), 8 bits),
		45 -> B(Sbox(45), 8 bits),
		46 -> B(Sbox(46), 8 bits),
		47 -> B(Sbox(47), 8 bits),
		48 -> B(Sbox(48), 8 bits),
		49 -> B(Sbox(49), 8 bits),
		50 -> B(Sbox(50), 8 bits),
		51 -> B(Sbox(51), 8 bits),
		52 -> B(Sbox(52), 8 bits),
		53 -> B(Sbox(53), 8 bits),
		54 -> B(Sbox(54), 8 bits),
		55 -> B(Sbox(55), 8 bits),
		56 -> B(Sbox(56), 8 bits),
		57 -> B(Sbox(57), 8 bits),
		58 -> B(Sbox(58), 8 bits),
		59 -> B(Sbox(59), 8 bits),
		60 -> B(Sbox(60), 8 bits),
		61 -> B(Sbox(61), 8 bits),
		62 -> B(Sbox(62), 8 bits),
		63 -> B(Sbox(63), 8 bits),
		64 -> B(Sbox(64), 8 bits),
		65 -> B(Sbox(65), 8 bits),
		66 -> B(Sbox(66), 8 bits),
		67 -> B(Sbox(67), 8 bits),
		68 -> B(Sbox(68), 8 bits),
		69 -> B(Sbox(69), 8 bits),
		70 -> B(Sbox(70), 8 bits),
		71 -> B(Sbox(71), 8 bits),
		72 -> B(Sbox(72), 8 bits),
		73 -> B(Sbox(73), 8 bits),
		74 -> B(Sbox(74), 8 bits),
		75 -> B(Sbox(75), 8 bits),
		76 -> B(Sbox(76), 8 bits),
		77 -> B(Sbox(77), 8 bits),
		78 -> B(Sbox(78), 8 bits),
		79 -> B(Sbox(79), 8 bits),
		80 -> B(Sbox(80), 8 bits),
		81 -> B(Sbox(81), 8 bits),
		82 -> B(Sbox(82), 8 bits),
		83 -> B(Sbox(83), 8 bits),
		84 -> B(Sbox(84), 8 bits),
		85 -> B(Sbox(85), 8 bits),
		86 -> B(Sbox(86), 8 bits),
		87 -> B(Sbox(87), 8 bits),
		88 -> B(Sbox(88), 8 bits),
		89 -> B(Sbox(89), 8 bits),
		90 -> B(Sbox(90), 8 bits),
		91 -> B(Sbox(91), 8 bits),
		92 -> B(Sbox(92), 8 bits),
		93 -> B(Sbox(93), 8 bits),
		94 -> B(Sbox(94), 8 bits),
		95 -> B(Sbox(95), 8 bits),
		96 -> B(Sbox(96), 8 bits),
		97 -> B(Sbox(97), 8 bits),
		98 -> B(Sbox(98), 8 bits),
		99 -> B(Sbox(99), 8 bits),
		100 -> B(Sbox(100), 8 bits),
		101 -> B(Sbox(101), 8 bits),
		102 -> B(Sbox(102), 8 bits),
		103 -> B(Sbox(103), 8 bits),
		104 -> B(Sbox(104), 8 bits),
		105 -> B(Sbox(105), 8 bits),
		106 -> B(Sbox(106), 8 bits),
		107 -> B(Sbox(107), 8 bits),
		108 -> B(Sbox(108), 8 bits),
		109 -> B(Sbox(109), 8 bits),
		110 -> B(Sbox(110), 8 bits),
		111 -> B(Sbox(111), 8 bits),
		112 -> B(Sbox(112), 8 bits),
		113 -> B(Sbox(113), 8 bits),
		114 -> B(Sbox(114), 8 bits),
		115 -> B(Sbox(115), 8 bits),
		116 -> B(Sbox(116), 8 bits),
		117 -> B(Sbox(117), 8 bits),
		118 -> B(Sbox(118), 8 bits),
		119 -> B(Sbox(119), 8 bits),
		120 -> B(Sbox(120), 8 bits),
		121 -> B(Sbox(121), 8 bits),
		122 -> B(Sbox(122), 8 bits),
		123 -> B(Sbox(123), 8 bits),
		124 -> B(Sbox(124), 8 bits),
		125 -> B(Sbox(125), 8 bits),
		126 -> B(Sbox(126), 8 bits),
		127 -> B(Sbox(127), 8 bits),
		128 -> B(Sbox(128), 8 bits),
		129 -> B(Sbox(129), 8 bits),
		130 -> B(Sbox(130), 8 bits),
		131 -> B(Sbox(131), 8 bits),
		132 -> B(Sbox(132), 8 bits),
		133 -> B(Sbox(133), 8 bits),
		134 -> B(Sbox(134), 8 bits),
		135 -> B(Sbox(135), 8 bits),
		136 -> B(Sbox(136), 8 bits),
		137 -> B(Sbox(137), 8 bits),
		138 -> B(Sbox(138), 8 bits),
		139 -> B(Sbox(139), 8 bits),
		140 -> B(Sbox(140), 8 bits),
		141 -> B(Sbox(141), 8 bits),
		142 -> B(Sbox(142), 8 bits),
		143 -> B(Sbox(143), 8 bits),
		144 -> B(Sbox(144), 8 bits),
		145 -> B(Sbox(145), 8 bits),
		146 -> B(Sbox(146), 8 bits),
		147 -> B(Sbox(147), 8 bits),
		148 -> B(Sbox(148), 8 bits),
		149 -> B(Sbox(149), 8 bits),
		150 -> B(Sbox(150), 8 bits),
		151 -> B(Sbox(151), 8 bits),
		152 -> B(Sbox(152), 8 bits),
		153 -> B(Sbox(153), 8 bits),
		154 -> B(Sbox(154), 8 bits),
		155 -> B(Sbox(155), 8 bits),
		156 -> B(Sbox(156), 8 bits),
		157 -> B(Sbox(157), 8 bits),
		158 -> B(Sbox(158), 8 bits),
		159 -> B(Sbox(159), 8 bits),
		160 -> B(Sbox(160), 8 bits),
		161 -> B(Sbox(161), 8 bits),
		162 -> B(Sbox(162), 8 bits),
		163 -> B(Sbox(163), 8 bits),
		164 -> B(Sbox(164), 8 bits),
		165 -> B(Sbox(165), 8 bits),
		166 -> B(Sbox(166), 8 bits),
		167 -> B(Sbox(167), 8 bits),
		168 -> B(Sbox(168), 8 bits),
		169 -> B(Sbox(169), 8 bits),
		170 -> B(Sbox(170), 8 bits),
		171 -> B(Sbox(171), 8 bits),
		172 -> B(Sbox(172), 8 bits),
		173 -> B(Sbox(173), 8 bits),
		174 -> B(Sbox(174), 8 bits),
		175 -> B(Sbox(175), 8 bits),
		176 -> B(Sbox(176), 8 bits),
		177 -> B(Sbox(177), 8 bits),
		178 -> B(Sbox(178), 8 bits),
		179 -> B(Sbox(179), 8 bits),
		180 -> B(Sbox(180), 8 bits),
		181 -> B(Sbox(181), 8 bits),
		182 -> B(Sbox(182), 8 bits),
		183 -> B(Sbox(183), 8 bits),
		184 -> B(Sbox(184), 8 bits),
		185 -> B(Sbox(185), 8 bits),
		186 -> B(Sbox(186), 8 bits),
		187 -> B(Sbox(187), 8 bits),
		188 -> B(Sbox(188), 8 bits),
		189 -> B(Sbox(189), 8 bits),
		190 -> B(Sbox(190), 8 bits),
		191 -> B(Sbox(191), 8 bits),
		192 -> B(Sbox(192), 8 bits),
		193 -> B(Sbox(193), 8 bits),
		194 -> B(Sbox(194), 8 bits),
		195 -> B(Sbox(195), 8 bits),
		196 -> B(Sbox(196), 8 bits),
		197 -> B(Sbox(197), 8 bits),
		198 -> B(Sbox(198), 8 bits),
		199 -> B(Sbox(199), 8 bits),
		200 -> B(Sbox(200), 8 bits),
		201 -> B(Sbox(201), 8 bits),
		202 -> B(Sbox(202), 8 bits),
		203 -> B(Sbox(203), 8 bits),
		204 -> B(Sbox(204), 8 bits),
		205 -> B(Sbox(205), 8 bits),
		206 -> B(Sbox(206), 8 bits),
		207 -> B(Sbox(207), 8 bits),
		208 -> B(Sbox(208), 8 bits),
		209 -> B(Sbox(209), 8 bits),
		210 -> B(Sbox(210), 8 bits),
		211 -> B(Sbox(211), 8 bits),
		212 -> B(Sbox(212), 8 bits),
		213 -> B(Sbox(213), 8 bits),
		214 -> B(Sbox(214), 8 bits),
		215 -> B(Sbox(215), 8 bits),
		216 -> B(Sbox(216), 8 bits),
		217 -> B(Sbox(217), 8 bits),
		218 -> B(Sbox(218), 8 bits),
		219 -> B(Sbox(219), 8 bits),
		220 -> B(Sbox(220), 8 bits),
		221 -> B(Sbox(221), 8 bits),
		222 -> B(Sbox(222), 8 bits),
		223 -> B(Sbox(223), 8 bits),
		224 -> B(Sbox(224), 8 bits),
		225 -> B(Sbox(225), 8 bits),
		226 -> B(Sbox(226), 8 bits),
		227 -> B(Sbox(227), 8 bits),
		228 -> B(Sbox(228), 8 bits),
		229 -> B(Sbox(229), 8 bits),
		230 -> B(Sbox(230), 8 bits),
		231 -> B(Sbox(231), 8 bits),
		232 -> B(Sbox(232), 8 bits),
		233 -> B(Sbox(233), 8 bits),
		234 -> B(Sbox(234), 8 bits),
		235 -> B(Sbox(235), 8 bits),
		236 -> B(Sbox(236), 8 bits),
		237 -> B(Sbox(237), 8 bits),
		238 -> B(Sbox(238), 8 bits),
		239 -> B(Sbox(239), 8 bits),
		240 -> B(Sbox(240), 8 bits),
		241 -> B(Sbox(241), 8 bits),
		242 -> B(Sbox(242), 8 bits),
		243 -> B(Sbox(243), 8 bits),
		244 -> B(Sbox(244), 8 bits),
		245 -> B(Sbox(245), 8 bits),
		246 -> B(Sbox(246), 8 bits),
		247 -> B(Sbox(247), 8 bits),
		248 -> B(Sbox(248), 8 bits),
		249 -> B(Sbox(249), 8 bits),
		250 -> B(Sbox(250), 8 bits),
		251 -> B(Sbox(251), 8 bits),
		252 -> B(Sbox(252), 8 bits),
		253 -> B(Sbox(253), 8 bits),
		254 -> B(Sbox(254), 8 bits),
		255 -> B(Sbox(255), 8 bits)
	)
}

object testAES_Round {
	def main(args: Array[String]): Unit = {
		val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", applyMasking = false).generate(new AesEncrypt_Round)
	}
}