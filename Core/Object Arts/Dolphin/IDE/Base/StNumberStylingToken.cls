"Filed out from Dolphin Smalltalk 7"!

StNumberLiteralToken subclass: #StNumberStylingToken
	instanceVariableNames: 'numberClass'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StNumberStylingToken guid: (GUID fromString: '{c7c638b9-53cd-4316-803a-a5ac217d7f73}')!
StNumberStylingToken comment: ''!
!StNumberStylingToken categoriesForClass!Unclassified! !
!StNumberStylingToken methodsFor!

numberClass: aClass 
	numberClass := aClass!

valueClass
	^numberClass ifNil: [super valueClass]! !
!StNumberStylingToken categoriesFor: #numberClass:!accessing!private! !
!StNumberStylingToken categoriesFor: #valueClass!public! !

