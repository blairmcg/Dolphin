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

lexicalError: anInteger range: anInterval
	"Private - Evaluate the error block passing it an appropriately initialised <exception>.
	If the block returns, signal the exception."

	"Implementation Note: The error is ignored, and recovered from by creating an appropriate error token."

	!

newNumberToken: numberClass
	| stop |
	stop := self previousStepPosition.
	^(self numberTokenClass
		start: tokenStart
		comments: nil
		value: nil
		stop: stop
		source: (stream copyFrom: tokenStart to: stop))
		numberClass: numberClass;
		yourself!

numberTokenClass
	^StNumberStylingToken!

scanExponentInteger: anInteger
	"Private - Allow plus prefix on exponent, e.g. 2e+16, although not strictly Smalltalk syntax."

	| pos isNegative numberClass |
	pos := stream position.
	self step.
	((isNegative := currentCharacter == $-) or: [currentCharacter == $+]) ifTrue: [self step].
	numberClass := Integer.
	(self readIntegerOfRadix: 10)
		ifNotNil: 
			[:exp |
			exp > Number maxLiteralIntegerExponent ifTrue: [^self illegalNumber: anInteger].
			(isNegative and: [exp ~~ 0]) ifTrue: [numberClass := Fraction]]
		ifNil: [self stepBackTo: pos].
	^self newNumberToken: numberClass!

scanIntegerOfRadix: anInteger
	| count |
	count := 0.
	[self atEnd] whileFalse: 
			[| digit |
			((digit := currentCharacter digitValue) < anInteger and: [digit >= 0])
				ifTrue: 
					[self step.
					count := count + 1]
				ifFalse: [^count]].
	^count!

scanNumber
	| numberClass start int |
	start := stream position.
	currentCharacter == $-
		ifTrue: 
			["isNegative := true."
			self step].
	(int := self readIntegerOfRadix: 10)
		ifNil: 
			["This should not happen since we have previously detected a digit"
			^self error: 'internal error'].
	self atEnd ifTrue: [^self newNumberToken: Integer].
	"The type of number is determined by what we find next"
	numberClass := Integer.
	currentCharacter == $.
		ifTrue: [numberClass := self scanSmalltalkReal]
		ifFalse: 
			[currentCharacter == $r
				ifTrue: 
					[| radix |
					radix := int.
					(radix between: 2 and: 36)
						ifTrue: 
							[| pos |
							pos := stream position.
							self step.
							(self scanIntegerOfRadix: radix) ~~ 0
								ifTrue: [currentCharacter == $e ifTrue: [^self scanExponentInteger: start]]
								ifFalse: [self stepBackTo: pos]]]
				ifFalse: 
					[currentCharacter == $s
						ifTrue: 
							[self step.	"s will always be part of token, regardless if there is a scale value"
							self scanIntegerOfRadix: 10.
							numberClass := ScaledDecimal]
						ifFalse: 
							["Also support St-80 format integer of the form 1e5, not valid ANSI syntax though"
							currentCharacter == $e ifTrue: [^self scanExponentInteger: start]]]].
	^self newNumberToken: numberClass!

scanSmalltalkReal
	(self classify: stream peek) == #digit
		ifFalse: 
			["Trailing full stop on integer"
			^Integer].
	self step.
	self scanIntegerOfRadix: 10.

	"Process any exponent..."
	(currentCharacter == $e or: [currentCharacter == $d or: [currentCharacter == $q]])
		ifTrue: 
			[| exponentStart |
			exponentStart := stream position.
			self step.	"Skip the exponent character"
			"Allow plus prefix on the exponent, although not ANSI Smalltalk syntax"
			(currentCharacter == $- or: [currentCharacter == $+]) ifTrue: [self step].
			(self scanIntegerOfRadix: 10) == 0
				ifTrue: 
					["Found Float with trailing exponent character which is not
					 part of the number, e.g. 1.5e From ANSI standard p 28: 'An
					 exponentLetter must be followed by an explicit exponent'"
					self stepBackTo: exponentStart]]
		ifFalse: 
			[currentCharacter == $s
				ifTrue: 
					[self step.	"Skip the $s"
					self scanIntegerOfRadix: 10.
					^ScaledDecimal]].
	^Float!

stepBackTo: exponentStart 
	stream position: exponentStart - 1.
	self step! !
!SmalltalkStylingScanner categoriesFor: #lexicalError:range:!error handling!private! !
!SmalltalkStylingScanner categoriesFor: #newNumberToken:!private! !
!SmalltalkStylingScanner categoriesFor: #numberTokenClass!public! !
!SmalltalkStylingScanner categoriesFor: #scanExponentInteger:!private!scanning! !
!SmalltalkStylingScanner categoriesFor: #scanIntegerOfRadix:!private!scanning! !
!SmalltalkStylingScanner categoriesFor: #scanNumber!public!scanning! !
!SmalltalkStylingScanner categoriesFor: #scanSmalltalkReal!public!scanning! !
!SmalltalkStylingScanner categoriesFor: #stepBackTo:!private! !

