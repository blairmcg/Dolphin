"Filed out from Dolphin Smalltalk 7"!

ID2D1SimplifiedGeometrySink subclass: #ID2D1GeometrySink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1GeometrySink guid: (IID fromString: '{2CD9069F-12E2-11DC-9FED-001143A055F9}')!
ID2D1GeometrySink comment: '`ID2D1GeometrySink` is a wrapper class for the COM interface ''Direct2d.ID2D1GeometrySink'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd9069f-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1GeometrySink : ID2D1SimplifiedGeometrySink
 {
	[id(0x60020000)]
	void __stdcall AddLine(
		[in]D2D_POINT_2F point);
	[id(0x60020001)]
	void __stdcall AddBezier(
		[in]D2D1_BEZIER_SEGMENT* bezier);
	[id(0x60020002)]
	void __stdcall AddQuadraticBezier(
		[in]D2D1_QUADRATIC_BEZIER_SEGMENT* bezier);
	[id(0x60020003)]
	void __stdcall AddQuadraticBeziers(
		[in]D2D1_QUADRATIC_BEZIER_SEGMENT* beziers,
		[in]unsigned int bezier_count);
	[id(0x60020004)]
	void __stdcall AddArc(
		[in]D2D1_ARC_SEGMENT* arc);
};

```'!
!ID2D1GeometrySink categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1GeometrySink methodsFor!

addArc: arc
	"Answer the <VOID> result of invoking the AddArc() method of the COM object."

	self AddArc: arc
!

AddArc: arc
	"Private - Invoke the AddArc() method of the COM object.

		void __stdcall AddArc(
			[in]D2D1_ARC_SEGMENT* arc);"

	<virtual stdcall: void 15 D2D1_ARC_SEGMENT*>
	^self invalidCall!

addBezier: bezier
	"Answer the <VOID> result of invoking the AddBezier() method of the COM object."

	self AddBezier: bezier
!

AddBezier: bezier
	"Private - Invoke the AddBezier() method of the COM object.

		void __stdcall AddBezier(
			[in]D2D1_BEZIER_SEGMENT* bezier);"

	<virtual stdcall: void 12 D2D1_BEZIER_SEGMENT*>
	^self invalidCall!

addLine: point
	"Answer the <VOID> result of invoking the AddLine() method of the COM object."

	self AddLine: point
!

AddLine: point
	"Private - Invoke the AddLine() method of the COM object.

		void __stdcall AddLine(
			[in]D2D_POINT_2F point);"

	<virtual stdcall: void 11 D2D_POINT_2F>
	^self invalidCall!

addQuadraticBezier: bezier
	"Answer the <VOID> result of invoking the AddQuadraticBezier() method of the COM object."

	self AddQuadraticBezier: bezier
!

AddQuadraticBezier: bezier
	"Private - Invoke the AddQuadraticBezier() method of the COM object.

		void __stdcall AddQuadraticBezier(
			[in]D2D1_QUADRATIC_BEZIER_SEGMENT* bezier);"

	<virtual stdcall: void 13 D2D1_QUADRATIC_BEZIER_SEGMENT*>
	^self invalidCall!

addQuadraticBeziers: beziers bezier_count: bezier_count
	"Answer the <VOID> result of invoking the AddQuadraticBeziers() method of the COM object."

	self
		AddQuadraticBeziers: beziers
		bezier_count: bezier_count
!

AddQuadraticBeziers: beziers bezier_count: bezier_count
	"Private - Invoke the AddQuadraticBeziers() method of the COM object.

		void __stdcall AddQuadraticBeziers(
			[in]D2D1_QUADRATIC_BEZIER_SEGMENT* beziers,
			[in]unsigned int bezier_count);"

	<virtual stdcall: void 14 D2D1_QUADRATIC_BEZIER_SEGMENT* dword>
	^self invalidCall! !
!ID2D1GeometrySink categoriesFor: #addArc:!**auto generated**!methods!public! !
!ID2D1GeometrySink categoriesFor: #AddArc:!**auto generated**!COM Interfaces-ID2D1GeometrySink!private! !
!ID2D1GeometrySink categoriesFor: #addBezier:!**auto generated**!methods!public! !
!ID2D1GeometrySink categoriesFor: #AddBezier:!**auto generated**!COM Interfaces-ID2D1GeometrySink!private! !
!ID2D1GeometrySink categoriesFor: #addLine:!**auto generated**!methods!public! !
!ID2D1GeometrySink categoriesFor: #AddLine:!**auto generated**!COM Interfaces-ID2D1GeometrySink!private! !
!ID2D1GeometrySink categoriesFor: #addQuadraticBezier:!**auto generated**!methods!public! !
!ID2D1GeometrySink categoriesFor: #AddQuadraticBezier:!**auto generated**!COM Interfaces-ID2D1GeometrySink!private! !
!ID2D1GeometrySink categoriesFor: #addQuadraticBeziers:bezier_count:!**auto generated**!methods!public! !
!ID2D1GeometrySink categoriesFor: #AddQuadraticBeziers:bezier_count:!**auto generated**!COM Interfaces-ID2D1GeometrySink!private! !

!ID2D1GeometrySink class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1GeometrySink'
		ID2D1GeometrySink defineTemplate"

	self
		defineFunction: #AddLine:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F';
		defineFunction: #AddBezier:
			returnType: 'void'
			argumentTypes: 'D2D1_BEZIER_SEGMENT*';
		defineFunction: #AddQuadraticBezier:
			returnType: 'void'
			argumentTypes: 'D2D1_QUADRATIC_BEZIER_SEGMENT*';
		defineFunction: #AddQuadraticBeziers:bezier_count:
			returnType: 'void'
			argumentTypes: 'D2D1_QUADRATIC_BEZIER_SEGMENT* dword';
		defineFunction: #AddArc:
			returnType: 'void'
			argumentTypes: 'D2D1_ARC_SEGMENT*'
! !
!ID2D1GeometrySink class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

