/*                                                                           *\
**        _____ ____  _____   _____    __                                    **
**       / ___// __ \/  _/ | / /   |  / /   HDL Core                         **
**       \__ \/ /_/ // //  |/ / /| | / /    (c) Dolu, All rights reserved    **
**      ___/ / ____// // /|  / ___ |/ /___                                   **
**     /____/_/   /___/_/ |_/_/  |_/_____/                                   **
**                                                                           **
**      This library is free software; you can redistribute it and/or        **
**    modify it under the terms of the GNU Lesser General Public             **
**    License as published by the Free Software Foundation; either           **
**    version 3.0 of the License, or (at your option) any later version.     **
**                                                                           **
**      This library is distributed in the hope that it will be useful,      **
**    but WITHOUT ANY WARRANTY; without even the implied warranty of         **
**    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU      **
**    Lesser General Public License for more details.                        **
**                                                                           **
**      You should have received a copy of the GNU Lesser General Public     **
**    License along with this library.                                       **
\*                                                                           */
package spinal.core.internals

import com.sun.tools.javac.comp.Todo
import spinal.core.Nameable.{DATAMODEL_STRONG, DATAMODEL_WEAK}

import java.io.{BufferedWriter, File, FileWriter}
import scala.collection.mutable.ListBuffer
import spinal.core._
import spinal.core.fiber.Engine
import spinal.core.internals.Operator.Bits.{ShiftLeftByInt, ShiftLeftByIntFixedWidth}
import spinal.core.internals.Operator.SInt.ShiftRightByIntFixedWidth
import spinal.core.internals.Operator.{BitVector, Formal}

import scala.collection.{breakOut, immutable, mutable}
import scala.collection.mutable.ArrayBuffer
import spinal.core.internals._

import java.util.function.BinaryOperator
import scala.io.Source
import scala.language.postfixOps
import scala.util.matching.Regex


class PhaseContext(val config: SpinalConfig) {
  var globalData = GlobalData.reset(config)
  config.applyToGlobalData(globalData)

  def privateNamespaceName = config.globalPrefix + (if(config.privateNamespace) topLevel.definitionName + "_" else "")

  val duplicationPostfix = ""
  val globalScope         = new NamingScope(duplicationPostfix)
  var topLevel: Component = null
  val enums               = mutable.LinkedHashMap[SpinalEnum,mutable.LinkedHashSet[SpinalEnumEncoding]]()

  val vhdlKeywords = Array(
    "abs", "access", "after", "alias", "all", "and", "architecture", "array", "assert",
    "attribute", "begin", "block", "body", "buffer", "bus", "case", "component",
    "configuration", "constant", "disconnect", "downto", "else", "elsif", "end", "entity", "exit", "file",
    "for", "function", "generate", "generic", "group", "guarded", "if", "impure", "in",
    "inertial", "inout", "is", "label", "library", "linkage", "literal", "loop", "map", "mod",
    "nand", "new", "next", "nor", "not", "null", "of", "on", "open", "or", "others", "out",
    "package", "port", "postponed", "procedure", "process", "pure", "range", "record", "register",
    "reject", "rem", "report", "return", "rol", "ror", "select", "severity", "signal", "shared",
    "sla", "sll", "sra", "srl", "subtype", "then", "to", "transport", "type", "unaffected", "units",
    "until", "use", "variable", "wait", "when", "while", "with", "xnor", "xor"
  )

  val verilogKeywords = Array(
    "always", "end", "ifnone", "or", "rpmos", "tranif1", "and", "endcase", "initial", "output",
    "rtran", "tri", "assign", "endmodule", "inout", "parameter", "rtranif0", "tri0", "begin", "endfunction", "input", "pmos",
    "rtranif1", "tri1", "buf", "endprimitive", "integer", "posedge", "scalared", "triand", "bufif0", "endspecify", "join", "primitive",
    "small", "trior", "bufif1", "endtable", "large", "pull0", "specify", "trireg", "case", "endtask", "macromodule",
    "pull1", "specparam", "vectored", "casex", "event", "medium", "pullup", "strong0", "wait", "casez", "for", "module", "pulldown",
    "strong1", "wand", "cmos", "force", "nand", "rcmos", "supply0", "weak0", "deassign", "forever", "negedge", "real",
    "supply1", "weak1", "default", "for", "nmos", "realtime", "table", "while", "defparam", "function", "nor", "reg", "task", "wire", "disable", "highz0",
    "not", "release", "time", "wor", "edge", "highz1", "notif0", "repeat", "tran", "xnor", "else", "if", "notif1", "rnmos", "tranif0", "xor"
  )

  val systemVerilogKeywords = Array(
    "alias", "always", "always_comb", "always_ff", "always_latch", "and", "assert", "assign", "assume", "automatic", "before", "begin", "bind",
    "bins", "binsof", "bit", "break", "buf", "bufif0", "bufif1", "byte", "case", "casex", "casez", "cell", "chandle", "class",
    "clocking", "cmos", "config", "const", "constraint", "context", "continue", "cover", "covergroup", "coverpoint", "cross",
    "deassign", "default", "defparam", "design", "disable", "dist", "do", "edge", "else", "end", "endcase", "endclass",
    "endclocking", "endconfig", "endfunction", "endgenerate", "endgroup", "endinterface", "endmodule", "endpackage", "endprimitive", "endprogram",
    "endproperty", "endspecify", "endsequence", "endtable", "endtask", "enum", "event", "expect", "export", "extends", "extern", "final",
    "first_match", "for", "force", "foreach", "forever", "fork", "forkjoin", "function", "generate", "genvar", "highz0", "highz1", "if",
    "iff", "ifnone", "ignore_bins", "illegal_bins", "import", "incdir", "include", "initial", "inout", "input", "inside", "instance", "int", "integer", "interface",
    "intersect", "join", "join_any", "join_none", "large", "liblist", "library", "local", "localparam", "logic", "longint",
    "macromodule", "matches", "medium", "modport", "module", "nand", "negedge", "new", "nmos", "nor", "noshowcancelled",
    "not", "notif0", "notif1", "null", "or", "output", "package", "packed", "parameter", "pmos", "posedge", "primitive",
    "priority", "program", "property", "protected", "pull0", "pull1", "pulldown", "pullup", "pulsestyle_onevent", "pulsestyle_ondetect", "pure", "rand", "randc",
    "randcase", "randsequence", "rcmos", "real", "realtime", "ref", "reg", "release", "repeat", "return", "rnmos", "rpmos", "rtran",
    "rtranif0", "rtranif1", "scalared", "sequence", "shortint", "shortreal", "showcancelled", "signed", "small", "solve", "specify", "specparam",
    "static", "string", "strong0", "strong1", "struct", "super", "supply0", "supply1", "table", "tagged", "task", "this", "throughout",
    "time", "timeprecision", "timeunit", "tran", "tranif0", "tranif1", "tri", "tri0", "tri1", "triand", "trior", "trireg", "type", "typedef", "union",
    "unique", "unsigned", "use", "uwire", "var", "vectored", "virtual", "void", "wait", "wait_order", "wand", "weak0", "weak1",
    "while", "wildcard", "wire", "with", "within", "wor", "xnor", "xor"
  )

  val reservedKeyWords    = mutable.Set[String]()
  reservedKeyWords ++= vhdlKeywords
  reservedKeyWords ++= verilogKeywords
  reservedKeyWords ++= systemVerilogKeywords

  reservedKeyWords.foreach(globalScope.allocateName(_))

  def components(): ArrayBuffer[Component] ={
    val ret = ArrayBuffer[Component]()
    ret.clear()

    def walk(c: Component): Unit = {
      ret += c
      c.children.foreach(walk(_))
    }

    walk(topLevel)

    ret
  }

  def sortedComponents = components().sortWith(_.level > _.level)

  def walkAll(func: Any => Unit): Unit = {
    GraphUtils.walkAllComponents(topLevel, c => {
      func(c)
      c.dslBody.walkStatements(s => {
        func(s)
        s.walkExpression(e => {
          func(e)
        })
      })
    })
  }

  def walkStatements(func: Statement => Unit): Unit = {
    GraphUtils.walkAllComponents(topLevel, c => c.dslBody.walkStatements(func))
  }

  def walkExpression(func: Expression => Unit): Unit = {
    GraphUtils.walkAllComponents(topLevel, c => c.dslBody.walkStatements(s => s.walkExpression(func)))
  }

  def walkExpressionPostorder(func: Expression => Unit): Unit = {
    GraphUtils.walkAllComponents(topLevel, c => c.dslBody.walkStatements(s => s.walkExpressionPostorder(func)))
  }

  def walkDeclarations(func: DeclarationStatement => Unit): Unit = {
    walkComponents(c => c.dslBody.walkDeclarations(e => func(e)))
  }

  def walkRemapExpressions(func: Expression => Expression): Unit ={
    GraphUtils.walkAllComponents(topLevel, c => c.dslBody.walkStatements(s => s.walkRemapExpressions(func)))
  }

  def walkDrivingExpression(func: Expression => Unit): Unit ={
    GraphUtils.walkAllComponents(topLevel, c => c.dslBody.walkStatements(s => s.walkDrivingExpressions(func)))
  }

  def walkComponents(func: Component => Unit): Unit ={
    GraphUtils.walkAllComponents(topLevel, c => func(c))
  }

  def walkComponentsExceptBlackbox(func: Component => Unit): Unit ={
    GraphUtils.walkAllComponents(topLevel, c => if(!c.isInstanceOf[BlackBox] || !c.asInstanceOf[BlackBox].isBlackBox) func(c))
  }

  def walkBaseNodes(func: BaseNode => Unit): Unit ={
    walkStatements(s => {
      func(s)
      s.walkExpression(e => {
        func(e)
      })
    })
  }

  def checkGlobalData(): Unit = {
    if (DslScopeStack.get != null) SpinalError("dslScope stack is not empty :(")
    if (ClockDomainStack.get != null) SpinalError("dslClockDomain stack is not empty :(")
  }

  def checkPendingErrors(msg : String) = if(globalData.pendingErrors.nonEmpty)
    SpinalError(msg)

  val verboseLog = if(config.verbose) new java.io.FileWriter("verbose.log") else null

  def doPhase(phase: Phase): Unit ={
    if(config.verbose) verboseLog.write(s"phase: $phase\n")
    phase.impl(this)
    if(config.verbose){
      var checksum = 0
      def seed(that : Int) = checksum = ((checksum << 1) | ((checksum & 0x80000000) >> 31)) ^ that
      walkComponents{c =>seed(c.getInstanceCounter)}
      walkStatements{s =>seed(s.getInstanceCounter)}
      verboseLog.write(s"checksum: $checksum\n")
      verboseLog.flush()

    }
    checkPendingErrors("Error detected in phase " + classNameOf(phase))
  }
}


trait Phase {
  def impl(pc: PhaseContext): Unit
  def hasNetlistImpact: Boolean
}


trait PhaseNetlist extends Phase {
  override def hasNetlistImpact: Boolean = true
}


trait PhaseMisc extends Phase {
  override def hasNetlistImpact: Boolean = false
}


trait PhaseCheck extends Phase {
  override def hasNetlistImpact: Boolean = false
}


//class PhaseZeroMemToReg extends PhaseNetlist{
//  override def impl(pc: PhaseContext): Unit = {
//    import pc._
//    walkDeclarations{
//      case mem : Mem[_] if mem.addressWidth == 0 => {
//        println("SIMPLIFY ME")
//        mem.component.rework{
//          val storage = Reg(Bits(mem.width bits))
//          mem.foreachStatements{
//            case port : MemWrite => {
//              when(port.writeEnable.asInstanceOf[Bool]){
//                storage := port.data.asInstanceOf[Bits]
//              }
//            }
//            case port : MemReadAsync => {
//              po
//            }
//            case _ =>
//          }
//        }
//        mem.removeStatement()
//        mem.foreachStatements(s => s.removeStatement())
//      }
//      case _ =>
//    }
//  }
//}

class PhaseDeviceSpecifics(pc : PhaseContext) extends PhaseNetlist{
  override def impl(pc: PhaseContext): Unit = {
    import pc._

//    walkDeclarations{
//      case mem : Mem[_] =>
//        var hit = false
//        mem.foreachStatements{
//          case port : MemReadAsync => hit = true
//          case _ =>
//        }
//        if(hit) mem.addAttribute("ram_style", "distributed") //Vivado stupid ganbling workaround Synth 8-6430
//      case _ =>
//    }
  }
}

/**
  * Duplicates linear components according to the specified security order
  * @param pc
  */
class PhaseDuplicateLinearComponents(pc: PhaseContext) extends PhaseNetlist {
  
  override def impl(pc: PhaseContext): Unit = {
    import pc._

    SpinalProgress(s"Duplicating linear components, you should crack open a cold one with the boys!")

    val n = pc.config.maskingConfig.numShares
    
    val c = topLevel
    
    val overlaps = mutable.Map[String, Int]()
    
    //At this early stage, some components might be unnamed (e.g. when they are defined in a
    //scala for-loop) (actually, they are named in a way, but the value "name" is not yet set)
    //Therefore, we have to set it ourselves
    //TODO Can we maybe do this with the function allocateName?
    for (sub <- c.children) {
      //Only choose the components that are unnamed
      if (sub.isUnnamed) {
        var name = classNameOf(sub)
        name = Character.toLowerCase(name.charAt(0)) + (if (name.length() > 1) name.substring(1) else "")
        //Check if the name has already been used. If not, it is added together with a 0,
        //otherwise the amount of times the name was used is returned
        val count = overlaps.getOrElseUpdate(name, 0)
        //Set the new name as "oldname_count"
        val alternative = name + "_" + count
        overlaps(name) = count + 1
        //Set the name of the subcomponent
        sub.setName(alternative)
      }
    }

    //Duplicate all linear components n times
    for (sub <- c.children) {
      if (sub.isLinear) {
        for (i <- 0 until n) {
          //Create a new, identical component, set the name, definitionName and parentScope
          val newSub = Class.forName(sub.getClass.getName).getDeclaredConstructor().newInstance().asInstanceOf[Component]
          newSub.setName(s"${sub.getName()}_${i}")
          newSub.definitionName = sub.definitionName
          newSub.definitionNameNoMerge = true
          newSub.parentScope = sub.parentScope
          //Add the new component to a list in the initial component for later, and add it
          //to the children of c
          sub.sharedComponents += newSub
          c.children += newSub
          ScopeProperty.get.remove(DslScopeStack.asInstanceOf[ScopeProperty[Any]])
        }
      }
    }
  }
}

class PhaseReplaceNonLinearComponents(pc: PhaseContext) extends PhaseNetlist {
  override def impl(pc: PhaseContext): Unit = {
    import pc._
  
    SpinalProgress(s"Replacing non-linear components")
    val n = pc.config.maskingConfig.numShares
  	val nonLinearModules = pc.config.maskingConfig.nonLinearModules
		
    val c = topLevel
    
    for (sub <- c.children) {
			if (nonLinearModules.contains(sub.getClass.getName)) {
				val subName = sub.getName()
				val subNameEnd = subName.substring(subName.lastIndexOf("_")+1, subName.length)
				val replacement = nonLinearModules(sub.getClass.getName)
        ClockDomain.push(sub.clockDomain)
				val newClass = Class.forName(replacement.name).getDeclaredConstructor().newInstance()
				if (newClass.isInstanceOf[BlackBox]) {
					val newSub = newClass.asInstanceOf[BlackBox]
					newSub.setName(sub.getName() + s"_Masked")
					val definitionName = if (replacement.name.contains(".")) replacement.name.split("""\.""").last else replacement.name
					newSub.definitionName = definitionName
					newSub.definitionNameNoMerge = true
					newSub.parentScope = sub.parentScope
					newSub.setRandomness(replacement.randomness)
					//newSub.seta
					
					//newSub.ioSet.foreach(io => io.setAsVital())
					
					newSub.getAllIo.foreach(io => {
						//if (io.getName() == "io_r") {
						if (io.isInput) {
							val ph = io.cloneBaseType(s"placeholder_${io.getName()}")
							/*c.dslBody.walkDeclarations(d => {
								ph.parentScope = d.parentScope
							})*/
							val bt = c.dslBody.head.asInstanceOf[BaseType]
							ph.clockDomain = bt.clockDomain
							ph.parent = bt.parent
							ph.parentScope = bt.parentScope
							//c.dslBody.append(ph)
							//c.dslBody.append(ph1)
							//c.dslBody.append(ph.asInstanceOf[DeclarationStatement])
							//ph.parentScope = bt.parentScope
							val ds = DataAssignmentStatement(io, ph)
							c.dslBody.append(ds)
							//c.dslBody.walkDeclarations(s => println(s))
						} /*else {
							c.dslBody.walkStatements(s => s match {
								case d: DataAssignmentStatement => {
									d.target match {
										case bt: BaseType => {
											if (bt.component == sub) {
												if (bt.isInstanceOf[Bool]) {
													if (io.isInstanceOf[Bool] && bt.getName() == io
													 .getName()) {
														val ds = DataAssignmentStatement(io, d.source)
														d.insertNext(ds)
													}
												} else if (bt.isInstanceOf[Bits]) {
													if (io.isInstanceOf[Bits]) {
														val r: Regex = "_(\\d+)".r
														val indices = r.findAllMatchIn(io.getName()).map(_
														 .start).toArray
														val last = if (indices.length != 0) indices.last
														else 0
														if (last != 0 && bt.getName().substring(0, last) == io.getName().substring(0, last)) {
															val ds = DataAssignmentStatement(io, d.source)
															d.insertNext(ds)
														}
													}
												}
											}
										}
										case _ =>
									}
								}
								case _ =>
							})
						}*/
					})
					/*c.dslBody.walkStatements(s => s match {
						case d: DataAssignmentStatement => {
							d.target match {
								case bt: BaseType => {
									if (bt.component == sub) {
										newSub.getAllIo.foreach(io => {
											if (io.getName() == "io_r") {
												val replacement = io.cloneBaseType(s"placeholder_${io.getName()}")
												replacement.parentScope = d.parentScope
												//replacement.setName(s"placeholder_${io.getName()}")
												//replacement.component.parentScope.component = bt.component
												//println(replacement)
												//d.insertNext(replacement.asInstanceOf[BaseType])
												val ds = DataAssignmentStatement(io, replacement)
												println(ds)
												d.insertNext(DataAssignmentStatement(io, replacement))
											}
											if (bt.isInstanceOf[Bool]) {
												if (io.isInstanceOf[Bool] && bt.getName() == io.getName()) {
													val ds = DataAssignmentStatement(io, d.source)
													d.insertNext(ds)
												}
											} else if (bt.isInstanceOf[Bits]) {
												if (io.isInstanceOf[Bits]) {
													val r: Regex = "_(\\d+)".r
													val indices = r.findAllMatchIn(io.getName()).map(_.start).toArray
													val last = if(indices.length != 0) indices.last else 0
													if (last != 0 && bt.getName().substring(0, last) == io.getName().substring(0, last)) {
														val ds = DataAssignmentStatement(io, d.source)
														d.insertNext(ds)
													}
												}
											}
										})
									}
								}
								case _ =>
							}
						}
						case _ =>
					})*/
					
					sub.sharedComponents += newSub
					c.children += newSub
					
					ScopeProperty.get.remove(ClockDomainStack.asInstanceOf[ScopeProperty[Any]])
					ScopeProperty.get.remove(DslScopeStack.asInstanceOf[ScopeProperty[Any]])
				} else {
					println("Component")
					//val newSub = Class.forName(replacement.name).getDeclaredConstructor().newInstance().asInstanceOf[Component]
					val newSub = newClass.asInstanceOf[Component]
					newSub.setName(sub.getName() + s"_Masked")
					val definitionName = if (replacement.name.contains(".")) replacement.name.split("""\.""").last else replacement.name
					newSub.definitionName = definitionName
					newSub.definitionNameNoMerge = true
					newSub.parentScope = sub.parentScope
					newSub.setRandomness(replacement.randomness)
					sub.sharedComponents += newSub
					c.children += newSub
					
					ScopeProperty.get.remove(ClockDomainStack.asInstanceOf[ScopeProperty[Any]])
					ScopeProperty.get.remove(DslScopeStack.asInstanceOf[ScopeProperty[Any]])
				}
      }
    }
  }
	
