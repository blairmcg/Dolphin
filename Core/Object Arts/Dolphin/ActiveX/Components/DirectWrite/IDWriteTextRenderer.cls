"Filed out from Dolphin Smalltalk 7"!

IDWritePixelSnapping subclass: #IDWriteTextRenderer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextRenderer guid: (IID fromString: '{EF8A8135-5CC6-45FE-8825-C5A0724EB819}')!
IDWriteTextRenderer comment: '`IDWriteTextRenderer` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextRenderer'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteTextRenderer interface represents a set of application-defined callbacks that perform rendering of text, inline objects, and decorations such as underlines."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(ef8a8135-5cc6-45fe-8825-c5a0724eb819), 
	helpstring("The IDWriteTextRenderer interface represents a set of application-defined callbacks that perform rendering of text, inline objects, and decorations such as underlines.")
]
interface IDWriteTextRenderer : IDWritePixelSnapping
 {
	[id(0x60020000)]
	HRESULT __stdcall DrawGlyphRun(
		[in]void* clientDrawingContext,
		float baselineOriginX,
		float baselineOriginY,
		DWRITE_MEASURING_MODE measuringMode,
		[in]DWRITE_GLYPH_RUN* glyphRun,
		[in]DWRITE_GLYPH_RUN_DESCRIPTION* glyphRunDescription,
		[in]IUnknown* clientDrawingEffect);
	[id(0x60020001)]
	HRESULT __stdcall DrawUnderline(
		[in]void* clientDrawingContext,
		float baselineOriginX,
		float baselineOriginY,
		[in]DWRITE_UNDERLINE* underline,
		[in]IUnknown* clientDrawingEffect);
	[id(0x60020002)]
	HRESULT __stdcall DrawStrikethrough(
		[in]void* clientDrawingContext,
		float baselineOriginX,
		float baselineOriginY,
		[in]DWRITE_STRIKETHROUGH* strikethrough,
		[in]IUnknown* clientDrawingEffect);
	[id(0x60020003)]
	HRESULT __stdcall DrawInlineObject(
		[in]void* clientDrawingContext,
		float originX,
		float originY,
		[in]IDWriteInlineObject* inlineObject,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]IUnknown* clientDrawingEffect);
};

