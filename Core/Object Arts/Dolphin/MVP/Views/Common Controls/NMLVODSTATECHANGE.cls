﻿"Filed out from Dolphin Smalltalk 7"!

NMHDR subclass: #NMLVODSTATECHANGE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
NMLVODSTATECHANGE guid: (GUID fromString: '{f44c9148-2b3f-11d3-8368-7a8b5a000000}')!
NMLVODSTATECHANGE comment: ''!
!NMLVODSTATECHANGE categoriesForClass!External-Data-Structured-Win32! !
!NMLVODSTATECHANGE methodsFor!

iFrom
	"Answer the receiver's iFrom field as a Smalltalk object."

	^bytes sdwordAtOffset: ##(self offsetOf: #iFrom)!

iTo
	"Answer the receiver's iTo field as a Smalltalk object."

	^bytes sdwordAtOffset: ##(self offsetOf: #iTo)!

uNewState
	"Answer the receiver's uNewState field as a Smalltalk object."

	^bytes dwordAtOffset: ##(self offsetOf: #uNewState)!

uOldState
	"Answer the receiver's uOldState field as a Smalltalk object."

	^bytes dwordAtOffset: ##(self offsetOf: #uOldState)! !
!NMLVODSTATECHANGE categoriesFor: #iFrom!**compiled accessors**!public! !
!NMLVODSTATECHANGE categoriesFor: #iTo!**compiled accessors**!public! !
!NMLVODSTATECHANGE categoriesFor: #uNewState!**compiled accessors**!public! !
!NMLVODSTATECHANGE categoriesFor: #uOldState!**compiled accessors**!public! !

!NMLVODSTATECHANGE class methodsFor!

defineFields
	"Define the structure template for Win32 NMLVODSTATECHANGE structure.
		NMLVODSTATECHANGE compileDefinition
	"

	super defineFields.
	self 
		defineField: #iFrom type: SDWORDField readOnly;
		defineField: #iTo type: SDWORDField readOnly;
		defineField: #uNewState type: DWORDField readOnly;
		defineField: #uOldState type: DWORDField readOnly! !
!NMLVODSTATECHANGE class categoriesFor: #defineFields!initializing!public! !

