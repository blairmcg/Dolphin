"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_PIXEL_FORMAT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_PIXEL_FORMAT guid: (GUID fromString: '{d25e6444-1c19-4a65-a595-64d30b2fa20e}')!
D2D1_PIXEL_FORMAT comment: '`D2D1_PIXEL_FORMAT` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_PIXEL_FORMAT'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D1_PIXEL_FORMAT {
	DXGI_FORMAT format;
	D2D1_ALPHA_MODE alphaMode;
} D2D1_PIXEL_FORMAT;

```'!
!D2D1_PIXEL_FORMAT categoriesForClass!Direct2d-Structs! !
!D2D1_PIXEL_FORMAT methodsFor!

alphaMode
	"Answer the <Integer> value of the receiver's 'alphaMode' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #alphaMode)!

alphaMode: anInteger
	"Set the receiver's 'alphaMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #alphaMode) put: anInteger!

format
	"Answer the <Integer> value of the receiver's 'format' field."

	^bytes sdwordAtOffset: 0!

format: anInteger
	"Set the receiver's 'format' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger! !
!D2D1_PIXEL_FORMAT categoriesFor: #alphaMode!**compiled accessors**!public! !
!D2D1_PIXEL_FORMAT categoriesFor: #alphaMode:!**compiled accessors**!public! !
!D2D1_PIXEL_FORMAT categoriesFor: #format!**compiled accessors**!public! !
!D2D1_PIXEL_FORMAT categoriesFor: #format:!**compiled accessors**!public! !

!D2D1_PIXEL_FORMAT class methodsFor!

defineFields
	"Define the fields of the D2D1_PIXEL_FORMAT structure.

	D2D1_PIXEL_FORMAT compileDefinition

		typedef 
		struct tagD2D1_PIXEL_FORMAT {
			DXGI_FORMAT format;
			D2D1_ALPHA_MODE alphaMode;
		} D2D1_PIXEL_FORMAT;
"

	self
		defineField: #format type: SDWORDField new offset: 0;
		defineField: #alphaMode type: SDWORDField new offset: 4.
	self byteSize: 8! !
!D2D1_PIXEL_FORMAT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

