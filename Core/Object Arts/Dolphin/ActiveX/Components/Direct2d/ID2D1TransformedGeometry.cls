"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1TransformedGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1TransformedGeometry guid: (IID fromString: '{2CD906BB-12E2-11DC-9FED-001143A055F9}')!
ID2D1TransformedGeometry comment: '`ID2D1TransformedGeometry` is a wrapper class for the COM interface ''Direct2d.ID2D1TransformedGeometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906bb-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1TransformedGeometry : ID2D1Geometry
 {
	[id(0x60030000)]
	void __stdcall GetSourceGeometry(
		[out]ID2D1Geometry** geometry);
	[id(0x60030001)]
	void __stdcall GetTransform(
		[out]D2D_MATRIX_3X2_F* transform);
};

```'!
!ID2D1TransformedGeometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1TransformedGeometry methodsFor!

getSourceGeometry
	"Answer the <ID2D1Geometry> result of invoking the GetSourceGeometry() method of the COM object."

	| answer |
	answer := ID2D1Geometry newPointer.
	self GetSourceGeometry: answer.
	^answer asObject
!

GetSourceGeometry: geometry
	"Private - Invoke the GetSourceGeometry() method of the COM object.

		void __stdcall GetSourceGeometry(
			[out]ID2D1Geometry** geometry);"

	<virtual stdcall: void 18 ID2D1Geometry**>
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

	<virtual stdcall: void 19 D2D_MATRIX_3X2_F*>
	^self invalidCall! !
!ID2D1TransformedGeometry categoriesFor: #getSourceGeometry!**auto generated**!methods!public! !
!ID2D1TransformedGeometry categoriesFor: #GetSourceGeometry:!**auto generated**!COM Interfaces-ID2D1TransformedGeometry!private! !
!ID2D1TransformedGeometry categoriesFor: #getTransform!**auto generated**!methods!public! !
!ID2D1TransformedGeometry categoriesFor: #GetTransform:!**auto generated**!COM Interfaces-ID2D1TransformedGeometry!private! !

!ID2D1TransformedGeometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1TransformedGeometry'
		ID2D1TransformedGeometry defineTemplate"

	self
		defineFunction: #GetSourceGeometry:
			returnType: 'void'
			argumentTypes: 'ID2D1Geometry**';
		defineFunction: #GetTransform:
			returnType: 'void'
			argumentTypes: 'D2D_MATRIX_3X2_F*'
! !
!ID2D1TransformedGeometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

