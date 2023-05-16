package spinal.core

import spinal.core.fiber.Engine
import spinal.core.internals._

import scala.io.Source
import scala.collection.mutable.{ArrayBuffer, HashMap, ListBuffer}

/**
	* Different Modes of Operation
	*/
trait ModeOfOperation
object ECB extends ModeOfOperation {
	override def toString: String = "ECB"
}
object CBC extends ModeOfOperation {
	override def toString: String = "CBC"
}
object CFB extends ModeOfOperation {
	override def toString: String = "CFB"
}
object CTR extends ModeOfOperation {
	override def toString: String = "CTR"
}
object OFB extends ModeOfOperation {
	override def toString: String = "OFB"
}
object GCM extends ModeOfOperation {
	override def toString: String = "GCM"
}

trait EncDecDirection
object Enc extends EncDecDirection
object Dec extends EncDecDirection

trait ImplementationType
object Round extends ImplementationType
object Unrolled extends ImplementationType
object Pipelined extends ImplementationType

case class ModeConfig(mode : ModeOfOperation = ECB,
											implementationType : ImplementationType = Round,
											blockSize : Integer = 128,
											keySize: Integer = 128,
											direction : EncDecDirection = Enc
){}

/*object Mode {
	def apply[T <: Component](config: ModeConfig)(gen: => T): Unit = {
		val pc = new PhaseContext(SpinalConfig())
		pc.globalData.phaseContext = pc
		pc.globalData.anonymSignalPrefix = "zz"
		
		val defaultClockDomain = ClockDomain.external("", frequency = UnknownFrequency())
		Engine.create {
			val ctx = ClockDomainStack.set(defaultClockDomain)
			gen
			ctx.restore()
		}
		pc.checkGlobalData()
		
		val top = pc.topLevel
		
		val cWithModeOfOperation = config.mode match {
			case `ECB` => println("ECB-mode will be instantiated"); ECBModeBoot(top, config)
			case `CBC` => println("CBC-mode will be instantiated")
			case `CFB` => println("CFB-mode will be instantiated")
			case `CTR` => println("CTR-mode will be instantiated")
			case _ => println("Please specify a mode in ModeConfig (mode = [ECB, CBC, CFB, CTR])")
		}
	}
}

object ECBModeBoot {
	def apply(BC : Component, config : ModeConfig): Component = {
		BC
	}
}*/