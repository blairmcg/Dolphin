"Filed out from Dolphin Smalltalk 7"!

IDWriteTextFormat subclass: #IDWriteTextLayout
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteTextLayout guid: (IID fromString: '{53737037-6D14-410B-9BFE-0B182BB70961}')!
IDWriteTextLayout comment: '`IDWriteTextLayout` is a wrapper class for the COM interface ''DirectWrite.IDWriteTextLayout'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteTextLayout interface represents a block of text after it has been fully analyzed and formatted. All coordinates are in device independent pixels (DIPs)."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(53737037-6d14-410b-9bfe-0b182bb70961), 
	helpstring("The IDWriteTextLayout interface represents a block of text after it has been fully analyzed and formatted. All coordinates are in device independent pixels (DIPs).")
]
interface IDWriteTextLayout : IDWriteTextFormat
 {
	[id(0x60020000)]
	HRESULT __stdcall SetMaxWidth(
		float maxWidth);
	[id(0x60020001)]
	HRESULT __stdcall SetMaxHeight(
		float maxHeight);
	[id(0x60020002)]
	HRESULT __stdcall SetFontCollection(
		[in]IDWriteFontCollection* fontCollection,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020003)]
	HRESULT __stdcall SetFontFamilyName(
		[in]unsigned short* fontFamilyName,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020004)]
	HRESULT __stdcall SetFontWeight(
		DWRITE_FONT_WEIGHT fontWeight,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020005)]
	HRESULT __stdcall SetFontStyle(
		DWRITE_FONT_STYLE fontStyle,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020006)]
	HRESULT __stdcall SetFontStretch(
		DWRITE_FONT_STRETCH fontStretch,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020007)]
	HRESULT __stdcall SetFontSize(
		float fontSize,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020008)]
	HRESULT __stdcall SetUnderline(
		BOOL hasUnderline,
		DWRITE_TEXT_RANGE textRange);
	[id(0x60020009)]
	HRESULT __stdcall SetStrikethrough(
		BOOL hasStrikethrough,
		DWRITE_TEXT_RANGE textRange);
	[id(0x6002000a)]
	HRESULT __stdcall SetDrawingEffect(
		IUnknown* drawingEffect,
		DWRITE_TEXT_RANGE textRange);
	[id(0x6002000b)]
	HRESULT __stdcall SetInlineObject(
		[in]IDWriteInlineObject* inlineObject,
		DWRITE_TEXT_RANGE textRange);
	[id(0x6002000c)]
	HRESULT __stdcall SetTypography(
		[in]IDWriteTypography* typography,
		DWRITE_TEXT_RANGE textRange);
	[id(0x6002000d)]
	HRESULT __stdcall SetLocaleName(
		[in]unsigned short* localeName,
		DWRITE_TEXT_RANGE textRange);
	[id(0x6002000e)]
	float __stdcall GetMaxWidth();
	[id(0x6002000f)]
	float __stdcall GetMaxHeight();
	[id(0x60020010)]
	HRESULT __stdcall GetFontCollection(
		unsigned int currentPosition,
		[out]IDWriteFontCollection** fontCollection,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020011)]
	HRESULT __stdcall GetFontFamilyNameLength(
		unsigned int currentPosition,
		[out]unsigned int* nameLength,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020012)]
	HRESULT __stdcall GetFontFamilyName(
		unsigned int currentPosition,
		[out]unsigned short* fontFamilyName,
		unsigned int nameSize,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020013)]
	HRESULT __stdcall GetFontWeight(
		unsigned int currentPosition,
		[out]DWRITE_FONT_WEIGHT* fontWeight,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020014)]
	HRESULT __stdcall GetFontStyle(
		unsigned int currentPosition,
		[out]DWRITE_FONT_STYLE* fontStyle,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020015)]
	HRESULT __stdcall GetFontStretch(
		unsigned int currentPosition,
		[out]DWRITE_FONT_STRETCH* fontStretch,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020016)]
	HRESULT __stdcall GetFontSize(
		unsigned int currentPosition,
		[out]float* fontSize,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020017)]
	HRESULT __stdcall GetUnderline(
		unsigned int currentPosition,
		[out]BOOL* hasUnderline,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020018)]
	HRESULT __stdcall GetStrikethrough(
		unsigned int currentPosition,
		[out]BOOL* hasStrikethrough,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x60020019)]
	HRESULT __stdcall GetDrawingEffect(
		unsigned int currentPosition,
		[out]IUnknown** drawingEffect,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x6002001a)]
	HRESULT __stdcall GetInlineObject(
		unsigned int currentPosition,
		[out]IDWriteInlineObject** inlineObject,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x6002001b)]
	HRESULT __stdcall GetTypography(
		unsigned int currentPosition,
		[out]IDWriteTypography** typography,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x6002001c)]
	HRESULT __stdcall GetLocaleNameLength(
		unsigned int currentPosition,
		[out]unsigned int* nameLength,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x6002001d)]
	HRESULT __stdcall GetLocaleName(
		unsigned int currentPosition,
		[out]unsigned short* localeName,
		unsigned int nameSize,
		[out]DWRITE_TEXT_RANGE* textRange);
	[id(0x6002001e)]
	HRESULT __stdcall Draw(
		[in]void* clientDrawingContext,
		[in]IDWriteTextRenderer* renderer,
		float originX,
		float originY);
	[id(0x6002001f)]
	HRESULT __stdcall GetLineMetrics(
		[out]DWRITE_LINE_METRICS* lineMetrics,
		unsigned int maxLineCount,
		[out]unsigned int* actualLineCount);
	[id(0x60020020)]
	HRESULT __stdcall GetMetrics(
		[out]DWRITE_TEXT_METRICS* textMetrics);
	[id(0x60020021)]
	HRESULT __stdcall GetOverhangMetrics(
		[out]DWRITE_OVERHANG_METRICS* overhangs);
	[id(0x60020022)]
	HRESULT __stdcall GetClusterMetrics(
		[out]DWRITE_CLUSTER_METRICS* clusterMetrics,
		unsigned int maxClusterCount,
		[out]unsigned int* actualClusterCount);
	[id(0x60020023)]
	HRESULT __stdcall DetermineMinWidth(
		[out]float* minWidth);
	[id(0x60020024)]
	HRESULT __stdcall HitTestPoint(
		float pointX,
		float pointY,
		[out]BOOL* isTrailingHit,
		[out]BOOL* isInside,
		[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics);
	[id(0x60020025)]
	HRESULT __stdcall HitTestTextPosition(
		unsigned int textPosition,
		BOOL isTrailingHit,
		[out]float* pointX,
		[out]float* pointY,
		[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics);
	[id(0x60020026)]
	HRESULT __stdcall HitTestTextRange(
		unsigned int textPosition,
		unsigned int textLength,
		float originX,
		float originY,
		[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics,
		unsigned int maxHitTestMetricsCount,
		[out]unsigned int* actualHitTestMetricsCount);
};

```'!
!IDWriteTextLayout categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteTextLayout methodsFor!

determineMinWidth
	"Answer the <FLOAT> result of invoking the DetermineMinWidth() method of the COM object."

	| answer |
	answer := (FLOAT new).
	self DetermineMinWidth: answer.
	^answer asObject
!

DetermineMinWidth: minWidth
	"Private - Invoke the DetermineMinWidth() method of the COM object.

		HRESULT __stdcall DetermineMinWidth(
			[out]float* minWidth);"

	<virtual stdcall: hresult 64 float*>
	^self invalidCall!

draw: clientDrawingContext renderer: renderer originX: originX originY: originY
	"Invoke the Draw() method of the COM object."

	^self
		Draw: clientDrawingContext
		renderer: renderer
		originX: originX
		originY: originY
!

Draw: clientDrawingContext renderer: renderer originX: originX originY: originY
	"Private - Invoke the Draw() method of the COM object.

		HRESULT __stdcall Draw(
			[in]void* clientDrawingContext,
			[in]IDWriteTextRenderer* renderer,
			float originX,
			float originY);"

	<virtual stdcall: hresult 59 void* IDWriteTextRenderer* float float>
	^self invalidCall!

getClusterMetrics: maxClusterCount
	"Invoke the GetClusterMetrics() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWRITE_CLUSTER_METRICS new);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetClusterMetrics: (answer basicAt: 1)
		maxClusterCount: maxClusterCount
		actualClusterCount: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetClusterMetrics: clusterMetrics maxClusterCount: maxClusterCount actualClusterCount: actualClusterCount
	"Private - Invoke the GetClusterMetrics() method of the COM object.

		HRESULT __stdcall GetClusterMetrics(
			[out]DWRITE_CLUSTER_METRICS* clusterMetrics,
			unsigned int maxClusterCount,
			[out]unsigned int* actualClusterCount);"

	<virtual stdcall: hresult 63 DWRITE_CLUSTER_METRICS* dword dword*>
	^self invalidCall!

getDrawingEffect: currentPosition
	"Invoke the GetDrawingEffect() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: IUnknown newPointer;
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetDrawingEffect: currentPosition
		drawingEffect: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetDrawingEffect: currentPosition drawingEffect: drawingEffect textRange: textRange
	"Private - Invoke the GetDrawingEffect() method of the COM object.

		HRESULT __stdcall GetDrawingEffect(
			unsigned int currentPosition,
			[out]IUnknown** drawingEffect,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 54 dword IUnknown** DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontCollection: currentPosition
	"Invoke the GetFontCollection() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: IDWriteFontCollection newPointer;
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontCollection: currentPosition
		fontCollection: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontCollection: currentPosition fontCollection: fontCollection textRange: textRange
	"Private - Invoke the GetFontCollection() method of the COM object.

		HRESULT __stdcall GetFontCollection(
			unsigned int currentPosition,
			[out]IDWriteFontCollection** fontCollection,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 45 dword IDWriteFontCollection** DWRITE_TEXT_RANGE*>
	^self invalidCall!

GetFontFamilyName: currentPosition fontFamilyName: fontFamilyName nameSize: nameSize textRange: textRange
	"Private - Invoke the GetFontFamilyName() method of the COM object.

		HRESULT __stdcall GetFontFamilyName(
			unsigned int currentPosition,
			[out]unsigned short* fontFamilyName,
			unsigned int nameSize,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 47 dword word* dword DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontFamilyName: currentPosition nameSize: nameSize
	"Invoke the GetFontFamilyName() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (WORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontFamilyName: currentPosition
		fontFamilyName: (answer basicAt: 1)
		nameSize: nameSize
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

getFontFamilyNameLength: currentPosition
	"Invoke the GetFontFamilyNameLength() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontFamilyNameLength: currentPosition
		nameLength: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontFamilyNameLength: currentPosition nameLength: nameLength textRange: textRange
	"Private - Invoke the GetFontFamilyNameLength() method of the COM object.

		HRESULT __stdcall GetFontFamilyNameLength(
			unsigned int currentPosition,
			[out]unsigned int* nameLength,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 46 dword dword* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontSize: currentPosition
	"Invoke the GetFontSize() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontSize: currentPosition
		fontSize: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontSize: currentPosition fontSize: fontSize textRange: textRange
	"Private - Invoke the GetFontSize() method of the COM object.

		HRESULT __stdcall GetFontSize(
			unsigned int currentPosition,
			[out]float* fontSize,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 51 dword float* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontStretch: currentPosition
	"Invoke the GetFontStretch() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (SDWORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontStretch: currentPosition
		fontStretch: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontStretch: currentPosition fontStretch: fontStretch textRange: textRange
	"Private - Invoke the GetFontStretch() method of the COM object.

		HRESULT __stdcall GetFontStretch(
			unsigned int currentPosition,
			[out]DWRITE_FONT_STRETCH* fontStretch,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 50 dword sdword* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontStyle: currentPosition
	"Invoke the GetFontStyle() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (SDWORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontStyle: currentPosition
		fontStyle: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontStyle: currentPosition fontStyle: fontStyle textRange: textRange
	"Private - Invoke the GetFontStyle() method of the COM object.

		HRESULT __stdcall GetFontStyle(
			unsigned int currentPosition,
			[out]DWRITE_FONT_STYLE* fontStyle,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 49 dword sdword* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getFontWeight: currentPosition
	"Invoke the GetFontWeight() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (SDWORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetFontWeight: currentPosition
		fontWeight: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetFontWeight: currentPosition fontWeight: fontWeight textRange: textRange
	"Private - Invoke the GetFontWeight() method of the COM object.

		HRESULT __stdcall GetFontWeight(
			unsigned int currentPosition,
			[out]DWRITE_FONT_WEIGHT* fontWeight,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 48 dword sdword* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getInlineObject: currentPosition
	"Invoke the GetInlineObject() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: IDWriteInlineObject newPointer;
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetInlineObject: currentPosition
		inlineObject: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetInlineObject: currentPosition inlineObject: inlineObject textRange: textRange
	"Private - Invoke the GetInlineObject() method of the COM object.

		HRESULT __stdcall GetInlineObject(
			unsigned int currentPosition,
			[out]IDWriteInlineObject** inlineObject,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 55 dword IDWriteInlineObject** DWRITE_TEXT_RANGE*>
	^self invalidCall!

getLineMetrics: maxLineCount
	"Invoke the GetLineMetrics() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWRITE_LINE_METRICS new);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		GetLineMetrics: (answer basicAt: 1)
		maxLineCount: maxLineCount
		actualLineCount: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetLineMetrics: lineMetrics maxLineCount: maxLineCount actualLineCount: actualLineCount
	"Private - Invoke the GetLineMetrics() method of the COM object.

		HRESULT __stdcall GetLineMetrics(
			[out]DWRITE_LINE_METRICS* lineMetrics,
			unsigned int maxLineCount,
			[out]unsigned int* actualLineCount);"

	<virtual stdcall: hresult 60 DWRITE_LINE_METRICS* dword dword*>
	^self invalidCall!

GetLocaleName: currentPosition localeName: localeName nameSize: nameSize textRange: textRange
	"Private - Invoke the GetLocaleName() method of the COM object.

		HRESULT __stdcall GetLocaleName(
			unsigned int currentPosition,
			[out]unsigned short* localeName,
			unsigned int nameSize,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 58 dword word* dword DWRITE_TEXT_RANGE*>
	^self invalidCall!

getLocaleName: currentPosition nameSize: nameSize
	"Invoke the GetLocaleName() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (WORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetLocaleName: currentPosition
		localeName: (answer basicAt: 1)
		nameSize: nameSize
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

getLocaleNameLength: currentPosition
	"Invoke the GetLocaleNameLength() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWORD new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetLocaleNameLength: currentPosition
		nameLength: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetLocaleNameLength: currentPosition nameLength: nameLength textRange: textRange
	"Private - Invoke the GetLocaleNameLength() method of the COM object.

		HRESULT __stdcall GetLocaleNameLength(
			unsigned int currentPosition,
			[out]unsigned int* nameLength,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 57 dword dword* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getMaxHeight
	"Answer the <FLOAT> result of invoking the GetMaxHeight() method of the COM object."

	^self GetMaxHeight
!

GetMaxHeight
	"Private - Invoke the GetMaxHeight() method of the COM object.

		float __stdcall GetMaxHeight();"

	<virtual stdcall: float 44>
	^self invalidCall!

getMaxWidth
	"Answer the <FLOAT> result of invoking the GetMaxWidth() method of the COM object."

	^self GetMaxWidth
!

GetMaxWidth
	"Private - Invoke the GetMaxWidth() method of the COM object.

		float __stdcall GetMaxWidth();"

	<virtual stdcall: float 43>
	^self invalidCall!

getMetrics
	"Answer the <DWRITE_TEXT_METRICS> result of invoking the GetMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_TEXT_METRICS new).
	self GetMetrics: answer.
	^answer asObject
!

GetMetrics: textMetrics
	"Private - Invoke the GetMetrics() method of the COM object.

		HRESULT __stdcall GetMetrics(
			[out]DWRITE_TEXT_METRICS* textMetrics);"

	<virtual stdcall: hresult 61 DWRITE_TEXT_METRICS*>
	^self invalidCall!

getOverhangMetrics
	"Answer the <DWRITE_OVERHANG_METRICS> result of invoking the GetOverhangMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_OVERHANG_METRICS new).
	self GetOverhangMetrics: answer.
	^answer asObject
!

GetOverhangMetrics: overhangs
	"Private - Invoke the GetOverhangMetrics() method of the COM object.

		HRESULT __stdcall GetOverhangMetrics(
			[out]DWRITE_OVERHANG_METRICS* overhangs);"

	<virtual stdcall: hresult 62 DWRITE_OVERHANG_METRICS*>
	^self invalidCall!

getStrikethrough: currentPosition
	"Invoke the GetStrikethrough() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (BOOL new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetStrikethrough: currentPosition
		hasStrikethrough: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetStrikethrough: currentPosition hasStrikethrough: hasStrikethrough textRange: textRange
	"Private - Invoke the GetStrikethrough() method of the COM object.

		HRESULT __stdcall GetStrikethrough(
			unsigned int currentPosition,
			[out]BOOL* hasStrikethrough,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 53 dword bool* DWRITE_TEXT_RANGE*>
	^self invalidCall!

getTypography: currentPosition
	"Invoke the GetTypography() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: IDWriteTypography newPointer;
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetTypography: currentPosition
		typography: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetTypography: currentPosition typography: typography textRange: textRange
	"Private - Invoke the GetTypography() method of the COM object.

		HRESULT __stdcall GetTypography(
			unsigned int currentPosition,
			[out]IDWriteTypography** typography,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 56 dword IDWriteTypography** DWRITE_TEXT_RANGE*>
	^self invalidCall!

getUnderline: currentPosition
	"Invoke the GetUnderline() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (BOOL new);
				basicAt: 2 put: (DWRITE_TEXT_RANGE new);
				yourself.
	self
		GetUnderline: currentPosition
		hasUnderline: (answer basicAt: 1)
		textRange: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetUnderline: currentPosition hasUnderline: hasUnderline textRange: textRange
	"Private - Invoke the GetUnderline() method of the COM object.

		HRESULT __stdcall GetUnderline(
			unsigned int currentPosition,
			[out]BOOL* hasUnderline,
			[out]DWRITE_TEXT_RANGE* textRange);"

	<virtual stdcall: hresult 52 dword bool* DWRITE_TEXT_RANGE*>
	^self invalidCall!

hitTestPoint: pointX pointY: pointY
	"Invoke the HitTestPoint() method of the COM object."

	| answer |
	answer := (Array new: 3)
				basicAt: 1 put: (BOOL new);
				basicAt: 2 put: (BOOL new);
				basicAt: 3 put: (DWRITE_HIT_TEST_METRICS new);
				yourself.
	self
		HitTestPoint: pointX
		pointY: pointY
		isTrailingHit: (answer basicAt: 1)
		isInside: (answer basicAt: 2)
		hitTestMetrics: (answer basicAt: 3).
	^answer collect: [:each | each asObject]
!

HitTestPoint: pointX pointY: pointY isTrailingHit: isTrailingHit isInside: isInside hitTestMetrics: hitTestMetrics
	"Private - Invoke the HitTestPoint() method of the COM object.

		HRESULT __stdcall HitTestPoint(
			float pointX,
			float pointY,
			[out]BOOL* isTrailingHit,
			[out]BOOL* isInside,
			[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics);"

	<virtual stdcall: hresult 65 float float bool* bool* DWRITE_HIT_TEST_METRICS*>
	^self invalidCall!

hitTestTextPosition: textPosition isTrailingHit: isTrailingHit
	"Invoke the HitTestTextPosition() method of the COM object."

	| answer |
	answer := (Array new: 3)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (FLOAT new);
				basicAt: 3 put: (DWRITE_HIT_TEST_METRICS new);
				yourself.
	self
		HitTestTextPosition: textPosition
		isTrailingHit: isTrailingHit
		pointX: (answer basicAt: 1)
		pointY: (answer basicAt: 2)
		hitTestMetrics: (answer basicAt: 3).
	^answer collect: [:each | each asObject]
!

HitTestTextPosition: textPosition isTrailingHit: isTrailingHit pointX: pointX pointY: pointY hitTestMetrics: hitTestMetrics
	"Private - Invoke the HitTestTextPosition() method of the COM object.

		HRESULT __stdcall HitTestTextPosition(
			unsigned int textPosition,
			BOOL isTrailingHit,
			[out]float* pointX,
			[out]float* pointY,
			[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics);"

	<virtual stdcall: hresult 66 dword bool float* float* DWRITE_HIT_TEST_METRICS*>
	^self invalidCall!

HitTestTextRange: textPosition textLength: textLength originX: originX originY: originY hitTestMetrics: hitTestMetrics maxHitTestMetricsCount: maxHitTestMetricsCount actualHitTestMetricsCount: actualHitTestMetricsCount
	"Private - Invoke the HitTestTextRange() method of the COM object.

		HRESULT __stdcall HitTestTextRange(
			unsigned int textPosition,
			unsigned int textLength,
			float originX,
			float originY,
			[out]DWRITE_HIT_TEST_METRICS* hitTestMetrics,
			unsigned int maxHitTestMetricsCount,
			[out]unsigned int* actualHitTestMetricsCount);"

	<virtual stdcall: hresult 67 dword dword float float DWRITE_HIT_TEST_METRICS* dword dword*>
	^self invalidCall!

hitTestTextRange: textPosition textLength: textLength originX: originX originY: originY maxHitTestMetricsCount: maxHitTestMetricsCount
	"Invoke the HitTestTextRange() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (DWRITE_HIT_TEST_METRICS new);
				basicAt: 2 put: (DWORD new);
				yourself.
	self
		HitTestTextRange: textPosition
		textLength: textLength
		originX: originX
		originY: originY
		hitTestMetrics: (answer basicAt: 1)
		maxHitTestMetricsCount: maxHitTestMetricsCount
		actualHitTestMetricsCount: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

setDrawingEffect: drawingEffect textRange: textRange
	"Invoke the SetDrawingEffect() method of the COM object."

	^self
		SetDrawingEffect: drawingEffect
		textRange: textRange
!

SetDrawingEffect: drawingEffect textRange: textRange
	"Private - Invoke the SetDrawingEffect() method of the COM object.

		HRESULT __stdcall SetDrawingEffect(
			IUnknown* drawingEffect,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 39 IUnknown* DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontCollection: fontCollection textRange: textRange
	"Invoke the SetFontCollection() method of the COM object."

	^self
		SetFontCollection: fontCollection
		textRange: textRange
!

SetFontCollection: fontCollection textRange: textRange
	"Private - Invoke the SetFontCollection() method of the COM object.

		HRESULT __stdcall SetFontCollection(
			[in]IDWriteFontCollection* fontCollection,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 31 IDWriteFontCollection* DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontFamilyName: fontFamilyName textRange: textRange
	"Invoke the SetFontFamilyName() method of the COM object."

	^self
		SetFontFamilyName: fontFamilyName
		textRange: textRange
!

SetFontFamilyName: fontFamilyName textRange: textRange
	"Private - Invoke the SetFontFamilyName() method of the COM object.

		HRESULT __stdcall SetFontFamilyName(
			[in]unsigned short* fontFamilyName,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 32 word* DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontSize: fontSize textRange: textRange
	"Invoke the SetFontSize() method of the COM object."

	^self
		SetFontSize: fontSize
		textRange: textRange
!

SetFontSize: fontSize textRange: textRange
	"Private - Invoke the SetFontSize() method of the COM object.

		HRESULT __stdcall SetFontSize(
			float fontSize,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 36 float DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontStretch: fontStretch textRange: textRange
	"Invoke the SetFontStretch() method of the COM object."

	^self
		SetFontStretch: fontStretch
		textRange: textRange
!

SetFontStretch: fontStretch textRange: textRange
	"Private - Invoke the SetFontStretch() method of the COM object.

		HRESULT __stdcall SetFontStretch(
			DWRITE_FONT_STRETCH fontStretch,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 35 sdword DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontStyle: fontStyle textRange: textRange
	"Invoke the SetFontStyle() method of the COM object."

	^self
		SetFontStyle: fontStyle
		textRange: textRange
!

SetFontStyle: fontStyle textRange: textRange
	"Private - Invoke the SetFontStyle() method of the COM object.

		HRESULT __stdcall SetFontStyle(
			DWRITE_FONT_STYLE fontStyle,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 34 sdword DWRITE_TEXT_RANGE>
	^self invalidCall!

setFontWeight: fontWeight textRange: textRange
	"Invoke the SetFontWeight() method of the COM object."

	^self
		SetFontWeight: fontWeight
		textRange: textRange
!

SetFontWeight: fontWeight textRange: textRange
	"Private - Invoke the SetFontWeight() method of the COM object.

		HRESULT __stdcall SetFontWeight(
			DWRITE_FONT_WEIGHT fontWeight,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 33 sdword DWRITE_TEXT_RANGE>
	^self invalidCall!

setInlineObject: inlineObject textRange: textRange
	"Invoke the SetInlineObject() method of the COM object."

	^self
		SetInlineObject: inlineObject
		textRange: textRange
!

SetInlineObject: inlineObject textRange: textRange
	"Private - Invoke the SetInlineObject() method of the COM object.

		HRESULT __stdcall SetInlineObject(
			[in]IDWriteInlineObject* inlineObject,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 40 IDWriteInlineObject* DWRITE_TEXT_RANGE>
	^self invalidCall!

setLocaleName: localeName textRange: textRange
	"Invoke the SetLocaleName() method of the COM object."

	^self
		SetLocaleName: localeName
		textRange: textRange
!

SetLocaleName: localeName textRange: textRange
	"Private - Invoke the SetLocaleName() method of the COM object.

		HRESULT __stdcall SetLocaleName(
			[in]unsigned short* localeName,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 42 word* DWRITE_TEXT_RANGE>
	^self invalidCall!

setMaxHeight: maxHeight
	"Invoke the SetMaxHeight() method of the COM object."

	^self SetMaxHeight: maxHeight
!

SetMaxHeight: maxHeight
	"Private - Invoke the SetMaxHeight() method of the COM object.

		HRESULT __stdcall SetMaxHeight(
			float maxHeight);"

	<virtual stdcall: hresult 30 float>
	^self invalidCall!

setMaxWidth: maxWidth
	"Invoke the SetMaxWidth() method of the COM object."

	^self SetMaxWidth: maxWidth
!

SetMaxWidth: maxWidth
	"Private - Invoke the SetMaxWidth() method of the COM object.

		HRESULT __stdcall SetMaxWidth(
			float maxWidth);"

	<virtual stdcall: hresult 29 float>
	^self invalidCall!

setStrikethrough: hasStrikethrough textRange: textRange
	"Invoke the SetStrikethrough() method of the COM object."

	^self
		SetStrikethrough: hasStrikethrough
		textRange: textRange
!

SetStrikethrough: hasStrikethrough textRange: textRange
	"Private - Invoke the SetStrikethrough() method of the COM object.

		HRESULT __stdcall SetStrikethrough(
			BOOL hasStrikethrough,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 38 bool DWRITE_TEXT_RANGE>
	^self invalidCall!

setTypography: typography textRange: textRange
	"Invoke the SetTypography() method of the COM object."

	^self
		SetTypography: typography
		textRange: textRange
!

SetTypography: typography textRange: textRange
	"Private - Invoke the SetTypography() method of the COM object.

		HRESULT __stdcall SetTypography(
			[in]IDWriteTypography* typography,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 41 IDWriteTypography* DWRITE_TEXT_RANGE>
	^self invalidCall!

setUnderline: hasUnderline textRange: textRange
	"Invoke the SetUnderline() method of the COM object."

	^self
		SetUnderline: hasUnderline
		textRange: textRange
!

SetUnderline: hasUnderline textRange: textRange
	"Private - Invoke the SetUnderline() method of the COM object.

		HRESULT __stdcall SetUnderline(
			BOOL hasUnderline,
			DWRITE_TEXT_RANGE textRange);"

	<virtual stdcall: hresult 37 bool DWRITE_TEXT_RANGE>
	^self invalidCall! !
!IDWriteTextLayout categoriesFor: #determineMinWidth!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #DetermineMinWidth:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #draw:renderer:originX:originY:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #Draw:renderer:originX:originY:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getClusterMetrics:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetClusterMetrics:maxClusterCount:actualClusterCount:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getDrawingEffect:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetDrawingEffect:drawingEffect:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontCollection:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontCollection:fontCollection:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #GetFontFamilyName:fontFamilyName:nameSize:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontFamilyName:nameSize:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #getFontFamilyNameLength:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontFamilyNameLength:nameLength:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontSize:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontSize:fontSize:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontStretch:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontStretch:fontStretch:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontStyle:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontStyle:fontStyle:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getFontWeight:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetFontWeight:fontWeight:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getInlineObject:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetInlineObject:inlineObject:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getLineMetrics:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetLineMetrics:maxLineCount:actualLineCount:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #GetLocaleName:localeName:nameSize:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getLocaleName:nameSize:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #getLocaleNameLength:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetLocaleNameLength:nameLength:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getMaxHeight!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetMaxHeight!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getMaxWidth!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetMaxWidth!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getMetrics!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetMetrics:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getOverhangMetrics!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetOverhangMetrics:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getStrikethrough:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetStrikethrough:hasStrikethrough:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getTypography:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetTypography:typography:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #getUnderline:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #GetUnderline:hasUnderline:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #hitTestPoint:pointY:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #HitTestPoint:pointY:isTrailingHit:isInside:hitTestMetrics:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #hitTestTextPosition:isTrailingHit:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #HitTestTextPosition:isTrailingHit:pointX:pointY:hitTestMetrics:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #HitTestTextRange:textLength:originX:originY:hitTestMetrics:maxHitTestMetricsCount:actualHitTestMetricsCount:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #hitTestTextRange:textLength:originX:originY:maxHitTestMetricsCount:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #setDrawingEffect:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetDrawingEffect:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontCollection:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontCollection:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontFamilyName:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontFamilyName:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontSize:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontSize:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontStretch:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontStretch:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontStyle:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontStyle:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setFontWeight:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetFontWeight:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setInlineObject:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetInlineObject:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setLocaleName:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetLocaleName:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setMaxHeight:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetMaxHeight:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setMaxWidth:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetMaxWidth:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setStrikethrough:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetStrikethrough:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setTypography:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetTypography:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !
!IDWriteTextLayout categoriesFor: #setUnderline:textRange:!**auto generated**!methods!public! !
!IDWriteTextLayout categoriesFor: #SetUnderline:textRange:!**auto generated**!COM Interfaces-IDWriteTextLayout!private! !

!IDWriteTextLayout class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteTextLayout'
		IDWriteTextLayout defineTemplate"

	self
		defineFunction: #SetMaxWidth:
			argumentTypes: 'float';
		defineFunction: #SetMaxHeight:
			argumentTypes: 'float';
		defineFunction: #SetFontCollection:textRange:
			argumentTypes: 'IDWriteFontCollection* DWRITE_TEXT_RANGE';
		defineFunction: #SetFontFamilyName:textRange:
			argumentTypes: 'word* DWRITE_TEXT_RANGE';
		defineFunction: #SetFontWeight:textRange:
			argumentTypes: 'sdword DWRITE_TEXT_RANGE';
		defineFunction: #SetFontStyle:textRange:
			argumentTypes: 'sdword DWRITE_TEXT_RANGE';
		defineFunction: #SetFontStretch:textRange:
			argumentTypes: 'sdword DWRITE_TEXT_RANGE';
		defineFunction: #SetFontSize:textRange:
			argumentTypes: 'float DWRITE_TEXT_RANGE';
		defineFunction: #SetUnderline:textRange:
			argumentTypes: 'bool DWRITE_TEXT_RANGE';
		defineFunction: #SetStrikethrough:textRange:
			argumentTypes: 'bool DWRITE_TEXT_RANGE';
		defineFunction: #SetDrawingEffect:textRange:
			argumentTypes: 'IUnknown* DWRITE_TEXT_RANGE';
		defineFunction: #SetInlineObject:textRange:
			argumentTypes: 'IDWriteInlineObject* DWRITE_TEXT_RANGE';
		defineFunction: #SetTypography:textRange:
			argumentTypes: 'IDWriteTypography* DWRITE_TEXT_RANGE';
		defineFunction: #SetLocaleName:textRange:
			argumentTypes: 'word* DWRITE_TEXT_RANGE';
		defineFunction: #GetMaxWidth
			returnType: 'float';
		defineFunction: #GetMaxHeight
			returnType: 'float';
		defineFunction: #GetFontCollection:fontCollection:textRange:
			argumentTypes: 'dword IDWriteFontCollection** DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontFamilyNameLength:nameLength:textRange:
			argumentTypes: 'dword dword* DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontFamilyName:fontFamilyName:nameSize:textRange:
			argumentTypes: 'dword word* dword DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontWeight:fontWeight:textRange:
			argumentTypes: 'dword sdword* DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontStyle:fontStyle:textRange:
			argumentTypes: 'dword sdword* DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontStretch:fontStretch:textRange:
			argumentTypes: 'dword sdword* DWRITE_TEXT_RANGE*';
		defineFunction: #GetFontSize:fontSize:textRange:
			argumentTypes: 'dword float* DWRITE_TEXT_RANGE*';
		defineFunction: #GetUnderline:hasUnderline:textRange:
			argumentTypes: 'dword bool* DWRITE_TEXT_RANGE*';
		defineFunction: #GetStrikethrough:hasStrikethrough:textRange:
			argumentTypes: 'dword bool* DWRITE_TEXT_RANGE*';
		defineFunction: #GetDrawingEffect:drawingEffect:textRange:
			argumentTypes: 'dword IUnknown** DWRITE_TEXT_RANGE*';
		defineFunction: #GetInlineObject:inlineObject:textRange:
			argumentTypes: 'dword IDWriteInlineObject** DWRITE_TEXT_RANGE*';
		defineFunction: #GetTypography:typography:textRange:
			argumentTypes: 'dword IDWriteTypography** DWRITE_TEXT_RANGE*';
		defineFunction: #GetLocaleNameLength:nameLength:textRange:
			argumentTypes: 'dword dword* DWRITE_TEXT_RANGE*';
		defineFunction: #GetLocaleName:localeName:nameSize:textRange:
			argumentTypes: 'dword word* dword DWRITE_TEXT_RANGE*';
		defineFunction: #Draw:renderer:originX:originY:
			argumentTypes: 'void* IDWriteTextRenderer* float float';
		defineFunction: #GetLineMetrics:maxLineCount:actualLineCount:
			argumentTypes: 'DWRITE_LINE_METRICS* dword dword*';
		defineFunction: #GetMetrics:
			argumentTypes: 'DWRITE_TEXT_METRICS*';
		defineFunction: #GetOverhangMetrics:
			argumentTypes: 'DWRITE_OVERHANG_METRICS*';
		defineFunction: #GetClusterMetrics:maxClusterCount:actualClusterCount:
			argumentTypes: 'DWRITE_CLUSTER_METRICS* dword dword*';
		defineFunction: #DetermineMinWidth:
			argumentTypes: 'float*';
		defineFunction: #HitTestPoint:pointY:isTrailingHit:isInside:hitTestMetrics:
			argumentTypes: 'float float bool* bool* DWRITE_HIT_TEST_METRICS*';
		defineFunction: #HitTestTextPosition:isTrailingHit:pointX:pointY:hitTestMetrics:
			argumentTypes: 'dword bool float* float* DWRITE_HIT_TEST_METRICS*';
		defineFunction: #HitTestTextRange:textLength:originX:originY:hitTestMetrics:maxHitTestMetricsCount:actualHitTestMetricsCount:
			argumentTypes: 'dword dword float float DWRITE_HIT_TEST_METRICS* dword dword*'
! !
!IDWriteTextLayout class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

