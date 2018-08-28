"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_TRIMMING
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_TRIMMING guid: (GUID fromString: '{52ce25f8-7080-402b-ae69-13b421ff56c5}')!
DWRITE_TRIMMING comment: '`DWRITE_TRIMMING` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_TRIMMING'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_TRIMMING structure specifies the trimming option for text overflowing the layout box."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(52ce25f8-7080-402b-ae69-13b421ff56c5), helpstring("The DWRITE_TRIMMING structure specifies the trimming option for text overflowing the layout box.")]
struct tagDWRITE_TRIMMING {
	DWRITE_TRIMMING_GRANULARITY granularity;
	unsigned int delimiter;
	unsigned int delimiterCount;
} DWRITE_TRIMMING;

```'!
!DWRITE_TRIMMING categoriesForClass!Direct2d-Structs! !
!DWRITE_TRIMMING methodsFor!

delimiter
	"Answer the <Integer> value of the receiver's 'delimiter' field."

	^bytes dwordAtOffset: ##(self offsetOf: #delimiter)!

delimiter: anInteger
	"Set the receiver's 'delimiter' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #delimiter) put: anInteger!

delimiterCount
	"Answer the <Integer> value of the receiver's 'delimiterCount' field."

	^bytes dwordAtOffset: ##(self offsetOf: #delimiterCount)!

delimiterCount: anInteger
	"Set the receiver's 'delimiterCount' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #delimiterCount) put: anInteger!

granularity
	"Answer the <Integer> value of the receiver's 'granularity' field."

	^bytes sdwordAtOffset: 0!

granularity: anInteger
	"Set the receiver's 'granularity' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger! !
!DWRITE_TRIMMING categoriesFor: #delimiter!**compiled accessors**!public! !
!DWRITE_TRIMMING categoriesFor: #delimiter:!**compiled accessors**!public! !
!DWRITE_TRIMMING categoriesFor: #delimiterCount!**compiled accessors**!public! !
!DWRITE_TRIMMING categoriesFor: #delimiterCount:!**compiled accessors**!public! !
!DWRITE_TRIMMING categoriesFor: #granularity!**compiled accessors**!public! !
!DWRITE_TRIMMING categoriesFor: #granularity:!**compiled accessors**!public! !

!DWRITE_TRIMMING class methodsFor!

defineFields
	"Define the fields of the DWRITE_TRIMMING structure.

	DWRITE_TRIMMING compileDefinition

		typedef [uuid(52ce25f8-7080-402b-ae69-13b421ff56c5), helpstring('The DWRITE_TRIMMING structure specifies the trimming option for text overflowing the layout box.')]
		struct tagDWRITE_TRIMMING {
			DWRITE_TRIMMING_GRANULARITY granularity;
			unsigned int delimiter;
			unsigned int delimiterCount;
		} DWRITE_TRIMMING;
"

	self
		defineField: #granularity type: SDWORDField new offset: 0;
		defineField: #delimiter type: DWORDField new offset: 4;
		defineField: #delimiterCount type: DWORDField new offset: 8.
	self byteSize: 12! !
!DWRITE_TRIMMING class categoriesFor: #defineFields!**auto generated**!initializing!public! !

