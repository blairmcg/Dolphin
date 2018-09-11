"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ID2D1Resource
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Resource guid: (IID fromString: '{2CD90691-12E2-11DC-9FED-001143A055F9}')!
ID2D1Resource comment: '`ID2D1Resource` is a wrapper class for the COM interface ''Direct2d.ID2D1Resource'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd90691-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1Resource : IUnknown
 {
	[id(0x60010000)]
	void __stdcall GetFactory(
		[out]ID2D1Factory** factory);
};

```'!
!ID2D1Resource categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Resource methodsFor!

getFactory
	"Answer the <ID2D1Factory> result of invoking the GetFactory() method of the COM object."

	| answer |
	answer := ID2D1Factory newPointer.
	self GetFactory: answer.
	^answer asObject
!

GetFactory: factory
	"Private - Invoke the GetFactory() method of the COM object.

		void __stdcall GetFactory(
			[out]ID2D1Factory** factory);"

	<virtual stdcall: void 4 ID2D1Factory**>
	^self invalidCall! !
!ID2D1Resource categoriesFor: #getFactory!**auto generated**!methods!public! !
!ID2D1Resource categoriesFor: #GetFactory:!**auto generated**!COM Interfaces-ID2D1Resource!private! !

!ID2D1Resource class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Resource'
		ID2D1Resource defineTemplate"

	self
		defineFunction: #GetFactory:
			returnType: 'void'
			argumentTypes: 'ID2D1Factory**'
! !
!ID2D1Resource class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

