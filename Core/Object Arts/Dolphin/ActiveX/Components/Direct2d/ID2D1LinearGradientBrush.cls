"Filed out from Dolphin Smalltalk 7"!

ID2D1Brush subclass: #ID2D1LinearGradientBrush
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1LinearGradientBrush guid: (IID fromString: '{2CD906AB-12E2-11DC-9FED-001143A055F9}')!
ID2D1LinearGradientBrush comment: '`ID2D1LinearGradientBrush` is a wrapper class for the COM interface ''Direct2d.ID2D1LinearGradientBrush'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906ab-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1LinearGradientBrush : ID2D1Brush
 {
	[id(0x60030000)]
	void __stdcall SetStartPoint(
		[in]D2D_POINT_2F start_point);
	[id(0x60030001)]
	void __stdcall SetEndPoint(
		[in]D2D_POINT_2F end_point);
	[id(0x60030002)]
	D2D_POINT_2F __stdcall GetStartPoint();
	[id(0x60030003)]
	D2D_POINT_2F __stdcall GetEndPoint();
	[id(0x60030004)]
	void __stdcall GetGradientStopCollection(
		[out]ID2D1GradientStopCollection** gradient);
};

```'!
!ID2D1LinearGradientBrush categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1LinearGradientBrush methodsFor!

getEndPoint
	"Answer the <D2D_POINT_2F> result of invoking the GetEndPoint() method of the COM object."

	^self GetEndPoint
!

GetEndPoint
	"Private - Invoke the GetEndPoint() method of the COM object.

		D2D_POINT_2F __stdcall GetEndPoint();"

	<virtual stdcall: D2D_POINT_2F 12>
	^self invalidCall!

getGradientStopCollection
	"Answer the <ID2D1GradientStopCollection> result of invoking the GetGradientStopCollection() method of the COM object."

	| answer |
	answer := ID2D1GradientStopCollection newPointer.
	self GetGradientStopCollection: answer.
	^answer asObject
!

GetGradientStopCollection: gradient
	"Private - Invoke the GetGradientStopCollection() method of the COM object.

		void __stdcall GetGradientStopCollection(
			[out]ID2D1GradientStopCollection** gradient);"

	<virtual stdcall: void 13 ID2D1GradientStopCollection**>
	^self invalidCall!

getStartPoint
	"Answer the <D2D_POINT_2F> result of invoking the GetStartPoint() method of the COM object."

	^self GetStartPoint
!

GetStartPoint
	"Private - Invoke the GetStartPoint() method of the COM object.

		D2D_POINT_2F __stdcall GetStartPoint();"

	<virtual stdcall: D2D_POINT_2F 11>
	^self invalidCall!

setEndPoint: end_point
	"Answer the <VOID> result of invoking the SetEndPoint() method of the COM object."

	self SetEndPoint: end_point
!

SetEndPoint: end_point
	"Private - Invoke the SetEndPoint() method of the COM object.

		void __stdcall SetEndPoint(
			[in]D2D_POINT_2F end_point);"

	<virtual stdcall: void 10 D2D_POINT_2F>
	^self invalidCall!

setStartPoint: start_point
	"Answer the <VOID> result of invoking the SetStartPoint() method of the COM object."

	self SetStartPoint: start_point
!

SetStartPoint: start_point
	"Private - Invoke the SetStartPoint() method of the COM object.

		void __stdcall SetStartPoint(
			[in]D2D_POINT_2F start_point);"

	<virtual stdcall: void 9 D2D_POINT_2F>
	^self invalidCall! !
!ID2D1LinearGradientBrush categoriesFor: #getEndPoint!**auto generated**!methods!public! !
!ID2D1LinearGradientBrush categoriesFor: #GetEndPoint!**auto generated**!COM Interfaces-ID2D1LinearGradientBrush!private! !
!ID2D1LinearGradientBrush categoriesFor: #getGradientStopCollection!**auto generated**!methods!public! !
!ID2D1LinearGradientBrush categoriesFor: #GetGradientStopCollection:!**auto generated**!COM Interfaces-ID2D1LinearGradientBrush!private! !
!ID2D1LinearGradientBrush categoriesFor: #getStartPoint!**auto generated**!methods!public! !
!ID2D1LinearGradientBrush categoriesFor: #GetStartPoint!**auto generated**!COM Interfaces-ID2D1LinearGradientBrush!private! !
!ID2D1LinearGradientBrush categoriesFor: #setEndPoint:!**auto generated**!methods!public! !
!ID2D1LinearGradientBrush categoriesFor: #SetEndPoint:!**auto generated**!COM Interfaces-ID2D1LinearGradientBrush!private! !
!ID2D1LinearGradientBrush categoriesFor: #setStartPoint:!**auto generated**!methods!public! !
!ID2D1LinearGradientBrush categoriesFor: #SetStartPoint:!**auto generated**!COM Interfaces-ID2D1LinearGradientBrush!private! !

!ID2D1LinearGradientBrush class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1LinearGradientBrush'
		ID2D1LinearGradientBrush defineTemplate"

	self
		defineFunction: #SetStartPoint:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F';
		defineFunction: #SetEndPoint:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F';
		defineFunction: #GetStartPoint
			returnType: 'D2D_POINT_2F';
		defineFunction: #GetEndPoint
			returnType: 'D2D_POINT_2F';
		defineFunction: #GetGradientStopCollection:
			returnType: 'void'
			argumentTypes: 'ID2D1GradientStopCollection**'
! !
!ID2D1LinearGradientBrush class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

