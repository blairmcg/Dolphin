"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_GLYPH_OFFSET
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_GLYPH_OFFSET guid: (GUID fromString: '{21c07d1e-4b55-4931-b93b-b0c8e946f8d1}')!
DWRITE_GLYPH_OFFSET comment: '`DWRITE_GLYPH_OFFSET` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_GLYPH_OFFSET'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Optional adjustment to a glyph''s position. A glyph offset changes the position of a glyph without affecting the pen position. Offsets are in logical, pre-transform units."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(21c07d1e-4b55-4931-b93b-b0c8e946f8d1), helpstring("Optional adjustment to a glyph''s position. A glyph offset changes the position of a glyph without affecting the pen position. Offsets are in logical, pre-transform units.")]
struct tagDWRITE_GLYPH_OFFSET {
	float advanceOffset;
	float ascenderOffset;
} DWRITE_GLYPH_OFFSET;

```'!
!DWRITE_GLYPH_OFFSET categoriesForClass!Direct2d-Structs! !
!DWRITE_GLYPH_OFFSET methodsFor!

advanceOffset
	"Answer the <Float> value of the receiver's 'advanceOffset' field."

	^bytes floatAtOffset: 0!

advanceOffset: aFloat
	"Set the receiver's 'advanceOffset' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

ascenderOffset
	"Answer the <Float> value of the receiver's 'ascenderOffset' field."

	^bytes floatAtOffset: ##(self offsetOf: #ascenderOffset)!

ascenderOffset: aFloat
	"Set the receiver's 'ascenderOffset' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #ascenderOffset) put: aFloat! !
!DWRITE_GLYPH_OFFSET categoriesFor: #advanceOffset!**compiled accessors**!public! !
!DWRITE_GLYPH_OFFSET categoriesFor: #advanceOffset:!**compiled accessors**!public! !
!DWRITE_GLYPH_OFFSET categoriesFor: #ascenderOffset!**compiled accessors**!public! !
!DWRITE_GLYPH_OFFSET categoriesFor: #ascenderOffset:!**compiled accessors**!public! !

!DWRITE_GLYPH_OFFSET class methodsFor!

defineFields
	"Define the fields of the DWRITE_GLYPH_OFFSET structure.

	DWRITE_GLYPH_OFFSET compileDefinition

		typedef [uuid(21c07d1e-4b55-4931-b93b-b0c8e946f8d1), helpstring('Optional adjustment to a glyph's position. A glyph offset changes the position of a glyph without affecting the pen position. Offsets are in logical, pre-transform units.')]
		struct tagDWRITE_GLYPH_OFFSET {
			float advanceOffset;
			float ascenderOffset;
		} DWRITE_GLYPH_OFFSET;
"

	self
		defineField: #advanceOffset type: FLOATField new offset: 0;
		defineField: #ascenderOffset type: FLOATField new offset: 4.
	self byteSize: 8! !
!DWRITE_GLYPH_OFFSET class categoriesFor: #defineFields!**auto generated**!initializing!public! !

