package AES.Serial

//import AES.
import spinal.core._
import spinal.lib._

class AES_Masked_Modified extends Component {
	import States2._
	val io = new Bundle {
		val clk 		= in Bool()
		val reset 	= in Bool()
		val enable 	= in Bool()
		val pt1 		= in Bits(128 bits)
		val pt2 		= in Bits(128 bits)
		val key1 		= in Bits(128 bits)
		val key2 		= in Bits(128 bits)
		val m 			= in Bits(28 bits)
		val ct1 		= out Bits(128 bits)
		val ct2 		= out Bits(128 bits)
		val done 		= out Bool()
	}
	
	val r = new ClockingArea(ClockDomain(io.clk, io.reset)) {
		val stateReg 	= Vec(Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4), 2)
		val keyReg 		= Vec(Vec(Vec(Reg(Bits(8 bits)) init(0), 4), 4), 2)
		val fsmState 	= Reg(States2()) init(sIdle)
		
		val round = Counter(1, 11)
		val control1, control2 = Counter(0, 3)
		val control = Counter(25)
		when (control.willOverflow) {
			round.increment()
		}
		val roundConstant = Reg(Bits(8 bits)) init(1)
		when (control.willOverflow) {
			when (U(roundConstant) < 0x80) {
				roundConstant := roundConstant |<< 1
			} otherwise {
				roundConstant := (roundConstant |<< 1) ^ 0x1B
			}
		}
		val rc = Bits(8 bits)
		
		val stateRotation = Bool()
		//stateRotation := False
		val shiftRowsRotation = Bool()
		//shiftRowsRotation := False
		val mixColumnsRotation = Bool()
		//mixColumnsRotation := False
		val keyRotation = Bool()
		//keyRotation := False
		val keyRotation2 = Bool()
		//keyRotation2 := False
		val keySboxRotation = Bool()
		//keySboxRotation := False
		val keyRCRotation = Bool()
		//keyRCRotation := False
		
		val finalKeyAdd = Bool()
		//finalKeyAdd := round.value === 11
		val finalRound = Bool()
		//finalRound := round.value === 10
		
		val addroundkey1, addroundkey2 = new AddRoundKey
		addroundkey1.io.a := stateReg(0)(0)(0)
		addroundkey1.io.k := keyReg(0)(0)(0)
		addroundkey2.io.a := stateReg(1)(0)(0)
		addroundkey2.io.k := keyReg(1)(0)(0)
		
		val sbox = new SBoxMasked
		sbox.io.clk := io.clk
		sbox.io.reset := io.reset
		
		when (control.value < 16) {
			sbox.io.sbIn0 := addroundkey1.io.b
			sbox.io.sbIn1 := addroundkey2.io.b
		} otherwise {
			sbox.io.sbIn0 := keyReg(0)(1)(3)
			sbox.io.sbIn1 := keyReg(1)(1)(3)
		}
		sbox.io.m := io.m
		
		
		val mixcolumns1, mixcolumns2 = new MixColumns
		mixcolumns1.io.mcIn1 := stateReg(0)(0)(0)
		mixcolumns1.io.mcIn2 := stateReg(0)(1)(0)
		mixcolumns1.io.mcIn3 := stateReg(0)(2)(0)
		mixcolumns1.io.mcIn4 := stateReg(0)(3)(0)
		mixcolumns2.io.mcIn1 := stateReg(1)(0)(0)
		mixcolumns2.io.mcIn2 := stateReg(1)(1)(0)
		mixcolumns2.io.mcIn3 := stateReg(1)(2)(0)
		mixcolumns2.io.mcIn4 := stateReg(1)(3)(0)
		
