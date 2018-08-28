"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontFace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFace guid: (IID fromString: '{5F49804D-7024-4D43-BFA9-D25984F53849}')!
IDWriteFontFace comment: '`IDWriteFontFace` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFace'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"This interface exposes various font data such as metrics, names, and glyph outlines. It contains font face type, appropriate file references and face identification data."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(5f49804d-7024-4d43-bfa9-d25984f53849), 
	helpstring("This interface exposes various font data such as metrics, names, and glyph outlines. It contains font face type, appropriate file references and face identification data.")
]
interface IDWriteFontFace : IUnknown
 {
	[id(0x60010000)]
	DWRITE_FONT_FACE_TYPE __stdcall GetType();
	[id(0x60010001)]
	HRESULT __stdcall GetFiles(
		[in, out]unsigned int* numberOfFiles,
		[out]IDWriteFontFile** fontFiles);
	[id(0x60010002)]
	unsigned int __stdcall GetIndex();
	[id(0x60010003)]
	DWRITE_FONT_SIMULATIONS __stdcall GetSimulations();
	[id(0x60010004)]
	BOOL __stdcall IsSymbolFont();
	[id(0x60010005)]
	void __stdcall GetMetrics(
		[out]DWRITE_FONT_METRICS* fontFaceMetrics);
	[id(0x60010006)]
	unsigned short __stdcall GetGlyphCount();
	[id(0x60010007)]
	HRESULT __stdcall GetDesignGlyphMetrics(
		[in]unsigned short* glyphIndices,
		unsigned int glyphCount,
		[out]DWRITE_GLYPH_METRICS* glyphMetrics,
		BOOL isSideways);
	[id(0x60010008)]
	HRESULT __stdcall GetGlyphIndices(
		[in]unsigned int* codePoints,
		unsigned int codePointCount,
		[out]unsigned short* glyphIndices);
	[id(0x60010009)]
	HRESULT __stdcall TryGetFontTable(
		[in]unsigned int openTypeTableTag,
		[out]void** tableData,
		[out]unsigned int* tableSize,
		[out]void** tableContext,
		[out]BOOL* exists);
	[id(0x6001000a)]
	void __stdcall ReleaseFontTable(
		[in]void* tableContext);
	[id(0x6001000b)]
	HRESULT __stdcall GetGlyphRunOutline(
		float emSize,
		[in]unsigned short* glyphIndices,
		[in]float* glyphAdvances,
		[in]DWRITE_GLYPH_OFFSET* glyphOffsets,
		unsigned int glyphCount,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]IUnknown* geometrySink);
	[id(0x6001000c)]
	HRESULT __stdcall GetRecommendedRenderingMode(
		float emSize,
		float pixelsPerDip,
		DWRITE_MEASURING_MODE measuringMode,
		IDWriteRenderingParams* renderingParams,
		[out]DWRITE_RENDERING_MODE* renderingMode);
	[id(0x6001000d)]
	HRESULT __stdcall GetGdiCompatibleMetrics(
		float emSize,
		float pixelsPerDip,
		[in]DWRITE_MATRIX* transform,
		[out]DWRITE_FONT_METRICS* fontFaceMetrics);
	[id(0x6001000e)]
	HRESULT __stdcall GetGdiCompatibleGlyphMetrics(
		float emSize,
		float pixelsPerDip,
		[in]DWRITE_MATRIX* transform,
		BOOL useGdiNatural,
		[in]unsigned short* glyphIndices,
		unsigned int glyphCount,
		[out]DWRITE_GLYPH_METRICS* glyphMetrics,
		BOOL isSideways);
};

