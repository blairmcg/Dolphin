"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFactory
	instanceVariableNames: 'gdiInterop systemFontCollection'
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFactory guid: (IID fromString: '{B859EE5A-D838-4B5B-A2E8-1ADC7D93DB48}')!
IDWriteFactory comment: '`IDWriteFactory` is a wrapper class for the COM interface ''DirectWrite.IDWriteFactory'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The root factory interface for all DWrite objects."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(b859ee5a-d838-4b5b-a2e8-1adc7d93db48), 
	helpstring("The root factory interface for all DWrite objects.")
]
interface IDWriteFactory : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetSystemFontCollection(
		[out]IDWriteFontCollection** fontCollection,
		BOOL checkForUpdates);
	[id(0x60010001)]
	HRESULT __stdcall CreateCustomFontCollection(
		[in]IDWriteFontCollectionLoader* collectionLoader,
		[in]void* collectionKey,
		unsigned int collectionKeySize,
		[out]IDWriteFontCollection** fontCollection);
	[id(0x60010002)]
	HRESULT __stdcall RegisterFontCollectionLoader(
		[in]IDWriteFontCollectionLoader* fontCollectionLoader);
	[id(0x60010003)]
	HRESULT __stdcall UnregisterFontCollectionLoader(
		[in]IDWriteFontCollectionLoader* fontCollectionLoader);
	[id(0x60010004)]
	HRESULT __stdcall CreateFontFileReference(
		[in]unsigned short* filePath,
		[in]FILETIME* lastWriteTime,
		[out]IDWriteFontFile** fontFile);
	[id(0x60010005)]
	HRESULT __stdcall CreateCustomFontFileReference(
		[in]void* fontFileReferenceKey,
		unsigned int fontFileReferenceKeySize,
		[in]IDWriteFontFileLoader* fontFileLoader,
		[out]IDWriteFontFile** fontFile);
	[id(0x60010006)]
	HRESULT __stdcall CreateFontFace(
		DWRITE_FONT_FACE_TYPE fontFaceType,
		unsigned int numberOfFiles,
		[in]IDWriteFontFile** fontFiles,
		unsigned int faceIndex,
		DWRITE_FONT_SIMULATIONS fontFaceSimulationFlags,
		[out]IDWriteFontFace** fontFace);
	[id(0x60010007)]
	HRESULT __stdcall CreateRenderingParams(
		[out]IDWriteRenderingParams** renderingParams);
	[id(0x60010008)]
	HRESULT __stdcall CreateMonitorRenderingParams(
		wireHMONITOR monitor,
		[out]IDWriteRenderingParams** renderingParams);
	[id(0x60010009)]
	HRESULT __stdcall CreateCustomRenderingParams(
		float gamma,
		float enhancedContrast,
		float clearTypeLevel,
		DWRITE_PIXEL_GEOMETRY pixelGeometry,
		DWRITE_RENDERING_MODE renderingMode,
		[out]IDWriteRenderingParams** renderingParams);
	[id(0x6001000a)]
	HRESULT __stdcall RegisterFontFileLoader(
		[in]IDWriteFontFileLoader* fontFileLoader);
	[id(0x6001000b)]
	HRESULT __stdcall UnregisterFontFileLoader(
		[in]IDWriteFontFileLoader* fontFileLoader);
	[id(0x6001000c)]
	HRESULT __stdcall CreateTextFormat(
		[in]unsigned short* fontFamilyName,
		[in]IDWriteFontCollection* fontCollection,
		DWRITE_FONT_WEIGHT fontWeight,
		DWRITE_FONT_STYLE fontStyle,
		DWRITE_FONT_STRETCH fontStretch,
		float fontSize,
		[in]unsigned short* localeName,
		[out]IDWriteTextFormat** textFormat);
	[id(0x6001000d)]
	HRESULT __stdcall CreateTypography(
		[out]IDWriteTypography** typography);
	[id(0x6001000e)]
	HRESULT __stdcall GetGdiInterop(
		[out]IDWriteGdiInterop** gdiInterop);
	[id(0x6001000f)]
	HRESULT __stdcall CreateTextLayout(
		[in]unsigned short* string,
		unsigned int stringLength,
		[in]IDWriteTextFormat* textFormat,
		float maxWidth,
		float maxHeight,
		[out]IDWriteTextLayout** textLayout);
	[id(0x60010010)]
	HRESULT __stdcall CreateGdiCompatibleTextLayout(
		[in]unsigned short* string,
		unsigned int stringLength,
		[in]IDWriteTextFormat* textFormat,
		float layoutWidth,
		float layoutHeight,
		float pixelsPerDip,
		[in]DWRITE_MATRIX* transform,
		BOOL useGdiNatural,
		[out]IDWriteTextLayout** textLayout);
	[id(0x60010011)]
	HRESULT __stdcall CreateEllipsisTrimmingSign(
		[in]IDWriteTextFormat* textFormat,
		[out]IDWriteInlineObject** trimmingSign);
	[id(0x60010012)]
	HRESULT __stdcall CreateTextAnalyzer(
		[out]IDWriteTextAnalyzer** textAnalyzer);
	[id(0x60010013)]
	HRESULT __stdcall CreateNumberSubstitution(
		[in]DWRITE_NUMBER_SUBSTITUTION_METHOD substitutionMethod,
		[in]unsigned short* localeName,
		[in]BOOL ignoreUserOverride,
		[out]IDWriteNumberSubstitution** numberSubstitution);
	[id(0x60010014)]
	HRESULT __stdcall CreateGlyphRunAnalysis(
		[in]DWRITE_GLYPH_RUN* glyphRun,
		float pixelsPerDip,
		[in]DWRITE_MATRIX* transform,
		DWRITE_RENDERING_MODE renderingMode,
		DWRITE_MEASURING_MODE measuringMode,
		float baselineOriginX,
		float baselineOriginY,
		[out]IDWriteGlyphRunAnalysis** glyphRunAnalysis);
};

