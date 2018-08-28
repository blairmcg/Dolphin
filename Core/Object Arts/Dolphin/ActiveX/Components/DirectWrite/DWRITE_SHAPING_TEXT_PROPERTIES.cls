"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_SHAPING_TEXT_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_SHAPING_TEXT_PROPERTIES guid: (GUID fromString: '{56fefc93-6f61-4b71-aea5-00d445a89e2b}')!
DWRITE_SHAPING_TEXT_PROPERTIES comment: '`DWRITE_SHAPING_TEXT_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_SHAPING_TEXT_PROPERTIES'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Shaping output properties per input character."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(56fefc93-6f61-4b71-aea5-00d445a89e2b), helpstring("Shaping output properties per input character.")]
struct tagDWRITE_SHAPING_TEXT_PROPERTIES {
	unsigned short flags;
} DWRITE_SHAPING_TEXT_PROPERTIES;

```'!
!DWRITE_SHAPING_TEXT_PROPERTIES categoriesForClass!Direct2d-Structs! !
!DWRITE_SHAPING_TEXT_PROPERTIES methodsFor!

flags
	"Answer the <Integer> value of the receiver's 'flags' field."

	^bytes wordAtOffset: 0!

flags: anInteger
	"Set the receiver's 'flags' field to the value of the argument, anInteger"

	bytes wordAtOffset: 0 put: anInteger! !
!DWRITE_SHAPING_TEXT_PROPERTIES categoriesFor: #flags!**compiled accessors**!public! !
!DWRITE_SHAPING_TEXT_PROPERTIES categoriesFor: #flags:!**compiled accessors**!public! !

!DWRITE_SHAPING_TEXT_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the DWRITE_SHAPING_TEXT_PROPERTIES structure.

	DWRITE_SHAPING_TEXT_PROPERTIES compileDefinition

		typedef [uuid(56fefc93-6f61-4b71-aea5-00d445a89e2b), helpstring('Shaping output properties per input character.')]
		struct tagDWRITE_SHAPING_TEXT_PROPERTIES {
			unsigned short flags;
		} DWRITE_SHAPING_TEXT_PROPERTIES;
"

	self
		defineField: #flags type: WORDField new offset: 0.
	self byteSize: 2! !
!DWRITE_SHAPING_TEXT_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

