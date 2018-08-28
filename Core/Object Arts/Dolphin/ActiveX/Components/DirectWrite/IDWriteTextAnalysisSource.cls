"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteTextAnalysisSource
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextAnalysisSource guid: (IID fromString: '{688E1A58-5094-47C8-ADC8-FBCEA60AE92B}')!
IDWriteTextAnalysisSource comment: '`IDWriteTextAnalysisSource` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextAnalysisSource'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Interface implemented by the text analyzer''s client to provide text to the analyzer. 
Provides separation between the logical view of text as a continuous sequence of characters, 
and the client memory layout of potentially discrete blocks of text."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(688e1a58-5094-47c8-adc8-fbcea60ae92b), 
	helpstring("Interface implemented by the text analyzer''s client to provide text to the analyzer. 
Provides separation between the logical view of text as a continuous sequence of characters, 
and the client memory layout of potentially discrete blocks of text.")
]
interface IDWriteTextAnalysisSource : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetTextAtPosition(
		unsigned int textPosition,
		[out]unsigned short** textString,
		[out]unsigned int* textLength);
	[id(0x60010001)]
	HRESULT __stdcall GetTextBeforePosition(
		unsigned int textPosition,
		[out]unsigned short** textString,
		[out]unsigned int* textLength);
	[id(0x60010002)]
	DWRITE_READING_DIRECTION __stdcall GetParagraphReadingDirection();
	[id(0x60010003)]
	HRESULT __stdcall GetLocaleName(
		unsigned int textPosition,
		[out]unsigned int* textLength,
		[out]unsigned short** localeName);
	[id(0x60010004)]
	HRESULT __stdcall GetNumberSubstitution(
		unsigned int textPosition,
		[out]unsigned int* textLength,
		[out]IDWriteNumberSubstitution** numberSubstitution);
};

```'!
!IDWriteTextAnalysisSource categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextAnalysisSource methodsFor!

getLocaleName: textPosition
	"Invoke the GetLocaleName() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (WORD newBufferClass: COMTaskMemory);
				yourself.
	self
		GetLocaleName: textPosition
		textLength: (answer basicAt: 1)
		localeName: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetLocaleName: textPosition textLength: textLength localeName: localeName
	"Private - Invoke the GetLocaleName() method of the COM object.

		HRESULT __stdcall GetLocaleName(
			unsigned int textPosition,
			[out]unsigned int* textLength,
			[out]unsigned short** localeName);"

	<virtual stdcall: hresult 7 dword dword* word**>
	^self invalidCall!

getNumberSubstitution: textPosition
	"Invoke the GetNumberSubstitution() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: IDWriteNumberSubstitution newPointer;
				yourself.
	self
		GetNumberSubstitution: textPosition
		textLength: (answer basicAt: 1)
		numberSubstitution: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetNumberSubstitution: textPosition textLength: textLength numberSubstitution: numberSubstitution
	"Private - Invoke the GetNumberSubstitution() method of the COM object.

		HRESULT __stdcall GetNumberSubstitution(
			unsigned int textPosition,
			[out]unsigned int* textLength,
			[out]IDWriteNumberSubstitution** numberSubstitution);"

	<virtual stdcall: hresult 8 dword dword* IDWriteNumberSubstitution**>
	^self invalidCall!

getParagraphReadingDirection
	"Answer the <SDWORD> result of invoking the GetParagraphReadingDirection() method of the COM object."

	^self GetParagraphReadingDirection
!

GetParagraphReadingDirection
	"Private - Invoke the GetParagraphReadingDirection() method of the COM object.

		DWRITE_READING_DIRECTION __stdcall GetParagraphReadingDirection();"

	<virtual stdcall: sdword 6>
	^self invalidCall!

getTextAtPosition: textPosition
	"Invoke the GetTextAtPosition() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (WORD newBufferClass: COMTaskMemory);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetTextAtPosition: textPosition
		textString: (answer basicAt: 1)
		textLength: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetTextAtPosition: textPosition textString: textString textLength: textLength
	"Private - Invoke the GetTextAtPosition() method of the COM object.

		HRESULT __stdcall GetTextAtPosition(
			unsigned int textPosition,
			[out]unsigned short** textString,
			[out]unsigned int* textLength);"

	<virtual stdcall: hresult 4 dword word** dword*>
	^self invalidCall!

getTextBeforePosition: textPosition
	"Invoke the GetTextBeforePosition() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (WORD newBufferClass: COMTaskMemory);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetTextBeforePosition: textPosition
		textString: (answer basicAt: 1)
		textLength: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetTextBeforePosition: textPosition textString: textString textLength: textLength
	"Private - Invoke the GetTextBeforePosition() method of the COM object.

		HRESULT __stdcall GetTextBeforePosition(
			unsigned int textPosition,
			[out]unsigned short** textString,
			[out]unsigned int* textLength);"

	<virtual stdcall: hresult 5 dword word** dword*>
	^self invalidCall! !
!IDWriteTextAnalysisSource categoriesFor: #getLocaleName:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSource categoriesFor: #GetLocaleName:textLength:localeName:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSource!private! !
!IDWriteTextAnalysisSource categoriesFor: #getNumberSubstitution:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSource categoriesFor: #GetNumberSubstitution:textLength:numberSubstitution:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSource!private! !
!IDWriteTextAnalysisSource categoriesFor: #getParagraphReadingDirection!**auto generated**!methods!public! !
!IDWriteTextAnalysisSource categoriesFor: #GetParagraphReadingDirection!**auto generated**!COM Interfaces-IDWriteTextAnalysisSource!private! !
!IDWriteTextAnalysisSource categoriesFor: #getTextAtPosition:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSource categoriesFor: #GetTextAtPosition:textString:textLength:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSource!private! !
!IDWriteTextAnalysisSource categoriesFor: #getTextBeforePosition:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSource categoriesFor: #GetTextBeforePosition:textString:textLength:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSource!private! !

!IDWriteTextAnalysisSource class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextAnalysisSource'
		IDWriteTextAnalysisSource defineTemplate"

	self
		defineFunction: #GetTextAtPosition:textString:textLength:
			argumentTypes: 'dword word** dword*';
		defineFunction: #GetTextBeforePosition:textString:textLength:
			argumentTypes: 'dword word** dword*';
		defineFunction: #GetParagraphReadingDirection
			returnType: 'sdword';
		defineFunction: #GetLocaleName:textLength:localeName:
			argumentTypes: 'dword dword* word**';
		defineFunction: #GetNumberSubstitution:textLength:numberSubstitution:
			argumentTypes: 'dword dword* IDWriteNumberSubstitution**'
! !
!IDWriteTextAnalysisSource class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

