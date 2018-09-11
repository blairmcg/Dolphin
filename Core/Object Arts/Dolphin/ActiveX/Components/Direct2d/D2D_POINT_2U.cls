"Filed out from Dolphin Smalltalk 7"!

ExternalPoint subclass: #D2D_POINT_2U
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_POINT_2U guid: (GUID fromString: '{0d2a5a27-4ca8-46b9-b80f-ed17b15e8d1e}')!
D2D_POINT_2U comment: '`D2D_POINT_2U` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_POINT_2U'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D_POINT_2U {
	unsigned int x;
	unsigned int y;
} D2D_POINT_2U;

```'!
!D2D_POINT_2U categoriesForClass!Direct2d-Structs! !
!D2D_POINT_2U methodsFor!

x
	"Answer the <Integer> value of the receiver's 'x' field."

	^bytes dwordAtOffset: 0!

x: anInteger
	"Set the receiver's 'x' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

y
	"Answer the <Integer> value of the receiver's 'y' field."

	^bytes dwordAtOffset: ##(self offsetOf: #y)!

y: anInteger
	"Set the receiver's 'y' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #y) put: anInteger! !
!D2D_POINT_2U categoriesFor: #x!**compiled accessors**!public! !
!D2D_POINT_2U categoriesFor: #x:!**compiled accessors**!public! !
!D2D_POINT_2U categoriesFor: #y!**compiled accessors**!public! !
!D2D_POINT_2U categoriesFor: #y:!**compiled accessors**!public! !

!D2D_POINT_2U class methodsFor!

defineFields
	"Define the fields of the D2D_POINT_2U structure.

	D2D_POINT_2U compileDefinition

		typedef 
		struct tagD2D_POINT_2U {
			unsigned int x;
			unsigned int y;
		} D2D_POINT_2U;
"

	self
		defineField: #x type: DWORDField new offset: 0;
		defineField: #y type: DWORDField new offset: 4.
	self byteSize: 8!

x: x y: y
	"Answer a new instance of the receiver representing the Point whose 
	cartesian coordinates are the arguments.
	Implementation Note: For performance reasons avoid going through
	all the <ExternalStructure> framework methods."

	^self basicNew 
		bytes: ((ByteArray newFixed: 8)
				dwordAtOffset: 0 put: x;
				dwordAtOffset: 4 put: y;
				yourself)
! !
!D2D_POINT_2U class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!D2D_POINT_2U class categoriesFor: #x:y:!instance creation!public! !

