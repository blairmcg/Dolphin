"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_SHAPING_GLYPH_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_SHAPING_GLYPH_PROPERTIES guid: (GUID fromString: '{cad730f3-94cf-458f-9953-de833a749c96}')!
DWRITE_SHAPING_GLYPH_PROPERTIES comment: '`DWRITE_SHAPING_GLYPH_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_SHAPING_GLYPH_PROPERTIES'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Shaping output properties per output glyph."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(cad730f3-94cf-458f-9953-de833a749c96), helpstring("Shaping output properties per output glyph.")]
struct tagDWRITE_SHAPING_GLYPH_PROPERTIES {
	unsigned short flags;
} DWRITE_SHAPING_GLYPH_PROPERTIES;

```'!
!DWRITE_SHAPING_GLYPH_PROPERTIES categoriesForClass!Direct2d-Structs! !
!DWRITE_SHAPING_GLYPH_PROPERTIES methodsFor!

flags
	"Answer the <Integer> value of the receiver's 'flags' field."

	^bytes wordAtOffset: 0!

flags: anInteger
	"Set the receiver's 'flags' field to the value of the argument, anInteger"

	bytes wordAtOffset: 0 put: anInteger! !
!DWRITE_SHAPING_GLYPH_PROPERTIES categoriesFor: #flags!**compiled accessors**!public! !
!DWRITE_SHAPING_GLYPH_PROPERTIES categoriesFor: #flags:!**compiled accessors**!public! !

!DWRITE_SHAPING_GLYPH_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the DWRITE_SHAPING_GLYPH_PROPERTIES structure.

	DWRITE_SHAPING_GLYPH_PROPERTIES compileDefinition

		typedef [uuid(cad730f3-94cf-458f-9953-de833a749c96), helpstring('Shaping output properties per output glyph.')]
		struct tagDWRITE_SHAPING_GLYPH_PROPERTIES {
			unsigned short flags;
		} DWRITE_SHAPING_GLYPH_PROPERTIES;
"

	self
		defineField: #flags type: WORDField new offset: 0.
	self byteSize: 2! !
!DWRITE_SHAPING_GLYPH_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

