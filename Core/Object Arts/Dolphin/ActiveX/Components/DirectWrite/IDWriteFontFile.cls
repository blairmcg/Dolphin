"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontFile
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFile guid: (IID fromString: '{739D886A-CEF5-47DC-8769-1A8B41BEBBB0}')!
IDWriteFontFile comment: '`IDWriteFontFile` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFile'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The interface that represents a reference to a font file."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(739d886a-cef5-47dc-8769-1a8b41bebbb0), 
	helpstring("The interface that represents a reference to a font file.")
]
interface IDWriteFontFile : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetReferenceKey(
		[out]void** fontFileReferenceKey,
		[out]unsigned int* fontFileReferenceKeySize);
	[id(0x60010001)]
	HRESULT __stdcall GetLoader(
		[out]IDWriteFontFileLoader** fontFileLoader);
	[id(0x60010002)]
	HRESULT __stdcall Analyze(
		[out]BOOL* isSupportedFontType,
		[out]DWRITE_FONT_FILE_TYPE* fontFileType,
		[out]DWRITE_FONT_FACE_TYPE* fontFaceType,
		[out]unsigned int* numberOfFaces);
};

```'!
!IDWriteFontFile categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFile methodsFor!

analyze
	"Invoke the Analyze() method of the COM object."

	| answer |
	answer := (Array new: 4)
				basicAt: 1 put: (BOOL new);
				basicAt: 2 put: (SDWORD new);
				basicAt: 3 put: (SDWORD new);
				basicAt: 4 put: (DWORD new);
				yourself.
	self
		Analyze: (answer basicAt: 1)
		fontFileType: (answer basicAt: 2)
		fontFaceType: (answer basicAt: 3)
		numberOfFaces: (answer basicAt: 4).
	^answer collect: [:each | each asObject]
!

Analyze: isSupportedFontType fontFileType: fontFileType fontFaceType: fontFaceType numberOfFaces: numberOfFaces
	"Private - Invoke the Analyze() method of the COM object.

		HRESULT __stdcall Analyze(
			[out]BOOL* isSupportedFontType,
			[out]DWRITE_FONT_FILE_TYPE* fontFileType,
			[out]DWRITE_FONT_FACE_TYPE* fontFaceType,
			[out]unsigned int* numberOfFaces);"

	<virtual stdcall: hresult 6 bool* sdword* sdword* dword*>
	^self invalidCall!

getLoader
	"Answer the <IDWriteFontFileLoader> result of invoking the GetLoader() method of the COM object."

	| answer |
	answer := IDWriteFontFileLoader newPointer.
	self GetLoader: answer.
	^answer asObject
!

GetLoader: fontFileLoader
	"Private - Invoke the GetLoader() method of the COM object.

		HRESULT __stdcall GetLoader(
			[out]IDWriteFontFileLoader** fontFileLoader);"

	<virtual stdcall: hresult 5 IDWriteFontFileLoader**>
	^self invalidCall!

getReferenceKey
	"Invoke the GetReferenceKey() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (VOID newBufferClass: COMTaskMemory);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetReferenceKey: (answer basicAt: 1)
		fontFileReferenceKeySize: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetReferenceKey: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize
	"Private - Invoke the GetReferenceKey() method of the COM object.

		HRESULT __stdcall GetReferenceKey(
			[out]void** fontFileReferenceKey,
			[out]unsigned int* fontFileReferenceKeySize);"

	<virtual stdcall: hresult 4 void** dword*>
	^self invalidCall! !
!IDWriteFontFile categoriesFor: #analyze!**auto generated**!methods!public! !
!IDWriteFontFile categoriesFor: #Analyze:fontFileType:fontFaceType:numberOfFaces:!**auto generated**!COM Interfaces-IDWriteFontFile!private! !
!IDWriteFontFile categoriesFor: #getLoader!**auto generated**!methods!public! !
!IDWriteFontFile categoriesFor: #GetLoader:!**auto generated**!COM Interfaces-IDWriteFontFile!private! !
!IDWriteFontFile categoriesFor: #getReferenceKey!**auto generated**!methods!public! !
!IDWriteFontFile categoriesFor: #GetReferenceKey:fontFileReferenceKeySize:!**auto generated**!COM Interfaces-IDWriteFontFile!private! !

!IDWriteFontFile class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFile'
		IDWriteFontFile defineTemplate"

	self
		defineFunction: #GetReferenceKey:fontFileReferenceKeySize:
			argumentTypes: 'void** dword*';
		defineFunction: #GetLoader:
			argumentTypes: 'IDWriteFontFileLoader**';
		defineFunction: #Analyze:fontFileType:fontFaceType:numberOfFaces:
			argumentTypes: 'bool* sdword* sdword* dword*'
! !
!IDWriteFontFile class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

