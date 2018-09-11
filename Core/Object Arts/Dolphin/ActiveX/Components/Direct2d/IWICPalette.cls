"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IWICPalette
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IWICPalette guid: (IID fromString: '{00000040-A8F2-4877-BA0A-FD2B6645FB94}')!
IWICPalette comment: '`IWICPalette` is a wrapper class for the COM interface ''Direct2d.IWICPalette'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(00000040-a8f2-4877-ba0a-fd2b6645fb94)
]
interface IWICPalette : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall InitializePredefined(
		[in]WICBitmapPaletteType ePaletteType,
		[in]BOOL fAddTransparentColor);
	[id(0x60010001)]
	HRESULT __stdcall InitializeCustom(
		[in]unsigned int* pColors,
		[in]unsigned int cCount);
	[id(0x60010002)]
	HRESULT __stdcall InitializeFromBitmap(
		[in]IWICBitmapSource* pISurface,
		[in]unsigned int cCount,
		[in]BOOL fAddTransparentColor);
	[id(0x60010003)]
	HRESULT __stdcall InitializeFromPalette(
		[in]IWICPalette* pIPalette);
	[id(0x60010004)]
	HRESULT __stdcall GetType(
		[out]WICBitmapPaletteType* pePaletteType);
	[id(0x60010005)]
	HRESULT __stdcall GetColorCount(
		[out]unsigned int* pcCount);
	[id(0x60010006)]
	HRESULT __stdcall GetColors(
		[in]unsigned int cCount,
		[out]unsigned int* pColors,
		[out]unsigned int* pcActualColors);
	[id(0x60010007)]
	HRESULT __stdcall IsBlackWhite(
		[out]BOOL* pfIsBlackWhite);
	[id(0x60010008)]
	HRESULT __stdcall IsGrayscale(
		[out]BOOL* pfIsGrayscale);
	[id(0x60010009)]
	HRESULT __stdcall HasAlpha(
		[out]BOOL* pfHasAlpha);
};

