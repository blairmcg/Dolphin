"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteGdiInterop
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteGdiInterop guid: (IID fromString: '{1EDD9491-9853-4299-898F-6432983B6F3A}')!
IDWriteGdiInterop comment: '`IDWriteGdiInterop` is a wrapper class for the COM interface ''DirectWrite.IDWriteGdiInterop'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The GDI interop interface provides interoperability with GDI."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(1edd9491-9853-4299-898f-6432983b6f3a), 
	helpstring("The GDI interop interface provides interoperability with GDI.")
]
interface IDWriteGdiInterop : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall CreateFontFromLOGFONT(
		[in]LOGFONTW* logFont,
		[out]IDWriteFont** font);
	[id(0x60010001)]
	HRESULT __stdcall ConvertFontToLOGFONT(
		[in]IDWriteFont* font,
		[out]LOGFONTW* logFont,
		[out]BOOL* isSystemFont);
	[id(0x60010002)]
	HRESULT __stdcall ConvertFontFaceToLOGFONT(
		[in]IDWriteFontFace* font,
		[out]LOGFONTW* logFont);
	[id(0x60010003)]
	HRESULT __stdcall CreateFontFaceFromHdc(
		wireHDC hdc,
		[out]IDWriteFontFace** fontFace);
	[id(0x60010004)]
	HRESULT __stdcall CreateBitmapRenderTarget(
		[in]wireHDC hdc,
		unsigned int width,
		unsigned int height,
		[out]IDWriteBitmapRenderTarget** renderTarget);
};

```'!
!IDWriteGdiInterop categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteGdiInterop methodsFor!

ConvertFontFaceToLOGFONT: font logFont: logFont
	"Private - Invoke the ConvertFontFaceToLOGFONT() method of the COM object.

		HRESULT __stdcall ConvertFontFaceToLOGFONT(
			[in]IDWriteFontFace* font,
			[out]LOGFONTW* logFont);"

	<virtual stdcall: hresult 6 IDWriteFontFace* LOGFONTW*>
	^self invalidCall!

ConvertFontToLOGFONT: font logFont: logFont isSystemFont: isSystemFont
	"Private - Invoke the ConvertFontToLOGFONT() method of the COM object.

		HRESULT __stdcall ConvertFontToLOGFONT(
			[in]IDWriteFont* font,
			[out]LOGFONTW* logFont,
			[out]BOOL* isSystemFont);"

	<virtual stdcall: hresult 5 IDWriteFont* LOGFONTW* bool*>
	^self invalidCall!

CreateBitmapRenderTarget: hdc width: width height: height renderTarget: renderTarget
	"Private - Invoke the CreateBitmapRenderTarget() method of the COM object.

		HRESULT __stdcall CreateBitmapRenderTarget(
			[in]wireHDC hdc,
			unsigned int width,
			unsigned int height,
			[out]IDWriteBitmapRenderTarget** renderTarget);"

	<virtual stdcall: hresult 8 handle dword dword IDWriteBitmapRenderTarget**>
	^self invalidCall!

CreateFontFaceFromHdc: hdc fontFace: fontFace
	"Private - Invoke the CreateFontFaceFromHdc() method of the COM object.

		HRESULT __stdcall CreateFontFaceFromHdc(
			wireHDC hdc,
			[out]IDWriteFontFace** fontFace);"

	<virtual stdcall: hresult 7 handle IDWriteFontFace**>
	^self invalidCall!

CreateFontFromLOGFONT: logFont font: font
	"Private - Invoke the CreateFontFromLOGFONT() method of the COM object.

		HRESULT __stdcall CreateFontFromLOGFONT(
			[in]LOGFONTW* logFont,
			[out]IDWriteFont** font);"

	<virtual stdcall: hresult 4 LOGFONTW* IDWriteFont**>
	^self invalidCall! !
!IDWriteGdiInterop categoriesFor: #ConvertFontFaceToLOGFONT:logFont:!**auto generated**!COM Interfaces-IDWriteGdiInterop!private! !
!IDWriteGdiInterop categoriesFor: #ConvertFontToLOGFONT:logFont:isSystemFont:!**auto generated**!COM Interfaces-IDWriteGdiInterop!private! !
!IDWriteGdiInterop categoriesFor: #CreateBitmapRenderTarget:width:height:renderTarget:!**auto generated**!COM Interfaces-IDWriteGdiInterop!private! !
!IDWriteGdiInterop categoriesFor: #CreateFontFaceFromHdc:fontFace:!**auto generated**!COM Interfaces-IDWriteGdiInterop!private! !
!IDWriteGdiInterop categoriesFor: #CreateFontFromLOGFONT:font:!**auto generated**!COM Interfaces-IDWriteGdiInterop!private! !

!IDWriteGdiInterop class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteGdiInterop'
		IDWriteGdiInterop defineTemplate"

	self
		defineFunction: #CreateFontFromLOGFONT:font:
			argumentTypes: 'LOGFONTW* IDWriteFont**';
		defineFunction: #ConvertFontToLOGFONT:logFont:isSystemFont:
			argumentTypes: 'IDWriteFont* LOGFONTW* bool*';
		defineFunction: #ConvertFontFaceToLOGFONT:logFont:
			argumentTypes: 'IDWriteFontFace* LOGFONTW*';
		defineFunction: #CreateFontFaceFromHdc:fontFace:
			argumentTypes: 'handle IDWriteFontFace**';
		defineFunction: #CreateBitmapRenderTarget:width:height:renderTarget:
			argumentTypes: 'handle dword dword IDWriteBitmapRenderTarget**'
! !
!IDWriteGdiInterop class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

