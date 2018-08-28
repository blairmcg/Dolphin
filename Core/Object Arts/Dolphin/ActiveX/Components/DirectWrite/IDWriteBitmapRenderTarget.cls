"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteBitmapRenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteBitmapRenderTarget guid: (IID fromString: '{5E5A32A3-8DFF-4773-9FF6-0696EAB77267}')!
IDWriteBitmapRenderTarget comment: '`IDWriteBitmapRenderTarget` is a wrapper class for the COM interface ''DirectWrite.IDWriteBitmapRenderTarget'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Encapsulates a 32-bit device independent bitmap and device context, which can be used for rendering glyphs."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(5e5a32a3-8dff-4773-9ff6-0696eab77267), 
	helpstring("Encapsulates a 32-bit device independent bitmap and device context, which can be used for rendering glyphs.")
]
interface IDWriteBitmapRenderTarget : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall DrawGlyphRun(
		float baselineOriginX,
		float baselineOriginY,
		DWRITE_MEASURING_MODE measuringMode,
		[in]DWRITE_GLYPH_RUN* glyphRun,
		[in]IDWriteRenderingParams* renderingParams,
		unsigned long textColor,
		[out]RECT* blackBoxRect);
	[id(0x60010001)]
	wireHDC __stdcall GetMemoryDC();
	[id(0x60010002)]
	float __stdcall GetPixelsPerDip();
	[id(0x60010003)]
	HRESULT __stdcall SetPixelsPerDip(
		float pixelsPerDip);
	[id(0x60010004)]
	HRESULT __stdcall GetCurrentTransform(
		[out]DWRITE_MATRIX* transform);
	[id(0x60010005)]
	HRESULT __stdcall SetCurrentTransform(
		[in]DWRITE_MATRIX* transform);
	[id(0x60010006)]
	HRESULT __stdcall GetSize(
		[out]SIZE* size);
	[id(0x60010007)]
	HRESULT __stdcall Resize(
		unsigned int width,
		unsigned int height);
};

