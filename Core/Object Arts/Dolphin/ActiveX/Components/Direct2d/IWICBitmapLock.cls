"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IWICBitmapLock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
IWICBitmapLock guid: (IID fromString: '{00000123-A8F2-4877-BA0A-FD2B6645FB94}')!
IWICBitmapLock comment: '`IWICBitmapLock` is a wrapper class for the COM interface ''Direct2d.IWICBitmapLock'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(00000123-a8f2-4877-ba0a-fd2b6645fb94)
]
interface IWICBitmapLock : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetSize(
		[out]unsigned int* puiWidth,
		[out]unsigned int* puiHeight);
	[id(0x60010001)]
	HRESULT __stdcall GetStride(
		[out]unsigned int* pcbStride);
	[id(0x60010002)]
	HRESULT __stdcall GetDataPointer(
		[out]unsigned int* pcbBufferSize,
		[out]BYTE** ppbData);
	[id(0x60010003)]
	HRESULT __stdcall GetPixelFormat(
		[out]GUID* pPixelFormat);
};

```'!
!IWICBitmapLock categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IWICBitmapLock methodsFor!

getDataPointer
	"Invoke the GetDataPointer() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (BYTE newBufferClass: COMTaskMemory);
				yourself.
	self
		GetDataPointer: (answer basicAt: 1)
		ppbData: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetDataPointer: pcbBufferSize ppbData: ppbData
	"Private - Invoke the GetDataPointer() method of the COM object.

		HRESULT __stdcall GetDataPointer(
			[out]unsigned int* pcbBufferSize,
			[out]BYTE** ppbData);"

	<virtual stdcall: hresult 6 dword* byte**>
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

	<virtual stdcall: hresult 7 GUID*>
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
	^self invalidCall!

getStride
	"Answer the <DWORD> result of invoking the GetStride() method of the COM object."

	| answer |
	answer := (DWORD new).
	self GetStride: answer.
	^answer asObject
!

GetStride: pcbStride
	"Private - Invoke the GetStride() method of the COM object.

		HRESULT __stdcall GetStride(
			[out]unsigned int* pcbStride);"

	<virtual stdcall: hresult 5 dword*>
	^self invalidCall! !
!IWICBitmapLock categoriesFor: #getDataPointer!**auto generated**!methods!public! !
!IWICBitmapLock categoriesFor: #GetDataPointer:ppbData:!**auto generated**!COM Interfaces-IWICBitmapLock!private! !
!IWICBitmapLock categoriesFor: #getPixelFormat!**auto generated**!methods!public! !
!IWICBitmapLock categoriesFor: #GetPixelFormat:!**auto generated**!COM Interfaces-IWICBitmapLock!private! !
!IWICBitmapLock categoriesFor: #getSize!**auto generated**!methods!public! !
!IWICBitmapLock categoriesFor: #GetSize:puiHeight:!**auto generated**!COM Interfaces-IWICBitmapLock!private! !
!IWICBitmapLock categoriesFor: #getStride!**auto generated**!methods!public! !
!IWICBitmapLock categoriesFor: #GetStride:!**auto generated**!COM Interfaces-IWICBitmapLock!private! !

!IWICBitmapLock class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.IWICBitmapLock'
		IWICBitmapLock defineTemplate"

	self
		defineFunction: #GetSize:puiHeight:
			argumentTypes: 'dword* dword*';
		defineFunction: #GetStride:
			argumentTypes: 'dword*';
		defineFunction: #GetDataPointer:ppbData:
			argumentTypes: 'dword* byte**';
		defineFunction: #GetPixelFormat:
			argumentTypes: 'GUID*'
! !
!IWICBitmapLock class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

