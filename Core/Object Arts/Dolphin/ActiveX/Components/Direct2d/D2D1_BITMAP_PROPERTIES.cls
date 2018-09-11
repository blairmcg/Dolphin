"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_BITMAP_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_BITMAP_PROPERTIES guid: (GUID fromString: '{d40cba1e-ad55-409b-a056-8fb672eac2cd}')!
D2D1_BITMAP_PROPERTIES comment: '`D2D1_BITMAP_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_BITMAP_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(d40cba1e-ad55-409b-a056-8fb672eac2cd)]
struct tagD2D1_BITMAP_PROPERTIES {
	D2D1_PIXEL_FORMAT pixelFormat;
	float dpiX;
	float dpiY;
} D2D1_BITMAP_PROPERTIES;

```'!
!D2D1_BITMAP_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_BITMAP_PROPERTIES methodsFor!

dpiX
	"Answer the <Float> value of the receiver's 'dpiX' field."

	^bytes floatAtOffset: ##(self offsetOf: #dpiX)!

dpiX: aFloat
	"Set the receiver's 'dpiX' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dpiX) put: aFloat!

dpiY
	"Answer the <Float> value of the receiver's 'dpiY' field."

	^bytes floatAtOffset: ##(self offsetOf: #dpiY)!

dpiY: aFloat
	"Set the receiver's 'dpiY' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dpiY) put: aFloat!

pixelFormat
	"Answer the <D2D1_PIXEL_FORMAT> value of the receiver's 'pixelFormat' field."

	^D2D1_PIXEL_FORMAT fromAddress: bytes yourAddress!

pixelFormat: aD2D1_PIXEL_FORMAT
	"Set the receiver's 'pixelFormat' field to the value of the argument, aD2D1_PIXEL_FORMAT"

	aD2D1_PIXEL_FORMAT
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D1_PIXEL_FORMAT basicByteSize)
		startingAt: 1! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #dpiX!**compiled accessors**!public! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #dpiX:!**compiled accessors**!public! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #dpiY!**compiled accessors**!public! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #dpiY:!**compiled accessors**!public! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #pixelFormat!**compiled accessors**!public! !
!D2D1_BITMAP_PROPERTIES categoriesFor: #pixelFormat:!**compiled accessors**!public! !

!D2D1_BITMAP_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_BITMAP_PROPERTIES structure.

	D2D1_BITMAP_PROPERTIES compileDefinition

		typedef [uuid(d40cba1e-ad55-409b-a056-8fb672eac2cd)]
		struct tagD2D1_BITMAP_PROPERTIES {
			D2D1_PIXEL_FORMAT pixelFormat;
			float dpiX;
			float dpiY;
		} D2D1_BITMAP_PROPERTIES;
"

	self
		defineField: #pixelFormat type: (StructureField type: D2D1_PIXEL_FORMAT) offset: 0;
		defineField: #dpiX type: FLOATField new offset: 8;
		defineField: #dpiY type: FLOATField new offset: 12.
	self byteSize: 16! !
!D2D1_BITMAP_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

