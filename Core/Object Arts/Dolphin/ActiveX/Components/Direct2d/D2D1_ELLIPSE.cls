"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_ELLIPSE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_ELLIPSE guid: (GUID fromString: '{2ea3fa87-bf38-449d-9b57-927b2267f3f5}')!
D2D1_ELLIPSE comment: '`D2D1_ELLIPSE` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_ELLIPSE'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(2ea3fa87-bf38-449d-9b57-927b2267f3f5)]
struct tagD2D1_ELLIPSE {
	D2D_POINT_2F point;
	float radiusX;
	float radiusY;
} D2D1_ELLIPSE;

```'!
!D2D1_ELLIPSE categoriesForClass!Direct2d-Structs! !
!D2D1_ELLIPSE methodsFor!

point
	"Answer the <D2D_POINT_2F> value of the receiver's 'point' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress!

point: aD2D_POINT_2F
	"Set the receiver's 'point' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_POINT_2F basicByteSize)
		startingAt: 1!

radiusX
	"Answer the <Float> value of the receiver's 'radiusX' field."

	^bytes floatAtOffset: ##(self offsetOf: #radiusX)!

radiusX: aFloat
	"Set the receiver's 'radiusX' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #radiusX) put: aFloat!

radiusY
	"Answer the <Float> value of the receiver's 'radiusY' field."

	^bytes floatAtOffset: ##(self offsetOf: #radiusY)!

radiusY: aFloat
	"Set the receiver's 'radiusY' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #radiusY) put: aFloat! !
!D2D1_ELLIPSE categoriesFor: #point!**compiled accessors**!public! !
!D2D1_ELLIPSE categoriesFor: #point:!**compiled accessors**!public! !
!D2D1_ELLIPSE categoriesFor: #radiusX!**compiled accessors**!public! !
!D2D1_ELLIPSE categoriesFor: #radiusX:!**compiled accessors**!public! !
!D2D1_ELLIPSE categoriesFor: #radiusY!**compiled accessors**!public! !
!D2D1_ELLIPSE categoriesFor: #radiusY:!**compiled accessors**!public! !

!D2D1_ELLIPSE class methodsFor!

defineFields
	"Define the fields of the D2D1_ELLIPSE structure.

	D2D1_ELLIPSE compileDefinition

		typedef [uuid(2ea3fa87-bf38-449d-9b57-927b2267f3f5)]
		struct tagD2D1_ELLIPSE {
			D2D_POINT_2F point;
			float radiusX;
			float radiusY;
		} D2D1_ELLIPSE;
"

	self
		defineField: #point type: (StructureField type: D2D_POINT_2F) offset: 0;
		defineField: #radiusX type: FLOATField new offset: 8;
		defineField: #radiusY type: FLOATField new offset: 12.
	self byteSize: 16! !
!D2D1_ELLIPSE class categoriesFor: #defineFields!**auto generated**!initializing!public! !