	def isAllDigits(x: String) = x forall Character.isDigit
}

/**
  * Helper phase to check the status of the design after a certain phase
  * @param pc
  */
class PhaseTest(pc: PhaseContext) extends PhaseNetlist {
  override def impl(pc: PhaseContext): Unit = {
    import pc._
    
    //topLevel.children.foreach(c => c.walkComponents(cs => println(cs)))
		topLevel.dslBody.walkStatements(s => println(s))
		//topLevel.children.foreach((c => c.dslBody.walkStatements(s => println(s))))
  }
}

class PhaseModeOfOperation(pc: PhaseContext) extends PhaseNetlist {
	import pc._
	
	var outFile: java.io.FileWriter = null
	override def impl(pc: PhaseContext): Unit = {
		//import pc._
		
		val mode = pc.config.modeConfig.mode
		val blockSize = pc.config.modeConfig.blockSize
		val keySize = pc.config.modeConfig.keySize
		val direction = pc.config.modeConfig.direction
		val implType = pc.config.modeConfig.implementationType
		
		pc.topLevel.ioSet.foreach {
			io =>
				//if (io.isInstanceOf[Bool] && (implType == Unrolled)) SpinalError("You have specified an unrolled implementation, but the control signals indicate that it is round/pipelined")
		}
		
		println(s"Applying mode of Operation: ${pc.config.modeConfig.mode.toString}")
		
		var targetFilePath = ""
		
		targetFilePath = pc.config.targetDirectory + "/" + (if (pc.config.netlistFileName == null) (topLevel.definitionName + ".scala") else pc.config.netlistFileName)
		
		outFile = new FileWriter(targetFilePath)
		val ret = new StringBuilder
		
		ret ++= (s"package Tests\n\n")
		ret ++= (s"import spinal.core._\n\n")
		
		ret ++= (s"class skjdvfbks extends Component {\n")
		ret ++= (s"\tval io = new Bundle {\n")
		
		ret ++= (s"\t\tval clk = in Bool()\n")
		ret ++= s"\t\tval reset = in Bool()\n"
		ret ++= s"\t\tval blockReady = in Bool()\n"
		if (direction == Enc) {
			ret ++= s"\t\tval pt = in Bits(${blockSize} bits)\n"
			ret ++= s"\t\tval ct = out Bits(${blockSize} bits)\n"
		} else {
			ret ++= s"\t\tval pt = out Bits(${blockSize} bits)\n"
			ret ++= s"\t\tval ct = in Bits(${blockSize} bits)\n"
		}
		ret ++= s"\t\tval finalBlock = in Bool()\n"
		ret ++= s"\t\tval key = in Bits(${keySize} bits)\n"
		if ((mode == CBC) || (mode == CFB))
			ret ++= s"\t\tval iv = in Bits(${blockSize} bits)\n"
		ret ++= s"\t\tval blockDone = out Bool()\n"
		ret ++= s"\t\tval done = out Bool()\n"
		ret ++= (s"\t}\n")
		
		if (mode == ECB) {
			ret ++= s"\tval CA = new ClockingArea(ClockDomain(clock = io.clk, reset " +
			 s"= io.reset)) {\n"
			
			ret ++= s"\t\tval bc = new ${pc.topLevel.definitionName}\n"
			ret ++= s"\t\tbc.io.clk := io.clk\n"
			ret ++= s"\t\tio.blockDone := False\n"
			ret ++= s"\t\tio.done := False\n"
			
			if (implType == Round) {
				ret ++= s"\t\tval reset = Reg(Bool()) init(True)\n"
				ret ++= s"\t\tbc.io.reset := reset\n"
				ret ++= s"\t\twhen (io.reset) {\n"
				ret ++= s"\t\t\treset := True\n"
				ret ++= s"\t\t} elsewhen (io.blockReady) {\n"
				ret ++= s"\t\t\treset := False\n"
				ret ++= s"\t\t}\n"
			}
			
			if (implType == Pipelined) {
				ret ++= s"\t\tbc.io.inputValid := io.blockReady\n"
			}
			
			if (direction == Enc) {
				ret ++= s"\t\tbc.io.pt := io.pt\n"
				ret ++= s"\t\tio.ct := bc.io.ct\n"
			}
			else {
				ret ++= s"\t\tbc.io.pt := io.ct\n"
				ret ++= s"\t\tio.pt := bc.io.ct\n"
			}
			
			ret ++= s"\t\tbc.io.key := io.key\n"
			
			if (implType == Round) {
				ret ++= s"\t\twhen (bc.io.done) {\n"
				ret ++= s"\t\t\tio.blockDone := True\n"
				ret ++= s"\t\t\tbc.io.reset := True\n"
				ret ++= s"\t\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\t\tio.done := True\n"
				ret ++= s"\t\t\t}\n"
				ret ++= s"\t\t}\n"
			}
			
			if (implType == Pipelined) {
				ret ++= s"\t\twhen (bc.io.dataValid) {\n"
				ret ++= s"\t\t\tio.blockDone := True\n"
				ret ++= s"\t\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\t\tio.done := True\n"
				ret ++= s"\t\t\t}\n"
				ret ++= s"\t\t}\n"
			}
			
			if (implType == Unrolled) {
				ret ++= s"\t\tio.blockDone := io.blockReady\n"
				ret ++= s"\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\tio.done := True\n"
				ret ++= s"\t\t}\n"
			}
			
			ret ++= s"\t}\n"
		} else if (mode == CBC) {
			ret ++= s"\tval CA = new ClockingArea(ClockDomain(clock = io.clk, reset " +
			 s"= io.reset)) {\n"
			ret ++= s"\t\tval bc = new ${pc.topLevel.definitionName}\n"
			if (implType == Round) {
				ret ++= s"\t\tval reset = Reg(Bool()) init(True)\n"
			}
			ret ++= s"\t\tval iv = Reg(Bits(${blockSize} bits)) init(io.iv)\n"
			ret ++= s"\t\tbc.io.clk := io.clk\n"
			if (direction == Enc) {
				ret ++= s"\t\tbc.io.pt := io.pt ^ iv\n"
				ret ++= s"\t\tiv := bc.io.ct\n"
				ret ++= s"\t\tio.ct := bc.io.ct\n"
			} else {
				ret ++= s"\t\tbc.io.pt := io.ct\n"
				ret ++= s"\t\tio.pt := bc.io.ct ^ iv\n"
				if (implType == Round) {
					ret ++= s"\t\twhen (bc.io.done) {\n"
					ret ++= s"\t\t\tiv := io.ct\n"
					ret ++= s"\t\t}\n"
				} else if (implType == Unrolled) {
					ret ++= s"\t\tiv := io.ct\n"
				} else if (implType == Pipelined) {
					ret ++= s"\t\tiv := io.ct\n"
				}
			}
			ret ++= s"\t\tbc.io.key := io.key\n"
			ret ++= s"\t\tio.blockDone := False\n"
			ret ++= s"\t\tio.done := False\n"
			
			if (implType == Round) {
				ret ++= s"\t\tbc.io.reset := reset\n"
				ret ++= s"\t\twhen (io.reset) {\n"
				ret ++= s"\t\t\treset := True\n"
				ret ++= s"\t\t\tiv := io.iv\n"
				ret ++= s"\t\t} elsewhen (io.blockReady) {\n"
				ret ++= s"\t\t\treset := False\n"
				ret ++= s"\t\t}\n"
				ret ++= s"\t\twhen (bc.io.done) {\n"
				ret ++= s"\t\t\tio.blockDone := True\n"
				ret ++= s"\t\t\tbc.io.reset := True\n"
				ret ++= s"\t\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\t\tio.done := True\n"
				ret ++= s"\t\t\t}\n"
				ret ++= s"\t\t}\n"
			} else if (implType == Unrolled) {
				ret ++= s"\t\twhen (io.reset) {\n"
				ret ++= s"\t\t\tiv := io.iv\n"
				ret ++= s"\t\t}\n"
				ret ++= s"\t\tio.blockDone := io.blockReady\n"
				ret ++= s"\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\tio.done := True\n"
				ret ++= s"\t\t}\n"
			} else {
				ret ++= s"\t\tbc.io.inputValid := io.blockReady\n"
				ret ++= s"\t\twhen (io.reset) {\n"
				ret ++= s"\t\t\tiv := io.iv\n"
				ret ++= s"\t\t}\n"
				ret ++= s"\t\twhen (bc.io.dataValid) {\n"
				ret ++= s"\t\t\tio.blockDone := True\n"
				ret ++= s"\t\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\t\tio.done := True"
				ret ++= s"\t\t\t}\n"
				ret ++= s"\t\t}\n"
			}
			ret ++= s"\t}\n"
		} else if (mode == CFB) {
			ret ++= s"\tval CA = new ClockingArea(ClockDomain(clock = io.clk, reset " +
			 s"= io.reset)) {\n"
			ret ++= s"\t\tval bc = new ${pc.topLevel.definitionName}\n"
			if (implType == Round) {
				ret ++= s"\t\tval reset = Reg(Bool()) init(True)\n"
				ret ++= s"\t\tval iv = Reg(Bits(${blockSize} bits)) init(io.iv)\n"
				if (direction == Enc) ret ++= s"\t\tval ptReg = Reg(Bits(${blockSize} bits)) init(io.pt)\n"
				else ret ++= s"\t\tval ctReg = Reg(Bits(${blockSize} bits)) init(io.ct)\n"
				ret ++= s"\t\tbc.io.clk := io.clk\n"
				
				ret ++= s"\t\tbc.io.pt := iv\n"
				ret ++= s"\t\tbc.io.key := io.key\n"
				ret ++= s"\t\tio.blockDone := False\n"
				ret ++= s"\t\tio.done := False\n"
				
				if (direction == Enc) {
					ret ++= s"\t\tio.ct := bc.io.ct ^ ptReg\n"
					ret ++= s"\t\twhen (bc.io.done) {\n"
					ret ++= s"\t\t\tiv := ptReg\n"
					ret ++= s"\t\t}\n"
				} else {
					ret ++= s"\t\tio.pt := bc.io.ct ^ ctReg\n"
					ret ++= s"\t\twhen (bc.io.done) {\n"
					ret ++= s"\t\t\tiv := ctReg\n"
					ret ++= s"\t\t}\n"
				}
				
				ret ++= s"\t\tbc.io.reset := reset\n"
				ret ++= s"\t\twhen (io.reset) {\n"
				ret ++= s"\t\t\treset := True\n"
				ret ++= s"\t\t\tiv := io.iv\n"
				ret ++= s"\t\t} elsewhen (io.blockReady) {\n"
				ret ++= s"\t\t\treset := False\n"
				if (direction == Enc) ret ++= s"\t\t\tptReg := io.pt\n"
				else ret ++= s"\t\t\tctReg := io.ct\n"
				ret ++= s"\t\t}\n"
				ret ++= s"\t\twhen (bc.io.done) {\n"
				ret ++= s"\t\t\tio.blockDone := True\n"
				ret ++= s"\t\t\tbc.io.reset := True\n"
				ret ++= s"\t\t\twhen (io.finalBlock) {\n"
				ret ++= s"\t\t\t\tio.done := True\n"
				ret ++= s"\t\t\t}\n"
				ret ++= s"\t\t}\n"
			}
			ret ++= s"\t}\n"
		}
		
		ret ++= (s"}\n")
		
		outFile.write(ret.toString())
		
		outFile.flush()
		outFile.close()
	}
}

/**
  * Applies a masking scheme to the insecure implementation
  * @param pc
  */
class PhaseApplyMasking(pc: PhaseContext) extends PhaseNetlist {
  
  val shares = ArrayBuffer[(BaseType, ArrayBuffer[BaseType])]()
  
