"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_OVERHANG_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_OVERHANG_METRICS guid: (GUID fromString: '{ee19f9a2-9795-451e-a5ed-1d57901bfa40}')!
DWRITE_OVERHANG_METRICS comment: '`DWRITE_OVERHANG_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_OVERHANG_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_OVERHANG_METRICS structure holds how much any visible pixels (in DIPs) overshoot each side of the layout or inline objects."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(ee19f9a2-9795-451e-a5ed-1d57901bfa40), helpstring("The DWRITE_OVERHANG_METRICS structure holds how much any visible pixels (in DIPs) overshoot each side of the layout or inline objects.")]
struct tagDWRITE_OVERHANG_METRICS {
	float left;
	float top;
	float right;
	float bottom;
} DWRITE_OVERHANG_METRICS;

```'!
!DWRITE_OVERHANG_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_OVERHANG_METRICS methodsFor!

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
!DWRITE_OVERHANG_METRICS categoriesFor: #bottom!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #bottom:!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #left!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #left:!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #right!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #right:!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #top!**compiled accessors**!public! !
!DWRITE_OVERHANG_METRICS categoriesFor: #top:!**compiled accessors**!public! !

!DWRITE_OVERHANG_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_OVERHANG_METRICS structure.

	DWRITE_OVERHANG_METRICS compileDefinition

		typedef [uuid(ee19f9a2-9795-451e-a5ed-1d57901bfa40), helpstring('The DWRITE_OVERHANG_METRICS structure holds how much any visible pixels (in DIPs) overshoot each side of the layout or inline objects.')]
		struct tagDWRITE_OVERHANG_METRICS {
			float left;
			float top;
			float right;
			float bottom;
		} DWRITE_OVERHANG_METRICS;
"

	self
		defineField: #left type: FLOATField new offset: 0;
		defineField: #top type: FLOATField new offset: 4;
		defineField: #right type: FLOATField new offset: 8;
		defineField: #bottom type: FLOATField new offset: 12.
	self byteSize: 16! !
!DWRITE_OVERHANG_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

