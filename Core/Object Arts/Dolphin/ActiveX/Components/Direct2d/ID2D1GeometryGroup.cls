"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1GeometryGroup
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1GeometryGroup guid: (IID fromString: '{2CD906A6-12E2-11DC-9FED-001143A055F9}')!
ID2D1GeometryGroup comment: '`ID2D1GeometryGroup` is a wrapper class for the COM interface ''Direct2d.ID2D1GeometryGroup'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a6-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1GeometryGroup : ID2D1Geometry
 {
	[id(0x60030000)]
	D2D1_FILL_MODE __stdcall GetFillMode();
	[id(0x60030001)]
	unsigned int __stdcall GetSourceGeometryCount();
	[id(0x60030002)]
	void __stdcall GetSourceGeometries(
		[out]ID2D1Geometry** geometry,
		[in]unsigned int geometry_count);
};

```'!
!ID2D1GeometryGroup categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1GeometryGroup methodsFor!

getFillMode
	"Answer the <SDWORD> result of invoking the GetFillMode() method of the COM object."

	^self GetFillMode
!

GetFillMode
	"Private - Invoke the GetFillMode() method of the COM object.

		D2D1_FILL_MODE __stdcall GetFillMode();"

	<virtual stdcall: sdword 18>
	^self invalidCall!

getSourceGeometries: geometry_count
	"Answer the <ID2D1Geometry> result of invoking the GetSourceGeometries() method of the COM object."

	| answer |
	answer := ID2D1Geometry newPointer.
	self
		GetSourceGeometries: answer
		geometry_count: geometry_count.
	^answer asObject
!

GetSourceGeometries: geometry geometry_count: geometry_count
	"Private - Invoke the GetSourceGeometries() method of the COM object.

		void __stdcall GetSourceGeometries(
			[out]ID2D1Geometry** geometry,
			[in]unsigned int geometry_count);"

	<virtual stdcall: void 20 ID2D1Geometry** dword>
	^self invalidCall!

getSourceGeometryCount
	"Answer the <DWORD> result of invoking the GetSourceGeometryCount() method of the COM object."

	^self GetSourceGeometryCount
!

GetSourceGeometryCount
	"Private - Invoke the GetSourceGeometryCount() method of the COM object.

		unsigned int __stdcall GetSourceGeometryCount();"

	<virtual stdcall: dword 19>
	^self invalidCall! !
!ID2D1GeometryGroup categoriesFor: #getFillMode!**auto generated**!methods!public! !
!ID2D1GeometryGroup categoriesFor: #GetFillMode!**auto generated**!COM Interfaces-ID2D1GeometryGroup!private! !
!ID2D1GeometryGroup categoriesFor: #getSourceGeometries:!**auto generated**!methods!public! !
!ID2D1GeometryGroup categoriesFor: #GetSourceGeometries:geometry_count:!**auto generated**!COM Interfaces-ID2D1GeometryGroup!private! !
!ID2D1GeometryGroup categoriesFor: #getSourceGeometryCount!**auto generated**!methods!public! !
!ID2D1GeometryGroup categoriesFor: #GetSourceGeometryCount!**auto generated**!COM Interfaces-ID2D1GeometryGroup!private! !

!ID2D1GeometryGroup class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1GeometryGroup'
		ID2D1GeometryGroup defineTemplate"

	self
		defineFunction: #GetFillMode
			returnType: 'sdword';
		defineFunction: #GetSourceGeometryCount
			returnType: 'dword';
		defineFunction: #GetSourceGeometries:geometry_count:
			returnType: 'void'
			argumentTypes: 'ID2D1Geometry** dword'
! !
!ID2D1GeometryGroup class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

