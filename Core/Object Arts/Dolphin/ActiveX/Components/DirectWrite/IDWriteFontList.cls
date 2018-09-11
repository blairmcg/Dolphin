"Filed out from Dolphin Smalltalk 7"!

DirectWriteCollection subclass: #IDWriteFontList
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IDWriteFontList guid: (IID fromString: '{1A0D8438-1D97-4EC1-AEF9-A2FB86ED6ACB}')!
IDWriteFontList comment: '`IDWriteFontList` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontList'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteFontList interface represents an ordered set of fonts that are part of an IDWriteFontCollection."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(1a0d8438-1d97-4ec1-aef9-a2fb86ed6acb), 
	helpstring("The IDWriteFontList interface represents an ordered set of fonts that are part of an IDWriteFontCollection.")
]
interface IDWriteFontList : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetFontCollection(
		[out]IDWriteFontCollection** fontCollection);
	[id(0x60010001)]
	unsigned int __stdcall GetFontCount();
	[id(0x60010002)]
	HRESULT __stdcall GetFont(
		unsigned int index,
		[out]IDWriteFont** font);
};

```'!
!IDWriteFontList categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontList methodsFor!

at: index
	"Answer an <IDWriteFont> from the collection."

	| answer |
	answer := IDWriteFont newPointer.
	self GetFont: index - 1 font: answer.
	^answer asObject!

GetFont: index font: font
	"Private - Invoke the GetFont() method of the COM object.

		HRESULT __stdcall GetFont(
			unsigned int index,
			[out]IDWriteFont** font);"

	<virtual stdcall: hresult 6 dword IDWriteFont**>
	^self invalidCall!

getFontCollection
	"Answer the <IDWriteFontCollection> result of invoking the GetFontCollection() method of the COM object."

	| answer |
	answer := IDWriteFontCollection newPointer.
	self GetFontCollection: answer.
	^answer asObject
!

GetFontCollection: fontCollection
	"Private - Invoke the GetFontCollection() method of the COM object.

		HRESULT __stdcall GetFontCollection(
			[out]IDWriteFontCollection** fontCollection);"

	<virtual stdcall: hresult 4 IDWriteFontCollection**>
	^self invalidCall!

GetFontCount
	"Private - Invoke the GetFontCount() method of the COM object.

		unsigned int __stdcall GetFontCount();"

	<virtual stdcall: dword 5>
	^self invalidCall!

size
	"Answer the number of fonts in the collection."

	^self GetFontCount! !
!IDWriteFontList categoriesFor: #at:!accessing!public! !
!IDWriteFontList categoriesFor: #GetFont:font:!**auto generated**!COM Interfaces-IDWriteFontList!private! !
!IDWriteFontList categoriesFor: #getFontCollection!**auto generated**!methods!public! !
!IDWriteFontList categoriesFor: #GetFontCollection:!**auto generated**!COM Interfaces-IDWriteFontList!private! !
!IDWriteFontList categoriesFor: #GetFontCount!**auto generated**!COM Interfaces-IDWriteFontList!private! !
!IDWriteFontList categoriesFor: #size!accessing!public! !

!IDWriteFontList class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontList'
		IDWriteFontList defineTemplate"

	self
		defineFunction: #GetFontCollection:
			argumentTypes: 'IDWriteFontCollection**';
		defineFunction: #GetFontCount
			returnType: 'dword';
		defineFunction: #GetFont:font:
			argumentTypes: 'dword IDWriteFont**'
! !
!IDWriteFontList class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