		when (stateRotation) {
			stateReg(0)(0)(0) := stateReg(0)(1)(0)
			stateReg(0)(1)(0) := stateReg(0)(2)(0)
			stateReg(0)(2)(0) := stateReg(0)(3)(0)
			stateReg(0)(3)(0) := stateReg(0)(0)(1)
			stateReg(0)(0)(1) := stateReg(0)(1)(1)
			stateReg(0)(1)(1) := stateReg(0)(2)(1)
			stateReg(0)(2)(1) := stateReg(0)(3)(1)
			stateReg(0)(3)(1) := stateReg(0)(0)(2)
			stateReg(0)(0)(2) := stateReg(0)(1)(2)
			stateReg(0)(1)(2) := stateReg(0)(2)(2)
			stateReg(0)(2)(2) := stateReg(0)(3)(2)
			stateReg(0)(3)(2) := stateReg(0)(0)(3)
			stateReg(0)(0)(3) := stateReg(0)(1)(3)
			stateReg(0)(1)(3) := stateReg(0)(2)(3)
			stateReg(0)(2)(3) := stateReg(0)(3)(3)
			stateReg(0)(3)(3) := sbox.io.sbOut0
			when (finalKeyAdd) {
				stateReg(0)(3)(3) := addroundkey1.io.b
			}
			
			stateReg(1)(0)(0) := stateReg(1)(1)(0)
			stateReg(1)(1)(0) := stateReg(1)(2)(0)
			stateReg(1)(2)(0) := stateReg(1)(3)(0)
			stateReg(1)(3)(0) := stateReg(1)(0)(1)
			stateReg(1)(0)(1) := stateReg(1)(1)(1)
			stateReg(1)(1)(1) := stateReg(1)(2)(1)
			stateReg(1)(2)(1) := stateReg(1)(3)(1)
			stateReg(1)(3)(1) := stateReg(1)(0)(2)
			stateReg(1)(0)(2) := stateReg(1)(1)(2)
			stateReg(1)(1)(2) := stateReg(1)(2)(2)
			stateReg(1)(2)(2) := stateReg(1)(3)(2)
			stateReg(1)(3)(2) := stateReg(1)(0)(3)
			stateReg(1)(0)(3) := stateReg(1)(1)(3)
			stateReg(1)(1)(3) := stateReg(1)(2)(3)
			stateReg(1)(2)(3) := stateReg(1)(3)(3)
			stateReg(1)(3)(3) := sbox.io.sbOut1
			when (finalKeyAdd) {
				stateReg(1)(3)(3) := addroundkey2.io.b
			}
		} elsewhen (shiftRowsRotation) {
			stateReg(0)(0)(0) := stateReg(0)(0)(0)
			stateReg(0)(0)(1) := stateReg(0)(0)(1)
			stateReg(0)(0)(2) := stateReg(0)(0)(2)
			stateReg(0)(0)(3) := stateReg(0)(0)(3)
			stateReg(0)(1)(0) := stateReg(0)(1)(1)
			stateReg(0)(1)(1) := stateReg(0)(1)(2)
			stateReg(0)(1)(2) := stateReg(0)(1)(3)
			stateReg(0)(1)(3) := stateReg(0)(1)(0)
			stateReg(0)(2)(0) := stateReg(0)(2)(2)
			stateReg(0)(2)(1) := stateReg(0)(2)(3)
			stateReg(0)(2)(2) := stateReg(0)(2)(0)
			stateReg(0)(2)(3) := stateReg(0)(2)(1)
			stateReg(0)(3)(0) := stateReg(0)(3)(3)
			stateReg(0)(3)(1) := stateReg(0)(3)(0)
			stateReg(0)(3)(2) := stateReg(0)(3)(1)
			stateReg(0)(3)(3) := stateReg(0)(3)(2)
			
			stateReg(1)(0)(0) := stateReg(1)(0)(0)
			stateReg(1)(0)(1) := stateReg(1)(0)(1)
			stateReg(1)(0)(2) := stateReg(1)(0)(2)
			stateReg(1)(0)(3) := stateReg(1)(0)(3)
			stateReg(1)(1)(0) := stateReg(1)(1)(1)
			stateReg(1)(1)(1) := stateReg(1)(1)(2)
			stateReg(1)(1)(2) := stateReg(1)(1)(3)
			stateReg(1)(1)(3) := stateReg(1)(1)(0)
			stateReg(1)(2)(0) := stateReg(1)(2)(2)
			stateReg(1)(2)(1) := stateReg(1)(2)(3)
			stateReg(1)(2)(2) := stateReg(1)(2)(0)
			stateReg(1)(2)(3) := stateReg(1)(2)(1)
			stateReg(1)(3)(0) := stateReg(1)(3)(3)
			stateReg(1)(3)(1) := stateReg(1)(3)(0)
			stateReg(1)(3)(2) := stateReg(1)(3)(1)
			stateReg(1)(3)(3) := stateReg(1)(3)(2)
		} elsewhen (mixColumnsRotation) {
			stateReg(0)(0)(0) := stateReg(0)(0)(1)
			stateReg(0)(1)(0) := stateReg(0)(1)(1)
			stateReg(0)(2)(0) := stateReg(0)(2)(1)
			stateReg(0)(3)(0) := stateReg(0)(3)(1)
			stateReg(0)(0)(1) := stateReg(0)(0)(2)
			stateReg(0)(1)(1) := stateReg(0)(1)(2)
			stateReg(0)(2)(1) := stateReg(0)(2)(2)
			stateReg(0)(3)(1) := stateReg(0)(3)(2)
			stateReg(0)(0)(2) := stateReg(0)(0)(3)
			stateReg(0)(1)(2) := stateReg(0)(1)(3)
			stateReg(0)(2)(2) := stateReg(0)(2)(3)
			stateReg(0)(3)(2) := stateReg(0)(3)(3)
			stateReg(0)(0)(3) := mixcolumns1.io.mcOut1
			stateReg(0)(1)(3) := mixcolumns1.io.mcOut2
			stateReg(0)(2)(3) := mixcolumns1.io.mcOut3
			stateReg(0)(3)(3) := mixcolumns1.io.mcOut4
			when (finalRound)  {
				stateReg(0)(0)(3) := stateReg(0)(0)(0)
				stateReg(0)(1)(3) := stateReg(0)(1)(0)
				stateReg(0)(2)(3) := stateReg(0)(2)(0)
				stateReg(0)(3)(3) := stateReg(0)(3)(0)
			}
			
			stateReg(1)(0)(0) := stateReg(1)(0)(1)
			stateReg(1)(1)(0) := stateReg(1)(1)(1)
			stateReg(1)(2)(0) := stateReg(1)(2)(1)
			stateReg(1)(3)(0) := stateReg(1)(3)(1)
			stateReg(1)(0)(1) := stateReg(1)(0)(2)
			stateReg(1)(1)(1) := stateReg(1)(1)(2)
			stateReg(1)(2)(1) := stateReg(1)(2)(2)
			stateReg(1)(3)(1) := stateReg(1)(3)(2)
			stateReg(1)(0)(2) := stateReg(1)(0)(3)
			stateReg(1)(1)(2) := stateReg(1)(1)(3)
			stateReg(1)(2)(2) := stateReg(1)(2)(3)
			stateReg(1)(3)(2) := stateReg(1)(3)(3)
			stateReg(1)(0)(3) := mixcolumns2.io.mcOut1
			stateReg(1)(1)(3) := mixcolumns2.io.mcOut2
			stateReg(1)(2)(3) := mixcolumns2.io.mcOut3
			stateReg(1)(3)(3) := mixcolumns2.io.mcOut4
			when (finalRound)  {
				stateReg(1)(0)(3) := stateReg(1)(0)(0)
				stateReg(1)(1)(3) := stateReg(1)(1)(0)
				stateReg(1)(2)(3) := stateReg(1)(2)(0)
				stateReg(1)(3)(3) := stateReg(1)(3)(0)
			}
		}
		
