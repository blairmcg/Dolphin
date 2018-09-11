"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1Mesh
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Mesh guid: (IID fromString: '{2CD906C2-12E2-11DC-9FED-001143A055F9}')!
ID2D1Mesh comment: '`ID2D1Mesh` is a wrapper class for the COM interface ''Direct2d.ID2D1Mesh'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906c2-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1Mesh : ID2D1Resource
 {
	[id(0x60020000)]
	HRESULT __stdcall Open(
		[out]ID2D1TessellationSink** sink);
};

```'!
!ID2D1Mesh categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Mesh methodsFor!

open
	"Answer the <ID2D1TessellationSink> result of invoking the Open() method of the COM object."

	| answer |
	answer := ID2D1TessellationSink newPointer.
	self Open: answer.
	^answer asObject
!

Open: sink
	"Private - Invoke the Open() method of the COM object.

		HRESULT __stdcall Open(
			[out]ID2D1TessellationSink** sink);"

	<virtual stdcall: hresult 5 ID2D1TessellationSink**>
	^self invalidCall! !
!ID2D1Mesh categoriesFor: #open!**auto generated**!methods!public! !
!ID2D1Mesh categoriesFor: #Open:!**auto generated**!COM Interfaces-ID2D1Mesh!private! !

!ID2D1Mesh class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Mesh'
		ID2D1Mesh defineTemplate"

	self
		defineFunction: #Open:
			argumentTypes: 'ID2D1TessellationSink**'
! !
!ID2D1Mesh class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

