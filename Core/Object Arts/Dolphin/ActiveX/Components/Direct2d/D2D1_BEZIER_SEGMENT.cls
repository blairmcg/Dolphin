"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_BEZIER_SEGMENT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_BEZIER_SEGMENT guid: (GUID fromString: '{1030f7e8-61d8-4403-8cb8-fc0af690cc91}')!
D2D1_BEZIER_SEGMENT comment: '`D2D1_BEZIER_SEGMENT` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_BEZIER_SEGMENT'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(1030f7e8-61d8-4403-8cb8-fc0af690cc91)]
struct tagD2D1_BEZIER_SEGMENT {
	D2D_POINT_2F point1;
	D2D_POINT_2F point2;
	D2D_POINT_2F point3;
} D2D1_BEZIER_SEGMENT;

```'!
!D2D1_BEZIER_SEGMENT categoriesForClass!Direct2d-Structs! !
!D2D1_BEZIER_SEGMENT methodsFor!

point1
	"Answer the <D2D_POINT_2F> value of the receiver's 'point1' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress!

point1: aD2D_POINT_2F
	"Set the receiver's 'point1' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: 1
		to: ##(D2D_POINT_2F basicByteSize)
		startingAt: 1!

point2
	"Answer the <D2D_POINT_2F> value of the receiver's 'point2' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress + ##(self offsetOf: #point2)!

point2: aD2D_POINT_2F
	"Set the receiver's 'point2' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #point2) + 1)
		to: ##((self offsetOf: #point2) + D2D_POINT_2F basicByteSize)
		startingAt: 1!

point3
	"Answer the <D2D_POINT_2F> value of the receiver's 'point3' field."

	^D2D_POINT_2F fromAddress: bytes yourAddress + ##(self offsetOf: #point3)!

point3: aD2D_POINT_2F
	"Set the receiver's 'point3' field to the value of the argument, aD2D_POINT_2F"

	aD2D_POINT_2F
		replaceBytesOf: bytes
		from: ##((self offsetOf: #point3) + 1)
		to: ##((self offsetOf: #point3) + D2D_POINT_2F basicByteSize)
		startingAt: 1! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point1!**compiled accessors**!public! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point1:!**compiled accessors**!public! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point2!**compiled accessors**!public! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point2:!**compiled accessors**!public! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point3!**compiled accessors**!public! !
!D2D1_BEZIER_SEGMENT categoriesFor: #point3:!**compiled accessors**!public! !

!D2D1_BEZIER_SEGMENT class methodsFor!

defineFields
	"Define the fields of the D2D1_BEZIER_SEGMENT structure.

	D2D1_BEZIER_SEGMENT compileDefinition

		typedef [uuid(1030f7e8-61d8-4403-8cb8-fc0af690cc91)]
		struct tagD2D1_BEZIER_SEGMENT {
			D2D_POINT_2F point1;
			D2D_POINT_2F point2;
			D2D_POINT_2F point3;
		} D2D1_BEZIER_SEGMENT;
"

	self
		defineField: #point1 type: (StructureField type: D2D_POINT_2F) offset: 0;
		defineField: #point2 type: (StructureField type: D2D_POINT_2F) offset: 8;
		defineField: #point3 type: (StructureField type: D2D_POINT_2F) offset: 16.
	self byteSize: 24! !
!D2D1_BEZIER_SEGMENT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

