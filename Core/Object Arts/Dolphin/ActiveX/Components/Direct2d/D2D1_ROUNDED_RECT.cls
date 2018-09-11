"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_ROUNDED_RECT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_ROUNDED_RECT guid: (GUID fromString: '{cf7f7d9f-bde1-454c-8b30-3ebf061aedc2}')!
D2D1_ROUNDED_RECT comment: '`D2D1_ROUNDED_RECT` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_ROUNDED_RECT'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(cf7f7d9f-bde1-454c-8b30-3ebf061aedc2)]
struct tagD2D1_ROUNDED_RECT {
	D2D_RECT_F rect;
	float radiusX;
	float radiusY;
} D2D1_ROUNDED_RECT;

```'!
!D2D1_ROUNDED_RECT categoriesForClass!Direct2d-Structs! !
!D2D1_ROUNDED_RECT methodsFor!

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

	bytes floatAtOffset: ##(self offsetOf: #radiusY) put: aFloat!

rect
	"Answer the <D2D_RECT_F> value of the receiver's 'rect' field."

	^D2D_RECT_F fromAddress: bytes yourAddress!

rect: aD2D_RECT_F
	"Set the receiver's 'rect' field to the value of the argument, aD2D_RECT_F"

	aD2D_RECT_F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_RECT_F basicByteSize)
		startingAt: 1! !
!D2D1_ROUNDED_RECT categoriesFor: #radiusX!**compiled accessors**!public! !
!D2D1_ROUNDED_RECT categoriesFor: #radiusX:!**compiled accessors**!public! !
!D2D1_ROUNDED_RECT categoriesFor: #radiusY!**compiled accessors**!public! !
!D2D1_ROUNDED_RECT categoriesFor: #radiusY:!**compiled accessors**!public! !
!D2D1_ROUNDED_RECT categoriesFor: #rect!**compiled accessors**!public! !
!D2D1_ROUNDED_RECT categoriesFor: #rect:!**compiled accessors**!public! !

!D2D1_ROUNDED_RECT class methodsFor!

defineFields
	"Define the fields of the D2D1_ROUNDED_RECT structure.

	D2D1_ROUNDED_RECT compileDefinition

		typedef [uuid(cf7f7d9f-bde1-454c-8b30-3ebf061aedc2)]
		struct tagD2D1_ROUNDED_RECT {
			D2D_RECT_F rect;
			float radiusX;
			float radiusY;
		} D2D1_ROUNDED_RECT;
"

	self
		defineField: #rect type: (StructureField type: D2D_RECT_F) offset: 0;
		defineField: #radiusX type: FLOATField new offset: 16;
		defineField: #radiusY type: FLOATField new offset: 20.
	self byteSize: 24! !
!D2D1_ROUNDED_RECT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

