"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteTextAnalyzer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextAnalyzer guid: (IID fromString: '{B7E6163E-7F46-43B4-84B3-E4E6249C365D}')!
IDWriteTextAnalyzer comment: '`IDWriteTextAnalyzer` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextAnalyzer'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Analyzes various text properties for complex script processing."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(b7e6163e-7f46-43b4-84b3-e4e6249c365d), 
	helpstring("Analyzes various text properties for complex script processing.")
]
interface IDWriteTextAnalyzer : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall AnalyzeScript(
		[in]IDWriteTextAnalysisSource* analysisSource,
		unsigned int textPosition,
		unsigned int textLength,
		[in]IDWriteTextAnalysisSink* analysisSink);
	[id(0x60010001)]
	HRESULT __stdcall AnalyzeBidi(
		[in]IDWriteTextAnalysisSource* analysisSource,
		unsigned int textPosition,
		unsigned int textLength,
		[in]IDWriteTextAnalysisSink* analysisSink);
	[id(0x60010002)]
	HRESULT __stdcall AnalyzeNumberSubstitution(
		[in]IDWriteTextAnalysisSource* analysisSource,
		unsigned int textPosition,
		unsigned int textLength,
		[in]IDWriteTextAnalysisSink* analysisSink);
	[id(0x60010003)]
	HRESULT __stdcall AnalyzeLineBreakpoints(
		[in]IDWriteTextAnalysisSource* analysisSource,
		unsigned int textPosition,
		unsigned int textLength,
		[in]IDWriteTextAnalysisSink* analysisSink);
	[id(0x60010004)]
	HRESULT __stdcall GetGlyphs(
		[in]unsigned short* textString,
		unsigned int textLength,
		[in]IDWriteFontFace* fontFace,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
		[in]unsigned short* localeName,
		[in]IDWriteNumberSubstitution* numberSubstitution,
		[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
		[in]unsigned int* featureRangeLengths,
		unsigned int featureRanges,
		unsigned int maxGlyphCount,
		[out]unsigned short* clusterMap,
		[out]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
		[out]unsigned short* glyphIndices,
		[out]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
		[out]unsigned int* actualGlyphCount);
	[id(0x60010005)]
	HRESULT __stdcall GetGlyphPlacements(
		[in]unsigned short* textString,
		[in]unsigned short* clusterMap,
		[in]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
		unsigned int textLength,
		[in]unsigned short* glyphIndices,
		[in]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
		unsigned int glyphCount,
		[in]IDWriteFontFace* fontFace,
		float fontEmSize,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
		[in]unsigned short* localeName,
		[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
		[in]unsigned int* featureRangeLengths,
		unsigned int featureRanges,
		[out]float* glyphAdvances,
		[out]DWRITE_GLYPH_OFFSET* glyphOffsets);
	[id(0x60010006)]
	HRESULT __stdcall GetGdiCompatibleGlyphPlacements(
		[in]unsigned short* textString,
		[in]unsigned short* clusterMap,
		[in]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
		unsigned int textLength,
		[in]unsigned short* glyphIndices,
		[in]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
		unsigned int glyphCount,
		[in]IDWriteFontFace* fontFace,
		float fontEmSize,
		float pixelsPerDip,
		[in]DWRITE_MATRIX* transform,
		BOOL useGdiNatural,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
		[in]unsigned short* localeName,
		[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
		[in]unsigned int* featureRangeLengths,
		unsigned int featureRanges,
		[out]float* glyphAdvances,
		[out]DWRITE_GLYPH_OFFSET* glyphOffsets);
};

```'!
!IDWriteTextAnalyzer categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextAnalyzer methodsFor!

analyzeBidi: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Invoke the AnalyzeBidi() method of the COM object."

	^self
		AnalyzeBidi: analysisSource
		textPosition: textPosition
		textLength: textLength
		analysisSink: analysisSink
!

AnalyzeBidi: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Private - Invoke the AnalyzeBidi() method of the COM object.

		HRESULT __stdcall AnalyzeBidi(
			[in]IDWriteTextAnalysisSource* analysisSource,
			unsigned int textPosition,
			unsigned int textLength,
			[in]IDWriteTextAnalysisSink* analysisSink);"

	<virtual stdcall: hresult 5 IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*>
	^self invalidCall!

analyzeLineBreakpoints: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Invoke the AnalyzeLineBreakpoints() method of the COM object."

	^self
		AnalyzeLineBreakpoints: analysisSource
		textPosition: textPosition
		textLength: textLength
		analysisSink: analysisSink
!

AnalyzeLineBreakpoints: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Private - Invoke the AnalyzeLineBreakpoints() method of the COM object.

		HRESULT __stdcall AnalyzeLineBreakpoints(
			[in]IDWriteTextAnalysisSource* analysisSource,
			unsigned int textPosition,
			unsigned int textLength,
			[in]IDWriteTextAnalysisSink* analysisSink);"

	<virtual stdcall: hresult 7 IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*>
	^self invalidCall!

analyzeNumberSubstitution: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Invoke the AnalyzeNumberSubstitution() method of the COM object."

	^self
		AnalyzeNumberSubstitution: analysisSource
		textPosition: textPosition
		textLength: textLength
		analysisSink: analysisSink
!

AnalyzeNumberSubstitution: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Private - Invoke the AnalyzeNumberSubstitution() method of the COM object.

		HRESULT __stdcall AnalyzeNumberSubstitution(
			[in]IDWriteTextAnalysisSource* analysisSource,
			unsigned int textPosition,
			unsigned int textLength,
			[in]IDWriteTextAnalysisSink* analysisSink);"

	<virtual stdcall: hresult 6 IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*>
	^self invalidCall!

analyzeScript: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Invoke the AnalyzeScript() method of the COM object."

	^self
		AnalyzeScript: analysisSource
		textPosition: textPosition
		textLength: textLength
		analysisSink: analysisSink
!

AnalyzeScript: analysisSource textPosition: textPosition textLength: textLength analysisSink: analysisSink
	"Private - Invoke the AnalyzeScript() method of the COM object.

		HRESULT __stdcall AnalyzeScript(
			[in]IDWriteTextAnalysisSource* analysisSource,
			unsigned int textPosition,
			unsigned int textLength,
			[in]IDWriteTextAnalysisSink* analysisSink);"

	<virtual stdcall: hresult 4 IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*>
	^self invalidCall!

getGdiCompatibleGlyphPlacements: textString clusterMap: clusterMap textProps: textProps textLength: textLength glyphIndices: glyphIndices glyphProps: glyphProps glyphCount: glyphCount fontFace: fontFace fontEmSize: fontEmSize pixelsPerDip: pixelsPerDip transform: transform useGdiNatural: useGdiNatural isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges
	"Invoke the GetGdiCompatibleGlyphPlacements() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (DWRITE_GLYPH_OFFSET new);
				yourself.
	self
		GetGdiCompatibleGlyphPlacements: textString
		clusterMap: clusterMap
		textProps: textProps
		textLength: textLength
		glyphIndices: glyphIndices
		glyphProps: glyphProps
		glyphCount: glyphCount
		fontFace: fontFace
		fontEmSize: fontEmSize
		pixelsPerDip: pixelsPerDip
		transform: transform
		useGdiNatural: useGdiNatural
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		scriptAnalysis: scriptAnalysis
		localeName: localeName
		features: features
		featureRangeLengths: featureRangeLengths
		featureRanges: featureRanges
		glyphAdvances: (answer basicAt: 1)
		glyphOffsets: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetGdiCompatibleGlyphPlacements: textString clusterMap: clusterMap textProps: textProps textLength: textLength glyphIndices: glyphIndices glyphProps: glyphProps glyphCount: glyphCount fontFace: fontFace fontEmSize: fontEmSize pixelsPerDip: pixelsPerDip transform: transform useGdiNatural: useGdiNatural isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges glyphAdvances: glyphAdvances glyphOffsets: glyphOffsets
	"Private - Invoke the GetGdiCompatibleGlyphPlacements() method of the COM object.

		HRESULT __stdcall GetGdiCompatibleGlyphPlacements(
			[in]unsigned short* textString,
			[in]unsigned short* clusterMap,
			[in]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
			unsigned int textLength,
			[in]unsigned short* glyphIndices,
			[in]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
			unsigned int glyphCount,
			[in]IDWriteFontFace* fontFace,
			float fontEmSize,
			float pixelsPerDip,
			[in]DWRITE_MATRIX* transform,
			BOOL useGdiNatural,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
			[in]unsigned short* localeName,
			[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
			[in]unsigned int* featureRangeLengths,
			unsigned int featureRanges,
			[out]float* glyphAdvances,
			[out]DWRITE_GLYPH_OFFSET* glyphOffsets);"

	<virtual stdcall: hresult 10 word* word* DWRITE_SHAPING_TEXT_PROPERTIES* dword word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword IDWriteFontFace* float float DWRITE_MATRIX* bool bool bool DWRITE_SCRIPT_ANALYSIS* word* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword float* DWRITE_GLYPH_OFFSET*>
	^self invalidCall!

getGlyphPlacements: textString clusterMap: clusterMap textProps: textProps textLength: textLength glyphIndices: glyphIndices glyphProps: glyphProps glyphCount: glyphCount fontFace: fontFace fontEmSize: fontEmSize isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges
	"Invoke the GetGlyphPlacements() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (DWRITE_GLYPH_OFFSET new);
				yourself.
	self
		GetGlyphPlacements: textString
		clusterMap: clusterMap
		textProps: textProps
		textLength: textLength
		glyphIndices: glyphIndices
		glyphProps: glyphProps
		glyphCount: glyphCount
		fontFace: fontFace
		fontEmSize: fontEmSize
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		scriptAnalysis: scriptAnalysis
		localeName: localeName
		features: features
		featureRangeLengths: featureRangeLengths
		featureRanges: featureRanges
		glyphAdvances: (answer basicAt: 1)
		glyphOffsets: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetGlyphPlacements: textString clusterMap: clusterMap textProps: textProps textLength: textLength glyphIndices: glyphIndices glyphProps: glyphProps glyphCount: glyphCount fontFace: fontFace fontEmSize: fontEmSize isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges glyphAdvances: glyphAdvances glyphOffsets: glyphOffsets
	"Private - Invoke the GetGlyphPlacements() method of the COM object.

		HRESULT __stdcall GetGlyphPlacements(
			[in]unsigned short* textString,
			[in]unsigned short* clusterMap,
			[in]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
			unsigned int textLength,
			[in]unsigned short* glyphIndices,
			[in]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
			unsigned int glyphCount,
			[in]IDWriteFontFace* fontFace,
			float fontEmSize,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
			[in]unsigned short* localeName,
			[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
			[in]unsigned int* featureRangeLengths,
			unsigned int featureRanges,
			[out]float* glyphAdvances,
			[out]DWRITE_GLYPH_OFFSET* glyphOffsets);"

	<virtual stdcall: hresult 9 word* word* DWRITE_SHAPING_TEXT_PROPERTIES* dword word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword IDWriteFontFace* float bool bool DWRITE_SCRIPT_ANALYSIS* word* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword float* DWRITE_GLYPH_OFFSET*>
	^self invalidCall!

getGlyphs: textString textLength: textLength fontFace: fontFace isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName numberSubstitution: numberSubstitution features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges maxGlyphCount: maxGlyphCount
	"Invoke the GetGlyphs() method of the COM object."

	| answer |
	answer := (Array new: 5)
				basicAt: 1 put: (WORD new);
				basicAt: 2 put: (DWRITE_SHAPING_TEXT_PROPERTIES new);
				basicAt: 3 put: (WORD new);
				basicAt: 4 put: (DWRITE_SHAPING_GLYPH_PROPERTIES new);
				basicAt: 5 put: (DWORD new);
				yourself.
	self
		GetGlyphs: textString
		textLength: textLength
		fontFace: fontFace
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		scriptAnalysis: scriptAnalysis
		localeName: localeName
		numberSubstitution: numberSubstitution
		features: features
		featureRangeLengths: featureRangeLengths
		featureRanges: featureRanges
		maxGlyphCount: maxGlyphCount
		clusterMap: (answer basicAt: 1)
		textProps: (answer basicAt: 2)
		glyphIndices: (answer basicAt: 3)
		glyphProps: (answer basicAt: 4)
		actualGlyphCount: (answer basicAt: 5).
	^answer collect: [:each | each asObject]
!

GetGlyphs: textString textLength: textLength fontFace: fontFace isSideways: isSideways isRightToLeft: isRightToLeft scriptAnalysis: scriptAnalysis localeName: localeName numberSubstitution: numberSubstitution features: features featureRangeLengths: featureRangeLengths featureRanges: featureRanges maxGlyphCount: maxGlyphCount clusterMap: clusterMap textProps: textProps glyphIndices: glyphIndices glyphProps: glyphProps actualGlyphCount: actualGlyphCount
	"Private - Invoke the GetGlyphs() method of the COM object.

		HRESULT __stdcall GetGlyphs(
			[in]unsigned short* textString,
			unsigned int textLength,
			[in]IDWriteFontFace* fontFace,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]DWRITE_SCRIPT_ANALYSIS* scriptAnalysis,
			[in]unsigned short* localeName,
			[in]IDWriteNumberSubstitution* numberSubstitution,
			[in]DWRITE_TYPOGRAPHIC_FEATURES** features,
			[in]unsigned int* featureRangeLengths,
			unsigned int featureRanges,
			unsigned int maxGlyphCount,
			[out]unsigned short* clusterMap,
			[out]DWRITE_SHAPING_TEXT_PROPERTIES* textProps,
			[out]unsigned short* glyphIndices,
			[out]DWRITE_SHAPING_GLYPH_PROPERTIES* glyphProps,
			[out]unsigned int* actualGlyphCount);"

	<virtual stdcall: hresult 8 word* dword IDWriteFontFace* bool bool DWRITE_SCRIPT_ANALYSIS* word* IDWriteNumberSubstitution* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword dword word* DWRITE_SHAPING_TEXT_PROPERTIES* word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword*>
	^self invalidCall! !
!IDWriteTextAnalyzer categoriesFor: #analyzeBidi:textPosition:textLength:analysisSink:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #AnalyzeBidi:textPosition:textLength:analysisSink:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #analyzeLineBreakpoints:textPosition:textLength:analysisSink:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #AnalyzeLineBreakpoints:textPosition:textLength:analysisSink:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #analyzeNumberSubstitution:textPosition:textLength:analysisSink:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #AnalyzeNumberSubstitution:textPosition:textLength:analysisSink:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #analyzeScript:textPosition:textLength:analysisSink:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #AnalyzeScript:textPosition:textLength:analysisSink:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #getGdiCompatibleGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:pixelsPerDip:transform:useGdiNatural:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #GetGdiCompatibleGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:pixelsPerDip:transform:useGdiNatural:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:glyphAdvances:glyphOffsets:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #getGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #GetGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:glyphAdvances:glyphOffsets:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !
!IDWriteTextAnalyzer categoriesFor: #getGlyphs:textLength:fontFace:isSideways:isRightToLeft:scriptAnalysis:localeName:numberSubstitution:features:featureRangeLengths:featureRanges:maxGlyphCount:!**auto generated**!methods!public! !
!IDWriteTextAnalyzer categoriesFor: #GetGlyphs:textLength:fontFace:isSideways:isRightToLeft:scriptAnalysis:localeName:numberSubstitution:features:featureRangeLengths:featureRanges:maxGlyphCount:clusterMap:textProps:glyphIndices:glyphProps:actualGlyphCount:!**auto generated**!COM Interfaces-IDWriteTextAnalyzer!private! !

!IDWriteTextAnalyzer class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextAnalyzer'
		IDWriteTextAnalyzer defineTemplate"

	self
		defineFunction: #AnalyzeScript:textPosition:textLength:analysisSink:
			argumentTypes: 'IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*';
		defineFunction: #AnalyzeBidi:textPosition:textLength:analysisSink:
			argumentTypes: 'IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*';
		defineFunction: #AnalyzeNumberSubstitution:textPosition:textLength:analysisSink:
			argumentTypes: 'IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*';
		defineFunction: #AnalyzeLineBreakpoints:textPosition:textLength:analysisSink:
			argumentTypes: 'IDWriteTextAnalysisSource* dword dword IDWriteTextAnalysisSink*';
		defineFunction: #GetGlyphs:textLength:fontFace:isSideways:isRightToLeft:scriptAnalysis:localeName:numberSubstitution:features:featureRangeLengths:featureRanges:maxGlyphCount:clusterMap:textProps:glyphIndices:glyphProps:actualGlyphCount:
			argumentTypes: 'word* dword IDWriteFontFace* bool bool DWRITE_SCRIPT_ANALYSIS* word* IDWriteNumberSubstitution* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword dword word* DWRITE_SHAPING_TEXT_PROPERTIES* word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword*';
		defineFunction: #GetGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:glyphAdvances:glyphOffsets:
			argumentTypes: 'word* word* DWRITE_SHAPING_TEXT_PROPERTIES* dword word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword IDWriteFontFace* float bool bool DWRITE_SCRIPT_ANALYSIS* word* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword float* DWRITE_GLYPH_OFFSET*';
		defineFunction: #GetGdiCompatibleGlyphPlacements:clusterMap:textProps:textLength:glyphIndices:glyphProps:glyphCount:fontFace:fontEmSize:pixelsPerDip:transform:useGdiNatural:isSideways:isRightToLeft:scriptAnalysis:localeName:features:featureRangeLengths:featureRanges:glyphAdvances:glyphOffsets:
			argumentTypes: 'word* word* DWRITE_SHAPING_TEXT_PROPERTIES* dword word* DWRITE_SHAPING_GLYPH_PROPERTIES* dword IDWriteFontFace* float float DWRITE_MATRIX* bool bool bool DWRITE_SCRIPT_ANALYSIS* word* DWRITE_TYPOGRAPHIC_FEATURES** dword* dword float* DWRITE_GLYPH_OFFSET*'
!

new
	| instance |
	instance := self newPointer.
	DirectWriteLibrary factory CreateTextAnalyzer: instance.
	^instance! !
!IDWriteTextAnalyzer class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !
!IDWriteTextAnalyzer class categoriesFor: #new!instance creation!public! !