```'!
!IDWriteBitmapRenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteBitmapRenderTarget methodsFor!

drawGlyphRun: baselineOriginX baselineOriginY: baselineOriginY measuringMode: measuringMode glyphRun: glyphRun renderingParams: renderingParams textColor: textColor
	"Answer the <RECT> result of invoking the DrawGlyphRun() method of the COM object."

	| answer |
	answer := (RECT new).
	self
		DrawGlyphRun: baselineOriginX
		baselineOriginY: baselineOriginY
		measuringMode: measuringMode
		glyphRun: glyphRun
		renderingParams: renderingParams
		textColor: textColor
		blackBoxRect: answer.
	^answer asObject
!

DrawGlyphRun: baselineOriginX baselineOriginY: baselineOriginY measuringMode: measuringMode glyphRun: glyphRun renderingParams: renderingParams textColor: textColor blackBoxRect: blackBoxRect
	"Private - Invoke the DrawGlyphRun() method of the COM object.

		HRESULT __stdcall DrawGlyphRun(
			float baselineOriginX,
			float baselineOriginY,
			DWRITE_MEASURING_MODE measuringMode,
			[in]DWRITE_GLYPH_RUN* glyphRun,
			[in]IDWriteRenderingParams* renderingParams,
			unsigned long textColor,
			[out]RECT* blackBoxRect);"

	<virtual stdcall: hresult 4 float float sdword DWRITE_GLYPH_RUN* IDWriteRenderingParams* dword RECT*>
	^self invalidCall!

getCurrentTransform
	"Answer the <DWRITE_MATRIX> result of invoking the GetCurrentTransform() method of the COM object."

	| answer |
	answer := (DWRITE_MATRIX new).
	self GetCurrentTransform: answer.
	^answer asObject
!

GetCurrentTransform: transform
	"Private - Invoke the GetCurrentTransform() method of the COM object.

		HRESULT __stdcall GetCurrentTransform(
			[out]DWRITE_MATRIX* transform);"

	<virtual stdcall: hresult 8 DWRITE_MATRIX*>
	^self invalidCall!

getMemoryDC
	"Answer the <ExternalHandle> result of invoking the GetMemoryDC() method of the COM object."

	^self GetMemoryDC
!

GetMemoryDC
	"Private - Invoke the GetMemoryDC() method of the COM object.

		wireHDC __stdcall GetMemoryDC();"

	<virtual stdcall: handle 5>
	^self invalidCall!

getPixelsPerDip
	"Answer the <FLOAT> result of invoking the GetPixelsPerDip() method of the COM object."

	^self GetPixelsPerDip
!

GetPixelsPerDip
	"Private - Invoke the GetPixelsPerDip() method of the COM object.

		float __stdcall GetPixelsPerDip();"

	<virtual stdcall: float 6>
	^self invalidCall!

getSize
	"Answer the <SIZE> result of invoking the GetSize() method of the COM object."

	| answer |
	answer := (SIZE new).
	self GetSize: answer.
	^answer asObject
!

GetSize: size
	"Private - Invoke the GetSize() method of the COM object.

		HRESULT __stdcall GetSize(
			[out]SIZE* size);"

	<virtual stdcall: hresult 10 SIZE*>
	^self invalidCall!

resize: width height: height
	"Invoke the Resize() method of the COM object."

	^self
		Resize: width
		height: height
!

Resize: width height: height
	"Private - Invoke the Resize() method of the COM object.

		HRESULT __stdcall Resize(
			unsigned int width,
			unsigned int height);"

	<virtual stdcall: hresult 11 dword dword>
	^self invalidCall!

setCurrentTransform: transform
	"Invoke the SetCurrentTransform() method of the COM object."

	^self SetCurrentTransform: transform
!

SetCurrentTransform: transform
	"Private - Invoke the SetCurrentTransform() method of the COM object.

		HRESULT __stdcall SetCurrentTransform(
			[in]DWRITE_MATRIX* transform);"

	<virtual stdcall: hresult 9 DWRITE_MATRIX*>
	^self invalidCall!

setPixelsPerDip: pixelsPerDip
	"Invoke the SetPixelsPerDip() method of the COM object."

	^self SetPixelsPerDip: pixelsPerDip
!

SetPixelsPerDip: pixelsPerDip
	"Private - Invoke the SetPixelsPerDip() method of the COM object.

		HRESULT __stdcall SetPixelsPerDip(
			float pixelsPerDip);"

	<virtual stdcall: hresult 7 float>
	^self invalidCall! !
!IDWriteBitmapRenderTarget categoriesFor: #drawGlyphRun:baselineOriginY:measuringMode:glyphRun:renderingParams:textColor:!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #DrawGlyphRun:baselineOriginY:measuringMode:glyphRun:renderingParams:textColor:blackBoxRect:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #getCurrentTransform!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #GetCurrentTransform:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #getMemoryDC!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #GetMemoryDC!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #getPixelsPerDip!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #GetPixelsPerDip!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #getSize!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #GetSize:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #resize:height:!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #Resize:height:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #setCurrentTransform:!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #SetCurrentTransform:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #setPixelsPerDip:!**auto generated**!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #SetPixelsPerDip:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !

!IDWriteBitmapRenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteBitmapRenderTarget'
		IDWriteBitmapRenderTarget defineTemplate"

	self
		defineFunction: #DrawGlyphRun:baselineOriginY:measuringMode:glyphRun:renderingParams:textColor:blackBoxRect:
			argumentTypes: 'float float sdword DWRITE_GLYPH_RUN* IDWriteRenderingParams* dword RECT*';
		defineFunction: #GetMemoryDC
			returnType: 'handle';
		defineFunction: #GetPixelsPerDip
			returnType: 'float';
		defineFunction: #SetPixelsPerDip:
			argumentTypes: 'float';
		defineFunction: #GetCurrentTransform:
			argumentTypes: 'DWRITE_MATRIX*';
		defineFunction: #SetCurrentTransform:
			argumentTypes: 'DWRITE_MATRIX*';
		defineFunction: #GetSize:
			argumentTypes: 'SIZE*';
		defineFunction: #Resize:height:
			argumentTypes: 'dword dword'
! !
!IDWriteBitmapRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

