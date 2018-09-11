"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_DRAWING_STATE_DESCRIPTION
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_DRAWING_STATE_DESCRIPTION guid: (GUID fromString: '{f797ec47-231e-47fa-85a9-6348d1928954}')!
D2D1_DRAWING_STATE_DESCRIPTION comment: '`D2D1_DRAWING_STATE_DESCRIPTION` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_DRAWING_STATE_DESCRIPTION'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(f797ec47-231e-47fa-85a9-6348d1928954)]
struct tagD2D1_DRAWING_STATE_DESCRIPTION {
	D2D1_ANTIALIAS_MODE antialiasMode;
	D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
	D2D1_TAG tag1;
	D2D1_TAG tag2;
	D2D_MATRIX_3X2_F transform;
} D2D1_DRAWING_STATE_DESCRIPTION;

```'!
!D2D1_DRAWING_STATE_DESCRIPTION categoriesForClass!Direct2d-Structs! !
!D2D1_DRAWING_STATE_DESCRIPTION methodsFor!

antialiasMode
	"Answer the <Integer> value of the receiver's 'antialiasMode' field."

	^bytes sdwordAtOffset: 0!

antialiasMode: anInteger
	"Set the receiver's 'antialiasMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

tag1
	"Answer the <Integer> value of the receiver's 'tag1' field."

	^bytes qwordAtOffset: ##(self offsetOf: #tag1)!

tag1: anInteger
	"Set the receiver's 'tag1' field to the value of the argument, anInteger"

	bytes qwordAtOffset: ##(self offsetOf: #tag1) put: anInteger!

tag2
	"Answer the <Integer> value of the receiver's 'tag2' field."

	^bytes qwordAtOffset: ##(self offsetOf: #tag2)!

tag2: anInteger
	"Set the receiver's 'tag2' field to the value of the argument, anInteger"

	bytes qwordAtOffset: ##(self offsetOf: #tag2) put: anInteger!

textAntialiasMode
	"Answer the <Integer> value of the receiver's 'textAntialiasMode' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #textAntialiasMode)!

textAntialiasMode: anInteger
	"Set the receiver's 'textAntialiasMode' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #textAntialiasMode) put: anInteger!

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
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #antialiasMode!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #antialiasMode:!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #tag1!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #tag1:!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #tag2!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #tag2:!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #textAntialiasMode!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #textAntialiasMode:!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #transform!**compiled accessors**!public! !
!D2D1_DRAWING_STATE_DESCRIPTION categoriesFor: #transform:!**compiled accessors**!public! !

!D2D1_DRAWING_STATE_DESCRIPTION class methodsFor!

defineFields
	"Define the fields of the D2D1_DRAWING_STATE_DESCRIPTION structure.

	D2D1_DRAWING_STATE_DESCRIPTION compileDefinition

		typedef [uuid(f797ec47-231e-47fa-85a9-6348d1928954)]
		struct tagD2D1_DRAWING_STATE_DESCRIPTION {
			D2D1_ANTIALIAS_MODE antialiasMode;
			D2D1_TEXT_ANTIALIAS_MODE textAntialiasMode;
			D2D1_TAG tag1;
			D2D1_TAG tag2;
			D2D_MATRIX_3X2_F transform;
		} D2D1_DRAWING_STATE_DESCRIPTION;
"

	self
		defineField: #antialiasMode type: SDWORDField new offset: 0;
		defineField: #textAntialiasMode type: SDWORDField new offset: 4;
		defineField: #tag1 type: QWORDField new offset: 8;
		defineField: #tag2 type: QWORDField new offset: 16;
		defineField: #transform type: (StructureField type: D2D_MATRIX_3X2_F) offset: 24.
	self byteSize: 48! !
!D2D1_DRAWING_STATE_DESCRIPTION class categoriesFor: #defineFields!**auto generated**!initializing!public! !

