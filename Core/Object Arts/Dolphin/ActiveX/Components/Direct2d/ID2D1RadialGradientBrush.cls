"Filed out from Dolphin Smalltalk 7"!

ID2D1Brush subclass: #ID2D1RadialGradientBrush
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1RadialGradientBrush guid: (IID fromString: '{2CD906AC-12E2-11DC-9FED-001143A055F9}')!
ID2D1RadialGradientBrush comment: '`ID2D1RadialGradientBrush` is a wrapper class for the COM interface ''Direct2d.ID2D1RadialGradientBrush'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906ac-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1RadialGradientBrush : ID2D1Brush
 {
	[id(0x60030000)]
	void __stdcall SetCenter(
		[in]D2D_POINT_2F center);
	[id(0x60030001)]
	void __stdcall SetGradientOriginOffset(
		[in]D2D_POINT_2F Offset);
	[id(0x60030002)]
	void __stdcall SetRadiusX(
		[in]float radius);
	[id(0x60030003)]
	void __stdcall SetRadiusY(
		[in]float radius);
	[id(0x60030004)]
	D2D_POINT_2F __stdcall GetCenter();
	[id(0x60030005)]
	D2D_POINT_2F __stdcall GetGradientOriginOffset();
	[id(0x60030006)]
	float __stdcall GetRadiusX();
	[id(0x60030007)]
	float __stdcall GetRadiusY();
	[id(0x60030008)]
	void __stdcall GetGradientStopCollection(
		[out]ID2D1GradientStopCollection** gradient);
};

```'!
!ID2D1RadialGradientBrush categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1RadialGradientBrush methodsFor!

getCenter
	"Answer the <D2D_POINT_2F> result of invoking the GetCenter() method of the COM object."

	^self GetCenter
!

GetCenter
	"Private - Invoke the GetCenter() method of the COM object.

		D2D_POINT_2F __stdcall GetCenter();"

	<virtual stdcall: D2D_POINT_2F 13>
	^self invalidCall!

getGradientOriginOffset
	"Answer the <D2D_POINT_2F> result of invoking the GetGradientOriginOffset() method of the COM object."

	^self GetGradientOriginOffset
!

GetGradientOriginOffset
	"Private - Invoke the GetGradientOriginOffset() method of the COM object.

		D2D_POINT_2F __stdcall GetGradientOriginOffset();"

	<virtual stdcall: D2D_POINT_2F 14>
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

	<virtual stdcall: void 17 ID2D1GradientStopCollection**>
	^self invalidCall!

getRadiusX
	"Answer the <FLOAT> result of invoking the GetRadiusX() method of the COM object."

	^self GetRadiusX
!

GetRadiusX
	"Private - Invoke the GetRadiusX() method of the COM object.

		float __stdcall GetRadiusX();"

	<virtual stdcall: float 15>
	^self invalidCall!

getRadiusY
	"Answer the <FLOAT> result of invoking the GetRadiusY() method of the COM object."

	^self GetRadiusY
!

GetRadiusY
	"Private - Invoke the GetRadiusY() method of the COM object.

		float __stdcall GetRadiusY();"

	<virtual stdcall: float 16>
	^self invalidCall!

setCenter: center
	"Answer the <VOID> result of invoking the SetCenter() method of the COM object."

	self SetCenter: center
!

SetCenter: center
	"Private - Invoke the SetCenter() method of the COM object.

		void __stdcall SetCenter(
			[in]D2D_POINT_2F center);"

	<virtual stdcall: void 9 D2D_POINT_2F>
	^self invalidCall!

setGradientOriginOffset: offset
	"Answer the <VOID> result of invoking the SetGradientOriginOffset() method of the COM object."

	self SetGradientOriginOffset: offset
!

SetGradientOriginOffset: offset
	"Private - Invoke the SetGradientOriginOffset() method of the COM object.

		void __stdcall SetGradientOriginOffset(
			[in]D2D_POINT_2F Offset);"

	<virtual stdcall: void 10 D2D_POINT_2F>
	^self invalidCall!

setRadiusX: radius
	"Answer the <VOID> result of invoking the SetRadiusX() method of the COM object."

	self SetRadiusX: radius
!

SetRadiusX: radius
	"Private - Invoke the SetRadiusX() method of the COM object.

		void __stdcall SetRadiusX(
			[in]float radius);"

	<virtual stdcall: void 11 float>
	^self invalidCall!

setRadiusY: radius
	"Answer the <VOID> result of invoking the SetRadiusY() method of the COM object."

	self SetRadiusY: radius
!

SetRadiusY: radius
	"Private - Invoke the SetRadiusY() method of the COM object.

		void __stdcall SetRadiusY(
			[in]float radius);"

	<virtual stdcall: void 12 float>
	^self invalidCall! !
!ID2D1RadialGradientBrush categoriesFor: #getCenter!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #GetCenter!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #getGradientOriginOffset!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #GetGradientOriginOffset!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #getGradientStopCollection!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #GetGradientStopCollection:!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #getRadiusX!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #GetRadiusX!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #getRadiusY!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #GetRadiusY!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #setCenter:!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #SetCenter:!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #setGradientOriginOffset:!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #SetGradientOriginOffset:!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #setRadiusX:!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #SetRadiusX:!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !
!ID2D1RadialGradientBrush categoriesFor: #setRadiusY:!**auto generated**!methods!public! !
!ID2D1RadialGradientBrush categoriesFor: #SetRadiusY:!**auto generated**!COM Interfaces-ID2D1RadialGradientBrush!private! !

!ID2D1RadialGradientBrush class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1RadialGradientBrush'
		ID2D1RadialGradientBrush defineTemplate"

	self
		defineFunction: #SetCenter:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F';
		defineFunction: #SetGradientOriginOffset:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F';
		defineFunction: #SetRadiusX:
			returnType: 'void'
			argumentTypes: 'float';
		defineFunction: #SetRadiusY:
			returnType: 'void'
			argumentTypes: 'float';
		defineFunction: #GetCenter
			returnType: 'D2D_POINT_2F';
		defineFunction: #GetGradientOriginOffset
			returnType: 'D2D_POINT_2F';
		defineFunction: #GetRadiusX
			returnType: 'float';
		defineFunction: #GetRadiusY
			returnType: 'float';
		defineFunction: #GetGradientStopCollection:
			returnType: 'void'
			argumentTypes: 'ID2D1GradientStopCollection**'
! !
!ID2D1RadialGradientBrush class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

