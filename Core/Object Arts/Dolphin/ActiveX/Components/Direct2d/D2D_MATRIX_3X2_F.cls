"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D_MATRIX_3X2_F
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D_MATRIX_3X2_F guid: (GUID fromString: '{460291e7-4a3c-41df-b970-7bd8bce464eb}')!
D2D_MATRIX_3X2_F comment: '`D2D_MATRIX_3X2_F` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D_MATRIX_3X2_F'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD2D_MATRIX_3X2_F {
	union {
		struct {
			float m11;
			float m12;
			float m21;
			float m22;
			float dx;
			float dy;
		};
		struct {
			float _11;
			float _12;
			float _21;
			float _22;
			float _31;
			float _32;
		};
		float m[3][2];
	};
} D2D_MATRIX_3X2_F;

```'!
!D2D_MATRIX_3X2_F categoriesForClass!Direct2d-Structs! !
!D2D_MATRIX_3X2_F methodsFor!

_11
	"Answer the <Float> value of the receiver's '_11' field."

	^bytes floatAtOffset: 0!

_11: aFloat
	"Set the receiver's '_11' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

_12
	"Answer the <Float> value of the receiver's '_12' field."

	^bytes floatAtOffset: ##(self offsetOf: #_12)!

_12: aFloat
	"Set the receiver's '_12' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #_12) put: aFloat!

_21
	"Answer the <Float> value of the receiver's '_21' field."

	^bytes floatAtOffset: ##(self offsetOf: #_21)!

_21: aFloat
	"Set the receiver's '_21' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #_21) put: aFloat!

_22
	"Answer the <Float> value of the receiver's '_22' field."

	^bytes floatAtOffset: ##(self offsetOf: #_22)!

_22: aFloat
	"Set the receiver's '_22' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #_22) put: aFloat!

_31
	"Answer the <Float> value of the receiver's '_31' field."

	^bytes floatAtOffset: ##(self offsetOf: #_31)!

_31: aFloat
	"Set the receiver's '_31' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #_31) put: aFloat!

_32
	"Answer the <Float> value of the receiver's '_32' field."

	^bytes floatAtOffset: ##(self offsetOf: #_32)!

_32: aFloat
	"Set the receiver's '_32' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #_32) put: aFloat!

dx
	"Answer the <Float> value of the receiver's 'dx' field."

	^bytes floatAtOffset: ##(self offsetOf: #dx)!

dx: aFloat
	"Set the receiver's 'dx' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dx) put: aFloat!

dy
	"Answer the <Float> value of the receiver's 'dy' field."

	^bytes floatAtOffset: ##(self offsetOf: #dy)!

dy: aFloat
	"Set the receiver's 'dy' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dy) put: aFloat!

m
	"Answer the <FLOATArray> value of the receiver's 'm' field."

	^FLOATArray fromAddress: bytes yourAddress length: 6!

m: aFLOATArray
	"Set the receiver's 'm' field to the value of the argument, aFLOATArray"

	| size |
	size := aFLOATArray byteSize min: ##(6 * FLOATArray elementSize).
	aFLOATArray
		replaceBytesOf: bytes
		from: 1
		to: size
		startingAt: 1!

m11
	"Answer the <Float> value of the receiver's 'm11' field."

	^bytes floatAtOffset: 0!

m11: aFloat
	"Set the receiver's 'm11' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat!

m12
	"Answer the <Float> value of the receiver's 'm12' field."

	^bytes floatAtOffset: ##(self offsetOf: #m12)!

m12: aFloat
	"Set the receiver's 'm12' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #m12) put: aFloat!

m21
	"Answer the <Float> value of the receiver's 'm21' field."

	^bytes floatAtOffset: ##(self offsetOf: #m21)!

m21: aFloat
	"Set the receiver's 'm21' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #m21) put: aFloat!

m22
	"Answer the <Float> value of the receiver's 'm22' field."

	^bytes floatAtOffset: ##(self offsetOf: #m22)!

m22: aFloat
	"Set the receiver's 'm22' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #m22) put: aFloat! !
!D2D_MATRIX_3X2_F categoriesFor: #_11!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_11:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_12!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_12:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_21!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_21:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_22!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_22:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_31!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_31:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_32!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #_32:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #dx!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #dx:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #dy!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #dy:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m11!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m11:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m12!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m12:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m21!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m21:!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m22!**compiled accessors**!public! !
!D2D_MATRIX_3X2_F categoriesFor: #m22:!**compiled accessors**!public! !

!D2D_MATRIX_3X2_F class methodsFor!

defineFields
	"Define the fields of the D2D_MATRIX_3X2_F structure.

	D2D_MATRIX_3X2_F compileDefinition

		typedef 
		struct tagD2D_MATRIX_3X2_F {
			union {
				struct {
					float m11;
					float m12;
					float m21;
					float m22;
					float dx;
					float dy;
				};
				struct {
					float _11;
					float _12;
					float _21;
					float _22;
					float _31;
					float _32;
				};
				float m[3][2];
			};
		} D2D_MATRIX_3X2_F;
"

	self
		defineField: #m11 type: FLOATField new offset: 0;
		defineField: #m12 type: FLOATField new offset: 4;
		defineField: #m21 type: FLOATField new offset: 8;
		defineField: #m22 type: FLOATField new offset: 12;
		defineField: #dx type: FLOATField new offset: 16;
		defineField: #dy type: FLOATField new offset: 20;
		defineField: #_11 type: FLOATField new offset: 0;
		defineField: #_12 type: FLOATField new offset: 4;
		defineField: #_21 type: FLOATField new offset: 8;
		defineField: #_22 type: FLOATField new offset: 12;
		defineField: #_31 type: FLOATField new offset: 16;
		defineField: #_32 type: FLOATField new offset: 20;
		defineField: #m type: (ArrayField type: FLOATArray length: 6) offset: 0.
	self byteSize: 24! !
!D2D_MATRIX_3X2_F class categoriesFor: #defineFields!**auto generated**!initializing!public! !

