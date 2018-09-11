"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1GradientStopCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1GradientStopCollection guid: (IID fromString: '{2CD906A7-12E2-11DC-9FED-001143A055F9}')!
ID2D1GradientStopCollection comment: '`ID2D1GradientStopCollection` is a wrapper class for the COM interface ''Direct2d.ID2D1GradientStopCollection'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a7-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1GradientStopCollection : ID2D1Resource
 {
	[id(0x60020000)]
	unsigned int __stdcall GetGradientStopCount();
	[id(0x60020001)]
	void __stdcall GetGradientStops(
		[out]D2D1_GRADIENT_STOP* stops,
		[in]unsigned int stop_count);
	[id(0x60020002)]
	D2D1_GAMMA __stdcall GetColorInterpolationGamma();
	[id(0x60020003)]
	D2D1_EXTEND_MODE __stdcall GetExtendMode();
};

```'!
!ID2D1GradientStopCollection categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1GradientStopCollection methodsFor!

getColorInterpolationGamma
	"Answer the <SDWORD> result of invoking the GetColorInterpolationGamma() method of the COM object."

	^self GetColorInterpolationGamma
!

GetColorInterpolationGamma
	"Private - Invoke the GetColorInterpolationGamma() method of the COM object.

		D2D1_GAMMA __stdcall GetColorInterpolationGamma();"

	<virtual stdcall: sdword 7>
	^self invalidCall!

getExtendMode
	"Answer the <SDWORD> result of invoking the GetExtendMode() method of the COM object."

	^self GetExtendMode
!

GetExtendMode
	"Private - Invoke the GetExtendMode() method of the COM object.

		D2D1_EXTEND_MODE __stdcall GetExtendMode();"

	<virtual stdcall: sdword 8>
	^self invalidCall!

getGradientStopCount
	"Answer the <DWORD> result of invoking the GetGradientStopCount() method of the COM object."

	^self GetGradientStopCount
!

GetGradientStopCount
	"Private - Invoke the GetGradientStopCount() method of the COM object.

		unsigned int __stdcall GetGradientStopCount();"

	<virtual stdcall: dword 5>
	^self invalidCall!

getGradientStops: stop_count
	"Answer the <D2D1_GRADIENT_STOP> result of invoking the GetGradientStops() method of the COM object."

	| answer |
	answer := (D2D1_GRADIENT_STOP new).
	self
		GetGradientStops: answer
		stop_count: stop_count.
	^answer asObject
!

GetGradientStops: stops stop_count: stop_count
	"Private - Invoke the GetGradientStops() method of the COM object.

		void __stdcall GetGradientStops(
			[out]D2D1_GRADIENT_STOP* stops,
			[in]unsigned int stop_count);"

	<virtual stdcall: void 6 D2D1_GRADIENT_STOP* dword>
	^self invalidCall! !
!ID2D1GradientStopCollection categoriesFor: #getColorInterpolationGamma!**auto generated**!methods!public! !
!ID2D1GradientStopCollection categoriesFor: #GetColorInterpolationGamma!**auto generated**!COM Interfaces-ID2D1GradientStopCollection!private! !
!ID2D1GradientStopCollection categoriesFor: #getExtendMode!**auto generated**!methods!public! !
!ID2D1GradientStopCollection categoriesFor: #GetExtendMode!**auto generated**!COM Interfaces-ID2D1GradientStopCollection!private! !
!ID2D1GradientStopCollection categoriesFor: #getGradientStopCount!**auto generated**!methods!public! !
!ID2D1GradientStopCollection categoriesFor: #GetGradientStopCount!**auto generated**!COM Interfaces-ID2D1GradientStopCollection!private! !
!ID2D1GradientStopCollection categoriesFor: #getGradientStops:!**auto generated**!methods!public! !
!ID2D1GradientStopCollection categoriesFor: #GetGradientStops:stop_count:!**auto generated**!COM Interfaces-ID2D1GradientStopCollection!private! !

!ID2D1GradientStopCollection class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1GradientStopCollection'
		ID2D1GradientStopCollection defineTemplate"

	self
		defineFunction: #GetGradientStopCount
			returnType: 'dword';
		defineFunction: #GetGradientStops:stop_count:
			returnType: 'void'
			argumentTypes: 'D2D1_GRADIENT_STOP* dword';
		defineFunction: #GetColorInterpolationGamma
			returnType: 'sdword';
		defineFunction: #GetExtendMode
			returnType: 'sdword'
! !
!ID2D1GradientStopCollection class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