  override def impl(pc: PhaseContext): Unit = {
    import pc._
    SpinalProgress(s"Beginning Masking, do you want a coffee?")
    
    val c = topLevel
    val n = pc.config.maskingConfig.numShares
		val nonLinearModules = pc.config.maskingConfig.nonLinearModules
    //val n = 1
	
		SpinalProgress (s"Determining the sharing of internal signals and registers, how about a Currywurst Pommes Mayo?")
	
		//Function that determines if an expression contains a shared operand, which means that its result needs to be shared as well
		def hasSharedExpression (e: Expression): Boolean = {
			e match {
				case b: BaseType => {
					//If b is in a different component, it is "shared" if the component is linear
					if (b.component != topLevel) {//TODO b.component.isNonLinear is not always the right thing, find a way to decide if the output of a nonlinear component is shared
						b.component.isLinear || b.component.isNonLinear
					//Otherwise, b is shared if it has the according tag
					} else {
						b.hasTag(implementDataAsShared)
					}
				}
				case e: Operator => {
					//If e is an operator, we walk through all parts of that operator and collect the sharing of the parts
					val sharedExpressions = ArrayBuffer[Boolean]()
					var shared = false
					e.walkExpression{es => sharedExpressions += hasSharedExpression(es)}
					//Go through the collected sharings, if one is true, then the result needs to be shared as well
					sharedExpressions.foreach(e => {
						if (e) (shared = true)
					})
					shared
				}
				case b: Literal => {
					//Literals can most likely be ignored
					false
				}
				case b: BitVectorRangedAccessFixed => {
					//When accessing a BitVector, we can return the sharing of its source
					hasSharedExpression(b.source)
					//false
				}
				case _ => false
			}
		}
		
		var changeHappened = true
		
		//Perform this loop while something changes, i.e. a new signal gets the implementDataAsShared tag
		while (changeHappened) {
			changeHappened = false
			//Go through all statements, only DataAssignments are relevant
			c.dslBody.walkStatements {
				case d: DataAssignmentStatement => {
					//Determine if the right side contains a shared operand
					val expressionNeedsShare = hasSharedExpression(d.source)
					//If yes, target has to be shared
					if (expressionNeedsShare) {
						d.target match {
							case b: BaseType => {
								//If the target does not have the tag yet and it is not in a different component (i.e. sub-component), assign it with the tag and mark
								//that a change happened
								if (!d.target.asInstanceOf[BaseType].hasTag(implementDataAsShared) && d.target.asInstanceOf[BaseType].component == topLevel) {
									d.target.asInstanceOf[BaseType].addTag(implementDataAsShared)
									changeHappened = true
								}
							}
							case r: RangedAssignmentFixed => {
								//Similar
								if (!r.out.asInstanceOf[BaseType].hasTag(implementDataAsShared) && r.out.asInstanceOf[BaseType].component == topLevel) {
									r.out.asInstanceOf[BaseType].addTag(implementDataAsShared)
									changeHappened = true
								}
							}
							case b: BitAssignmentFixed => {
								//Similar
								if (!b.out.asInstanceOf[BaseType].hasTag(implementDataAsShared) && b.out.asInstanceOf[BaseType].component == topLevel) {
									b.out.asInstanceOf[BaseType].addTag(implementDataAsShared)
									changeHappened = true
								}
							}
							case _ => println("Other case", d.target.getClass.getName)
						}
					}
				}
				case s: Statement =>
			}
		}
    
   SpinalProgress(s"Sharing inputs and internal signals, sit back and take a hot chocolate :-)")
    
    //Share inputs/outputs and inner signals with the tag "share"
    var declarationID = 0
    c.dslBody.walkDeclarations {
      case d: DeclarationStatement => {
        val bt = d.asInstanceOf[BaseType]
        //var shares = ArrayBuffer[BaseType]()
        if (bt.hasTag(implementDataAsShared)) {
          shares += ((bt, ArrayBuffer[BaseType]()))
          d.decID = declarationID
          declarationID += 1
          //Add n new signals with the same data type and bit width as the unshared
          //signal into an array "shares"
          for (i <- 0 until n) {
            //Clone the original Declaration n times,
            //Name the new shares "oldname_i"
            //If original signal is input/output, add direction to all the shares
            //and add them to the ioSet of the current component
            shares(d.decID)._2 += bt.cloneAndRename(i)
            //x(d.decID)._2 += shares(i)
            if (!bt.isDirectionLess) {
              c.ioSet.add(shares(d.decID)._2(i))
            }
          }
          var i = n-1
          //Insert the new shares into the internal representation
          while (i >= 0) {
            d.insertNext(shares(d.decID)._2(i))
            i -= 1
          }
          //Remove the old declaration of the unshared signal
          //d.removeStatement()
        }
      }
    }
    
    SpinalProgress(s"Duplicating connections to sub-components, a wine would be great now, wouldn't it?")
    
    val linearChildren = ArrayBuffer[Component]()
    c.children.foreach(s => if (s.isLinear) linearChildren += s)
  
    val nonLinearChildren = ArrayBuffer[Component]()
    c.children.foreach(s => if (s.isNonLinear) nonLinearChildren += s)
    
    val replacements = ArrayBuffer[Component]()
    nonLinearChildren.foreach(s => s.sharedComponents.foreach(a => replacements += a))
    
    //Add the randomness signal to the toplevel
    var totalRandomness: Int = 0
    replacements.foreach(s => totalRandomness += s.randomness)
    val r = if (totalRandomness > 0) Bits(totalRandomness bits).setName("io_r") else null
    
    if (r != null) {
      val bt = c.dslBody.head.asInstanceOf[BaseType]
      //val m = Bits(totalRandomness bits).setName("m")
      r.clockDomain = bt.clockDomain
      r.parent = bt.parent
      r.parentScope = bt.parentScope
      r.dir = in
      c.ioSet += r
      c.dslBody.append(r)
    }
    
    
    //Add the ioSet of all linear components and their shared counterparts to the array shares
    for (sub <- linearChildren) {
      if (sub.isLinear) {
        for (io <- sub.ioSet) {
          io.decID = declarationID
          declarationID += 1
          shares += ((io, ArrayBuffer[BaseType]()))
          for (s <- sub.sharedComponents) {
            for (sIo <- s.ioSet) {
              if (sIo.getName() == io.getName()) {
                shares(io.decID)._2 += sIo
              }
            }
          }
        }
      }
    }
		
		//Connect clk and reset signal to non-linear replacements
		for (sub <- nonLinearChildren) {
			for (sIO <- sub.sharedComponents(0).ioSet) {
				//If the non-linear replacement has an "io_clk" or "io_reset" signal, connect to the corresponding signal of the toplevel
				if (sIO.isInstanceOf[Bool] && ((sIO.getName() == "io_clk") || (sIO.getName() == "io_reset"))) {
					c.ioSet.foreach(io => {
						if (io.getName() == sIO.getName()) {
							c.dslBody.append(DataAssignmentStatement(sIO, io))
						}
					})
				}
			}
		}
		//println(c.dslBody.last)
  
		//Connect the inputs to the non-linear components (i.e., if unmasked sbox has input a and output b, connect
		//a_0, a_1,... to the inputs of the masked sbox replacement and the outputs of the masked variant to b_0, b_1,...
    for (sub <- nonLinearChildren) {
      if (sub.isNonLinear) {
				//Go through all io of the unmasked sbox
        for (io <- sub.ioSet) {
          if (!io.isInstanceOf[Bool]) {
						//Walk all Statements in the main module
						c.dslBody.walkStatements(s => s match {
							//Only DataAssignmentStatement are important as they could be input/output of the sbox
							case d: DataAssignmentStatement => {
								//println(d)
								//Input to the sbox
								if (d.target == io) {
									//Go through the io of the masked replacement
									sub.sharedComponents(0).ioSet.foreach(repIO => {
										//If names match (this is only for unshared inputs), insert a new Statement that targets the
										//replacement
										if (repIO.getName() == io.getName()) {
											val s = DataAssignmentStatement(repIO, d.source)
											//println(s)
											d.insertNext(s)
										}
									})
								}
								//Same procedure for unshared output of the sbox
								if (d.source == io) {
									//println("Source ", d)
									sub.sharedComponents(0).ioSet.foreach(repIO => {
										if (repIO.getName() == io.getName()) {
											val s = DataAssignmentStatement(d.target, repIO)
											//println(s)
											d.insertNext(s)
										}
									})
								}
							}
							case _ =>
						})
						//Now for shared inputs, we have to match something like io_a with io_a_0, io_a_1, ...
            io.decID = declarationID
            declarationID += 1
            shares += ((io, ArrayBuffer[BaseType]()))
            for (sIo <- sub.sharedComponents(0).ioSet) {
							//println(sIo)
							//Remove the io_ from signal names
							val ioName = removeIO(io.getName())
							val sIoName = removeIO(sIo.getName())
							var namesMatch = false
							//Find the last _ in sIo and remove everything after it (i.e. remove _0, _1... from shares)
							if (sIoName.contains("_")) {
								val underScoreIndex = sIoName.lastIndexOf("_")
								val sIoNameWithoutEnd = sIoName.substring(0, underScoreIndex)
								//println(sIoName.substring(0, underScoreIndex))
								//If the names are now equal, we have a match
								if (ioName == sIoNameWithoutEnd) namesMatch = true
							}
							//If type, width, direction, and name match, add the shares (a_0, a_1) to the list of shares of a, connections are done later
              if ((io.getClass == sIo.getClass) && (io.getBitsWidth == sIo.getBitsWidth) && (io.dir == sIo.dir) && namesMatch) {
								shares(io.decID)._2 += sIo
              }
            }
          }
          else if (io.isInstanceOf[Bool]) {
            io.decID = declarationID
            declarationID += 1
            shares += ((io, ArrayBuffer[BaseType]()))
            for (sIo <- sub.sharedComponents(0).ioSet) {
              if ((sIo.isInstanceOf[Bool]) && (sIo.getName() == io.getName())) {
                shares(io.decID)._2 += sIo
              }
            }
          }
        }
      }
    }
		
		
		def removeIO (name : String): String = {
			if (name.startsWith("io_")) {
				return name.substring(3)
			}
			else return name
		}
		
		//println(shares)

    //c.dslBody.walkStatements(s => println(s))
		//c.dslBody.walkDeclarations(d => println(d))
    
    //Duplicate all statements that have a target or source in one of the linear subcomponents
    c.dslBody.walkStatements {
      //Only DataAssignment statements are important here
      case d: DataAssignmentStatement => {
        var isStatementWithSub = false
        var statementToRemove = false
        
				//TODO This seems wrong
        d.walkExpression {
          case b: BaseType => {
            if (replacements.contains(b.component)) {
							statementToRemove = true
						}
          }
          case _ =>
        }
        
        //If one signal of the current statement is in a subcomponent, temporarily add the
        //implementDataAsShared tag (will be removed later again), mark the statement
        d.walkExpression {
          case b: BaseType => {
            if ((linearChildren.contains(b.component)) || (nonLinearChildren.contains(b.component))) {
              isStatementWithSub = true
              b.addTag(implementDataAsShared)
            }
          }
          case _ =>
        }
        
        //If statement is marked, share it
        if (isStatementWithSub) {
          //println(d)
          for (i <- 0 until n) {
            val source = matchSource(d.source, i)
            val target = matchTarget(d.target, i)
            //println(d, target, source)
            if ((target != null) && (source != null)) {
              val s = DataAssignmentStatement(target, source)
							//println(s)
              //println(s, s.parentScope, s.finalTarget, s.finalTarget.component.parentScope, s.finalTarget.rootScopeStatement)
              //Insert the new statement
              d.insertNext(s)
            }
            //If we have inserted the n-th shared statement, we can remove the previously added
            //tags and delete the initial statement as it is not needed anymore
            if (i == n-1) {
              d.walkExpression {
                case b: BaseType => {
                  if (linearChildren.contains(b.component)) b.removeTag(implementDataAsShared)
                  if (nonLinearChildren.contains(b.component)) b.removeTag(implementDataAsShared)
                }
                case _ =>
              }
              d.removeStatementFromScope()
            }
          }
        }
        
				//TODO Check with above TODO
        //if (statementToRemove) d.removeStatementFromScope()
      }
      case s: Statement =>
    }

    //Remove the initial linear subcomponents
    for (c <- linearChildren) {
      if (c.isLinear) c.parent.children -= c
    }
    
    SpinalProgress(s"Connecting randomness")
    
    var usedRandomness: Int = 0
    for (sub <- nonLinearChildren) {
      for (s <- sub.sharedComponents) {
				val replacement = nonLinearModules(sub.getClass.getName)
        for (io <- s.ioSet) {
          val ioName = io.getName()
          val nameWithoutIO = ioName.slice(3, ioName.length)
          if ((ioName == sub.randomnessName) || nameWithoutIO == sub.randomnessName) {
            val source = new BitsRangedAccessFixed
            source.source = r
            source.lo = usedRandomness
            source.hi = usedRandomness + sub.randomness - 1
            usedRandomness += sub.randomness
            val assignment = DataAssignmentStatement(io, source)
            c.dslBody.append(assignment)
          }
					if (io.getName() == replacement.randomnessName) {
						val source = new BitsRangedAccessFixed
						source.source = r
						source.lo = usedRandomness
						source.hi = usedRandomness + replacement.randomness - 1
						usedRandomness += replacement.randomness
						val assignment = DataAssignmentStatement(io, source)
						c.dslBody.append(assignment)
						c.dslBody.walkStatements(s => s match {
							case d: DataAssignmentStatement => {
								d.target match {
									case bt: BaseType => {
										if (bt == io && d.source.isInstanceOf[BaseType]) {
											if (d.source.asInstanceOf[BaseType].getName().contains("placeholder")) {
												d.removeStatementFromScope()
											}
										}
									}
									case _ =>
								}
							}
							case _ =>
						})
					}
        }
      }
    }
		
		//Remove all placeholders (signals with "placeholder" in their name)
		SpinalProgress(s"Removing placeholder signals")
		
		c.dslBody.walkStatements(s => s match {
			//Only DataAssignments are relevant
			case d: DataAssignmentStatement => {
				val dTarget = d.target
				val dSource = d.source
				dTarget match {
					case bt: BaseType => {
						//Placeholders were only set for non-linear subcomponents
						if ((bt.component != c) && (replacements.contains(bt.component))) {
							dSource match {
								case b: BaseType => {
									//Remove statement only if source contains the string "placeholder"
									if (b.getName().contains("placeholder")) {
										d.removeStatementFromScope()
									}
								}
								case _ =>
							}
						}
					}
					case _ =>
				}
			}
			case _ =>
		})
    
    
    /*c.dslBody.walkStatements {
      case d: DataAssignmentStatement => {
        var isStatementWithSub = false
        
        d.walkExpression {
          case b: BaseType => {
            if (nonLinearChildren.contains(b.component)) {
              isStatementWithSub = true
              b.addTag(implementDataAsShared)
            }
          }
          case _ =>
        }
        
        if (isStatementWithSub) {
          for (i <- 0 until n) {
            val target = matchTarget(d.target, i)
            val source = matchSource(d.source, i)
            if ((target != null) && (source != null)) {
              val s = DataAssignmentStatement(target, source)
              d.insertNext(s)
            }
            if (i == n-1) {
              d.walkExpression {
                case b: BaseType => {
                  if (nonLinearChildren.contains(b.component)) b.removeTag(implementDataAsShared)
                }
                case _ =>
              }
              d.removeStatementFromScope()
            }
          }
        }
      }
      case _ =>
    }*/
    
    //nonLinearChildren.foreach(s => c.children -= s)
    
    SpinalProgress("Duplicating internal logic, how about a cup of tea?")
    
    //c.dslBody.walkStatements(s => println(s))

    //Duplicate single-line assignments
    c.dslBody.walkStatements {
      case d: DataAssignmentStatement => {
        //Array for the n new, shared statements
        val statements = ArrayBuffer[DataAssignmentStatement]()
        val dTarget = d.target match {
          case b: BaseType => b
          case b: BitAssignmentFixed => b.out.asInstanceOf[BaseType]
          case b: RangedAssignmentFixed => b.out.asInstanceOf[BaseType]
        }
        //If the target is shared, duplicate d n times with the corresponding signals
        if (dTarget.hasTag(implementDataAsShared)) {
          for (i <- 0 until n) {
            //New target and new source
            val target = matchTarget(d.target, i)
            val source = matchSource(d.source, i)
            //Add a new AssignmentStatement if the right side of the assignment is not null
            if (source != null) statements += DataAssignmentStatement(target, source)
            //Else, assign the correct amount and type of zeroes
            else {
              //Get the width of the left side to determine the amount of zeroes needed
              val width = d.target match {
                case b: BaseType => b.getBitsWidth
                case b: BitAssignmentFixed => 1
                case b: RangedAssignmentFixed => b.hi - b.lo + 1
              }
              //Create a new signal with the correct type (of the left side of the assignment)
              //and the correct amount of zeroes, add a new statement
              val zero = dTarget match {
                case b: Bits => BitsLiteral(0, null, width)
                case b: Bool => new BoolLiteral(false)
                case u: UInt => UIntLiteral(0, null, width)
                case s: SInt => SIntLiteral(0, null, width)
              }
              //val zero = UIntLiteral(0, null, width)
              statements += DataAssignmentStatement(target, zero)
            }
            
          }
          var i = n-1
          //Insert the new statements in the right order
          while (i >= 0) {
            d.insertNext(statements(i))
            i -= 1
          }
        }
      }
      case s: Statement =>
    }
    
    //Remove now unneeded definitions and assignments
    c.dslBody.walkStatements {
      case d: DeclarationStatement => {
        if (d.asInstanceOf[BaseType].hasTag(implementDataAsShared)) {
          c.ioSet -= d.asInstanceOf[BaseType]
          d.removeStatementFromScope()
        }
      }
      case d: DataAssignmentStatement => {
        var statementToRemove = false
        d.walkExpression {
          case b: BaseType => {
            if (b.hasTag(implementDataAsShared)) statementToRemove = true
          }
          case _ =>
        }
        if (statementToRemove) d.removeStatementFromScope()
      }
      case _ =>
    }
		
		//Remove unneeded non-linear components
		nonLinearChildren.foreach(child => c.children -= child)
		
    //c.dslBody.walkStatements(s => println(s))
    /*println(shares)
    c.dslBody.walkStatements(s => println(s))*/
  }
  
  //Duplication of a simple assignment a := e, assuming a is shared. e may or
  //or may not be shared
  def duplicateAssignment (e: BaseType, i: Int): Expression = {
    //If e is not shared, we assign a0 with e and a1... with 0
    if (!e.hasTag(implementDataAsShared)) {
      //if (e.component != )
      if (i > 0) return null
      else return e
    }
    if (shares(e.decID)._2.size <= i) {
      return null
    }
    //If e is also shared, simply return the i-th shared value
    shares(e.decID)._2(i)
  }
  
  def duplicateBitVectorBitAccessFixed(e: BitVectorBitAccessFixed, i: Int): Expression = {
    val s = new BitsBitAccessFixed
    val source = duplicateAssignment(e.source.asInstanceOf[BaseType], i)
    if (source == null) return null
    s.source = source.asInstanceOf[Expression with WidthProvider]
    s.bitId = e.bitId
    s
  }
  
  def duplicateBitsVectorRangedAccessFixed (e: BitVectorRangedAccessFixed, i: Int): Expression = {
    val s = new BitsRangedAccessFixed
    val source = duplicateAssignment(e.source.asInstanceOf[BaseType], i)
    if (source == null) return null
    s.source = source.asInstanceOf[Expression with WidthProvider]
    s.hi = e.hi
    s.lo = e.lo
    s
  }
  
  def duplicateResize (s: Resize, e: Resize, i: Int): Expression = {
    s.input = matchSource(e.input, i).asInstanceOf[Expression with WidthProvider]
    if (s.input == null) return null
    s.size = e.size
    s
  }
  
  def duplicateBitAssignmentFixed(e: BitAssignmentFixed, i: Int): Expression = {
    val s = new BitAssignmentFixed
    s.out = shares(e.out.asInstanceOf[BaseType].decID)._2(i).asInstanceOf[BitVector]
    s.bitId = e.bitId
    s
  }
  
  def duplicateRangedAssignmentFixed (e: RangedAssignmentFixed, i: Int): Expression = {
    val s = new RangedAssignmentFixed
    s.out = shares(e.out.asInstanceOf[BaseType].decID)._2(i).asInstanceOf[BitVector]
    s.hi = e.hi
    s.lo = e.lo
    s
  }
  
  def duplicateUnaryOperator (s: UnaryOperatorWidthableInputs, e: UnaryOperatorWidthableInputs, i: Int): Expression = {
    s.source = matchSource(e.source, i).asInstanceOf[s.T]
    if (s.source == null) return null
    s.inferredWidth = e.inferredWidth
    s
  }
  
  def duplicateBoolNot (s: Operator.Bool.Not, e: Operator.Bool.Not, i: Int): Expression = {
    s.source = matchSource(e.source, i).asInstanceOf[s.T]
    if (s.source == null) return null
    s
  }
  
  //Duplication of the assignment with a binary operator, e.g. Xor, And
  def duplicateBinaryOperator (e: BinaryOperator, i: Int): Expression = {
    //Get the left and the right side of the assignment, either a shared value or null
    val s = Class.forName(e.getClass.getName).getDeclaredConstructor().newInstance().asInstanceOf[BinaryOperator]
    s.left = matchSource(e.left, i).asInstanceOf[s.T]
    s.right = matchSource(e.right, i).asInstanceOf[s.T]
    //If one of the sides is null, only return the other side, if both are null, return null
    if (s.right == null && s.left == null) return null
    else if (s.right == null) return s.left
    else if (s.left == null) return s.right
    s
  }
  
  def duplicateConstantOperatorWidthableInputs (s: ConstantOperatorWidthableInputs, e: ConstantOperatorWidthableInputs, i: Int): Expression = {
    s.source = matchSource(e.source, i).asInstanceOf[s.T]
    if (s.source == null) return null
    s
  }
  
  def duplicateCast (s: CastBitVectorToBitVector, e: CastBitVectorToBitVector, i: Int): Expression = {
    s.input = matchSource(e.input, i).asInstanceOf[s.T]
    if (s.input == null) return null
    s.inferredWidth = e.inferredWidth
    s
  }
  
  def inferWidth (a: Widthable, b: Widthable): Unit = {
    a.inferredWidth = b.inferredWidth
  }
	
	//Duplicating the assignment with a literal, e.g. val a = 1
	def duplicateLiteral (s: BitsLiteral, e: BitsLiteral, i: Int): Expression = {
		val a = e.clone()
		//The first share gets the true value, the others are 0. This ensures that the XOR of the shares
		//results in the original literal
		if (i == 0) a.value = e.value
		else a.value = 0
		a
	}
  
  def matchSource (e: Expression, i: Int): Expression = {
    val s = e match {
      case b: Bits => duplicateAssignment(b, i)
      case b: BinaryOperator => duplicateBinaryOperator(b, i)
      case b: Operator.Bits.Not => val a = new Operator.Bits.Not; duplicateUnaryOperator(a, b, i)
      case b: Operator.Bits.ShiftLeftByInt => val a = new Operator.Bits.ShiftLeftByInt(b.shift); inferWidth(a, b); duplicateConstantOperatorWidthableInputs(a, b, i)
      case b: Operator.Bits.ShiftRightByInt => val a = new Operator.Bits.ShiftRightByInt(b.shift); inferWidth(a, b); duplicateConstantOperatorWidthableInputs(a, b, i)
      case b: Operator.Bits.ShiftLeftByIntFixedWidth => val a = new Operator.Bits.ShiftLeftByIntFixedWidth(b.shift); inferWidth(a, b); duplicateConstantOperatorWidthableInputs(a, b, i)
      case b: Operator.Bits.ShiftRightByIntFixedWidth => val a = new Operator.Bits.ShiftRightByIntFixedWidth(b.shift); inferWidth(a, b); duplicateConstantOperatorWidthableInputs(a, b, i)
      case b: ResizeBits => val a = new ResizeBits; duplicateResize(a, b, i)
      case b: BitVectorBitAccessFixed => duplicateBitVectorBitAccessFixed(b, i)
      case b: BitVectorRangedAccessFixed => duplicateBitsVectorRangedAccessFixed(b, i)
      
      case u: UInt => duplicateAssignment(u, i)
      case u: Operator.UInt.Not => val a = new Operator.UInt.Not; duplicateUnaryOperator(a, u, i)
      case u: Operator.UInt.ShiftLeftByInt => val a = new Operator.UInt.ShiftLeftByInt(u.shift); inferWidth(a, u); duplicateConstantOperatorWidthableInputs(a, u, i)
      case u: Operator.UInt.ShiftRightByInt => val a = new Operator.UInt.ShiftRightByInt(u.shift); inferWidth(a, u); duplicateConstantOperatorWidthableInputs(a, u, i)
      case u: Operator.UInt.ShiftLeftByIntFixedWidth => val a = new Operator.UInt.ShiftLeftByIntFixedWidth(u.shift); inferWidth(a, u); duplicateConstantOperatorWidthableInputs(a, u, i)
      case u: Operator.UInt.ShiftRightByIntFixedWidth => val a = new Operator.UInt.ShiftRightByIntFixedWidth(u.shift); inferWidth(a, u); duplicateConstantOperatorWidthableInputs(a, u, i)
      case u: ResizeUInt => val a = new ResizeUInt; duplicateResize(a, u, i)
      
      case s: SInt => duplicateAssignment(s, i)
      case s: Operator.SInt.Not => val a = new Operator.SInt.Not; duplicateUnaryOperator(a, s, i)
      case s: Operator.SInt.ShiftLeftByInt => val a = new Operator.SInt.ShiftLeftByInt(s.shift); inferWidth(a, s); duplicateConstantOperatorWidthableInputs(a, s, i)
      case s: Operator.SInt.ShiftRightByInt => val a = new Operator.SInt.ShiftRightByInt(s.shift); inferWidth(a, s); duplicateConstantOperatorWidthableInputs(a, s, i)
      case s: Operator.SInt.ShiftLeftByIntFixedWidth => val a = new Operator.SInt.ShiftLeftByIntFixedWidth(s.shift); inferWidth(a, s); duplicateConstantOperatorWidthableInputs(a, s, i)
      case s: Operator.SInt.ShiftRightByIntFixedWidth => val a = new Operator.SInt.ShiftRightByIntFixedWidth(s.shift); inferWidth(a, s); duplicateConstantOperatorWidthableInputs(a, s, i)
      case s: ResizeSInt => val a = new ResizeSInt; duplicateResize(a, s, i)
      
      case b: Bool => duplicateAssignment(b, i)
      case b: Operator.Bool.Not => val a = new Operator.Bool.Not; duplicateBoolNot(a, b, i)
      
      case b: CastBitsToUInt => val a = new CastBitsToUInt; duplicateCast(a, b, i)
      case b: CastBitsToSInt => val a = new CastBitsToSInt; duplicateCast(a, b, i)
      case u: CastUIntToBits => val a = new CastUIntToBits; duplicateCast(a, u, i)
      case u: CastUIntToSInt => val a = new CastUIntToSInt; duplicateCast(a, u, i)
      case s: CastSIntToBits => val a = new CastSIntToBits; duplicateCast(a, s, i)
      case s: CastSIntToUInt => val a = new CastSIntToUInt; duplicateCast(a, s, i)
			
			case l: BitsLiteral => val a = new BitsLiteral; duplicateLiteral(a, l, i)
			
			case _ => e
    }
    s
  }
  
