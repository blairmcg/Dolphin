"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDXGIObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IDXGIObject guid: (IID fromString: '{AEC22FB8-76F3-4639-9BE0-28EB43A67A2E}')!
IDXGIObject comment: '`IDXGIObject` is a wrapper class for the COM interface ''Direct2d.IDXGIObject'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(aec22fb8-76f3-4639-9be0-28eb43a67a2e)
]
interface IDXGIObject : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall SetPrivateData(
		[in]GUID* Name,
		[in]unsigned int DataSize,
		[in]void* pData);
	[id(0x60010001)]
	HRESULT __stdcall SetPrivateDataInterface(
		[in]GUID* Name,
		[in]IUnknown* pUnknown);
	[id(0x60010002)]
	HRESULT __stdcall GetPrivateData(
		[in]GUID* Name,
		[in, out]unsigned int* pDataSize,
		[out]void* pData);
	[id(0x60010003)]
	HRESULT __stdcall GetParent(
		[in]GUID* riid,
		[out, retval]void** ppParent);
};

```'!
!IDXGIObject categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDXGIObject methodsFor!

getParent: riid
	"Answer the <VOID> result of invoking the GetParent() method of the COM object."

	| answer |
	answer := (VOID newBufferClass: COMTaskMemory).
	self
		GetParent: riid
		ppParent: answer.
	^answer asObject
!

GetParent: riid ppParent: ppParent
	"Private - Invoke the GetParent() method of the COM object.

		HRESULT __stdcall GetParent(
			[in]GUID* riid,
			[out, retval]void** ppParent);"

	<virtual stdcall: hresult 7 GUID* void**>
	^self invalidCall!

getPrivateData: name pDataSize: pDataSize
	"Invoke the GetPrivateData() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new value: pDataSize; yourself);
				basicAt: 2 put: (VOID new);
				yourself.
	self
		GetPrivateData: name
		pDataSize: (answer basicAt: 1)
		pData: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetPrivateData: name pDataSize: pDataSize pData: pData
	"Private - Invoke the GetPrivateData() method of the COM object.

		HRESULT __stdcall GetPrivateData(
			[in]GUID* Name,
			[in, out]unsigned int* pDataSize,
			[out]void* pData);"

	<virtual stdcall: hresult 6 GUID* dword* void*>
	^self invalidCall!

setPrivateData: name dataSize: dataSize pData: pData
	"Invoke the SetPrivateData() method of the COM object."

	^self
		SetPrivateData: name
		dataSize: dataSize
		pData: pData
!

SetPrivateData: name dataSize: dataSize pData: pData
	"Private - Invoke the SetPrivateData() method of the COM object.

		HRESULT __stdcall SetPrivateData(
			[in]GUID* Name,
			[in]unsigned int DataSize,
			[in]void* pData);"

	<virtual stdcall: hresult 4 GUID* dword void*>
	^self invalidCall!

setPrivateDataInterface: name pUnknown: pUnknown
	"Invoke the SetPrivateDataInterface() method of the COM object."

	^self
		SetPrivateDataInterface: name
		pUnknown: pUnknown
!

SetPrivateDataInterface: name pUnknown: pUnknown
	"Private - Invoke the SetPrivateDataInterface() method of the COM object.

		HRESULT __stdcall SetPrivateDataInterface(
			[in]GUID* Name,
			[in]IUnknown* pUnknown);"

	<virtual stdcall: hresult 5 GUID* IUnknown*>
	^self invalidCall! !
!IDXGIObject categoriesFor: #getParent:!**auto generated**!methods!public! !
!IDXGIObject categoriesFor: #GetParent:ppParent:!**auto generated**!COM Interfaces-IDXGIObject!private! !
!IDXGIObject categoriesFor: #getPrivateData:pDataSize:!**auto generated**!methods!public! !
!IDXGIObject categoriesFor: #GetPrivateData:pDataSize:pData:!**auto generated**!COM Interfaces-IDXGIObject!private! !
!IDXGIObject categoriesFor: #setPrivateData:dataSize:pData:!**auto generated**!methods!public! !
!IDXGIObject categoriesFor: #SetPrivateData:dataSize:pData:!**auto generated**!COM Interfaces-IDXGIObject!private! !
!IDXGIObject categoriesFor: #setPrivateDataInterface:pUnknown:!**auto generated**!methods!public! !
!IDXGIObject categoriesFor: #SetPrivateDataInterface:pUnknown:!**auto generated**!COM Interfaces-IDXGIObject!private! !

!IDXGIObject class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IDXGIObject'
		IDXGIObject defineTemplate"

	self
		defineFunction: #SetPrivateData:dataSize:pData:
			argumentTypes: 'GUID* dword void*';
		defineFunction: #SetPrivateDataInterface:pUnknown:
			argumentTypes: 'GUID* IUnknown*';
		defineFunction: #GetPrivateData:pDataSize:pData:
			argumentTypes: 'GUID* dword* void*';
		defineFunction: #GetParent:ppParent:
			argumentTypes: 'GUID* void**'
! !
!IDXGIObject class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

