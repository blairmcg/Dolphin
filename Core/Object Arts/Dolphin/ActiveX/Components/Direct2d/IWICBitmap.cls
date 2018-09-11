"Filed out from Dolphin Smalltalk 7"!

IWICBitmapSource subclass: #IWICBitmap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IWICBitmap guid: (IID fromString: '{00000121-A8F2-4877-BA0A-FD2B6645FB94}')!
IWICBitmap comment: '`IWICBitmap` is a wrapper class for the COM interface ''Direct2d.IWICBitmap'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(00000121-a8f2-4877-ba0a-fd2b6645fb94)
]
interface IWICBitmap : IWICBitmapSource
 {
	[id(0x60020000)]
	HRESULT __stdcall Lock(
		[in]WICRect* prcLock,
		[in]DWORD flags,
		[out]IWICBitmapLock** ppILock);
	[id(0x60020001)]
	HRESULT __stdcall SetPalette(
		[in]IWICPalette* pIPalette);
	[id(0x60020002)]
	HRESULT __stdcall SetResolution(
		[in]double dpiX,
		[in]double dpiY);
};

```'!
!IWICBitmap categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IWICBitmap methodsFor!

lock: prcLock flags: flags
	"Answer the <IWICBitmapLock> result of invoking the Lock() method of the COM object."

	| answer |
	answer := IWICBitmapLock newPointer.
	self
		Lock: prcLock
		flags: flags
		ppILock: answer.
	^answer asObject
!

Lock: prcLock flags: flags ppILock: ppILock
	"Private - Invoke the Lock() method of the COM object.

		HRESULT __stdcall Lock(
			[in]WICRect* prcLock,
			[in]DWORD flags,
			[out]IWICBitmapLock** ppILock);"

	<virtual stdcall: hresult 9 WICRect* dword IWICBitmapLock**>
	^self invalidCall!

setPalette: pIPalette
	"Invoke the SetPalette() method of the COM object."

	^self SetPalette: pIPalette
!

SetPalette: pIPalette
	"Private - Invoke the SetPalette() method of the COM object.

		HRESULT __stdcall SetPalette(
			[in]IWICPalette* pIPalette);"

	<virtual stdcall: hresult 10 IWICPalette*>
	^self invalidCall!

setResolution: dpiX dpiY: dpiY
	"Invoke the SetResolution() method of the COM object."

	^self
		SetResolution: dpiX
		dpiY: dpiY
!

SetResolution: dpiX dpiY: dpiY
	"Private - Invoke the SetResolution() method of the COM object.

		HRESULT __stdcall SetResolution(
			[in]double dpiX,
			[in]double dpiY);"

	<virtual stdcall: hresult 11 double double>
	^self invalidCall! !
!IWICBitmap categoriesFor: #lock:flags:!**auto generated**!methods!public! !
!IWICBitmap categoriesFor: #Lock:flags:ppILock:!**auto generated**!COM Interfaces-IWICBitmap!private! !
!IWICBitmap categoriesFor: #setPalette:!**auto generated**!methods!public! !
!IWICBitmap categoriesFor: #SetPalette:!**auto generated**!COM Interfaces-IWICBitmap!private! !
!IWICBitmap categoriesFor: #setResolution:dpiY:!**auto generated**!methods!public! !
!IWICBitmap categoriesFor: #SetResolution:dpiY:!**auto generated**!COM Interfaces-IWICBitmap!private! !

!IWICBitmap class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IWICBitmap'
		IWICBitmap defineTemplate"

	self
		defineFunction: #Lock:flags:ppILock:
			argumentTypes: 'WICRect* dword IWICBitmapLock**';
		defineFunction: #SetPalette:
			argumentTypes: 'IWICPalette*';
		defineFunction: #SetResolution:dpiY:
			argumentTypes: 'double double'
! !
!IWICBitmap class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