```'!
!IDWriteFactory categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFactory methodsFor!

createCustomFontCollection: collectionLoader collectionKey: collectionKey collectionKeySize: collectionKeySize
	"Answer the <IDWriteFontCollection> result of invoking the CreateCustomFontCollection() method of the COM object."

	| answer |
	answer := IDWriteFontCollection newPointer.
	self
		CreateCustomFontCollection: collectionLoader
		collectionKey: collectionKey
		collectionKeySize: collectionKeySize
		fontCollection: answer.
	^answer asObject
!

CreateCustomFontCollection: collectionLoader collectionKey: collectionKey collectionKeySize: collectionKeySize fontCollection: fontCollection
	"Private - Invoke the CreateCustomFontCollection() method of the COM object.

		HRESULT __stdcall CreateCustomFontCollection(
			[in]IDWriteFontCollectionLoader* collectionLoader,
			[in]void* collectionKey,
			unsigned int collectionKeySize,
			[out]IDWriteFontCollection** fontCollection);"

	<virtual stdcall: hresult 5 IDWriteFontCollectionLoader* void* dword IDWriteFontCollection**>
	^self invalidCall!

createCustomFontFileReference: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize fontFileLoader: fontFileLoader
	"Answer the <IDWriteFontFile> result of invoking the CreateCustomFontFileReference() method of the COM object."

	| answer |
	answer := IDWriteFontFile newPointer.
	self
		CreateCustomFontFileReference: fontFileReferenceKey
		fontFileReferenceKeySize: fontFileReferenceKeySize
		fontFileLoader: fontFileLoader
		fontFile: answer.
	^answer asObject
!

CreateCustomFontFileReference: fontFileReferenceKey fontFileReferenceKeySize: fontFileReferenceKeySize fontFileLoader: fontFileLoader fontFile: fontFile
	"Private - Invoke the CreateCustomFontFileReference() method of the COM object.

		HRESULT __stdcall CreateCustomFontFileReference(
			[in]void* fontFileReferenceKey,
			unsigned int fontFileReferenceKeySize,
			[in]IDWriteFontFileLoader* fontFileLoader,
			[out]IDWriteFontFile** fontFile);"

	<virtual stdcall: hresult 9 void* dword IDWriteFontFileLoader* IDWriteFontFile**>
	^self invalidCall!

createCustomRenderingParams: gamma enhancedContrast: enhancedContrast clearTypeLevel: clearTypeLevel pixelGeometry: pixelGeometry renderingMode: renderingMode
	"Answer the <IDWriteRenderingParams> result of invoking the CreateCustomRenderingParams() method of the COM object."

	| answer |
	answer := IDWriteRenderingParams newPointer.
	self
		CreateCustomRenderingParams: gamma
		enhancedContrast: enhancedContrast
		clearTypeLevel: clearTypeLevel
		pixelGeometry: pixelGeometry
		renderingMode: renderingMode
		renderingParams: answer.
	^answer asObject
!

CreateCustomRenderingParams: gamma enhancedContrast: enhancedContrast clearTypeLevel: clearTypeLevel pixelGeometry: pixelGeometry renderingMode: renderingMode renderingParams: renderingParams
	"Private - Invoke the CreateCustomRenderingParams() method of the COM object.

		HRESULT __stdcall CreateCustomRenderingParams(
			float gamma,
			float enhancedContrast,
			float clearTypeLevel,
			DWRITE_PIXEL_GEOMETRY pixelGeometry,
			DWRITE_RENDERING_MODE renderingMode,
			[out]IDWriteRenderingParams** renderingParams);"

	<virtual stdcall: hresult 13 float float float sdword sdword IDWriteRenderingParams**>
	^self invalidCall!

createEllipsisTrimmingSign: textFormat
	"Answer the <IDWriteInlineObject> result of invoking the CreateEllipsisTrimmingSign() method of the COM object."

	| answer |
	answer := IDWriteInlineObject newPointer.
	self
		CreateEllipsisTrimmingSign: textFormat
		trimmingSign: answer.
	^answer asObject
!

CreateEllipsisTrimmingSign: textFormat trimmingSign: trimmingSign
	"Private - Invoke the CreateEllipsisTrimmingSign() method of the COM object.

		HRESULT __stdcall CreateEllipsisTrimmingSign(
			[in]IDWriteTextFormat* textFormat,
			[out]IDWriteInlineObject** trimmingSign);"

	<virtual stdcall: hresult 21 IDWriteTextFormat* IDWriteInlineObject**>
	^self invalidCall!

createFontFace: fontFaceType numberOfFiles: numberOfFiles fontFiles: fontFiles faceIndex: faceIndex fontFaceSimulationFlags: fontFaceSimulationFlags
	"Answer the <IDWriteFontFace> result of invoking the CreateFontFace() method of the COM object."

	| answer |
	answer := IDWriteFontFace newPointer.
	self
		CreateFontFace: fontFaceType
		numberOfFiles: numberOfFiles
		fontFiles: fontFiles
		faceIndex: faceIndex
		fontFaceSimulationFlags: fontFaceSimulationFlags
		fontFace: answer.
	^answer asObject
!

CreateFontFace: fontFaceType numberOfFiles: numberOfFiles fontFiles: fontFiles faceIndex: faceIndex fontFaceSimulationFlags: fontFaceSimulationFlags fontFace: fontFace
	"Private - Invoke the CreateFontFace() method of the COM object.

		HRESULT __stdcall CreateFontFace(
			DWRITE_FONT_FACE_TYPE fontFaceType,
			unsigned int numberOfFiles,
			[in]IDWriteFontFile** fontFiles,
			unsigned int faceIndex,
			DWRITE_FONT_SIMULATIONS fontFaceSimulationFlags,
			[out]IDWriteFontFace** fontFace);"

	<virtual stdcall: hresult 10 sdword dword IDWriteFontFile** dword sdword IDWriteFontFace**>
	^self invalidCall!

createFontFileReference: filePath lastWriteTime: lastWriteTime
	"Answer the <IDWriteFontFile> result of invoking the CreateFontFileReference() method of the COM object."

	| answer |
	answer := IDWriteFontFile newPointer.
	self
		CreateFontFileReference: filePath
		lastWriteTime: lastWriteTime
		fontFile: answer.
	^answer asObject
!

CreateFontFileReference: filePath lastWriteTime: lastWriteTime fontFile: fontFile
	"Private - Invoke the CreateFontFileReference() method of the COM object.

		HRESULT __stdcall CreateFontFileReference(
			[in]unsigned short* filePath,
			[in]FILETIME* lastWriteTime,
			[out]IDWriteFontFile** fontFile);"

	<virtual stdcall: hresult 8 word* FILETIME* IDWriteFontFile**>
	^self invalidCall!

CreateGdiCompatibleTextLayout: string stringLength: stringLength textFormat: textFormat layoutWidth: layoutWidth layoutHeight: layoutHeight pixelsPerDip: pixelsPerDip transform: transform useGdiNatural: useGdiNatural textLayout: textLayout
	"Private - Invoke the CreateGdiCompatibleTextLayout() method of the COM object.

		HRESULT __stdcall CreateGdiCompatibleTextLayout(
			[in]unsigned short* string,
			unsigned int stringLength,
			[in]IDWriteTextFormat* textFormat,
			float layoutWidth,
			float layoutHeight,
			float pixelsPerDip,
			[in]DWRITE_MATRIX* transform,
			BOOL useGdiNatural,
			[out]IDWriteTextLayout** textLayout);"

	<virtual stdcall: hresult 20 word* dword IDWriteTextFormat* float float float DWRITE_MATRIX* bool IDWriteTextLayout**>
	^self invalidCall!

createGlyphRunAnalysis: glyphRun pixelsPerDip: pixelsPerDip transform: transform renderingMode: renderingMode measuringMode: measuringMode baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY
	"Answer the <IDWriteGlyphRunAnalysis> result of invoking the CreateGlyphRunAnalysis() method of the COM object."

	| answer |
	answer := IDWriteGlyphRunAnalysis newPointer.
	self
		CreateGlyphRunAnalysis: glyphRun
		pixelsPerDip: pixelsPerDip
		transform: transform
		renderingMode: renderingMode
		measuringMode: measuringMode
		baselineOriginX: baselineOriginX
		baselineOriginY: baselineOriginY
		glyphRunAnalysis: answer.
	^answer asObject
!

CreateGlyphRunAnalysis: glyphRun pixelsPerDip: pixelsPerDip transform: transform renderingMode: renderingMode measuringMode: measuringMode baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY glyphRunAnalysis: glyphRunAnalysis
	"Private - Invoke the CreateGlyphRunAnalysis() method of the COM object.

		HRESULT __stdcall CreateGlyphRunAnalysis(
			[in]DWRITE_GLYPH_RUN* glyphRun,
			float pixelsPerDip,
			[in]DWRITE_MATRIX* transform,
			DWRITE_RENDERING_MODE renderingMode,
			DWRITE_MEASURING_MODE measuringMode,
			float baselineOriginX,
			float baselineOriginY,
			[out]IDWriteGlyphRunAnalysis** glyphRunAnalysis);"

	<virtual stdcall: hresult 24 DWRITE_GLYPH_RUN* float DWRITE_MATRIX* sdword sdword float float IDWriteGlyphRunAnalysis**>
	^self invalidCall!

createMonitorRenderingParams: monitor
	"Answer the <IDWriteRenderingParams> result of invoking the CreateMonitorRenderingParams() method of the COM object."

	| answer |
	answer := IDWriteRenderingParams newPointer.
	self
		CreateMonitorRenderingParams: monitor asExternalHandle
		renderingParams: answer.
	^answer asObject
!

CreateMonitorRenderingParams: monitor renderingParams: renderingParams
	"Private - Invoke the CreateMonitorRenderingParams() method of the COM object.

		HRESULT __stdcall CreateMonitorRenderingParams(
			wireHMONITOR monitor,
			[out]IDWriteRenderingParams** renderingParams);"

	<virtual stdcall: hresult 12 handle* IDWriteRenderingParams**>
	^self invalidCall!

CreateNumberSubstitution: substitutionMethod localeName: localeName ignoreUserOverride: ignoreUserOverride numberSubstitution: numberSubstitution
	"Private - Invoke the CreateNumberSubstitution() method of the COM object.

		HRESULT __stdcall CreateNumberSubstitution(
			[in]DWRITE_NUMBER_SUBSTITUTION_METHOD substitutionMethod,
			[in]unsigned short* localeName,
			[in]BOOL ignoreUserOverride,
			[out]IDWriteNumberSubstitution** numberSubstitution);"

	<virtual stdcall: hresult 23 sdword word* bool IDWriteNumberSubstitution**>
	^self invalidCall!

CreateRenderingParams: renderingParams
	"Private - Invoke the CreateRenderingParams() method of the COM object.

		HRESULT __stdcall CreateRenderingParams(
			[out]IDWriteRenderingParams** renderingParams);"

	<virtual stdcall: hresult 11 IDWriteRenderingParams**>
	^self invalidCall!

CreateTextAnalyzer: textAnalyzer
	"Private - Invoke the CreateTextAnalyzer() method of the COM object.

		HRESULT __stdcall CreateTextAnalyzer(
			[out]IDWriteTextAnalyzer** textAnalyzer);"

	<virtual stdcall: hresult 22 IDWriteTextAnalyzer**>
	^self invalidCall!

CreateTextFormat: fontFamilyName fontCollection: fontCollection fontWeight: fontWeight fontStyle: fontStyle fontStretch: fontStretch fontSize: fontSize localeName: localeName textFormat: textFormat
	"Private - Invoke the CreateTextFormat() method of the COM object.

		HRESULT __stdcall CreateTextFormat(
			[in]unsigned short* fontFamilyName,
			[in]IDWriteFontCollection* fontCollection,
			DWRITE_FONT_WEIGHT fontWeight,
			DWRITE_FONT_STYLE fontStyle,
			DWRITE_FONT_STRETCH fontStretch,
			float fontSize,
			[in]unsigned short* localeName,
			[out]IDWriteTextFormat** textFormat);"

	<virtual stdcall: hresult 16 word* IDWriteFontCollection* sdword sdword sdword float word* IDWriteTextFormat**>
	^self invalidCall!

CreateTextLayout: string stringLength: stringLength textFormat: textFormat maxWidth: maxWidth maxHeight: maxHeight textLayout: textLayout
	"Private - Invoke the CreateTextLayout() method of the COM object.

		HRESULT __stdcall CreateTextLayout(
			[in]unsigned short* string,
			unsigned int stringLength,
			[in]IDWriteTextFormat* textFormat,
			float maxWidth,
			float maxHeight,
			[out]IDWriteTextLayout** textLayout);"

	<virtual stdcall: hresult 19 word* dword IDWriteTextFormat* float float IDWriteTextLayout**>
	^self invalidCall!

CreateTypography: typography
	"Private - Invoke the CreateTypography() method of the COM object.

		HRESULT __stdcall CreateTypography(
			[out]IDWriteTypography** typography);"

	<virtual stdcall: hresult 17 IDWriteTypography**>
	^self invalidCall!

gdiInterop
	gdiInterop isNull
		ifTrue: 
			[gdiInterop := IDWriteGdiInterop newPointer.
			self GetGdiInterop: gdiInterop].
	^gdiInterop!

GetGdiInterop: gdiInterop
	"Private - Invoke the GetGdiInterop() method of the COM object.

		HRESULT __stdcall GetGdiInterop(
			[out]IDWriteGdiInterop** gdiInterop);"

	<virtual stdcall: hresult 18 IDWriteGdiInterop**>
	^self invalidCall!

GetSystemFontCollection: fontCollection checkForUpdates: checkForUpdates
	"Private - Invoke the GetSystemFontCollection() method of the COM object.

		HRESULT __stdcall GetSystemFontCollection(
			[out]IDWriteFontCollection** fontCollection,
			BOOL checkForUpdates);"

	<virtual stdcall: hresult 4 IDWriteFontCollection** bool>
	^self invalidCall!

RegisterFontCollectionLoader: fontCollectionLoader
	"Private - Invoke the RegisterFontCollectionLoader() method of the COM object.

		HRESULT __stdcall RegisterFontCollectionLoader(
			[in]IDWriteFontCollectionLoader* fontCollectionLoader);"

	<virtual stdcall: hresult 6 IDWriteFontCollectionLoader*>
	^self invalidCall!

RegisterFontFileLoader: fontFileLoader
	"Private - Invoke the RegisterFontFileLoader() method of the COM object.

		HRESULT __stdcall RegisterFontFileLoader(
			[in]IDWriteFontFileLoader* fontFileLoader);"

	<virtual stdcall: hresult 14 IDWriteFontFileLoader*>
	^self invalidCall!

systemFontCollection
	systemFontCollection isNull
		ifTrue: 
			[systemFontCollection := IDWriteFontCollection newPointer.
			self GetSystemFontCollection: systemFontCollection checkForUpdates: true].
	^systemFontCollection!

UnregisterFontCollectionLoader: fontCollectionLoader
	"Private - Invoke the UnregisterFontCollectionLoader() method of the COM object.

		HRESULT __stdcall UnregisterFontCollectionLoader(
			[in]IDWriteFontCollectionLoader* fontCollectionLoader);"

	<virtual stdcall: hresult 7 IDWriteFontCollectionLoader*>
	^self invalidCall!

UnregisterFontFileLoader: fontFileLoader
	"Private - Invoke the UnregisterFontFileLoader() method of the COM object.

		HRESULT __stdcall UnregisterFontFileLoader(
			[in]IDWriteFontFileLoader* fontFileLoader);"

	<virtual stdcall: hresult 15 IDWriteFontFileLoader*>
	^self invalidCall! !
!IDWriteFactory categoriesFor: #createCustomFontCollection:collectionKey:collectionKeySize:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateCustomFontCollection:collectionKey:collectionKeySize:fontCollection:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createCustomFontFileReference:fontFileReferenceKeySize:fontFileLoader:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateCustomFontFileReference:fontFileReferenceKeySize:fontFileLoader:fontFile:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createCustomRenderingParams:enhancedContrast:clearTypeLevel:pixelGeometry:renderingMode:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateCustomRenderingParams:enhancedContrast:clearTypeLevel:pixelGeometry:renderingMode:renderingParams:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createEllipsisTrimmingSign:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateEllipsisTrimmingSign:trimmingSign:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createFontFace:numberOfFiles:fontFiles:faceIndex:fontFaceSimulationFlags:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateFontFace:numberOfFiles:fontFiles:faceIndex:fontFaceSimulationFlags:fontFace:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createFontFileReference:lastWriteTime:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateFontFileReference:lastWriteTime:fontFile:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateGdiCompatibleTextLayout:stringLength:textFormat:layoutWidth:layoutHeight:pixelsPerDip:transform:useGdiNatural:textLayout:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createGlyphRunAnalysis:pixelsPerDip:transform:renderingMode:measuringMode:baselineOriginX:baselineOriginY:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateGlyphRunAnalysis:pixelsPerDip:transform:renderingMode:measuringMode:baselineOriginX:baselineOriginY:glyphRunAnalysis:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #createMonitorRenderingParams:!**auto generated**!methods!public! !
!IDWriteFactory categoriesFor: #CreateMonitorRenderingParams:renderingParams:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateNumberSubstitution:localeName:ignoreUserOverride:numberSubstitution:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateRenderingParams:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateTextAnalyzer:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateTextFormat:fontCollection:fontWeight:fontStyle:fontStretch:fontSize:localeName:textFormat:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateTextLayout:stringLength:textFormat:maxWidth:maxHeight:textLayout:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #CreateTypography:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #gdiInterop!accessing!public! !
!IDWriteFactory categoriesFor: #GetGdiInterop:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #GetSystemFontCollection:checkForUpdates:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #RegisterFontCollectionLoader:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #RegisterFontFileLoader:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #systemFontCollection!accessing!public! !
!IDWriteFactory categoriesFor: #UnregisterFontCollectionLoader:!**auto generated**!COM Interfaces-IDWriteFactory!private! !
!IDWriteFactory categoriesFor: #UnregisterFontFileLoader:!**auto generated**!COM Interfaces-IDWriteFactory!private! !

!IDWriteFactory class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFactory'
		IDWriteFactory defineTemplate"

	self
		defineFunction: #GetSystemFontCollection:checkForUpdates:
			argumentTypes: 'IDWriteFontCollection** bool';
		defineFunction: #CreateCustomFontCollection:collectionKey:collectionKeySize:fontCollection:
			argumentTypes: 'IDWriteFontCollectionLoader* void* dword IDWriteFontCollection**';
		defineFunction: #RegisterFontCollectionLoader:
			argumentTypes: 'IDWriteFontCollectionLoader*';
		defineFunction: #UnregisterFontCollectionLoader:
			argumentTypes: 'IDWriteFontCollectionLoader*';
		defineFunction: #CreateFontFileReference:lastWriteTime:fontFile:
			argumentTypes: 'word* FILETIME* IDWriteFontFile**';
		defineFunction: #CreateCustomFontFileReference:fontFileReferenceKeySize:fontFileLoader:fontFile:
			argumentTypes: 'void* dword IDWriteFontFileLoader* IDWriteFontFile**';
		defineFunction: #CreateFontFace:numberOfFiles:fontFiles:faceIndex:fontFaceSimulationFlags:fontFace:
			argumentTypes: 'sdword dword IDWriteFontFile** dword sdword IDWriteFontFace**';
		defineFunction: #CreateRenderingParams:
			argumentTypes: 'IDWriteRenderingParams**';
		defineFunction: #CreateMonitorRenderingParams:renderingParams:
			argumentTypes: 'handle* IDWriteRenderingParams**';
		defineFunction: #CreateCustomRenderingParams:enhancedContrast:clearTypeLevel:pixelGeometry:renderingMode:renderingParams:
			argumentTypes: 'float float float sdword sdword IDWriteRenderingParams**';
		defineFunction: #RegisterFontFileLoader:
			argumentTypes: 'IDWriteFontFileLoader*';
		defineFunction: #UnregisterFontFileLoader:
			argumentTypes: 'IDWriteFontFileLoader*';
		defineFunction: #CreateTextFormat:fontCollection:fontWeight:fontStyle:fontStretch:fontSize:localeName:textFormat:
			argumentTypes: 'word* IDWriteFontCollection* sdword sdword sdword float word* IDWriteTextFormat**';
		defineFunction: #CreateTypography:
			argumentTypes: 'IDWriteTypography**';
		defineFunction: #GetGdiInterop:
			argumentTypes: 'IDWriteGdiInterop**';
		defineFunction: #CreateTextLayout:stringLength:textFormat:maxWidth:maxHeight:textLayout:
			argumentTypes: 'word* dword IDWriteTextFormat* float float IDWriteTextLayout**';
		defineFunction: #CreateGdiCompatibleTextLayout:stringLength:textFormat:layoutWidth:layoutHeight:pixelsPerDip:transform:useGdiNatural:textLayout:
			argumentTypes: 'word* dword IDWriteTextFormat* float float float DWRITE_MATRIX* bool IDWriteTextLayout**';
		defineFunction: #CreateEllipsisTrimmingSign:trimmingSign:
			argumentTypes: 'IDWriteTextFormat* IDWriteInlineObject**';
		defineFunction: #CreateTextAnalyzer:
			argumentTypes: 'IDWriteTextAnalyzer**';
		defineFunction: #CreateNumberSubstitution:localeName:ignoreUserOverride:numberSubstitution:
			argumentTypes: 'sdword word* bool IDWriteNumberSubstitution**';
		defineFunction: #CreateGlyphRunAnalysis:pixelsPerDip:transform:renderingMode:measuringMode:baselineOriginX:baselineOriginY:glyphRunAnalysis:
			argumentTypes: 'DWRITE_GLYPH_RUN* float DWRITE_MATRIX* sdword sdword float float IDWriteGlyphRunAnalysis**'
! !
!IDWriteFactory class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

