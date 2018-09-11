"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DXGI_MAPPED_RECT
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DXGI_MAPPED_RECT guid: (GUID fromString: '{6f164e84-cf04-4126-b70a-86e84d4c3ff8}')!
DXGI_MAPPED_RECT comment: '`DXGI_MAPPED_RECT` is an `ExternalStructure` class to wrap the struct ''Direct2d.DXGI_MAPPED_RECT'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagDXGI_MAPPED_RECT {
	int pitch;
	BYTE* pBits;
} DXGI_MAPPED_RECT;

```'!
!DXGI_MAPPED_RECT categoriesForClass!Direct2d-Structs! !
!DXGI_MAPPED_RECT methodsFor!

pBits
	"Answer the <BYTE> value of the receiver's 'pBits' field."

	^BYTE fromAddress: (bytes intPtrAtOffset: ##(self offsetOf: #pBits))!

pBits: aBYTE
	"Set the receiver's 'pBits' field to the value of the argument, aBYTE"

	bytes uintPtrAtOffset: ##(self offsetOf: #pBits) put: aBYTE yourAddress!

pitch
	"Answer the <Integer> value of the receiver's 'pitch' field."

	^bytes sdwordAtOffset: 0!

pitch: anInteger
	"Set the receiver's 'pitch' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger! !
!DXGI_MAPPED_RECT categoriesFor: #pBits!**compiled accessors**!public! !
!DXGI_MAPPED_RECT categoriesFor: #pBits:!**compiled accessors**!public! !
!DXGI_MAPPED_RECT categoriesFor: #pitch!**compiled accessors**!public! !
!DXGI_MAPPED_RECT categoriesFor: #pitch:!**compiled accessors**!public! !

!DXGI_MAPPED_RECT class methodsFor!

defineFields
	"Define the fields of the DXGI_MAPPED_RECT structure.

	DXGI_MAPPED_RECT compileDefinition

		typedef 
		struct tagDXGI_MAPPED_RECT {
			int pitch;
			BYTE* pBits;
		} DXGI_MAPPED_RECT;
"

	self
		defineField: #pitch type: SDWORDField new offset: 0;
		defineField: #pBits type: (PointerField type: BYTE) offset: 4.
	self byteSize: 8! !
!DXGI_MAPPED_RECT class categoriesFor: #defineFields!**auto generated**!initializing!public! !

