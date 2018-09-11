"Filed out from Dolphin Smalltalk 7"!

ID2D1Geometry subclass: #ID2D1PathGeometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1PathGeometry guid: (IID fromString: '{2CD906A5-12E2-11DC-9FED-001143A055F9}')!
ID2D1PathGeometry comment: '`ID2D1PathGeometry` is a wrapper class for the COM interface ''Direct2d.ID2D1PathGeometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a5-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1PathGeometry : ID2D1Geometry
 {
	[id(0x60030000)]
	HRESULT __stdcall Open(
		[out]ID2D1GeometrySink** sink);
	[id(0x60030001)]
	HRESULT __stdcall Stream(
		[in]ID2D1GeometrySink* sink);
	[id(0x60030002)]
	HRESULT __stdcall GetSegmentCount(
		[out]unsigned int* count);
	[id(0x60030003)]
	HRESULT __stdcall GetFigureCount(
		[out]unsigned int* count);
};

```'!
!ID2D1PathGeometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1PathGeometry methodsFor!

getFigureCount
	"Answer the <DWORD> result of invoking the GetFigureCount() method of the COM object."

	| answer |
	answer := (DWORD new).
	self GetFigureCount: answer.
	^answer asObject
!

GetFigureCount: count
	"Private - Invoke the GetFigureCount() method of the COM object.

		HRESULT __stdcall GetFigureCount(
			[out]unsigned int* count);"

	<virtual stdcall: hresult 21 dword*>
	^self invalidCall!

getSegmentCount
	"Answer the <DWORD> result of invoking the GetSegmentCount() method of the COM object."

	| answer |
	answer := (DWORD new).
	self GetSegmentCount: answer.
	^answer asObject
!

GetSegmentCount: count
	"Private - Invoke the GetSegmentCount() method of the COM object.

		HRESULT __stdcall GetSegmentCount(
			[out]unsigned int* count);"

	<virtual stdcall: hresult 20 dword*>
	^self invalidCall!

open
	"Answer the <ID2D1GeometrySink> result of invoking the Open() method of the COM object."

	| answer |
	answer := ID2D1GeometrySink newPointer.
	self Open: answer.
	^answer asObject
!

Open: sink
	"Private - Invoke the Open() method of the COM object.

		HRESULT __stdcall Open(
			[out]ID2D1GeometrySink** sink);"

	<virtual stdcall: hresult 18 ID2D1GeometrySink**>
	^self invalidCall!

stream: sink
	"Invoke the Stream() method of the COM object."

	^self Stream: sink
!

Stream: sink
	"Private - Invoke the Stream() method of the COM object.

		HRESULT __stdcall Stream(
			[in]ID2D1GeometrySink* sink);"

	<virtual stdcall: hresult 19 ID2D1GeometrySink*>
	^self invalidCall! !
!ID2D1PathGeometry categoriesFor: #getFigureCount!**auto generated**!methods!public! !
!ID2D1PathGeometry categoriesFor: #GetFigureCount:!**auto generated**!COM Interfaces-ID2D1PathGeometry!private! !
!ID2D1PathGeometry categoriesFor: #getSegmentCount!**auto generated**!methods!public! !
!ID2D1PathGeometry categoriesFor: #GetSegmentCount:!**auto generated**!COM Interfaces-ID2D1PathGeometry!private! !
!ID2D1PathGeometry categoriesFor: #open!**auto generated**!methods!public! !
!ID2D1PathGeometry categoriesFor: #Open:!**auto generated**!COM Interfaces-ID2D1PathGeometry!private! !
!ID2D1PathGeometry categoriesFor: #stream:!**auto generated**!methods!public! !
!ID2D1PathGeometry categoriesFor: #Stream:!**auto generated**!COM Interfaces-ID2D1PathGeometry!private! !

!ID2D1PathGeometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1PathGeometry'
		ID2D1PathGeometry defineTemplate"

	self
		defineFunction: #Open:
			argumentTypes: 'ID2D1GeometrySink**';
		defineFunction: #Stream:
			argumentTypes: 'ID2D1GeometrySink*';
		defineFunction: #GetSegmentCount:
			argumentTypes: 'dword*';
		defineFunction: #GetFigureCount:
			argumentTypes: 'dword*'
! !
!ID2D1PathGeometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

