"Filed out from Dolphin Smalltalk 7"!

ID2D1RenderTarget subclass: #ID2D1DCRenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1DCRenderTarget guid: (IID fromString: '{1C51BC64-DE61-46FD-9899-63A5D8F03950}')!
ID2D1DCRenderTarget comment: '`ID2D1DCRenderTarget` is a wrapper class for the COM interface ''Direct2d.ID2D1DCRenderTarget'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(1c51bc64-de61-46fd-9899-63a5d8f03950)
]
interface ID2D1DCRenderTarget : ID2D1RenderTarget
 {
	[id(0x60030000)]
	HRESULT __stdcall BindDC(
		[in]HDC dc,
		[in]RECT* rect);
};

```'!
!ID2D1DCRenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1DCRenderTarget methodsFor!

bindDC: dc rect: rect
	"Invoke the BindDC() method of the COM object."

	^self
		BindDC: dc
		rect: rect
!

BindDC: dc rect: rect
	"Private - Invoke the BindDC() method of the COM object.

		HRESULT __stdcall BindDC(
			[in]HDC dc,
			[in]RECT* rect);"

	<virtual stdcall: hresult 58 handle RECT*>
	^self invalidCall! !
!ID2D1DCRenderTarget categoriesFor: #bindDC:rect:!**auto generated**!methods!public! !
!ID2D1DCRenderTarget categoriesFor: #BindDC:rect:!**auto generated**!COM Interfaces-ID2D1DCRenderTarget!private! !

!ID2D1DCRenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1DCRenderTarget'
		ID2D1DCRenderTarget defineTemplate"

	self
		defineFunction: #BindDC:rect:
			argumentTypes: 'handle RECT*'
! !
!ID2D1DCRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

