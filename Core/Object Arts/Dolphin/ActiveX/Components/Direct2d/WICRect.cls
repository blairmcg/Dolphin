"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #WICRect
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
WICRect guid: (GUID fromString: '{69f79b1b-f1de-4760-9c2b-d0758fa4f290}')!
WICRect comment: '`WICRect` is an `ExternalStructure` class to wrap the struct ''Direct2d.WICRect'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagWICRect {
	int x;
	int y;
	int width;
	int height;
} WICRect;

```'!
!WICRect categoriesForClass!Direct2d-Structs! !
!WICRect methodsFor!

height
	"Answer the <Integer> value of the receiver's 'height' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #height)!

height: anInteger
	"Set the receiver's 'height' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #height) put: anInteger!

width
	"Answer the <Integer> value of the receiver's 'width' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #width)!

width: anInteger
	"Set the receiver's 'width' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #width) put: anInteger!

x
	"Answer the <Integer> value of the receiver's 'x' field."

	^bytes sdwordAtOffset: 0!

x: anInteger
	"Set the receiver's 'x' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

y
	"Answer the <Integer> value of the receiver's 'y' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #y)!

y: anInteger
	"Set the receiver's 'y' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #y) put: anInteger! !
!WICRect categoriesFor: #height!**compiled accessors**!public! !
!WICRect categoriesFor: #height:!**compiled accessors**!public! !
!WICRect categoriesFor: #width!**compiled accessors**!public! !
!WICRect categoriesFor: #width:!**compiled accessors**!public! !
!WICRect categoriesFor: #x!**compiled accessors**!public! !
!WICRect categoriesFor: #x:!**compiled accessors**!public! !
!WICRect categoriesFor: #y!**compiled accessors**!public! !
!WICRect categoriesFor: #y:!**compiled accessors**!public! !

!WICRect class methodsFor!

defineFields
	"Define the fields of the WICRect structure.

	WICRect compileDefinition

		typedef 
		struct tagWICRect {
			int x;
			int y;
			int width;
			int height;
		} WICRect;
"

	self
		defineField: #x type: SDWORDField new offset: 0;
		defineField: #y type: SDWORDField new offset: 4;
		defineField: #width type: SDWORDField new offset: 8;
		defineField: #height type: SDWORDField new offset: 12.
	self byteSize: 16! !
!WICRect class categoriesFor: #defineFields!**auto generated**!initializing!public! !