```'!
!IDWriteTextRenderer categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextRenderer methodsFor!

drawGlyphRun: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY measuringMode: measuringMode glyphRun: glyphRun glyphRunDescription: glyphRunDescription clientDrawingEffect: clientDrawingEffect
	"Invoke the DrawGlyphRun() method of the COM object."

	^self
		DrawGlyphRun: clientDrawingContext
		baselineOriginX: baselineOriginX
		baselineOriginY: baselineOriginY
		measuringMode: measuringMode
		glyphRun: glyphRun
		glyphRunDescription: glyphRunDescription
		clientDrawingEffect: clientDrawingEffect
!

DrawGlyphRun: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY measuringMode: measuringMode glyphRun: glyphRun glyphRunDescription: glyphRunDescription clientDrawingEffect: clientDrawingEffect
	"Private - Invoke the DrawGlyphRun() method of the COM object.

		HRESULT __stdcall DrawGlyphRun(
			[in]void* clientDrawingContext,
			float baselineOriginX,
			float baselineOriginY,
			DWRITE_MEASURING_MODE measuringMode,
			[in]DWRITE_GLYPH_RUN* glyphRun,
			[in]DWRITE_GLYPH_RUN_DESCRIPTION* glyphRunDescription,
			[in]IUnknown* clientDrawingEffect);"

	<virtual stdcall: hresult 7 void* float float sdword DWRITE_GLYPH_RUN* DWRITE_GLYPH_RUN_DESCRIPTION* IUnknown*>
	^self invalidCall!

drawInlineObject: clientDrawingContext originX: originX originY: originY inlineObject: inlineObject isSideways: isSideways isRightToLeft: isRightToLeft clientDrawingEffect: clientDrawingEffect
	"Invoke the DrawInlineObject() method of the COM object."

	^self
		DrawInlineObject: clientDrawingContext
		originX: originX
		originY: originY
		inlineObject: inlineObject
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		clientDrawingEffect: clientDrawingEffect
!

DrawInlineObject: clientDrawingContext originX: originX originY: originY inlineObject: inlineObject isSideways: isSideways isRightToLeft: isRightToLeft clientDrawingEffect: clientDrawingEffect
	"Private - Invoke the DrawInlineObject() method of the COM object.

		HRESULT __stdcall DrawInlineObject(
			[in]void* clientDrawingContext,
			float originX,
			float originY,
			[in]IDWriteInlineObject* inlineObject,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]IUnknown* clientDrawingEffect);"

	<virtual stdcall: hresult 10 void* float float IDWriteInlineObject* bool bool IUnknown*>
	^self invalidCall!

drawStrikethrough: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY strikethrough: strikethrough clientDrawingEffect: clientDrawingEffect
	"Invoke the DrawStrikethrough() method of the COM object."

	^self
		DrawStrikethrough: clientDrawingContext
		baselineOriginX: baselineOriginX
		baselineOriginY: baselineOriginY
		strikethrough: strikethrough
		clientDrawingEffect: clientDrawingEffect
!

DrawStrikethrough: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY strikethrough: strikethrough clientDrawingEffect: clientDrawingEffect
	"Private - Invoke the DrawStrikethrough() method of the COM object.

		HRESULT __stdcall DrawStrikethrough(
			[in]void* clientDrawingContext,
			float baselineOriginX,
			float baselineOriginY,
			[in]DWRITE_STRIKETHROUGH* strikethrough,
			[in]IUnknown* clientDrawingEffect);"

	<virtual stdcall: hresult 9 void* float float DWRITE_STRIKETHROUGH* IUnknown*>
	^self invalidCall!

drawUnderline: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY underline: underline clientDrawingEffect: clientDrawingEffect
	"Invoke the DrawUnderline() method of the COM object."

	^self
		DrawUnderline: clientDrawingContext
		baselineOriginX: baselineOriginX
		baselineOriginY: baselineOriginY
		underline: underline
		clientDrawingEffect: clientDrawingEffect
!

DrawUnderline: clientDrawingContext baselineOriginX: baselineOriginX baselineOriginY: baselineOriginY underline: underline clientDrawingEffect: clientDrawingEffect
	"Private - Invoke the DrawUnderline() method of the COM object.

		HRESULT __stdcall DrawUnderline(
			[in]void* clientDrawingContext,
			float baselineOriginX,
			float baselineOriginY,
			[in]DWRITE_UNDERLINE* underline,
			[in]IUnknown* clientDrawingEffect);"

	<virtual stdcall: hresult 8 void* float float DWRITE_UNDERLINE* IUnknown*>
	^self invalidCall! !
!IDWriteTextRenderer categoriesFor: #drawGlyphRun:baselineOriginX:baselineOriginY:measuringMode:glyphRun:glyphRunDescription:clientDrawingEffect:!**auto generated**!methods!public! !
!IDWriteTextRenderer categoriesFor: #DrawGlyphRun:baselineOriginX:baselineOriginY:measuringMode:glyphRun:glyphRunDescription:clientDrawingEffect:!**auto generated**!COM Interfaces-IDWriteTextRenderer!private! !
!IDWriteTextRenderer categoriesFor: #drawInlineObject:originX:originY:inlineObject:isSideways:isRightToLeft:clientDrawingEffect:!**auto generated**!methods!public! !
!IDWriteTextRenderer categoriesFor: #DrawInlineObject:originX:originY:inlineObject:isSideways:isRightToLeft:clientDrawingEffect:!**auto generated**!COM Interfaces-IDWriteTextRenderer!private! !
!IDWriteTextRenderer categoriesFor: #drawStrikethrough:baselineOriginX:baselineOriginY:strikethrough:clientDrawingEffect:!**auto generated**!methods!public! !
!IDWriteTextRenderer categoriesFor: #DrawStrikethrough:baselineOriginX:baselineOriginY:strikethrough:clientDrawingEffect:!**auto generated**!COM Interfaces-IDWriteTextRenderer!private! !
!IDWriteTextRenderer categoriesFor: #drawUnderline:baselineOriginX:baselineOriginY:underline:clientDrawingEffect:!**auto generated**!methods!public! !
!IDWriteTextRenderer categoriesFor: #DrawUnderline:baselineOriginX:baselineOriginY:underline:clientDrawingEffect:!**auto generated**!COM Interfaces-IDWriteTextRenderer!private! !

!IDWriteTextRenderer class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextRenderer'
		IDWriteTextRenderer defineTemplate"

	self
		defineFunction: #DrawGlyphRun:baselineOriginX:baselineOriginY:measuringMode:glyphRun:glyphRunDescription:clientDrawingEffect:
			argumentTypes: 'void* float float sdword DWRITE_GLYPH_RUN* DWRITE_GLYPH_RUN_DESCRIPTION* IUnknown*';
		defineFunction: #DrawUnderline:baselineOriginX:baselineOriginY:underline:clientDrawingEffect:
			argumentTypes: 'void* float float DWRITE_UNDERLINE* IUnknown*';
		defineFunction: #DrawStrikethrough:baselineOriginX:baselineOriginY:strikethrough:clientDrawingEffect:
			argumentTypes: 'void* float float DWRITE_STRIKETHROUGH* IUnknown*';
		defineFunction: #DrawInlineObject:originX:originY:inlineObject:isSideways:isRightToLeft:clientDrawingEffect:
			argumentTypes: 'void* float float IDWriteInlineObject* bool bool IUnknown*'
! !
!IDWriteTextRenderer class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

