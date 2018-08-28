"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteTypography
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTypography guid: (IID fromString: '{55F1112B-1DC2-4B3C-9541-F46894ED85B6}')!
IDWriteTypography comment: '`IDWriteTypography` is a wrapper class for the COM interface ''DirectWrite.IDWriteTypography'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Font typography setting."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(55f1112b-1dc2-4b3c-9541-f46894ed85b6), 
	helpstring("Font typography setting.")
]
interface IDWriteTypography : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall AddFontFeature(
		DWRITE_FONT_FEATURE fontFeature);
	[id(0x60010001)]
	unsigned int __stdcall GetFontFeatureCount();
	[id(0x60010002)]
	HRESULT __stdcall GetFontFeature(
		unsigned int fontFeatureIndex,
		[out]DWRITE_FONT_FEATURE* fontFeature);
};

```'!
!IDWriteTypography categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTypography methodsFor!

addFontFeature: fontFeature
	"Invoke the AddFontFeature() method of the COM object."

	^self AddFontFeature: fontFeature
!

AddFontFeature: fontFeature
	"Private - Invoke the AddFontFeature() method of the COM object.

		HRESULT __stdcall AddFontFeature(
			DWRITE_FONT_FEATURE fontFeature);"

	<virtual stdcall: hresult 4 DWRITE_FONT_FEATURE>
	^self invalidCall!

getFontFeature: fontFeatureIndex
	"Answer the <DWRITE_FONT_FEATURE> result of invoking the GetFontFeature() method of the COM object."

	| answer |
	answer := (DWRITE_FONT_FEATURE new).
	self
		GetFontFeature: fontFeatureIndex
		fontFeature: answer.
	^answer asObject
!

GetFontFeature: fontFeatureIndex fontFeature: fontFeature
	"Private - Invoke the GetFontFeature() method of the COM object.

		HRESULT __stdcall GetFontFeature(
			unsigned int fontFeatureIndex,
			[out]DWRITE_FONT_FEATURE* fontFeature);"

	<virtual stdcall: hresult 6 dword DWRITE_FONT_FEATURE*>
	^self invalidCall!

getFontFeatureCount
	"Answer the <DWORD> result of invoking the GetFontFeatureCount() method of the COM object."

	^self GetFontFeatureCount
!

GetFontFeatureCount
	"Private - Invoke the GetFontFeatureCount() method of the COM object.

		unsigned int __stdcall GetFontFeatureCount();"

	<virtual stdcall: dword 5>
	^self invalidCall! !
!IDWriteTypography categoriesFor: #addFontFeature:!**auto generated**!methods!public! !
!IDWriteTypography categoriesFor: #AddFontFeature:!**auto generated**!COM Interfaces-IDWriteTypography!private! !
!IDWriteTypography categoriesFor: #getFontFeature:!**auto generated**!methods!public! !
!IDWriteTypography categoriesFor: #GetFontFeature:fontFeature:!**auto generated**!COM Interfaces-IDWriteTypography!private! !
!IDWriteTypography categoriesFor: #getFontFeatureCount!**auto generated**!methods!public! !
!IDWriteTypography categoriesFor: #GetFontFeatureCount!**auto generated**!COM Interfaces-IDWriteTypography!private! !

!IDWriteTypography class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTypography'
		IDWriteTypography defineTemplate"

	self
		defineFunction: #AddFontFeature:
			argumentTypes: 'DWRITE_FONT_FEATURE';
		defineFunction: #GetFontFeatureCount
			returnType: 'dword';
		defineFunction: #GetFontFeature:fontFeature:
			argumentTypes: 'dword DWRITE_FONT_FEATURE*'
! !
!IDWriteTypography class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

