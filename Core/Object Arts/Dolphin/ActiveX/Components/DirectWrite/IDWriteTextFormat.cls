"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteTextFormat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextFormat guid: (IID fromString: '{9C906818-31D7-4FD3-A151-7C5E225DB55A}')!
IDWriteTextFormat comment: '`IDWriteTextFormat` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextFormat'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The format of text used for text layout. This object may not be thread-safe and it may carry the state of text format change."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(9c906818-31d7-4fd3-a151-7c5e225db55a), 
	helpstring("The format of text used for text layout. This object may not be thread-safe and it may carry the state of text format change.")
]
interface IDWriteTextFormat : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall SetTextAlignment(
		DWRITE_TEXT_ALIGNMENT textAlignment);
	[id(0x60010001)]
	HRESULT __stdcall SetParagraphAlignment(
		DWRITE_PARAGRAPH_ALIGNMENT paragraphAlignment);
	[id(0x60010002)]
	HRESULT __stdcall SetWordWrapping(
		DWRITE_WORD_WRAPPING wordWrapping);
	[id(0x60010003)]
	HRESULT __stdcall SetReadingDirection(
		DWRITE_READING_DIRECTION readingDirection);
	[id(0x60010004)]
	HRESULT __stdcall SetFlowDirection(
		DWRITE_FLOW_DIRECTION flowDirection);
	[id(0x60010005)]
	HRESULT __stdcall SetIncrementalTabStop(
		float incrementalTabStop);
	[id(0x60010006)]
	HRESULT __stdcall SetTrimming(
		[in]DWRITE_TRIMMING* trimmingOptions,
		[in]IDWriteInlineObject* trimmingSign);
	[id(0x60010007)]
	HRESULT __stdcall SetLineSpacing(
		DWRITE_LINE_SPACING_METHOD lineSpacingMethod,
		float lineSpacing,
		float baseline);
	[id(0x60010008)]
	DWRITE_TEXT_ALIGNMENT __stdcall GetTextAlignment();
	[id(0x60010009)]
	DWRITE_PARAGRAPH_ALIGNMENT __stdcall GetParagraphAlignment();
	[id(0x6001000a)]
	DWRITE_WORD_WRAPPING __stdcall GetWordWrapping();
	[id(0x6001000b)]
	DWRITE_READING_DIRECTION __stdcall GetReadingDirection();
	[id(0x6001000c)]
	DWRITE_FLOW_DIRECTION __stdcall GetFlowDirection();
	[id(0x6001000d)]
	float __stdcall GetIncrementalTabStop();
	[id(0x6001000e)]
	HRESULT __stdcall GetTrimming(
		[out]DWRITE_TRIMMING* trimmingOptions,
		[out]IDWriteInlineObject** trimmingSign);
	[id(0x6001000f)]
	HRESULT __stdcall GetLineSpacing(
		[out]DWRITE_LINE_SPACING_METHOD* lineSpacingMethod,
		[out]float* lineSpacing,
		[out]float* baseline);
	[id(0x60010010)]
	HRESULT __stdcall GetFontCollection(
		[out]IDWriteFontCollection** fontCollection);
	[id(0x60010011)]
	unsigned int __stdcall GetFontFamilyNameLength();
	[id(0x60010012)]
	HRESULT __stdcall GetFontFamilyName(
		[out]unsigned short* fontFamilyName,
		unsigned int nameSize);
	[id(0x60010013)]
	DWRITE_FONT_WEIGHT __stdcall GetFontWeight();
	[id(0x60010014)]
	DWRITE_FONT_STYLE __stdcall GetFontStyle();
	[id(0x60010015)]
	DWRITE_FONT_STRETCH __stdcall GetFontStretch();
	[id(0x60010016)]
	float __stdcall GetFontSize();
	[id(0x60010017)]
	unsigned int __stdcall GetLocaleNameLength();
	[id(0x60010018)]
	HRESULT __stdcall GetLocaleName(
		[out]unsigned short* localeName,
		unsigned int nameSize);
};

