﻿"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #CRYPTOAPI_BLOB
	instanceVariableNames: 'localData'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
CRYPTOAPI_BLOB guid: (GUID fromString: '{e93356a1-821e-4719-8038-f2813b7615d2}')!
CRYPTOAPI_BLOB comment: '<CRYPTOAPI_BLOB> is an <ExternalStructure> class to wrap the struct ''Win32.CRYPTOAPI_BLOB'' from type information in the ''Win32 API'' library.

The type library contains the following helpstring for this struct
	"Structure to represent an arbitrary, counted, array of bytes."

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [helpstring("Structure to represent an arbitrary, counted, array of bytes.")]
struct tagCRYPTOAPI_BLOB {
	unsigned long cbData;
	BYTE* pbData;
} CRYPTOAPI_BLOB;
'!
!CRYPTOAPI_BLOB categoriesForClass!Win32-Structs! !
!CRYPTOAPI_BLOB methodsFor!

basicFree
	"Private - Free external resources owned by the receiver."

	KernelLibrary default localFree: self basicPbData!

basicPbData
	^bytes intPtrAtOffset: ##(self offsetOf: #pbData)!

cbData
	"Private - Answer the <Integer> value of the receiver's 'cbData' field."

	^bytes dwordAtOffset: 0!

cbData: anInteger
	"Set the receiver's 'cbData' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

data
	^localData ifNil: [
		self pbData]!

data: aByteObject
	| temp |
	temp := bytes.
	self free.
	bytes := temp.
	self pbData: (localData := aByteObject asParameter).
	self cbData: localData basicSize!

initialize
	"Private - Initialize the receiver (common to internal [value] and
	external [reference] buffers.
	These objects are finalizable since they may reference owned external
	resources."

	self beFinalizable!

needsFree
	"Private - Answer whether the receiver requires freeing of any external resources."

	^localData isNil and: [bytes notNull and: [self basicPbData ~~ 0]]!

pbData
	"Answer the <ExternalArray> value of the receiver's 'pbData' field."

	^ExternalArray fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #pbData)) length: self cbData!

pbData: anExternalArray
	"Set the receiver's 'pbData' field to the value of the argument, anExternalArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #pbData) put: anExternalArray yourAddress.
	self cbData: anExternalArray size! !
!CRYPTOAPI_BLOB categoriesFor: #basicFree!private!realizing/unrealizing! !
!CRYPTOAPI_BLOB categoriesFor: #basicPbData!private!realizing/unrealizing! !
!CRYPTOAPI_BLOB categoriesFor: #cbData!**compiled accessors**!private! !
!CRYPTOAPI_BLOB categoriesFor: #cbData:!**compiled accessors**!private! !
!CRYPTOAPI_BLOB categoriesFor: #data!public! !
!CRYPTOAPI_BLOB categoriesFor: #data:!public! !
!CRYPTOAPI_BLOB categoriesFor: #initialize!initializing!private! !
!CRYPTOAPI_BLOB categoriesFor: #needsFree!private!realizing/unrealizing! !
!CRYPTOAPI_BLOB categoriesFor: #pbData!**compiled accessors**!public! !
!CRYPTOAPI_BLOB categoriesFor: #pbData:!**compiled accessors**!public! !

!CRYPTOAPI_BLOB class methodsFor!

defineFields
	"Define the fields of the CRYPTOAPI_BLOB structure.

	CRYPTOAPI_BLOB  compileDefinition

		typedef [helpstring('Structure to represent an arbitrary, counted, array of bytes.')]
		struct tagCRYPTOAPI_BLOB {
			[nonbrowsable] unsigned long cbData;
			BYTE* pbData;
		} CRYPTOAPI_BLOB;
"

	self
		defineField: #cbData type: DWORDField new beNonBrowsable offset: 0;
		defineField: #pbData type: (ArrayPointerField type: ExternalArray lengthField: #cbData) offset: 4.
	self byteSize: 8!

fromBytes: aByteObject
	^self new data: aByteObject! !
!CRYPTOAPI_BLOB class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!CRYPTOAPI_BLOB class categoriesFor: #fromBytes:!public! !

