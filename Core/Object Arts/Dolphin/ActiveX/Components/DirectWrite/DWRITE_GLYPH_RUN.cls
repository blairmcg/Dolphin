"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_GLYPH_RUN
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_GLYPH_RUN guid: (GUID fromString: '{d422d717-f630-4f41-81c2-491c273709aa}')!
DWRITE_GLYPH_RUN comment: '`DWRITE_GLYPH_RUN` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_GLYPH_RUN'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_GLYPH_RUN structure contains the information needed by renderers to draw glyph runs. All coordinates are in device independent pixels (DIPs)."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(d422d717-f630-4f41-81c2-491c273709aa), helpstring("The DWRITE_GLYPH_RUN structure contains the information needed by renderers to draw glyph runs. All coordinates are in device independent pixels (DIPs).")]
struct tagDWRITE_GLYPH_RUN {
	IDWriteFontFace* fontFace;
	float fontEmSize;
	unsigned int glyphCount;
	[size_is("glyphCount")] unsigned short* glyphIndices;
	[size_is("glyphCount")] float* glyphAdvances;
	[size_is("glyphCount")] DWRITE_GLYPH_OFFSET* glyphOffsets;
	BOOL isSideways;
	unsigned int bidiLevel;
} DWRITE_GLYPH_RUN;

```'!
!DWRITE_GLYPH_RUN categoriesForClass!Direct2d-Structs! !
!DWRITE_GLYPH_RUN methodsFor!

bidiLevel
	"Answer the <Integer> value of the receiver's 'bidiLevel' field."

	^bytes dwordAtOffset: ##(self offsetOf: #bidiLevel)!

bidiLevel: anInteger
	"Set the receiver's 'bidiLevel' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #bidiLevel) put: anInteger!

fontEmSize
	"Answer the <Float> value of the receiver's 'fontEmSize' field."

	^bytes floatAtOffset: ##(self offsetOf: #fontEmSize)!

fontEmSize: aFloat
	"Set the receiver's 'fontEmSize' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #fontEmSize) put: aFloat!

fontFace
	"Answer the <IDWriteFontFace> value of the receiver's 'fontFace' field."

	^IDWriteFontFace fromAddress: (bytes intPtrAtOffset: 0)!

fontFace: anIDWriteFontFace
	"Set the receiver's 'fontFace' field to the value of the argument, anIDWriteFontFace"

	bytes uintPtrAtOffset: 0 put: anIDWriteFontFace yourAddress!

glyphAdvances
	"Answer the <FLOATArray> value of the receiver's 'glyphAdvances' field."

	^FLOATArray fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #glyphAdvances))
		length: self glyphCount!

glyphAdvances: aFLOATArray
	"Set the receiver's 'glyphAdvances' field to the value of the argument, aFLOATArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #glyphAdvances) put: aFLOATArray yourAddress.
	self glyphCount: aFLOATArray size!

glyphCount
	"Answer the <Integer> value of the receiver's 'glyphCount' field."

	^bytes dwordAtOffset: ##(self offsetOf: #glyphCount)!

glyphCount: anInteger
	"Set the receiver's 'glyphCount' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #glyphCount) put: anInteger!

glyphIndices
	"Answer the <WORDArray> value of the receiver's 'glyphIndices' field."

	^WORDArray fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #glyphIndices))
		length: self glyphCount!

glyphIndices: aWORDArray
	"Set the receiver's 'glyphIndices' field to the value of the argument, aWORDArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #glyphIndices) put: aWORDArray yourAddress.
	self glyphCount: aWORDArray size!

glyphOffsets
	"Answer the <StructureArray> value of the receiver's 'glyphOffsets' field."

	^StructureArray
		fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #glyphOffsets))
		length: self glyphCount
		elementClass: DWRITE_GLYPH_OFFSET!

glyphOffsets: aStructureArray
	"Set the receiver's 'glyphOffsets' field to the value of the argument, aStructureArray"

	bytes uintPtrAtOffset: ##(self offsetOf: #glyphOffsets) put: aStructureArray yourAddress.
	self glyphCount: aStructureArray size!

isSideways
	"Answer the <Boolean> value of the receiver's 'isSideways' field."

	^(bytes dwordAtOffset: ##(self offsetOf: #isSideways)) asBoolean!

isSideways: aBoolean
	"Set the receiver's 'isSideways' field to the value of the argument, aBoolean"

	bytes dwordAtOffset: ##(self offsetOf: #isSideways) put: aBoolean asParameter! !
!DWRITE_GLYPH_RUN categoriesFor: #bidiLevel!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #bidiLevel:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #fontEmSize!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #fontEmSize:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #fontFace!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #fontFace:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphAdvances!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphAdvances:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphCount!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphCount:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphIndices!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphIndices:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphOffsets!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #glyphOffsets:!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #isSideways!**compiled accessors**!public! !
!DWRITE_GLYPH_RUN categoriesFor: #isSideways:!**compiled accessors**!public! !

!DWRITE_GLYPH_RUN class methodsFor!

defineFields
	"Define the fields of the DWRITE_GLYPH_RUN structure.

	DWRITE_GLYPH_RUN compileDefinition

		typedef [uuid(d422d717-f630-4f41-81c2-491c273709aa), helpstring('The DWRITE_GLYPH_RUN structure contains the information needed by renderers to draw glyph runs. All coordinates are in device independent pixels (DIPs).')]
		struct tagDWRITE_GLYPH_RUN {
			IDWriteFontFace* fontFace;
			float fontEmSize;
			unsigned int glyphCount;
			[size_is('glyphCount')] unsigned short* glyphIndices;
			[size_is('glyphCount')] float* glyphAdvances;
			[size_is('glyphCount')] DWRITE_GLYPH_OFFSET* glyphOffsets;
			BOOL isSideways;
			unsigned int bidiLevel;
		} DWRITE_GLYPH_RUN;
"

	self
		defineField: #fontFace type: (PointerField type: IDWriteFontFace) offset: 0;
		defineField: #fontEmSize type: FLOATField new offset: 4;
		defineField: #glyphCount type: DWORDField new offset: 8;
		defineField: #glyphIndices type: (ArrayPointerField type: WORDArray lengthField: #glyphCount) offset: 12;
		defineField: #glyphAdvances type: (ArrayPointerField type: FLOATArray lengthField: #glyphCount) offset: 16;
		defineField: #glyphOffsets type: (StructureArrayPointerField type: DWRITE_GLYPH_OFFSET lengthField: #glyphCount) offset: 20;
		defineField: #isSideways type: BOOLField new offset: 24;
		defineField: #bidiLevel type: DWORDField new offset: 28.
	self byteSize: 32! !
!DWRITE_GLYPH_RUN class categoriesFor: #defineFields!**auto generated**!initializing!public! !