```'!
!IDWriteFontFace categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFace methodsFor!

GetDesignGlyphMetrics: glyphIndices glyphCount: glyphCount glyphMetrics: glyphMetrics isSideways: isSideways
	"Private - Invoke the GetDesignGlyphMetrics() method of the COM object.

		HRESULT __stdcall GetDesignGlyphMetrics(
			[in]unsigned short* glyphIndices,
			unsigned int glyphCount,
			[out]DWRITE_GLYPH_METRICS* glyphMetrics,
			BOOL isSideways);"

	<virtual stdcall: hresult 11 word* dword DWRITE_GLYPH_METRICS* bool>
	^self invalidCall!

getDesignGlyphMetrics: glyphIndices glyphCount: glyphCount isSideways: isSideways
	"Answer the <DWRITE_GLYPH_METRICS> result of invoking the GetDesignGlyphMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_GLYPH_METRICS new).
	self
		GetDesignGlyphMetrics: glyphIndices
		glyphCount: glyphCount
		glyphMetrics: answer
		isSideways: isSideways.
	^answer asObject
!

getFiles: numberOfFiles
	"Invoke the GetFiles() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new value: numberOfFiles; yourself);
				basicAt: 2 put: IDWriteFontFile newPointer;
				yourself.
	self
		GetFiles: (answer basicAt: 1)
		fontFiles: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFiles: numberOfFiles fontFiles: fontFiles
	"Private - Invoke the GetFiles() method of the COM object.

		HRESULT __stdcall GetFiles(
			[in, out]unsigned int* numberOfFiles,
			[out]IDWriteFontFile** fontFiles);"

	<virtual stdcall: hresult 5 dword* IDWriteFontFile**>
	^self invalidCall!

GetGdiCompatibleGlyphMetrics: emSize pixelsPerDip: pixelsPerDip transform: transform useGdiNatural: useGdiNatural glyphIndices: glyphIndices glyphCount: glyphCount glyphMetrics: glyphMetrics isSideways: isSideways
	"Private - Invoke the GetGdiCompatibleGlyphMetrics() method of the COM object.

		HRESULT __stdcall GetGdiCompatibleGlyphMetrics(
			float emSize,
			float pixelsPerDip,
			[in]DWRITE_MATRIX* transform,
			BOOL useGdiNatural,
			[in]unsigned short* glyphIndices,
			unsigned int glyphCount,
			[out]DWRITE_GLYPH_METRICS* glyphMetrics,
			BOOL isSideways);"

	<virtual stdcall: hresult 18 float float DWRITE_MATRIX* bool word* dword DWRITE_GLYPH_METRICS* bool>
	^self invalidCall!

getGdiCompatibleGlyphMetrics: emSize pixelsPerDip: pixelsPerDip transform: transform useGdiNatural: useGdiNatural glyphIndices: glyphIndices glyphCount: glyphCount isSideways: isSideways
	"Answer the <DWRITE_GLYPH_METRICS> result of invoking the GetGdiCompatibleGlyphMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_GLYPH_METRICS new).
	self
		GetGdiCompatibleGlyphMetrics: emSize
		pixelsPerDip: pixelsPerDip
		transform: transform
		useGdiNatural: useGdiNatural
		glyphIndices: glyphIndices
		glyphCount: glyphCount
		glyphMetrics: answer
		isSideways: isSideways.
	^answer asObject
!

getGdiCompatibleMetrics: emSize pixelsPerDip: pixelsPerDip transform: transform
	"Answer the <DWRITE_FONT_METRICS> result of invoking the GetGdiCompatibleMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_FONT_METRICS new).
	self
		GetGdiCompatibleMetrics: emSize
		pixelsPerDip: pixelsPerDip
		transform: transform
		fontFaceMetrics: answer.
	^answer asObject
!

GetGdiCompatibleMetrics: emSize pixelsPerDip: pixelsPerDip transform: transform fontFaceMetrics: fontFaceMetrics
	"Private - Invoke the GetGdiCompatibleMetrics() method of the COM object.

		HRESULT __stdcall GetGdiCompatibleMetrics(
			float emSize,
			float pixelsPerDip,
			[in]DWRITE_MATRIX* transform,
			[out]DWRITE_FONT_METRICS* fontFaceMetrics);"

	<virtual stdcall: hresult 17 float float DWRITE_MATRIX* DWRITE_FONT_METRICS*>
	^self invalidCall!

getGlyphCount
	"Answer the <WORD> result of invoking the GetGlyphCount() method of the COM object."

	^self GetGlyphCount
!

GetGlyphCount
	"Private - Invoke the GetGlyphCount() method of the COM object.

		unsigned short __stdcall GetGlyphCount();"

	<virtual stdcall: word 10>
	^self invalidCall!

getGlyphIndices: codePoints codePointCount: codePointCount
	"Answer the <WORD> result of invoking the GetGlyphIndices() method of the COM object."

	| answer |
	answer := (WORD new).
	self
		GetGlyphIndices: codePoints
		codePointCount: codePointCount
		glyphIndices: answer.
	^answer asObject
!

GetGlyphIndices: codePoints codePointCount: codePointCount glyphIndices: glyphIndices
	"Private - Invoke the GetGlyphIndices() method of the COM object.

		HRESULT __stdcall GetGlyphIndices(
			[in]unsigned int* codePoints,
			unsigned int codePointCount,
			[out]unsigned short* glyphIndices);"

	<virtual stdcall: hresult 12 dword* dword word*>
	^self invalidCall!

getGlyphRunOutline: emSize glyphIndices: glyphIndices glyphAdvances: glyphAdvances glyphOffsets: glyphOffsets glyphCount: glyphCount isSideways: isSideways isRightToLeft: isRightToLeft geometrySink: geometrySink
	"Invoke the GetGlyphRunOutline() method of the COM object."

	^self
		GetGlyphRunOutline: emSize
		glyphIndices: glyphIndices
		glyphAdvances: glyphAdvances
		glyphOffsets: glyphOffsets
		glyphCount: glyphCount
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		geometrySink: geometrySink
!

GetGlyphRunOutline: emSize glyphIndices: glyphIndices glyphAdvances: glyphAdvances glyphOffsets: glyphOffsets glyphCount: glyphCount isSideways: isSideways isRightToLeft: isRightToLeft geometrySink: geometrySink
	"Private - Invoke the GetGlyphRunOutline() method of the COM object.

		HRESULT __stdcall GetGlyphRunOutline(
			float emSize,
			[in]unsigned short* glyphIndices,
			[in]float* glyphAdvances,
			[in]DWRITE_GLYPH_OFFSET* glyphOffsets,
			unsigned int glyphCount,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]IUnknown* geometrySink);"

	<virtual stdcall: hresult 15 float word* float* DWRITE_GLYPH_OFFSET* dword bool bool IUnknown*>
	^self invalidCall!

getIndex
	"Answer the <DWORD> result of invoking the GetIndex() method of the COM object."

	^self GetIndex
!

GetIndex
	"Private - Invoke the GetIndex() method of the COM object.

		unsigned int __stdcall GetIndex();"

	<virtual stdcall: dword 6>
	^self invalidCall!

getMetrics
	"Answer the <DWRITE_FONT_METRICS> result of invoking the GetMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_FONT_METRICS new).
	self GetMetrics: answer.
	^answer asObject
!

GetMetrics: fontFaceMetrics
	"Private - Invoke the GetMetrics() method of the COM object.

		void __stdcall GetMetrics(
			[out]DWRITE_FONT_METRICS* fontFaceMetrics);"

	<virtual stdcall: void 9 DWRITE_FONT_METRICS*>
	^self invalidCall!

getRecommendedRenderingMode: emSize pixelsPerDip: pixelsPerDip measuringMode: measuringMode renderingParams: renderingParams
	"Answer the <SDWORD> result of invoking the GetRecommendedRenderingMode() method of the COM object."

	| answer |
	answer := (SDWORD new).
	self
		GetRecommendedRenderingMode: emSize
		pixelsPerDip: pixelsPerDip
		measuringMode: measuringMode
		renderingParams: renderingParams
		renderingMode: answer.
	^answer asObject
!

GetRecommendedRenderingMode: emSize pixelsPerDip: pixelsPerDip measuringMode: measuringMode renderingParams: renderingParams renderingMode: renderingMode
	"Private - Invoke the GetRecommendedRenderingMode() method of the COM object.

		HRESULT __stdcall GetRecommendedRenderingMode(
			float emSize,
			float pixelsPerDip,
			DWRITE_MEASURING_MODE measuringMode,
			IDWriteRenderingParams* renderingParams,
			[out]DWRITE_RENDERING_MODE* renderingMode);"

	<virtual stdcall: hresult 16 float float sdword IDWriteRenderingParams* sdword*>
	^self invalidCall!

getSimulations
	"Answer the <SDWORD> result of invoking the GetSimulations() method of the COM object."

	^self GetSimulations
!

GetSimulations
	"Private - Invoke the GetSimulations() method of the COM object.

		DWRITE_FONT_SIMULATIONS __stdcall GetSimulations();"

	<virtual stdcall: sdword 7>
	^self invalidCall!

getType
	"Answer the <SDWORD> result of invoking the GetType() method of the COM object."

	^self GetType
!

GetType
	"Private - Invoke the GetType() method of the COM object.

		DWRITE_FONT_FACE_TYPE __stdcall GetType();"

	<virtual stdcall: sdword 4>
	^self invalidCall!

isSymbolFont
	"Answer the <BOOL> result of invoking the IsSymbolFont() method of the COM object."

	^self IsSymbolFont
!

IsSymbolFont
	"Private - Invoke the IsSymbolFont() method of the COM object.

		BOOL __stdcall IsSymbolFont();"

	<virtual stdcall: bool 8>
	^self invalidCall!

releaseFontTable: tableContext
	"Answer the <VOID> result of invoking the ReleaseFontTable() method of the COM object."

	self ReleaseFontTable: tableContext
!

ReleaseFontTable: tableContext
	"Private - Invoke the ReleaseFontTable() method of the COM object.

		void __stdcall ReleaseFontTable(
			[in]void* tableContext);"

	<virtual stdcall: void 14 void*>
	^self invalidCall!

tryGetFontTable: openTypeTableTag
	"Invoke the TryGetFontTable() method of the COM object."

	| answer |
	answer := (Array new: 4)
				basicAt: 1 put: (VOID newBufferClass: COMTaskMemory);
				basicAt: 2 put: (DWORD new);
				basicAt: 3 put: (VOID newBufferClass: COMTaskMemory);
				basicAt: 4 put: (BOOL new);
				yourself.
	self
		TryGetFontTable: openTypeTableTag
		tableData: (answer basicAt: 1)
		tableSize: (answer basicAt: 2)
		tableContext: (answer basicAt: 3)
		exists: (answer basicAt: 4).
	^answer collect: [:each | each asObject]
!

TryGetFontTable: openTypeTableTag tableData: tableData tableSize: tableSize tableContext: tableContext exists: exists
	"Private - Invoke the TryGetFontTable() method of the COM object.

		HRESULT __stdcall TryGetFontTable(
			[in]unsigned int openTypeTableTag,
			[out]void** tableData,
			[out]unsigned int* tableSize,
			[out]void** tableContext,
			[out]BOOL* exists);"

	<virtual stdcall: hresult 13 dword void** dword* void** bool*>
	^self invalidCall! !
!IDWriteFontFace categoriesFor: #GetDesignGlyphMetrics:glyphCount:glyphMetrics:isSideways:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getDesignGlyphMetrics:glyphCount:isSideways:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #getFiles:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetFiles:fontFiles:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #GetGdiCompatibleGlyphMetrics:pixelsPerDip:transform:useGdiNatural:glyphIndices:glyphCount:glyphMetrics:isSideways:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getGdiCompatibleGlyphMetrics:pixelsPerDip:transform:useGdiNatural:glyphIndices:glyphCount:isSideways:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #getGdiCompatibleMetrics:pixelsPerDip:transform:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetGdiCompatibleMetrics:pixelsPerDip:transform:fontFaceMetrics:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getGlyphCount!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetGlyphCount!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getGlyphIndices:codePointCount:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetGlyphIndices:codePointCount:glyphIndices:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getGlyphRunOutline:glyphIndices:glyphAdvances:glyphOffsets:glyphCount:isSideways:isRightToLeft:geometrySink:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetGlyphRunOutline:glyphIndices:glyphAdvances:glyphOffsets:glyphCount:isSideways:isRightToLeft:geometrySink:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getIndex!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetIndex!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getMetrics!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetMetrics:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getRecommendedRenderingMode:pixelsPerDip:measuringMode:renderingParams:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetRecommendedRenderingMode:pixelsPerDip:measuringMode:renderingParams:renderingMode:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getSimulations!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetSimulations!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #getType!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #GetType!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #isSymbolFont!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #IsSymbolFont!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #releaseFontTable:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #ReleaseFontTable:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !
!IDWriteFontFace categoriesFor: #tryGetFontTable:!**auto generated**!methods!public! !
!IDWriteFontFace categoriesFor: #TryGetFontTable:tableData:tableSize:tableContext:exists:!**auto generated**!COM Interfaces-IDWriteFontFace!private! !

!IDWriteFontFace class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFace'
		IDWriteFontFace defineTemplate"

	self
		defineFunction: #GetType
			returnType: 'sdword';
		defineFunction: #GetFiles:fontFiles:
			argumentTypes: 'dword* IDWriteFontFile**';
		defineFunction: #GetIndex
			returnType: 'dword';
		defineFunction: #GetSimulations
			returnType: 'sdword';
		defineFunction: #IsSymbolFont
			returnType: 'bool';
		defineFunction: #GetMetrics:
			returnType: 'void'
			argumentTypes: 'DWRITE_FONT_METRICS*';
		defineFunction: #GetGlyphCount
			returnType: 'word';
		defineFunction: #GetDesignGlyphMetrics:glyphCount:glyphMetrics:isSideways:
			argumentTypes: 'word* dword DWRITE_GLYPH_METRICS* bool';
		defineFunction: #GetGlyphIndices:codePointCount:glyphIndices:
			argumentTypes: 'dword* dword word*';
		defineFunction: #TryGetFontTable:tableData:tableSize:tableContext:exists:
			argumentTypes: 'dword void** dword* void** bool*';
		defineFunction: #ReleaseFontTable:
			returnType: 'void'
			argumentTypes: 'void*';
		defineFunction: #GetGlyphRunOutline:glyphIndices:glyphAdvances:glyphOffsets:glyphCount:isSideways:isRightToLeft:geometrySink:
			argumentTypes: 'float word* float* DWRITE_GLYPH_OFFSET* dword bool bool IUnknown*';
		defineFunction: #GetRecommendedRenderingMode:pixelsPerDip:measuringMode:renderingParams:renderingMode:
			argumentTypes: 'float float sdword IDWriteRenderingParams* sdword*';
		defineFunction: #GetGdiCompatibleMetrics:pixelsPerDip:transform:fontFaceMetrics:
			argumentTypes: 'float float DWRITE_MATRIX* DWRITE_FONT_METRICS*';
		defineFunction: #GetGdiCompatibleGlyphMetrics:pixelsPerDip:transform:useGdiNatural:glyphIndices:glyphCount:glyphMetrics:isSideways:
			argumentTypes: 'float float DWRITE_MATRIX* bool word* dword DWRITE_GLYPH_METRICS* bool'
! !
!IDWriteFontFace class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

