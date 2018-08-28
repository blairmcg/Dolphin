"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontFileEnumerator
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFileEnumerator guid: (IID fromString: '{72755049-5FF7-435D-8348-4BE97CFA6C7C}')!
IDWriteFontFileEnumerator comment: '`IDWriteFontFileEnumerator` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFileEnumerator'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The font file enumerator interface encapsulates a collection of font files. The font system uses this interface to enumerate font files when building a font collection."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(72755049-5ff7-435d-8348-4be97cfa6c7c), 
	helpstring("The font file enumerator interface encapsulates a collection of font files. The font system uses this interface to enumerate font files when building a font collection.")
]
interface IDWriteFontFileEnumerator : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall MoveNext(
		[out]BOOL* hasCurrentFile);
	[id(0x60010001)]
	HRESULT __stdcall GetCurrentFontFile(
		[out]IDWriteFontFile** fontFile);
};

```'!
!IDWriteFontFileEnumerator categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFileEnumerator methodsFor!

getCurrentFontFile
	"Answer the <IDWriteFontFile> result of invoking the GetCurrentFontFile() method of the COM object."

	| answer |
	answer := IDWriteFontFile newPointer.
	self GetCurrentFontFile: answer.
	^answer asObject
!

GetCurrentFontFile: fontFile
	"Private - Invoke the GetCurrentFontFile() method of the COM object.

		HRESULT __stdcall GetCurrentFontFile(
			[out]IDWriteFontFile** fontFile);"

	<virtual stdcall: hresult 5 IDWriteFontFile**>
	^self invalidCall!

moveNext
	"Answer the <BOOL> result of invoking the MoveNext() method of the COM object."

	| answer |
	answer := (BOOL new).
	self MoveNext: answer.
	^answer asObject
!

MoveNext: hasCurrentFile
	"Private - Invoke the MoveNext() method of the COM object.

		HRESULT __stdcall MoveNext(
			[out]BOOL* hasCurrentFile);"

	<virtual stdcall: hresult 4 bool*>
	^self invalidCall! !
!IDWriteFontFileEnumerator categoriesFor: #getCurrentFontFile!**auto generated**!methods!public! !
!IDWriteFontFileEnumerator categoriesFor: #GetCurrentFontFile:!**auto generated**!COM Interfaces-IDWriteFontFileEnumerator!private! !
!IDWriteFontFileEnumerator categoriesFor: #moveNext!**auto generated**!methods!public! !
!IDWriteFontFileEnumerator categoriesFor: #MoveNext:!**auto generated**!COM Interfaces-IDWriteFontFileEnumerator!private! !

!IDWriteFontFileEnumerator class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFileEnumerator'
		IDWriteFontFileEnumerator defineTemplate"

	self
		defineFunction: #MoveNext:
			argumentTypes: 'bool*';
		defineFunction: #GetCurrentFontFile:
			argumentTypes: 'IDWriteFontFile**'
! !
!IDWriteFontFileEnumerator class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