  def matchTarget (e: Expression, i: Int): Expression = {
    val s = e match {
      case b: BaseType => duplicateAssignment(b, i)
      case b: BitAssignmentFixed => duplicateBitAssignmentFixed(b, i)
      case b: RangedAssignmentFixed => duplicateRangedAssignmentFixed(b, i)
    }
    s
  }
  
  /*for (sub <- c.children) {
      if (sub.isLinear) c.children -= sub
    }*/
  
  /*for (sub <- c.children) {
		if (sub.isLinear) {
			val x = Class.forName(sub.getClass.getName).getDeclaredConstructor().newInstance().asInstanceOf[Component]
			c.children += x
			ScopeProperty.get.remove(DslScopeStack.asInstanceOf[ScopeProperty[Any]])
		}
	}*/
  
  /*SpinalProgress("Duplicating linear sub-components, you should crack a cold one with the boys and girls!")

	val children = ArrayBuffer[Component]()
	
	//Store all children of toplevel
	for (sub <- c.children) {
		children += sub
	}
	
	//c.children.foreach(c => c.dslBody.walkStatements(s => println(s, s.parentScope, s.parentScope.head, s.parentScope.last)))
	
	//Create n new components for every child if the child is linear
	for (sub <- children) {
		if (sub.isLinear) {
			//Add the input/output signals of the sub-component to the shares array
			for (io <- sub.ioSet) {
				io.decID = declarationID
				declarationID += 1
				shares += ((io, ArrayBuffer[BaseType]()))
			}

			//n new components, they have to be constructed from scratch unfortunately
			//TODO maybe there is a more efficient way to do this?
			for (i <- 0 until n) {
				val a = new Module {
					override type RefOwnerType = this.type
				}
				//Give the new component the same definition name, and a new name "oldname_i", add new component to the children of c
				a.definitionName = sub.definitionName
				a.setName(s"${sub.getName()}_${i}")
				a.parentScope = sub.parentScope
				sub.parent.children += a
				//println(sub.dslBody)
				/*val x = Class.forName(sub.getClass.getName).getDeclaredConstructor().newInstance().asInstanceOf[Component]
				val xS, sS = ArrayBuffer[Statement]()
				x.dslBody.walkStatements(s => xS += s)
				sub.dslBody.walkStatements(s => sS += s)
				for (s <- xS) {
					s match {
						case d: DeclarationStatement =>
						case d: DataAssignmentStatement => {
							println(d, d.finalTarget, d.target, d.source, d.parentScope.head, d.parentScope.last)
						}
						case w: WhenStatement =>
						case s: Statement =>
					}
				}
				ScopeProperty.get.remove(DslScopeStack.asInstanceOf[ScopeProperty[Any]])*/
				/*x.dslBody.walkStatements {
					case d: DeclarationStatement =>
					case d: DataAssignmentStatement => {
						println(d)
					}
					case w: WhenStatement =>
					case s: Statement =>
				}*/
				//sub.dslBody.walkStatements(s => println(s))
				
				//New component already has a dslBody, this is the parentScope for all statements inside (apart from when/switch statements)
				val p = a.dslBody
				var head, last: Statement = null
				var headDone = false
				
				//Create a new namingScope (necessary, will give error otherwise)
				/*val namingScope = new NamingScope("", null)
				namingScope.lock = false
				sub.localNamingScope.map.foreach(name => namingScope.map += name)
				a.localNamingScope = namingScope*/
		
				//sub.dslBody.walkStatements(s => println(s))
				//Create all the statements in the new component by cloning the statements from the old component
				sub.dslBody.walkStatements {
					case d: DeclarationStatement => {
						val old = d.asInstanceOf[BaseType]
						val bt = old.cloneAndRename("", p)
						//If the declaration is input/output, add it to the ioSet
						if (!bt.isDirectionLess) {
							a.ioSet.add(bt)
							shares(d.asInstanceOf[BaseType].decID)._2 += bt}
						a.dslBody.append(bt)
						//For the first statement (always a declaration for a reasonable sub-component), set the head to this statement
						if (!headDone) {
							head = bt
							headDone = true
						}
						last = bt
					}
					case d: DataAssignmentStatement => {
						val source = duplicateSource(d.source, p)
						val target = duplicateTarget(d.target, p)
						val s = DataAssignmentStatement(target, source)
						s.parentScope = p
						a.dslBody.append(s)
						last = s
					}
					case w: WhenStatement => {
						val wWhenTrue = w.whenTrue
						val wWhenFalse = w.whenFalse
						val condition = duplicateSource(w.cond, p)
						//val when1 = when(True){}
						val newW = new WhenStatement(condition)
						newW.parentScope = p
						val whenTrue = newW.whenTrue
						whenTrue.component = a
						val whenFalse = newW.whenFalse
						whenFalse.component = a
						a.dslBody.append(newW)
						//println(newW.parentScope)
						//println(condition)
						//println(w.cond)
						//println("When", w, w.cond, w.whenTrue, w.whenFalse)
						w.walkStatements {
							case w: WhenStatement => //println(w, w.cond, w.whenTrue, w.whenFalse)
							case d: DataAssignmentStatement => {
								//println(d.parentScope)
								val scope = if (d.parentScope == wWhenTrue) whenTrue else whenFalse
								//println(scope)
								val target = duplicateTarget(d.target, scope)
								val source = duplicateSource(d.source, scope)
								//println(target, source)
								val s = DataAssignmentStatement(target, source)
								s.parentScope = scope
								//println(s, s.parentScope, s.finalTarget.rootScopeStatement)
								//a.dslBody.append(s)
								w.insertNext(s)
								//println(s)
							}
							case s: Statement => println(s, s.parentScope)
						}
						//println(w)
					}
					//TODO when and switch statements, Init statements, sub components?
					case s: Statement =>
				}

				p.head = head
				p.last = last
			}
		}
	}

	//c.children.foreach(c => c.dslBody.walkStatements(s => if (s.isInstanceOf[DataAssignmentStatement]) println(s, s.parentScope, s.asInstanceOf[DataAssignmentStatement].finalTarget.rootScopeStatement)))
	//Connect the new components according to the existing connections of the old components
	for (sub <- children) {
		if (sub.isLinear) {
			//for (i <- 0 until n) {
				c.dslBody.walkStatements {
					//Only DataAssignments are important here
					case d: DataAssignmentStatement => {
						var isStatementWithSub = false
						//Walk the statement and check if one of the parts of the expression is part of one of the old sub-components
						//If yes, add the shared tag to this part and mark the expression
						d.walkExpression {
							case b: BaseType => {
								if (children.contains(b.component)) {
									isStatementWithSub = true
									b.addTag(implementDataAsShared)
								}
							}
							case s =>
						}
						
						//If the expression is marked, create n new versions of it, but share the parts in a subcomponent
						if (isStatementWithSub) {
							for (i <- 0 until n) {
								val source = matchSource(d.source, i)
								val target = matchTarget(d.target, i)
								val s = DataAssignmentStatement(target, source)
								//Insert the new statement
								d.insertNext(s)
								//For the last iteration, remove the previously added tags and remove the original statement
								//as it has been completely replaced by the shared statements
								if (i == n-1) {
									d.walkExpression {
										case b: BaseType => if (children.contains(b.component)) b.removeTag(implementDataAsShared)
										case s =>
									}
									d.removeStatementFromScope()
								}
							}
						}
					}
					case s: Statement =>
				}
			//Remove the sub component from the children of the toplevel
			sub.parent.children -= sub
		}
	}*/
}

class PhaseApplyIoDefault(pc: PhaseContext) extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    walkDeclarations {
      case node: BaseType if node.dlcIsEmpty => node.getTag(classOf[DefaultTag]) match {
        case Some(defaultValue) =>
          val c = node.dir match {
            case `in` => node.component.parent
            case `out` => node.component
            case `inout` => PendingError(s"DEFAULT INOUT isn't allowed on $node at\n${node.getScalaLocationLong}")
            case _ => node.component
          }

          if (c != null) {
            val scope = node.rootScopeStatement
            val ctx = scope.push()
            node.assignFrom(defaultValue.that)
            ctx.restore()
          }
        case _ =>
      }
      case _ =>
    }
  }
}



class PhaseAnalog extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    //Be sure that sub io assign parent component stuff
    walkComponents(c => c.ioSet.withFilter(_.isInOut).foreach(io => {
      io.foreachStatements {
        case s@AssignmentStatement(_: BaseType, x: BaseType) if x.isAnalog && x.component == c.parent =>
          s.dlcRemove()
          x.dlcAppend(s)
          s.target = x
          s.source = io
        case _ =>
      }
    }))

    val analogs        = ArrayBuffer[BaseType]()
    val islands        = mutable.LinkedHashSet[mutable.LinkedHashSet[BaseType]]()
    val analogToIsland = mutable.HashMap[BaseType,mutable.LinkedHashSet[BaseType]]()

    def addToIsland(that: BaseType, island: mutable.LinkedHashSet[BaseType]): Unit = {
      island += that
      analogToIsland(that) = island
    }

    //val wrapped = mutable.HashMap[BaseType, BaseType]()

    walkStatements{
      case bt: BaseType if bt.isAnalog =>
        analogs += bt

        //Manage islands
        bt.foreachStatements {
          case s@AssignmentStatement(x, y: BaseType) if y.isAnalog =>
            if (s.finalTarget.component == y.component) {
              (analogToIsland.get(bt), analogToIsland.get(y)) match {
                case (None, None) =>
                  val island = mutable.LinkedHashSet[BaseType]()
                  addToIsland(bt, island)
                  addToIsland(y, island)
                  islands += island
                case (None, Some(island)) =>
                  addToIsland(bt, island)
                case (Some(island), None) =>
                  addToIsland(y, island)
                case (Some(islandBt), Some(islandY)) =>
                  islandY.foreach(addToIsland(_, islandBt))
                  islands.remove(islandY)
              }
            }
          case AssignmentStatement(x, y: BaseType) if !y.isAnalog =>
        }

        if(!analogToIsland.contains(bt)){
          val island = mutable.LinkedHashSet[BaseType]()
          addToIsland(bt,island)
          islands += island
        }
      case _ =>
    }

    islands.foreach(island => {
      //      if(island.size > 1){ //Need to reduce island because of VHDL/Verilog capabilities
      val target = island.count(_.isInOut) match {
        case 0 => island.head
        case 1 => island.find(_.isInOut).get
        case _ => PendingError("MULTIPLE INOUT interconnected in the same component"); null
      }

      //Remove target analog assignments
      target.foreachStatements {
        case s@AssignmentStatement(x, y: BaseType) if y.isAnalog && y.component == target.component => s.removeStatement()
        case _ =>
      }

      //redirect island assignments to target
      //drive isllands analogs from target as comb signal
      for(bt <- island if bt != target){
        val btStatements = ArrayBuffer[AssignmentStatement]()
        bt.foreachStatements(btStatements += _)
        btStatements.foreach {
          case s@AssignmentStatement(_, x: BaseType) if !x.isAnalog => //analog driver
            s.dlcRemove()
            target.dlcAppend(s)
            s.walkRemapExpressions(e => if (e == bt) target else e)
          case s@AssignmentStatement(_, x: BaseType) if x.isAnalog && x.component.parent == bt.component => //analog connection
            s.dlcRemove()
            target.dlcAppend(s)
            s.walkRemapExpressions(e => if (e == bt) target else e)
          case _ =>
        }

        bt.removeAssignments()
        bt.setAsComb()
        val ctx = bt.rootScopeStatement.push()
        bt := target
        ctx.restore()
      }

      //Convert target comb assignment into AnalogDriver nods
      target.foreachStatements(s => {
        s.source match {
          case btSource: BaseType if btSource.isAnalog =>
          case btSource =>
            val ctx = s.parentScope.push()
            val enable = ConditionalContext.isTrue(target.rootScopeStatement)
            ctx.restore()
            s.removeStatementFromScope()
            target.rootScopeStatement.append(s)
            val driver = btSource.getTypeObject match {
              case `TypeBool` => new AnalogDriverBool
              case `TypeBits` => new AnalogDriverBits
              case `TypeUInt` => new AnalogDriverUInt
              case `TypeSInt` => new AnalogDriverSInt
              case `TypeEnum` => new AnalogDriverEnum(btSource.asInstanceOf[EnumEncoded].getDefinition)
            }
            driver.data   = s.source.asInstanceOf[driver.T]
            driver.enable = enable
            s.source      = driver
        }
      })
      //      }
    })
  }
}






//class PhaseAnalog extends PhaseNetlist{
//
//  override def impl(pc: PhaseContext): Unit = {
//    import pc._
//
//    //Be sure that sub io assign parent component stuff
//    walkComponents(c => c.ioSet.withFilter(_.isInOut).foreach(io => {
//      io.foreachStatements {
//        case s@AssignmentStatement(_: BaseType, x: BaseType) if x.isAnalog && x.component == c.parent =>
//          s.dlcRemove()
//          x.dlcAppend(s)
//          s.target = x
//          s.source = io
//        case _ =>
//      }
//    }))
//
//    val islands        = mutable.LinkedHashSet[mutable.LinkedHashSet[(BaseType, Int)]]()
//    val analogToIsland = mutable.HashMap[(BaseType, Int),mutable.LinkedHashSet[(BaseType, Int)]]()
//
//    def addToIsland(that: BaseType, bit : Int, island: mutable.LinkedHashSet[(BaseType, Int)]): Unit = {
//      island += that -> bit
//      analogToIsland(that -> bit) = island
//    }
//
//    walkStatements{
//      case bt: BaseType if bt.isAnalog =>
//
//        //Manage islands
//        bt.foreachStatements {
//          case s@AssignmentStatement(x, y: BaseType) if y.isAnalog =>
//            if (s.finalTarget.component == y.component) {
//              var width = 0
//              val sourceOffset = 0
//              var targetOffset = 0
//              s.target match {
//                case bt : BaseType => width = s.finalTarget.getBitsWidth
//                case baf : BitAssignmentFixed => width = 1; targetOffset = baf.bitId
//              }
//              for(i <- 0 until width) (analogToIsland.get(bt, targetOffset+i), analogToIsland.get(y, sourceOffset+i)) match {
//                case (None, None) =>
//                  val island = mutable.LinkedHashSet[(BaseType, Int)]()
//                  addToIsland(bt, targetOffset+i, island)
//                  addToIsland(y, sourceOffset+i, island)
//                  islands += island
//                case (None, Some(island)) =>
//                  addToIsland(bt, targetOffset+i, island)
//                case (Some(island), None) =>
//                  addToIsland(y, sourceOffset+i, island)
//                case (Some(islandBt), Some(islandY)) =>
//                  islandY.foreach(e => addToIsland(e._1, e._2, islandBt))
//                  islands.remove(islandY)
//              }
//            }
//          case AssignmentStatement(x, y: BaseType) if !y.isAnalog =>
//        }
//
//        for(bit <- 0 until widthOf(bt)) {
//          if (!analogToIsland.contains(bt, bit)) {
//            val island = mutable.LinkedHashSet[(BaseType, Int)]()
//            addToIsland(bt, bit, island)
//            islands += island
//          }
//        }
//      case _ =>
//    }
//    /*
//        islands.foreach(island => {
//          //      if(island.size > 1){ //Need to reduce island because of VHDL/Verilog capabilities
//          val target = island.count(_.isInOut) match {
//            case 0 => island.head
//            case 1 => island.find(_.isInOut).get
//            case _ => PendingError("MULTIPLE INOUT interconnected in the same component"); null
//          }
//
//          //Remove target analog assignments
//          target.foreachStatements {
//            case s@AssignmentStatement(x, y: BaseType) if y.isAnalog && y.component == target.component => s.removeStatement()
//            case _ =>
//          }
//
//          //redirect island assignments to target
//          //drive isllands analogs from target as comb signal
//          for(bt <- island if bt != target){
//            val btStatements = ArrayBuffer[AssignmentStatement]()
//            bt.foreachStatements(btStatements += _)
//            btStatements.foreach {
//              case s@AssignmentStatement(_, x: BaseType) if !x.isAnalog => //analog driver
//                s.dlcRemove()
//                target.dlcAppend(s)
//                s.walkRemapExpressions(e => if (e == bt) target else e)
//              case s@AssignmentStatement(_, x: BaseType) if x.isAnalog && x.component.parent == bt.component => //analog connection
//                s.dlcRemove()
//                target.dlcAppend(s)
//                s.walkRemapExpressions(e => if (e == bt) target else e)
//              case _ =>
//            }
//
//            bt.removeAssignments()
//            bt.setAsComb()
//            bt.rootScopeStatement.push()
//            bt := target
//            bt.rootScopeStatement.pop()
//          }
//
//          //Convert target comb assignment into AnalogDriver nods
//          target.foreachStatements(s => {
//            s.source match {
//              case btSource: BaseType if btSource.isAnalog =>
//              case btSource =>
//                s.parentScope.push()
//                val enable = ConditionalContext.isTrue(target.rootScopeStatement)
//                s.parentScope.pop()
//                s.removeStatementFromScope()
//                target.rootScopeStatement.append(s)
//                val driver = btSource.getTypeObject match {
//                  case `TypeBool` => new AnalogDriverBool
//                  case `TypeBits` => new AnalogDriverBits
//                  case `TypeUInt` => new AnalogDriverUInt
//                  case `TypeSInt` => new AnalogDriverSInt
//                  case `TypeEnum` => new AnalogDriverEnum(btSource.asInstanceOf[EnumEncoded].getDefinition)
//                }
//                driver.data   = s.source.asInstanceOf[driver.T]
//                driver.enable = enable
//                s.source      = driver
//            }
//          })
//          //      }
//        })
//     */
//  }
//}


