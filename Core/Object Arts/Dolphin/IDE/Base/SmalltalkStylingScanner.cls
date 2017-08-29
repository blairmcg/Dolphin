"Filed out from Dolphin Smalltalk 7"!

SmalltalkScanner subclass: #SmalltalkStylingScanner
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SmalltalkStylingScanner guid: (GUID fromString: '{70ef9a14-3293-4d33-968e-87e0a406b952}')!
SmalltalkStylingScanner comment: 'SmalltalkStylingScanner is a <SmalltalkScanner> specialized for the purpose of real-time syntax colouring. It differs from its superclass in two ways:
- It is tolerant of lexical errors, and returns error tokens rather than raising exceptions. This is appropriate for scanning source text that is being edited, since at any time it may be in an incomplete state.
- When scanning numbers it does not convert them from a string to a numberical value unless required. This avoids a perf issue should someone enter a number literal that takes a long time to compute, e.g. 1e30000'!
!SmalltalkStylingScanner categoriesForClass!Development! !
!SmalltalkStylingScanner methodsFor!

illegalNumber: anInteger
	self lexicalError: LErrBadNumber range: (anInteger to: self errorPosition)!

lexicalError: anInteger range: anInterval
	"Private - Evaluate the error block passing it an appropriately initialised <exception>.
	If the block returns, signal the exception."

	"Implementation Note: The error is ignored, and recovered from by creating an appropriate error token."

	!

numberTokenClass
	^StNumberStylingToken! !
!SmalltalkStylingScanner categoriesFor: #illegalNumber:!error handling!private! !
!SmalltalkStylingScanner categoriesFor: #lexicalError:range:!error handling!private! !
!SmalltalkStylingScanner categoriesFor: #numberTokenClass!public! !

