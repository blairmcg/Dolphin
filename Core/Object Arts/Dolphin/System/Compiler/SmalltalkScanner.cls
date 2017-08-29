"Filed out from Dolphin Smalltalk 7"!

Object subclass: #SmalltalkScanner
	instanceVariableNames: 'stream buffer tokenStart currentCharacter characterType classificationTable separatorsInLiterals extendedLiterals comments errorBlock nameSpaceCharacter line errorHandler environment'
	classVariableNames: 'ClassificationTable EscapeChars PatternVariableCharacter'
	poolDictionaries: 'SmalltalkParseErrorCodes'
	classInstanceVariableNames: ''!
SmalltalkScanner guid: (GUID fromString: '{f76f2335-9125-488e-a570-5a759a6e67b7}')!
SmalltalkScanner addClassConstant: 'ClassificationTable' value: #(nil nil nil nil nil nil nil nil #separator #separator #separator #separator #separator nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil #separator #binary nil nil nil #binary #binary nil #special #special #binary #binary #binary #binary #special #binary #digit #digit #digit #digit #digit #digit #digit #digit #digit #digit #special #special #binary #binary #binary #binary #binary #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #special #binary #special #special #alphabetic nil #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #alphabetic #special #binary #special #binary nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil)!
SmalltalkScanner comment: 'SmalltalkScanner is the Smalltalk lexical analyzer. It converts source text to a stream of <StToken>''s.

Note that SmalltalkScanner is based on the RBScanner class written by John Brant and Don Roberts for their Refactoring Browser. It has been extended for Dolphin to incorporate additional error reporting capabilities (such as the line number on which the error occurred), and the ability to parse Dolphin''s FFI call syntax.

