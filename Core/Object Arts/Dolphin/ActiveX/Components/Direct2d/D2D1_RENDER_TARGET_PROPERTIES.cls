"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_RENDER_TARGET_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_RENDER_TARGET_PROPERTIES guid: (GUID fromString: '{e034ba79-43d1-488e-b40e-4057e4f37fc9}')!
D2D1_RENDER_TARGET_PROPERTIES comment: '`D2D1_RENDER_TARGET_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_RENDER_TARGET_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(e034ba79-43d1-488e-b40e-4057e4f37fc9)]
struct tagD2D1_RENDER_TARGET_PROPERTIES {
	D2D1_RENDER_TARGET_TYPE type;
	D2D1_PIXEL_FORMAT pixelFormat;
	float dpiX;
	float dpiY;
	D2D1_RENDER_TARGET_USAGE usage;
	D2D1_FEATURE_LEVEL minLevel;
} D2D1_RENDER_TARGET_PROPERTIES;

```'!
!D2D1_RENDER_TARGET_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_RENDER_TARGET_PROPERTIES methodsFor!

dpiX
	"Answer the <Float> value of the receiver's 'dpiX' field."

	^bytes floatAtOffset: ##(self offsetOf: #dpiX)!

dpiX: aFloat
	"Set the receiver's 'dpiX' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dpiX) put: aFloat!

dpiY
	"Answer the <Float> value of the receiver's 'dpiY' field."

	^bytes floatAtOffset: ##(self offsetOf: #dpiY)!

dpiY: aFloat
	"Set the receiver's 'dpiY' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #dpiY) put: aFloat!

minLevel
	"Answer the <Integer> value of the receiver's 'minLevel' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #minLevel)!

minLevel: anInteger
	"Set the receiver's 'minLevel' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #minLevel) put: anInteger!

pixelFormat
	"Answer the <D2D1_PIXEL_FORMAT> value of the receiver's 'pixelFormat' field."

	^D2D1_PIXEL_FORMAT fromAddress: bytes yourAddress + ##(self offsetOf: #pixelFormat)!

pixelFormat: aD2D1_PIXEL_FORMAT
	"Set the receiver's 'pixelFormat' field to the value of the argument, aD2D1_PIXEL_FORMAT"

	aD2D1_PIXEL_FORMAT
		replaceBytesOf: bytes
		from: ##((self offsetOf: #pixelFormat) + 1)
		to: ##((self offsetOf: #pixelFormat) + D2D1_PIXEL_FORMAT basicByteSize)
		startingAt: 1!

type
	"Answer the <Integer> value of the receiver's 'type' field."

	^bytes sdwordAtOffset: 0!

type: anInteger
	"Set the receiver's 'type' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

usage
	"Answer the <Integer> value of the receiver's 'usage' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #usage)!

usage: anInteger
	"Set the receiver's 'usage' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #usage) put: anInteger! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #dpiX!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #dpiX:!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #dpiY!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #dpiY:!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #minLevel!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #minLevel:!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #pixelFormat!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #pixelFormat:!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #type!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #type:!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #usage!**compiled accessors**!public! !
!D2D1_RENDER_TARGET_PROPERTIES categoriesFor: #usage:!**compiled accessors**!public! !

!D2D1_RENDER_TARGET_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_RENDER_TARGET_PROPERTIES structure.

	D2D1_RENDER_TARGET_PROPERTIES compileDefinition

		typedef [uuid(e034ba79-43d1-488e-b40e-4057e4f37fc9)]
		struct tagD2D1_RENDER_TARGET_PROPERTIES {
			D2D1_RENDER_TARGET_TYPE type;
			D2D1_PIXEL_FORMAT pixelFormat;
			float dpiX;
			float dpiY;
			D2D1_RENDER_TARGET_USAGE usage;
			D2D1_FEATURE_LEVEL minLevel;
		} D2D1_RENDER_TARGET_PROPERTIES;
"

	self
		defineField: #type type: SDWORDField new offset: 0;
		defineField: #pixelFormat type: (StructureField type: D2D1_PIXEL_FORMAT) offset: 4;
		defineField: #dpiX type: FLOATField new offset: 12;
		defineField: #dpiY type: FLOATField new offset: 16;
		defineField: #usage type: SDWORDField new offset: 20;
		defineField: #minLevel type: SDWORDField new offset: 24.
	self byteSize: 28! !
!D2D1_RENDER_TARGET_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

