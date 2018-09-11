"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_TYPOGRAPHIC_FEATURES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_TYPOGRAPHIC_FEATURES guid: (GUID fromString: '{843a5f0d-06f1-4f15-904a-e0daf6207eac}')!
DWRITE_TYPOGRAPHIC_FEATURES comment: '`DWRITE_TYPOGRAPHIC_FEATURES` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_TYPOGRAPHIC_FEATURES'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Defines a set of typographic features to be applied during shaping. Notice the character range which this feature list spans is specified as a separate parameter to GetGlyphs."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(843a5f0d-06f1-4f15-904a-e0daf6207eac), helpstring("Defines a set of typographic features to be applied during shaping. Notice the character range which this feature list spans is specified as a separate parameter to GetGlyphs.")]
struct tagDWRITE_TYPOGRAPHIC_FEATURES {
	[size_is("featureCount")] DWRITE_FONT_FEATURE* features;
	unsigned int featureCount;
} DWRITE_TYPOGRAPHIC_FEATURES;

```'!
!DWRITE_TYPOGRAPHIC_FEATURES categoriesForClass!Direct2d-Structs! !
!DWRITE_TYPOGRAPHIC_FEATURES methodsFor!

featureCount
	"Answer the <Integer> value of the receiver's 'featureCount' field."

	^bytes dwordAtOffset: ##(self offsetOf: #featureCount)!

featureCount: anInteger
	"Set the receiver's 'featureCount' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #featureCount) put: anInteger!

features
	"Answer the <StructureArray> value of the receiver's 'features' field."

	^StructureArray
		fromAddress: (bytes intPtrAtOffset: 0)
		length: self featureCount
		elementClass: DWRITE_FONT_FEATURE!

features: aStructureArray
	"Set the receiver's 'features' field to the value of the argument, aStructureArray"

	bytes uintPtrAtOffset: 0 put: aStructureArray yourAddress.
	self featureCount: aStructureArray size! !
!DWRITE_TYPOGRAPHIC_FEATURES categoriesFor: #featureCount!**compiled accessors**!public! !
!DWRITE_TYPOGRAPHIC_FEATURES categoriesFor: #featureCount:!**compiled accessors**!public! !
!DWRITE_TYPOGRAPHIC_FEATURES categoriesFor: #features!**compiled accessors**!public! !
!DWRITE_TYPOGRAPHIC_FEATURES categoriesFor: #features:!**compiled accessors**!public! !

!DWRITE_TYPOGRAPHIC_FEATURES class methodsFor!

defineFields
	"Define the fields of the DWRITE_TYPOGRAPHIC_FEATURES structure.

	DWRITE_TYPOGRAPHIC_FEATURES compileDefinition

		typedef [uuid(843a5f0d-06f1-4f15-904a-e0daf6207eac), helpstring('Defines a set of typographic features to be applied during shaping. Notice the character range which this feature list spans is specified as a separate parameter to GetGlyphs.')]
		struct tagDWRITE_TYPOGRAPHIC_FEATURES {
			[size_is('featureCount')] DWRITE_FONT_FEATURE* features;
			unsigned int featureCount;
		} DWRITE_TYPOGRAPHIC_FEATURES;
"

	self
		defineField: #features type: (StructureArrayPointerField type: DWRITE_FONT_FEATURE lengthField: #featureCount) offset: 0;
		defineField: #featureCount type: DWORDField new offset: 4.
	self byteSize: 8! !
!DWRITE_TYPOGRAPHIC_FEATURES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