```'!
!IDWriteTextFormat categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextFormat methodsFor!

getFlowDirection
	"Answer the <SDWORD> result of invoking the GetFlowDirection() method of the COM object."

	^self GetFlowDirection
!

GetFlowDirection
	"Private - Invoke the GetFlowDirection() method of the COM object.

		DWRITE_FLOW_DIRECTION __stdcall GetFlowDirection();"

	<virtual stdcall: sdword 16>
	^self invalidCall!

getFontCollection
	"Answer the <IDWriteFontCollection> result of invoking the GetFontCollection() method of the COM object."

	| answer |
	answer := IDWriteFontCollection newPointer.
	self GetFontCollection: answer.
	^answer asObject
!

GetFontCollection: fontCollection
	"Private - Invoke the GetFontCollection() method of the COM object.

		HRESULT __stdcall GetFontCollection(
			[out]IDWriteFontCollection** fontCollection);"

	<virtual stdcall: hresult 20 IDWriteFontCollection**>
	^self invalidCall!

getFontFamilyName: nameSize
	"Answer the <WORD> result of invoking the GetFontFamilyName() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetFontFamilyName: answer
		nameSize: nameSize.
	^answer asObject
!

GetFontFamilyName: fontFamilyName nameSize: nameSize
	"Private - Invoke the GetFontFamilyName() method of the COM object.

		HRESULT __stdcall GetFontFamilyName(
			[out]unsigned short* fontFamilyName,
			unsigned int nameSize);"

	<virtual stdcall: hresult 22 word* dword>
	^self invalidCall!

getFontFamilyNameLength
	"Answer the <DWORD> result of invoking the GetFontFamilyNameLength() method of the COM object."

	^self GetFontFamilyNameLength
!

GetFontFamilyNameLength
	"Private - Invoke the GetFontFamilyNameLength() method of the COM object.

		unsigned int __stdcall GetFontFamilyNameLength();"

	<virtual stdcall: dword 21>
	^self invalidCall!

getFontSize
	"Answer the <FLOAT> result of invoking the GetFontSize() method of the COM object."

	^self GetFontSize
!

GetFontSize
	"Private - Invoke the GetFontSize() method of the COM object.

		float __stdcall GetFontSize();"

	<virtual stdcall: float 26>
	^self invalidCall!

getFontStretch
	"Answer the <SDWORD> result of invoking the GetFontStretch() method of the COM object."

	^self GetFontStretch
!

GetFontStretch
	"Private - Invoke the GetFontStretch() method of the COM object.

		DWRITE_FONT_STRETCH __stdcall GetFontStretch();"

	<virtual stdcall: sdword 25>
	^self invalidCall!

getFontStyle
	"Answer the <SDWORD> result of invoking the GetFontStyle() method of the COM object."

	^self GetFontStyle
!

GetFontStyle
	"Private - Invoke the GetFontStyle() method of the COM object.

		DWRITE_FONT_STYLE __stdcall GetFontStyle();"

	<virtual stdcall: sdword 24>
	^self invalidCall!

getFontWeight
	"Answer the <SDWORD> result of invoking the GetFontWeight() method of the COM object."

	^self GetFontWeight
!

GetFontWeight
	"Private - Invoke the GetFontWeight() method of the COM object.

		DWRITE_FONT_WEIGHT __stdcall GetFontWeight();"

	<virtual stdcall: sdword 23>
	^self invalidCall!

getIncrementalTabStop
	"Answer the <FLOAT> result of invoking the GetIncrementalTabStop() method of the COM object."

	^self GetIncrementalTabStop
!

GetIncrementalTabStop
	"Private - Invoke the GetIncrementalTabStop() method of the COM object.

		float __stdcall GetIncrementalTabStop();"

	<virtual stdcall: float 17>
	^self invalidCall!

getLineSpacing
	"Invoke the GetLineSpacing() method of the COM object."

	| answer |
	answer := (Array new: 3)
				basicAt: 1 put: (SDWORD new);
				basicAt: 2 put: (FLOAT new);
				basicAt: 3 put: (FLOAT new);
				yourself.
	self
		GetLineSpacing: (answer basicAt: 1)
		lineSpacing: (answer basicAt: 2)
		baseline: (answer basicAt: 3).
	^answer collect: [:each | each asObject]
!

GetLineSpacing: lineSpacingMethod lineSpacing: lineSpacing baseline: baseline
	"Private - Invoke the GetLineSpacing() method of the COM object.

		HRESULT __stdcall GetLineSpacing(
			[out]DWRITE_LINE_SPACING_METHOD* lineSpacingMethod,
			[out]float* lineSpacing,
			[out]float* baseline);"

	<virtual stdcall: hresult 19 sdword* float* float*>
	^self invalidCall!

getLocaleName: nameSize
	"Answer the <WORD> result of invoking the GetLocaleName() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetLocaleName: answer
		nameSize: nameSize.
	^answer asObject
!

GetLocaleName: localeName nameSize: nameSize
	"Private - Invoke the GetLocaleName() method of the COM object.

		HRESULT __stdcall GetLocaleName(
			[out]unsigned short* localeName,
			unsigned int nameSize);"

	<virtual stdcall: hresult 28 word* dword>
	^self invalidCall!

getLocaleNameLength
	"Answer the <DWORD> result of invoking the GetLocaleNameLength() method of the COM object."

	^self GetLocaleNameLength
!

GetLocaleNameLength
	"Private - Invoke the GetLocaleNameLength() method of the COM object.

		unsigned int __stdcall GetLocaleNameLength();"

	<virtual stdcall: dword 27>
	^self invalidCall!

getParagraphAlignment
	"Answer the <SDWORD> result of invoking the GetParagraphAlignment() method of the COM object."

	^self GetParagraphAlignment
!

GetParagraphAlignment
	"Private - Invoke the GetParagraphAlignment() method of the COM object.

		DWRITE_PARAGRAPH_ALIGNMENT __stdcall GetParagraphAlignment();"

	<virtual stdcall: sdword 13>
	^self invalidCall!

getReadingDirection
	"Answer the <SDWORD> result of invoking the GetReadingDirection() method of the COM object."

	^self GetReadingDirection
!

GetReadingDirection
	"Private - Invoke the GetReadingDirection() method of the COM object.

		DWRITE_READING_DIRECTION __stdcall GetReadingDirection();"

	<virtual stdcall: sdword 15>
	^self invalidCall!

getTextAlignment
	"Answer the <SDWORD> result of invoking the GetTextAlignment() method of the COM object."

	^self GetTextAlignment
!

GetTextAlignment
	"Private - Invoke the GetTextAlignment() method of the COM object.

		DWRITE_TEXT_ALIGNMENT __stdcall GetTextAlignment();"

	<virtual stdcall: sdword 12>
	^self invalidCall!

getTrimming
	"Invoke the GetTrimming() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWRITE_TRIMMING new);
				basicAt: 2 put: IDWriteInlineObject newPointer;
				yourself.
	self
		GetTrimming: (answer basicAt: 1)
		trimmingSign: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetTrimming: trimmingOptions trimmingSign: trimmingSign
	"Private - Invoke the GetTrimming() method of the COM object.

		HRESULT __stdcall GetTrimming(
			[out]DWRITE_TRIMMING* trimmingOptions,
			[out]IDWriteInlineObject** trimmingSign);"

	<virtual stdcall: hresult 18 DWRITE_TRIMMING* IDWriteInlineObject**>
	^self invalidCall!

getWordWrapping
	"Answer the <SDWORD> result of invoking the GetWordWrapping() method of the COM object."

	^self GetWordWrapping
!

GetWordWrapping
	"Private - Invoke the GetWordWrapping() method of the COM object.

		DWRITE_WORD_WRAPPING __stdcall GetWordWrapping();"

	<virtual stdcall: sdword 14>
	^self invalidCall!

setFlowDirection: flowDirection
	"Invoke the SetFlowDirection() method of the COM object."

	^self SetFlowDirection: flowDirection
!

SetFlowDirection: flowDirection
	"Private - Invoke the SetFlowDirection() method of the COM object.

		HRESULT __stdcall SetFlowDirection(
			DWRITE_FLOW_DIRECTION flowDirection);"

	<virtual stdcall: hresult 8 sdword>
	^self invalidCall!

setIncrementalTabStop: incrementalTabStop
	"Invoke the SetIncrementalTabStop() method of the COM object."

	^self SetIncrementalTabStop: incrementalTabStop
!

SetIncrementalTabStop: incrementalTabStop
	"Private - Invoke the SetIncrementalTabStop() method of the COM object.

		HRESULT __stdcall SetIncrementalTabStop(
			float incrementalTabStop);"

	<virtual stdcall: hresult 9 float>
	^self invalidCall!

setLineSpacing: lineSpacingMethod lineSpacing: lineSpacing baseline: baseline
	"Invoke the SetLineSpacing() method of the COM object."

	^self
		SetLineSpacing: lineSpacingMethod
		lineSpacing: lineSpacing
		baseline: baseline
!

SetLineSpacing: lineSpacingMethod lineSpacing: lineSpacing baseline: baseline
	"Private - Invoke the SetLineSpacing() method of the COM object.

		HRESULT __stdcall SetLineSpacing(
			DWRITE_LINE_SPACING_METHOD lineSpacingMethod,
			float lineSpacing,
			float baseline);"

	<virtual stdcall: hresult 11 sdword float float>
	^self invalidCall!

setParagraphAlignment: paragraphAlignment
	"Invoke the SetParagraphAlignment() method of the COM object."

	^self SetParagraphAlignment: paragraphAlignment
!

SetParagraphAlignment: paragraphAlignment
	"Private - Invoke the SetParagraphAlignment() method of the COM object.

		HRESULT __stdcall SetParagraphAlignment(
			DWRITE_PARAGRAPH_ALIGNMENT paragraphAlignment);"

	<virtual stdcall: hresult 5 sdword>
	^self invalidCall!

setReadingDirection: readingDirection
	"Invoke the SetReadingDirection() method of the COM object."

	^self SetReadingDirection: readingDirection
!

SetReadingDirection: readingDirection
	"Private - Invoke the SetReadingDirection() method of the COM object.

		HRESULT __stdcall SetReadingDirection(
			DWRITE_READING_DIRECTION readingDirection);"

	<virtual stdcall: hresult 7 sdword>
	^self invalidCall!

setTextAlignment: textAlignment
	"Invoke the SetTextAlignment() method of the COM object."

	^self SetTextAlignment: textAlignment
!

SetTextAlignment: textAlignment
	"Private - Invoke the SetTextAlignment() method of the COM object.

		HRESULT __stdcall SetTextAlignment(
			DWRITE_TEXT_ALIGNMENT textAlignment);"

	<virtual stdcall: hresult 4 sdword>
	^self invalidCall!

setTrimming: trimmingOptions trimmingSign: trimmingSign
	"Invoke the SetTrimming() method of the COM object."

	^self
		SetTrimming: trimmingOptions
		trimmingSign: trimmingSign
!

SetTrimming: trimmingOptions trimmingSign: trimmingSign
	"Private - Invoke the SetTrimming() method of the COM object.

		HRESULT __stdcall SetTrimming(
			[in]DWRITE_TRIMMING* trimmingOptions,
			[in]IDWriteInlineObject* trimmingSign);"

	<virtual stdcall: hresult 10 DWRITE_TRIMMING* IDWriteInlineObject*>
	^self invalidCall!

setWordWrapping: wordWrapping
	"Invoke the SetWordWrapping() method of the COM object."

	^self SetWordWrapping: wordWrapping
!

SetWordWrapping: wordWrapping
	"Private - Invoke the SetWordWrapping() method of the COM object.

		HRESULT __stdcall SetWordWrapping(
			DWRITE_WORD_WRAPPING wordWrapping);"

	<virtual stdcall: hresult 6 sdword>
	^self invalidCall! !
!IDWriteTextFormat categoriesFor: #getFlowDirection!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFlowDirection!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontCollection!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontCollection:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontFamilyName:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontFamilyName:nameSize:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontFamilyNameLength!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontFamilyNameLength!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontSize!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontSize!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontStretch!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontStretch!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontStyle!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontStyle!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getFontWeight!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetFontWeight!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getIncrementalTabStop!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetIncrementalTabStop!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getLineSpacing!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetLineSpacing:lineSpacing:baseline:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getLocaleName:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetLocaleName:nameSize:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getLocaleNameLength!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetLocaleNameLength!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getParagraphAlignment!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetParagraphAlignment!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getReadingDirection!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetReadingDirection!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getTextAlignment!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetTextAlignment!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getTrimming!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetTrimming:trimmingSign:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #getWordWrapping!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #GetWordWrapping!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setFlowDirection:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetFlowDirection:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setIncrementalTabStop:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetIncrementalTabStop:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setLineSpacing:lineSpacing:baseline:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetLineSpacing:lineSpacing:baseline:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setParagraphAlignment:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetParagraphAlignment:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setReadingDirection:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetReadingDirection:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setTextAlignment:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetTextAlignment:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setTrimming:trimmingSign:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetTrimming:trimmingSign:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !
!IDWriteTextFormat categoriesFor: #setWordWrapping:!**auto generated**!methods!public! !
!IDWriteTextFormat categoriesFor: #SetWordWrapping:!**auto generated**!COM Interfaces-IDWriteTextFormat!private! !

!IDWriteTextFormat class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextFormat'
		IDWriteTextFormat defineTemplate"

	self
		defineFunction: #SetTextAlignment:
			argumentTypes: 'sdword';
		defineFunction: #SetParagraphAlignment:
			argumentTypes: 'sdword';
		defineFunction: #SetWordWrapping:
			argumentTypes: 'sdword';
		defineFunction: #SetReadingDirection:
			argumentTypes: 'sdword';
		defineFunction: #SetFlowDirection:
			argumentTypes: 'sdword';
		defineFunction: #SetIncrementalTabStop:
			argumentTypes: 'float';
		defineFunction: #SetTrimming:trimmingSign:
			argumentTypes: 'DWRITE_TRIMMING* IDWriteInlineObject*';
		defineFunction: #SetLineSpacing:lineSpacing:baseline:
			argumentTypes: 'sdword float float';
		defineFunction: #GetTextAlignment
			returnType: 'sdword';
		defineFunction: #GetParagraphAlignment
			returnType: 'sdword';
		defineFunction: #GetWordWrapping
			returnType: 'sdword';
		defineFunction: #GetReadingDirection
			returnType: 'sdword';
		defineFunction: #GetFlowDirection
			returnType: 'sdword';
		defineFunction: #GetIncrementalTabStop
			returnType: 'float';
		defineFunction: #GetTrimming:trimmingSign:
			argumentTypes: 'DWRITE_TRIMMING* IDWriteInlineObject**';
		defineFunction: #GetLineSpacing:lineSpacing:baseline:
			argumentTypes: 'sdword* float* float*';
		defineFunction: #GetFontCollection:
			argumentTypes: 'IDWriteFontCollection**';
		defineFunction: #GetFontFamilyNameLength
			returnType: 'dword';
		defineFunction: #GetFontFamilyName:nameSize:
			argumentTypes: 'word* dword';
		defineFunction: #GetFontWeight
			returnType: 'sdword';
		defineFunction: #GetFontStyle
			returnType: 'sdword';
		defineFunction: #GetFontStretch
			returnType: 'sdword';
		defineFunction: #GetFontSize
			returnType: 'float';
		defineFunction: #GetLocaleNameLength
			returnType: 'dword';
		defineFunction: #GetLocaleName:nameSize:
			argumentTypes: 'word* dword'
!

newFontFamily: fontFamilyName collection: fontCollection weight: fontWeight style: fontStyle stretch: fontStretch size: fontSize localeName: localeName
	| instance |
	instance := self newPointer.
	DirectWriteLibrary factory
		CreateTextFormat: fontFamilyName
		fontCollection: fontCollection
		fontWeight: fontWeight
		fontStyle: fontStyle
		fontStretch: fontStretch
		fontSize: fontSize
		localeName: localeName
		textFormat: instance.
	^instance!

newFontFamily: fontFamilyName weight: fontWeight style: fontStyle stretch: fontStretch size: fontSize localeName: localeName
	^self
		newFontFamily: fontFamilyName
		collection: nil
		weight: fontWeight
		style: fontStyle
		stretch: fontStretch
		size: fontSize
		localeName: localeName! !
!IDWriteTextFormat class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !
!IDWriteTextFormat class categoriesFor: #newFontFamily:collection:weight:style:stretch:size:localeName:!instance creation!public! !
!IDWriteTextFormat class categoriesFor: #newFontFamily:weight:style:stretch:size:localeName:!instance creation!public! !

