"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ID2D1SimplifiedGeometrySink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1SimplifiedGeometrySink guid: (IID fromString: '{2CD9069E-12E2-11DC-9FED-001143A055F9}')!
ID2D1SimplifiedGeometrySink comment: '`ID2D1SimplifiedGeometrySink` is a wrapper class for the COM interface ''Direct2d.ID2D1SimplifiedGeometrySink'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd9069e-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1SimplifiedGeometrySink : IUnknown
 {
	[id(0x60010000)]
	void __stdcall SetFillMode(
		D2D1_FILL_MODE mode);
	[id(0x60010001)]
	void __stdcall SetSegmentFlags(
		D2D1_PATH_SEGMENT vertexFlags);
	[id(0x60010002)]
	void __stdcall BeginFigure(
		D2D_POINT_2F startPoint,
		D2D1_FIGURE_BEGIN figureBegin);
	[id(0x60010003)]
	void __stdcall AddLines(
		D2D_POINT_2F* points,
		unsigned int count);
	[id(0x60010004)]
	void __stdcall AddBeziers(
		D2D1_BEZIER_SEGMENT* beziers,
		unsigned int count);
	[id(0x60010005)]
	void __stdcall EndFigure(
		D2D1_FIGURE_END figureEnd);
	[id(0x60010006)]
	HRESULT __stdcall Close();
};

```'!
!ID2D1SimplifiedGeometrySink categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1SimplifiedGeometrySink methodsFor!

addBeziers: beziers count: count
	"Answer the <VOID> result of invoking the AddBeziers() method of the COM object."

	self
		AddBeziers: beziers
		count: count
!

AddBeziers: beziers count: count
	"Private - Invoke the AddBeziers() method of the COM object.

		void __stdcall AddBeziers(
			D2D1_BEZIER_SEGMENT* beziers,
			unsigned int count);"

	<virtual stdcall: void 8 D2D1_BEZIER_SEGMENT* dword>
	^self invalidCall!

addLines: points count: count
	"Answer the <VOID> result of invoking the AddLines() method of the COM object."

	self
		AddLines: points
		count: count
!

AddLines: points count: count
	"Private - Invoke the AddLines() method of the COM object.

		void __stdcall AddLines(
			D2D_POINT_2F* points,
			unsigned int count);"

	<virtual stdcall: void 7 D2D_POINT_2F* dword>
	^self invalidCall!

beginFigure: startPoint figureBegin: figureBegin
	"Answer the <VOID> result of invoking the BeginFigure() method of the COM object."

	self
		BeginFigure: startPoint
		figureBegin: figureBegin
!

BeginFigure: startPoint figureBegin: figureBegin
	"Private - Invoke the BeginFigure() method of the COM object.

		void __stdcall BeginFigure(
			D2D_POINT_2F startPoint,
			D2D1_FIGURE_BEGIN figureBegin);"

	<virtual stdcall: void 6 D2D_POINT_2F sdword>
	^self invalidCall!

close
	"Invoke the Close() method of the COM object."

	^self Close
!

Close
	"Private - Invoke the Close() method of the COM object.

		HRESULT __stdcall Close();"

	<virtual stdcall: hresult 10>
	^self invalidCall!

endFigure: figureEnd
	"Answer the <VOID> result of invoking the EndFigure() method of the COM object."

	self EndFigure: figureEnd
!

EndFigure: figureEnd
	"Private - Invoke the EndFigure() method of the COM object.

		void __stdcall EndFigure(
			D2D1_FIGURE_END figureEnd);"

	<virtual stdcall: void 9 sdword>
	^self invalidCall!

setFillMode: mode
	"Answer the <VOID> result of invoking the SetFillMode() method of the COM object."

	self SetFillMode: mode
!

SetFillMode: mode
	"Private - Invoke the SetFillMode() method of the COM object.

		void __stdcall SetFillMode(
			D2D1_FILL_MODE mode);"

	<virtual stdcall: void 4 sdword>
	^self invalidCall!

setSegmentFlags: vertexFlags
	"Answer the <VOID> result of invoking the SetSegmentFlags() method of the COM object."

	self SetSegmentFlags: vertexFlags
!

SetSegmentFlags: vertexFlags
	"Private - Invoke the SetSegmentFlags() method of the COM object.

		void __stdcall SetSegmentFlags(
			D2D1_PATH_SEGMENT vertexFlags);"

	<virtual stdcall: void 5 sdword>
	^self invalidCall! !
!ID2D1SimplifiedGeometrySink categoriesFor: #addBeziers:count:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #AddBeziers:count:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #addLines:count:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #AddLines:count:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #beginFigure:figureBegin:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #BeginFigure:figureBegin:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #close!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #Close!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #endFigure:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #EndFigure:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #setFillMode:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #SetFillMode:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !
!ID2D1SimplifiedGeometrySink categoriesFor: #setSegmentFlags:!**auto generated**!methods!public! !
!ID2D1SimplifiedGeometrySink categoriesFor: #SetSegmentFlags:!**auto generated**!COM Interfaces-ID2D1SimplifiedGeometrySink!private! !

!ID2D1SimplifiedGeometrySink class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1SimplifiedGeometrySink'
		ID2D1SimplifiedGeometrySink defineTemplate"

	self
		defineFunction: #SetFillMode:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #SetSegmentFlags:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #BeginFigure:figureBegin:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F sdword';
		defineFunction: #AddLines:count:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F* dword';
		defineFunction: #AddBeziers:count:
			returnType: 'void'
			argumentTypes: 'D2D1_BEZIER_SEGMENT* dword';
		defineFunction: #EndFigure:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #Close
! !
!ID2D1SimplifiedGeometrySink class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

