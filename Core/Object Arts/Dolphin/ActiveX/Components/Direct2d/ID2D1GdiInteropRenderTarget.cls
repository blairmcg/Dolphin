"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ID2D1GdiInteropRenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1GdiInteropRenderTarget guid: (IID fromString: '{E0DB51C3-6F77-4BAE-B3D5-E47509B35838}')!
ID2D1GdiInteropRenderTarget comment: '`ID2D1GdiInteropRenderTarget` is a wrapper class for the COM interface ''Direct2d.ID2D1GdiInteropRenderTarget'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(e0db51c3-6f77-4bae-b3d5-e47509b35838)
]
interface ID2D1GdiInteropRenderTarget : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetDC(
		[in]D2D1_DC_INITIALIZE_MODE mode,
		[out]HDC* dc);
	[id(0x60010001)]
	HRESULT __stdcall ReleaseDC(
		[in]RECT* update);
};

```'!
!ID2D1GdiInteropRenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1GdiInteropRenderTarget methodsFor!

getDC: mode
	"Answer the <ExternalHandle> result of invoking the GetDC() method of the COM object."

	| answer |
	answer := ExternalHandle new.
	self
		GetDC: mode
		dc: answer.
	^answer asObject
!

GetDC: mode dc: dc
	"Private - Invoke the GetDC() method of the COM object.

		HRESULT __stdcall GetDC(
			[in]D2D1_DC_INITIALIZE_MODE mode,
			[out]HDC* dc);"

	<virtual stdcall: hresult 4 sdword handle*>
	^self invalidCall!

releaseDC: update
	"Invoke the ReleaseDC() method of the COM object."

	^self ReleaseDC: update
!

ReleaseDC: update
	"Private - Invoke the ReleaseDC() method of the COM object.

		HRESULT __stdcall ReleaseDC(
			[in]RECT* update);"

	<virtual stdcall: hresult 5 RECT*>
	^self invalidCall! !
!ID2D1GdiInteropRenderTarget categoriesFor: #getDC:!**auto generated**!methods!public! !
!ID2D1GdiInteropRenderTarget categoriesFor: #GetDC:dc:!**auto generated**!COM Interfaces-ID2D1GdiInteropRenderTarget!private! !
!ID2D1GdiInteropRenderTarget categoriesFor: #releaseDC:!**auto generated**!methods!public! !
!ID2D1GdiInteropRenderTarget categoriesFor: #ReleaseDC:!**auto generated**!COM Interfaces-ID2D1GdiInteropRenderTarget!private! !

!ID2D1GdiInteropRenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1GdiInteropRenderTarget'
		ID2D1GdiInteropRenderTarget defineTemplate"

	self
		defineFunction: #GetDC:dc:
			argumentTypes: 'sdword handle*';
		defineFunction: #ReleaseDC:
			argumentTypes: 'RECT*'
! !
!ID2D1GdiInteropRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