		when (keyRotation) {
			keyReg(0)(0)(0) := keyReg(0)(1)(0)
			keyReg(0)(1)(0) := keyReg(0)(2)(0)
			keyReg(0)(2)(0) := keyReg(0)(3)(0)
			keyReg(0)(0)(1) := keyReg(0)(1)(1)
			keyReg(0)(1)(1) := keyReg(0)(2)(1)
			keyReg(0)(2)(1) := keyReg(0)(3)(1)
			keyReg(0)(0)(2) := keyReg(0)(1)(2)
			keyReg(0)(1)(2) := keyReg(0)(2)(2)
			keyReg(0)(2)(2) := keyReg(0)(3)(2)
			keyReg(0)(0)(3) := keyReg(0)(1)(3)
			keyReg(0)(1)(3) := keyReg(0)(2)(3)
			keyReg(0)(2)(3) := keyReg(0)(3)(3)
			keyReg(0)(3)(0) := keyReg(0)(0)(1)
			keyReg(0)(3)(1) := keyReg(0)(0)(2)
			keyReg(0)(3)(2) := keyReg(0)(0)(3)
			keyReg(0)(3)(3) := keyReg(0)(0)(0)
			
			keyReg(1)(0)(0) := keyReg(1)(1)(0)
			keyReg(1)(1)(0) := keyReg(1)(2)(0)
			keyReg(1)(2)(0) := keyReg(1)(3)(0)
			keyReg(1)(0)(1) := keyReg(1)(1)(1)
			keyReg(1)(1)(1) := keyReg(1)(2)(1)
			keyReg(1)(2)(1) := keyReg(1)(3)(1)
			keyReg(1)(0)(2) := keyReg(1)(1)(2)
			keyReg(1)(1)(2) := keyReg(1)(2)(2)
			keyReg(1)(2)(2) := keyReg(1)(3)(2)
			keyReg(1)(0)(3) := keyReg(1)(1)(3)
			keyReg(1)(1)(3) := keyReg(1)(2)(3)
			keyReg(1)(2)(3) := keyReg(1)(3)(3)
			keyReg(1)(3)(0) := keyReg(1)(0)(1)
			keyReg(1)(3)(1) := keyReg(1)(0)(2)
			keyReg(1)(3)(2) := keyReg(1)(0)(3)
			keyReg(1)(3)(3) := keyReg(1)(0)(0)
			
			when (keyRotation2) {
				keyReg(0)(3)(0) := keyReg(0)(0)(0) ^ keyReg(0)(0)(1)
				keyReg(0)(3)(1) := keyReg(0)(0)(2)
				keyReg(0)(3)(2) := keyReg(0)(0)(3)
				keyReg(0)(3)(3) := keyReg(0)(0)(0)
				
				keyReg(1)(3)(0) := keyReg(1)(0)(0) ^ keyReg(1)(0)(1)
				keyReg(1)(3)(1) := keyReg(1)(0)(2)
				keyReg(1)(3)(2) := keyReg(1)(0)(3)
				keyReg(1)(3)(3) := keyReg(1)(0)(0)
			}
		} elsewhen (keySboxRotation) {
			keyReg(0)(1)(3) := keyReg(0)(2)(3)
			keyReg(0)(2)(3) := keyReg(0)(3)(3)
			keyReg(0)(3)(3) := keyReg(0)(0)(3)
			keyReg(0)(0)(3) := keyReg(0)(1)(3)
			
			keyReg(1)(1)(3) := keyReg(1)(2)(3)
			keyReg(1)(2)(3) := keyReg(1)(3)(3)
			keyReg(1)(3)(3) := keyReg(1)(0)(3)
			keyReg(1)(0)(3) := keyReg(1)(1)(3)
		} elsewhen (keyRCRotation) {
			keyReg(0)(0)(0) := keyReg(0)(1)(0)
			keyReg(0)(1)(0) := keyReg(0)(2)(0)
			keyReg(0)(2)(0) := keyReg(0)(3)(0)
			keyReg(0)(3)(0) := sbox.io.sbOut0 ^ keyReg(0)(0)(0) ^ rc
			
			keyReg(1)(0)(0) := keyReg(1)(1)(0)
			keyReg(1)(1)(0) := keyReg(1)(2)(0)
			keyReg(1)(2)(0) := keyReg(1)(3)(0)
			keyReg(1)(3)(0) := sbox.io.sbOut1 ^ keyReg(1)(0)(0)
		}
		
