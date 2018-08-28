"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_TEXT_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_TEXT_METRICS guid: (GUID fromString: '{6f0abf08-9fae-4b0b-b6bd-9f371894e63b}')!
DWRITE_TEXT_METRICS comment: '`DWRITE_TEXT_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_TEXT_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Overall metrics associated with text after layout. All coordinates are in device independent pixels (DIPs)."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(6f0abf08-9fae-4b0b-b6bd-9f371894e63b), helpstring("Overall metrics associated with text after layout. All coordinates are in device independent pixels (DIPs).")]
struct tagDWRITE_TEXT_METRICS {
	float left;
	float top;
	float width;
	float widthIncludingTrailingWhitespace;
	float height;
	float layoutWidth;
	float layoutHeight;
	unsigned int maxBidiReorderingDepth;
	unsigned int lineCount;
} DWRITE_TEXT_METRICS;

```'!
!DWRITE_TEXT_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_TEXT_METRICS methodsFor!

height
	"Answer the <Float> value of the receiver's 'height' field."

	^bytes floatAtOffset: ##(self offsetOf: #height)!

height: aFloat
	"Set the receiver's 'height' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #height) put: aFloat!

layoutHeight
	"Answer the <Float> value of the receiver's 'layoutHeight' field."

	^bytes floatAtOffset: ##(self offsetOf: #layoutHeight)!

layoutHeight: aFloat
	"Set the receiver's 'layoutHeight' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #layoutHeight) put: aFloat!

layoutWidth
	"Answer the <Float> value of the receiver's 'layoutWidth' field."

	^bytes floatAtOffset: ##(self offsetOf: #layoutWidth)!

layoutWidth: aFloat
	"Set the receiver's 'layoutWidth' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #layoutWidth) put: aFloat!

left
	"Answer the <Float> value of the receiver's 'left' field."

	^bytes floatAtOffset: 0!

left: aFloat
	"Set the receiver's 'left' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

lineCount
	"Answer the <Integer> value of the receiver's 'lineCount' field."

	^bytes dwordAtOffset: ##(self offsetOf: #lineCount)!

lineCount: anInteger
	"Set the receiver's 'lineCount' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #lineCount) put: anInteger!

maxBidiReorderingDepth
	"Answer the <Integer> value of the receiver's 'maxBidiReorderingDepth' field."

	^bytes dwordAtOffset: ##(self offsetOf: #maxBidiReorderingDepth)!

maxBidiReorderingDepth: anInteger
	"Set the receiver's 'maxBidiReorderingDepth' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #maxBidiReorderingDepth) put: anInteger!

top
	"Answer the <Float> value of the receiver's 'top' field."

	^bytes floatAtOffset: ##(self offsetOf: #top)!

top: aFloat
	"Set the receiver's 'top' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #top) put: aFloat!

width
	"Answer the <Float> value of the receiver's 'width' field."

	^bytes floatAtOffset: ##(self offsetOf: #width)!

width: aFloat
	"Set the receiver's 'width' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #width) put: aFloat!

widthIncludingTrailingWhitespace
	"Answer the <Float> value of the receiver's 'widthIncludingTrailingWhitespace' field."

	^bytes floatAtOffset: ##(self offsetOf: #widthIncludingTrailingWhitespace)!

widthIncludingTrailingWhitespace: aFloat
	"Set the receiver's 'widthIncludingTrailingWhitespace' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #widthIncludingTrailingWhitespace) put: aFloat! !
!DWRITE_TEXT_METRICS categoriesFor: #height!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #height:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #layoutHeight!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #layoutHeight:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #layoutWidth!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #layoutWidth:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #left!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #left:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #lineCount!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #lineCount:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #maxBidiReorderingDepth!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #maxBidiReorderingDepth:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #top!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #top:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #width!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #width:!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #widthIncludingTrailingWhitespace!**compiled accessors**!public! !
!DWRITE_TEXT_METRICS categoriesFor: #widthIncludingTrailingWhitespace:!**compiled accessors**!public! !

!DWRITE_TEXT_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_TEXT_METRICS structure.

	DWRITE_TEXT_METRICS compileDefinition

		typedef [uuid(6f0abf08-9fae-4b0b-b6bd-9f371894e63b), helpstring('Overall metrics associated with text after layout. All coordinates are in device independent pixels (DIPs).')]
		struct tagDWRITE_TEXT_METRICS {
			float left;
			float top;
			float width;
			float widthIncludingTrailingWhitespace;
			float height;
			float layoutWidth;
			float layoutHeight;
			unsigned int maxBidiReorderingDepth;
			unsigned int lineCount;
		} DWRITE_TEXT_METRICS;
"

	self
		defineField: #left type: FLOATField new offset: 0;
		defineField: #top type: FLOATField new offset: 4;
		defineField: #width type: FLOATField new offset: 8;
		defineField: #widthIncludingTrailingWhitespace type: FLOATField new offset: 12;
		defineField: #height type: FLOATField new offset: 16;
		defineField: #layoutWidth type: FLOATField new offset: 20;
		defineField: #layoutHeight type: FLOATField new offset: 24;
		defineField: #maxBidiReorderingDepth type: DWORDField new offset: 28;
		defineField: #lineCount type: DWORDField new offset: 32.
	self byteSize: 36! !
!DWRITE_TEXT_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

