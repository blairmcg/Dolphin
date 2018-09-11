"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1RectangleGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1RectangleGeometry guid: (IID fromString: '{2CD906A2-12E2-11DC-9FED-001143A055F9}')!
ID2D1RectangleGeometry comment: '`ID2D1RectangleGeometry` is a wrapper class for the COM interface ''Direct2d.ID2D1RectangleGeometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a2-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1RectangleGeometry : ID2D1Geometry
 {
	[id(0x60030000)]
	void __stdcall GetRect(
		[out]D2D_RECT_F* rect);
};

```'!
!ID2D1RectangleGeometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1RectangleGeometry methodsFor!

getRect
	"Answer the <D2D_RECT_F> result of invoking the GetRect() method of the COM object."

	| answer |
	answer := (D2D_RECT_F new).
	self GetRect: answer.
	^answer asObject
!

GetRect: rect
	"Private - Invoke the GetRect() method of the COM object.

		void __stdcall GetRect(
			[out]D2D_RECT_F* rect);"

	<virtual stdcall: void 18 D2D_RECT_F*>
	^self invalidCall! !
!ID2D1RectangleGeometry categoriesFor: #getRect!**auto generated**!methods!public! !
!ID2D1RectangleGeometry categoriesFor: #GetRect:!**auto generated**!COM Interfaces-ID2D1RectangleGeometry!private! !

!ID2D1RectangleGeometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1RectangleGeometry'
		ID2D1RectangleGeometry defineTemplate"

	self
		defineFunction: #GetRect:
			returnType: 'void'
			argumentTypes: 'D2D_RECT_F*'
! !
!ID2D1RectangleGeometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

