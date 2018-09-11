"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_BITMAP_BRUSH_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_BITMAP_BRUSH_PROPERTIES guid: (GUID fromString: '{f9dce64a-d9e5-466c-bc33-558647b87286}')!
D2D1_BITMAP_BRUSH_PROPERTIES comment: '`D2D1_BITMAP_BRUSH_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_BITMAP_BRUSH_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(f9dce64a-d9e5-466c-bc33-558647b87286)]
struct tagD2D1_BITMAP_BRUSH_PROPERTIES {
	D2D1_EXTEND_MODE extendModeX;
	D2D1_EXTEND_MODE extendModeY;
	D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
} D2D1_BITMAP_BRUSH_PROPERTIES;

```'!
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_BITMAP_BRUSH_PROPERTIES methodsFor!

extendModeX
	"Answer the <Integer> value of the receiver's 'extendModeX' field."

	^bytes sdwordAtOffset: 0!

extendModeX: anInteger
	"Set the receiver's 'extendModeX' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

extendModeY
	"Answer the <Integer> value of the receiver's 'extendModeY' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #extendModeY)!

extendModeY: anInteger
	"Set the receiver's 'extendModeY' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #extendModeY) put: anInteger!

interpolationMode
	"Answer the <Integer> value of the receiver's 'interpolationMode' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #interpolationMode)!

interpolationMode: anInteger
	"Set the receiver's 'interpolationMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #interpolationMode) put: anInteger! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #extendModeX!**compiled accessors**!public! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #extendModeX:!**compiled accessors**!public! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #extendModeY!**compiled accessors**!public! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #extendModeY:!**compiled accessors**!public! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #interpolationMode!**compiled accessors**!public! !
!D2D1_BITMAP_BRUSH_PROPERTIES categoriesFor: #interpolationMode:!**compiled accessors**!public! !

!D2D1_BITMAP_BRUSH_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_BITMAP_BRUSH_PROPERTIES structure.

	D2D1_BITMAP_BRUSH_PROPERTIES compileDefinition

		typedef [uuid(f9dce64a-d9e5-466c-bc33-558647b87286)]
		struct tagD2D1_BITMAP_BRUSH_PROPERTIES {
			D2D1_EXTEND_MODE extendModeX;
			D2D1_EXTEND_MODE extendModeY;
			D2D1_BITMAP_INTERPOLATION_MODE interpolationMode;
		} D2D1_BITMAP_BRUSH_PROPERTIES;
"

	self
		defineField: #extendModeX type: SDWORDField new offset: 0;
		defineField: #extendModeY type: SDWORDField new offset: 4;
		defineField: #interpolationMode type: SDWORDField new offset: 8.
	self byteSize: 12! !
!D2D1_BITMAP_BRUSH_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

