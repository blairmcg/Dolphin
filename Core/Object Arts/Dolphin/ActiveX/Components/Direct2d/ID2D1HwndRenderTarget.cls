"Filed out from Dolphin Smalltalk 7"!

ID2D1RenderTarget subclass: #ID2D1HwndRenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1HwndRenderTarget guid: (IID fromString: '{2CD90698-12E2-11DC-9FED-001143A055F9}')!
ID2D1HwndRenderTarget comment: '`ID2D1HwndRenderTarget` is a wrapper class for the COM interface ''Direct2d.ID2D1HwndRenderTarget'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd90698-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1HwndRenderTarget : ID2D1RenderTarget
 {
	[id(0x60030000)]
	D2D1_WINDOW_STATE __stdcall CheckWindowState();
	[id(0x60030001)]
	HRESULT __stdcall Resize(
		[in]D2D_SIZE_U* size);
	[id(0x60030002)]
	wireHWND __stdcall GetHwnd();
};

```'!
!ID2D1HwndRenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1HwndRenderTarget methodsFor!

checkWindowState
	"Answer the <SDWORD> result of invoking the CheckWindowState() method of the COM object."

	^self CheckWindowState
!

CheckWindowState
	"Private - Invoke the CheckWindowState() method of the COM object.

		D2D1_WINDOW_STATE __stdcall CheckWindowState();"

	<virtual stdcall: sdword 58>
	^self invalidCall!

getHwnd
	"Answer the <ExternalHandle> result of invoking the GetHwnd() method of the COM object."

	^self GetHwnd
!

GetHwnd
	"Private - Invoke the GetHwnd() method of the COM object.

		wireHWND __stdcall GetHwnd();"

	<virtual stdcall: handle 60>
	^self invalidCall!

Resize: size
	"Private - Invoke the Resize() method of the COM object.

		HRESULT __stdcall Resize(
			[in]D2D_SIZE_U* size);"

	<virtual stdcall: hresult 59 D2D_SIZE_U*>
	^self invalidCall!

resize_: size
	"Invoke the Resize() method of the COM object."

	^self Resize: size
! !
!ID2D1HwndRenderTarget categoriesFor: #checkWindowState!**auto generated**!methods!public! !
!ID2D1HwndRenderTarget categoriesFor: #CheckWindowState!**auto generated**!COM Interfaces-ID2D1HwndRenderTarget!private! !
!ID2D1HwndRenderTarget categoriesFor: #getHwnd!**auto generated**!methods!public! !
!ID2D1HwndRenderTarget categoriesFor: #GetHwnd!**auto generated**!COM Interfaces-ID2D1HwndRenderTarget!private! !
!ID2D1HwndRenderTarget categoriesFor: #Resize:!**auto generated**!COM Interfaces-ID2D1HwndRenderTarget!private! !
!ID2D1HwndRenderTarget categoriesFor: #resize_:!**auto generated**!methods!public! !

!ID2D1HwndRenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1HwndRenderTarget'
		ID2D1HwndRenderTarget defineTemplate"

	self
		defineFunction: #CheckWindowState
			returnType: 'sdword';
		defineFunction: #Resize:
			argumentTypes: 'D2D_SIZE_U*';
		defineFunction: #GetHwnd
			returnType: 'handle'
! !
!ID2D1HwndRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

