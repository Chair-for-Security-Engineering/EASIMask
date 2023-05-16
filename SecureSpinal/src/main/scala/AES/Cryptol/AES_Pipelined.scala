package AES.Cryptol

import spinal.core._
import spinal.lib._
import spinal.lib.fsm._

class AesEncrypt_Pipelined extends Component {
	val io = new Bundle {
		val inputValid = in Bool()
		val pt = in Bits(128 bits)
		val key = in Bits(128 bits)
		val ret = out Bits(128 bits)
		val dataValid = out Bool()
	}
	
	val state0 = Vec(Vec(Bits(8 bits), 4), 4)
	val rounds0 = Reg(Vec(Vec(Bits(8 bits), 4), 4))
	val rcs0 = B(1, 8 bits)
	val keys0 = MsgToState(io.key)
	val counter = Counter(9)
	val addroundkey0 = new AddRoundKey
	addroundkey0.setAsLinear
	addroundkey0.io.s := MsgToState(io.pt)
	addroundkey0.io.rk := keys0
	state0 := addroundkey0.io.ret
	rounds0 := state0
	
	val nextrc0 = new NextRC
	val keyschedule0 = new KeySchedule
	nextrc0.io.rc := rcs0
	val rcs1 = nextrc0.io.ret
	keyschedule0.io.key := keys0
	keyschedule0.io.c := rcs0
	val keys1 = RegNext(keyschedule0.io.ret)
	val subbytes1 = new SubBytes
	subbytes1.io.state := rounds0
	val shiftrows1 = new ShiftRows
	shiftrows1.setAsLinear
	shiftrows1.io.state := subbytes1.io.ret
	val mixcolumns1 = new MixColumns
	mixcolumns1.setAsLinear
	mixcolumns1.io.state := shiftrows1.io.ret
	val addroundkey1 = new AddRoundKey
	addroundkey1.setAsLinear
	addroundkey1.io.s := mixcolumns1.io.ret
	addroundkey1.io.rk := keys1
	val rounds1 = RegNext(addroundkey1.io.ret)
	val inputValid1 = RegNext(io.inputValid) init(False)
	
	val nextrc1 = new NextRC
	val keyschedule1 = new KeySchedule
	nextrc1.io.rc := rcs1
	val rcs2 = nextrc1.io.ret
	keyschedule1.io.key := keys1
	keyschedule1.io.c := rcs1
	val keys2 = RegNext(keyschedule1.io.ret)
	val subbytes2 = new SubBytes
	subbytes2.io.state := rounds1
	val shiftrows2 = new ShiftRows
	shiftrows2.setAsLinear
	shiftrows2.io.state := subbytes2.io.ret
	val mixcolumns2 = new MixColumns
	mixcolumns2.setAsLinear
	mixcolumns2.io.state := shiftrows2.io.ret
	val addroundkey2 = new AddRoundKey
	addroundkey2.setAsLinear
	addroundkey2.io.s := mixcolumns2.io.ret
	addroundkey2.io.rk := keys2
	val rounds2 = RegNext(addroundkey2.io.ret)
	val inputValid2 = RegNext(inputValid1) init(False)
	
	val nextrc2 = new NextRC
	val keyschedule2 = new KeySchedule
	nextrc2.io.rc := rcs2
	val rcs3 = nextrc2.io.ret
	keyschedule2.io.key := keys2
	keyschedule2.io.c := rcs2
	val keys3 = RegNext(keyschedule2.io.ret)
	val subbytes3 = new SubBytes
	subbytes3.io.state := rounds2
	val shiftrows3 = new ShiftRows
	shiftrows3.setAsLinear
	shiftrows3.io.state := subbytes3.io.ret
	val mixcolumns3 = new MixColumns
	mixcolumns3.setAsLinear
	mixcolumns3.io.state := shiftrows3.io.ret
	val addroundkey3 = new AddRoundKey
	addroundkey3.setAsLinear
	addroundkey3.io.s := mixcolumns3.io.ret
	addroundkey3.io.rk := keys3
	val rounds3 = RegNext(addroundkey3.io.ret)
	val inputValid3 = RegNext(inputValid2) init(False)
	
	val nextrc3 = new NextRC
	val keyschedule3 = new KeySchedule
	nextrc3.io.rc := rcs3
	val rcs4 = nextrc3.io.ret
	keyschedule3.io.key := keys3
	keyschedule3.io.c := rcs3
	val keys4 = RegNext(keyschedule3.io.ret)
	val subbytes4 = new SubBytes
	subbytes4.io.state := rounds3
	val shiftrows4 = new ShiftRows
	shiftrows4.setAsLinear
	shiftrows4.io.state := subbytes4.io.ret
	val mixcolumns4 = new MixColumns
	mixcolumns4.setAsLinear
	mixcolumns4.io.state := shiftrows4.io.ret
	val addroundkey4 = new AddRoundKey
	addroundkey4.setAsLinear
	addroundkey4.io.s := mixcolumns4.io.ret
	addroundkey4.io.rk := keys4
	val rounds4 = RegNext(addroundkey4.io.ret)
	val inputValid4 = RegNext(inputValid3) init(False)
	
	val nextrc4 = new NextRC
	val keyschedule4 = new KeySchedule
	nextrc4.io.rc := rcs4
	val rcs5 = nextrc4.io.ret
	keyschedule4.io.key := keys4
	keyschedule4.io.c := rcs4
	val keys5 = RegNext(keyschedule4.io.ret)
	val subbytes5 = new SubBytes
	subbytes5.io.state := rounds4
	val shiftrows5 = new ShiftRows
	shiftrows5.setAsLinear
	shiftrows5.io.state := subbytes5.io.ret
	val mixcolumns5 = new MixColumns
	mixcolumns5.setAsLinear
	mixcolumns5.io.state := shiftrows5.io.ret
	val addroundkey5 = new AddRoundKey
	addroundkey5.setAsLinear
	addroundkey5.io.s := mixcolumns5.io.ret
	addroundkey5.io.rk := keys5
	val rounds5 = RegNext(addroundkey5.io.ret)
	val inputValid5 = RegNext(inputValid4) init(False)
	
