"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteInlineObject
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteInlineObject guid: (IID fromString: '{8339FDE3-106F-47AB-8373-1C6295EB10B3}')!
IDWriteInlineObject comment: '`IDWriteInlineObject` is a wrapper class for the COM interface ''DirectWrite.IDWriteInlineObject'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteInlineObject interface wraps an application defined inline graphic, allowing DWrite to query metrics as if it was a glyph inline with the text."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(8339fde3-106f-47ab-8373-1c6295eb10b3), 
	helpstring("The IDWriteInlineObject interface wraps an application defined inline graphic, allowing DWrite to query metrics as if it was a glyph inline with the text.")
]
interface IDWriteInlineObject : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall Draw(
		[in]void* clientDrawingContext,
		[in]IDWriteTextRenderer* renderer,
		float originX,
		float originY,
		BOOL isSideways,
		BOOL isRightToLeft,
		[in]IUnknown* clientDrawingEffect);
	[id(0x60010001)]
	HRESULT __stdcall GetMetrics(
		[out]DWRITE_INLINE_OBJECT_METRICS* metrics);
	[id(0x60010002)]
	HRESULT __stdcall GetOverhangMetrics(
		[out]DWRITE_OVERHANG_METRICS* overhangs);
	[id(0x60010003)]
	HRESULT __stdcall GetBreakConditions(
		[out]DWRITE_BREAK_CONDITION* breakConditionBefore,
		[out]DWRITE_BREAK_CONDITION* breakConditionAfter);
};

```'!
!IDWriteInlineObject categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteInlineObject methodsFor!

draw: clientDrawingContext renderer: renderer originX: originX originY: originY isSideways: isSideways isRightToLeft: isRightToLeft clientDrawingEffect: clientDrawingEffect
	"Invoke the Draw() method of the COM object."

	^self
		Draw: clientDrawingContext
		renderer: renderer
		originX: originX
		originY: originY
		isSideways: isSideways
		isRightToLeft: isRightToLeft
		clientDrawingEffect: clientDrawingEffect
!

Draw: clientDrawingContext renderer: renderer originX: originX originY: originY isSideways: isSideways isRightToLeft: isRightToLeft clientDrawingEffect: clientDrawingEffect
	"Private - Invoke the Draw() method of the COM object.

		HRESULT __stdcall Draw(
			[in]void* clientDrawingContext,
			[in]IDWriteTextRenderer* renderer,
			float originX,
			float originY,
			BOOL isSideways,
			BOOL isRightToLeft,
			[in]IUnknown* clientDrawingEffect);"

	<virtual stdcall: hresult 4 void* IDWriteTextRenderer* float float bool bool IUnknown*>
	^self invalidCall!

getBreakConditions
	"Invoke the GetBreakConditions() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (SDWORD new);
				basicAt: 2 put: (SDWORD new);
				yourself.
	self
		GetBreakConditions: (answer basicAt: 1)
		breakConditionAfter: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetBreakConditions: breakConditionBefore breakConditionAfter: breakConditionAfter
	"Private - Invoke the GetBreakConditions() method of the COM object.

		HRESULT __stdcall GetBreakConditions(
			[out]DWRITE_BREAK_CONDITION* breakConditionBefore,
			[out]DWRITE_BREAK_CONDITION* breakConditionAfter);"

	<virtual stdcall: hresult 7 sdword* sdword*>
	^self invalidCall!

getMetrics
	"Answer the <DWRITE_INLINE_OBJECT_METRICS> result of invoking the GetMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_INLINE_OBJECT_METRICS new).
	self GetMetrics: answer.
	^answer asObject
!

GetMetrics: metrics
	"Private - Invoke the GetMetrics() method of the COM object.

		HRESULT __stdcall GetMetrics(
			[out]DWRITE_INLINE_OBJECT_METRICS* metrics);"

	<virtual stdcall: hresult 5 DWRITE_INLINE_OBJECT_METRICS*>
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

	<virtual stdcall: hresult 6 DWRITE_OVERHANG_METRICS*>
	^self invalidCall! !
!IDWriteInlineObject categoriesFor: #draw:renderer:originX:originY:isSideways:isRightToLeft:clientDrawingEffect:!**auto generated**!methods!public! !
!IDWriteInlineObject categoriesFor: #Draw:renderer:originX:originY:isSideways:isRightToLeft:clientDrawingEffect:!**auto generated**!COM Interfaces-IDWriteInlineObject!private! !
!IDWriteInlineObject categoriesFor: #getBreakConditions!**auto generated**!methods!public! !
!IDWriteInlineObject categoriesFor: #GetBreakConditions:breakConditionAfter:!**auto generated**!COM Interfaces-IDWriteInlineObject!private! !
!IDWriteInlineObject categoriesFor: #getMetrics!**auto generated**!methods!public! !
!IDWriteInlineObject categoriesFor: #GetMetrics:!**auto generated**!COM Interfaces-IDWriteInlineObject!private! !
!IDWriteInlineObject categoriesFor: #getOverhangMetrics!**auto generated**!methods!public! !
!IDWriteInlineObject categoriesFor: #GetOverhangMetrics:!**auto generated**!COM Interfaces-IDWriteInlineObject!private! !

!IDWriteInlineObject class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteInlineObject'
		IDWriteInlineObject defineTemplate"

	self
		defineFunction: #Draw:renderer:originX:originY:isSideways:isRightToLeft:clientDrawingEffect:
			argumentTypes: 'void* IDWriteTextRenderer* float float bool bool IUnknown*';
		defineFunction: #GetMetrics:
			argumentTypes: 'DWRITE_INLINE_OBJECT_METRICS*';
		defineFunction: #GetOverhangMetrics:
			argumentTypes: 'DWRITE_OVERHANG_METRICS*';
		defineFunction: #GetBreakConditions:breakConditionAfter:
			argumentTypes: 'sdword* sdword*'
! !
!IDWriteInlineObject class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

