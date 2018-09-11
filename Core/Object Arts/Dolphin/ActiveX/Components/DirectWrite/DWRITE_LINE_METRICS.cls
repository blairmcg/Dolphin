"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_LINE_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_LINE_METRICS guid: (GUID fromString: '{cc7d060f-b471-4c7f-9a8b-744c0c5a8f7a}')!
DWRITE_LINE_METRICS comment: '`DWRITE_LINE_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_LINE_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_LINE_METRICS structure contains information about a formatted line of text."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(cc7d060f-b471-4c7f-9a8b-744c0c5a8f7a), helpstring("The DWRITE_LINE_METRICS structure contains information about a formatted line of text.")]
struct tagDWRITE_LINE_METRICS {
	unsigned int length;
	unsigned int trailingWhitespaceLength;
	unsigned int newlineLength;
	float height;
	float baseline;
	BOOL isTrimmed;
} DWRITE_LINE_METRICS;

```'!
!DWRITE_LINE_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_LINE_METRICS methodsFor!

baseline
	"Answer the <Float> value of the receiver's 'baseline' field."

	^bytes floatAtOffset: ##(self offsetOf: #baseline)!

baseline: aFloat
	"Set the receiver's 'baseline' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #baseline) put: aFloat!

height
	"Answer the <Float> value of the receiver's 'height' field."

	^bytes floatAtOffset: ##(self offsetOf: #height)!

height: aFloat
	"Set the receiver's 'height' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #height) put: aFloat!

isTrimmed
	"Answer the <Boolean> value of the receiver's 'isTrimmed' field."

	^(bytes dwordAtOffset: ##(self offsetOf: #isTrimmed)) asBoolean!

isTrimmed: aBoolean
	"Set the receiver's 'isTrimmed' field to the value of the argument, aBoolean"

	bytes dwordAtOffset: ##(self offsetOf: #isTrimmed) put: aBoolean asParameter!

length
	"Answer the <Integer> value of the receiver's 'length' field."

	^bytes dwordAtOffset: 0!

length: anInteger
	"Set the receiver's 'length' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

newlineLength
	"Answer the <Integer> value of the receiver's 'newlineLength' field."

	^bytes dwordAtOffset: ##(self offsetOf: #newlineLength)!

newlineLength: anInteger
	"Set the receiver's 'newlineLength' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #newlineLength) put: anInteger!

trailingWhitespaceLength
	"Answer the <Integer> value of the receiver's 'trailingWhitespaceLength' field."

	^bytes dwordAtOffset: ##(self offsetOf: #trailingWhitespaceLength)!

trailingWhitespaceLength: anInteger
	"Set the receiver's 'trailingWhitespaceLength' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #trailingWhitespaceLength) put: anInteger! !
!DWRITE_LINE_METRICS categoriesFor: #baseline!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #baseline:!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #height!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #height:!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #isTrimmed!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #isTrimmed:!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #length!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #length:!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #newlineLength!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #newlineLength:!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #trailingWhitespaceLength!**compiled accessors**!public! !
!DWRITE_LINE_METRICS categoriesFor: #trailingWhitespaceLength:!**compiled accessors**!public! !

!DWRITE_LINE_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_LINE_METRICS structure.

	DWRITE_LINE_METRICS compileDefinition

		typedef [uuid(cc7d060f-b471-4c7f-9a8b-744c0c5a8f7a), helpstring('The DWRITE_LINE_METRICS structure contains information about a formatted line of text.')]
		struct tagDWRITE_LINE_METRICS {
			unsigned int length;
			unsigned int trailingWhitespaceLength;
			unsigned int newlineLength;
			float height;
			float baseline;
			BOOL isTrimmed;
		} DWRITE_LINE_METRICS;
"

	self
		defineField: #length type: DWORDField new offset: 0;
		defineField: #trailingWhitespaceLength type: DWORDField new offset: 4;
		defineField: #newlineLength type: DWORDField new offset: 8;
		defineField: #height type: FLOATField new offset: 12;
		defineField: #baseline type: FLOATField new offset: 16;
		defineField: #isTrimmed type: BOOLField new offset: 20.
	self byteSize: 24! !
!DWRITE_LINE_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

