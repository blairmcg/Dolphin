"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1RoundedRectangleGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1RoundedRectangleGeometry guid: (IID fromString: '{2CD906A3-12E2-11DC-9FED-001143A055F9}')!
ID2D1RoundedRectangleGeometry comment: '`ID2D1RoundedRectangleGeometry` is a wrapper class for the COM interface ''Direct2d.ID2D1RoundedRectangleGeometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a3-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1RoundedRectangleGeometry : ID2D1Geometry
 {
	[id(0x60030000)]
	void __stdcall GetRoundedRect(
		[out]D2D1_ROUNDED_RECT* rect);
};

```'!
!ID2D1RoundedRectangleGeometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1RoundedRectangleGeometry methodsFor!

getRoundedRect
	"Answer the <D2D1_ROUNDED_RECT> result of invoking the GetRoundedRect() method of the COM object."

	| answer |
	answer := (D2D1_ROUNDED_RECT new).
	self GetRoundedRect: answer.
	^answer asObject
!

GetRoundedRect: rect
	"Private - Invoke the GetRoundedRect() method of the COM object.

		void __stdcall GetRoundedRect(
			[out]D2D1_ROUNDED_RECT* rect);"

	<virtual stdcall: void 18 D2D1_ROUNDED_RECT*>
	^self invalidCall! !
!ID2D1RoundedRectangleGeometry categoriesFor: #getRoundedRect!**auto generated**!methods!public! !
!ID2D1RoundedRectangleGeometry categoriesFor: #GetRoundedRect:!**auto generated**!COM Interfaces-ID2D1RoundedRectangleGeometry!private! !

!ID2D1RoundedRectangleGeometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1RoundedRectangleGeometry'
		ID2D1RoundedRectangleGeometry defineTemplate"

	self
		defineFunction: #GetRoundedRect:
			returnType: 'void'
			argumentTypes: 'D2D1_ROUNDED_RECT*'
! !
!ID2D1RoundedRectangleGeometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

