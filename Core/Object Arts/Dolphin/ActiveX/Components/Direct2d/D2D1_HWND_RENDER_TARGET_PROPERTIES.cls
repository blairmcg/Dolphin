"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_HWND_RENDER_TARGET_PROPERTIES
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_HWND_RENDER_TARGET_PROPERTIES guid: (GUID fromString: '{e3a46a02-bb09-402e-8ef2-80ff1f55d97b}')!
D2D1_HWND_RENDER_TARGET_PROPERTIES comment: '`D2D1_HWND_RENDER_TARGET_PROPERTIES` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_HWND_RENDER_TARGET_PROPERTIES'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(e3a46a02-bb09-402e-8ef2-80ff1f55d97b)]
struct tagD2D1_HWND_RENDER_TARGET_PROPERTIES {
	HWND HWND;
	D2D_SIZE_U pixelSize;
	D2D1_PRESENT_OPTIONS presentOptions;
} D2D1_HWND_RENDER_TARGET_PROPERTIES;

```'!
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesForClass!Direct2d-Structs! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES methodsFor!

hWnd
	"Answer the <ExternalHandle> value of the receiver's 'hWnd' field."

	^(bytes uintPtrAtOffset: 0) asExternalHandle!

hWnd: anExternalHandle
	"Set the receiver's 'hWnd' field to the value of the argument, anExternalHandle"

	bytes uintPtrAtOffset: 0 put: anExternalHandle!

pixelSize
	"Answer the <D2D_SIZE_U> value of the receiver's 'pixelSize' field."

	^D2D_SIZE_U fromAddress: bytes yourAddress + ##(self offsetOf: #pixelSize)!

pixelSize: aD2D_SIZE_U
	"Set the receiver's 'pixelSize' field to the value of the argument, aD2D_SIZE_U"

	aD2D_SIZE_U
		replaceBytesOf: bytes
		from: ##((self offsetOf: #pixelSize) + 1)
		to: ##((self offsetOf: #pixelSize) + D2D_SIZE_U basicByteSize)
		startingAt: 1!

presentOptions
	"Answer the <Integer> value of the receiver's 'presentOptions' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #presentOptions)!

presentOptions: anInteger
	"Set the receiver's 'presentOptions' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #presentOptions) put: anInteger! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #hWnd!**compiled accessors**!public! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #hWnd:!**compiled accessors**!public! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #pixelSize!**compiled accessors**!public! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #pixelSize:!**compiled accessors**!public! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #presentOptions!**compiled accessors**!public! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES categoriesFor: #presentOptions:!**compiled accessors**!public! !

!D2D1_HWND_RENDER_TARGET_PROPERTIES class methodsFor!

defineFields
	"Define the fields of the D2D1_HWND_RENDER_TARGET_PROPERTIES structure.

	D2D1_HWND_RENDER_TARGET_PROPERTIES compileDefinition

		typedef [uuid(e3a46a02-bb09-402e-8ef2-80ff1f55d97b)]
		struct tagD2D1_HWND_RENDER_TARGET_PROPERTIES {
			HWND HWND;
			D2D_SIZE_U pixelSize;
			D2D1_PRESENT_OPTIONS presentOptions;
		} D2D1_HWND_RENDER_TARGET_PROPERTIES;
"

	self
		defineField: #hWnd type: HANDLEField new offset: 0;
		defineField: #pixelSize type: (StructureField type: D2D_SIZE_U) offset: 4;
		defineField: #presentOptions type: SDWORDField new offset: 12.
	self byteSize: 16! !
!D2D1_HWND_RENDER_TARGET_PROPERTIES class categoriesFor: #defineFields!**auto generated**!initializing!public! !

