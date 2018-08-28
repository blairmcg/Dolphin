"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteRenderingParams
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteRenderingParams guid: (IID fromString: '{2F0DA53A-2ADD-47CD-82EE-D9EC34688E75}')!
IDWriteRenderingParams comment: '`IDWriteRenderingParams` is a wrapper class for the COM interface ''DirectWrite.IDWriteRenderingParams'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The interface that represents text rendering settings for glyph rasterization and filtering."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2f0da53a-2add-47cd-82ee-d9ec34688e75), 
	helpstring("The interface that represents text rendering settings for glyph rasterization and filtering.")
]
interface IDWriteRenderingParams : IUnknown
 {
	[id(0x60010000)]
	float __stdcall GetGamma();
	[id(0x60010001)]
	float __stdcall GetEnhancedContrast();
	[id(0x60010002)]
	float __stdcall GetClearTypeLevel();
	[id(0x60010003)]
	DWRITE_PIXEL_GEOMETRY __stdcall GetPixelGeometry();
	[id(0x60010004)]
	DWRITE_RENDERING_MODE __stdcall GetRenderingMode();
};

```'!
!IDWriteRenderingParams categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteRenderingParams methodsFor!

getClearTypeLevel
	"Answer the <FLOAT> result of invoking the GetClearTypeLevel() method of the COM object."

	^self GetClearTypeLevel
!

GetClearTypeLevel
	"Private - Invoke the GetClearTypeLevel() method of the COM object.

		float __stdcall GetClearTypeLevel();"

	<virtual stdcall: float 6>
	^self invalidCall!

getEnhancedContrast
	"Answer the <FLOAT> result of invoking the GetEnhancedContrast() method of the COM object."

	^self GetEnhancedContrast
!

GetEnhancedContrast
	"Private - Invoke the GetEnhancedContrast() method of the COM object.

		float __stdcall GetEnhancedContrast();"

	<virtual stdcall: float 5>
	^self invalidCall!

getGamma
	"Answer the <FLOAT> result of invoking the GetGamma() method of the COM object."

	^self GetGamma
!

GetGamma
	"Private - Invoke the GetGamma() method of the COM object.

		float __stdcall GetGamma();"

	<virtual stdcall: float 4>
	^self invalidCall!

getPixelGeometry
	"Answer the <SDWORD> result of invoking the GetPixelGeometry() method of the COM object."

	^self GetPixelGeometry
!

GetPixelGeometry
	"Private - Invoke the GetPixelGeometry() method of the COM object.

		DWRITE_PIXEL_GEOMETRY __stdcall GetPixelGeometry();"

	<virtual stdcall: sdword 7>
	^self invalidCall!

getRenderingMode
	"Answer the <SDWORD> result of invoking the GetRenderingMode() method of the COM object."

	^self GetRenderingMode
!

GetRenderingMode
	"Private - Invoke the GetRenderingMode() method of the COM object.

		DWRITE_RENDERING_MODE __stdcall GetRenderingMode();"

	<virtual stdcall: sdword 8>
	^self invalidCall! !
!IDWriteRenderingParams categoriesFor: #getClearTypeLevel!**auto generated**!methods!public! !
!IDWriteRenderingParams categoriesFor: #GetClearTypeLevel!**auto generated**!COM Interfaces-IDWriteRenderingParams!private! !
!IDWriteRenderingParams categoriesFor: #getEnhancedContrast!**auto generated**!methods!public! !
!IDWriteRenderingParams categoriesFor: #GetEnhancedContrast!**auto generated**!COM Interfaces-IDWriteRenderingParams!private! !
!IDWriteRenderingParams categoriesFor: #getGamma!**auto generated**!methods!public! !
!IDWriteRenderingParams categoriesFor: #GetGamma!**auto generated**!COM Interfaces-IDWriteRenderingParams!private! !
!IDWriteRenderingParams categoriesFor: #getPixelGeometry!**auto generated**!methods!public! !
!IDWriteRenderingParams categoriesFor: #GetPixelGeometry!**auto generated**!COM Interfaces-IDWriteRenderingParams!private! !
!IDWriteRenderingParams categoriesFor: #getRenderingMode!**auto generated**!methods!public! !
!IDWriteRenderingParams categoriesFor: #GetRenderingMode!**auto generated**!COM Interfaces-IDWriteRenderingParams!private! !

!IDWriteRenderingParams class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteRenderingParams'
		IDWriteRenderingParams defineTemplate"

	self
		defineFunction: #GetGamma
			returnType: 'float';
		defineFunction: #GetEnhancedContrast
			returnType: 'float';
		defineFunction: #GetClearTypeLevel
			returnType: 'float';
		defineFunction: #GetPixelGeometry
			returnType: 'sdword';
		defineFunction: #GetRenderingMode
			returnType: 'sdword'
! !
!IDWriteRenderingParams class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

