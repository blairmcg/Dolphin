"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteTextAnalysisSink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextAnalysisSink guid: (IID fromString: '{5810CD44-0CA0-4701-B3FA-BEC5182AE4F6}')!
IDWriteTextAnalysisSink comment: '`IDWriteTextAnalysisSink` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextAnalysisSink'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Interface implemented by the text analyzer''s client to receive the output of a given text analysis. 
The Text analyzer disregards any current state of the analysis sink, so a Set call on a range overwrites the previous analysis result for that range."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(5810cd44-0ca0-4701-b3fa-bec5182ae4f6), 
	helpstring("Interface implemented by the text analyzer''s client to receive the output of a given text analysis. 
The Text analyzer disregards any current state of the analysis sink, so a Set call on a range overwrites the previous analysis result for that range.")
]
interface IDWriteTextAnalysisSink : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall SetScriptAnalysis(
		unsigned int textPosition,
		unsigned int textLength,
		[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis);
	[id(0x60010001)]
	HRESULT __stdcall SetLineBreakpoints(
		unsigned int textPosition,
		unsigned int textLength,
		[in]DWRITE_LINE_BREAKPOINT* lineBreakpoints);
	[id(0x60010002)]
	HRESULT __stdcall SetBidiLevel(
		unsigned int textPosition,
		unsigned int textLength,
		BYTE explicitLevel,
		BYTE resolvedLevel);
	[id(0x60010003)]
	HRESULT __stdcall SetNumberSubstitution(
		unsigned int textPosition,
		unsigned int textLength,
		[in]IDWriteNumberSubstitution* numberSubstitution);
};

```'!
!IDWriteTextAnalysisSink categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextAnalysisSink methodsFor!

setBidiLevel: textPosition textLength: textLength explicitLevel: explicitLevel resolvedLevel: resolvedLevel
	"Invoke the SetBidiLevel() method of the COM object."

	^self
		SetBidiLevel: textPosition
		textLength: textLength
		explicitLevel: explicitLevel
		resolvedLevel: resolvedLevel
!

SetBidiLevel: textPosition textLength: textLength explicitLevel: explicitLevel resolvedLevel: resolvedLevel
	"Private - Invoke the SetBidiLevel() method of the COM object.

		HRESULT __stdcall SetBidiLevel(
			unsigned int textPosition,
			unsigned int textLength,
			BYTE explicitLevel,
			BYTE resolvedLevel);"

	<virtual stdcall: hresult 6 dword dword byte byte>
	^self invalidCall!

setLineBreakpoints: textPosition textLength: textLength lineBreakpoints: lineBreakpoints
	"Invoke the SetLineBreakpoints() method of the COM object."

	^self
		SetLineBreakpoints: textPosition
		textLength: textLength
		lineBreakpoints: lineBreakpoints
!

SetLineBreakpoints: textPosition textLength: textLength lineBreakpoints: lineBreakpoints
	"Private - Invoke the SetLineBreakpoints() method of the COM object.

		HRESULT __stdcall SetLineBreakpoints(
			unsigned int textPosition,
			unsigned int textLength,
			[in]DWRITE_LINE_BREAKPOINT* lineBreakpoints);"

	<virtual stdcall: hresult 5 dword dword DWRITE_LINE_BREAKPOINT*>
	^self invalidCall!

setNumberSubstitution: textPosition textLength: textLength numberSubstitution: numberSubstitution
	"Invoke the SetNumberSubstitution() method of the COM object."

	^self
		SetNumberSubstitution: textPosition
		textLength: textLength
		numberSubstitution: numberSubstitution
!

SetNumberSubstitution: textPosition textLength: textLength numberSubstitution: numberSubstitution
	"Private - Invoke the SetNumberSubstitution() method of the COM object.

		HRESULT __stdcall SetNumberSubstitution(
			unsigned int textPosition,
			unsigned int textLength,
			[in]IDWriteNumberSubstitution* numberSubstitution);"

	<virtual stdcall: hresult 7 dword dword IDWriteNumberSubstitution*>
	^self invalidCall!

setScriptAnalysis: textPosition textLength: textLength scriptAnalysis: scriptAnalysis
	"Invoke the SetScriptAnalysis() method of the COM object."

	^self
		SetScriptAnalysis: textPosition
		textLength: textLength
		scriptAnalysis: scriptAnalysis
!

SetScriptAnalysis: textPosition textLength: textLength scriptAnalysis: scriptAnalysis
	"Private - Invoke the SetScriptAnalysis() method of the COM object.

		HRESULT __stdcall SetScriptAnalysis(
			unsigned int textPosition,
			unsigned int textLength,
			[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis);"

	<virtual stdcall: hresult 4 dword dword DWRITE_SCRIPT_ANALYSIS*>
	^self invalidCall! !
!IDWriteTextAnalysisSink categoriesFor: #setBidiLevel:textLength:explicitLevel:resolvedLevel:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSink categoriesFor: #SetBidiLevel:textLength:explicitLevel:resolvedLevel:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSink!private! !
!IDWriteTextAnalysisSink categoriesFor: #setLineBreakpoints:textLength:lineBreakpoints:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSink categoriesFor: #SetLineBreakpoints:textLength:lineBreakpoints:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSink!private! !
!IDWriteTextAnalysisSink categoriesFor: #setNumberSubstitution:textLength:numberSubstitution:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSink categoriesFor: #SetNumberSubstitution:textLength:numberSubstitution:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSink!private! !
!IDWriteTextAnalysisSink categoriesFor: #setScriptAnalysis:textLength:scriptAnalysis:!**auto generated**!methods!public! !
!IDWriteTextAnalysisSink categoriesFor: #SetScriptAnalysis:textLength:scriptAnalysis:!**auto generated**!COM Interfaces-IDWriteTextAnalysisSink!private! !

!IDWriteTextAnalysisSink class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextAnalysisSink'
		IDWriteTextAnalysisSink defineTemplate"

	self
		defineFunction: #SetScriptAnalysis:textLength:scriptAnalysis:
			argumentTypes: 'dword dword DWRITE_SCRIPT_ANALYSIS*';
		defineFunction: #SetLineBreakpoints:textLength:lineBreakpoints:
			argumentTypes: 'dword dword DWRITE_LINE_BREAKPOINT*';
		defineFunction: #SetBidiLevel:textLength:explicitLevel:resolvedLevel:
			argumentTypes: 'dword dword byte byte';
		defineFunction: #SetNumberSubstitution:textLength:numberSubstitution:
			argumentTypes: 'dword dword IDWriteNumberSubstitution*'
! !
!IDWriteTextAnalysisSink class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

