"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES guid: (GUID fromString: '{e223f4b9-63f0-436f-9086-c400aa15a959}')!
D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES comment: '`D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(e223f4b9-63f0-436f-9086-c400aa15a959)]
struct tagD2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
	D2D_POINT_2F center;
	D2D_POINT_2F gradientOriginOffset;
	float radiusX;
	float radiusY;
} D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES;

```'!
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES methodsFor!

center
	"Answer the <D2D_POINT_2F> value of the receiver's 'center' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress!

center: aD2D_POINT_2F
	"Set the receiver's 'center' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_POINT_2F basicByteSize)
		startingAt: 1!

gradientOriginOffset
	"Answer the <D2D_POINT_2F> value of the receiver's 'gradientOriginOffset' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress + ##(self offsetOf: #gradientOriginOffset)!

gradientOriginOffset: aD2D_POINT_2F
	"Set the receiver's 'gradientOriginOffset' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #gradientOriginOffset) + 1)
		to: ##((self offsetOf: #gradientOriginOffset) + D2D_POINT_2F basicByteSize)
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
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #center!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #center:!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #gradientOriginOffset!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #gradientOriginOffset:!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #radiusX!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #radiusX:!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #radiusY!**compiled accessors**!public! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES categoriesFor: #radiusY:!**compiled accessors**!public! !

!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES structure.

	D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES compileDefinition

		typedef [uuid(e223f4b9-63f0-436f-9086-c400aa15a959)]
		struct tagD2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES {
			D2D_POINT_2F center;
			D2D_POINT_2F gradientOriginOffset;
			float radiusX;
			float radiusY;
		} D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES;
"

	self
		defineField: #center type: (StructureField type: D2D_POINT_2F) offset: 0;
		defineField: #gradientOriginOffset type: (StructureField type: D2D_POINT_2F) offset: 8;
		defineField: #radiusX type: FLOATField new offset: 16;
		defineField: #radiusY type: FLOATField new offset: 20.
	self byteSize: 24! !
!D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

