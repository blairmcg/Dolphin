"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_STROKE_STYLE_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_STROKE_STYLE_PROPERTIES guid: (GUID fromString: '{633f1d98-e21d-48c0-8ee7-6e26ad860d3e}')!
D2D1_STROKE_STYLE_PROPERTIES comment: '`D2D1_STROKE_STYLE_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_STROKE_STYLE_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(633f1d98-e21d-48c0-8ee7-6e26ad860d3e)]
struct tagD2D1_STROKE_STYLE_PROPERTIES {
	D2D1_CAP_STYLE startCap;
	D2D1_CAP_STYLE endCap;
	D2D1_CAP_STYLE dashCap;
	D2D1_LINE_JOIN lineJoin;
	float miterLimit;
	D2D1_DASH_STYLE dashStyle;
	float dashOffset;
} D2D1_STROKE_STYLE_PROPERTIES;

```'!
!D2D1_STROKE_STYLE_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_STROKE_STYLE_PROPERTIES methodsFor!

dashCap
	"Answer the <Integer> value of the receiver's 'dashCap' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #dashCap)!

dashCap: anInteger
	"Set the receiver's 'dashCap' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #dashCap) put: anInteger!

dashOffset
	"Answer the <Float> value of the receiver's 'dashOffset' field."

	^bytes floatAtOffset: ##(self offsetOf: #dashOffset)!

dashOffset: aFloat
	"Set the receiver's 'dashOffset' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dashOffset) put: aFloat!

dashStyle
	"Answer the <Integer> value of the receiver's 'dashStyle' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #dashStyle)!

dashStyle: anInteger
	"Set the receiver's 'dashStyle' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #dashStyle) put: anInteger!

endCap
	"Answer the <Integer> value of the receiver's 'endCap' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #endCap)!

endCap: anInteger
	"Set the receiver's 'endCap' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #endCap) put: anInteger!

lineJoin
	"Answer the <Integer> value of the receiver's 'lineJoin' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #lineJoin)!

lineJoin: anInteger
	"Set the receiver's 'lineJoin' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #lineJoin) put: anInteger!

miterLimit
	"Answer the <Float> value of the receiver's 'miterLimit' field."

	^bytes floatAtOffset: ##(self offsetOf: #miterLimit)!

miterLimit: aFloat
	"Set the receiver's 'miterLimit' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #miterLimit) put: aFloat!

startCap
	"Answer the <Integer> value of the receiver's 'startCap' field."

	^bytes sdwordAtOffset: 0!

startCap: anInteger
	"Set the receiver's 'startCap' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashCap!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashCap:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashOffset!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashOffset:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashStyle!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #dashStyle:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #endCap!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #endCap:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #lineJoin!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #lineJoin:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #miterLimit!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #miterLimit:!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #startCap!**compiled accessors**!public! !
!D2D1_STROKE_STYLE_PROPERTIES categoriesFor: #startCap:!**compiled accessors**!public! !

!D2D1_STROKE_STYLE_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_STROKE_STYLE_PROPERTIES structure.

	D2D1_STROKE_STYLE_PROPERTIES compileDefinition

		typedef [uuid(633f1d98-e21d-48c0-8ee7-6e26ad860d3e)]
		struct tagD2D1_STROKE_STYLE_PROPERTIES {
			D2D1_CAP_STYLE startCap;
			D2D1_CAP_STYLE endCap;
			D2D1_CAP_STYLE dashCap;
			D2D1_LINE_JOIN lineJoin;
			float miterLimit;
			D2D1_DASH_STYLE dashStyle;
			float dashOffset;
		} D2D1_STROKE_STYLE_PROPERTIES;
"

	self
		defineField: #startCap type: SDWORDField new offset: 0;
		defineField: #endCap type: SDWORDField new offset: 4;
		defineField: #dashCap type: SDWORDField new offset: 8;
		defineField: #lineJoin type: SDWORDField new offset: 12;
		defineField: #miterLimit type: FLOATField new offset: 16;
		defineField: #dashStyle type: SDWORDField new offset: 20;
		defineField: #dashOffset type: FLOATField new offset: 24.
	self byteSize: 28! !
!D2D1_STROKE_STYLE_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

