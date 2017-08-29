"Filed out from Dolphin Smalltalk 7"!

StNumberLiteralToken subclass: #StExponentIntegerToken
	instanceVariableNames: 'significand exponent'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StExponentIntegerToken guid: (GUID fromString: '{e3eb592b-3bd6-491f-8434-cc7088db3e51}')!
StExponentIntegerToken comment: ''!
!StExponentIntegerToken categoriesForClass!Unclassified! !
!StExponentIntegerToken methodsFor!

calculateValue
	Sound bell.
	^significand * (10 raisedToInteger: exponent)!

exponent
	"The exponent value scanned from the source. Usually this component is missing so the
	exponent is zero."

	^exponent!

exponent: anInteger
	exponent := anInteger!

significand
	"The significant figures of the integer. Usually literal integers do not have an exponent,
	so this is the whole integer value."

	^significand!

significand: anInteger
	significand := anInteger!

valueClass
	^exponent < 0 ifTrue: [Fraction] ifFalse: [Integer]! !
!StExponentIntegerToken categoriesFor: #calculateValue!private! !
!StExponentIntegerToken categoriesFor: #exponent!public! !
!StExponentIntegerToken categoriesFor: #exponent:!private! !
!StExponentIntegerToken categoriesFor: #significand!public! !
!StExponentIntegerToken categoriesFor: #significand:!private! !
!StExponentIntegerToken categoriesFor: #valueClass!public! !

!StExponentIntegerToken class methodsFor!

start: startInteger comments: aCollectionOrNil value: aString stop: stopInteger source: sourceString significand: significandInteger exponent: exponentInteger
	<primitive: 157>
	^self new
		start: startInteger;
		comments: aCollectionOrNil;
		value: aString;
		stop: stopInteger;
		source: sourceString;
		significand: significandInteger;
		exponent: exponentInteger;
		yourself! !
!StExponentIntegerToken class categoriesFor: #start:comments:value:stop:source:significand:exponent:!public! !