Instance Variables:
	stream				<ReadStream> Input stream (method/expression source)
	buffer				<WriteStream> Token building buffer.
	tokenStart			<integer> position in stream at which current token starts.
	currentCharacter		<Character> last character read from stream.
	characterType		<Symbol>. Symbolic type of last character read from stream.
	classificationTable	<Array> of <Symbol>. Symbolic types of each possible character (one slot per code point).
	separatorsInLiterals	<boolean>. Whether to allow whitespace in literal constants.
	extendedLiterals		<boolean>. Whether extended literal constants (prefixed with ##) are parsed.
	comments			<OrderedCollection> of <Interval>. Ranges of the source occuppied by comments.
	errorBlock			<dyadicValuable> evaluated on encountering lexical errors
	nameSpaceCharacter	<Character>. Namespace separator character (not currently used on Dolphin)
	line					<integer> line number of current token.

Class Instance Variables:
	classificationTable	<Array>. Used to classify characters into types.

'!
!SmalltalkScanner categoriesForClass!System-Compiler! !
!SmalltalkScanner methodsFor!

addComment: anInterval 
	comments isNil 
		ifTrue: [comments := OrderedCollection with: anInterval]
		ifFalse: [comments add: anInterval]!

atEnd
	^characterType == #eof!

characterExpected: anInteger
	self lexicalError: LErrExpectChar.
	^self
		literalErrorToken: buffer contents
		start: anInteger
		code: LErrExpectChar!

classify: aCharacter 
	| index |
	"May be asked to classify nil if peek at end of stream"
	aCharacter isNil ifTrue: [^#separator].
	(index := aCharacter asInteger) == 0 ifTrue: [^#separator].
	"Currently Dolphin supports only single-byte characters, so this test is redundant"
	"index > 255 ifTrue: [^nil]."
	^classificationTable at: index!

constantExpected
	self lexicalError: LErrExpectConst.
	^self
		literalErrorToken: buffer contents
		start: self previousStepPosition
		code: LErrExpectConst!

contents
	| contentsStream |
	contentsStream := WriteStream on: (Array new: 50).
	self do: [:each | contentsStream nextPut: each].
	^contentsStream contents!

do: aBlock
	"Evaluate the argument, aBlock, for each of the remaining elements that can be accessed by 
	the receiver."

	[self atEnd] whileFalse: [aBlock value: self next]
!

environment
	"Answer the environment for which the receiver is scanning. By default this is the global
	<SystemDictionary> instance, Smalltalk."

	^environment!

environment: anObject
	"Set the environment for which the receiver is scanning."

	environment := anObject!

errorBlock
	^errorBlock ifNil: [[:ex | ]]!

errorBlock: aBlock 
	errorBlock := aBlock 
				ifNotNil: 
					[aBlock argumentCount == 2 
						ifTrue: 
							[
							[:ex | 
							aBlock value: ex description value: ex position.
							ex signal]]
						ifFalse: [aBlock]]!

errorHandler
	^errorHandler!

errorHandler: parseErrorHandler 
	errorHandler := parseErrorHandler!

errorPosition
	^stream position!

errorTokenClass
	^StErrorToken!

extendedLiteralExpected
	self lexicalError: LErrExpectExtendedLiteral.
	^self
		literalErrorToken: buffer contents
		start: self previousStepPosition
		code: LErrExpectExtendedLiteral!

getComments
	| oldComments |
	oldComments := comments.
	comments := nil.
	^oldComments!

identifierTokenClass
	^StIdentifierToken!

illegalCharacter
	self lexicalError: LErrBadChar range: (self errorPosition to: self errorPosition).
	"Error ignored, attempt to recover"
	^self recoverFromIllegalCharacter!

illegalNumber: anInteger
	self lexicalError: LErrBadNumber range: (anInteger to: self errorPosition)!

invalidQualifier
	self lexicalError: LErrInvalidQualifier.
	^self
		literalErrorToken: buffer contents
		start: self previousStepPosition
		code: LErrInvalidQualifier!

lexicalError: anInteger
	^self lexicalError: anInteger range: (tokenStart to: self errorPosition)!

lexicalError: anInteger range: anInterval 
	^self 
		lexicalError: anInteger
		range: anInterval
		extras: #()!

lexicalError: anInteger range: anInterval extras: anArray 
	^self errorHandler 
		reportError: anInteger
		at: self errorPosition
		line: self line
		range: anInterval
		extras: anArray!

line
	"Anwswer one-based <integer> line number of the receiver's current position in the 
	source text."

	^line!

literalErrorToken: anObject start: anInteger code: codeInteger
	^self errorTokenClass
		start: anInteger
		comments: nil
		value: anObject
		code: codeInteger
		position: self errorPosition!

literalTokenClass
	^StLiteralToken!

metaVariableExpected
	^self lexicalError: LErrExpectMetaVariable!

namespaceCharacter: aCharacter
	nameSpaceCharacter := aCharacter!

newIntegerToken: anInteger
	| stop |
	stop := self previousStepPosition.
	^StNumberLiteralToken
		start: tokenStart
		comments: nil
		value: anInteger
		stop: stop
		source: (stream copyFrom: tokenStart to: stop)!

next
	| token |
	buffer reset.
	tokenStart := stream position.
	token := characterType == #eof
				ifTrue: [StEofToken start: tokenStart + 1	"The EOF token should occur after the end of input"]
				ifFalse: [self scanToken].
	self stripSeparators.
	token comments: comments.
	comments := nil.
	^token!

notificationClass
	^SmalltalkParser notificationClass!

numberTokenClass
	^StNumberLiteralToken!

on: aStream
	buffer := WriteStream on: (String new: 60).
	stream := aStream.
	tokenStart := stream position.
	classificationTable := ClassificationTable.
	errorHandler := self.
	separatorsInLiterals := false.
	extendedLiterals := true.
	nameSpaceCharacter := $..	"N.B. Dolphin support namespaces other than for pools."
	line := 1.
	environment := Smalltalk!

previousStepPosition
	^characterType == #eof 
		ifTrue: [stream position]
		ifFalse: [stream position - 1]!

readIntegerOfRadix: anInteger
	| value |
	value := nil.
	[self atEnd] whileFalse: 
			[| digit |
			((digit := currentCharacter digitValue) < anInteger and: [digit >= 0])
				ifTrue: 
					[self step.
					value := (value ?? 0) * anInteger + digit]
				ifFalse: [^value]].
	^value!

recoverFromIllegalCharacter
	| start badChar |
	badChar := currentCharacter.
	start := tokenStart.
	"Skip the bad character"
	self step.
	^self errorTokenClass
		start: start
		comments: nil
		value: buffer contents
		code: LErrBadChar
		position: start!

recoverFromUnterminatedComment: anInteger 
	characterType := #eof.
	currentCharacter := nil.
	self addComment: (anInteger to: stream position)!

reportError: anInteger at: posInteger line: lineInteger range: anInterval extras: anArray 
	| err |
	err := self notificationClass 
				code: anInteger
				in: stream contents
				for: Object
				selector: #unknown
				position: posInteger
				line: lineInteger
				range: anInterval
				extras: anArray.
	self errorBlock value: err.
	"If the error block returns, then the exception is signalled"
	^err signal!

scanAnySymbol
	characterType == #alphabetic ifTrue: [^self scanSymbol].
	characterType == #binary 
		ifTrue: [^self scanBinary: self literalTokenClass].
	^StEofToken new!

scanBinary: aClass
	"Private - Although this does now permit binary selectors to be any length, as mandated by the ANSI
	standard, it still deliberately excludes '-' to avoid the ambiguity in expressions such as: '1--2'. The ANSI
	standard requires that this expression should be treated as a single send of the binary selector #-- to
	1 with 2 as its argument, however Smalltalk has traditionally treated this as '1 - -2', one subtract minus two."

	| val |
	buffer nextPut: currentCharacter.
	self step.
	[characterType == #binary and: [currentCharacter ~~ $-]] whileTrue: 
			[buffer nextPut: currentCharacter.
			self step].
	val := buffer contents.
	val := val asSymbol.
	^aClass
		start: tokenStart
		comments: nil
		value: val!

scanExponentInteger: significandInteger startingAt: posInteger
	"Private - Allow plus prefix on exponent, e.g. 2e+16, although not strictly Smalltalk syntax."

	| pos isNegative |
	pos := stream position.
	self step.
	((isNegative := currentCharacter == $-) or: [currentCharacter == $+]) ifTrue: [self step].
	^(self readIntegerOfRadix: 10)
		ifNotNil: 
			[:exp |
			| stop token exponentInteger |
			exp > Number maxLiteralIntegerExponent ifTrue: [self illegalNumber: posInteger].
			exponentInteger := isNegative ifTrue: [exp * -1] ifFalse: [exp].
			stop := self previousStepPosition.
			token := StExponentIntegerToken
						start: tokenStart
						comments: nil
						value: nil
						stop: stop
						source: (stream copyFrom: tokenStart to: stop)
						significand: significandInteger
						exponent: exponentInteger.
			token]
		ifNil: 
			[self stepBackTo: pos.
			self newIntegerToken: significandInteger]!

scanExtendedLiterals
	| token |
	self step.
	separatorsInLiterals ifTrue: [self stripSeparators].
	token := characterType == #alphabetic
				ifTrue: [self scanSymbol]
				ifFalse: 
					[characterType == #binary
						ifTrue: [(self scanBinary: self literalTokenClass) stop: self previousStepPosition]
						ifFalse: 
							[currentCharacter == $'
								ifTrue: [self scanStringSymbol]
								ifFalse: [currentCharacter == $( ifTrue: [^self scanOptimized]]]].
	token isNil ifTrue: [^self extendedLiteralExpected].
	token value: ((self environment at: #EsAtom ifAbsent: [Symbol]) intern: token value asString).
	^token!

scanIdentifierOrKeyword
	| name |
	self scanName.
	currentCharacter == nameSpaceCharacter
		ifTrue: 
			[| token |
			token := self scanNameSpaceName.
			token notNil ifTrue: [^token]].
	(currentCharacter == $: and: [stream peek ~~ $=]) ifTrue: [^self scanKeyword].
	name := buffer contents.
	name = 'true'
		ifTrue: 
			[^self literalTokenClass
				start: tokenStart
				comments: nil
				value: true
				stop: self previousStepPosition].
	name = 'false'
		ifTrue: 
			[^self literalTokenClass
				start: tokenStart
				comments: nil
				value: false
				stop: self previousStepPosition].
	name = 'nil'
		ifTrue: 
			[^self literalTokenClass
				start: tokenStart
				comments: nil
				value: nil
				stop: self previousStepPosition].
	^self identifierTokenClass
		start: tokenStart
		comments: nil
		value: name!

scanKeyword
	| outputPosition inputPosition words |
	words := 0.
	
	[words := words + 1.
	buffer nextPut: currentCharacter.
	outputPosition := buffer position.
	inputPosition := stream position.
	self step.	":"
	characterType == #alphabetic and: 
			[self scanName.
			currentCharacter == $:]]
			whileTrue.
	"Restore to position immediately after last colon"
	buffer position: outputPosition.
	stream position: inputPosition.
	self step.
	^words == 1
		ifTrue: 
			[StKeywordToken
				start: tokenStart
				comments: nil
				value: buffer contents]
		ifFalse: 
			[| name |
			name := buffer contents.
			StMultiKeywordLiteralToken
				start: tokenStart
				comments: nil
				value: name asSymbol
				stop: tokenStart + name size - 1]!

scanLiteral
	self step.
	separatorsInLiterals ifTrue: [self stripSeparators].
	characterType == #alphabetic ifTrue: [^self scanSymbol].
	characterType == #binary 
		ifTrue: [^(self scanBinary: self literalTokenClass) stop: self previousStepPosition].
	currentCharacter == $' ifTrue: [^self scanStringSymbol].
	(currentCharacter == $( or: [currentCharacter == $[]) 
		ifTrue: [^self scanLiteralArrayToken].
	(separatorsInLiterals and: [currentCharacter == ${]) 
		ifTrue: [^self scanQualifiedReference].
	(extendedLiterals and: [currentCharacter == $#]) ifTrue: [^self scanExtendedLiterals].
	^self constantExpected!

scanLiteralArrayToken
	| token |
	token := StLiteralArrayToken
				start: tokenStart
				comments: nil
				value: (String with: $# with: currentCharacter).
	self step.
	^token!

scanLiteralCharacter
	| token stop value start |
	start := stream position.
	self step.	"$"
	self atEnd ifTrue: [^self characterExpected: start].
	stop := stream position.
	value := currentCharacter.
	self step.	"char"
	"Extended syntax for special characters?"
	(value == $\ and: [extendedLiterals])
		ifTrue: 
			[(EscapeChars lookup: currentCharacter)
				ifNil: 
					[currentCharacter == $x
						ifTrue: 
							[| codePoint |
							self step.
							codePoint := self readIntegerOfRadix: 16.
							(codePoint isNil or: [codePoint > 255]) ifTrue: [^self characterExpected: start].
							value := Character value: codePoint]]
				ifNotNil: 
					[:char |
					value := char.
					self step]].
	token := self literalTokenClass
				start: tokenStart
				comments: nil
				value: value
				stop: stop.
	^token!

scanLiteralString
	self step.
	
	[currentCharacter isNil ifTrue: [^self unterminatedString].
	currentCharacter == $' and: [self step ~~ $']]
			whileFalse: 
				[buffer nextPut: currentCharacter.
				self step].
	^self literalTokenClass
		start: tokenStart
		comments: nil
		value: buffer contents
		stop: self previousStepPosition!

scanName
	[characterType == #alphabetic or: [characterType == #digit]] whileTrue: 
			[buffer nextPut: currentCharacter.
			self step]!

scanNameSpaceName
	nameSpaceCharacter == $:
		ifTrue: 
			[stream peek == $: ifFalse: [^nil].
			buffer next: 2 put: $:.
			self step]
		ifFalse: 
			[(stream atEnd or: [(self classify: stream peek) ~~ #alphabetic]) ifTrue: [^nil].
			buffer nextPut: $.].
	self step.
	self scanName.
	currentCharacter == nameSpaceCharacter ifTrue: [^self scanNameSpaceName].
	^StIdentifierToken
		start: tokenStart
		comments: nil
		value: buffer contents!

scanNumber
	| start sign integerPart |
	start := stream position.
	sign := currentCharacter == $-
				ifTrue: 
					[self step.
					-1]
				ifFalse: [1].
	(integerPart := self readIntegerOfRadix: 10)
		ifNil: 
			["This should not happen since we have previously detected a digit"
			^self error: 'internal error'].
	self atEnd
		ifFalse: 
			["The type of number is determined by what we find next"
			currentCharacter == $.
				ifTrue: [^self scanSmalltalkReal: integerPart sign: sign]
				ifFalse: 
					[currentCharacter == $r
						ifTrue: 
							[(integerPart between: 2 and: 36)
								ifTrue: 
									[| pos |
									pos := stream position.
									self step.
									(self readIntegerOfRadix: integerPart)
										ifNotNil: 
											[:significand |
											currentCharacter == $e
												ifTrue: [^self scanExponentInteger: significand * sign startingAt: start]
												ifFalse: [integerPart := significand]]
										ifNil: 
											["ungobble the 'r', as this appears not to be a radix prefix"
											self stepBackTo: pos]]]
						ifFalse: 
							[currentCharacter == $s
								ifTrue: 
									[| precision stop |
									self step.	"s will always be part of token, regardless if there is a scale value"
									precision := self readIntegerOfRadix: 10.
									precision
										ifNil: [precision := 0]
										ifNotNil: [integerPart := integerPart * (10 raisedToInteger: precision)].
									stop := self previousStepPosition.
									^StScaledDecimalToken
										start: tokenStart
										comments: nil
										value: nil
										stop: stop
										source: (stream copyFrom: tokenStart to: stop)
										significand: integerPart * sign
										precision: precision
										exponent: 0]
								ifFalse: 
									["Also support St-80 format integer of the form 1e5, not valid ANSI syntax though"
									currentCharacter == $e ifTrue: [^self scanExponentInteger: integerPart * sign startingAt: start]]]]].
	^self newIntegerToken: integerPart * sign!

scanOptimized
	self step.
	^StOptimizedToken
		start: tokenStart
		comments: nil
		stop: self previousStepPosition!

scanPatternVariable
	buffer nextPut: currentCharacter.
	self step.
	currentCharacter == ${
		ifTrue: 
			[self step.
			^PatternBlockToken
				start: tokenStart
				comments: nil
				value: '`{'].
	[characterType == #alphabetic] whileFalse: 
			[characterType == #eof ifTrue: [^self metaVariableExpected].
			buffer nextPut: currentCharacter.
			self step].
	^self scanIdentifierOrKeyword!

scanQualifiedReference
	| nameToken bindingClass |
	bindingClass := self environment at: #BindingReference ifAbsent: [nil].
	bindingClass isNil ifTrue: [^self illegalCharacter].
	self step.	"{"
	self stripSeparators.
	nameToken := self scanIdentifierOrKeyword.
	(nameToken isIdentifier and: [nameToken value notEmpty]) ifFalse: [^self invalidQualifier].
	self stripSeparators.
	currentCharacter == $} ifFalse: [^self unterminatedQualifiedRef].
	self step.	"}"
	^self literalTokenClass
		start: tokenStart
		comments: nil
		value: (bindingClass pathString: nameToken value)
		stop: self previousStepPosition!

scanSmalltalkReal: anInteger sign: signInteger
	| fractionStart fractionalPart impliedPrecision significand precision exponent stop |
	(self classify: stream peek) == #digit
		ifFalse: 
			["Trailing full stop after an integer"
			^self newIntegerToken: anInteger].
	"Step over the decimal point"
	self step.
	fractionStart := stream position.
	fractionalPart := self readIntegerOfRadix: 10.
	impliedPrecision := self previousStepPosition - fractionStart + 1.

	"Process any exponent..."
	(currentCharacter == $e or: [currentCharacter == $d or: [currentCharacter == $q]])
		ifTrue: 
			[| exponentStart exponentSign |
			exponentStart := stream position.
			self step.	"Skip the exponent character"
			"Allow plus prefix on the exponent, although not ANSI Smalltalk syntax"
			currentCharacter == $-
				ifTrue: 
					[exponentSign := -1.
					self step]
				ifFalse: 
					[exponentSign := 1.
					currentCharacter == $+ ifTrue: [self step]].
			exponent := self readIntegerOfRadix: 10.
			exponent
				ifNil: 
					["Found Float with trailing exponent character which is not
					 part of the number, e.g. 1.5e From ANSI standard p 28: 'An
					 exponentLetter must be followed by an explicit exponent'"
					self stepBackTo: exponentStart.
					exponent := 0]
				ifNotNil: [exponent := exponent * exponentSign]]
		ifFalse: 
			[currentCharacter == $s
				ifTrue: 
					[self step.	"Skip the $s"
					precision := self readIntegerOfRadix: 10.
					precision
						ifNil: 
							[precision := impliedPrecision.
							significand := anInteger * (10 raisedToInteger: precision) + fractionalPart]
						ifNotNil: 
							[significand := anInteger * (10 raisedToInteger: precision)
										+ (fractionalPart * (10 raisedToInteger: precision - impliedPrecision))].
					stop := self previousStepPosition.
					^StScaledDecimalToken
						start: tokenStart
						comments: nil
						value: nil
						stop: stop
						source: (stream copyFrom: tokenStart to: stop)
						significand: significand * signInteger
						precision: precision
						exponent: 0].
			exponent := 0].
	significand := fractionalPart == 0
				ifTrue: 
					[precision := 0.
					anInteger]
				ifFalse: 
					[precision := impliedPrecision.
					anInteger * (10 raisedToInteger: precision) + fractionalPart].

	#todo.	"Do a better job of detecting and report illegal floating point numbers that are out of range."
	exponent - precision > 308 ifTrue: [self illegalNumber: tokenStart].
	stop := self previousStepPosition.
	^StFloatToken
		start: tokenStart
		comments: nil
		value: nil
		stop: stop
		source: (stream copyFrom: tokenStart to: stop)
		significand: significand * signInteger
		precision: precision
		exponent: exponent!

scanSpecialCharacter
	| character |
	currentCharacter == $:
		ifTrue: 
			[self step.
			^currentCharacter == $=
				ifTrue: 
					[self step.
					StAssignmentToken start: tokenStart]
				ifFalse: 
					[StSpecialCharacterToken
						start: tokenStart
						comments: nil
						value: $:]].
	character := currentCharacter.
	self step.
	^StSpecialCharacterToken
		start: tokenStart
		comments: nil
		value: character!

scanStringSymbol
	| literalToken |
	literalToken := self scanLiteralString.
	literalToken value: literalToken value asSymbol.
	^literalToken!

scanSymbol
	| lastPosition hasColon value startPosition |
	hasColon := false.
	startPosition := lastPosition := stream position.
	[characterType == #alphabetic] whileTrue: 
			[self scanName.
			currentCharacter == $:
				ifTrue: 
					[buffer nextPut: $:.
					hasColon := true.
					lastPosition := stream position.
					self step]].
	value := buffer contents.
	(hasColon and: [value last ~~ $:])
		ifTrue: 
			[stream position: lastPosition.
			self step.
			value := value first: lastPosition - startPosition + 1].
	^self literalTokenClass
		start: tokenStart
		comments: nil
		value: value asSymbol
		stop: self previousStepPosition!

scanToken
	"fast-n-ugly. Don't write stuff like this. Has been found to cause cancer in laboratory rats. Basically a 
	case statement. Didn't use Dictionary because lookup is pretty slow."

	characterType == #alphabetic ifTrue: [^self scanIdentifierOrKeyword].
	(characterType == #digit 
		or: [currentCharacter == $- and: [(self classify: stream peek) == #digit]]) 
			ifTrue: [^self scanNumber].
	characterType == #binary ifTrue: [^self scanBinary: StBinarySelectorToken].
	characterType == #special ifTrue: [^self scanSpecialCharacter].
	currentCharacter == $' ifTrue: [^self scanLiteralString].
	currentCharacter == $# ifTrue: [^self scanLiteral].
	currentCharacter == $$ ifTrue: [^self scanLiteralCharacter].
	^self illegalCharacter!

separatorsInLiterals: aBoolean
	separatorsInLiterals := aBoolean!

step
	| index |
	(currentCharacter := stream nextAvailable) isNil 
		ifTrue: 
			[characterType := #eof.
			^nil].
	characterType := (index := currentCharacter asInteger) == 0 
				ifTrue: [#separator]
				ifFalse: 
					[index == 10 ifTrue: [line := line + 1].
					classificationTable at: index].
	^currentCharacter!

stepBackTo: exponentStart 
	stream position: exponentStart - 1.
	self step!

stripSeparators
	
	[[characterType == #separator] whileTrue: [self step].
	currentCharacter == $"] whileTrue: 
				[| start stop |
				start := stream position.
				
				[| ch |
				stream atEnd ifTrue: [^self unterminatedComment: start].
				ch := stream next.
				ch == $\n ifTrue: [line := line + 1].
				ch == $"]
						whileFalse.
				stop := stream position.
				self step.
				self addComment: (start to: stop)]!

unterminatedComment: anInteger 
	self lexicalError: LErrCommentNotClosed range: (anInteger to: self errorPosition).
	^self recoverFromUnterminatedComment: anInteger!

unterminatedQualifiedRef
	self lexicalError: LErrQualifiedRefNotClosed.
	^self
		literalErrorToken: buffer contents
		start: self previousStepPosition
		code: LErrQualifiedRefNotClosed!

unterminatedString
	self lexicalError: LErrStringNotClosed.
	^self
		literalErrorToken: buffer contents
		start: self previousStepPosition
		code: LErrStringNotClosed! !
!SmalltalkScanner categoriesFor: #addComment:!private!scanning! !
!SmalltalkScanner categoriesFor: #atEnd!public!testing! !
!SmalltalkScanner categoriesFor: #characterExpected:!error handling!private! !
!SmalltalkScanner categoriesFor: #classify:!private!scanning! !
!SmalltalkScanner categoriesFor: #constantExpected!error handling!private! !
!SmalltalkScanner categoriesFor: #contents!accessing!public! !
!SmalltalkScanner categoriesFor: #do:!enumerating!public! !
!SmalltalkScanner categoriesFor: #environment!accessing!public! !
!SmalltalkScanner categoriesFor: #environment:!accessing!public! !
!SmalltalkScanner categoriesFor: #errorBlock!error handling!public! !
!SmalltalkScanner categoriesFor: #errorBlock:!accessing!public! !
!SmalltalkScanner categoriesFor: #errorHandler!accessing!private! !
!SmalltalkScanner categoriesFor: #errorHandler:!accessing!private! !
!SmalltalkScanner categoriesFor: #errorPosition!accessing!error handling!public! !
!SmalltalkScanner categoriesFor: #errorTokenClass!error handling!private! !
!SmalltalkScanner categoriesFor: #extendedLiteralExpected!error handling!private! !
!SmalltalkScanner categoriesFor: #getComments!accessing!public! !
!SmalltalkScanner categoriesFor: #identifierTokenClass!constants!private! !
!SmalltalkScanner categoriesFor: #illegalCharacter!error handling!private! !
!SmalltalkScanner categoriesFor: #illegalNumber:!error handling!private! !
!SmalltalkScanner categoriesFor: #invalidQualifier!private!scanning! !
!SmalltalkScanner categoriesFor: #lexicalError:!error handling!private! !
!SmalltalkScanner categoriesFor: #lexicalError:range:!error handling!private! !
!SmalltalkScanner categoriesFor: #lexicalError:range:extras:!error handling!private! !
!SmalltalkScanner categoriesFor: #line!accessing!public! !
!SmalltalkScanner categoriesFor: #literalErrorToken:start:code:!error handling!private! !
!SmalltalkScanner categoriesFor: #literalTokenClass!constants!private! !
!SmalltalkScanner categoriesFor: #metaVariableExpected!error handling!private! !
!SmalltalkScanner categoriesFor: #namespaceCharacter:!accessing!public! !
!SmalltalkScanner categoriesFor: #newIntegerToken:!private!scanning! !
!SmalltalkScanner categoriesFor: #next!accessing!public! !
!SmalltalkScanner categoriesFor: #notificationClass!constants!error handling!private! !
!SmalltalkScanner categoriesFor: #numberTokenClass!public! !
!SmalltalkScanner categoriesFor: #on:!initializing!private! !
!SmalltalkScanner categoriesFor: #previousStepPosition!accessing!private! !
!SmalltalkScanner categoriesFor: #readIntegerOfRadix:!private!scanning! !
!SmalltalkScanner categoriesFor: #recoverFromIllegalCharacter!error handling!private! !
!SmalltalkScanner categoriesFor: #recoverFromUnterminatedComment:!error handling!private! !
!SmalltalkScanner categoriesFor: #reportError:at:line:range:extras:!error handling!private! !
!SmalltalkScanner categoriesFor: #scanAnySymbol!private!scanning! !
!SmalltalkScanner categoriesFor: #scanBinary:!private!scanning! !
!SmalltalkScanner categoriesFor: #scanExponentInteger:startingAt:!private!scanning! !
!SmalltalkScanner categoriesFor: #scanExtendedLiterals!private!scanning! !
!SmalltalkScanner categoriesFor: #scanIdentifierOrKeyword!private!scanning! !
!SmalltalkScanner categoriesFor: #scanKeyword!private!scanning! !
!SmalltalkScanner categoriesFor: #scanLiteral!private!scanning! !
!SmalltalkScanner categoriesFor: #scanLiteralArrayToken!private!scanning! !
!SmalltalkScanner categoriesFor: #scanLiteralCharacter!private!scanning! !
!SmalltalkScanner categoriesFor: #scanLiteralString!private!scanning! !
!SmalltalkScanner categoriesFor: #scanName!private!scanning! !
!SmalltalkScanner categoriesFor: #scanNameSpaceName!private!scanning! !
!SmalltalkScanner categoriesFor: #scanNumber!private!scanning! !
!SmalltalkScanner categoriesFor: #scanOptimized!private!scanning! !
!SmalltalkScanner categoriesFor: #scanPatternVariable!private!scanning! !
!SmalltalkScanner categoriesFor: #scanQualifiedReference!private!scanning! !
!SmalltalkScanner categoriesFor: #scanSmalltalkReal:sign:!private!scanning! !
!SmalltalkScanner categoriesFor: #scanSpecialCharacter!private!scanning! !
!SmalltalkScanner categoriesFor: #scanStringSymbol!private!scanning! !
!SmalltalkScanner categoriesFor: #scanSymbol!private!scanning! !
!SmalltalkScanner categoriesFor: #scanToken!accessing!public! !
!SmalltalkScanner categoriesFor: #separatorsInLiterals:!accessing!private! !
!SmalltalkScanner categoriesFor: #step!operations!private! !
!SmalltalkScanner categoriesFor: #stepBackTo:!helpers!private! !
!SmalltalkScanner categoriesFor: #stripSeparators!private!scanning! !
!SmalltalkScanner categoriesFor: #unterminatedComment:!error handling!private! !
!SmalltalkScanner categoriesFor: #unterminatedQualifiedRef!error handling!private! !
!SmalltalkScanner categoriesFor: #unterminatedString!error handling!private! !

!SmalltalkScanner class methodsFor!

initialize
	| escapeChars |
	PatternVariableCharacter := $`.
	self initializeClassificationTable.
	escapeChars := IdentityDictionary new.
	Character.EscapeChars
		keysAndValuesDo: [:i :c | c ifNotNil: [escapeChars at: c put: (Character value: i - 1)]].
	self addClassConstant: 'EscapeChars'
		value: (escapeChars
				shrink;
				isImmutable: true;
				yourself)!

initializeClassificationTable
	| classificationTable |
	classificationTable := Array new: 255.
	"#2130 ANSI Smalltalk allows only the English alphabet and underscore as letters in identifiers"
	'_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'
		do: [:alpha | classificationTable at: alpha asInteger put: #alphabetic].
	'01234567890' do: [:digit | classificationTable at: digit asInteger put: #digit].
	'!!%&*+,-/<=>?@\~|' do: [:binary | classificationTable at: binary asInteger put: #binary].
	'().:;[]{}^' do: [:special | classificationTable at: special asInteger put: #special].
	(Character byteCharacterSet select: [:each | each isSeparator])
		do: [:separator | classificationTable at: separator asInteger put: #separator].
	classificationTable isImmutable: true.
	self addClassConstant: 'ClassificationTable' value: classificationTable!

isSelector: aSymbol 
	| scanner token |
	scanner := self basicNew.
	scanner on: (ReadStream on: aSymbol asString).
	scanner errorBlock: [:err | ^false].
	scanner step.
	token := scanner scanAnySymbol.
	token isLiteralToken ifFalse: [^false].
	token value isEmpty ifTrue: [^false].
	^scanner atEnd!

isVariable: aString 
	| scanner token |
	aString isString ifFalse: [^false].
	aString isEmpty ifTrue: [^false].
	(ClassificationTable at: aString first asInteger) == #alphabetic ifFalse: [^false].
	scanner := self basicNew.
	scanner on: (ReadStream on: aString asString).
	scanner errorBlock: [:err | ^false].
	scanner step.
	token := scanner scanIdentifierOrKeyword.
	token isKeyword ifTrue: [^false].
	^scanner atEnd!

on: aStream 
	| scanner |
	scanner := self basicNew on: aStream.
	scanner
		step;
		stripSeparators.
	^scanner!

on: aStream errorBlock: aBlock 
	| scanner |
	scanner := self basicNew on: aStream.
	scanner
		errorBlock: aBlock;
		step;
		stripSeparators.
	^scanner!

on: aStream errorHandler: parseErrorHandler 
	| scanner |
	scanner := self basicNew on: aStream.
	scanner
		errorHandler: parseErrorHandler;
		step;
		stripSeparators.
	^scanner!

patternVariableCharacter
	^PatternVariableCharacter! !
!SmalltalkScanner class categoriesFor: #initialize!initializing!public! !
!SmalltalkScanner class categoriesFor: #initializeClassificationTable!initializing!private! !
!SmalltalkScanner class categoriesFor: #isSelector:!public!testing! !
!SmalltalkScanner class categoriesFor: #isVariable:!public!testing! !
!SmalltalkScanner class categoriesFor: #on:!instance creation!public! !
!SmalltalkScanner class categoriesFor: #on:errorBlock:!instance creation!public! !
!SmalltalkScanner class categoriesFor: #on:errorHandler:!instance creation!public! !
!SmalltalkScanner class categoriesFor: #patternVariableCharacter!accessing!public! !

