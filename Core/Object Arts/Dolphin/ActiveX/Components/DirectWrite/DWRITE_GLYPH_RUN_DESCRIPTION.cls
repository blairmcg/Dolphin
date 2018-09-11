"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_GLYPH_RUN_DESCRIPTION
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_GLYPH_RUN_DESCRIPTION guid: (GUID fromString: '{73234cb0-2dc9-4f23-869a-ef060c16f6e4}')!
DWRITE_GLYPH_RUN_DESCRIPTION comment: '`DWRITE_GLYPH_RUN_DESCRIPTION` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_GLYPH_RUN_DESCRIPTION'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_GLYPH_RUN_DESCRIPTION structure contains additional properties related to those in DWRITE_GLYPH_RUN."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(73234cb0-2dc9-4f23-869a-ef060c16f6e4), helpstring("The DWRITE_GLYPH_RUN_DESCRIPTION structure contains additional properties related to those in DWRITE_GLYPH_RUN.")]
struct tagDWRITE_GLYPH_RUN_DESCRIPTION {
	[string] unsigned short* localeName;
	[size_is("stringLength")] unsigned short* string;
	unsigned int stringLength;
	[size_is("stringLength")] unsigned short* clusterMap;
	unsigned int textPosition;
} DWRITE_GLYPH_RUN_DESCRIPTION;

```'!
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesForClass!Direct2d-Structs! !
!DWRITE_GLYPH_RUN_DESCRIPTION methodsFor!

clusterMap
	"Answer the <WORDArray> value of the receiver's 'clusterMap' field."

	^WORDArray fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #clusterMap))
		length: self stringLength!

clusterMap: aWORDArray
	"Set the receiver's 'clusterMap' field to the value of the argument, aWORDArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #clusterMap) put: aWORDArray yourAddress.
	self stringLength: aWORDArray size!

localeName
	"Answer the <Utf16String> value of the receiver's 'localeName' field."

	^Utf16String fromAddress: (bytes intPtrAtOffset: 0)!

localeName: anUtf16String
	"Set the receiver's 'localeName' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: 0 put: anUtf16String yourAddress!

string
	"Answer the <WORDArray> value of the receiver's 'string' field."

	^WORDArray fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #string)) length: self stringLength!

string: aWORDArray
	"Set the receiver's 'string' field to the value of the argument, aWORDArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #string) put: aWORDArray yourAddress.
	self stringLength: aWORDArray size!

stringLength
	"Answer the <Integer> value of the receiver's 'stringLength' field."

	^bytes dwordAtOffset: ##(self offsetOf: #stringLength)!

stringLength: anInteger
	"Set the receiver's 'stringLength' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #stringLength) put: anInteger!

textPosition
	"Answer the <Integer> value of the receiver's 'textPosition' field."

	^bytes dwordAtOffset: ##(self offsetOf: #textPosition)!

textPosition: anInteger
	"Set the receiver's 'textPosition' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #textPosition) put: anInteger! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #clusterMap!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #clusterMap:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #localeName!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #localeName:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #string!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #string:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #stringLength!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #stringLength:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #textPosition!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN_DESCRIPTION categoriesFor: #textPosition:!**compiled accessors**!public! !

!DWRITE_GLYPH_RUN_DESCRIPTION class methodsFor!

defineFields
	"Define the fields of the DWRITE_GLYPH_RUN_DESCRIPTION structure.

	DWRITE_GLYPH_RUN_DESCRIPTION compileDefinition

		typedef [uuid(73234cb0-2dc9-4f23-869a-ef060c16f6e4), helpstring('The DWRITE_GLYPH_RUN_DESCRIPTION structure contains additional properties related to those in DWRITE_GLYPH_RUN.')]
		struct tagDWRITE_GLYPH_RUN_DESCRIPTION {
			[string] unsigned short* localeName;
			[size_is('stringLength')] unsigned short* string;
			unsigned int stringLength;
			[size_is('stringLength')] unsigned short* clusterMap;
			unsigned int textPosition;
		} DWRITE_GLYPH_RUN_DESCRIPTION;
"

	self
		defineField: #localeName type: (PointerField type: Utf16String) offset: 0;
		defineField: #string type: (ArrayPointerField type: WORDArray lengthField: #stringLength) offset: 4;
		defineField: #stringLength type: DWORDField new offset: 8;
		defineField: #clusterMap type: (ArrayPointerField type: WORDArray lengthField: #stringLength) offset: 12;
		defineField: #textPosition type: DWORDField new offset: 16.
	self byteSize: 20! !
!DWRITE_GLYPH_RUN_DESCRIPTION class categoriesFor: #defineFields!**auto generated**!initializing!public! !

