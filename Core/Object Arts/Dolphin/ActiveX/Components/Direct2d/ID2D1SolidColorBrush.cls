"Filed out from Dolphin Smalltalk 7"!

ID2D1Brush subclass: #ID2D1SolidColorBrush
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1SolidColorBrush guid: (IID fromString: '{2CD906A9-12E2-11DC-9FED-001143A055F9}')!
ID2D1SolidColorBrush comment: '`ID2D1SolidColorBrush` is a wrapper class for the COM interface ''Direct2d.ID2D1SolidColorBrush'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a9-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1SolidColorBrush : ID2D1Brush
 {
	[id(0x60030000)]
	void __stdcall SetColor(
		[in]D3DCOLORVALUE* color);
	[id(0x60030001)]
	D3DCOLORVALUE __stdcall GetColor();
};

```'!
!ID2D1SolidColorBrush categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1SolidColorBrush methodsFor!

getColor
	"Answer the <D3DCOLORVALUE> result of invoking the GetColor() method of the COM object."

	^self GetColor
!

GetColor
	"Private - Invoke the GetColor() method of the COM object.

		D3DCOLORVALUE __stdcall GetColor();"

	<virtual stdcall: D3DCOLORVALUE 10>
	^self invalidCall!

setColor: color
	"Answer the <VOID> result of invoking the SetColor() method of the COM object."

	self SetColor: color
!

SetColor: color
	"Private - Invoke the SetColor() method of the COM object.

		void __stdcall SetColor(
			[in]D3DCOLORVALUE* color);"

	<virtual stdcall: void 9 D3DCOLORVALUE*>
	^self invalidCall! !
!ID2D1SolidColorBrush categoriesFor: #getColor!**auto generated**!methods!public! !
!ID2D1SolidColorBrush categoriesFor: #GetColor!**auto generated**!COM Interfaces-ID2D1SolidColorBrush!private! !
!ID2D1SolidColorBrush categoriesFor: #setColor:!**auto generated**!methods!public! !
!ID2D1SolidColorBrush categoriesFor: #SetColor:!**auto generated**!COM Interfaces-ID2D1SolidColorBrush!private! !

!ID2D1SolidColorBrush class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1SolidColorBrush'
		ID2D1SolidColorBrush defineTemplate"

	self
		defineFunction: #SetColor:
			returnType: 'void'
			argumentTypes: 'D3DCOLORVALUE*';
		defineFunction: #GetColor
			returnType: 'D3DCOLORVALUE'
! !
!ID2D1SolidColorBrush class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

