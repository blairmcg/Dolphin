"Filed out from Dolphin Smalltalk 7"!

ExternalRectangle subclass: #D2D_RECT_U
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_RECT_U guid: (GUID fromString: '{17092653-8628-4f9e-ba7d-184b33161758}')!
D2D_RECT_U comment: '`D2D_RECT_U` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_RECT_U'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D_RECT_U {
	unsigned int left;
	unsigned int top;
	unsigned int right;
	unsigned int bottom;
} D2D_RECT_U;

```'!
!D2D_RECT_U categoriesForClass!Direct2d-Structs! !
!D2D_RECT_U methodsFor!

bottom
	"Answer the <Integer> value of the receiver's 'bottom' field."

	^bytes dwordAtOffset: ##(self offsetOf: #bottom)!

bottom: anInteger
	"Set the receiver's 'bottom' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #bottom) put: anInteger!

left
	"Answer the <Integer> value of the receiver's 'left' field."

	^bytes dwordAtOffset: 0!

left: anInteger
	"Set the receiver's 'left' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

right
	"Answer the <Integer> value of the receiver's 'right' field."

	^bytes dwordAtOffset: ##(self offsetOf: #right)!

right: anInteger
	"Set the receiver's 'right' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #right) put: anInteger!

top
	"Answer the <Integer> value of the receiver's 'top' field."

	^bytes dwordAtOffset: ##(self offsetOf: #top)!

top: anInteger
	"Set the receiver's 'top' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #top) put: anInteger! !
!D2D_RECT_U categoriesFor: #bottom!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #bottom:!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #left!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #left:!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #right!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #right:!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #top!**compiled accessors**!public! !
!D2D_RECT_U categoriesFor: #top:!**compiled accessors**!public! !

!D2D_RECT_U class methodsFor!

defineFields
	"Define the fields of the D2D_RECT_U structure.

	D2D_RECT_U compileDefinition

		typedef 
		struct tagD2D_RECT_U {
			unsigned int left;
			unsigned int top;
			unsigned int right;
			unsigned int bottom;
		} D2D_RECT_U;
"

	self
		defineField: #left type: DWORDField new offset: 0;
		defineField: #top type: DWORDField new offset: 4;
		defineField: #right type: DWORDField new offset: 8;
		defineField: #bottom type: DWORDField new offset: 12.
	self byteSize: 16!

left: leftInteger top: topInteger right: rightInteger bottom: bottomInteger 
	"Answer a new instance of the receiver with the specified position
	corner positions."

	"Implementation Note: For performance reasons do this all with low-level
	inline code."

	^self basicNew bytes: ((ByteArray newFixed: 16)
				dwordAtOffset: 0 put: leftInteger;
				dwordAtOffset: 4 put: topInteger;
				dwordAtOffset: 8 put: rightInteger;
				dwordAtOffset: 12 put: bottomInteger;
				yourself)! !
!D2D_RECT_U class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!D2D_RECT_U class categoriesFor: #left:top:right:bottom:!instance creation!public! !