```'!
!IWICPalette categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IWICPalette methodsFor!

getColorCount
	"Answer the <DWORD> result of invoking the GetColorCount() method of the COM object."

	| answer |
	answer := (DWORD new).
	self GetColorCount: answer.
	^answer asObject
!

GetColorCount: pcCount
	"Private - Invoke the GetColorCount() method of the COM object.

		HRESULT __stdcall GetColorCount(
			[out]unsigned int* pcCount);"

	<virtual stdcall: hresult 9 dword*>
	^self invalidCall!

getColors: cCount
	"Invoke the GetColors() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetColors: cCount
		pColors: (answer basicAt: 1)
		pcActualColors: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetColors: cCount pColors: pColors pcActualColors: pcActualColors
	"Private - Invoke the GetColors() method of the COM object.

		HRESULT __stdcall GetColors(
			[in]unsigned int cCount,
			[out]unsigned int* pColors,
			[out]unsigned int* pcActualColors);"

	<virtual stdcall: hresult 10 dword dword* dword*>
	^self invalidCall!

getType
	"Answer the <SDWORD> result of invoking the GetType() method of the COM object."

	| answer |
	answer := (SDWORD new).
	self GetType: answer.
	^answer asObject
!

GetType: pePaletteType
	"Private - Invoke the GetType() method of the COM object.

		HRESULT __stdcall GetType(
			[out]WICBitmapPaletteType* pePaletteType);"

	<virtual stdcall: hresult 8 sdword*>
	^self invalidCall!

hasAlpha
	"Answer the <BOOL> result of invoking the HasAlpha() method of the COM object."

	| answer |
	answer := (BOOL new).
	self HasAlpha: answer.
	^answer asObject
!

HasAlpha: pfHasAlpha
	"Private - Invoke the HasAlpha() method of the COM object.

		HRESULT __stdcall HasAlpha(
			[out]BOOL* pfHasAlpha);"

	<virtual stdcall: hresult 13 bool*>
	^self invalidCall!

initializeCustom: pColors cCount: cCount
	"Invoke the InitializeCustom() method of the COM object."

	^self
		InitializeCustom: pColors
		cCount: cCount
!

InitializeCustom: pColors cCount: cCount
	"Private - Invoke the InitializeCustom() method of the COM object.

		HRESULT __stdcall InitializeCustom(
			[in]unsigned int* pColors,
			[in]unsigned int cCount);"

	<virtual stdcall: hresult 5 dword* dword>
	^self invalidCall!

initializeFromBitmap: pISurface cCount: cCount fAddTransparentColor: fAddTransparentColor
	"Invoke the InitializeFromBitmap() method of the COM object."

	^self
		InitializeFromBitmap: pISurface
		cCount: cCount
		fAddTransparentColor: fAddTransparentColor
!

InitializeFromBitmap: pISurface cCount: cCount fAddTransparentColor: fAddTransparentColor
	"Private - Invoke the InitializeFromBitmap() method of the COM object.

		HRESULT __stdcall InitializeFromBitmap(
			[in]IWICBitmapSource* pISurface,
			[in]unsigned int cCount,
			[in]BOOL fAddTransparentColor);"

	<virtual stdcall: hresult 6 IWICBitmapSource* dword bool>
	^self invalidCall!

initializeFromPalette: pIPalette
	"Invoke the InitializeFromPalette() method of the COM object."

	^self InitializeFromPalette: pIPalette
!

InitializeFromPalette: pIPalette
	"Private - Invoke the InitializeFromPalette() method of the COM object.

		HRESULT __stdcall InitializeFromPalette(
			[in]IWICPalette* pIPalette);"

	<virtual stdcall: hresult 7 IWICPalette*>
	^self invalidCall!

initializePredefined: ePaletteType fAddTransparentColor: fAddTransparentColor
	"Invoke the InitializePredefined() method of the COM object."

	^self
		InitializePredefined: ePaletteType
		fAddTransparentColor: fAddTransparentColor
!

InitializePredefined: ePaletteType fAddTransparentColor: fAddTransparentColor
	"Private - Invoke the InitializePredefined() method of the COM object.

		HRESULT __stdcall InitializePredefined(
			[in]WICBitmapPaletteType ePaletteType,
			[in]BOOL fAddTransparentColor);"

	<virtual stdcall: hresult 4 sdword bool>
	^self invalidCall!

isBlackWhite
	"Answer the <BOOL> result of invoking the IsBlackWhite() method of the COM object."

	| answer |
	answer := (BOOL new).
	self IsBlackWhite: answer.
	^answer asObject
!

IsBlackWhite: pfIsBlackWhite
	"Private - Invoke the IsBlackWhite() method of the COM object.

		HRESULT __stdcall IsBlackWhite(
			[out]BOOL* pfIsBlackWhite);"

	<virtual stdcall: hresult 11 bool*>
	^self invalidCall!

isGrayscale
	"Answer the <BOOL> result of invoking the IsGrayscale() method of the COM object."

	| answer |
	answer := (BOOL new).
	self IsGrayscale: answer.
	^answer asObject
!

IsGrayscale: pfIsGrayscale
	"Private - Invoke the IsGrayscale() method of the COM object.

		HRESULT __stdcall IsGrayscale(
			[out]BOOL* pfIsGrayscale);"

	<virtual stdcall: hresult 12 bool*>
	^self invalidCall! !
!IWICPalette categoriesFor: #getColorCount!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #GetColorCount:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #getColors:!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #GetColors:pColors:pcActualColors:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #getType!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #GetType:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #hasAlpha!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #HasAlpha:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #initializeCustom:cCount:!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #InitializeCustom:cCount:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #initializeFromBitmap:cCount:fAddTransparentColor:!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #InitializeFromBitmap:cCount:fAddTransparentColor:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #initializeFromPalette:!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #InitializeFromPalette:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #initializePredefined:fAddTransparentColor:!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #InitializePredefined:fAddTransparentColor:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #isBlackWhite!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #IsBlackWhite:!**auto generated**!COM Interfaces-IWICPalette!private! !
!IWICPalette categoriesFor: #isGrayscale!**auto generated**!methods!public! !
!IWICPalette categoriesFor: #IsGrayscale:!**auto generated**!COM Interfaces-IWICPalette!private! !

!IWICPalette class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IWICPalette'
		IWICPalette defineTemplate"

	self
		defineFunction: #InitializePredefined:fAddTransparentColor:
			argumentTypes: 'sdword bool';
		defineFunction: #InitializeCustom:cCount:
			argumentTypes: 'dword* dword';
		defineFunction: #InitializeFromBitmap:cCount:fAddTransparentColor:
			argumentTypes: 'IWICBitmapSource* dword bool';
		defineFunction: #InitializeFromPalette:
			argumentTypes: 'IWICPalette*';
		defineFunction: #GetType:
			argumentTypes: 'sdword*';
		defineFunction: #GetColorCount:
			argumentTypes: 'dword*';
		defineFunction: #GetColors:pColors:pcActualColors:
			argumentTypes: 'dword dword* dword*';
		defineFunction: #IsBlackWhite:
			argumentTypes: 'bool*';
		defineFunction: #IsGrayscale:
			argumentTypes: 'bool*';
		defineFunction: #HasAlpha:
			argumentTypes: 'bool*'
! !
!IWICPalette class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

