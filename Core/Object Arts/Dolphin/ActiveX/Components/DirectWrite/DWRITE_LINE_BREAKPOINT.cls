"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_LINE_BREAKPOINT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_LINE_BREAKPOINT guid: (GUID fromString: '{56ae48c7-a905-40cd-93a8-2cdaab7afefc}')!
DWRITE_LINE_BREAKPOINT comment: '`DWRITE_LINE_BREAKPOINT` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_LINE_BREAKPOINT'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Line breakpoint characteristics of a character."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(56ae48c7-a905-40cd-93a8-2cdaab7afefc), helpstring("Line breakpoint characteristics of a character.")]
struct tagDWRITE_LINE_BREAKPOINT {
	BYTE flags;
} DWRITE_LINE_BREAKPOINT;

```'!
!DWRITE_LINE_BREAKPOINT categoriesForClass!Direct2d-Structs! !
!DWRITE_LINE_BREAKPOINT methodsFor!

flags
	"Answer the <Integer> value of the receiver's 'flags' field."

	^bytes byteAtOffset: 0!

flags: anInteger
	"Set the receiver's 'flags' field to the value of the argument, anInteger"

	bytes byteAtOffset: 0 put: anInteger! !
!DWRITE_LINE_BREAKPOINT categoriesFor: #flags!**compiled accessors**!public! !
!DWRITE_LINE_BREAKPOINT categoriesFor: #flags:!**compiled accessors**!public! !

!DWRITE_LINE_BREAKPOINT class methodsFor!

defineFields
	"Define the fields of the DWRITE_LINE_BREAKPOINT structure.

	DWRITE_LINE_BREAKPOINT compileDefinition

		typedef [uuid(56ae48c7-a905-40cd-93a8-2cdaab7afefc), helpstring('Line breakpoint characteristics of a character.')]
		struct tagDWRITE_LINE_BREAKPOINT {
			BYTE flags;
		} DWRITE_LINE_BREAKPOINT;
"

	self
		defineField: #flags type: BYTEField new offset: 0.
	self byteSize: 1! !
!DWRITE_LINE_BREAKPOINT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

