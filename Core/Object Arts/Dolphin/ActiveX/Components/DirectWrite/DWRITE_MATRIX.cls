"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_MATRIX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_MATRIX guid: (GUID fromString: '{183f4058-a7d7-4f9f-a9a8-917d89f1f3a9}')!
DWRITE_MATRIX comment: '`DWRITE_MATRIX` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_MATRIX'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_MATRIX structure specifies the graphics transform to be applied to rendered glyphs."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(183f4058-a7d7-4f9f-a9a8-917d89f1f3a9), helpstring("The DWRITE_MATRIX structure specifies the graphics transform to be applied to rendered glyphs.")]
struct tagDWRITE_MATRIX {
	float m11;
	float m12;
	float m21;
	float m22;
	float dx;
	float dy;
} DWRITE_MATRIX;

```'!
!DWRITE_MATRIX categoriesForClass!Direct2d-Structs! !
!DWRITE_MATRIX methodsFor!

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
!DWRITE_MATRIX categoriesFor: #dx!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #dx:!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #dy!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #dy:!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m11!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m11:!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m12!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m12:!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m21!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m21:!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m22!**compiled accessors**!public! !
!DWRITE_MATRIX categoriesFor: #m22:!**compiled accessors**!public! !

!DWRITE_MATRIX class methodsFor!

defineFields
	"Define the fields of the DWRITE_MATRIX structure.

	DWRITE_MATRIX compileDefinition

		typedef [uuid(183f4058-a7d7-4f9f-a9a8-917d89f1f3a9), helpstring('The DWRITE_MATRIX structure specifies the graphics transform to be applied to rendered glyphs.')]
		struct tagDWRITE_MATRIX {
			float m11;
			float m12;
			float m21;
			float m22;
			float dx;
			float dy;
		} DWRITE_MATRIX;
"

	self
		defineField: #m11 type: FLOATField new offset: 0;
		defineField: #m12 type: FLOATField new offset: 4;
		defineField: #m21 type: FLOATField new offset: 8;
		defineField: #m22 type: FLOATField new offset: 12;
		defineField: #dx type: FLOATField new offset: 16;
		defineField: #dy type: FLOATField new offset: 20.
	self byteSize: 24! !
!DWRITE_MATRIX class categoriesFor: #defineFields!**auto generated**!initializing!public! !

