"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1StrokeStyle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1StrokeStyle guid: (IID fromString: '{2CD9069D-12E2-11DC-9FED-001143A055F9}')!
ID2D1StrokeStyle comment: '`ID2D1StrokeStyle` is a wrapper class for the COM interface ''Direct2d.ID2D1StrokeStyle'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd9069d-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1StrokeStyle : ID2D1Resource
 {
	[id(0x60020000)]
	D2D1_CAP_STYLE __stdcall GetStartCap();
	[id(0x60020001)]
	D2D1_CAP_STYLE __stdcall GetEndCap();
	[id(0x60020002)]
	D2D1_CAP_STYLE __stdcall GetDashCap();
	[id(0x60020003)]
	float __stdcall GetMiterLimit();
	[id(0x60020004)]
	D2D1_LINE_JOIN __stdcall GetLineJoin();
	[id(0x60020005)]
	float __stdcall GetDashOffset();
	[id(0x60020006)]
	D2D1_DASH_STYLE __stdcall GetDashStyle();
	[id(0x60020007)]
	unsigned int __stdcall GetDashesCount();
	[id(0x60020008)]
	void __stdcall GetDashes(
		[out]float* dashes,
		[in]unsigned int count);
};

```'!
!ID2D1StrokeStyle categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1StrokeStyle methodsFor!

getDashCap
	"Answer the <SDWORD> result of invoking the GetDashCap() method of the COM object."

	^self GetDashCap
!

GetDashCap
	"Private - Invoke the GetDashCap() method of the COM object.

		D2D1_CAP_STYLE __stdcall GetDashCap();"

	<virtual stdcall: sdword 7>
	^self invalidCall!

getDashes: count
	"Answer the <FLOAT> result of invoking the GetDashes() method of the COM object."

	| answer |
	answer := (FLOAT new).
	self
		GetDashes: answer
		count: count.
	^answer asObject
!

GetDashes: dashes count: count
	"Private - Invoke the GetDashes() method of the COM object.

		void __stdcall GetDashes(
			[out]float* dashes,
			[in]unsigned int count);"

	<virtual stdcall: void 13 float* dword>
	^self invalidCall!

getDashesCount
	"Answer the <DWORD> result of invoking the GetDashesCount() method of the COM object."

	^self GetDashesCount
!

GetDashesCount
	"Private - Invoke the GetDashesCount() method of the COM object.

		unsigned int __stdcall GetDashesCount();"

	<virtual stdcall: dword 12>
	^self invalidCall!

getDashOffset
	"Answer the <FLOAT> result of invoking the GetDashOffset() method of the COM object."

	^self GetDashOffset
!

GetDashOffset
	"Private - Invoke the GetDashOffset() method of the COM object.

		float __stdcall GetDashOffset();"

	<virtual stdcall: float 10>
	^self invalidCall!

getDashStyle
	"Answer the <SDWORD> result of invoking the GetDashStyle() method of the COM object."

	^self GetDashStyle
!

GetDashStyle
	"Private - Invoke the GetDashStyle() method of the COM object.

		D2D1_DASH_STYLE __stdcall GetDashStyle();"

	<virtual stdcall: sdword 11>
	^self invalidCall!

getEndCap
	"Answer the <SDWORD> result of invoking the GetEndCap() method of the COM object."

	^self GetEndCap
!

GetEndCap
	"Private - Invoke the GetEndCap() method of the COM object.

		D2D1_CAP_STYLE __stdcall GetEndCap();"

	<virtual stdcall: sdword 6>
	^self invalidCall!

getLineJoin
	"Answer the <SDWORD> result of invoking the GetLineJoin() method of the COM object."

	^self GetLineJoin
!

GetLineJoin
	"Private - Invoke the GetLineJoin() method of the COM object.

		D2D1_LINE_JOIN __stdcall GetLineJoin();"

	<virtual stdcall: sdword 9>
	^self invalidCall!

getMiterLimit
	"Answer the <FLOAT> result of invoking the GetMiterLimit() method of the COM object."

	^self GetMiterLimit
!

GetMiterLimit
	"Private - Invoke the GetMiterLimit() method of the COM object.

		float __stdcall GetMiterLimit();"

	<virtual stdcall: float 8>
	^self invalidCall!

getStartCap
	"Answer the <SDWORD> result of invoking the GetStartCap() method of the COM object."

	^self GetStartCap
!

GetStartCap
	"Private - Invoke the GetStartCap() method of the COM object.

		D2D1_CAP_STYLE __stdcall GetStartCap();"

	<virtual stdcall: sdword 5>
	^self invalidCall! !
!ID2D1StrokeStyle categoriesFor: #getDashCap!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetDashCap!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getDashes:!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetDashes:count:!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getDashesCount!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetDashesCount!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getDashOffset!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetDashOffset!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getDashStyle!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetDashStyle!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getEndCap!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetEndCap!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getLineJoin!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetLineJoin!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getMiterLimit!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetMiterLimit!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !
!ID2D1StrokeStyle categoriesFor: #getStartCap!**auto generated**!methods!public! !
!ID2D1StrokeStyle categoriesFor: #GetStartCap!**auto generated**!COM Interfaces-ID2D1StrokeStyle!private! !

!ID2D1StrokeStyle class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1StrokeStyle'
		ID2D1StrokeStyle defineTemplate"

	self
		defineFunction: #GetStartCap
			returnType: 'sdword';
		defineFunction: #GetEndCap
			returnType: 'sdword';
		defineFunction: #GetDashCap
			returnType: 'sdword';
		defineFunction: #GetMiterLimit
			returnType: 'float';
		defineFunction: #GetLineJoin
			returnType: 'sdword';
		defineFunction: #GetDashOffset
			returnType: 'float';
		defineFunction: #GetDashStyle
			returnType: 'sdword';
		defineFunction: #GetDashesCount
			returnType: 'dword';
		defineFunction: #GetDashes:count:
			returnType: 'void'
			argumentTypes: 'float* dword'
! !
!ID2D1StrokeStyle class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

