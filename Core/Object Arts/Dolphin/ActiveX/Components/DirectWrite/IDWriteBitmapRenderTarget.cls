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

canvas
	"Answer a <Canvas> onto the receiver's bitmap."

	^Canvas withNonOwnedDC: self GetMemoryDC!

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

drawGlyphRunAt: aPointF measuringMode: measuringMode glyphRun: glyphRun renderingParams: renderingParams textColor: textColor
	"Answer the <RECT> result of invoking the DrawGlyphRun() method of the COM object."

	| answer |
	answer := RECT new.
	self
		DrawGlyphRun: aPointF x
		baselineOriginY: aPointF y
		measuringMode: measuringMode
		glyphRun: glyphRun
		renderingParams: renderingParams
		textColor: textColor
		blackBoxRect: answer.
	^answer asObject!

extent
	"Answer a <Point> representing the width and height of the receiver."

	| size |
	size := SIZE new.
	self GetSize: size.
	^size asObject!

GetCurrentTransform: transform
	"Private - Invoke the GetCurrentTransform() method of the COM object.

		HRESULT __stdcall GetCurrentTransform(
			[out]DWRITE_MATRIX* transform);"

	<virtual stdcall: hresult 8 DWRITE_MATRIX*>
	^self invalidCall!

GetMemoryDC
	"Private - Invoke the GetMemoryDC() method of the COM object.

		wireHDC __stdcall GetMemoryDC();"

	<virtual stdcall: handle 5>
	^self invalidCall!

GetPixelsPerDip
	"Private - Invoke the GetPixelsPerDip() method of the COM object.

		float __stdcall GetPixelsPerDip();"

	<virtual stdcall: float 6>
	^self invalidCall!

GetSize: size
	"Private - Invoke the GetSize() method of the COM object.

		HRESULT __stdcall GetSize(
			[out]SIZE* size);"

	<virtual stdcall: hresult 10 SIZE*>
	^self invalidCall!

pixelsPerDip
	"Answer a <Float> which is the number of bitmap pixels per device indepdent pixel in the receiver."

	^self GetPixelsPerDip
!

pixelsPerDip: pixelsPerDip
	"Invoke the SetPixelsPerDip() method of the COM object."

	^self SetPixelsPerDip: pixelsPerDip!

resize: aPoint
	"Resize the receiver to the specified extent."

	^self
		Resize: aPoint x
		height: aPoint y
!

Resize: width height: height
	"Private - Invoke the Resize() method of the COM object.

		HRESULT __stdcall Resize(
			unsigned int width,
			unsigned int height);"

	<virtual stdcall: hresult 11 dword dword>
	^self invalidCall!

SetCurrentTransform: transform
	"Private - Invoke the SetCurrentTransform() method of the COM object.

		HRESULT __stdcall SetCurrentTransform(
			[in]DWRITE_MATRIX* transform);"

	<virtual stdcall: hresult 9 DWRITE_MATRIX*>
	^self invalidCall!

SetPixelsPerDip: pixelsPerDip
	"Private - Invoke the SetPixelsPerDip() method of the COM object.

		HRESULT __stdcall SetPixelsPerDip(
			float pixelsPerDip);"

	<virtual stdcall: hresult 7 float>
	^self invalidCall!

transform
	"Answer a <DWRITE_MATRIX> representing the current transform applied to text drawing operations into the receiver."

	| answer |
	answer := DWRITE_MATRIX new.
	self GetCurrentTransform: answer.
	^answer!

transform: aDWRITE_MATRIX
	^self SetCurrentTransform: aDWRITE_MATRIX
! !
!IDWriteBitmapRenderTarget categoriesFor: #canvas!accessing!public! !
!IDWriteBitmapRenderTarget categoriesFor: #DrawGlyphRun:baselineOriginY:measuringMode:glyphRun:renderingParams:textColor:blackBoxRect:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #drawGlyphRunAt:measuringMode:glyphRun:renderingParams:textColor:!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #extent!accessing!public! !
!IDWriteBitmapRenderTarget categoriesFor: #GetCurrentTransform:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #GetMemoryDC!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #GetPixelsPerDip!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #GetSize:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #pixelsPerDip!accessing!public! !
!IDWriteBitmapRenderTarget categoriesFor: #pixelsPerDip:!accessing!public! !
!IDWriteBitmapRenderTarget categoriesFor: #resize:!methods!public! !
!IDWriteBitmapRenderTarget categoriesFor: #Resize:height:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #SetCurrentTransform:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #SetPixelsPerDip:!**auto generated**!COM Interfaces-IDWriteBitmapRenderTarget!private! !
!IDWriteBitmapRenderTarget categoriesFor: #transform!accessing!public! !
!IDWriteBitmapRenderTarget categoriesFor: #transform:!accessing!public! !

!IDWriteBitmapRenderTarget class methodsFor!

compatible: aCanvas width: width height: height
	"Answer a new instance of the receiver over a bitmpa with the specified dimensions and compatible with aCanvas."

	| instance |
	instance := self newPointer.
	DirectWriteLibrary gdiInterop
		CreateBitmapRenderTarget: aCanvas asParameter
		width: width
		height: height
		renderTarget: instance.
	^instance!

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
!IDWriteBitmapRenderTarget class categoriesFor: #compatible:width:height:!instance creation!public! !
!IDWriteBitmapRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

