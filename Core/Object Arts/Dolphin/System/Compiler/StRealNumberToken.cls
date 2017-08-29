"Filed out from Dolphin Smalltalk 7"!

StNumberLiteralToken subclass: #StRealNumberToken
	instanceVariableNames: 'significand precision exponent'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StRealNumberToken guid: (GUID fromString: '{f2cb07e0-b34a-4c05-8962-971dd116f9b3}')!
StRealNumberToken comment: ''!
!StRealNumberToken categoriesForClass!Unclassified! !
!StRealNumberToken methodsFor!

exponent
	^exponent!

exponent: anInteger
	exponent := anInteger!

precision
	^precision!

precision: anInteger
	precision := anInteger!

significand
	^significand!

significand: anInteger
	significand := anInteger! !
!StRealNumberToken categoriesFor: #exponent!public! !
!StRealNumberToken categoriesFor: #exponent:!private! !
!StRealNumberToken categoriesFor: #precision!public! !
!StRealNumberToken categoriesFor: #precision:!private! !
!StRealNumberToken categoriesFor: #significand!public! !
!StRealNumberToken categoriesFor: #significand:!private! !

!StRealNumberToken class methodsFor!

start: startInteger comments: aCollectionOrNil value: aNumber stop: stopInteger source: sourceString significand: anInteger precision: fractionInteger exponent: exponentInteger
	<primitive: 157>
	^self new
		start: startInteger;
		comments: aCollectionOrNil;
		value: aNumber;
		stop: stopInteger;
		source: sourceString;
		significand: anInteger;
		precision: fractionInteger;
		exponent: exponentInteger;
		yourself! !
!StRealNumberToken class categoriesFor: #start:comments:value:stop:source:significand:precision:exponent:!public! !

