"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IWICBitmapSource
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IWICBitmapSource guid: (IID fromString: '{00000120-A8F2-4877-BA0A-FD2B6645FB94}')!
IWICBitmapSource comment: '`IWICBitmapSource` is a wrapper class for the COM interface ''Direct2d.IWICBitmapSource'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(00000120-a8f2-4877-ba0a-fd2b6645fb94)
]
interface IWICBitmapSource : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetSize(
		[out]unsigned int* puiWidth,
		[out]unsigned int* puiHeight);
	[id(0x60010001)]
	HRESULT __stdcall GetPixelFormat(
		[out]GUID* pPixelFormat);
	[id(0x60010002)]
	HRESULT __stdcall GetResolution(
		[out]double* pDpiX,
		[out]double* pDpiY);
	[id(0x60010003)]
	HRESULT __stdcall CopyPalette(
		[in]IWICPalette* pIPalette);
	[id(0x60010004)]
	HRESULT __stdcall CopyPixels(
		[in]WICRect* prc,
		[in]unsigned int cbStride,
		[in]unsigned int cbBufferSize,
		[out]BYTE* pbBuffer);
};

```'!
!IWICBitmapSource categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IWICBitmapSource methodsFor!

copyPalette: pIPalette
	"Invoke the CopyPalette() method of the COM object."

	^self CopyPalette: pIPalette
!

CopyPalette: pIPalette
	"Private - Invoke the CopyPalette() method of the COM object.

		HRESULT __stdcall CopyPalette(
			[in]IWICPalette* pIPalette);"

	<virtual stdcall: hresult 7 IWICPalette*>
	^self invalidCall!

copyPixels: prc cbStride: cbStride cbBufferSize: cbBufferSize
	"Answer the <BYTE> result of invoking the CopyPixels() method of the COM object."

	| answer |
	answer := (BYTE new).
	self
		CopyPixels: prc
		cbStride: cbStride
		cbBufferSize: cbBufferSize
		pbBuffer: answer.
	^answer asObject
!

CopyPixels: prc cbStride: cbStride cbBufferSize: cbBufferSize pbBuffer: pbBuffer
	"Private - Invoke the CopyPixels() method of the COM object.

		HRESULT __stdcall CopyPixels(
			[in]WICRect* prc,
			[in]unsigned int cbStride,
			[in]unsigned int cbBufferSize,
			[out]BYTE* pbBuffer);"

	<virtual stdcall: hresult 8 WICRect* dword dword byte*>
	^self invalidCall!

getPixelFormat
	"Answer the <GUID> result of invoking the GetPixelFormat() method of the COM object."

	| answer |
	answer := GUID new.
	self GetPixelFormat: answer.
	^answer asObject
!

GetPixelFormat: pPixelFormat
	"Private - Invoke the GetPixelFormat() method of the COM object.

		HRESULT __stdcall GetPixelFormat(
			[out]GUID* pPixelFormat);"

	<virtual stdcall: hresult 5 GUID*>
	^self invalidCall!

getResolution
	"Invoke the GetResolution() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DOUBLE new);
				basicAt: 2 put: (DOUBLE new);
				yourself.
	self
		GetResolution: (answer basicAt: 1)
		pDpiY: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetResolution: pDpiX pDpiY: pDpiY
	"Private - Invoke the GetResolution() method of the COM object.

		HRESULT __stdcall GetResolution(
			[out]double* pDpiX,
			[out]double* pDpiY);"

	<virtual stdcall: hresult 6 double* double*>
	^self invalidCall!

getSize
	"Invoke the GetSize() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetSize: (answer basicAt: 1)
		puiHeight: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetSize: puiWidth puiHeight: puiHeight
	"Private - Invoke the GetSize() method of the COM object.

		HRESULT __stdcall GetSize(
			[out]unsigned int* puiWidth,
			[out]unsigned int* puiHeight);"

	<virtual stdcall: hresult 4 dword* dword*>
	^self invalidCall! !
!IWICBitmapSource categoriesFor: #copyPalette:!**auto generated**!methods!public! !
!IWICBitmapSource categoriesFor: #CopyPalette:!**auto generated**!COM Interfaces-IWICBitmapSource!private! !
!IWICBitmapSource categoriesFor: #copyPixels:cbStride:cbBufferSize:!**auto generated**!methods!public! !
!IWICBitmapSource categoriesFor: #CopyPixels:cbStride:cbBufferSize:pbBuffer:!**auto generated**!COM Interfaces-IWICBitmapSource!private! !
!IWICBitmapSource categoriesFor: #getPixelFormat!**auto generated**!methods!public! !
!IWICBitmapSource categoriesFor: #GetPixelFormat:!**auto generated**!COM Interfaces-IWICBitmapSource!private! !
!IWICBitmapSource categoriesFor: #getResolution!**auto generated**!methods!public! !
!IWICBitmapSource categoriesFor: #GetResolution:pDpiY:!**auto generated**!COM Interfaces-IWICBitmapSource!private! !
!IWICBitmapSource categoriesFor: #getSize!**auto generated**!methods!public! !
!IWICBitmapSource categoriesFor: #GetSize:puiHeight:!**auto generated**!COM Interfaces-IWICBitmapSource!private! !

!IWICBitmapSource class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IWICBitmapSource'
		IWICBitmapSource defineTemplate"

	self
		defineFunction: #GetSize:puiHeight:
			argumentTypes: 'dword* dword*';
		defineFunction: #GetPixelFormat:
			argumentTypes: 'GUID*';
		defineFunction: #GetResolution:pDpiY:
			argumentTypes: 'double* double*';
		defineFunction: #CopyPalette:
			argumentTypes: 'IWICPalette*';
		defineFunction: #CopyPixels:cbStride:cbBufferSize:pbBuffer:
			argumentTypes: 'WICRect* dword dword byte*'
! !
!IWICBitmapSource class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

