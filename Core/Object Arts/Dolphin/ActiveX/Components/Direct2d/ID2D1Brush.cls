"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1Brush
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Brush guid: (IID fromString: '{2CD906A8-12E2-11DC-9FED-001143A055F9}')!
ID2D1Brush comment: '`ID2D1Brush` is a wrapper class for the COM interface ''Direct2d.ID2D1Brush'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a8-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1Brush : ID2D1Resource
 {
	[id(0x60020000)]
	void __stdcall SetOpacity(
		[in]float opacity);
	[id(0x60020001)]
	void __stdcall SetTransform(
		[in]D2D_MATRIX_3X2_F* transform);
	[id(0x60020002)]
	float __stdcall GetOpacity();
	[id(0x60020003)]
	void __stdcall GetTransform(
		[out]D2D_MATRIX_3X2_F* transform);
};

```'!
!ID2D1Brush categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Brush methodsFor!

getOpacity
	"Answer the <FLOAT> result of invoking the GetOpacity() method of the COM object."

	^self GetOpacity
!

GetOpacity
	"Private - Invoke the GetOpacity() method of the COM object.

		float __stdcall GetOpacity();"

	<virtual stdcall: float 7>
	^self invalidCall!

getTransform
	"Answer the <D2D_MATRIX_3X2_F> result of invoking the GetTransform() method of the COM object."

	| answer |
	answer := (D2D_MATRIX_3X2_F new).
	self GetTransform: answer.
	^answer asObject
!

GetTransform: transform
	"Private - Invoke the GetTransform() method of the COM object.

		void __stdcall GetTransform(
			[out]D2D_MATRIX_3X2_F* transform);"

	<virtual stdcall: void 8 D2D_MATRIX_3X2_F*>
	^self invalidCall!

setOpacity: opacity
	"Answer the <VOID> result of invoking the SetOpacity() method of the COM object."

	self SetOpacity: opacity
!

SetOpacity: opacity
	"Private - Invoke the SetOpacity() method of the COM object.

		void __stdcall SetOpacity(
			[in]float opacity);"

	<virtual stdcall: void 5 float>
	^self invalidCall!

setTransform: transform
	"Answer the <VOID> result of invoking the SetTransform() method of the COM object."

	self SetTransform: transform
!

SetTransform: transform
	"Private - Invoke the SetTransform() method of the COM object.

		void __stdcall SetTransform(
			[in]D2D_MATRIX_3X2_F* transform);"

	<virtual stdcall: void 6 D2D_MATRIX_3X2_F*>
	^self invalidCall! !
!ID2D1Brush categoriesFor: #getOpacity!**auto generated**!methods!public! !
!ID2D1Brush categoriesFor: #GetOpacity!**auto generated**!COM Interfaces-ID2D1Brush!private! !
!ID2D1Brush categoriesFor: #getTransform!**auto generated**!methods!public! !
!ID2D1Brush categoriesFor: #GetTransform:!**auto generated**!COM Interfaces-ID2D1Brush!private! !
!ID2D1Brush categoriesFor: #setOpacity:!**auto generated**!methods!public! !
!ID2D1Brush categoriesFor: #SetOpacity:!**auto generated**!COM Interfaces-ID2D1Brush!private! !
!ID2D1Brush categoriesFor: #setTransform:!**auto generated**!methods!public! !
!ID2D1Brush categoriesFor: #SetTransform:!**auto generated**!COM Interfaces-ID2D1Brush!private! !

!ID2D1Brush class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Brush'
		ID2D1Brush defineTemplate"

	self
		defineFunction: #SetOpacity:
			returnType: 'void'
			argumentTypes: 'float';
		defineFunction: #SetTransform:
			returnType: 'void'
			argumentTypes: 'D2D_MATRIX_3X2_F*';
		defineFunction: #GetOpacity
			returnType: 'float';
		defineFunction: #GetTransform:
			returnType: 'void'
			argumentTypes: 'D2D_MATRIX_3X2_F*'
! !
!ID2D1Brush class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