class MemTopology(val mem: Mem[_], val consumers : mutable.HashMap[Expression, ArrayBuffer[ExpressionContainer]]) {
  val writes                   = ArrayBuffer[MemWrite]()
  val readsAsync               = ArrayBuffer[MemReadAsync]()
  val readsSync                = ArrayBuffer[MemReadSync]()
  val readWriteSync            = ArrayBuffer[MemReadWrite]()
  val writeReadSameAddressSync = ArrayBuffer[(MemWrite, MemReadSync)]() //DISABLED

  var portCount = 0
  mem.foreachStatements(s => {
    portCount += 1
    s match {
      case p: MemWrite     => writes += p
      case p: MemReadAsync => readsAsync += p
      case p: MemReadSync  => readsSync += p
      case p: MemReadWrite => readWriteSync += p
    }
  })
}


trait PhaseMemBlackboxing extends PhaseNetlist {

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    val consumers = mutable.HashMap[Expression, ArrayBuffer[ExpressionContainer]]()
    val mems      = mutable.LinkedHashSet[Mem[_]]()

    walkBaseNodes{
      case mem: Mem[_] => mems += mem
      case ec: ExpressionContainer =>
        ec.foreachExpression{
          case port: MemPortStatement => consumers.getOrElseUpdate(port, ArrayBuffer[ExpressionContainer]()) += ec
          case _ =>
        }
      case _ =>
    }
    mems.foreach(mem => {
      if(mem.addressWidth != 0) {
        doBlackboxing(pc, new MemTopology(mem, consumers))
      } else{
        def wrapConsumers(oldSource: Expression, newSource: Expression): Unit ={
          consumers.get(oldSource) match {
            case None        =>
            case Some(array) => array.foreach(ec => {
              ec.remapExpressions{
                case e if e == oldSource => newSource
                case e                   => e
              }
            })
          }
        }

        mem.component.rework{
          val content = Bits(mem.width bits).allowOverride
          mem.foreachStatements{
            case port : MemWrite => {
              assert(port.aspectRatio == 1)
              val storage = port.clockDomain(Reg(Bits(mem.width bits)))
              storage.addTags(mem.getTags())
              if(mem.initialContent != null){
                assert(mem.initialContent.size == 1)
                storage.init(mem.initialContent.head)
              }
              content := storage
              when(port.writeEnable.asInstanceOf[Bool]){
                if(port.mask == null) {
                  storage := port.data.asInstanceOf[Bits]
                } else {
                  val dst = storage.subdivideIn(port.mask.getWidth slices)
                  val src = port.data.asInstanceOf[Bits].subdivideIn(port.mask.getWidth slices)
                  for(i <- 0 until port.mask.getWidth) {
                    when(port.mask.asInstanceOf[Bits](i)) {
                      dst(i) := src(i)
                    }
                  }
                }
              }
            }
            case port : MemReadAsync => {
              assert(port.aspectRatio == 1)
              assert(port.readUnderWrite == dontCare || port.readUnderWrite == writeFirst)
              val readValue = Bits(mem.width bits)
              readValue := content
              readValue.addTags(port.getTags())
              wrapConsumers(port, readValue)
            }
            case port : MemReadSync => {
              assert(port.aspectRatio == 1)
              assert(port.readUnderWrite == dontCare || port.readUnderWrite == readFirst)
              val buffer = Reg(Bits(mem.width bits))
              buffer.addTags(port.getTags())
              when(port.readEnable.asInstanceOf[Bool]){
                buffer := content
              }
              wrapConsumers(port, buffer)
            }
            case port : MemReadWrite => {
              assert(port.aspectRatio == 1)
              val storage = port.clockDomain(Reg(Bits(mem.width bits)))
              storage.addTags(mem.getTags())
              if(mem.initialContent != null){
                assert(mem.initialContent.size == 1)
                storage.init(mem.initialContent.head)
              }
              content := storage
              val buffer = Reg(Bits(mem.width bits))
              buffer.addTags(port.getTags())
              when(port.chipSelect.asInstanceOf[Bool]){
                when(port.writeEnable.asInstanceOf[Bool]){
                  if(port.mask == null) {
                    storage := port.data.asInstanceOf[Bits]
                  } else {
                    val dst = storage.subdivideIn(port.mask.getWidth slices)
                    val src = port.data.asInstanceOf[Bits].subdivideIn(port.mask.getWidth slices)
                    for(i <- 0 until port.mask.getWidth) {
                      when(port.mask.asInstanceOf[Bits](i)) {
                        dst(i) := src(i)
                      }
                    }
                  }
                } otherwise {
                  buffer := content
                }
              }
              wrapConsumers(port, buffer)
            }
          }

          if(mem.initialContent != null && content.dlcIsEmpty){
            assert(mem.initialContent.size == 1)
            content := mem.initialContent.head
          }
        }
        mem.removeStatement()
        mem.foreachStatements(s => s.removeStatement())
      }
    })
  }

  def doBlackboxing(pc: PhaseContext, typo: MemTopology): Unit

  def wrapConsumers(topo : MemTopology, oldSource: Expression, newSource: Expression): Unit ={
    topo.consumers.get(oldSource) match {
      case None        =>
      case Some(array) => array.foreach(ec => {
        ec.remapExpressions{
          case e if e == oldSource => newSource
          case e                   => e
        }
      })
    }
  }

  def removeMem(mem : Mem[_]): Unit ={
    mem.removeStatement()
    mem.foreachStatements(s => s.removeStatement())
  }


}


abstract class PhaseMemBlackBoxingWithPolicy(policy: MemBlackboxingPolicy) extends PhaseMemBlackboxing{

  override def doBlackboxing(pc: PhaseContext, typo: MemTopology): Unit = {

    if(policy.translationInterest(typo)) {
      val message = doBlackboxing(typo)
      if(message != null) policy.onUnblackboxable(typo,this,message)
    }
  }

  //Return null if success
  def doBlackboxing(memTopology: MemTopology) : String
}


class PhaseMemBlackBoxingDefault(policy: MemBlackboxingPolicy) extends PhaseMemBlackBoxingWithPolicy(policy){
  def doBlackboxing(topo: MemTopology): String = {
    val mem = topo.mem
    def wrapBool(that: Expression): Bool = that match {
      case that: Bool => that
      case that       =>
        val ret = Bool()
        ret.assignFrom(that)
        ret
    }

    def wrapConsumers(oldSource: Expression, newSource: Expression): Unit ={
      super.wrapConsumers(topo, oldSource, newSource)
    }

    def removeMem(): Unit ={
      super.removeMem(mem)
    }

    if (mem.initialContent != null) {
      return "Can't blackbox ROM"  //TODO
      //      } else if (topo.writes.size == 1 && topo.readsAsync.size == 1 && topo.portCount == 2) {
    } else if (topo.writes.size == 1 && (topo.readsAsync.nonEmpty || topo.readsSync.nonEmpty) && topo.writeReadSameAddressSync.isEmpty && topo.readWriteSync.isEmpty) {
      mem.component.rework {
        val wr = topo.writes(0)
        for (rd <- topo.readsAsync) {
          val clockDomain = wr.clockDomain
          val ctx = ClockDomainStack.set(clockDomain)

          val ram = new Ram_1w_1ra(
            wordWidth = mem.getWidth,
            wordCount = mem.wordCount,
            wrAddressWidth = wr.address.getWidth,
            wrDataWidth = wr.data.getWidth,
            rdAddressWidth = rd.address.getWidth,
            rdDataWidth = rd.getWidth,
            wrMaskWidth = if (wr.mask != null) wr.mask.getWidth else 1,
            wrMaskEnable = wr.mask != null,
            readUnderWrite = rd.readUnderWrite,
            technology = mem.technology
          )

          ram.io.wr.en := wrapBool(wr.writeEnable) && clockDomain.isClockEnableActive
          ram.io.wr.addr.assignFrom(wr.address)
          ram.io.wr.data.assignFrom(wr.data)

          if (wr.mask != null)
            ram.io.wr.mask.assignFrom(wr.mask)
          else
            ram.io.wr.mask := B"1"

          ram.io.rd.addr.assignFrom(rd.address)
          wrapConsumers(rd, ram.io.rd.data)

          ram.setName(mem.getName())
          ctx.restore()
        }

        for (rd <- topo.readsSync) {
          val ram = new Ram_1w_1rs(
            wordWidth = mem.getWidth,
            wordCount = mem.wordCount,
            wrClock = wr.clockDomain,
            rdClock = rd.clockDomain,
            wrAddressWidth = wr.address.getWidth,
            wrDataWidth = wr.data.getWidth,
            rdAddressWidth = rd.address.getWidth,
            rdDataWidth = rd.getWidth,
            wrMaskWidth = if (wr.mask != null) wr.mask.getWidth else 1,
            wrMaskEnable = wr.mask != null,
            readUnderWrite = rd.readUnderWrite,
            technology = mem.technology
          )

          ram.io.wr.en := wrapBool(wr.writeEnable) && wr.clockDomain.isClockEnableActive
          ram.io.wr.addr.assignFrom(wr.address)
          ram.io.wr.data.assignFrom(wr.data)

          if (wr.mask != null)
            ram.io.wr.mask.assignFrom(wr.mask)
          else
            ram.io.wr.mask := B"1"

          ram.io.rd.en := wrapBool(rd.readEnable) && rd.clockDomain.isClockEnableActive
          ram.io.rd.addr.assignFrom(rd.address)
          wrapConsumers(rd, ram.io.rd.data)

          ram.setName(mem.getName())
        }

        removeMem()
      }
    } else if (topo.portCount == 1 && topo.readWriteSync.size == 1) {

      mem.component.rework {
        val port = topo.readWriteSync.head

        val ram = new Ram_1wrs(
          wordWidth = port.width,
          wordCount = mem.wordCount*mem.width/port.width,
          technology = mem.technology,
          readUnderWrite = port.readUnderWrite,
          duringWrite = port.duringWrite,
          maskWidth = if (port.mask != null) port.mask.getWidth else 1,
          maskEnable = port.mask != null
        )

        ram.io.addr.assignFrom(port.address)
        ram.io.en.assignFrom(wrapBool(port.chipSelect) && port.clockDomain.isClockEnableActive)
        ram.io.wr.assignFrom(port.writeEnable)
        ram.io.wrData.assignFrom(port.data)

        if (port.mask != null)
          ram.io.mask.assignFrom(port.mask)
        else
          ram.io.mask := B"1"

        wrapConsumers(port, ram.io.rdData)

        ram.setName(mem.getName())
        removeMem()
      }
    } else if (topo.portCount == 2 && topo.readWriteSync.size == 2) {

      mem.component.rework {
        val portA = topo.readWriteSync(0)
        val portB = topo.readWriteSync(1)

        val ram = new Ram_2wrs(
          wordWidth = mem.getWidth,
          wordCount = mem.wordCount,
          technology = mem.technology,
          portA_readUnderWrite = portA.readUnderWrite,
          portA_duringWrite = portA.duringWrite,
          portA_clock = portA.clockDomain,
          portA_addressWidth = portA.address.getWidth,
          portA_dataWidth = portA.getWidth,
          portA_maskWidth = if (portA.mask != null) portA.mask.getWidth else 1,
          portA_maskEnable = portA.mask != null,
          portB_readUnderWrite = portB.readUnderWrite,
          portB_duringWrite = portB.duringWrite,
          portB_clock = portB.clockDomain,
          portB_addressWidth = portB.address.getWidth,
          portB_dataWidth = portB.getWidth,
          portB_maskWidth = if (portB.mask != null) portB.mask.getWidth else 1,
          portB_maskEnable = portB.mask != null
        )

        ram.io.portA.addr.assignFrom(portA.address)
        ram.io.portA.en.assignFrom(wrapBool(portA.chipSelect) && portA.clockDomain.isClockEnableActive)
        ram.io.portA.wr.assignFrom(portA.writeEnable)
        ram.io.portA.wrData.assignFrom(portA.data)
        ram.io.portA.mask.assignFrom((if (portA.mask != null) portA.mask else B"1"))
        wrapConsumers(portA, ram.io.portA.rdData)

        ram.io.portB.addr.assignFrom(portB.address)
        ram.io.portB.en.assignFrom(wrapBool(portB.chipSelect) && portB.clockDomain.isClockEnableActive)
        ram.io.portB.wr.assignFrom(portB.writeEnable)
        ram.io.portB.wrData.assignFrom(portB.data)
        ram.io.portB.mask.assignFrom((if (portB.mask != null) portB.mask else B"1"))
        wrapConsumers(portB, ram.io.portB.rdData)

        ram.setName(mem.getName())
        removeMem()
      }
    } else {
      return "Unblackboxable memory topology" //TODO
    }
    return null
  }
}

object classNameOf{
  def apply(that : Any): String = {
    val name = that.getClass.getSimpleName.replace("$",".").split("\\.").head
    if(name.nonEmpty) name else "unamed"
  }
}

class PhaseNameNodesByReflection(pc: PhaseContext) extends PhaseMisc{
  override def impl(pc : PhaseContext): Unit = {
    import pc._

    globalData.nodeAreNamed = true

    if (topLevel.getName() == null) topLevel.setName("toplevel", Nameable.DATAMODEL_WEAK)
    if(topLevel.definitionName == null) {
      topLevel.definitionName = pc.config.globalPrefix + classNameOf(topLevel)
    }
    for (c <- sortedComponents) {
      if(c != topLevel) {
        val pre = c match {
            case t: BlackBox => ""
            case _ => config.globalPrefix
          }
        if (c.definitionName == null) {
          val privateNsN = (if(config.privateNamespace) topLevel.definitionName + "_" else "")
          c.definitionName = pre + privateNsN + classNameOf(c)
        } else {
          c.definitionName = pre + c.definitionName 
        }
      }
      if (c.definitionName == "") {
        c.definitionName = "unnamed"
      }
      c match {
        case bb: BlackBox if bb.isBlackBox => {
          val generic = bb.getGeneric
          if(generic != null) {
            Misc.reflect(generic, (name, obj) => {
              OwnableRef.proposal(obj, this)
              obj match {
                case obj: Nameable => obj.setName(name, Nameable.DATAMODEL_WEAK)
                case _ =>
              }
              obj match {
                case obj: Data => bb.genericElements ++= obj.flatten.map(o => {
                  o.addTag(GenericValue(o.head.source))
                  (o.getName(), o)
                })
                case _         => bb.genericElements += Tuple2(name, obj.asInstanceOf[Any])
              }
            })
          }
        }
        case _ =>
      }
    }
  }
}


class PhaseCollectAndNameEnum(pc: PhaseContext) extends PhaseMisc{

  override def impl(pc : PhaseContext): Unit = {
    import pc._
    walkDeclarations {
      case enum: SpinalEnumCraft[_] => enums.getOrElseUpdate(enum.spinalEnum, null) //Encodings will be added later
      case _ =>
    }

    val scope = pc.globalScope.newChild("")

    enums.keys.foreach(e => {
      val name = if(e.isNamed)
        e.getName()
      else
        e.getClass.getSimpleName.replace("$","")

      e.setName(scope.allocateName(name))
    })

    for (enumDef <- enums.keys) {
      Misc.reflect(enumDef, (name, obj) => {
        obj match {
//          case obj: Nameable => obj.setName(scope.getUnusedName(name), Nameable.DATAMODEL_WEAK)
          case obj: Nameable => obj.setName(name, Nameable.DATAMODEL_WEAK)
          case _ =>
        }
      })

      for (e <- enumDef.elements) {
        if (e.isUnnamed) {
//          e.setName(scope.getUnusedName("e" + e.position), Nameable.DATAMODEL_WEAK)
          e.setName("e" + e.position, Nameable.DATAMODEL_WEAK)
        }
      }
    }
  }
}


class PhasePullClockDomains(pc: PhaseContext) extends PhaseNetlist{

  override def impl(pc : PhaseContext): Unit = {
    import pc._

    walkComponents(c => {
      val cds = mutable.LinkedHashSet[ClockDomain]()
      c.dslBody.walkLeafStatements{
        case bt : BaseType if bt.isReg =>
          val cd = bt.clockDomain
          if(bt.isUsingResetSignal && (!cd.hasResetSignal && !cd.hasSoftResetSignal))
            SpinalError(s"MISSING RESET SIGNAL in the ClockDomain used by $bt\n${bt.getScalaLocationLong}")

          cds += cd
        case ls => ls.foreachClockDomain(cd => cds += cd)
      }

      c.rework{
        for(cd <- cds){
          cd.readClockWire
          if(cd.hasResetSignal)       cd.readResetWire
          if(cd.hasSoftResetSignal)   cd.readSoftResetWire
          if(cd.hasClockEnableSignal) cd.readClockEnableWire
        }
      }
    })
  }
}


class PhaseInferEnumEncodings(pc: PhaseContext, encodingSwap: (SpinalEnumEncoding) => SpinalEnumEncoding) extends PhaseMisc{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    globalData.nodeAreInferringEnumEncoding = true

    val nodes           = ArrayBuffer[Expression with EnumEncoded]()
    val nodesInferrable = ArrayBuffer[Expression with InferableEnumEncoding]()
    val consumers       = mutable.HashMap[Expression , ArrayBuffer[Expression]]()
    var algo            = globalData.allocateAlgoIncrementale()

    def walkExpression(node: Expression): Unit ={
      if(node.algoIncrementale != algo) {
        node.algoIncrementale = algo

        if (node.isInstanceOf[EnumEncoded]) nodes += node.asInstanceOf[Expression with EnumEncoded]

        if (node.isInstanceOf[InferableEnumEncoding]) nodesInferrable += node.asInstanceOf[Expression with InferableEnumEncoding]

        node.foreachDrivingExpression(input => input match {
          case input: Expression with EnumEncoded => consumers.getOrElseUpdate(input, ArrayBuffer[Expression]()) += node
          case _ =>
        })

        node.foreachDrivingExpression(input => walkExpression(input))
      }
    }

