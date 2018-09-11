"Filed out from Dolphin Smalltalk 7"!

ExternalRectangle subclass: #D2D_RECT_F
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_RECT_F guid: (GUID fromString: '{f187511a-5c16-434d-8636-9bfa966c8c29}')!
D2D_RECT_F comment: '`D2D_RECT_F` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_RECT_F'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(f187511a-5c16-434d-8636-9bfa966c8c29)]
struct tagD2D_RECT_F {
	float left;
	float top;
	float right;
	float bottom;
} D2D_RECT_F;

```'!
!D2D_RECT_F categoriesForClass!Direct2d-Structs! !
!D2D_RECT_F methodsFor!

bottom
	"Answer the <Float> value of the receiver's 'bottom' field."

	^bytes floatAtOffset: ##(self offsetOf: #bottom)!

bottom: aFloat
	"Set the receiver's 'bottom' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #bottom) put: aFloat!

left
	"Answer the <Float> value of the receiver's 'left' field."

	^bytes floatAtOffset: 0!

left: aFloat
	"Set the receiver's 'left' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

right
	"Answer the <Float> value of the receiver's 'right' field."

	^bytes floatAtOffset: ##(self offsetOf: #right)!

right: aFloat
	"Set the receiver's 'right' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #right) put: aFloat!

top
	"Answer the <Float> value of the receiver's 'top' field."

	^bytes floatAtOffset: ##(self offsetOf: #top)!

top: aFloat
	"Set the receiver's 'top' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #top) put: aFloat! !
!D2D_RECT_F categoriesFor: #bottom!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #bottom:!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #left!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #left:!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #right!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #right:!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #top!**compiled accessors**!public! !
!D2D_RECT_F categoriesFor: #top:!**compiled accessors**!public! !

!D2D_RECT_F class methodsFor!

defineFields
	"Define the fields of the D2D_RECT_F structure.

	D2D_RECT_F compileDefinition

		typedef [uuid(f187511a-5c16-434d-8636-9bfa966c8c29)]
		struct tagD2D_RECT_F {
			float left;
			float top;
			float right;
			float bottom;
		} D2D_RECT_F;
"

	self
		defineField: #left type: FLOATField new offset: 0;
		defineField: #top type: FLOATField new offset: 4;
		defineField: #right type: FLOATField new offset: 8;
		defineField: #bottom type: FLOATField new offset: 12.
	self byteSize: 16!

left: leftFloat top: topFloat right: rightFloat bottom: bottomFloat
	"Answer a new instance of the receiver with the specified position
	corner positions."

	"Implementation Note: For performance reasons do this all with low-level
	inline code."

	^self basicNew bytes: ((ByteArray newFixed: 16)
				floatAtOffset: 0 put: leftFloat;
				floatAtOffset: 4 put: topFloat;
				floatAtOffset: 8 put: rightFloat;
				floatAtOffset: 12 put: bottomFloat;
				yourself)! !
!D2D_RECT_F class categoriesFor: #defineFields!**auto generated**!initializing!public! !
!D2D_RECT_F class categoriesFor: #left:top:right:bottom:!instance creation!public! !

