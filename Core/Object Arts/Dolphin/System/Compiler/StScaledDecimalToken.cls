"Filed out from Dolphin Smalltalk 7"!

StRealNumberToken subclass: #StScaledDecimalToken
	instanceVariableNames: 'scale'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StScaledDecimalToken guid: (GUID fromString: '{eedb4698-a56b-4c1d-a491-064af9bde2da}')!
StScaledDecimalToken comment: ''!
!StScaledDecimalToken categoriesForClass!Unclassified! !
!StScaledDecimalToken methodsFor!

calculateValue
	^ScaledDecimal newFromNumber: (Fraction numerator: significand
				denominator: (10 raisedToInteger: exponent negated + precision))
		scale: precision!

valueClass
	^ScaledDecimal! !
!StScaledDecimalToken categoriesFor: #calculateValue!private! !
!StScaledDecimalToken categoriesFor: #valueClass!constants!public! !

