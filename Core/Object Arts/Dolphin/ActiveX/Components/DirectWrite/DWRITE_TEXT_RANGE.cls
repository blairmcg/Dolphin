"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_TEXT_RANGE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_TEXT_RANGE guid: (GUID fromString: '{d921964f-3871-42ec-99ee-be2733a7bde6}')!
DWRITE_TEXT_RANGE comment: '`DWRITE_TEXT_RANGE` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_TEXT_RANGE'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_TEXT_RANGE structure specifies a range of text positions where format is applied."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(d921964f-3871-42ec-99ee-be2733a7bde6), helpstring("The DWRITE_TEXT_RANGE structure specifies a range of text positions where format is applied.")]
struct tagDWRITE_TEXT_RANGE {
	unsigned int startPosition;
	unsigned int length;
} DWRITE_TEXT_RANGE;

```'!
!DWRITE_TEXT_RANGE categoriesForClass!Direct2d-Structs! !
!DWRITE_TEXT_RANGE methodsFor!

length
	"Answer the <Integer> value of the receiver's 'length' field."

	^bytes dwordAtOffset: ##(self offsetOf: #length)!

length: anInteger
	"Set the receiver's 'length' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #length) put: anInteger!

startPosition
	"Answer the <Integer> value of the receiver's 'startPosition' field."

	^bytes dwordAtOffset: 0!

startPosition: anInteger
	"Set the receiver's 'startPosition' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger! !
!DWRITE_TEXT_RANGE categoriesFor: #length!**compiled accessors**!public! !
!DWRITE_TEXT_RANGE categoriesFor: #length:!**compiled accessors**!public! !
!DWRITE_TEXT_RANGE categoriesFor: #startPosition!**compiled accessors**!public! !
!DWRITE_TEXT_RANGE categoriesFor: #startPosition:!**compiled accessors**!public! !

!DWRITE_TEXT_RANGE class methodsFor!

defineFields
	"Define the fields of the DWRITE_TEXT_RANGE structure.

	DWRITE_TEXT_RANGE compileDefinition

		typedef [uuid(d921964f-3871-42ec-99ee-be2733a7bde6), helpstring('The DWRITE_TEXT_RANGE structure specifies a range of text positions where format is applied.')]
		struct tagDWRITE_TEXT_RANGE {
			unsigned int startPosition;
			unsigned int length;
		} DWRITE_TEXT_RANGE;
"

	self
		defineField: #startPosition type: DWORDField new offset: 0;
		defineField: #length type: DWORDField new offset: 4.
	self byteSize: 8! !
!DWRITE_TEXT_RANGE class categoriesFor: #defineFields!**auto generated**!initializing!public! !