		io.ct1 := 0
		io.ct2 := 0
		io.done := False
		
		switch (fsmState) {
			is (sIdle) {
				fsmState := sIdle
				
				stateReg(0).foreach(a => a.foreach(b => b := 0))
				stateReg(1).foreach(a => a.foreach(b => b := 0))
				keyReg(0).foreach(a => a.foreach(b => b := 0))
				keyReg(1).foreach(a => a.foreach(b => b := 0))
				round.clear()
				control.clear()
				control1.clear()
				control2.clear()
				roundConstant := 1
				
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				when (io.enable) {
					fsmState := sInit
				}
			}
			
			is (sInit) {
				fsmState := sRound
				
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				stateReg(0)(0)(0) := io.pt1(127 downto 120)
				stateReg(0)(1)(0) := io.pt1(119 downto 112)
				stateReg(0)(2)(0) := io.pt1(111 downto 104)
				stateReg(0)(3)(0) := io.pt1(103 downto  96)
				stateReg(0)(0)(1) := io.pt1( 95 downto  88)
				stateReg(0)(1)(1) := io.pt1( 87 downto  80)
				stateReg(0)(2)(1) := io.pt1( 79 downto  72)
				stateReg(0)(3)(1) := io.pt1( 71 downto  64)
				stateReg(0)(0)(2) := io.pt1( 63 downto  56)
				stateReg(0)(1)(2) := io.pt1( 55 downto  48)
				stateReg(0)(2)(2) := io.pt1( 47 downto  40)
				stateReg(0)(3)(2) := io.pt1( 39 downto  32)
				stateReg(0)(0)(3) := io.pt1( 31 downto  24)
				stateReg(0)(1)(3) := io.pt1( 23 downto  16)
				stateReg(0)(2)(3) := io.pt1( 15 downto   8)
				stateReg(0)(3)(3) := io.pt1(  7 downto   0)
				
				stateReg(1)(0)(0) := io.pt2(127 downto 120)
				stateReg(1)(1)(0) := io.pt2(119 downto 112)
				stateReg(1)(2)(0) := io.pt2(111 downto 104)
				stateReg(1)(3)(0) := io.pt2(103 downto  96)
				stateReg(1)(0)(1) := io.pt2( 95 downto  88)
				stateReg(1)(1)(1) := io.pt2( 87 downto  80)
				stateReg(1)(2)(1) := io.pt2( 79 downto  72)
				stateReg(1)(3)(1) := io.pt2( 71 downto  64)
				stateReg(1)(0)(2) := io.pt2( 63 downto  56)
				stateReg(1)(1)(2) := io.pt2( 55 downto  48)
				stateReg(1)(2)(2) := io.pt2( 47 downto  40)
				stateReg(1)(3)(2) := io.pt2( 39 downto  32)
				stateReg(1)(0)(3) := io.pt2( 31 downto  24)
				stateReg(1)(1)(3) := io.pt2( 23 downto  16)
				stateReg(1)(2)(3) := io.pt2( 15 downto   8)
				stateReg(1)(3)(3) := io.pt2(  7 downto   0)
				
				keyReg(0)(0)(0) := io.key1(127 downto 120)
				keyReg(0)(1)(0) := io.key1(119 downto 112)
				keyReg(0)(2)(0) := io.key1(111 downto 104)
				keyReg(0)(3)(0) := io.key1(103 downto  96)
				keyReg(0)(0)(1) := io.key1( 95 downto  88)
				keyReg(0)(1)(1) := io.key1( 87 downto  80)
				keyReg(0)(2)(1) := io.key1( 79 downto  72)
				keyReg(0)(3)(1) := io.key1( 71 downto  64)
				keyReg(0)(0)(2) := io.key1( 63 downto  56)
				keyReg(0)(1)(2) := io.key1( 55 downto  48)
				keyReg(0)(2)(2) := io.key1( 47 downto  40)
				keyReg(0)(3)(2) := io.key1( 39 downto  32)
				keyReg(0)(0)(3) := io.key1( 31 downto  24)
				keyReg(0)(1)(3) := io.key1( 23 downto  16)
				keyReg(0)(2)(3) := io.key1( 15 downto   8)
				keyReg(0)(3)(3) := io.key1(  7 downto   0)
				
				keyReg(1)(0)(0) := io.key2(127 downto 120)
				keyReg(1)(1)(0) := io.key2(119 downto 112)
				keyReg(1)(2)(0) := io.key2(111 downto 104)
				keyReg(1)(3)(0) := io.key2(103 downto  96)
				keyReg(1)(0)(1) := io.key2( 95 downto  88)
				keyReg(1)(1)(1) := io.key2( 87 downto  80)
				keyReg(1)(2)(1) := io.key2( 79 downto  72)
				keyReg(1)(3)(1) := io.key2( 71 downto  64)
				keyReg(1)(0)(2) := io.key2( 63 downto  56)
				keyReg(1)(1)(2) := io.key2( 55 downto  48)
				keyReg(1)(2)(2) := io.key2( 47 downto  40)
				keyReg(1)(3)(2) := io.key2( 39 downto  32)
				keyReg(1)(0)(3) := io.key2( 31 downto  24)
				keyReg(1)(1)(3) := io.key2( 23 downto  16)
				keyReg(1)(2)(3) := io.key2( 15 downto   8)
				keyReg(1)(3)(3) := io.key2(  7 downto   0)
			}
			
			is (sRound) {
				fsmState := sRound
				control.increment()
				finalRound := round.value === 10
				finalKeyAdd := round.value === 11
				
				when (control.value < 20) {
					stateRotation := True
					when (control.value === 15 && round.value === round.end) {
						fsmState := sDone
						control.clear()
					}
				} otherwise {
					stateRotation := False
				}
				
				when (control.value === 20) {
					shiftRowsRotation := True
				} otherwise {
					shiftRowsRotation := False
				}
				
				when (control.value > 20) {
					mixColumnsRotation := True
				} otherwise {
					mixColumnsRotation := False
				}
				
				when (control.value < 16) {
					keyRotation := True
					when (control.value < 12 && round.value > 1) {
						keyRotation2 := True
					} otherwise {
						keyRotation2 := False
					}
				} otherwise {
					keyRotation := False
					keyRotation2 := False
				}
				
				when (control.value >= 16 && control.value < 20) {
					keySboxRotation := True
				} otherwise {
					keySboxRotation := False
				}
				
				when (control.value === 20) {
					rc := roundConstant
				} otherwise {
					rc := 0
				}
				
				when (control.value >= 20 && control.value < 24) {
					keyRCRotation := True
				} otherwise {
					keyRCRotation := False
				}
			}
			
			is (sDone) {
				fsmState := sDone
				
				stateRotation := False
				shiftRowsRotation := False
				mixColumnsRotation := False
				keyRotation := False
				keyRotation2 := False
				keySboxRotation := False
				keyRCRotation := False
				rc := 0
				finalRound := False
				finalKeyAdd := False
				
				io.ct1 := stateReg(0)(0)(0) ##
				 stateReg(0)(1)(0) ##
				 stateReg(0)(2)(0) ##
				 stateReg(0)(3)(0) ##
				 stateReg(0)(0)(1) ##
				 stateReg(0)(1)(1) ##
				 stateReg(0)(2)(1) ##
				 stateReg(0)(3)(1) ##
				 stateReg(0)(0)(2) ##
				 stateReg(0)(1)(2) ##
				 stateReg(0)(2)(2) ##
				 stateReg(0)(3)(2) ##
				 stateReg(0)(0)(3) ##
				 stateReg(0)(1)(3) ##
				 stateReg(0)(2)(3) ##
				 stateReg(0)(3)(3)
				io.ct2 := stateReg(1)(0)(0) ##
				 stateReg(1)(1)(0) ##
				 stateReg(1)(2)(0) ##
				 stateReg(1)(3)(0) ##
				 stateReg(1)(0)(1) ##
				 stateReg(1)(1)(1) ##
				 stateReg(1)(2)(1) ##
				 stateReg(1)(3)(1) ##
				 stateReg(1)(0)(2) ##
				 stateReg(1)(1)(2) ##
				 stateReg(1)(2)(2) ##
				 stateReg(1)(3)(2) ##
				 stateReg(1)(0)(3) ##
				 stateReg(1)(1)(3) ##
				 stateReg(1)(2)(3) ##
				 stateReg(1)(3)(3)
				io.done := True
			}
		}
	}
}

object GenerateAESMaskedModified {
	def main(args: Array[String]): Unit = {
		SpinalConfig(mode = VHDL, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Masked_Modified)
		SpinalConfig(mode = Verilog, targetDirectory = "C:/Users/fabusbo/Desktop/VE-HEP/ap3/SpinalHDL/SecureSpinal/src/main/scala/AES/Serial/RTL").generate(new AES_Masked_Modified)
	}
}