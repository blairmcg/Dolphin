"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_GRADIENT_STOP
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_GRADIENT_STOP guid: (GUID fromString: '{114ca729-5b8f-4a8d-beb9-5966fc6b2c5e}')!
D2D1_GRADIENT_STOP comment: '`D2D1_GRADIENT_STOP` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_GRADIENT_STOP'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(114ca729-5b8f-4a8d-beb9-5966fc6b2c5e)]
struct tagD2D1_GRADIENT_STOP {
	float position;
	D3DCOLORVALUE color;
} D2D1_GRADIENT_STOP;

```'!
!D2D1_GRADIENT_STOP categoriesForClass!Direct2d-Structs! !
!D2D1_GRADIENT_STOP methodsFor!

color
	"Answer the <D3DCOLORVALUE> value of the receiver's 'color' field."

	^D3DCOLORVALUE fromAddress: bytes yourAddress + ##(self offsetOf: #color)!

color: aD3DCOLORVALUE
	"Set the receiver's 'color' field to the value of the argument, aD3DCOLORVALUE"

	aD3DCOLORVALUE
		replaceBytesOf: bytes
		from: ##((self offsetOf: #color) + 1)
		to: ##((self offsetOf: #color) + D3DCOLORVALUE basicByteSize)
		startingAt: 1!

position
	"Answer the <Float> value of the receiver's 'position' field."

	^bytes floatAtOffset: 0!

position: aFloat
	"Set the receiver's 'position' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!D2D1_GRADIENT_STOP categoriesFor: #color!**compiled accessors**!public! !
!D2D1_GRADIENT_STOP categoriesFor: #color:!**compiled accessors**!public! !
!D2D1_GRADIENT_STOP categoriesFor: #position!**compiled accessors**!public! !
!D2D1_GRADIENT_STOP categoriesFor: #position:!**compiled accessors**!public! !

!D2D1_GRADIENT_STOP class methodsFor!

defineFields
	"Define the fields of the D2D1_GRADIENT_STOP structure.

	D2D1_GRADIENT_STOP compileDefinition

		typedef [uuid(114ca729-5b8f-4a8d-beb9-5966fc6b2c5e)]
		struct tagD2D1_GRADIENT_STOP {
			float position;
			D3DCOLORVALUE color;
		} D2D1_GRADIENT_STOP;
"

	self
		defineField: #position type: FLOATField new offset: 0;
		defineField: #color type: (StructureField type: D3DCOLORVALUE) offset: 4.
	self byteSize: 20! !
!D2D1_GRADIENT_STOP class categoriesFor: #defineFields!**auto generated**!initializing!public! !

