"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES guid: (GUID fromString: '{09f28bdf-423f-40dd-bf6c-06b639ee35d8}')!
D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES comment: '`D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(09f28bdf-423f-40dd-bf6c-06b639ee35d8)]
struct tagD2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES {
	D2D_POINT_2F startPoint;
	D2D_POINT_2F endPoint;
} D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES;

```'!
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES methodsFor!

endPoint
	"Answer the <D2D_POINT_2F> value of the receiver's 'endPoint' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress + ##(self offsetOf: #endPoint)!

endPoint: aD2D_POINT_2F
	"Set the receiver's 'endPoint' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #endPoint) + 1)
		to: ##((self offsetOf: #endPoint) + D2D_POINT_2F basicByteSize)
		startingAt: 1!

startPoint
	"Answer the <D2D_POINT_2F> value of the receiver's 'startPoint' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress!

startPoint: aD2D_POINT_2F
	"Set the receiver's 'startPoint' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_POINT_2F basicByteSize)
		startingAt: 1! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES categoriesFor: #endPoint!**compiled accessors**!public! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES categoriesFor: #endPoint:!**compiled accessors**!public! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES categoriesFor: #startPoint!**compiled accessors**!public! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES categoriesFor: #startPoint:!**compiled accessors**!public! !

!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES structure.

	D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES compileDefinition

		typedef [uuid(09f28bdf-423f-40dd-bf6c-06b639ee35d8)]
		struct tagD2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES {
			D2D_POINT_2F startPoint;
			D2D_POINT_2F endPoint;
		} D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES;
"

	self
		defineField: #startPoint type: (StructureField type: D2D_POINT_2F) offset: 0;
		defineField: #endPoint type: (StructureField type: D2D_POINT_2F) offset: 8.
	self byteSize: 16! !
!D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

