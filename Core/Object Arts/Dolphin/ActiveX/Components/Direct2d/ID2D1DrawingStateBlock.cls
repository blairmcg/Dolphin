"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1DrawingStateBlock
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1DrawingStateBlock guid: (IID fromString: '{28506E39-EBF6-46A1-BB47-FD85565AB957}')!
ID2D1DrawingStateBlock comment: '`ID2D1DrawingStateBlock` is a wrapper class for the COM interface ''Direct2d.ID2D1DrawingStateBlock'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(28506e39-ebf6-46a1-bb47-fd85565ab957)
]
interface ID2D1DrawingStateBlock : ID2D1Resource
 {
	[id(0x60020000)]
	void __stdcall GetDescription(
		[out]D2D1_DRAWING_STATE_DESCRIPTION* desc);
	[id(0x60020001)]
	void __stdcall SetDescription(
		[in]D2D1_DRAWING_STATE_DESCRIPTION* desc);
	[id(0x60020002)]
	void __stdcall SetTextRenderingParams(
		[in]IDWriteRenderingParams* text_rendering_params);
	[id(0x60020003)]
	void __stdcall GetTextRenderingParams(
		[out]IDWriteRenderingParams** text_rendering_params);
};

```'!
!ID2D1DrawingStateBlock categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1DrawingStateBlock methodsFor!

getDescription
	"Answer the <D2D1_DRAWING_STATE_DESCRIPTION> result of invoking the GetDescription() method of the COM object."

	| answer |
	answer := (D2D1_DRAWING_STATE_DESCRIPTION new).
	self GetDescription: answer.
	^answer asObject
!

GetDescription: desc
	"Private - Invoke the GetDescription() method of the COM object.

		void __stdcall GetDescription(
			[out]D2D1_DRAWING_STATE_DESCRIPTION* desc);"

	<virtual stdcall: void 5 D2D1_DRAWING_STATE_DESCRIPTION*>
	^self invalidCall!

getTextRenderingParams
	"Answer the <IDWriteRenderingParams> result of invoking the GetTextRenderingParams() method of the COM object."

	| answer |
	answer := IDWriteRenderingParams newPointer.
	self GetTextRenderingParams: answer.
	^answer asObject
!

GetTextRenderingParams: text_rendering_params
	"Private - Invoke the GetTextRenderingParams() method of the COM object.

		void __stdcall GetTextRenderingParams(
			[out]IDWriteRenderingParams** text_rendering_params);"

	<virtual stdcall: void 8 IDWriteRenderingParams**>
	^self invalidCall!

setDescription: desc
	"Answer the <VOID> result of invoking the SetDescription() method of the COM object."

	self SetDescription: desc
!

SetDescription: desc
	"Private - Invoke the SetDescription() method of the COM object.

		void __stdcall SetDescription(
			[in]D2D1_DRAWING_STATE_DESCRIPTION* desc);"

	<virtual stdcall: void 6 D2D1_DRAWING_STATE_DESCRIPTION*>
	^self invalidCall!

setTextRenderingParams: text_rendering_params
	"Answer the <VOID> result of invoking the SetTextRenderingParams() method of the COM object."

	self SetTextRenderingParams: text_rendering_params
!

SetTextRenderingParams: text_rendering_params
	"Private - Invoke the SetTextRenderingParams() method of the COM object.

		void __stdcall SetTextRenderingParams(
			[in]IDWriteRenderingParams* text_rendering_params);"

	<virtual stdcall: void 7 IDWriteRenderingParams*>
	^self invalidCall! !
!ID2D1DrawingStateBlock categoriesFor: #getDescription!**auto generated**!methods!public! !
!ID2D1DrawingStateBlock categoriesFor: #GetDescription:!**auto generated**!COM Interfaces-ID2D1DrawingStateBlock!private! !
!ID2D1DrawingStateBlock categoriesFor: #getTextRenderingParams!**auto generated**!methods!public! !
!ID2D1DrawingStateBlock categoriesFor: #GetTextRenderingParams:!**auto generated**!COM Interfaces-ID2D1DrawingStateBlock!private! !
!ID2D1DrawingStateBlock categoriesFor: #setDescription:!**auto generated**!methods!public! !
!ID2D1DrawingStateBlock categoriesFor: #SetDescription:!**auto generated**!COM Interfaces-ID2D1DrawingStateBlock!private! !
!ID2D1DrawingStateBlock categoriesFor: #setTextRenderingParams:!**auto generated**!methods!public! !
!ID2D1DrawingStateBlock categoriesFor: #SetTextRenderingParams:!**auto generated**!COM Interfaces-ID2D1DrawingStateBlock!private! !

!ID2D1DrawingStateBlock class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1DrawingStateBlock'
		ID2D1DrawingStateBlock defineTemplate"

	self
		defineFunction: #GetDescription:
			returnType: 'void'
			argumentTypes: 'D2D1_DRAWING_STATE_DESCRIPTION*';
		defineFunction: #SetDescription:
			returnType: 'void'
			argumentTypes: 'D2D1_DRAWING_STATE_DESCRIPTION*';
		defineFunction: #SetTextRenderingParams:
			returnType: 'void'
			argumentTypes: 'IDWriteRenderingParams*';
		defineFunction: #GetTextRenderingParams:
			returnType: 'void'
			argumentTypes: 'IDWriteRenderingParams**'
! !
!ID2D1DrawingStateBlock class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