    //Fill consumers
    walkStatements {
      case s: AssignmentStatement =>
        val finalTarget = s.finalTarget
        s.source match {
          case source: Expression with EnumEncoded => consumers.getOrElseUpdate(source, ArrayBuffer[Expression]()) += finalTarget
          case _ =>
        }
        s.foreachDrivingExpression(e => walkExpression(e))
      case s: SwitchStatement if s.value.getTypeObject == TypeEnum =>
        s.elements.foreach(_.keys.foreach {
          case key if key.getTypeObject == TypeEnum => consumers.getOrElseUpdate(s.value, ArrayBuffer[Expression]()) += key
        })
        s.foreachDrivingExpression(e => walkExpression(e))
      case s =>
        s.foreachDrivingExpression(e => walkExpression(e))
    }

    walkDeclarations{
      case e: Expression => walkExpression(e)
      case _             =>
    }

    //Prepear the feild
    nodesInferrable.foreach(node => {
      node.bootInferration()
    })

    nodes.foreach(enum => {
      enum.swapEncoding(encodingSwap(enum.getEncoding))
    })

    algo = globalData.allocateAlgoIncrementale()

    nodes.foreach(enum => {
      if(enum.propagateEncoding){

        def propagateOn(that : Expression): Unit = {
          that match {
            case that: InferableEnumEncoding =>
              if(that.algoIncrementale == algo) return

              that.algoIncrementale = algo

              if(that.encodingProposal(enum.getEncoding)) {
                that match {
                  case that: SpinalEnumCraft[_] =>
                    that.dlcForeach(s => propagateOn(s.source))
                    consumers.getOrElse(that, Nil).foreach(propagateOn(_))
                  case _ =>
                    that.foreachExpression(propagateOn(_))
                    consumers.getOrElse(that, Nil).foreach(propagateOn(_))
                }
              }
            case _ =>
          }
        }

        enum match {
          case enum : SpinalEnumCraft[_] =>
            enum.dlcForeach(s => propagateOn(s.source))
            consumers.getOrElse(enum, Nil).foreach(propagateOn(_))
          case _ =>
            enum.foreachExpression(propagateOn(_))
            consumers.getOrElse(enum, Nil).foreach(propagateOn(_))
        }
      }
    })

    //Feed enums with encodings
    enums.keys.toArray.distinct.foreach(enums(_) = mutable.LinkedHashSet[SpinalEnumEncoding]())
    nodes.foreach(enum => {
      enums(enum.getDefinition) += enum.getEncoding
    })

    //give a name to unnamed encodingss
    val unnamedEncodings = enums.valuesIterator.flatten.toSeq.distinct.withFilter(_.isUnnamed).foreach(_.setName("anonymousEnc", Nameable.DATAMODEL_WEAK))

    //Check that there is no encoding overlaping
    for((enum,encodings) <- enums){
      for(encoding <- encodings) {
        val reserveds = mutable.Map[BigInt, ArrayBuffer[SpinalEnumElement[_]]]()

        for(element <- enum.elements){
          val key = encoding.getValue(element)
          reserveds.getOrElseUpdate(key,ArrayBuffer[SpinalEnumElement[_]]()) += element
        }

        for((key,elements) <- reserveds){
          if(elements.length != 1){
            PendingError(s"Conflict in the $enum enumeration with the '$encoding' encoding with the key $key' and following elements:.\n${elements.mkString(", ")}\n\nEnumeration defined at :\n${enum.getScalaLocationLong}Encoding defined at :\n${encoding.getScalaLocationLong}")
          }
        }
      }
    }
  }
}

class PhaseDevice(pc : PhaseContext) extends PhaseMisc{
  override def impl(pc: PhaseContext): Unit = {
    pc.walkDeclarations {
      case mem: Mem[_] => {
        var hit = false
        mem.foreachStatements {
          case port: MemReadAsync => hit = true
          case _ =>
        }
        if (hit) mem.addAttribute("ram_style", "distributed") //Vivado stupid gambling workaround Synth 8-6430
      }
      case bt : BaseType =>{
        if(bt.isReg && (bt.hasTag(crossClockDomain) || bt.hasTag(crossClockBuffer))){
          bt.addAttribute("async_reg", "true")
        }
      }
      case _ =>
    }
    if(pc.config.device.vendor == Device.ALTERA.vendor){
      pc.walkDeclarations {
        case mem : Mem[_] => {
          var onlyDontCare = true
          mem.dlcForeach(e => e match {
            case port: MemWrite      =>
            case port: MemReadWrite  => onlyDontCare &= port.readUnderWrite == dontCare
            case port: MemReadSync   => onlyDontCare &= port.readUnderWrite == dontCare
            case port: MemReadAsync  => onlyDontCare &= port.readUnderWrite == dontCare
          })
          if(onlyDontCare) mem.addAttribute("ramstyle", "no_rw_check")
        }
        case _ =>
      }
    }
  }
}

class PhaseInferWidth(pc: PhaseContext) extends PhaseMisc{

  override def impl(pc: PhaseContext): Unit = {
    import pc._
    globalData.nodeAreInferringWidth = true

    var iterationCounter = 0

    while (true) {
      var somethingChange = false

      //Infer width on all expressions
      //Use post-order traversal so that a parent node can get the widths of its children before inferring width,
      // which could help reducing the number of iterations
      walkExpressionPostorder {
        case e: DeclarationStatement =>
        case e: Widthable =>
          val hasChange = e.inferWidth
          somethingChange = somethingChange || hasChange
        case _ =>
      }

      //Infer width on all nameable expression (BitVector)
      walkDeclarations {
        case e: Widthable =>
          val hasChange = e.inferWidth
          somethingChange = somethingChange || hasChange
        case _ =>
      }

      //Check in the width inferation is done, then check it and generate errors
      if (!somethingChange || iterationCounter == 10000) {
        val errors = mutable.ArrayBuffer[String]()

        def widthableCheck(e: Widthable): Unit = {
          if (e.inferWidth) {
            //Don't care about Reg width inference
            errors += s"Can't infer width on ${e.getScalaLocationLong}"
          }

          if (e.widthWhenNotInferred != -1 &&
            e.widthWhenNotInferred != e.getWidth) {
            errors += s"getWidth call result during elaboration differ from inferred width on\n${e.getScalaLocationLong}"
          }

          if(e.inferredWidth < 0){
            errors += s"Negative width on $e at ${e.getScalaLocationLong}"
          }

          if (e.inferredWidth > 4096) {
            errors += s"Way too big signal $e at ${e.getScalaLocationLong}"
          }
        }

        walkExpression {
          case e: DeclarationStatement =>
          case e: Widthable => widthableCheck(e)
          case e: WidthProvider =>
            if (e.getWidth < 0) {
              errors += s"Negative width on $e at ${e.getScalaLocationLong}"
            }
            if (e.getWidth > 4096) {
              errors += s"Way too big signal $e at ${e.getScalaLocationLong}"
            }
          case _ =>
        }

        walkDeclarations {
          case e: Widthable => widthableCheck(e)
          case _ =>
        }

        if (errors.nonEmpty)
          SpinalError(errors)
        return
      }
      iterationCounter += 1
    }
  }
}


class PhaseSimplifyNodes(pc: PhaseContext) extends PhaseNetlist{

  override def impl(pc : PhaseContext): Unit = {
    import pc._

    val toRemove = mutable.ArrayBuffer[Statement]()

    walkStatements{
      case s: BitVector if s.getWidth == 0 =>
        s.foreachStatements(toRemove += _)
        s.removeStatement()
      case s: Mem[_] if s.getWidth == 0 =>
        s.foreachStatements(toRemove += _)
        s.removeStatement()
      case s: SpinalEnumCraft[_] if s.spinalEnum.elements.size < 2 =>
        s.foreachStatements(toRemove += _)
        s.removeStatement()
      case s => s.walkRemapExpressions(_.simplifyNode)
    }

    toRemove.foreach(_.removeStatement())


    //propagate literals over one basetype
    walkStatements{s =>
      s.remapDrivingExpressions{
        case e : BaseType if e.isComb && !e.isNamed && e.isDirectionLess && Statement.isSomethingToFullStatement(e) => e.head match {
          case DataAssignmentStatement(_, lit : Literal) => lit.clone //clone because Expression can only be once in the graph
          case _ => e
        }
        case e => e
      }
    }
  }
}


class PhaseNormalizeNodeInputs(pc: PhaseContext) extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    walkStatements(s => {
      s.walkExpression(e => {
        e.normalizeInputs
      })
      s.normalizeInputs
    })

    walkComponents(c => {
      c.dslBody.walkDeclarations {
        case n: BitVector => n.removeTag(tagAutoResize)
        case _ =>
      }
    })
  }
}


class PhaseCheckCombinationalLoops() extends PhaseCheck{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    val walkingId = GlobalData.get.allocateAlgoIncrementale()
    val okId      = GlobalData.get.allocateAlgoIncrementale()

    def walk(path : List[(BaseNode)], node: BaseNode): Unit = {
      val newPath = node :: path

      if (node.algoIncrementale == walkingId) {
        val ordred  = newPath.reverseIterator
        val filtred = ordred.dropWhile((e) => (e != node)).drop(1).toArray

        if (!filtred.exists(e => e.isInstanceOf[SpinalTagReady] && e.asInstanceOf[SpinalTagReady].hasTag(noCombinatorialLoopCheck))) {
          val wellNameLoop = new StringBuilder()

          for(n <- filtred.reverseIterator) n match{
            case n: DeclarationStatement => wellNameLoop ++= s"    >>> ${n.toString()} at ${n.getScalaLocationShort} >>>\n"
            case _                       =>
          }

          val multiLineLoop = filtred.reverseIterator.filter(!_.isInstanceOf[AssignmentStatement]).map(n => "    " + n.toString).foldLeft("")(_ + "\n" + _)
          PendingError(s"COMBINATORIAL LOOP :\n  Partial chain :\n${wellNameLoop}\n  Full chain :${multiLineLoop}")
        }

      }else if (node.algoIncrementale != okId) {
        node.algoIncrementale = walkingId
        node match {
          case node: BaseType =>
            if(node.isComb) {
              node.algoIncrementale = walkingId
              node.foreachStatements(s => walk(newPath, s))
              node.algoIncrementale = okId
            }
          case node: AssignmentStatement =>
            node.foreachDrivingExpression(e => walk(newPath, e))
            node.walkParentTreeStatementsUntilRootScope(s => walk(newPath, s))
          case node: TreeStatement =>
            if (node.algoIncrementale != okId) {
              node.foreachDrivingExpression(e => walk(newPath, e))
              node.algoIncrementale = okId
            }
          case node: Mem[_]       =>
          case node: MemReadSync  =>
          case node: MemReadWrite =>
          case node: MemWrite     =>
          case node: Expression   =>
            node.foreachDrivingExpression(e => walk(newPath, e))
          case node: AssertStatement =>
            node.foreachDrivingExpression(e => walk(newPath, e))
        }
      }
      node.algoIncrementale = okId
    }

    walkStatements(s => {
      if (s.algoIncrementale != okId) {
        walk(s :: Nil, s)
      }
    })
  }
}


class PhaseCheckCrossClock() extends PhaseCheck{

  override def impl(pc : PhaseContext): Unit = {
    import pc._

    val solved = mutable.HashMap[Bool, immutable.Set[Bool]]()
    def getSyncronous(that : Bool) : immutable.Set[Bool] = {
      solved.get(that) match {
        case Some(sync) => sync
        case None => {
          var sync = scala.collection.immutable.Set[Bool]()

          //Collect all the directly syncronous Bool
          sync += that
          that.foreachTag {
            case tag : ClockSyncTag => sync += tag.a; sync += tag.b
            case tag : ClockDrivedTag => sync ++= getSyncronous(tag.driver)
            case _ =>
          }

          //Lock for driver inferation
          if (that.hasOnlyOneStatement && that.head.parentScope == that.rootScopeStatement && that.head.source.isInstanceOf[Bool] && that.head.source.asInstanceOf[Bool].isComb) {
            sync ++= getSyncronous(that.head.source.asInstanceOf[Bool])
          }

          //Cache result
          solved(that) = sync

          sync
        }
      }
    }
    def areSynchronousBool(a : Bool, b : Bool): Boolean = getSyncronous(a).contains(b) || getSyncronous(b).contains(a) || getSyncronous(a).intersect(getSyncronous(b)).nonEmpty

    def areSynchronous(a : ClockDomain, b : ClockDomain): Boolean ={
      a == b || a.clock == b.clock || areSynchronousBool(a.clock, b.clock)
      //          if(a.isSynchronousWith(b)){
      //            true
      //          }else{
      //            def getDriver(that : Bool): Bool ={
      //              if(that.hasOnlyOneStatement && that.head.parentScope == that.rootScopeStatement && that.head.source.isInstanceOf[Bool] && that.head.source.asInstanceOf[Bool].isComb){
      //                getDriver(that.head.source.asInstanceOf[Bool])
      //              }else{
      //                that
      //              }
      //            }
      //            if(getDriver(a.clock) == getDriver(b.clock)){
      //              a.setSynchronousWith(b)
      //              true
      //            }else{
      //              false
      //            }
      //          }
    }

    //        class SyncGroup{
    //          val clocks = mutable.HashSet[Bool]()
    //        }
    //
    //        val clockToGroup = mutable.HashMap[Bool, SyncGroup]()
    //
    //        def getClockGroup(clock : Bool) : SyncGroup = {
    //          if(!clockToGroup.contains(clock)){
    //
    //          }
    //          clockToGroup.contains(clock)
    //        }


    walkStatements(s => {
      var walked = 0

      def walk(node: BaseNode, path: List[(BaseNode)], clockDomain: ClockDomain): Unit = {
        if(node.algoIncrementale == walked) return

        node.algoIncrementale = walked

        val newPath = node :: path

        def issue(syncDriver: BaseNode with ScalaLocated, otherClockDomain: ClockDomain): Unit = {
          val wellNameLoop = new StringBuilder()

          for(n <- newPath) n match{
            case n: DeclarationStatement =>
              wellNameLoop ++= s"      >>> ${n.toString()} at ${n.getScalaLocationShort} >>>\n"
            case _  =>
          }
          val multiLineLoop = newPath.map(n => "      " + n.toString).foldLeft("")(_ + "\n" + _)

          PendingError(
            s"""CLOCK CROSSING VIOLATION :
               |- Source            : ${syncDriver} ${syncDriver.getScalaLocationShort}
               |- Source clock      : ${otherClockDomain.clock}
               |- Destination       : ${s} ${s.getScalaLocationShort}
               |- Destination clock : ${clockDomain.clock}
               |- Source declaration :
               |${syncDriver.getScalaLocationLong}
               |- Destination declaration :
               |${s.getScalaLocationLong}
               |- Connection path :
               |${wellNameLoop}
             """.stripMargin
          )
        }

        node match {
          case node: SpinalTagReady if node.hasTag(crossClockDomain) =>
          case node: SpinalTagReady if node.hasTag(classOf[ClockDomainTag]) =>
            if(!areSynchronous(node.getTag(classOf[ClockDomainTag]).get.clockDomain, clockDomain)) {
              issue(node.asInstanceOf[BaseNode with ScalaLocated], node.getTag(classOf[ClockDomainTag]).get.clockDomain)
            }
          case node: BaseType =>
            if (node.isReg) {
              if(!areSynchronous(node.clockDomain, clockDomain)) {
                issue(node, node.clockDomain)
              }
            } else {
              node.foreachStatements(s => walk(s, newPath, clockDomain))
            }
          case node: AssignmentStatement =>
            node.foreachDrivingExpression(e => walk(e, newPath, clockDomain))
            node.walkParentTreeStatementsUntilRootScope(s => walk(s, newPath, clockDomain))
          case node: TreeStatement =>
            node.foreachDrivingExpression(e => walk(e, newPath, clockDomain))
          case node: Mem[_] =>
          case node: MemReadSync =>
            if(!areSynchronous(node.clockDomain, clockDomain)) {
              issue(node, node.clockDomain)
            }
          case node: MemReadWrite =>
            if(!areSynchronous(node.clockDomain, clockDomain)) {
              issue(node, node.clockDomain)
            }
          case node: Expression =>
            node.foreachDrivingExpression(e => walk(e, newPath, clockDomain))
        }
      }

      s match {
        case s: BaseType if s.hasTag(classOf[ClockDomainTag]) =>
          if (!s.isReg) {
            // if it not a reg, perform the check if the ClockDomainTag is present
            walked = GlobalData.get.allocateAlgoIncrementale()
            s.foreachStatements(as => walk(as, as :: s :: Nil, s.getTag(classOf[ClockDomainTag]).get.clockDomain))
          }
          else {
            PendingError(s"Can't add ClockDomainTag to registers:\n" + s.getScalaLocationLong)
          }
        case s: BaseType if s.isReg && !s.hasTag(crossClockDomain) =>
          walked = GlobalData.get.allocateAlgoIncrementale()
          s.foreachStatements(as => walk(as, as :: s :: Nil, s.clockDomain))
        case s: MemReadWrite if !s.hasTag(crossClockDomain) =>
          if (s.hasTag(classOf[ClockDomainTag])) {
            PendingError(s"Can't add ClockDomainTag to memory ports:\n" + s.getScalaLocationLong)
          }
          walked = GlobalData.get.allocateAlgoIncrementale()
          s.foreachDrivingExpression(as => walk(as, as :: s :: Nil, s.clockDomain))
        case s: MemWrite if !s.hasTag(crossClockDomain) =>
          if (s.hasTag(classOf[ClockDomainTag])) {
            PendingError(s"Can't add ClockDomainTag to memory ports:\n" + s.getScalaLocationLong)
          }
          walked = GlobalData.get.allocateAlgoIncrementale()
          s.foreachDrivingExpression(as => walk(as, as :: s :: Nil, s.clockDomain))
        case _ =>
      }
    })
  }
}


class PhaseRemoveUselessStuff(postClockPulling: Boolean, tagVitals: Boolean) extends PhaseNetlist {

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    val okId = globalData.allocateAlgoIncrementale()

    def propagate(root: Statement, vital: Boolean): Unit = {
      if(root.algoIncrementale == okId) return

      root.algoIncrementale = okId

      val pending = mutable.ArrayStack[Statement](root)

      def propagate(s: Statement) = {
        if(s.algoIncrementale != okId) {
          s.algoIncrementale = okId
          pending.push(s)
        }
      }

      while(pending.nonEmpty){
        val s = pending.pop()
        if(postClockPulling) {
          s.foreachClockDomain(cd => {
            propagate(s.component.pulledDataCache(cd.clock).asInstanceOf[Bool])
            if(cd.hasResetSignal) propagate(s.component.pulledDataCache(cd.reset).asInstanceOf[Bool])
            if(cd.hasSoftResetSignal) propagate(s.component.pulledDataCache(cd.softReset).asInstanceOf[Bool])
            if(cd.hasClockEnableSignal) propagate(s.component.pulledDataCache(cd.clockEnable).asInstanceOf[Bool])
          })
        } else {
          s.foreachClockDomain(cd => {
            propagate(cd.clock)
            if(cd.hasResetSignal) propagate(cd.reset)
            if(cd.hasSoftResetSignal) propagate(cd.softReset)
            if(cd.hasClockEnableSignal) propagate(cd.clockEnable)
          })
        }

        s match {
          case s: BaseType =>
            if(vital)
              s.setAsVital()
            s.foreachStatements(propagate)
          case s: AssignmentStatement =>
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
            s.walkParentTreeStatements(propagate) //Could be walkParentTreeStatementsUntilRootScope but then should symplify removed TreeStatements
          case s: WhenStatement =>
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
          case s: SwitchStatement =>
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
          case s: AssertStatement =>
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
            s.walkParentTreeStatements(propagate)
          case s: Mem[_] => s.foreachStatements{
            case p: MemWrite     => propagate(p)
            case p: MemReadWrite => propagate(p)
            case p: MemReadSync  =>
            case p: MemReadAsync =>
          }
          case s: MemWrite =>
            s.isVital |= vital
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
          case s: MemReadWrite =>
            s.isVital |= vital
            propagate(s.mem)
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
          case s: MemReadSync =>
            s.isVital |= vital
            propagate(s.mem)
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
          case s: MemReadAsync =>
            s.isVital |= vital
            propagate(s.mem)
            s.walkExpression{ case e: Statement => propagate(e) case _ => }
        }
      }
    }

