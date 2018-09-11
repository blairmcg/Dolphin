"Filed out from Dolphin Smalltalk 7"!

IDXGIDeviceSubObject subclass: #IDXGISurface
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IDXGISurface guid: (IID fromString: '{CAFCB56C-6AC3-4889-BF47-9E23BBD260EC}')!
IDXGISurface comment: '`IDXGISurface` is a wrapper class for the COM interface ''Direct2d.IDXGISurface'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(cafcb56c-6ac3-4889-bf47-9e23bbd260ec)
]
interface IDXGISurface : IDXGIDeviceSubObject
 {
	[id(0x60030000)]
	HRESULT __stdcall GetDesc(
		[out]DXGI_SURFACE_DESC* pDesc);
	[id(0x60030001)]
	HRESULT __stdcall Map(
		[out]DXGI_MAPPED_RECT* pLockedRect,
		[in]unsigned int MapFlags);
	[id(0x60030002)]
	HRESULT __stdcall Unmap();
};

```'!
!IDXGISurface categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDXGISurface methodsFor!

getDesc
	"Answer the <DXGI_SURFACE_DESC> result of invoking the GetDesc() method of the COM object."

	| answer |
	answer := (DXGI_SURFACE_DESC new).
	self GetDesc: answer.
	^answer asObject
!

GetDesc: pDesc
	"Private - Invoke the GetDesc() method of the COM object.

		HRESULT __stdcall GetDesc(
			[out]DXGI_SURFACE_DESC* pDesc);"

	<virtual stdcall: hresult 9 DXGI_SURFACE_DESC*>
	^self invalidCall!

map: mapFlags
	"Answer the <DXGI_MAPPED_RECT> result of invoking the Map() method of the COM object."

	| answer |
	answer := (DXGI_MAPPED_RECT new).
	self
		Map: answer
		mapFlags: mapFlags.
	^answer asObject
!

Map: pLockedRect mapFlags: mapFlags
	"Private - Invoke the Map() method of the COM object.

		HRESULT __stdcall Map(
			[out]DXGI_MAPPED_RECT* pLockedRect,
			[in]unsigned int MapFlags);"

	<virtual stdcall: hresult 10 DXGI_MAPPED_RECT* dword>
	^self invalidCall!

unmap
	"Invoke the Unmap() method of the COM object."

	^self Unmap
!

Unmap
	"Private - Invoke the Unmap() method of the COM object.

		HRESULT __stdcall Unmap();"

	<virtual stdcall: hresult 11>
	^self invalidCall! !
!IDXGISurface categoriesFor: #getDesc!**auto generated**!methods!public! !
!IDXGISurface categoriesFor: #GetDesc:!**auto generated**!COM Interfaces-IDXGISurface!private! !
!IDXGISurface categoriesFor: #map:!**auto generated**!methods!public! !
!IDXGISurface categoriesFor: #Map:mapFlags:!**auto generated**!COM Interfaces-IDXGISurface!private! !
!IDXGISurface categoriesFor: #unmap!**auto generated**!methods!public! !
!IDXGISurface categoriesFor: #Unmap!**auto generated**!COM Interfaces-IDXGISurface!private! !

!IDXGISurface class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IDXGISurface'
		IDXGISurface defineTemplate"

	self
		defineFunction: #GetDesc:
			argumentTypes: 'DXGI_SURFACE_DESC*';
		defineFunction: #Map:mapFlags:
			argumentTypes: 'DXGI_MAPPED_RECT* dword';
		defineFunction: #Unmap
! !
!IDXGISurface class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

