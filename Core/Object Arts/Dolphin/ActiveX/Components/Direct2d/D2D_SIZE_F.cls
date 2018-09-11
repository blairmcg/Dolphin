"Filed out from Dolphin Smalltalk 7"!

ExternalSize subclass: #D2D_SIZE_F
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_SIZE_F guid: (GUID fromString: '{4e19564c-2916-4b6b-948c-4beddbfdf07e}')!
D2D_SIZE_F comment: '`D2D_SIZE_F` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_SIZE_F'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D_SIZE_F {
	float width;
	float height;
} D2D_SIZE_F;

```'!
!D2D_SIZE_F categoriesForClass!Direct2d-Structs! !
!D2D_SIZE_F methodsFor!

height
	"Answer the <Float> value of the receiver's 'height' field."

	^bytes floatAtOffset: ##(self offsetOf: #height)!

height: aFloat
	"Set the receiver's 'height' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #height) put: aFloat!

width
	"Answer the <Float> value of the receiver's 'width' field."

	^bytes floatAtOffset: 0!

width: aFloat
	"Set the receiver's 'width' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!D2D_SIZE_F categoriesFor: #height!**compiled accessors**!public! !
!D2D_SIZE_F categoriesFor: #height:!**compiled accessors**!public! !
!D2D_SIZE_F categoriesFor: #width!**compiled accessors**!public! !
!D2D_SIZE_F categoriesFor: #width:!**compiled accessors**!public! !

!D2D_SIZE_F class methodsFor!

defineFields
	"Define the fields of the D2D_SIZE_F structure.

	D2D_SIZE_F compileDefinition

		typedef 
		struct tagD2D_SIZE_F {
			float width;
			float height;
		} D2D_SIZE_F;
"

	self
		defineField: #width type: FLOATField new offset: 0;
		defineField: #height type: FLOATField new offset: 4.
	self byteSize: 8!

width: cx height: cy 
	"Answer a new instance of the receiver representing the Point whose cartesian coordinates
	are the arguments.

	Implementation Note: For performance reasons avoid going through all the <ExternalStructure>
	framework methods."

	^self basicNew bytes: ((ByteArray newFixed: 8)
				floatAtOffset: 0 put: cx;
				floatAtOffset: 4 put: cy;
				yourself)! !
!D2D_SIZE_F class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!D2D_SIZE_F class categoriesFor: #width:height:!instance creation!public! !

