package spinal.core.internals

import spinal.core._

import java.io.{File, FileWriter}
import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

class PhaseSpinal(pc: PhaseContext, report: SpinalReport[_]) extends PhaseMisc {
	import pc._
	
	var outFile: java.io.FileWriter = null
	
	override def impl(pc: PhaseContext): Unit = {
		report.toplevelName = pc.topLevel.definitionName
		var targetFilePath = ""
		
		targetFilePath = pc.config.targetDirectory + "/" + (if (pc.config.netlistFileName == null) (topLevel.definitionName + ".scala") else pc.config.netlistFileName)
		report.generatedSourcesPaths += targetFilePath
		report.toplevelName = pc.topLevel.definitionName
		
		//val source = scala.io.Source.fromFile(targetFilePath).getLines()
		
		//println(source)
		//source.foreach(s => println(s))
		
		outFile = new FileWriter(targetFilePath, true)
		//outFile.write("//This will be a really cool SpinalHDL file, believe me!")
		
		//source.foreach(s => outFile.write(s))
		
		//outFile.write(s"package Tests\n\n")
		//outFile.write(s"import spinal.core._\n\n")
		
		for (c <- sortedComponents) {
			if (!c.isInBlackBoxTree) {
				outFile.write(compile(c))
				outFile.flush()
			}
		}
		
		outFile.flush()
		outFile.close()
	}
	
	def compile(component: Component): String = {
		val componentBuilderSpinal = new ComponentEmitterSpinal(
			c = component,
			pc = pc
		)
		
		val text = componentBuilderSpinal.result
		text
	}
}