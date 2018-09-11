"Filed out from Dolphin Smalltalk 7"!

DirectWriteCollection subclass: #IDWriteFontCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IDWriteFontCollection guid: (IID fromString: '{A84CEE02-3EEA-4EEE-A827-87C1A02A0FCC}')!
IDWriteFontCollection comment: '`IDWriteFontCollection` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontCollection'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteFontCollection encapsulates a collection of font families."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(a84cee02-3eea-4eee-a827-87c1a02a0fcc), 
	helpstring("The IDWriteFontCollection encapsulates a collection of font families.")
]
interface IDWriteFontCollection : IUnknown
 {
	[id(0x60010000)]
	unsigned int __stdcall GetFontFamilyCount();
	[id(0x60010001)]
	HRESULT __stdcall GetFontFamily(
		unsigned int index,
		[out]IDWriteFontFamily** fontFamily);
	[id(0x60010002)]
	HRESULT __stdcall FindFamilyName(
		[in]unsigned short* familyName,
		[out]unsigned int* index,
		[out]BOOL* exists);
	[id(0x60010003)]
	HRESULT __stdcall GetFontFromFontFace(
		[in]IDWriteFontFace* fontFace,
		[out]IDWriteFont** font);
};

```'!
!IDWriteFontCollection categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontCollection methodsFor!

at: index
	"Answer an <IDWriteFontFamily> from the collection."

	| answer |
	answer := IDWriteFontFamily newPointer.
	self GetFontFamily: index - 1 fontFamily: answer.
	^answer asObject!

FindFamilyName: familyName index: index exists: exists
	"Private - Invoke the FindFamilyName() method of the COM object.

		HRESULT __stdcall FindFamilyName(
			[in]unsigned short* familyName,
			[out]unsigned int* index,
			[out]BOOL* exists);"

	<virtual stdcall: hresult 6 word* dword* bool*>
	^self invalidCall!

GetFontFamily: index fontFamily: fontFamily
	"Private - Invoke the GetFontFamily() method of the COM object.

		HRESULT __stdcall GetFontFamily(
			unsigned int index,
			[out]IDWriteFontFamily** fontFamily);"

	<virtual stdcall: hresult 5 dword IDWriteFontFamily**>
	^self invalidCall!

GetFontFamilyCount
	"Private - Invoke the GetFontFamilyCount() method of the COM object.

		unsigned int __stdcall GetFontFamilyCount();"

	<virtual stdcall: dword 4>
	^self invalidCall!

GetFontFromFontFace: fontFace font: font
	"Private - Invoke the GetFontFromFontFace() method of the COM object.

		HRESULT __stdcall GetFontFromFontFace(
			[in]IDWriteFontFace* fontFace,
			[out]IDWriteFont** font);"

	<virtual stdcall: hresult 7 IDWriteFontFace* IDWriteFont**>
	^self invalidCall!

size
	"Answer the number of font families in the collection."

	^self GetFontFamilyCount
! !
!IDWriteFontCollection categoriesFor: #at:!public! !
!IDWriteFontCollection categoriesFor: #FindFamilyName:index:exists:!**auto generated**!COM Interfaces-IDWriteFontCollection!private! !
!IDWriteFontCollection categoriesFor: #GetFontFamily:fontFamily:!**auto generated**!COM Interfaces-IDWriteFontCollection!private! !
!IDWriteFontCollection categoriesFor: #GetFontFamilyCount!**auto generated**!COM Interfaces-IDWriteFontCollection!private! !
!IDWriteFontCollection categoriesFor: #GetFontFromFontFace:font:!**auto generated**!COM Interfaces-IDWriteFontCollection!private! !
!IDWriteFontCollection categoriesFor: #size!accessing!public! !

!IDWriteFontCollection class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontCollection'
		IDWriteFontCollection defineTemplate"

	self
		defineFunction: #GetFontFamilyCount
			returnType: 'dword';
		defineFunction: #GetFontFamily:fontFamily:
			argumentTypes: 'dword IDWriteFontFamily**';
		defineFunction: #FindFamilyName:index:exists:
			argumentTypes: 'word* dword* bool*';
		defineFunction: #GetFontFromFontFace:font:
			argumentTypes: 'IDWriteFontFace* IDWriteFont**'
! !
!IDWriteFontCollection class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

