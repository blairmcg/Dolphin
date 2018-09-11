"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1Layer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Layer guid: (IID fromString: '{2CD9069B-12E2-11DC-9FED-001143A055F9}')!
ID2D1Layer comment: '`ID2D1Layer` is a wrapper class for the COM interface ''Direct2d.ID2D1Layer'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd9069b-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1Layer : ID2D1Resource
 {
	[id(0x60020000)]
	D2D_SIZE_F __stdcall GetSize();
};

```'!
!ID2D1Layer categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Layer methodsFor!

getSize
	"Answer the <D2D_SIZE_F> result of invoking the GetSize() method of the COM object."

	^self GetSize
!

GetSize
	"Private - Invoke the GetSize() method of the COM object.

		D2D_SIZE_F __stdcall GetSize();"

	<virtual stdcall: D2D_SIZE_F 5>
	^self invalidCall! !
!ID2D1Layer categoriesFor: #getSize!**auto generated**!methods!public! !
!ID2D1Layer categoriesFor: #GetSize!**auto generated**!COM Interfaces-ID2D1Layer!private! !

!ID2D1Layer class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Layer'
		ID2D1Layer defineTemplate"

	self
		defineFunction: #GetSize
			returnType: 'D2D_SIZE_F'
! !
!ID2D1Layer class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

