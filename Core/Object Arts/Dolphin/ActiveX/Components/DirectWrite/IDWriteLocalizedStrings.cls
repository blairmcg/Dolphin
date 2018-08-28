"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteLocalizedStrings
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteLocalizedStrings guid: (IID fromString: '{08256209-099A-4B34-B86D-C22B110E7771}')!
IDWriteLocalizedStrings comment: '`IDWriteLocalizedStrings` is a wrapper class for the COM interface ''DirectWrite.IDWriteLocalizedStrings'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Represents a collection of strings indexed by locale name."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(08256209-099a-4b34-b86d-c22b110e7771), 
	helpstring("Represents a collection of strings indexed by locale name.")
]
interface IDWriteLocalizedStrings : IUnknown
 {
	[id(0x60010000)]
	unsigned int __stdcall GetCount();
	[id(0x60010001)]
	HRESULT __stdcall FindLocaleName(
		[in]unsigned short* localeName,
		[out]unsigned int* index,
		[out]BOOL* exists);
	[id(0x60010002)]
	HRESULT __stdcall GetLocaleNameLength(
		unsigned int index,
		[out]unsigned int* length);
	[id(0x60010003)]
	HRESULT __stdcall GetLocaleName(
		unsigned int index,
		[out]unsigned short* localeName,
		unsigned int size);
	[id(0x60010004)]
	HRESULT __stdcall GetStringLength(
		unsigned int index,
		[out]unsigned int* length);
	[id(0x60010005)]
	HRESULT __stdcall GetString(
		unsigned int index,
		[out]unsigned short* stringBuffer,
		unsigned int size);
};

```'!
!IDWriteLocalizedStrings categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteLocalizedStrings methodsFor!

findLocaleName: localeName
	"Invoke the FindLocaleName() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (BOOL new);
				yourself.
	self
		FindLocaleName: localeName
		index: (answer basicAt: 1)
		exists: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

FindLocaleName: localeName index: index exists: exists
	"Private - Invoke the FindLocaleName() method of the COM object.

		HRESULT __stdcall FindLocaleName(
			[in]unsigned short* localeName,
			[out]unsigned int* index,
			[out]BOOL* exists);"

	<virtual stdcall: hresult 5 word* dword* bool*>
	^self invalidCall!

getCount
	"Answer the <DWORD> result of invoking the GetCount() method of the COM object."

	^self GetCount
!

GetCount
	"Private - Invoke the GetCount() method of the COM object.

		unsigned int __stdcall GetCount();"

	<virtual stdcall: dword 4>
	^self invalidCall!

GetLocaleName: index localeName: localeName size: size
	"Private - Invoke the GetLocaleName() method of the COM object.

		HRESULT __stdcall GetLocaleName(
			unsigned int index,
			[out]unsigned short* localeName,
			unsigned int size);"

	<virtual stdcall: hresult 7 dword word* dword>
	^self invalidCall!

getLocaleName: index size: size
	"Answer the <WORD> result of invoking the GetLocaleName() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetLocaleName: index
		localeName: answer
		size: size.
	^answer asObject
!

getLocaleNameLength: index
	"Answer the <DWORD> result of invoking the GetLocaleNameLength() method of the COM object."

	| answer |
	answer := (DWORD new).
	self
		GetLocaleNameLength: index
		length: answer.
	^answer asObject
!

GetLocaleNameLength: index length: length
	"Private - Invoke the GetLocaleNameLength() method of the COM object.

		HRESULT __stdcall GetLocaleNameLength(
			unsigned int index,
			[out]unsigned int* length);"

	<virtual stdcall: hresult 6 dword dword*>
	^self invalidCall!

getString: index size: size
	"Answer the <WORD> result of invoking the GetString() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetString: index
		stringBuffer: answer
		size: size.
	^answer asObject
!

GetString: index stringBuffer: stringBuffer size: size
	"Private - Invoke the GetString() method of the COM object.

		HRESULT __stdcall GetString(
			unsigned int index,
			[out]unsigned short* stringBuffer,
			unsigned int size);"

	<virtual stdcall: hresult 9 dword word* dword>
	^self invalidCall!

getStringLength: index
	"Answer the <DWORD> result of invoking the GetStringLength() method of the COM object."

	| answer |
	answer := (DWORD new).
	self
		GetStringLength: index
		length: answer.
	^answer asObject
!

GetStringLength: index length: length
	"Private - Invoke the GetStringLength() method of the COM object.

		HRESULT __stdcall GetStringLength(
			unsigned int index,
			[out]unsigned int* length);"

	<virtual stdcall: hresult 8 dword dword*>
	^self invalidCall! !
!IDWriteLocalizedStrings categoriesFor: #findLocaleName:!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #FindLocaleName:index:exists:!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !
!IDWriteLocalizedStrings categoriesFor: #getCount!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #GetCount!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !
!IDWriteLocalizedStrings categoriesFor: #GetLocaleName:localeName:size:!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !
!IDWriteLocalizedStrings categoriesFor: #getLocaleName:size:!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #getLocaleNameLength:!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #GetLocaleNameLength:length:!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !
!IDWriteLocalizedStrings categoriesFor: #getString:size:!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #GetString:stringBuffer:size:!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !
!IDWriteLocalizedStrings categoriesFor: #getStringLength:!**auto generated**!methods!public! !
!IDWriteLocalizedStrings categoriesFor: #GetStringLength:length:!**auto generated**!COM Interfaces-IDWriteLocalizedStrings!private! !

!IDWriteLocalizedStrings class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteLocalizedStrings'
		IDWriteLocalizedStrings defineTemplate"

	self
		defineFunction: #GetCount
			returnType: 'dword';
		defineFunction: #FindLocaleName:index:exists:
			argumentTypes: 'word* dword* bool*';
		defineFunction: #GetLocaleNameLength:length:
			argumentTypes: 'dword dword*';
		defineFunction: #GetLocaleName:localeName:size:
			argumentTypes: 'dword word* dword';
		defineFunction: #GetStringLength:length:
			argumentTypes: 'dword dword*';
		defineFunction: #GetString:stringBuffer:size:
			argumentTypes: 'dword word* dword'
! !
!IDWriteLocalizedStrings class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