    //Propagate all vital signals (drive toplevel output and blackboxes inputs)
    topLevel.getAllIo.withFilter(bt => !bt.isDirectionLess).foreach(propagate(_, tagVitals))
    walkComponents{
      case c: BlackBox if c.isBlackBox => c.getAllIo.withFilter(_.isInputOrInOut).foreach(propagate(_, tagVitals))
      case c =>
    }

    val keepNamed = !pc.config.removePruned
    walkStatements{
      case s: BaseType => if((keepNamed || s.dontSimplify) && s.isNamed && (s.namePriority >= Nameable.USER_WEAK || s.isVital)) propagate(s, false)
      case s: DeclarationStatement => if(keepNamed && s.isNamed) propagate(s, false)
      case s: AssertStatement      => if(s.kind == AssertStatementKind.ASSERT || pc.config.isSystemVerilog) propagate(s, false)
      case s: TreeStatement        =>
      case s: AssignmentStatement  =>
      case s: MemWrite             =>
      case s: MemReadWrite         =>
      case s: MemReadSync          =>
      case s: MemReadAsync         =>
    }

    walkStatements(s => {
      if(s.algoIncrementale != okId){
        s.removeStatement()
      }
    })

    def removeEmptyChilds(c: Component): Unit ={
      val keep = ArrayBuffer[Component]()
      c.children.foreach { child =>
        removeEmptyChilds(child)
        if(!child.isLogicLess) keep += child
      }
      c.children.clear()
      c.children ++= keep
    }

    if(!keepNamed) removeEmptyChilds(topLevel)
  }
}


class PhaseRemoveIntermediateUnnameds(onlyTypeNode: Boolean) extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._
    val koId = globalData.allocateAlgoIncrementale()

    walkDeclarations(e => e.algoInt = 0)

    //Count the number of driving reference done on each ref.source
    walkDrivingExpression {
      case ref: DeclarationStatement =>
        ref.algoInt += 1
      case _ =>
    }
    /*walkStatements(s => {
      s.walkDrivingExpressions {
        case b: BaseType => println(b, b.head)
        case _ =>
      }
    })*/
    //topLevel.dslBody.walkStatements(s => println(s))
    walkStatements(s => if(s.algoIncrementale != koId){
      s.walkRemapDrivingExpressions {
        case ref: BaseType =>
          if (ref.algoInt == 1 && ref.isComb && ref.isDirectionLess && (!onlyTypeNode || ref.isTypeNode) && ref.canSymplifyIt && Statement.isSomethingToFullStatement(ref) /*&& ref != excepted*/ ) {
            //TODO IR keep it
            ref.algoInt = 0
            val head = ref.head
            ref.algoIncrementale = koId
            head.algoIncrementale = koId
            head.source
          } else {
            ref
          }
        case e => e
      }
    })

    walkStatements{
      case s if s.algoIncrementale == koId =>
        s.removeStatement()
      case s =>
    }
  }
}


class PhaseCompletSwitchCases extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    walkStatements{
      case s: SwitchStatement if s.isFullyCoveredWithoutDefault =>
        if(s.defaultScope != null && !s.defaultScope.isEmpty){
          PendingError(s"UNREACHABLE DEFAULT STATEMENT on \n" + s.getScalaLocationLong)
        }
        s.defaultScope = s.elements.last.scopeStatement
        s.elements.remove(s.elements.length-1)
      case _ =>
    }
  }
}


class PhaseCheckIoBundle extends PhaseCheck{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    walkComponents(c => {
      try{
        val io = c.reflectIo
        if(io != null) for(bt <- io.flatten){
          if(bt.isDirectionLess && !bt.hasTag(allowDirectionLessIoTag)){
            PendingError(s"IO BUNDLE ERROR : A direction less $bt signal was defined into $c component's io bundle\n${bt.getScalaLocationLong}")
          }
        }
      }catch{
        case _ : Throwable =>
      }
    })
  }
}

class PhaseCheckHiearchy extends PhaseCheck{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    //Check hierarchy read/write violation
    walkComponents(c => {
      c.dslBody.walkStatements(s => {
        var error = false

        s match {
          case s : InitialAssignmentStatement =>
          case s: AssignmentStatement =>
            val bt = s.finalTarget

            if (!(bt.isDirectionLess && bt.component == c) && !(bt.isOutputOrInOut && bt.component == c) && !(bt.isInputOrInOut && bt.component.parent == c)) {
              PendingError(s"HIERARCHY VIOLATION : $bt is driven by ${s.source}, but isn't accessible in the $c component.\n${s.getScalaLocationLong}")
              error = true
            }

            if(!error && !bt.isInOut){
              val rootScope = s.rootScopeStatement
              var ptr       = s.parentScope

              while(ptr.parentStatement != null && ptr != rootScope){
                ptr = ptr.parentStatement.parentScope
              }

              if(ptr != rootScope){
                PendingError(s"SCOPE VIOLATION : $bt is assigned outside its declaration scope at \n${s.getScalaLocationLong}")
              }
            }
          case s : MemPortStatement => {
            if(s.mem.component != s.component){
              PendingError(s"SCOPE VIOLATION : memory port $s was created in another component than its memory ${s.mem} \n${s.getScalaLocationLong}")
            }
          }
          case _ =>
        }

        if(!error) s.walkExpression {
          case bt: BaseType =>
            if (!(bt.component == c) && !(bt.isInputOrInOut && bt.component.parent == c) && !(bt.isOutputOrInOut && bt.component.parent == c)) {
              if(bt.component == null || bt.getComponents().head != pc.topLevel){
                PendingError(s"OLD NETLIST RE-USED : $bt is used to drive the $s statement, but was defined in another netlist.\nBe sure you didn't defined a hardware constant as a 'val' in a global scala object.\n${s.getScalaLocationLong}")
              } else {
                PendingError(s"HIERARCHY VIOLATION : $bt is used to drive the $s statement, but isn't readable in the $c component\n${s.getScalaLocationLong}")
              }
            }
          case s : MemPortStatement =>{
            if(s.mem.component != c){
              PendingError(s"OLD NETLIST RE-USED : Memory port $s of memory ${s.mem} is used to drive the $s statement, but was defined in another netlist.\nBe sure you didn't defined a hardware constant as a 'val' in a global scala object.\n${s.getScalaLocationLong}")
            }
          }
          case _ =>
        }
      })

      //Check register defined as component inputs
      c.getAllIo.foreach(bt => if(bt.isInput && bt.isReg){
        PendingError(s"REGISTER DEFINED AS COMPONENT INPUT : $bt is defined as a registered input of the $c component, but isn't allowed.\n${bt.getScalaLocationLong}")
      })
    })
  }
}



class PhaseCheck_noRegisterAsLatch() extends PhaseCheck{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    val regToComb = ArrayBuffer[BaseType]()

    walkStatements{
      case bt: BaseType if bt.isReg && !bt.hasTag(AllowPartialyAssignedTag)=>
        var assignedBits = new AssignedBits(bt.getBitsWidth)

        bt.foreachStatements{
          case s : DataAssignmentStatement =>
            s.target match {
              case bt: BaseType => assignedBits.add(bt.getBitsWidth - 1, 0)
              case e: BitVectorAssignmentExpression =>  assignedBits.add(e.getMaxAssignedBits)
            }
          case _ =>
        }

        if(!assignedBits.isFull){
          var withInit = false
          bt.foreachStatements{
            case s : InitAssignmentStatement => withInit = true
            case _ =>
          }
          if(assignedBits.isEmpty) {
            if(withInit){
              regToComb += bt
              if(bt.isVital && !bt.hasTag(unsetRegIfNoAssignementTag)){
                if(bt.scalaTrace == null){
                  PendingError(s"UNASSIGNED REGISTER $bt with init value, please apply the allowUnsetRegToAvoidLatch tag if that's fine\n${bt.getScalaLocationLong}")
                } else {
                  SpinalWarning(s"UNASSIGNED REGISTER $bt with init value, please apply the allowUnsetRegToAvoidLatch tag if that's fine\n${bt.getScalaLocationLong}")
                }

              }
            }else if(bt.isVital) {
              PendingError(s"UNASSIGNED REGISTER $bt, defined at\n${bt.getScalaLocationLong}")
            }
          }else {
            if(!withInit) {
              val unassignedBits = new AssignedBits(bt.getBitsWidth)
              unassignedBits.add(bt.getBitsWidth - 1, 0)
              unassignedBits.remove(assignedBits)
              PendingError(s"PARTIALLY ASSIGNED REGISTER $bt, unassigned bit mask is ${unassignedBits.toBinaryString}, defined at\n${bt.getScalaLocationLong}")
            }
          }
        }
      case _ =>
    }

    for(bt <- regToComb){
      bt.setAsComb()
      val statements = ArrayBuffer[AssignmentStatement]()

      bt.foreachStatements(statements += _)

      statements.foreach{
        case s: InitAssignmentStatement =>
          s.insertNext(DataAssignmentStatement(s.target, s.source).setScalaLocated(s))
          s.removeStatement()
      }
    }
  }
}



class PhaseCheck_noLatchNoOverride(pc: PhaseContext) extends PhaseCheck{

  override def impl(pc : PhaseContext): Unit = {
    import pc._

    walkComponentsExceptBlackbox(c => {
			//println(c)
      val subInputsPerScope = mutable.HashMap[ScopeStatement, ArrayBuffer[BaseType]]()
      c.children.foreach(_.getAllIo.withFilter(_.isInput).foreach(input => subInputsPerScope.getOrElseUpdate(input.rootScopeStatement, ArrayBuffer[BaseType]()) += input))

      def walkBody(body: ScopeStatement, checkOverlap : Boolean): mutable.HashMap[BaseType, AssignedBits] = {
        val assigneds = mutable.HashMap[BaseType, AssignedBits]()

        def getOrEmpty(bt: BaseType) = assigneds.getOrElseUpdate(bt, new AssignedBits(bt.getBitsWidth))

        def getOrEmptyAdd(bt: BaseType, src: AssignedBits): Boolean = {
          var dst : AssignedBits = null
          var wasExisting = true
          assigneds.get(bt) match {
            case None => {
              dst = new AssignedBits(bt.getBitsWidth)
              assigneds(bt) = dst
              wasExisting = false
            }
            case Some(x) => dst = x
          }
          val ret = src.isFull && wasExisting &&  !bt.hasTag(allowAssignmentOverride)
          dst.add(src)
          ret
        }

        def getOrEmptyAdd3(bt: BaseType, hi: Int, lo: Int): Boolean = {
          var dst : AssignedBits = null
          var wasExisting = true
          assigneds.get(bt) match {
            case None => {
              dst = new AssignedBits(bt.getBitsWidth)
              assigneds(bt) = dst
              wasExisting = false
            }
            case Some(x) => dst = x
          }
          val ret = hi == dst.width-1 && lo == 0 && wasExisting && !bt.hasTag(allowAssignmentOverride)
          dst.add(hi, lo)
          ret
        }

        def getOrEmptyAdd2(bt: BaseType, src: AssignedRange): Boolean = getOrEmptyAdd3(bt, src.hi, src.lo)
        def noPoison(that : AssignmentStatement) = !checkOverlap || (that.source match {
          case lit : Literal if lit.hasPoison() => false
          case _ => true
        })
        body.foreachStatements {
          case s: DataAssignmentStatement =>  //Omit InitAssignmentStatement
            if(!s.finalTarget.isAnalog && noPoison(s)) {
              s.target match {
                case bt: BaseType => if (getOrEmptyAdd3(bt, bt.getBitsWidth - 1, 0) && checkOverlap) {
                  PendingError(s"ASSIGNMENT OVERLAP completely the previous one of $bt\n${s.getScalaLocationLong}")
                }
                case e: BitVectorAssignmentExpression =>
                  val bt = e.finalTarget
                  if (getOrEmptyAdd2(bt, e.getMinAssignedBits) && checkOverlap) {
                    PendingError(s"ASSIGNMENT OVERLAP completely the previous one of $bt\n${s.getScalaLocationLong}")
                  }
              }
            }
          case s: WhenStatement =>
            val whenTrue  = walkBody(s.whenTrue, checkOverlap)
            val whenFalse = walkBody(s.whenFalse, checkOverlap)

            for ((bt, assigned) <- whenTrue) {
              whenFalse.get(bt) match {
                case Some(otherBt) => getOrEmptyAdd(bt, otherBt.intersect(assigned))
                case None => getOrEmpty(bt)
              }
            }
            whenFalse.foreach(p => getOrEmpty(p._1))
          case s: SwitchStatement =>
            val stuffs = if(s.isFullyCoveredWithoutDefault){
              s.elements.map(e => walkBody(e.scopeStatement, checkOverlap))
            } else if(s.defaultScope != null){
              s.elements.map(e => walkBody(e.scopeStatement, checkOverlap)) += walkBody(s.defaultScope, checkOverlap)
            } else {
              s.elements.foreach(e => walkBody(e.scopeStatement, checkOverlap).foreach(e => getOrEmpty(e._1)))
              null
            }

            if(stuffs != null) {
              val mix = mutable.HashMap[BaseType, AssignedBits]()
              for (stuff <- stuffs) {
                for ((bt, assigned) <- stuff) {
                  mix.update(bt, assigned)
                }
              }

              for((bt, assigned) <- mix){
                var continue = true
                val iterator = stuffs.iterator
                while(iterator.hasNext && continue){
                  iterator.next().get(bt) match {
                    case None => {
                      assigned.clear()
                      continue = false
                    }
                    case Some(branch) =>{
                      assigned.intersect(branch)
                    }
                  }
                }
              }

              for ((bt, assigned) <- mix) {
                if(getOrEmptyAdd(bt,assigned) && checkOverlap){
                  PendingError(s"ASSIGNMENT OVERLAP completely the previous one of $bt\n ${s.getScalaLocationLong}")
                }
              }
            }
          case s =>
        }


        def finalCheck(bt : BaseType): Unit ={
          // Hold off until suffix parent is processed
          if (bt.isSuffix)
            return
          if (bt.isInstanceOf[Suffixable]) {
            if (bt.dlcIsEmpty)
              return bt.asInstanceOf[Suffixable].elements.filter(_._2.isInstanceOf[BaseType]).foreach(e => finalCheck(e._2.asInstanceOf[BaseType]))
          }

          val assignedBits = getOrEmpty(bt)
					//println(bt, bt.isVital, !bt.dlcIsEmpty, bt.isComb, bt.rootScopeStatement == body, !assignedBits.isFull)
					//println(bt, bt.isVital, bt.dlcIsEmpty, bt.rootScopeStatement, assignedBits.isFull, bt.isComb)
          if ((bt.isVital || !bt.dlcIsEmpty) && bt.rootScopeStatement == body && !assignedBits.isFull){
            if(bt.isComb) {
	
              val unassignedBits = new AssignedBits(bt.getBitsWidth)

              unassignedBits.add(bt.getBitsWidth - 1, 0)
              unassignedBits.remove(assignedBits)

              if (!unassignedBits.isEmpty) {
                if (bt.dlcIsEmpty) {
									PendingError(s"NO DRIVER ON $bt, defined at\n${bt
									 .getScalaLocationLong}")
								}
                else if (unassignedBits.isFull)
                  PendingError(s"LATCH DETECTED from the combinatorial signal $bt, defined at\n${bt.getScalaLocationLong}")
                else
                  PendingError(s"LATCH DETECTED from the combinatorial signal $bt, unassigned bit mask " +
                    s"is ${unassignedBits.toBinaryString}, defined at\n${bt.getScalaLocationLong}")
              }
            }
          }
        }

        //Final checks usages
        if(!checkOverlap) {
          body.foreachDeclarations {
            case bt: BaseType => finalCheck(bt)
            case _ =>
          }
          subInputsPerScope.get(body).foreach(_.foreach(finalCheck))
        }

        assigneds
      }
      walkBody(c.dslBody, true)
      walkBody(c.dslBody, false)
    })
  }
}



class PhaseGetInfoRTL(prunedSignals: mutable.Set[BaseType], unusedSignals: mutable.Set[BaseType], counterRegisters: Ref[Int], blackboxesSourcesPaths: mutable.LinkedHashSet[String])(pc: PhaseContext) extends PhaseCheck {

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    //    val targetAlgoId = GlobalData.get.algoId
    //    Node.walk(walkNodesDefautStack,node => {node.algoId = targetAlgoId})
    walkStatements{
      case bt: BaseType if !bt.isVital && (!bt.isInstanceOf[BitVector] || bt.asInstanceOf[BitVector].inferredWidth != 0) && !bt.hasTag(unusedTag) && bt.isNamed && !bt.getName().startsWith(globalData.anonymSignalPrefix) =>
        prunedSignals += bt
      case bt: BaseType if bt.isVital && bt.isReg =>
        counterRegisters.value += bt.getBitsWidth
      case _ =>
    }

    walkComponents{
      case bb: BlackBox if bb.isBlackBox => bb.listRTLPath.foreach(path => blackboxesSourcesPaths += path)
      case _            =>
    }

    val usedId = GlobalData.get.allocateAlgoIncrementale()

    walkStatements(s => {
      s.walkDrivingExpressions(e => e.algoIncrementale = usedId)
      s match {
        case s: MemReadSync  => s.algoIncrementale = usedId
        case s: MemReadAsync => s.algoIncrementale = usedId
        case s: MemReadWrite => s.algoIncrementale = usedId
        case s =>
      }
    })

    prunedSignals.foreach(s => {
      if(s.algoIncrementale != usedId) {
        unusedSignals += s
      }
    })
  }
}

class PhasePropagateNames(pc: PhaseContext) extends PhaseMisc {
  override def impl(pc: PhaseContext) : Unit = {
    import pc._


    walkStatements{
      case dst : BaseType => if (dst.isNamed) {
        def explore(bt: BaseType, depth : Int): Unit = {
          bt.foreachStatements{s =>
            s.walkDrivingExpressions{
              case src : BaseType => if(src.isUnnamed){
                src.unsetName()
                src.setWeakName(globalData.anonymSignalPrefix + "_" + dst.getName())
                explore(src, depth + 1)
              }
              case _ =>
            }
          }

        }
        explore(dst, 0)
      }
      case _ =>
    }
  }
}

