"Filed out from Dolphin Smalltalk 7"!

IDWriteFontFileLoader subclass: #IDWriteLocalFontFileLoader
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteLocalFontFileLoader guid: (IID fromString: '{B2D9F3EC-C9FE-4A11-A2EC-D86208F7C0A2}')!
IDWriteLocalFontFileLoader comment: '`IDWriteLocalFontFileLoader` is a wrapper class for the COM interface ''DirectWrite.IDWriteLocalFontFileLoader'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"A built-in implementation of IDWriteFontFileLoader interface that operates on local font files and exposes local font file information from the font file reference key. Font file references created using CreateFontFileReference use this font file loader."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(b2d9f3ec-c9fe-4a11-a2ec-d86208f7c0a2), 
	helpstring("A built-in implementation of IDWriteFontFileLoader interface that operates on local font files and exposes local font file information from the font file reference key. Font file references created using CreateFontFileReference use this font file loader.")
]
interface IDWriteLocalFontFileLoader : IDWriteFontFileLoader
 {
	[id(0x60020000)]
	HRESULT __stdcall GetFilePathLengthFromKey(
		[in]void* fontFileReferenceKey,
		unsigned int fontFileReferenceKeySize,
		[out]unsigned int* filePathLength);
	[id(0x60020001)]
	HRESULT __stdcall GetFilePathFromKey(
		[in]void* fontFileReferenceKey,
		unsigned int fontFileReferenceKeySize,
		[out]unsigned short* filePath,
		unsigned int filePathSize);
	[id(0x60020002)]
	HRESULT __stdcall GetLastWriteTimeFromKey(
		[in]void* fontFileReferenceKey,
		unsigned int fontFileReferenceKeySize,
		[out]FILETIME* lastWriteTime);
};

```'!
!IDWriteLocalFontFileLoader categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteLocalFontFileLoader methodsFor!

GetFilePathFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize filePath: filePath filePathSize: filePathSize
	"Private - Invoke the GetFilePathFromKey() method of the COM object.

		HRESULT __stdcall GetFilePathFromKey(
			[in]void* fontFileReferenceKey,
			unsigned int fontFileReferenceKeySize,
			[out]unsigned short* filePath,
			unsigned int filePathSize);"

	<virtual stdcall: hresult 6 void* dword word* dword>
	^self invalidCall!

getFilePathFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize filePathSize: filePathSize
	"Answer the <WORD> result of invoking the GetFilePathFromKey() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetFilePathFromKey: fontFileReferenceKey
		fontFileReferenceKeySize: fontFileReferenceKeySize
		filePath: answer
		filePathSize: filePathSize.
	^answer asObject
!

getFilePathLengthFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize
	"Answer the <DWORD> result of invoking the GetFilePathLengthFromKey() method of the COM object."

	| answer |
	answer := (DWORD new).
	self
		GetFilePathLengthFromKey: fontFileReferenceKey
		fontFileReferenceKeySize: fontFileReferenceKeySize
		filePathLength: answer.
	^answer asObject
!

GetFilePathLengthFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize filePathLength: filePathLength
	"Private - Invoke the GetFilePathLengthFromKey() method of the COM object.

		HRESULT __stdcall GetFilePathLengthFromKey(
			[in]void* fontFileReferenceKey,
			unsigned int fontFileReferenceKeySize,
			[out]unsigned int* filePathLength);"

	<virtual stdcall: hresult 5 void* dword dword*>
	^self invalidCall!

getLastWriteTimeFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize
	"Answer the <FILETIME> result of invoking the GetLastWriteTimeFromKey() method of the COM object."

	| answer |
	answer := (FILETIME new).
	self
		GetLastWriteTimeFromKey: fontFileReferenceKey
		fontFileReferenceKeySize: fontFileReferenceKeySize
		lastWriteTime: answer.
	^answer asObject
!

GetLastWriteTimeFromKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize lastWriteTime: lastWriteTime
	"Private - Invoke the GetLastWriteTimeFromKey() method of the COM object.

		HRESULT __stdcall GetLastWriteTimeFromKey(
			[in]void* fontFileReferenceKey,
			unsigned int fontFileReferenceKeySize,
			[out]FILETIME* lastWriteTime);"

	<virtual stdcall: hresult 7 void* dword FILETIME*>
	^self invalidCall! !
!IDWriteLocalFontFileLoader categoriesFor: #GetFilePathFromKey:fontFileReferenceKeySize:filePath:filePathSize:!**auto generated**!COM Interfaces-IDWriteLocalFontFileLoader!private! !
!IDWriteLocalFontFileLoader categoriesFor: #getFilePathFromKey:fontFileReferenceKeySize:filePathSize:!**auto generated**!methods!public! !
!IDWriteLocalFontFileLoader categoriesFor: #getFilePathLengthFromKey:fontFileReferenceKeySize:!**auto generated**!methods!public! !
!IDWriteLocalFontFileLoader categoriesFor: #GetFilePathLengthFromKey:fontFileReferenceKeySize:filePathLength:!**auto generated**!COM Interfaces-IDWriteLocalFontFileLoader!private! !
!IDWriteLocalFontFileLoader categoriesFor: #getLastWriteTimeFromKey:fontFileReferenceKeySize:!**auto generated**!methods!public! !
!IDWriteLocalFontFileLoader categoriesFor: #GetLastWriteTimeFromKey:fontFileReferenceKeySize:lastWriteTime:!**auto generated**!COM Interfaces-IDWriteLocalFontFileLoader!private! !

!IDWriteLocalFontFileLoader class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteLocalFontFileLoader'
		IDWriteLocalFontFileLoader defineTemplate"

	self
		defineFunction: #GetFilePathLengthFromKey:fontFileReferenceKeySize:filePathLength:
			argumentTypes: 'void* dword dword*';
		defineFunction: #GetFilePathFromKey:fontFileReferenceKeySize:filePath:filePathSize:
			argumentTypes: 'void* dword word* dword';
		defineFunction: #GetLastWriteTimeFromKey:fontFileReferenceKeySize:lastWriteTime:
			argumentTypes: 'void* dword FILETIME*'
! !
!IDWriteLocalFontFileLoader class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

