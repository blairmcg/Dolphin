"Filed out from Dolphin Smalltalk 7"!

IrInstruction subclass: #IrVariableAccess
	instanceVariableNames: 'identifier'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IrVariableAccess guid: (GUID fromString: '{E423E388-BF26-49C0-9FE2-37FCD5D080BB}')!
IrVariableAccess comment: ''!
!IrVariableAccess categoriesForClass!System-Compiler! !
!IrVariableAccess methodsFor!

setIdentifier: aString
	identifier := aString! !
!IrVariableAccess categoriesFor: #setIdentifier:!initializing!private! !

!IrVariableAccess class methodsFor!

named: aString
	^self new setIdentifier: aString! !
!IrVariableAccess class categoriesFor: #named:!instance creation!public! !