class PhaseAllocateNames(pc: PhaseContext) extends PhaseMisc{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    for (enumDef <- enums.keys) {
      if (enumDef.isWeak)
        enumDef.setName(globalScope.allocateName(enumDef.getName()))
      else
        globalScope.iWantIt(enumDef.getName(),s"Reserved name ${enumDef.getName()} is not free for ${enumDef.toString()}")
    }


    for((enum, encodings) <- enums;
        encodingsScope = new NamingScope(duplicationPostfix);
        encoding <- encodings){

      reservedKeyWords.foreach(encodingsScope.allocateName(_))
      for (el <- enum.elements) {
        el.setName(encodingsScope.allocateName(el.getName()))
      }
      
      if (encoding.isWeak)
        encoding.setName(encodingsScope.allocateName(encoding.getName()))
      else
        encodingsScope.iWantIt(encoding.getName(),s"Reserved name ${encoding.getName()} is not free for ${encoding.toString()}")
    }

    for (c <- sortedComponents) {
      if (c.isInstanceOf[BlackBox] && c.asInstanceOf[BlackBox].isBlackBox)
        globalScope.lockName(c.definitionName)
      else if(!c.definitionNameNoMerge)
        c.definitionName = globalScope.allocateName(c.definitionName)
    }

    globalScope.lockScope()
    for (c <- sortedComponents) {
      c.allocateNames(pc.globalScope)
    }
		//for (c <- sortedComponents) println(c.getName())
  }
}

class PhaseStdLogicVectorAtTopLevelIo() extends PhaseNetlist {

  override def impl(pc: PhaseContext): Unit = {

    pc.topLevel.rework {

      def wrapIO[T <: BitVector](io: T): Unit = {

        val newIO = Bits(io.getWidth bits)

        newIO.setName(io.getName())
        io.unsetName()

        io.dir match {
          case `in`  =>
            in(newIO)
            io.assignFromBits(newIO)
          case `out` =>
            out(newIO)
            newIO := B(io)
        }

        io.setAsDirectionLess().allowDirectionLessIo
      }

      val ioList = pc.topLevel.getAllIo.toArray

      ioList.foreach {
        case io: UInt if io.isInput | io.isOutput => wrapIO(io)
        case io: SInt if io.isInput | io.isOutput => wrapIO(io)
        case _ =>
      }

    }
  }
}

//class PhaseRemoveComponentThatNeedNoHdlEmit(pc: PhaseContext) extends PhaseNetlist{
//  override def useNodeConsumers = false
//  override def impl(pc : PhaseContext): Unit = {
//    import pc._
//   components.foreach(c => {
//      if (c.nameables.size == 0) { //TODO IR speed
//        if (c.parent != null) c.parent.children -= c
//      }
//    })
//  }
//}
//
//class PhasePrintStates(pc: PhaseContext) extends PhaseMisc{
//  override def useNodeConsumers = false
//  override def impl(pc : PhaseContext): Unit = {
//    import pc._
//    var counter = 0
//    Node.walk(walkNodesDefautStack,_ => counter = counter + 1)
//    SpinalInfo(s"Graph has $counter nodes")
//  }
//}
//


class PhaseCreateComponent(gen: => Component)(pc: PhaseContext) extends PhaseNetlist{

  override def impl(pc: PhaseContext): Unit = {
    import pc._

    val defaultClockDomain = ClockDomain.external("",frequency = config.defaultClockDomainFrequency)
		
    Engine.create {
      val ctx = ClockDomainStack.set(defaultClockDomain)
      native //Avoid unconstructable during phase
      binarySequential
      binaryOneHot
      gen
      ctx.restore()
//      assert(DslScopeStack.get != null, "The SpinalHDL context seems wrong, did you included the idslplugin in your scala build scripts ? This is a Scala compiler plugin, see https://github.com/SpinalHDL/SpinalTemplateSbt/blob/666dcbba79181659d0c736eb931d19ec1dc17a25/build.sbt#L13.")
    }

//    //Ensure there is no prepop tasks remaining, as things can be quite aggresively context switched since the fiber update
//    var hadPrePop = true
//    while(hadPrePop) {
//      hadPrePop = false
//      pc.walkComponents { c =>
//        assert(c.prePopTasks.isEmpty)
////        if (c.prePopTasks.nonEmpty) {
////          c.rework(
////            c.prePop()
////          )
////          hadPrePop = true
////        }
//      }
//    }

    pc.checkGlobalData()
  }
}


/**
  * Initialize all registers not initialized
  */
class PhaseInitReg() extends PhaseNetlist {
  override def impl(pc: PhaseContext): Unit = {
    import pc._

    SpinalProgress("Initialize all registers not initialized")


    walkComponents{ comp =>
      comp.rework{
        comp.dslBody.walkStatements{

          case bt: BaseType if bt.isReg =>

            SpinalInfo(s"Init register ${bt.toString}")

            if(!bt.hasInit){
              bt match{
                case d: SInt                        => d.init(0)
                case d: Bits                        => d.init(0)
                case d: UInt                        => d.init(0)
                case d: Bool                        => d.init(False)
                case d: SpinalEnumCraft[SpinalEnum] => d.init(d.spinalEnum.elements(0))
                case _                              =>
              }
            }

          case _ =>
        }
      }
    }
  }
}


class PhaseDummy(doThat : => Unit) extends PhaseMisc {
  override def impl(pc : PhaseContext): Unit = {
    doThat
  }
}

object SpinalSpinalBoot {
	def apply[T <: Component](config : SpinalConfig)(gen: => T): SpinalReport[T] = {
		try {
			singleShot(config)(gen)
		} catch {
			case e: Exception =>
				println("An error occured, please write better code!")
				System.out.flush()
				throw e
		}
	}
	
	def singleShot[T <: Component](config: SpinalConfig)(gen: => T): SpinalReport[T] = {
		val pc = new PhaseContext(config)
		pc.globalData.phaseContext = pc
		pc.globalData.anonymSignalPrefix = if (config.anonymSignalPrefix == null) "zz" else config.anonymSignalPrefix
		
		val prunedSignals   = mutable.Set[BaseType]()
		val unusedSignals   = mutable.Set[BaseType]()
		val counterRegister = Ref[Int](0)
		val blackboxesSourcesPaths  = new mutable.LinkedHashSet[String]()
		
		SpinalProgress("Elaborate Components")
		
		val phases = ArrayBuffer[Phase]()
		
		phases += new PhaseCreateComponent(gen)(pc)
		phases += new PhaseDummy(SpinalProgress("Checks and transforms"))
		phases ++= config.transformationPhases
		phases ++= config.memBlackBoxers
		if(config.onlyStdLogicVectorAtTopLevelIo){
			phases += new PhaseStdLogicVectorAtTopLevelIo()
		}
		phases += new PhaseDeviceSpecifics(pc)
		phases += new PhaseApplyIoDefault(pc)
		
		phases += new PhaseNameNodesByReflection(pc)
		phases += new PhaseCollectAndNameEnum(pc)
		
		phases += new PhaseCheckIoBundle()
		phases += new PhaseCheckHiearchy()
		phases += new PhaseAnalog()
		phases += new PhaseRemoveUselessStuff(false, false)
		phases += new PhaseRemoveIntermediateUnnameds(true)
		
		phases += new PhasePullClockDomains(pc)
		
		phases += new PhaseInferEnumEncodings(pc,e => e)
		phases += new PhaseInferWidth(pc)
		phases += new PhaseNormalizeNodeInputs(pc)
		phases += new PhaseRemoveIntermediateUnnameds(false)
		phases += new PhaseSimplifyNodes(pc)
		
		phases += new PhaseCompletSwitchCases()
		phases += new PhaseRemoveUselessStuff(true, true)
		phases += new PhaseRemoveIntermediateUnnameds(false)
		
		phases += new PhaseCheck_noLatchNoOverride(pc)
		phases += new PhaseCheck_noRegisterAsLatch()
		phases += new PhaseCheckCombinationalLoops()
		phases += new PhaseCheckCrossClock()
		
		phases += new PhasePropagateNames(pc)
		//phases += new PhaseTest(pc)
		phases += new PhaseAllocateNames(pc)
		phases += new PhaseDevice(pc)
		
		phases += new PhaseModeOfOperation(pc)
		
		phases += new PhaseGetInfoRTL(prunedSignals, unusedSignals, counterRegister, blackboxesSourcesPaths)(pc)
		val report = new SpinalReport[T]()
		report.globalData = pc.globalData
		phases += new PhaseDummy(SpinalProgress("Generate Spinal"))
		phases += new PhaseSpinal(pc, report)
		
		for (phase <- phases) {
			if (config.verbose) SpinalProgress(s"${phase.getClass.getSimpleName}")
			pc.doPhase(phase)
		}
		
		pc.checkGlobalData()
		
		report.toplevel = pc.topLevel.asInstanceOf[T]
		report.prunedSignals ++= prunedSignals
		report.unusedSignals ++= unusedSignals
		report.counterRegister = counterRegister.value
		report.blackboxesSourcesPaths ++= blackboxesSourcesPaths
		
		report
	}
}


object SpinalVhdlBoot{
  def apply[T <: Component](config : SpinalConfig)(gen : => T) : SpinalReport[T] ={
    if(config.debugComponents.nonEmpty){
      return singleShot(config)(gen)
    }
    try {
      singleShot(config)(gen)
    } catch {
      case e: NullPointerException =>
        println(
          """
            |ERROR !
            |A null pointer access has been detected in the JVM.
            |This could happen when in your SpinalHDL description, you access an signal which is only defined further.
            |For instance :
            |  val result = Bool()
            |  result := a ^ b  //a and b can't be accessed there because they are only defined one line below (Software rule of execution order)
            |  val a,b = Bool()
          """.stripMargin)
        System.out.flush()
        throw e
      case e: Throwable => {
        println("\n**********************************************************************************************")
        val errCnt = SpinalError.getErrorCount()
        SpinalWarning(s"Elaboration failed (${errCnt} error" + (if(errCnt > 1){s"s"} else {s""}) + s").\n" +
          s"          Spinal will restart with scala trace to help you to find the problem.")
        println("**********************************************************************************************\n")
        System.out.flush()

        //Fill the ScalaLocated object which had trigger into the scalaLocatedCompoments
        GlobalData.get.applyScalaLocated()

        return singleShot(config.copy(debugComponents = GlobalData.get.scalaLocatedComponents))(gen)
      }
    }
  }

  def singleShot[T <: Component](config: SpinalConfig)(gen: => T): SpinalReport[T] = ScopeProperty.sandbox{
    val pc = new PhaseContext(config)
    pc.globalData.phaseContext = pc
    pc.globalData.anonymSignalPrefix = if(config.anonymSignalPrefix == null) "zz" else config.anonymSignalPrefix

    val prunedSignals   = mutable.Set[BaseType]()
    val unusedSignals   = mutable.Set[BaseType]()
    val counterRegister = Ref[Int](0)
    val blackboxesSourcesPaths  = new mutable.LinkedHashSet[String]()

    SpinalProgress("Elaborate components")

    val phases = ArrayBuffer[Phase]()

    phases += new PhaseCreateComponent(gen)(pc)
    if (config.applyMasking) {
      phases += new PhaseDuplicateLinearComponents(pc)
      phases += new PhaseReplaceNonLinearComponents(pc)
    }
    phases += new PhaseDummy(SpinalProgress("Checks and transforms"))
    phases ++= config.transformationPhases
    phases ++= config.memBlackBoxers
    if(config.onlyStdLogicVectorAtTopLevelIo){
      phases += new PhaseStdLogicVectorAtTopLevelIo()
    }
    phases += new PhaseDeviceSpecifics(pc)
    phases += new PhaseApplyIoDefault(pc)

    phases += new PhaseNameNodesByReflection(pc)
    phases += new PhaseCollectAndNameEnum(pc)

    phases += new PhaseCheckIoBundle()
    phases += new PhaseCheckHiearchy()
    phases += new PhaseAnalog()
    phases += new PhaseRemoveUselessStuff(false, false)
    phases += new PhaseRemoveIntermediateUnnameds(true)

    phases += new PhasePullClockDomains(pc)

    phases += new PhaseInferEnumEncodings(pc,e => e)
    phases += new PhaseInferWidth(pc)
    phases += new PhaseNormalizeNodeInputs(pc)
    phases += new PhaseRemoveIntermediateUnnameds(false)
    phases += new PhaseSimplifyNodes(pc)

    phases += new PhaseCompletSwitchCases()
    phases += new PhaseRemoveUselessStuff(true, true)
    phases += new PhaseRemoveIntermediateUnnameds(false)
	
		//phases += new PhaseTest(pc)
    phases += new PhaseCheck_noLatchNoOverride(pc)
    phases += new PhaseCheck_noRegisterAsLatch()
    phases += new PhaseCheckCombinationalLoops()
    phases += new PhaseCheckCrossClock()

    phases += new PhasePropagateNames(pc)
    phases += new PhaseAllocateNames(pc)
    phases += new PhaseDevice(pc)
    if (config.applyMasking) {
      phases += new PhaseApplyMasking(pc)
    }

    phases += new PhaseGetInfoRTL(prunedSignals, unusedSignals, counterRegister, blackboxesSourcesPaths)(pc)
    val report = new SpinalReport[T]()
    report.globalData = pc.globalData
    phases += new PhaseDummy(SpinalProgress("Generate VHDL"))
    phases += new PhaseVhdl(pc, report)

    for(inserter <-config.phasesInserters){
      inserter(phases)
    }

    for(phase <- phases){
      if(config.verbose) SpinalProgress(s"${phase.getClass.getSimpleName}")
      pc.doPhase(phase)
    }

    if(prunedSignals.nonEmpty){
      SpinalWarning(s"${prunedSignals.size} signals were pruned. You can call printPruned on the backend report to get more informations.")
    }

    pc.checkGlobalData()

//    SpinalInfo(s"Number of registers : ${counterRegister.value}")


    report.toplevel = pc.topLevel.asInstanceOf[T]
    report.prunedSignals ++= prunedSignals
    report.unusedSignals ++= unusedSignals
    report.counterRegister = counterRegister.value
    report.blackboxesSourcesPaths ++= blackboxesSourcesPaths

    report
  }
}



object SpinalVerilogBoot{

  def apply[T <: Component](config: SpinalConfig)(gen: => T): SpinalReport[T] ={
    if(config.debugComponents.nonEmpty){
      return singleShot(config)(gen)
    }
    try {
      singleShot(config)(gen)
    } catch {
      case e: NullPointerException =>
        println(
          """
            |ERROR !
            |A null pointer access has been detected in the JVM.
            |This could happen when in your SpinalHDL description, you access an signal which is only defined further.
            |For instance :
            |  val result = Bool()
            |  result := a ^ b  //a and b can't be accessed there because they are only defined one line below (Software rule of execution order)
            |  val a,b = Bool()
          """.stripMargin)
        System.out.flush()
        throw e
      case e: Throwable => {
        println("\n**********************************************************************************************")
        val errCnt = SpinalError.getErrorCount()
        SpinalWarning(s"Elaboration failed (${errCnt} error" + (if(errCnt > 1){s"s"} else {s""}) + s").\n" +
          s"          Spinal will restart with scala trace to help you to find the problem.")
        println("**********************************************************************************************\n")
        System.out.flush()

        //Fill the ScalaLocated object which had trigger into the scalaLocatedCompoments
        GlobalData.get.applyScalaLocated()
        return singleShot(config.copy(debugComponents = GlobalData.get.scalaLocatedComponents))(gen)
      }
    }
  }

  def singleShot[T <: Component](config: SpinalConfig)(gen : => T): SpinalReport[T] = ScopeProperty.sandbox{
    val pc = new PhaseContext(config)
    pc.globalData.phaseContext = pc
    pc.globalData.anonymSignalPrefix = if(config.anonymSignalPrefix == null) "_zz" else config.anonymSignalPrefix

    val prunedSignals    = mutable.Set[BaseType]()
    val unusedSignals    = mutable.Set[BaseType]()
    val counterRegister  = Ref[Int](0)
    val blackboxesSourcesPaths  = new mutable.LinkedHashSet[String]()

    SpinalProgress("Elaborate components")

    val phases = ArrayBuffer[Phase]()

    phases += new PhaseCreateComponent(gen)(pc)
    phases += new PhaseDummy(SpinalProgress("Checks and transforms"))
    phases ++= config.transformationPhases
    phases ++= config.memBlackBoxers
    phases += new PhaseDeviceSpecifics(pc)
    phases += new PhaseApplyIoDefault(pc)

    phases += new PhaseNameNodesByReflection(pc)
    phases += new PhaseCollectAndNameEnum(pc)

    phases += new PhaseCheckIoBundle()
    phases += new PhaseCheckHiearchy()
    phases += new PhaseAnalog()
    phases += new PhaseRemoveUselessStuff(false, false)
    phases += new PhaseRemoveIntermediateUnnameds(true)

    phases += new PhasePullClockDomains(pc)

    phases += new PhaseInferEnumEncodings(pc,e => if(e == `native`) binarySequential else e)
    phases += new PhaseInferWidth(pc)
    phases += new PhaseNormalizeNodeInputs(pc)
    phases += new PhaseRemoveIntermediateUnnameds(false)
    phases += new PhaseSimplifyNodes(pc)

    phases += new PhaseCompletSwitchCases()
    phases += new PhaseRemoveUselessStuff(true, true)
    phases += new PhaseRemoveIntermediateUnnameds(false)

    phases += new PhaseCheck_noLatchNoOverride(pc)
    phases += new PhaseCheck_noRegisterAsLatch()
    phases += new PhaseCheckCombinationalLoops()
    phases += new PhaseCheckCrossClock()

    phases += new PhasePropagateNames(pc)
    phases += new PhaseAllocateNames(pc)
    phases += new PhaseDevice(pc)
    //phases += new PhaseApplyMasking(pc)

    phases += new PhaseGetInfoRTL(prunedSignals, unusedSignals, counterRegister, blackboxesSourcesPaths)(pc)

    phases += new PhaseDummy(SpinalProgress("Generate Verilog"))

    val report = new SpinalReport[T]()
    report.globalData = pc.globalData
    phases += new PhaseVerilog(pc, report)

    for(inserter <-config.phasesInserters){
      inserter(phases)
    }

    for(phase <- phases){
      if(config.verbose) SpinalProgress(s"${phase.getClass.getSimpleName}")
      pc.doPhase(phase)
    }

    if(prunedSignals.nonEmpty){
      SpinalWarning(s"${prunedSignals.size} signals were pruned. You can call printPruned on the backend report to get more informations.")
    }

//    SpinalInfo(s"Number of registers : ${counterRegister.value}")

    pc.checkGlobalData()
    report.toplevel = pc.topLevel.asInstanceOf[T]
    report.prunedSignals ++= prunedSignals
    report.unusedSignals ++= unusedSignals
    report.counterRegister = counterRegister.value
    report.blackboxesSourcesPaths ++= blackboxesSourcesPaths

    report
  }
}
