"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_ARC_SEGMENT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_ARC_SEGMENT guid: (GUID fromString: '{63370748-ac25-48e2-be9d-7336a610acdb}')!
D2D1_ARC_SEGMENT comment: '`D2D1_ARC_SEGMENT` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_ARC_SEGMENT'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(63370748-ac25-48e2-be9d-7336a610acdb)]
struct tagD2D1_ARC_SEGMENT {
	D2D_POINT_2F point;
	D2D_SIZE_F size;
	float rotationAngle;
	D2D1_SWEEP_DIRECTION sweepDirection;
	D2D1_ARC_SIZE arcSize;
} D2D1_ARC_SEGMENT;

```'!
!D2D1_ARC_SEGMENT categoriesForClass!Direct2d-Structs! !
!D2D1_ARC_SEGMENT methodsFor!

arcSize
	"Answer the <Integer> value of the receiver's 'arcSize' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #arcSize)!

arcSize: anInteger
	"Set the receiver's 'arcSize' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #arcSize) put: anInteger!

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

rotationAngle
	"Answer the <Float> value of the receiver's 'rotationAngle' field."

	^bytes floatAtOffset: ##(self offsetOf: #rotationAngle)!

rotationAngle: aFloat
	"Set the receiver's 'rotationAngle' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #rotationAngle) put: aFloat!

size
	"Answer the <D2D_SIZE_F> value of the receiver's 'size' field."

	^D2D_SIZE_F fromAddress: bytes yourAddress + ##(self offsetOf: #size)!

size: aD2D_SIZE_F
	"Set the receiver's 'size' field to the value of the argument, aD2D_SIZE_F"

	aD2D_SIZE_F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #size) + 1)
		to: ##((self offsetOf: #size) + D2D_SIZE_F basicByteSize)
		startingAt: 1!

sweepDirection
	"Answer the <Integer> value of the receiver's 'sweepDirection' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #sweepDirection)!

sweepDirection: anInteger
	"Set the receiver's 'sweepDirection' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #sweepDirection) put: anInteger! !
!D2D1_ARC_SEGMENT categoriesFor: #arcSize!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #arcSize:!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #point!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #point:!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #rotationAngle!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #rotationAngle:!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #size!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #size:!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #sweepDirection!**compiled accessors**!public! !
!D2D1_ARC_SEGMENT categoriesFor: #sweepDirection:!**compiled accessors**!public! !

!D2D1_ARC_SEGMENT class methodsFor!

defineFields
	"Define the fields of the D2D1_ARC_SEGMENT structure.

	D2D1_ARC_SEGMENT compileDefinition

		typedef [uuid(63370748-ac25-48e2-be9d-7336a610acdb)]
		struct tagD2D1_ARC_SEGMENT {
			D2D_POINT_2F point;
			D2D_SIZE_F size;
			float rotationAngle;
			D2D1_SWEEP_DIRECTION sweepDirection;
			D2D1_ARC_SIZE arcSize;
		} D2D1_ARC_SEGMENT;
"

	self
		defineField: #point type: (StructureField type: D2D_POINT_2F) offset: 0;
		defineField: #size type: (StructureField type: D2D_SIZE_F) offset: 8;
		defineField: #rotationAngle type: FLOATField new offset: 16;
		defineField: #sweepDirection type: SDWORDField new offset: 20;
		defineField: #arcSize type: SDWORDField new offset: 24.
	self byteSize: 28! !
!D2D1_ARC_SEGMENT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

