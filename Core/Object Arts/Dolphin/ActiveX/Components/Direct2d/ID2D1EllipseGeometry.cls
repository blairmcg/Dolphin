"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1EllipseGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1EllipseGeometry guid: (IID fromString: '{2CD906A4-12E2-11DC-9FED-001143A055F9}')!
ID2D1EllipseGeometry comment: '`ID2D1EllipseGeometry` is a wrapper class for the COM interface ''Direct2d.ID2D1EllipseGeometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a4-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1EllipseGeometry : ID2D1Geometry
 {
	[id(0x60030000)]
	void __stdcall GetEllipse(
		[out]D2D1_ELLIPSE* ellipse);
};

```'!
!ID2D1EllipseGeometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1EllipseGeometry methodsFor!

getEllipse
	"Answer the <D2D1_ELLIPSE> result of invoking the GetEllipse() method of the COM object."

	| answer |
	answer := (D2D1_ELLIPSE new).
	self GetEllipse: answer.
	^answer asObject
!

GetEllipse: ellipse
	"Private - Invoke the GetEllipse() method of the COM object.

		void __stdcall GetEllipse(
			[out]D2D1_ELLIPSE* ellipse);"

	<virtual stdcall: void 18 D2D1_ELLIPSE*>
	^self invalidCall! !
!ID2D1EllipseGeometry categoriesFor: #getEllipse!**auto generated**!methods!public! !
!ID2D1EllipseGeometry categoriesFor: #GetEllipse:!**auto generated**!COM Interfaces-ID2D1EllipseGeometry!private! !

!ID2D1EllipseGeometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1EllipseGeometry'
		ID2D1EllipseGeometry defineTemplate"

	self
		defineFunction: #GetEllipse:
			returnType: 'void'
			argumentTypes: 'D2D1_ELLIPSE*'
! !
!ID2D1EllipseGeometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

