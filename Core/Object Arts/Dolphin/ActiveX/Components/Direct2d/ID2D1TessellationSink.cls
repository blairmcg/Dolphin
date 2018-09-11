"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ID2D1TessellationSink
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1TessellationSink guid: (IID fromString: '{2CD906C1-12E2-11DC-9FED-001143A055F9}')!
ID2D1TessellationSink comment: '`ID2D1TessellationSink` is a wrapper class for the COM interface ''Direct2d.ID2D1TessellationSink'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906c1-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1TessellationSink : IUnknown
 {
	[id(0x60010000)]
	void __stdcall AddTriangles(
		[in]D2D1_TRIANGLE* triangles,
		[in]unsigned int count);
	[id(0x60010001)]
	HRESULT __stdcall Close();
};

```'!
!ID2D1TessellationSink categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1TessellationSink methodsFor!

addTriangles: triangles count: count
	"Answer the <VOID> result of invoking the AddTriangles() method of the COM object."

	self
		AddTriangles: triangles
		count: count
!

AddTriangles: triangles count: count
	"Private - Invoke the AddTriangles() method of the COM object.

		void __stdcall AddTriangles(
			[in]D2D1_TRIANGLE* triangles,
			[in]unsigned int count);"

	<virtual stdcall: void 4 D2D1_TRIANGLE* dword>
	^self invalidCall!

close
	"Invoke the Close() method of the COM object."

	^self Close
!

Close
	"Private - Invoke the Close() method of the COM object.

		HRESULT __stdcall Close();"

	<virtual stdcall: hresult 5>
	^self invalidCall! !
!ID2D1TessellationSink categoriesFor: #addTriangles:count:!**auto generated**!methods!public! !
!ID2D1TessellationSink categoriesFor: #AddTriangles:count:!**auto generated**!COM Interfaces-ID2D1TessellationSink!private! !
!ID2D1TessellationSink categoriesFor: #close!**auto generated**!methods!public! !
!ID2D1TessellationSink categoriesFor: #Close!**auto generated**!COM Interfaces-ID2D1TessellationSink!private! !

!ID2D1TessellationSink class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1TessellationSink'
		ID2D1TessellationSink defineTemplate"

	self
		defineFunction: #AddTriangles:count:
			returnType: 'void'
			argumentTypes: 'D2D1_TRIANGLE* dword';
		defineFunction: #Close
! !
!ID2D1TessellationSink class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

