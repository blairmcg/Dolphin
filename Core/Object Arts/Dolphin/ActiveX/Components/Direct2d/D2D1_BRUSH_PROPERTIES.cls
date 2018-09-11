"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_BRUSH_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_BRUSH_PROPERTIES guid: (GUID fromString: '{e43aa575-845d-421e-8328-0a58f6b7b2ae}')!
D2D1_BRUSH_PROPERTIES comment: '`D2D1_BRUSH_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_BRUSH_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(e43aa575-845d-421e-8328-0a58f6b7b2ae)]
struct tagD2D1_BRUSH_PROPERTIES {
	float opacity;
	D2D_MATRIX_3X2_F transform;
} D2D1_BRUSH_PROPERTIES;

```'!
!D2D1_BRUSH_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_BRUSH_PROPERTIES methodsFor!

opacity
	"Answer the <Float> value of the receiver's 'opacity' field."

	^bytes floatAtOffset: 0!

opacity: aFloat
	"Set the receiver's 'opacity' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

transform
	"Answer the <D2D_MATRIX_3X2_F> value of the receiver's 'transform' field."

	^D2D_MATRIX_3X2_F fromAddress: bytes yourAddress + ##(self offsetOf: #transform)!

transform: aD2D_MATRIX_3X2_F
	"Set the receiver's 'transform' field to the value of the argument, aD2D_MATRIX_3X2_F"

	aD2D_MATRIX_3X2_F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #transform) + 1)
		to: ##((self offsetOf: #transform) + D2D_MATRIX_3X2_F basicByteSize)
		startingAt: 1! !
!D2D1_BRUSH_PROPERTIES categoriesFor: #opacity!**compiled accessors**!public! !
!D2D1_BRUSH_PROPERTIES categoriesFor: #opacity:!**compiled accessors**!public! !
!D2D1_BRUSH_PROPERTIES categoriesFor: #transform!**compiled accessors**!public! !
!D2D1_BRUSH_PROPERTIES categoriesFor: #transform:!**compiled accessors**!public! !

!D2D1_BRUSH_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_BRUSH_PROPERTIES structure.

	D2D1_BRUSH_PROPERTIES compileDefinition

		typedef [uuid(e43aa575-845d-421e-8328-0a58f6b7b2ae)]
		struct tagD2D1_BRUSH_PROPERTIES {
			float opacity;
			D2D_MATRIX_3X2_F transform;
		} D2D1_BRUSH_PROPERTIES;
"

	self
		defineField: #opacity type: FLOATField new offset: 0;
		defineField: #transform type: (StructureField type: D2D_MATRIX_3X2_F) offset: 4.
	self byteSize: 28! !
!D2D1_BRUSH_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

