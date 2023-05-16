package spinal.core.internals

import spinal.core._

import scala.collection.mutable
import scala.collection.mutable.ArrayBuffer

class ComponentEmitterSpinal(
	val c : Component,
	pc : PhaseContext
) extends ComponentEmitter {
	
	override def component = c
	
	val portMaps 	= ArrayBuffer[String]()
	val declarations = ArrayBuffer[String]()
	val assignments = ArrayBuffer[String]()
	
	val topScope = c.dslBody
	
	def result: String = {
		val ret = new StringBuilder()
		
		//ret ++= s"package Tests\n\n"
		//ret ++= s"import spinal.core._\n\n"
		//val componentName = if (c == pc.topLevel) s"${c.definitionName}_${pc.config.modeConfig.mode.toString}" else c.definitionName
		val componentName = if (c == pc.topLevel) s"${c.definitionName}_toSpinal" else c.definitionName
		ret ++= s"class ${componentName} extends Component {\n"
		
		ret ++= s"\tval io = new Bundle {\n"
		
		for (port <- portMaps) {
			ret ++= s"${port}\n"
		}
		
		
		ret ++= s"\t}\n\n"
		
		ret ++= s"\tval CA = new ClockingArea(ClockDomain(clock = io.clk, reset = io.reset))\n\t{\n"
		for (sub <- c.children) {
			if (sub.getName().startsWith("CA_"))
				ret ++= s"\t\tval ${sub.getName().drop(3)} = new ${sub.definitionName}\n"
			else
				ret ++= s"\t\tval ${sub.getName()} = new ${sub.definitionName}\n"
		}
		ret ++= s"\n"
		
		ret ++= emitDefinitions()
		
		/*for (decl <- declarations) {
			ret ++= s"${decl}"
		}
		
		for (ass <- assignments) {
			ret ++= s"${ass}"
		}*/
		
		ret ++= s"\t}\n"
		ret ++= s"}\n\n\n"
		
		ret.toString()
	}
	
	def emitIO(): Unit = {
		c.getOrdredNodeIo.foreach(bt =>
			if (!bt.isSuffix && !((bt.getName() == "clk") || (bt.getName() ==
			 "reset") || (bt.getName().contains("reset_")) || (bt.getName().contains("clk_")))) {
				portMaps += s"\t\tval ${getIoName(bt)} = ${emitDirection(bt)} " +
				 s"${emitDataType(bt)}"
			}
		)
	}
	
	def getIoName(bt: BaseType): String = {
		if (bt.isIo && bt.getName().contains("io_"))
			bt.getName().drop(3)
		else
			""
	}
	
	//def getComponent()
	
	def getName(bt: BaseType): String = {
		var name = ""
		if (bt.component != c) {
			name ++= s"${bt.component.getName()}."
			if (name.startsWith("CA_")) name = name.drop(3)
		}
		if (bt.isIo && bt.getName().startsWith("io_")) {
			name ++= "io." + (bt.getName().drop(3))
		}
		else {
			if (bt.getName().startsWith("CA_"))
				name ++= bt.getName().drop(3)
			else
				name ++= bt.getName()
		}
		name
	}
	
	def emitDirection(baseType: BaseType): String = baseType.dir match {
		case `in` 		=> "in "
		case `out` 		=> "out"
		case `inout`	=> "inout"
		case _ 				=> throw new Exception("Unknown direction"); ""
	}
	
	def emitDataType(node: Expression, constrained: Boolean = true): String = node match {
		case bool: Bool => s"Bool()"
		case uint: UInt => s"UInt(${emitSize(uint)})"
		case sint: SInt => s"SInt(${emitSize(sint)})"
		case bits: Bits => s"Bits(${emitSize(bits)})"
	}
	
	def emitSize(node: WidthProvider): String = {
		s"${node.getWidth} bits"
	}
	
	def emitDefinitions(): String = {
		var indent = 2
		var ret = ""
		//component.dslBody.walkStatements(s => println(s, s.parentScope))
		component.dslBody.walkStatements (s => ret += emitStatement(s, indent, topScope))
		ret
	}
	
	def emitStatement(s: Statement, indent: Int, scope: ScopeStatement): String = {
		s match {
			case d: DeclarationStatement => emitDeclaration(d, indent)
			case a: AssignmentStatement => {
				a match {
					case i: InitAssignmentStatement => emitInitAssignment(i, indent)
					case d: DataAssignmentStatement => emitAssignment(d, indent, scope)
				}
			}
			case w: WhenStatement => emitWhenStatement(w, s"${"\t"*indent}when " , indent, scope)
			case _ => ""//println("Something else")
		}
	}
	
	def emitDeclaration(d: DeclarationStatement, ind: Int): String = {
		val bt = d.asInstanceOf[BaseType]
		if (!(bt.isIo) && !(bt.isReg)) {
			s"${"\t"*ind}val ${getName(bt)} = ${emitDataType(bt)}\n"
		} else if (bt.isReg && !bt.hasInit) {
			s"${"\t"*ind}val ${getName(bt)} = Reg(${emitDataType(bt)})\n"
		} else ""
	}
	
	def emitInitAssignment(s: InitAssignmentStatement, ind: Int): String = {
		var ret: String = s"${"\t"*ind}val "
		s.target match {
			case bt: BaseType => {
				ret += s"${getName(bt)} = "
				if (bt.isReg) ret += s"Reg(${emitDataType(bt)})"
				else ret += s"${emitDataType(bt)}"
			}
		}
		s.source match {
			case b: BoolLiteral => {
				val tf = if (b.value) "True" else "False"
				ret += s" init(${tf})\n"
			}
			case b: BitVectorLiteral => ret += s" init(${b.value})\n"
		}
		ret
	}
	
	def emitAssignment(d: DataAssignmentStatement, ind: Int, scope: ScopeStatement): String = {
		var ret = s"${"\t"*ind}"
		d.target match {
			case bt: BaseType => ret += s"${getName(bt)} := "
			case bt: BitAssignmentFixed => ret += s"${dispatchExpression(bt.out)}(${bt.bitId}) := "
			case bt: BitAssignmentFloating => ret += s"${dispatchExpression(bt.out)}(${dispatchExpression(bt.bitId)}) := "
			case bt: RangedAssignmentFixed => ret += s"${dispatchExpression(bt.out)}(${bt.hi} downto ${bt.lo}) := "
			case bt: RangedAssignmentFloating => ret += s"${dispatchExpression(bt.out)}(${bt.bitCount-1} + ${dispatchExpression(bt.offset)} downto ${dispatchExpression(bt.offset)} := )"
		}
		
		ret += s"${dispatchExpression(d.source)}\n"
		
		if (d.parentScope == scope)	ret else ""
	}
	
	def emitWhenStatement(w: WhenStatement, s: String, ind: Int, scope: ScopeStatement): String = {
		var ret = ""
		ret += s"${s}(${dispatchExpression(w.cond)}) {\n"
		
		w.whenTrue.walkStatements(s => ret += emitStatement(s, ind+1, w.whenTrue))
		
		ret += s"${"\t"*ind}}"
		
		if (w.whenFalse.head != null) {
			w.whenFalse.head match {
				case ws: WhenStatement =>
					ret += emitWhenStatement(ws, " elsewhen ", ind, w.whenFalse)
				case _ => {
					ret += " otherwise {\n"
					w.whenFalse.walkStatements(s => ret += emitStatement(s, ind + 1, w.whenFalse))
					ret += s"${"\t"*ind}}"
				}
			}
		} else ret += "\n"
		
		ret += "\n"
		if (w.parentScope == scope) ret else ""
	}
	
	override def algoIdIncrementalBase: Int = ???
	
	override def mergeAsyncProcess: Boolean = ???
	
	override def wrapSubInput(io: BaseType): Unit = ???
	
	def dispatchExpression(e: Expression): String = {
		e match {
			case 	e: BaseType => getName(e)
			
			/*Assignments*/
			case  e: BoolLiteral => s"${if(e.value) "True" else "False"}"
			case  e: BitsLiteral => s"${e.value}"
			case  e: UIntLiteral => s"${e.value}"
			case  e: SIntLiteral => s"${e.value}"
			
			/*Unsigned*/
			//Arithmetic
			case  e: Operator.UInt.Add 	=> outputBinaryOperation(e, "+")
			case  e: Operator.UInt.Sub  => outputBinaryOperation(e, "-")
			case  e: Operator.UInt.Mul  => outputBinaryOperation(e, "*")
			case  e: Operator.UInt.Div  => outputBinaryOperation(e, "/")
			case  e: Operator.UInt.Mod  => outputBinaryOperation(e, "%")
			
			//Bitwise
			case  e: Operator.UInt.Or  	=> outputBinaryOperation(e, "|")
			case  e: Operator.UInt.And  => outputBinaryOperation(e, "&")
			case  e: Operator.UInt.Xor  => outputBinaryOperation(e, "^")
			case  e: Operator.UInt.Not  => outputUnaryOperation(e, "~")
			
			//Comparisons
			case  e: Operator.UInt.Equal 					=> outputBinaryOperation(e, "===")
			case  e: Operator.UInt.NotEqual 			=> outputBinaryOperation(e, "=/=")
			case  e: Operator.UInt.Smaller 				=> outputBinaryOperation(e, "<")
			case  e: Operator.UInt.SmallerOrEqual => outputBinaryOperation(e, "<=")
			
			//Shifts
			case  e: Operator.UInt.ShiftLeftByInt 						=> s"(${dispatchExpression(e.source)} << ${e.shift})"
			case  e: Operator.UInt.ShiftRightByInt 						=> s"(${dispatchExpression(e.source)} >> ${e.shift})"
			case  e: Operator.UInt.ShiftRightByUInt 					=> outputBinaryOperation(e, ">>")
			case  e: Operator.UInt.ShiftLeftByUInt 						=> outputBinaryOperation(e, "<<")
			case  e: Operator.UInt.ShiftRightByIntFixedWidth	=> s"(${dispatchExpression(e.source)} |>> ${e.shift})"
			case  e: Operator.UInt.ShiftLeftByIntFixedWidth		=> s"(${dispatchExpression(e.source)} |<< ${e.shift})"
			case  e: Operator.UInt.ShiftLeftByUIntFixedWidth 	=> outputBinaryOperation(e, "|<<")
			
			/*Signed*/
			//Arithmetic
			case  e: Operator.SInt.Add 	=> outputBinaryOperation(e, "+")
			case  e: Operator.SInt.Sub  => outputBinaryOperation(e, "-")
			case  e: Operator.SInt.Mul  => outputBinaryOperation(e, "*")
			case  e: Operator.SInt.Div  => outputBinaryOperation(e, "/")
			case  e: Operator.SInt.Mod  => outputBinaryOperation(e, "%")
			
			//Bitwise
			case  e: Operator.SInt.Or  	=> outputBinaryOperation(e, "|")
			case  e: Operator.SInt.And  => outputBinaryOperation(e, "&")
			case  e: Operator.SInt.Xor  => outputBinaryOperation(e, "^")
			case  e: Operator.SInt.Not  => outputUnaryOperation(e, "~")
			
			//Comparison
			case  e: Operator.SInt.Equal 					=> outputBinaryOperation(e, "===")
			case  e: Operator.SInt.NotEqual 			=> outputBinaryOperation(e, "=/=")
			case  e: Operator.SInt.Smaller 				=> outputBinaryOperation(e, "<")
			case  e: Operator.SInt.SmallerOrEqual => outputBinaryOperation(e, "<=")
			
			//Shifts
			case  e: Operator.SInt.ShiftLeftByInt 						=> s"(${dispatchExpression(e.source)} << ${e.shift})"
			case  e: Operator.SInt.ShiftRightByInt 						=> s"(${dispatchExpression(e.source)} >> ${e.shift})"
			case  e: Operator.SInt.ShiftRightByUInt 					=> outputBinaryOperation(e, ">>")
			case  e: Operator.SInt.ShiftLeftByUInt 						=> outputBinaryOperation(e, "<<")
			case  e: Operator.SInt.ShiftRightByIntFixedWidth	=> s"(${dispatchExpression(e.source)} |>> ${e.shift})"
			case  e: Operator.SInt.ShiftLeftByIntFixedWidth		=> s"(${dispatchExpression(e.source)} |<< ${e.shift})"
			case  e: Operator.SInt.ShiftLeftByUIntFixedWidth 	=> outputBinaryOperation(e, "|<<")
			
			/*Bits*/
			//Logic
			case  e: Operator.Bits.Cat 	=> outputBinaryOperation(e, "##")
			
			case  e: Operator.Bits.Or  	=> outputBinaryOperation(e, "|")
			case  e: Operator.Bits.And  => outputBinaryOperation(e, "&")
			case  e: Operator.Bits.Xor  => outputBinaryOperation(e, "^")
			case  e: Operator.Bits.Not  => outputUnaryOperation(e, "~")
			
			case  e: Operator.Bits.Equal 					=> outputBinaryOperation(e, "===")
			case  e: Operator.Bits.NotEqual 			=> outputBinaryOperation(e, "=/=")
			
			//Shifts
			case  e: Operator.Bits.ShiftLeftByInt 						=> s"(${dispatchExpression(e.source)} << ${e.shift})"
			case  e: Operator.Bits.ShiftRightByInt 						=> s"(${dispatchExpression(e.source)} >> ${e.shift})"
			case  e: Operator.Bits.ShiftRightByUInt 					=> outputBinaryOperation(e, ">>")
			case  e: Operator.Bits.ShiftLeftByUInt 						=> outputBinaryOperation(e, "<<")
			case  e: Operator.Bits.ShiftRightByIntFixedWidth	=> s"(${dispatchExpression(e.source)} |>> ${e.shift})"
			case  e: Operator.Bits.ShiftLeftByIntFixedWidth		=> s"(${dispatchExpression(e.source)} |<< ${e.shift})"
			case  e: Operator.Bits.ShiftLeftByUIntFixedWidth 	=> outputBinaryOperation(e, "|<<")
			
			/*Bool*/
			case  e: Operator.Bool.Equal 		=> outputBinaryOperation(e, "===")
			case  e: Operator.Bool.NotEqual	=> outputBinaryOperation(e, "=/=")
			
			case  e: Operator.Bool.Not 			=> outputUnaryOperation(e, "~")
			case  e: Operator.Bool.And 			=> outputBinaryOperation(e, "&")
			case  e: Operator.Bool.Or 			=> outputBinaryOperation(e, "|")
			case  e: Operator.Bool.Xor 			=> outputBinaryOperation(e, "^")
			
			//Cast
			case  e: CastSIntToBits => s"B(${dispatchExpression(e.input)})"
			case 	e: CastSIntToUInt => s"U(${dispatchExpression(e.input)})"
			case 	e: CastUIntToBits => s"B(${dispatchExpression(e.input)})"
			case 	e: CastUIntToSInt => s"S(${dispatchExpression(e.input)})"
			case 	e: CastBitsToUInt => s"U(${dispatchExpression(e.input)})"
			case  e: CastSIntToBits => s"B(${dispatchExpression(e.input)})"
			case  e: CastBoolToBits => s"B(${dispatchExpression(e.input)})"
			
			/*Misc*/
			case  e: ResizeBits	=> s"(${dispatchExpression(e.input)}.resize(${e.size}))"
			case  e: ResizeUInt => s"(${dispatchExpression(e.input)}.resize(${e.size}))"
			case  e: ResizeBits => s"(${dispatchExpression(e.input)}.resize(${e.size}))"
			
			case  e: BitVectorBitAccessFixed 				=> s"${dispatchExpression(e.source)}(${e.bitId})"
			case  e: BitVectorBitAccessFloating 		=> s"${dispatchExpression(e.source)}(${dispatchExpression(e.bitId)})"
			case  e: BitVectorRangedAccessFixed			=> s"${dispatchExpression(e.source)}(${e.hi} downto ${e.lo})"
			case  e: BitVectorRangedAccessFloating	=> s"${dispatchExpression(e.source)}(${dispatchExpression(e.offset)+(e.size)} downto ${e.size})"
			
			//Default
			//case 	_ => "N"
		}
	}
	
	def outputUnaryOperation(e: UnaryOperator, vhd: String): String = {
		s"($vhd${dispatchExpression(e.source)})"
	}
	
	def outputBinaryOperation(e: BinaryOperator, vhd: String): String = {
		s"(${dispatchExpression(e.left)} $vhd ${dispatchExpression(e.right)})"
	}
	
	emitIO()
	//emitDefinitions()
}

