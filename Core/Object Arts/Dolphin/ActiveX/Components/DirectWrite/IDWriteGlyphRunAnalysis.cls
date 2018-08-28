"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteGlyphRunAnalysis
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteGlyphRunAnalysis guid: (IID fromString: '{7D97DBF7-E085-42D4-81E3-6A883BDED118}')!
IDWriteGlyphRunAnalysis comment: '`IDWriteGlyphRunAnalysis` is a wrapper class for the COM interface ''DirectWrite.IDWriteGlyphRunAnalysis'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Interface that encapsulates information used to render a glyph run."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(7d97dbf7-e085-42d4-81e3-6a883bded118), 
	helpstring("Interface that encapsulates information used to render a glyph run.")
]
interface IDWriteGlyphRunAnalysis : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetAlphaTextureBounds(
		DWRITE_TEXTURE_TYPE textureType,
		[out]RECT* textureBounds);
	[id(0x60010001)]
	HRESULT __stdcall CreateAlphaTexture(
		DWRITE_TEXTURE_TYPE textureType,
		[in]RECT* textureBounds,
		[out]BYTE* alphaValues,
		unsigned int bufferSize);
	[id(0x60010002)]
	HRESULT __stdcall GetAlphaBlendParams(
		[in]IDWriteRenderingParams* renderingParams,
		[out]float* blendGamma,
		[out]float* blendEnhancedContrast,
		[out]float* blendClearTypeLevel);
};

```'!
!IDWriteGlyphRunAnalysis categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteGlyphRunAnalysis methodsFor!

CreateAlphaTexture: textureType textureBounds: textureBounds alphaValues: alphaValues bufferSize: bufferSize
	"Private - Invoke the CreateAlphaTexture() method of the COM object.

		HRESULT __stdcall CreateAlphaTexture(
			DWRITE_TEXTURE_TYPE textureType,
			[in]RECT* textureBounds,
			[out]BYTE* alphaValues,
			unsigned int bufferSize);"

	<virtual stdcall: hresult 5 sdword RECT* byte* dword>
	^self invalidCall!

createAlphaTexture: textureType textureBounds: textureBounds bufferSize: bufferSize
	"Answer the <BYTE> result of invoking the CreateAlphaTexture() method of the COM object."

	| answer |
	answer := (BYTE new).
	self
		CreateAlphaTexture: textureType
		textureBounds: textureBounds
		alphaValues: answer
		bufferSize: bufferSize.
	^answer asObject
!

getAlphaBlendParams: renderingParams
	"Invoke the GetAlphaBlendParams() method of the COM object."

	| answer |
	answer := (Array new: 3)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (FLOAT new);
				basicAt: 3 put: (FLOAT new);
				yourself.
	self
		GetAlphaBlendParams: renderingParams
		blendGamma: (answer basicAt: 1)
		blendEnhancedContrast: (answer basicAt: 2)
		blendClearTypeLevel: (answer basicAt: 3).
	^answer collect: [:each | each asObject]
!

GetAlphaBlendParams: renderingParams blendGamma: blendGamma blendEnhancedContrast: blendEnhancedContrast blendClearTypeLevel: blendClearTypeLevel
	"Private - Invoke the GetAlphaBlendParams() method of the COM object.

		HRESULT __stdcall GetAlphaBlendParams(
			[in]IDWriteRenderingParams* renderingParams,
			[out]float* blendGamma,
			[out]float* blendEnhancedContrast,
			[out]float* blendClearTypeLevel);"

	<virtual stdcall: hresult 6 IDWriteRenderingParams* float* float* float*>
	^self invalidCall!

getAlphaTextureBounds: textureType
	"Answer the <RECT> result of invoking the GetAlphaTextureBounds() method of the COM object."

	| answer |
	answer := (RECT new).
	self
		GetAlphaTextureBounds: textureType
		textureBounds: answer.
	^answer asObject
!

GetAlphaTextureBounds: textureType textureBounds: textureBounds
	"Private - Invoke the GetAlphaTextureBounds() method of the COM object.

		HRESULT __stdcall GetAlphaTextureBounds(
			DWRITE_TEXTURE_TYPE textureType,
			[out]RECT* textureBounds);"

	<virtual stdcall: hresult 4 sdword RECT*>
	^self invalidCall! !
!IDWriteGlyphRunAnalysis categoriesFor: #CreateAlphaTexture:textureBounds:alphaValues:bufferSize:!**auto generated**!COM Interfaces-IDWriteGlyphRunAnalysis!private! !
!IDWriteGlyphRunAnalysis categoriesFor: #createAlphaTexture:textureBounds:bufferSize:!**auto generated**!methods!public! !
!IDWriteGlyphRunAnalysis categoriesFor: #getAlphaBlendParams:!**auto generated**!methods!public! !
!IDWriteGlyphRunAnalysis categoriesFor: #GetAlphaBlendParams:blendGamma:blendEnhancedContrast:blendClearTypeLevel:!**auto generated**!COM Interfaces-IDWriteGlyphRunAnalysis!private! !
!IDWriteGlyphRunAnalysis categoriesFor: #getAlphaTextureBounds:!**auto generated**!methods!public! !
!IDWriteGlyphRunAnalysis categoriesFor: #GetAlphaTextureBounds:textureBounds:!**auto generated**!COM Interfaces-IDWriteGlyphRunAnalysis!private! !

!IDWriteGlyphRunAnalysis class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteGlyphRunAnalysis'
		IDWriteGlyphRunAnalysis defineTemplate"

	self
		defineFunction: #GetAlphaTextureBounds:textureBounds:
			argumentTypes: 'sdword RECT*';
		defineFunction: #CreateAlphaTexture:textureBounds:alphaValues:bufferSize:
			argumentTypes: 'sdword RECT* byte* dword';
		defineFunction: #GetAlphaBlendParams:blendGamma:blendEnhancedContrast:blendClearTypeLevel:
			argumentTypes: 'IDWriteRenderingParams* float* float* float*'
! !
!IDWriteGlyphRunAnalysis class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

