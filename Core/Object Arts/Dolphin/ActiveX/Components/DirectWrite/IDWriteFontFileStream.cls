"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontFileStream
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFileStream guid: (IID fromString: '{6D4865FE-0AB8-4D91-8F62-5DD6BE34A3E0}')!
IDWriteFontFileStream comment: '`IDWriteFontFileStream` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFileStream'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The interface for loading font file data."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(6d4865fe-0ab8-4d91-8f62-5dd6be34a3e0), 
	helpstring("The interface for loading font file data.")
]
interface IDWriteFontFileStream : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall ReadFileFragment(
		[out]void** fragmentStart,
		unsigned __int64 fileOffset,
		unsigned __int64 fragmentSize,
		[out]void** fragmentContext);
	[id(0x60010001)]
	void __stdcall ReleaseFileFragment(
		void* fragmentContext);
	[id(0x60010002)]
	HRESULT __stdcall GetFileSize(
		[out]unsigned __int64* fileSize);
	[id(0x60010003)]
	HRESULT __stdcall GetLastWriteTime(
		[out]unsigned __int64* lastWriteTime);
};

```'!
!IDWriteFontFileStream categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFileStream methodsFor!

getFileSize
	"Answer the <ULARGE_INTEGER> result of invoking the GetFileSize() method of the COM object."

	| answer |
	answer := (ULARGE_INTEGER new).
	self GetFileSize: answer.
	^answer asObject
!

GetFileSize: fileSize
	"Private - Invoke the GetFileSize() method of the COM object.

		HRESULT __stdcall GetFileSize(
			[out]unsigned __int64* fileSize);"

	<virtual stdcall: hresult 6 qword*>
	^self invalidCall!

getLastWriteTime
	"Answer the <ULARGE_INTEGER> result of invoking the GetLastWriteTime() method of the COM object."

	| answer |
	answer := (ULARGE_INTEGER new).
	self GetLastWriteTime: answer.
	^answer asObject
!

GetLastWriteTime: lastWriteTime
	"Private - Invoke the GetLastWriteTime() method of the COM object.

		HRESULT __stdcall GetLastWriteTime(
			[out]unsigned __int64* lastWriteTime);"

	<virtual stdcall: hresult 7 qword*>
	^self invalidCall!

ReadFileFragment: fragmentStart fileOffset: fileOffset fragmentSize: fragmentSize fragmentContext: fragmentContext
	"Private - Invoke the ReadFileFragment() method of the COM object.

		HRESULT __stdcall ReadFileFragment(
			[out]void** fragmentStart,
			unsigned __int64 fileOffset,
			unsigned __int64 fragmentSize,
			[out]void** fragmentContext);"

	<virtual stdcall: hresult 4 void** qword qword void**>
	^self invalidCall!

readFileFragment: fileOffset fragmentSize: fragmentSize
	"Invoke the ReadFileFragment() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (VOID newBufferClass: COMTaskMemory);
				basicAt: 2 put: (VOID newBufferClass: COMTaskMemory);
				yourself.
	self
		ReadFileFragment: (answer basicAt: 1)
		fileOffset: fileOffset
		fragmentSize: fragmentSize
		fragmentContext: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

releaseFileFragment: fragmentContext
	"Answer the <VOID> result of invoking the ReleaseFileFragment() method of the COM object."

	self ReleaseFileFragment: fragmentContext
!

ReleaseFileFragment: fragmentContext
	"Private - Invoke the ReleaseFileFragment() method of the COM object.

		void __stdcall ReleaseFileFragment(
			void* fragmentContext);"

	<virtual stdcall: void 5 void*>
	^self invalidCall! !
!IDWriteFontFileStream categoriesFor: #getFileSize!**auto generated**!methods!public! !
!IDWriteFontFileStream categoriesFor: #GetFileSize:!**auto generated**!COM Interfaces-IDWriteFontFileStream!private! !
!IDWriteFontFileStream categoriesFor: #getLastWriteTime!**auto generated**!methods!public! !
!IDWriteFontFileStream categoriesFor: #GetLastWriteTime:!**auto generated**!COM Interfaces-IDWriteFontFileStream!private! !
!IDWriteFontFileStream categoriesFor: #ReadFileFragment:fileOffset:fragmentSize:fragmentContext:!**auto generated**!COM Interfaces-IDWriteFontFileStream!private! !
!IDWriteFontFileStream categoriesFor: #readFileFragment:fragmentSize:!**auto generated**!methods!public! !
!IDWriteFontFileStream categoriesFor: #releaseFileFragment:!**auto generated**!methods!public! !
!IDWriteFontFileStream categoriesFor: #ReleaseFileFragment:!**auto generated**!COM Interfaces-IDWriteFontFileStream!private! !

!IDWriteFontFileStream class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFileStream'
		IDWriteFontFileStream defineTemplate"

	self
		defineFunction: #ReadFileFragment:fileOffset:fragmentSize:fragmentContext:
			argumentTypes: 'void** qword qword void**';
		defineFunction: #ReleaseFileFragment:
			returnType: 'void'
			argumentTypes: 'void*';
		defineFunction: #GetFileSize:
			argumentTypes: 'qword*';
		defineFunction: #GetLastWriteTime:
			argumentTypes: 'qword*'
! !
!IDWriteFontFileStream class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

