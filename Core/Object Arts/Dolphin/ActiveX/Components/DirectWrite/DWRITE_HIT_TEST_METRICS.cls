"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_HIT_TEST_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_HIT_TEST_METRICS guid: (GUID fromString: '{cf9e4247-f3a8-4533-a240-fcb16aadeb64}')!
DWRITE_HIT_TEST_METRICS comment: '`DWRITE_HIT_TEST_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_HIT_TEST_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Geometry enclosing of text positions."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(cf9e4247-f3a8-4533-a240-fcb16aadeb64), helpstring("Geometry enclosing of text positions.")]
struct tagDWRITE_HIT_TEST_METRICS {
	unsigned int textPosition;
	unsigned int length;
	float left;
	float top;
	float width;
	float height;
	unsigned int bidiLevel;
	BOOL isText;
	BOOL isTrimmed;
} DWRITE_HIT_TEST_METRICS;

```'!
!DWRITE_HIT_TEST_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_HIT_TEST_METRICS methodsFor!

bidiLevel
	"Answer the <Integer> value of the receiver's 'bidiLevel' field."

	^bytes dwordAtOffset: ##(self offsetOf: #bidiLevel)!

bidiLevel: anInteger
	"Set the receiver's 'bidiLevel' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #bidiLevel) put: anInteger!

height
	"Answer the <Float> value of the receiver's 'height' field."

	^bytes floatAtOffset: ##(self offsetOf: #height)!

height: aFloat
	"Set the receiver's 'height' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #height) put: aFloat!

isText
	"Answer the <Boolean> value of the receiver's 'isText' field."

	^(bytes dwordAtOffset: ##(self offsetOf: #isText)) asBoolean!

isText: aBoolean
	"Set the receiver's 'isText' field to the value of the argument, aBoolean"

	bytes dwordAtOffset: ##(self offsetOf: #isText) put: aBoolean asParameter!

isTrimmed
	"Answer the <Boolean> value of the receiver's 'isTrimmed' field."

	^(bytes dwordAtOffset: ##(self offsetOf: #isTrimmed)) asBoolean!

isTrimmed: aBoolean
	"Set the receiver's 'isTrimmed' field to the value of the argument, aBoolean"

	bytes dwordAtOffset: ##(self offsetOf: #isTrimmed) put: aBoolean asParameter!

left
	"Answer the <Float> value of the receiver's 'left' field."

	^bytes floatAtOffset: ##(self offsetOf: #left)!

left: aFloat
	"Set the receiver's 'left' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #left) put: aFloat!

length
	"Answer the <Integer> value of the receiver's 'length' field."

	^bytes dwordAtOffset: ##(self offsetOf: #length)!

length: anInteger
	"Set the receiver's 'length' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #length) put: anInteger!

textPosition
	"Answer the <Integer> value of the receiver's 'textPosition' field."

	^bytes dwordAtOffset: 0!

textPosition: anInteger
	"Set the receiver's 'textPosition' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

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

	bytes floatAtOffset: ##(self offsetOf: #width) put: aFloat! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #bidiLevel!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #bidiLevel:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #height!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #height:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #isText!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #isText:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #isTrimmed!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #isTrimmed:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #left!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #left:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #length!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #length:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #textPosition!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #textPosition:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #top!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #top:!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #width!**compiled accessors**!public! !
!DWRITE_HIT_TEST_METRICS categoriesFor: #width:!**compiled accessors**!public! !

!DWRITE_HIT_TEST_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_HIT_TEST_METRICS structure.

	DWRITE_HIT_TEST_METRICS compileDefinition

		typedef [uuid(cf9e4247-f3a8-4533-a240-fcb16aadeb64), helpstring('Geometry enclosing of text positions.')]
		struct tagDWRITE_HIT_TEST_METRICS {
			unsigned int textPosition;
			unsigned int length;
			float left;
			float top;
			float width;
			float height;
			unsigned int bidiLevel;
			BOOL isText;
			BOOL isTrimmed;
		} DWRITE_HIT_TEST_METRICS;
"

	self
		defineField: #textPosition type: DWORDField new offset: 0;
		defineField: #length type: DWORDField new offset: 4;
		defineField: #left type: FLOATField new offset: 8;
		defineField: #top type: FLOATField new offset: 12;
		defineField: #width type: FLOATField new offset: 16;
		defineField: #height type: FLOATField new offset: 20;
		defineField: #bidiLevel type: DWORDField new offset: 24;
		defineField: #isText type: BOOLField new offset: 28;
		defineField: #isTrimmed type: BOOLField new offset: 32.
	self byteSize: 36! !
!DWRITE_HIT_TEST_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

