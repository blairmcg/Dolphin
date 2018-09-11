"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_STRIKETHROUGH
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_STRIKETHROUGH guid: (GUID fromString: '{faabb0d1-7163-4157-a3e4-780db127f25e}')!
DWRITE_STRIKETHROUGH comment: '`DWRITE_STRIKETHROUGH` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_STRIKETHROUGH'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_STRIKETHROUGH structure contains information about the size and placement of strikethroughs. All coordinates are in device independent pixels (DIPs)."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(faabb0d1-7163-4157-a3e4-780db127f25e), helpstring("The DWRITE_STRIKETHROUGH structure contains information about the size and placement of strikethroughs. All coordinates are in device independent pixels (DIPs).")]
struct tagDWRITE_STRIKETHROUGH {
	float width;
	float thickness;
	float Offset;
	DWRITE_READING_DIRECTION readingDirection;
	DWRITE_FLOW_DIRECTION flowDirection;
	[string] unsigned short* localeName;
	DWRITE_MEASURING_MODE measuringMode;
} DWRITE_STRIKETHROUGH;

```'!
!DWRITE_STRIKETHROUGH categoriesForClass!Direct2d-Structs! !
!DWRITE_STRIKETHROUGH methodsFor!

flowDirection
	"Answer the <Integer> value of the receiver's 'flowDirection' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #flowDirection)!

flowDirection: anInteger
	"Set the receiver's 'flowDirection' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #flowDirection) put: anInteger!

localeName
	"Answer the <Utf16String> value of the receiver's 'localeName' field."

	^Utf16String fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #localeName))!

localeName: anUtf16String
	"Set the receiver's 'localeName' field to the value of the argument, anUtf16String"

	bytes uintPtrAtOffset: ##(self offsetOf: #localeName) put: anUtf16String yourAddress!

measuringMode
	"Answer the <Integer> value of the receiver's 'measuringMode' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #measuringMode)!

measuringMode: anInteger
	"Set the receiver's 'measuringMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #measuringMode) put: anInteger!

Offset
	"Answer the <Float> value of the receiver's 'Offset' field."

	^bytes floatAtOffset: ##(self offsetOf: #Offset)!

Offset: aFloat
	"Set the receiver's 'Offset' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #Offset) put: aFloat!

readingDirection
	"Answer the <Integer> value of the receiver's 'readingDirection' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #readingDirection)!

readingDirection: anInteger
	"Set the receiver's 'readingDirection' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #readingDirection) put: anInteger!

thickness
	"Answer the <Float> value of the receiver's 'thickness' field."

	^bytes floatAtOffset: ##(self offsetOf: #thickness)!

thickness: aFloat
	"Set the receiver's 'thickness' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #thickness) put: aFloat!

width
	"Answer the <Float> value of the receiver's 'width' field."

	^bytes floatAtOffset: 0!

width: aFloat
	"Set the receiver's 'width' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!DWRITE_STRIKETHROUGH categoriesFor: #flowDirection!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #flowDirection:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #localeName!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #localeName:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #measuringMode!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #measuringMode:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #Offset!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #Offset:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #readingDirection!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #readingDirection:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #thickness!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #thickness:!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #width!**compiled accessors**!public! !
!DWRITE_STRIKETHROUGH categoriesFor: #width:!**compiled accessors**!public! !

!DWRITE_STRIKETHROUGH class methodsFor!

defineFields
	"Define the fields of the DWRITE_STRIKETHROUGH structure.

	DWRITE_STRIKETHROUGH compileDefinition

		typedef [uuid(faabb0d1-7163-4157-a3e4-780db127f25e), helpstring('The DWRITE_STRIKETHROUGH structure contains information about the size and placement of strikethroughs. All coordinates are in device independent pixels (DIPs).')]
		struct tagDWRITE_STRIKETHROUGH {
			float width;
			float thickness;
			float Offset;
			DWRITE_READING_DIRECTION readingDirection;
			DWRITE_FLOW_DIRECTION flowDirection;
			[string] unsigned short* localeName;
			DWRITE_MEASURING_MODE measuringMode;
		} DWRITE_STRIKETHROUGH;
"

	self
		defineField: #width type: FLOATField new offset: 0;
		defineField: #thickness type: FLOATField new offset: 4;
		defineField: #Offset type: FLOATField new offset: 8;
		defineField: #readingDirection type: SDWORDField new offset: 12;
		defineField: #flowDirection type: SDWORDField new offset: 16;
		defineField: #localeName type: (PointerField type: Utf16String) offset: 20;
		defineField: #measuringMode type: SDWORDField new offset: 24.
	self byteSize: 28! !
!DWRITE_STRIKETHROUGH class categoriesFor: #defineFields!**auto generated**!initializing!public! !

