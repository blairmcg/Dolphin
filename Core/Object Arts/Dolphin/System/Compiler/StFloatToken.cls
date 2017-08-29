"Filed out from Dolphin Smalltalk 7"!

StRealNumberToken subclass: #StFloatToken
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StFloatToken guid: (GUID fromString: '{7be5eae8-e3ad-48ce-8c7a-e997b8321754}')!
StFloatToken comment: ''!
!StFloatToken categoriesForClass!Unclassified! !
!StFloatToken methodsFor!

calculateValue
	^exponent >= precision
		ifTrue: [(significand * (10 raisedToInteger: exponent - precision)) asFloat]
		ifFalse: 
			["Note that the fraction does not need to be normalized before #asFloat
			 conversion, which will be faster than Integer>>gcd: "
			(Fraction numerator: significand denominator: (10 raisedToInteger: exponent negated + precision))
				asFloat]!

valueClass
	^Float! !
!StFloatToken categoriesFor: #calculateValue!private! !
!StFloatToken categoriesFor: #valueClass!constants!public! !

