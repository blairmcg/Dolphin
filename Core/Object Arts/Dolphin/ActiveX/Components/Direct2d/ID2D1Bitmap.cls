"Filed out from Dolphin Smalltalk 7"!

ID2D1Image subclass: #ID2D1Bitmap
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Bitmap guid: (IID fromString: '{A2296057-EA42-4099-983B-539FB6505426}')!
ID2D1Bitmap comment: '`ID2D1Bitmap` is a wrapper class for the COM interface ''Direct2d.ID2D1Bitmap'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(a2296057-ea42-4099-983b-539fb6505426)
]
interface ID2D1Bitmap : ID2D1Image
 {
	[id(0x60030000)]
	D2D_SIZE_F __stdcall GetSize();
	[id(0x60030001)]
	D2D_SIZE_U __stdcall GetPixelSize();
	[id(0x60030002)]
	D2D1_PIXEL_FORMAT __stdcall GetPixelFormat();
	[id(0x60030003)]
	void __stdcall GetDpi(
		[out]float* dpi_x,
		[out]float* dpi_y);
	[id(0x60030004)]
	HRESULT __stdcall CopyFromBitmap(
		[in]D2D_POINT_2U* dst_point,
		[in]ID2D1Bitmap* bitmap,
		[in]D2D_RECT_U* src_rect);
	[id(0x60030005)]
	HRESULT __stdcall CopyFromRenderTarget(
		[in]D2D_POINT_2U* dst_point,
		[in]ID2D1RenderTarget* render_target,
		[in]D2D_RECT_U* src_rect);
	[id(0x60030006)]
	HRESULT __stdcall CopyFromMemory(
		[in]D2D_RECT_U* dst_rect,
		[in]void* src_data,
		[in]unsigned int pitch);
};

```'!
!ID2D1Bitmap categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Bitmap methodsFor!

copyFromBitmap: dst_point bitmap: bitmap src_rect: src_rect
	"Invoke the CopyFromBitmap() method of the COM object."

	^self
		CopyFromBitmap: dst_point
		bitmap: bitmap
		src_rect: src_rect
!

CopyFromBitmap: dst_point bitmap: bitmap src_rect: src_rect
	"Private - Invoke the CopyFromBitmap() method of the COM object.

		HRESULT __stdcall CopyFromBitmap(
			[in]D2D_POINT_2U* dst_point,
			[in]ID2D1Bitmap* bitmap,
			[in]D2D_RECT_U* src_rect);"

	<virtual stdcall: hresult 9 D2D_POINT_2U* ID2D1Bitmap* D2D_RECT_U*>
	^self invalidCall!

copyFromMemory: dst_rect src_data: src_data pitch: pitch
	"Invoke the CopyFromMemory() method of the COM object."

	^self
		CopyFromMemory: dst_rect
		src_data: src_data
		pitch: pitch
!

CopyFromMemory: dst_rect src_data: src_data pitch: pitch
	"Private - Invoke the CopyFromMemory() method of the COM object.

		HRESULT __stdcall CopyFromMemory(
			[in]D2D_RECT_U* dst_rect,
			[in]void* src_data,
			[in]unsigned int pitch);"

	<virtual stdcall: hresult 11 D2D_RECT_U* void* dword>
	^self invalidCall!

copyFromRenderTarget: dst_point render_target: render_target src_rect: src_rect
	"Invoke the CopyFromRenderTarget() method of the COM object."

	^self
		CopyFromRenderTarget: dst_point
		render_target: render_target
		src_rect: src_rect
!

CopyFromRenderTarget: dst_point render_target: render_target src_rect: src_rect
	"Private - Invoke the CopyFromRenderTarget() method of the COM object.

		HRESULT __stdcall CopyFromRenderTarget(
			[in]D2D_POINT_2U* dst_point,
			[in]ID2D1RenderTarget* render_target,
			[in]D2D_RECT_U* src_rect);"

	<virtual stdcall: hresult 10 D2D_POINT_2U* ID2D1RenderTarget* D2D_RECT_U*>
	^self invalidCall!

getDpi
	"Invoke the GetDpi() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (FLOAT new);
				yourself.
	self
		GetDpi: (answer basicAt: 1)
		dpi_y: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetDpi: dpi_x dpi_y: dpi_y
	"Private - Invoke the GetDpi() method of the COM object.

		void __stdcall GetDpi(
			[out]float* dpi_x,
			[out]float* dpi_y);"

	<virtual stdcall: void 8 float* float*>
	^self invalidCall!

getPixelFormat
	"Answer the <D2D1_PIXEL_FORMAT> result of invoking the GetPixelFormat() method of the COM object."

	^self GetPixelFormat
!

GetPixelFormat
	"Private - Invoke the GetPixelFormat() method of the COM object.

		D2D1_PIXEL_FORMAT __stdcall GetPixelFormat();"

	<virtual stdcall: D2D1_PIXEL_FORMAT 7>
	^self invalidCall!

getPixelSize
	"Answer the <D2D_SIZE_U> result of invoking the GetPixelSize() method of the COM object."

	^self GetPixelSize
!

GetPixelSize
	"Private - Invoke the GetPixelSize() method of the COM object.

		D2D_SIZE_U __stdcall GetPixelSize();"

	<virtual stdcall: D2D_SIZE_U 6>
	^self invalidCall!

getSize
	"Answer the <D2D_SIZE_F> result of invoking the GetSize() method of the COM object."

	^self GetSize
!

GetSize
	"Private - Invoke the GetSize() method of the COM object.

		D2D_SIZE_F __stdcall GetSize();"

	<virtual stdcall: D2D_SIZE_F 5>
	^self invalidCall! !
!ID2D1Bitmap categoriesFor: #copyFromBitmap:bitmap:src_rect:!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #CopyFromBitmap:bitmap:src_rect:!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #copyFromMemory:src_data:pitch:!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #CopyFromMemory:src_data:pitch:!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #copyFromRenderTarget:render_target:src_rect:!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #CopyFromRenderTarget:render_target:src_rect:!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #getDpi!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #GetDpi:dpi_y:!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #getPixelFormat!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #GetPixelFormat!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #getPixelSize!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #GetPixelSize!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !
!ID2D1Bitmap categoriesFor: #getSize!**auto generated**!methods!public! !
!ID2D1Bitmap categoriesFor: #GetSize!**auto generated**!COM Interfaces-ID2D1Bitmap!private! !

!ID2D1Bitmap class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Bitmap'
		ID2D1Bitmap defineTemplate"

	self
		defineFunction: #GetSize
			returnType: 'D2D_SIZE_F';
		defineFunction: #GetPixelSize
			returnType: 'D2D_SIZE_U';
		defineFunction: #GetPixelFormat
			returnType: 'D2D1_PIXEL_FORMAT';
		defineFunction: #GetDpi:dpi_y:
			returnType: 'void'
			argumentTypes: 'float* float*';
		defineFunction: #CopyFromBitmap:bitmap:src_rect:
			argumentTypes: 'D2D_POINT_2U* ID2D1Bitmap* D2D_RECT_U*';
		defineFunction: #CopyFromRenderTarget:render_target:src_rect:
			argumentTypes: 'D2D_POINT_2U* ID2D1RenderTarget* D2D_RECT_U*';
		defineFunction: #CopyFromMemory:src_data:pitch:
			argumentTypes: 'D2D_RECT_U* void* dword'
! !
!ID2D1Bitmap class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

