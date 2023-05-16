package spinal.core

import scala.collection.mutable
import scala.collection.mutable.{ArrayBuffer, HashMap}

/*trait SharingType
object marked extends SharingType					// Only marked inputs and signals are shared
object allInputs extends SharingType			// All inputs/outputs are shared, and all signals that read from/write to one of the input/output signals
object nonBoolInputs extends SharingType	// All inputs/outputs that are not boolean (i.e. no control signals), and internal signals that read/write shared inout singals

trait RandLocation
object onDevice extends RandLocation 		// Instantiate PRNG on the device
object external extends RandLocation		// Use an external PRNG

case class NonLinearReplacement (filePath 		: String = ".",		// Path to the masked sbox
																 randomness 	: Int = 0,				// Needed randomness per sbox and cycle
																 extraLatency : Int = 0) {}			// Additional latency of the masked sbox

case class RandSource (location : RandLocation = onDevice,	// Randomness instantiated on the device or external
											 filePath : String = ".") {}					// If on device, code for randomness generator

case class MaskingConfig(applyMasking 					: Boolean = false,							// Should masking be applied?
												 numShares 							: Int = 2,											// Number of shares
												 sharingType 						: SharingType = nonBoolInputs,	// How inputs are shared
												 //nonLinearReplacements 	: ArrayBuffer[NonLinearReplacement] = ArrayBuffer[NonLinearReplacement],	// Masked sboxes as replacements
												 randSource 						: RandSource = RandSource()			// Source for fresh randomness for the sboxes
												) {}*/


case class NonLinearModule (name : String = "",
														randomness : Int = 0,
														randomnessName : String = "",
														latency : Int = 0
													 ) {}

case class MaskingConfig (applyMasking : Boolean = false,
													numShares : Int = 2,
													nonLinearModules : mutable.HashMap[String, NonLinearModule] = mutable.HashMap[String, NonLinearModule]()
												 ) {}