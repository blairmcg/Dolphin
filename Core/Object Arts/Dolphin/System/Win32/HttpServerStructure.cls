﻿"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #HttpServerStructure
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'WinHttpServerConsts'
	classInstanceVariableNames: ''!
HttpServerStructure guid: (GUID fromString: '{20120606-4b34-448e-9c39-69371965b5b6}')!
HttpServerStructure comment: ''!
!HttpServerStructure categoriesForClass!External-Data-Structured! !
!HttpServerStructure methodsFor!

byteSize
	^bytes class isIndirection ifTrue: [super byteSize] ifFalse: [bytes size]! !
!HttpServerStructure categoriesFor: #byteSize!accessing!public! !

