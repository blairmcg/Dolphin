"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #D3DCOLORVALUE
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D3DCOLORVALUE guid: (GUID fromString: '{b0186bb2-8f5e-4295-89f9-25890d587a28}')!
D3DCOLORVALUE comment: '`D3DCOLORVALUE` is an `ExternalStructure` class to wrap the struct ''Direct2d.D3DCOLORVALUE'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagD3DCOLORVALUE {
	float r;
	float g;
	float b;
	float a;
} D3DCOLORVALUE;

```'!
!D3DCOLORVALUE categoriesForClass!Direct2d-Structs! !
!D3DCOLORVALUE methodsFor!

a
	"Answer the <Float> value of the receiver's 'a' field."

	^bytes floatAtOffset: ##(self offsetOf: #a)!

a: aFloat
	"Set the receiver's 'a' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #a) put: aFloat!

b
	"Answer the <Float> value of the receiver's 'b' field."

	^bytes floatAtOffset: ##(self offsetOf: #b)!

b: aFloat
	"Set the receiver's 'b' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #b) put: aFloat!

g
	"Answer the <Float> value of the receiver's 'g' field."

	^bytes floatAtOffset: ##(self offsetOf: #g)!

g: aFloat
	"Set the receiver's 'g' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #g) put: aFloat!

r
	"Answer the <Float> value of the receiver's 'r' field."

	^bytes floatAtOffset: 0!

r: aFloat
	"Set the receiver's 'r' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!D3DCOLORVALUE categoriesFor: #a!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #a:!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #b!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #b:!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #g!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #g:!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #r!**compiled accessors**!public! !
!D3DCOLORVALUE categoriesFor: #r:!**compiled accessors**!public! !

!D3DCOLORVALUE class methodsFor!

a: alphaValue r: redValue g: greenValue b: blueValue
	"Answer an instance whose four components are given."

	^self basicNew 
		bytes: ((ByteArray newFixed: 16)
				floatAtOffset: 0 put: redValue;
				floatAtOffset: 4 put: greenValue;
				floatAtOffset: 8 put: blueValue;
				floatAtOffset: 12 put: alphaValue;
				yourself)!

defineFields
	"Define the fields of the D3DCOLORVALUE structure.

	D3DCOLORVALUE compileDefinition

		typedef 
		struct tagD3DCOLORVALUE {
			float r;
			float g;
			float b;
			float a;
		} D3DCOLORVALUE;
"

	self
		defineField: #r type: FLOATField new offset: 0;
		defineField: #g type: FLOATField new offset: 4;
		defineField: #b type: FLOATField new offset: 8;
		defineField: #a type: FLOATField new offset: 12.
	self byteSize: 16! !
!D3DCOLORVALUE class categoriesFor: #a:r:g:b:!instance creation!public! !
!D3DCOLORVALUE class categoriesFor: #defineFields!**auto generated**!initializing!public! !

