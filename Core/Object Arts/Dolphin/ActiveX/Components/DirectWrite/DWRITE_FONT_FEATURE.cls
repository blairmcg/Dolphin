"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_FONT_FEATURE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_FONT_FEATURE guid: (GUID fromString: '{51ed1391-2403-426d-801e-0225f42a8c59}')!
DWRITE_FONT_FEATURE comment: '`DWRITE_FONT_FEATURE` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_FONT_FEATURE'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"DWRITE_FONT_FEATURE structure specifies properties used to identify and execute typographic feature in the font."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(51ed1391-2403-426d-801e-0225f42a8c59), helpstring("DWRITE_FONT_FEATURE structure specifies properties used to identify and execute typographic feature in the font.")]
struct tagDWRITE_FONT_FEATURE {
	DWRITE_FONT_FEATURE_TAG nameTag;
	unsigned int parameter;
} DWRITE_FONT_FEATURE;

```'!
!DWRITE_FONT_FEATURE categoriesForClass!Direct2d-Structs! !
!DWRITE_FONT_FEATURE methodsFor!

nameTag
	"Answer the <Integer> value of the receiver's 'nameTag' field."

	^bytes sdwordAtOffset: 0!

nameTag: anInteger
	"Set the receiver's 'nameTag' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

parameter
	"Answer the <Integer> value of the receiver's 'parameter' field."

	^bytes dwordAtOffset: ##(self offsetOf: #parameter)!

parameter: anInteger
	"Set the receiver's 'parameter' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #parameter) put: anInteger! !
!DWRITE_FONT_FEATURE categoriesFor: #nameTag!**compiled accessors**!public! !
!DWRITE_FONT_FEATURE categoriesFor: #nameTag:!**compiled accessors**!public! !
!DWRITE_FONT_FEATURE categoriesFor: #parameter!**compiled accessors**!public! !
!DWRITE_FONT_FEATURE categoriesFor: #parameter:!**compiled accessors**!public! !

!DWRITE_FONT_FEATURE class methodsFor!

defineFields
	"Define the fields of the DWRITE_FONT_FEATURE structure.

	DWRITE_FONT_FEATURE compileDefinition

		typedef [uuid(51ed1391-2403-426d-801e-0225f42a8c59), helpstring('DWRITE_FONT_FEATURE structure specifies properties used to identify and execute typographic feature in the font.')]
		struct tagDWRITE_FONT_FEATURE {
			DWRITE_FONT_FEATURE_TAG nameTag;
			unsigned int parameter;
		} DWRITE_FONT_FEATURE;
"

	self
		defineField: #nameTag type: SDWORDField new offset: 0;
		defineField: #parameter type: DWORDField new offset: 4.
	self byteSize: 8! !
!DWRITE_FONT_FEATURE class categoriesFor: #defineFields!**auto generated**!initializing!public! !

