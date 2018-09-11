"Filed out from Dolphin Smalltalk 7"!

ExternalSize subclass: #D2D_SIZE_U
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_SIZE_U guid: (GUID fromString: '{be2c2809-abe1-45cb-b628-94ca38a07a79}')!
D2D_SIZE_U comment: '`D2D_SIZE_U` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_SIZE_U'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D_SIZE_U {
	unsigned int width;
	unsigned int height;
} D2D_SIZE_U;

```'!
!D2D_SIZE_U categoriesForClass!Direct2d-Structs! !
!D2D_SIZE_U methodsFor!

height
	"Answer the <Integer> value of the receiver's 'height' field."

	^bytes dwordAtOffset: ##(self offsetOf: #height)!

height: anInteger
	"Set the receiver's 'height' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #height) put: anInteger!

width
	"Answer the <Integer> value of the receiver's 'width' field."

	^bytes dwordAtOffset: 0!

width: anInteger
	"Set the receiver's 'width' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger! !
!D2D_SIZE_U categoriesFor: #height!**compiled accessors**!public! !
!D2D_SIZE_U categoriesFor: #height:!**compiled accessors**!public! !
!D2D_SIZE_U categoriesFor: #width!**compiled accessors**!public! !
!D2D_SIZE_U categoriesFor: #width:!**compiled accessors**!public! !

!D2D_SIZE_U class methodsFor!

defineFields
	"Define the fields of the D2D_SIZE_U structure.

	D2D_SIZE_U compileDefinition

		typedef 
		struct tagD2D_SIZE_U {
			unsigned int width;
			unsigned int height;
		} D2D_SIZE_U;
"

	self
		defineField: #width type: DWORDField new offset: 0;
		defineField: #height type: DWORDField new offset: 4.
	self byteSize: 8!

width: cx height: cy 
	"Answer a new instance of the receiver representing the Point whose cartesian coordinates
	are the arguments.

	Implementation Note: For performance reasons avoid going through all the <ExternalStructure>
	framework methods."

	^self basicNew bytes: ((ByteArray newFixed: 8)
				dwordAtOffset: 0 put: cx;
				dwordAtOffset: 4 put: cy;
				yourself)! !
!D2D_SIZE_U class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!D2D_SIZE_U class categoriesFor: #width:height:!instance creation!public! !

