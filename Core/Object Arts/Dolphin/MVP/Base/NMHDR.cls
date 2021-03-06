﻿"Filed out from Dolphin Smalltalk 7"!

Win32Structure subclass: #NMHDR
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'CommCtrlConstants'
	classInstanceVariableNames: ''!
NMHDR guid: (GUID fromString: '{87b4c601-026e-11d3-9fd7-00a0cc3e4a32}')!
NMHDR comment: 'NMHDR is a <Win32Structure> representing the NMHDR external Win32 API structure.'!
!NMHDR categoriesForClass!External-Data-Structured-Win32! !
!NMHDR methodsFor!

code
	"Answer the receiver's code field as a Smalltalk object."

	^bytes sdwordAtOffset: ##(self offsetOf: #code)!

hwndFrom
	"Answer the receiver's hwndFrom field as a Smalltalk object."

	^bytes dwordAtOffset: 0!

idFrom
	"Answer the receiver's idFrom field as a Smalltalk object."

	^bytes uintPtrAtOffset: ##(self offsetOf: #idFrom)!

itemHandle
	^self idFrom! !
!NMHDR categoriesFor: #code!**compiled accessors**!public! !
!NMHDR categoriesFor: #hwndFrom!**compiled accessors**!public! !
!NMHDR categoriesFor: #idFrom!**compiled accessors**!public! !
!NMHDR categoriesFor: #itemHandle!accessing!public! !

!NMHDR class methodsFor!

defineFields
	"Define the fields of the Win32 NMHDR structure

		NMHDR compileDefinition
	"

	self
		defineField: #hwndFrom type: DWORDField readOnly;
		defineField: #idFrom type: UINT_PTRField readOnly;
		defineField: #code type: SDWORDField readOnly!

itemFromNMHDR: anExternalAddress
	^nil!

new
	"We only ever point to NMHDRs through an ExternalAddress. We
	never create those with embedded data."

	^self shouldNotImplement
! !
!NMHDR class categoriesFor: #defineFields!initializing!public! !
!NMHDR class categoriesFor: #itemFromNMHDR:!public! !
!NMHDR class categoriesFor: #new!instance creation!public! !

