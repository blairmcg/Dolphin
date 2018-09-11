"Filed out from Dolphin Smalltalk 7"!

IDXGIObject subclass: #IDXGIDeviceSubObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IDXGIDeviceSubObject guid: (IID fromString: '{3D3E0379-F9DE-4D58-BB6C-18D62992F1A6}')!
IDXGIDeviceSubObject comment: '`IDXGIDeviceSubObject` is a wrapper class for the COM interface ''Direct2d.IDXGIDeviceSubObject'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(3d3e0379-f9de-4d58-bb6c-18d62992f1a6)
]
interface IDXGIDeviceSubObject : IDXGIObject
 {
	[id(0x60020000)]
	HRESULT __stdcall GetDevice(
		[in]GUID* riid,
		[out, retval]void** ppDevice);
};

```'!
!IDXGIDeviceSubObject categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDXGIDeviceSubObject methodsFor!

getDevice: riid
	"Answer the <VOID> result of invoking the GetDevice() method of the COM object."

	| answer |
	answer := (VOID newBufferClass: COMTaskMemory).
	self
		GetDevice: riid
		ppDevice: answer.
	^answer asObject
!

GetDevice: riid ppDevice: ppDevice
	"Private - Invoke the GetDevice() method of the COM object.

		HRESULT __stdcall GetDevice(
			[in]GUID* riid,
			[out, retval]void** ppDevice);"

	<virtual stdcall: hresult 8 GUID* void**>
	^self invalidCall! !
!IDXGIDeviceSubObject categoriesFor: #getDevice:!**auto generated**!methods!public! !
!IDXGIDeviceSubObject categoriesFor: #GetDevice:ppDevice:!**auto generated**!COM Interfaces-IDXGIDeviceSubObject!private! !

!IDXGIDeviceSubObject class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IDXGIDeviceSubObject'
		IDXGIDeviceSubObject defineTemplate"

	self
		defineFunction: #GetDevice:ppDevice:
			argumentTypes: 'GUID* void**'
! !
!IDXGIDeviceSubObject class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

