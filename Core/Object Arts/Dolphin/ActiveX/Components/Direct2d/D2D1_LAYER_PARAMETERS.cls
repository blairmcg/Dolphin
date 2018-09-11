"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_LAYER_PARAMETERS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_LAYER_PARAMETERS guid: (GUID fromString: '{8d32343e-7333-4d68-bc76-8bb955b38cb2}')!
D2D1_LAYER_PARAMETERS comment: '`D2D1_LAYER_PARAMETERS` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_LAYER_PARAMETERS'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(8d32343e-7333-4d68-bc76-8bb955b38cb2)]
struct tagD2D1_LAYER_PARAMETERS {
	D2D_RECT_F contentBounds;
	ID2D1Geometry* geometricMask;
	D2D1_ANTIALIAS_MODE maskAntialiasMode;
	D2D_MATRIX_3X2_F maskTransform;
	float opacity;
	ID2D1Brush* opacityBrush;
	D2D1_LAYER_OPTIONS layerOptions;
} D2D1_LAYER_PARAMETERS;

```'!
!D2D1_LAYER_PARAMETERS categoriesForClass!Direct2d-Structs! !
!D2D1_LAYER_PARAMETERS methodsFor!

contentBounds
	"Answer the <D2D_RECT_F> value of the receiver's 'contentBounds' field."

	^D2D_RECT_F fromAddress: bytes yourAddress!

contentBounds: aD2D_RECT_F
	"Set the receiver's 'contentBounds' field to the value of the argument, aD2D_RECT_F"

	aD2D_RECT_F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_RECT_F basicByteSize)
		startingAt: 1!

geometricMask
	"Answer the <ID2D1Geometry> value of the receiver's 'geometricMask' field."

	^ID2D1Geometry fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #geometricMask))!

geometricMask: anID2D1Geometry
	"Set the receiver's 'geometricMask' field to the value of the argument, anID2D1Geometry"

	bytes uintPtrAtOffset: ##(self offsetOf: #geometricMask) put: anID2D1Geometry yourAddress!

layerOptions
	"Answer the <Integer> value of the receiver's 'layerOptions' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #layerOptions)!

layerOptions: anInteger
	"Set the receiver's 'layerOptions' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #layerOptions) put: anInteger!

maskAntialiasMode
	"Answer the <Integer> value of the receiver's 'maskAntialiasMode' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #maskAntialiasMode)!

maskAntialiasMode: anInteger
	"Set the receiver's 'maskAntialiasMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #maskAntialiasMode) put: anInteger!

maskTransform
	"Answer the <D2D_MATRIX_3X2_F> value of the receiver's 'maskTransform' field."

	^D2D_MATRIX_3X2_F fromAddress: bytes yourAddress + ##(self offsetOf: #maskTransform)!

maskTransform: aD2D_MATRIX_3X2_F
	"Set the receiver's 'maskTransform' field to the value of the argument, aD2D_MATRIX_3X2_F"

	aD2D_MATRIX_3X2_F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #maskTransform) + 1)
		to: ##((self offsetOf: #maskTransform) + D2D_MATRIX_3X2_F basicByteSize)
		startingAt: 1!

opacity
	"Answer the <Float> value of the receiver's 'opacity' field."

	^bytes floatAtOffset: ##(self offsetOf: #opacity)!

opacity: aFloat
	"Set the receiver's 'opacity' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #opacity) put: aFloat!

opacityBrush
	"Answer the <ID2D1Brush> value of the receiver's 'opacityBrush' field."

	^ID2D1Brush fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #opacityBrush))!

opacityBrush: anID2D1Brush
	"Set the receiver's 'opacityBrush' field to the value of the argument, anID2D1Brush"

	bytes uintPtrAtOffset: ##(self offsetOf: #opacityBrush) put: anID2D1Brush yourAddress! !
!D2D1_LAYER_PARAMETERS categoriesFor: #contentBounds!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #contentBounds:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #geometricMask!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #geometricMask:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #layerOptions!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #layerOptions:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #maskAntialiasMode!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #maskAntialiasMode:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #maskTransform!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #maskTransform:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #opacity!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #opacity:!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #opacityBrush!**compiled accessors**!public! !
!D2D1_LAYER_PARAMETERS categoriesFor: #opacityBrush:!**compiled accessors**!public! !

!D2D1_LAYER_PARAMETERS class methodsFor!

defineFields
	"Define the fields of the D2D1_LAYER_PARAMETERS structure.

	D2D1_LAYER_PARAMETERS compileDefinition

		typedef [uuid(8d32343e-7333-4d68-bc76-8bb955b38cb2)]
		struct tagD2D1_LAYER_PARAMETERS {
			D2D_RECT_F contentBounds;
			ID2D1Geometry* geometricMask;
			D2D1_ANTIALIAS_MODE maskAntialiasMode;
			D2D_MATRIX_3X2_F maskTransform;
			float opacity;
			ID2D1Brush* opacityBrush;
			D2D1_LAYER_OPTIONS layerOptions;
		} D2D1_LAYER_PARAMETERS;
"

	self
		defineField: #contentBounds type: (StructureField type: D2D_RECT_F) offset: 0;
		defineField: #geometricMask type: (PointerField type: ID2D1Geometry) offset: 16;
		defineField: #maskAntialiasMode type: SDWORDField new offset: 20;
		defineField: #maskTransform type: (StructureField type: D2D_MATRIX_3X2_F) offset: 24;
		defineField: #opacity type: FLOATField new offset: 48;
		defineField: #opacityBrush type: (PointerField type: ID2D1Brush) offset: 52;
		defineField: #layerOptions type: SDWORDField new offset: 56.
	self byteSize: 60! !
!D2D1_LAYER_PARAMETERS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

