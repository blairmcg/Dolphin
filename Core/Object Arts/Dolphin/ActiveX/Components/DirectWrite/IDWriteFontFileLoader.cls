"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontFileLoader
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFileLoader guid: (IID fromString: '{727CAD4E-D6AF-4C9E-8A08-D695B11CAA49}')!
IDWriteFontFileLoader comment: '`IDWriteFontFileLoader` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFileLoader'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Font file loader interface handles loading font file resources of a particular type from a key."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(727cad4e-d6af-4c9e-8a08-d695b11caa49), 
	helpstring("Font file loader interface handles loading font file resources of a particular type from a key.")
]
interface IDWriteFontFileLoader : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall CreateStreamFromKey(
		[in]void* fontFileReferenceKey,
		unsigned int fontFileReferenceKeySize,
		[out]IDWriteFontFileStream** fontFileStream);
};

```'!
!IDWriteFontFileLoader categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFileLoader methodsFor!

createStreamFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize
	"Answer the <IDWriteFontFileStream> result of invoking the CreateStreamFromKey() method of the COM object."

	| answer |
	answer := IDWriteFontFileStream newPointer.
	self
		CreateStreamFromKey: fontFileReferenceKey
		fontFileReferenceKeySize: fontFileReferenceKeySize
		fontFileStream: answer.
	^answer asObject
!

CreateStreamFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize fontFileStream: fontFileStream
	"Private - Invoke the CreateStreamFromKey() method of the COM object.

		HRESULT __stdcall CreateStreamFromKey(
			[in]void* fontFileReferenceKey,
			unsigned int fontFileReferenceKeySize,
			[out]IDWriteFontFileStream** fontFileStream);"

	<virtual stdcall: hresult 4 void* dword IDWriteFontFileStream**>
	^self invalidCall! !
!IDWriteFontFileLoader categoriesFor: #createStreamFromKey:fontFileReferenceKeySize:!**auto generated**!methods!public! !
!IDWriteFontFileLoader categoriesFor: #CreateStreamFromKey:fontFileReferenceKeySize:fontFileStream:!**auto generated**!COM Interfaces-IDWriteFontFileLoader!private! !

!IDWriteFontFileLoader class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFileLoader'
		IDWriteFontFileLoader defineTemplate"

	self
		defineFunction: #CreateStreamFromKey:fontFileReferenceKeySize:fontFileStream:
			argumentTypes: 'void* dword IDWriteFontFileStream**'
! !
!IDWriteFontFileLoader class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

