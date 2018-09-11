"Filed out from Dolphin Smalltalk 7"!

ID2D1RenderTarget subclass: #ID2D1BitmapRenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1BitmapRenderTarget guid: (IID fromString: '{2CD90695-12E2-11DC-9FED-001143A055F9}')!
ID2D1BitmapRenderTarget comment: '`ID2D1BitmapRenderTarget` is a wrapper class for the COM interface ''Direct2d.ID2D1BitmapRenderTarget'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd90695-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1BitmapRenderTarget : ID2D1RenderTarget
 {
	[id(0x60030000)]
	HRESULT __stdcall GetBitmap(
		[out]ID2D1Bitmap** bitmap);
};

```'!
!ID2D1BitmapRenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1BitmapRenderTarget methodsFor!

getBitmap
	"Answer the <ID2D1Bitmap> result of invoking the GetBitmap() method of the COM object."

	| answer |
	answer := ID2D1Bitmap newPointer.
	self GetBitmap: answer.
	^answer asObject
!

GetBitmap: bitmap
	"Private - Invoke the GetBitmap() method of the COM object.

		HRESULT __stdcall GetBitmap(
			[out]ID2D1Bitmap** bitmap);"

	<virtual stdcall: hresult 58 ID2D1Bitmap**>
	^self invalidCall! !
!ID2D1BitmapRenderTarget categoriesFor: #getBitmap!**auto generated**!methods!public! !
!ID2D1BitmapRenderTarget categoriesFor: #GetBitmap:!**auto generated**!COM Interfaces-ID2D1BitmapRenderTarget!private! !

!ID2D1BitmapRenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1BitmapRenderTarget'
		ID2D1BitmapRenderTarget defineTemplate"

	self
		defineFunction: #GetBitmap:
			argumentTypes: 'ID2D1Bitmap**'
! !
!ID2D1BitmapRenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