	val nextrc5 = new NextRC
	val keyschedule5 = new KeySchedule
	nextrc5.io.rc := rcs5
	val rcs6 = nextrc5.io.ret
	keyschedule5.io.key := keys5
	keyschedule5.io.c := rcs5
	val keys6 = RegNext(keyschedule5.io.ret)
	val subbytes6 = new SubBytes
	subbytes6.io.state := rounds5
	val shiftrows6 = new ShiftRows
	shiftrows6.setAsLinear
	shiftrows6.io.state := subbytes6.io.ret
	val mixcolumns6 = new MixColumns
	mixcolumns6.setAsLinear
	mixcolumns6.io.state := shiftrows6.io.ret
	val addroundkey6 = new AddRoundKey
	addroundkey6.setAsLinear
	addroundkey6.io.s := mixcolumns6.io.ret
	addroundkey6.io.rk := keys6
	val rounds6 = RegNext(addroundkey6.io.ret)
	val inputValid6 = RegNext(inputValid5) init(False)
	
	val nextrc6 = new NextRC
	val keyschedule6 = new KeySchedule
	nextrc6.io.rc := rcs6
	val rcs7 = nextrc6.io.ret
	keyschedule6.io.key := keys6
	keyschedule6.io.c := rcs6
	val keys7 = RegNext(keyschedule6.io.ret)
	val subbytes7 = new SubBytes
	subbytes7.io.state := rounds6
	val shiftrows7 = new ShiftRows
	shiftrows7.setAsLinear
	shiftrows7.io.state := subbytes7.io.ret
	val mixcolumns7 = new MixColumns
	mixcolumns7.setAsLinear
	mixcolumns7.io.state := shiftrows7.io.ret
	val addroundkey7 = new AddRoundKey
	addroundkey7.setAsLinear
	addroundkey7.io.s := mixcolumns7.io.ret
	addroundkey7.io.rk := keys7
	val rounds7 = RegNext(addroundkey7.io.ret)
	val inputValid7 = RegNext(inputValid6) init(False)
	
	val nextrc7 = new NextRC
	val keyschedule7 = new KeySchedule
	nextrc7.io.rc := rcs7
	val rcs8 = nextrc7.io.ret
	keyschedule7.io.key := keys7
	keyschedule7.io.c := rcs7
	val keys8 = RegNext(keyschedule7.io.ret)
	val subbytes8 = new SubBytes
	subbytes8.io.state := rounds7
	val shiftrows8 = new ShiftRows
	shiftrows8.setAsLinear
	shiftrows8.io.state := subbytes8.io.ret
	val mixcolumns8 = new MixColumns
	mixcolumns8.setAsLinear
	mixcolumns8.io.state := shiftrows8.io.ret
	val addroundkey8 = new AddRoundKey
	addroundkey8.setAsLinear
	addroundkey8.io.s := mixcolumns8.io.ret
	addroundkey8.io.rk := keys8
	val rounds8 = RegNext(addroundkey8.io.ret)
	val inputValid8 = RegNext(inputValid7) init(False)
	
	val nextrc8 = new NextRC
	val keyschedule8 = new KeySchedule
	nextrc8.io.rc := rcs8
	val rcs9 = nextrc8.io.ret
	keyschedule8.io.key := keys8
	keyschedule8.io.c := rcs8
	val keys9 = RegNext(keyschedule8.io.ret)
	val subbytes9 = new SubBytes
	subbytes9.io.state := rounds8
	val shiftrows9 = new ShiftRows
	shiftrows9.setAsLinear
	shiftrows9.io.state := subbytes9.io.ret
	val mixcolumns9 = new MixColumns
	mixcolumns9.setAsLinear
	mixcolumns9.io.state := shiftrows9.io.ret
	val addroundkey9 = new AddRoundKey
	addroundkey9.setAsLinear
	addroundkey9.io.s := mixcolumns9.io.ret
	addroundkey9.io.rk := keys9
	val rounds9 = RegNext(addroundkey9.io.ret)
	val inputValid9 = RegNext(inputValid8) init(False)
	
	val nextrc9 = new NextRC
	val keyschedule9 = new KeySchedule
	nextrc9.io.rc := rcs9
	val rcs10 = nextrc9.io.ret
	keyschedule9.io.key := keys9
	keyschedule9.io.c := rcs9
	val keys10 = RegNext(keyschedule9.io.ret)
	val subbytes10 = new SubBytes
	subbytes10.io.state := rounds9
	val shiftrows10 = new ShiftRows
	shiftrows10.setAsLinear
	shiftrows10.io.state := subbytes10.io.ret
	val addroundkey10 = new AddRoundKey
	addroundkey10.io.s := shiftrows10.io.ret
	addroundkey10.io.rk := keys10
	val inputValid10 = RegNext(inputValid9) init(False)
	io.ret := StateToMsg(addroundkey10.io.ret)
	io.dataValid := inputValid10
	
	
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

object testAES_Pipelined {
	def main(args: Array[String]): Unit = {
		val report = SpinalConfig(mode = VHDL, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL", applyMasking = false).generate(new AesEncrypt_Pipelined)
		//report.mergeRTLSource()
		//SpinalConfig(mode = Verilog, targetDirectory = "SecureSpinal/src/main/scala/Tests/RTL").generate(new test)
	}
}