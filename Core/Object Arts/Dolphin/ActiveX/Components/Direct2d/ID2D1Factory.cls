"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ID2D1Factory
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Factory guid: (IID fromString: '{06152247-6F50-465A-9245-118BFD3B6007}')!
ID2D1Factory comment: '`ID2D1Factory` is a wrapper class for the COM interface ''Direct2d.ID2D1Factory'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(06152247-6f50-465a-9245-118bfd3b6007)
]
interface ID2D1Factory : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall ReloadSystemMetrics();
	[id(0x60010001)]
	void __stdcall GetDesktopDpi(
		[out]float* dpi_x,
		[out]float* dpi_y);
	[id(0x60010002)]
	HRESULT __stdcall CreateRectangleGeometry(
		[in]D2D_RECT_F* rect,
		[out]ID2D1RectangleGeometry** geometry);
	[id(0x60010003)]
	HRESULT __stdcall CreateRoundedRectangleGeometry(
		[in]D2D1_ROUNDED_RECT* rect,
		[out]ID2D1RoundedRectangleGeometry** geometry);
	[id(0x60010004)]
	HRESULT __stdcall CreateEllipseGeometry(
		[in]D2D1_ELLIPSE* ellipse,
		[out]ID2D1EllipseGeometry** geometry);
	[id(0x60010005)]
	HRESULT __stdcall CreateGeometryGroup(
		[in]D2D1_FILL_MODE fill_mode,
		[in]ID2D1Geometry** geometries,
		[in]unsigned int geometry_count,
		[out]ID2D1GeometryGroup** group);
	[id(0x60010006)]
	HRESULT __stdcall CreateTransformedGeometry(
		[in]ID2D1Geometry* src_geometry,
		[in]D2D_MATRIX_3X2_F* transform,
		[out]ID2D1TransformedGeometry** transformed_geometry);
	[id(0x60010007)]
	HRESULT __stdcall CreatePathGeometry(
		[out]ID2D1PathGeometry** geometry);
	[id(0x60010008)]
	HRESULT __stdcall CreateStrokeStyle(
		[in]D2D1_STROKE_STYLE_PROPERTIES* desc,
		[in]float* dashes,
		[in]unsigned int dash_count,
		[out]ID2D1StrokeStyle** stroke_style);
	[id(0x60010009)]
	HRESULT __stdcall CreateDrawingStateBlock(
		[in]D2D1_DRAWING_STATE_DESCRIPTION* desc,
		[in]IDWriteRenderingParams* text_rendering_params,
		[out]ID2D1DrawingStateBlock** state_block);
	[id(0x6001000a)]
	HRESULT __stdcall CreateWicBitmapRenderTarget(
		[in]IWICBitmap* target,
		[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
		[out]ID2D1RenderTarget** render_target);
	[id(0x6001000b)]
	HRESULT __stdcall CreateHwndRenderTarget(
		[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
		[in]D2D1_HWND_RENDER_TARGET_PROPERTIES* hwnd_rt_desc,
		[out]ID2D1HwndRenderTarget** render_target);
	[id(0x6001000c)]
	HRESULT __stdcall CreateDxgiSurfaceRenderTarget(
		[in]IDXGISurface* surface,
		[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
		[out]ID2D1RenderTarget** render_target);
	[id(0x6001000d)]
	HRESULT __stdcall CreateDCRenderTarget(
		[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
		[out]ID2D1DCRenderTarget** render_target);
};

```'!
!ID2D1Factory categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Factory methodsFor!

createDCRenderTarget: desc
	"Answer the <ID2D1DCRenderTarget> result of invoking the CreateDCRenderTarget() method of the COM object."

	| answer |
	answer := ID2D1DCRenderTarget newPointer.
	self
		CreateDCRenderTarget: desc
		render_target: answer.
	^answer asObject
!

CreateDCRenderTarget: desc render_target: render_target
	"Private - Invoke the CreateDCRenderTarget() method of the COM object.

		HRESULT __stdcall CreateDCRenderTarget(
			[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
			[out]ID2D1DCRenderTarget** render_target);"

	<virtual stdcall: hresult 17 D2D1_RENDER_TARGET_PROPERTIES* ID2D1DCRenderTarget**>
	^self invalidCall!

createDrawingStateBlock: desc text_rendering_params: text_rendering_params
	"Answer the <ID2D1DrawingStateBlock> result of invoking the CreateDrawingStateBlock() method of the COM object."

	| answer |
	answer := ID2D1DrawingStateBlock newPointer.
	self
		CreateDrawingStateBlock: desc
		text_rendering_params: text_rendering_params
		state_block: answer.
	^answer asObject
!

CreateDrawingStateBlock: desc text_rendering_params: text_rendering_params state_block: state_block
	"Private - Invoke the CreateDrawingStateBlock() method of the COM object.

		HRESULT __stdcall CreateDrawingStateBlock(
			[in]D2D1_DRAWING_STATE_DESCRIPTION* desc,
			[in]IDWriteRenderingParams* text_rendering_params,
			[out]ID2D1DrawingStateBlock** state_block);"

	<virtual stdcall: hresult 13 D2D1_DRAWING_STATE_DESCRIPTION* IDWriteRenderingParams* ID2D1DrawingStateBlock**>
	^self invalidCall!

createDxgiSurfaceRenderTarget: surface desc: desc
	"Answer the <ID2D1RenderTarget> result of invoking the CreateDxgiSurfaceRenderTarget() method of the COM object."

	| answer |
	answer := ID2D1RenderTarget newPointer.
	self
		CreateDxgiSurfaceRenderTarget: surface
		desc: desc
		render_target: answer.
	^answer asObject
!

CreateDxgiSurfaceRenderTarget: surface desc: desc render_target: render_target
	"Private - Invoke the CreateDxgiSurfaceRenderTarget() method of the COM object.

		HRESULT __stdcall CreateDxgiSurfaceRenderTarget(
			[in]IDXGISurface* surface,
			[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
			[out]ID2D1RenderTarget** render_target);"

	<virtual stdcall: hresult 16 IDXGISurface* D2D1_RENDER_TARGET_PROPERTIES* ID2D1RenderTarget**>
	^self invalidCall!

createEllipseGeometry: ellipse
	"Answer the <ID2D1EllipseGeometry> result of invoking the CreateEllipseGeometry() method of the COM object."

	| answer |
	answer := ID2D1EllipseGeometry newPointer.
	self
		CreateEllipseGeometry: ellipse
		geometry: answer.
	^answer asObject
!

CreateEllipseGeometry: ellipse geometry: geometry
	"Private - Invoke the CreateEllipseGeometry() method of the COM object.

		HRESULT __stdcall CreateEllipseGeometry(
			[in]D2D1_ELLIPSE* ellipse,
			[out]ID2D1EllipseGeometry** geometry);"

	<virtual stdcall: hresult 8 D2D1_ELLIPSE* ID2D1EllipseGeometry**>
	^self invalidCall!

createGeometryGroup: fill_mode geometries: geometries geometry_count: geometry_count
	"Answer the <ID2D1GeometryGroup> result of invoking the CreateGeometryGroup() method of the COM object."

	| answer |
	answer := ID2D1GeometryGroup newPointer.
	self
		CreateGeometryGroup: fill_mode
		geometries: geometries
		geometry_count: geometry_count
		group: answer.
	^answer asObject
!

CreateGeometryGroup: fill_mode geometries: geometries geometry_count: geometry_count group: group
	"Private - Invoke the CreateGeometryGroup() method of the COM object.

		HRESULT __stdcall CreateGeometryGroup(
			[in]D2D1_FILL_MODE fill_mode,
			[in]ID2D1Geometry** geometries,
			[in]unsigned int geometry_count,
			[out]ID2D1GeometryGroup** group);"

	<virtual stdcall: hresult 9 sdword ID2D1Geometry** dword ID2D1GeometryGroup**>
	^self invalidCall!

createHwndRenderTarget: desc hwnd_rt_desc: hwnd_rt_desc
	"Answer the <ID2D1HwndRenderTarget> result of invoking the CreateHwndRenderTarget() method of the COM object."

	| answer |
	answer := ID2D1HwndRenderTarget newPointer.
	self
		CreateHwndRenderTarget: desc
		hwnd_rt_desc: hwnd_rt_desc
		render_target: answer.
	^answer asObject
!

CreateHwndRenderTarget: desc hwnd_rt_desc: hwnd_rt_desc render_target: render_target
	"Private - Invoke the CreateHwndRenderTarget() method of the COM object.

		HRESULT __stdcall CreateHwndRenderTarget(
			[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
			[in]D2D1_HWND_RENDER_TARGET_PROPERTIES* hwnd_rt_desc,
			[out]ID2D1HwndRenderTarget** render_target);"

	<virtual stdcall: hresult 15 D2D1_RENDER_TARGET_PROPERTIES* D2D1_HWND_RENDER_TARGET_PROPERTIES* ID2D1HwndRenderTarget**>
	^self invalidCall!

createPathGeometry
	"Answer the <ID2D1PathGeometry> result of invoking the CreatePathGeometry() method of the COM object."

	| answer |
	answer := ID2D1PathGeometry newPointer.
	self CreatePathGeometry: answer.
	^answer asObject
!

CreatePathGeometry: geometry
	"Private - Invoke the CreatePathGeometry() method of the COM object.

		HRESULT __stdcall CreatePathGeometry(
			[out]ID2D1PathGeometry** geometry);"

	<virtual stdcall: hresult 11 ID2D1PathGeometry**>
	^self invalidCall!

createRectangleGeometry: rect
	"Answer the <ID2D1RectangleGeometry> result of invoking the CreateRectangleGeometry() method of the COM object."

	| answer |
	answer := ID2D1RectangleGeometry newPointer.
	self
		CreateRectangleGeometry: rect
		geometry: answer.
	^answer asObject
!

CreateRectangleGeometry: rect geometry: geometry
	"Private - Invoke the CreateRectangleGeometry() method of the COM object.

		HRESULT __stdcall CreateRectangleGeometry(
			[in]D2D_RECT_F* rect,
			[out]ID2D1RectangleGeometry** geometry);"

	<virtual stdcall: hresult 6 D2D_RECT_F* ID2D1RectangleGeometry**>
	^self invalidCall!

createRoundedRectangleGeometry: rect
	"Answer the <ID2D1RoundedRectangleGeometry> result of invoking the CreateRoundedRectangleGeometry() method of the COM object."

	| answer |
	answer := ID2D1RoundedRectangleGeometry newPointer.
	self
		CreateRoundedRectangleGeometry: rect
		geometry: answer.
	^answer asObject
!

CreateRoundedRectangleGeometry: rect geometry: geometry
	"Private - Invoke the CreateRoundedRectangleGeometry() method of the COM object.

		HRESULT __stdcall CreateRoundedRectangleGeometry(
			[in]D2D1_ROUNDED_RECT* rect,
			[out]ID2D1RoundedRectangleGeometry** geometry);"

	<virtual stdcall: hresult 7 D2D1_ROUNDED_RECT* ID2D1RoundedRectangleGeometry**>
	^self invalidCall!

createStrokeStyle: desc dashes: dashes dash_count: dash_count
	"Answer the <ID2D1StrokeStyle> result of invoking the CreateStrokeStyle() method of the COM object."

	| answer |
	answer := ID2D1StrokeStyle newPointer.
	self
		CreateStrokeStyle: desc
		dashes: dashes
		dash_count: dash_count
		stroke_style: answer.
	^answer asObject
!

CreateStrokeStyle: desc dashes: dashes dash_count: dash_count stroke_style: stroke_style
	"Private - Invoke the CreateStrokeStyle() method of the COM object.

		HRESULT __stdcall CreateStrokeStyle(
			[in]D2D1_STROKE_STYLE_PROPERTIES* desc,
			[in]float* dashes,
			[in]unsigned int dash_count,
			[out]ID2D1StrokeStyle** stroke_style);"

	<virtual stdcall: hresult 12 D2D1_STROKE_STYLE_PROPERTIES* float* dword ID2D1StrokeStyle**>
	^self invalidCall!

createTransformedGeometry: src_geometry transform: transform
	"Answer the <ID2D1TransformedGeometry> result of invoking the CreateTransformedGeometry() method of the COM object."

	| answer |
	answer := ID2D1TransformedGeometry newPointer.
	self
		CreateTransformedGeometry: src_geometry
		transform: transform
		transformed_geometry: answer.
	^answer asObject
!

CreateTransformedGeometry: src_geometry transform: transform transformed_geometry: transformed_geometry
	"Private - Invoke the CreateTransformedGeometry() method of the COM object.

		HRESULT __stdcall CreateTransformedGeometry(
			[in]ID2D1Geometry* src_geometry,
			[in]D2D_MATRIX_3X2_F* transform,
			[out]ID2D1TransformedGeometry** transformed_geometry);"

	<virtual stdcall: hresult 10 ID2D1Geometry* D2D_MATRIX_3X2_F* ID2D1TransformedGeometry**>
	^self invalidCall!

createWicBitmapRenderTarget: target desc: desc
	"Answer the <ID2D1RenderTarget> result of invoking the CreateWicBitmapRenderTarget() method of the COM object."

	| answer |
	answer := ID2D1RenderTarget newPointer.
	self
		CreateWicBitmapRenderTarget: target
		desc: desc
		render_target: answer.
	^answer asObject
!

CreateWicBitmapRenderTarget: target desc: desc render_target: render_target
	"Private - Invoke the CreateWicBitmapRenderTarget() method of the COM object.

		HRESULT __stdcall CreateWicBitmapRenderTarget(
			[in]IWICBitmap* target,
			[in]D2D1_RENDER_TARGET_PROPERTIES* desc,
			[out]ID2D1RenderTarget** render_target);"

	<virtual stdcall: hresult 14 IWICBitmap* D2D1_RENDER_TARGET_PROPERTIES* ID2D1RenderTarget**>
	^self invalidCall!

getDesktopDpi
	"Invoke the GetDesktopDpi() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (FLOAT new);
				basicAt: 2 put: (FLOAT new);
				yourself.
	self
		GetDesktopDpi: (answer basicAt: 1)
		dpi_y: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetDesktopDpi: dpi_x dpi_y: dpi_y
	"Private - Invoke the GetDesktopDpi() method of the COM object.

		void __stdcall GetDesktopDpi(
			[out]float* dpi_x,
			[out]float* dpi_y);"

	<virtual stdcall: void 5 float* float*>
	^self invalidCall!

reloadSystemMetrics
	"Invoke the ReloadSystemMetrics() method of the COM object."

	^self ReloadSystemMetrics
!

ReloadSystemMetrics
	"Private - Invoke the ReloadSystemMetrics() method of the COM object.

		HRESULT __stdcall ReloadSystemMetrics();"

	<virtual stdcall: hresult 4>
	^self invalidCall! !
!ID2D1Factory categoriesFor: #createDCRenderTarget:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateDCRenderTarget:render_target:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createDrawingStateBlock:text_rendering_params:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateDrawingStateBlock:text_rendering_params:state_block:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createDxgiSurfaceRenderTarget:desc:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateDxgiSurfaceRenderTarget:desc:render_target:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createEllipseGeometry:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateEllipseGeometry:geometry:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createGeometryGroup:geometries:geometry_count:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateGeometryGroup:geometries:geometry_count:group:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createHwndRenderTarget:hwnd_rt_desc:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateHwndRenderTarget:hwnd_rt_desc:render_target:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createPathGeometry!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreatePathGeometry:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createRectangleGeometry:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateRectangleGeometry:geometry:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createRoundedRectangleGeometry:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateRoundedRectangleGeometry:geometry:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createStrokeStyle:dashes:dash_count:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateStrokeStyle:dashes:dash_count:stroke_style:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createTransformedGeometry:transform:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateTransformedGeometry:transform:transformed_geometry:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #createWicBitmapRenderTarget:desc:!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #CreateWicBitmapRenderTarget:desc:render_target:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #getDesktopDpi!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #GetDesktopDpi:dpi_y:!**auto generated**!COM Interfaces-ID2D1Factory!private! !
!ID2D1Factory categoriesFor: #reloadSystemMetrics!**auto generated**!methods!public! !
!ID2D1Factory categoriesFor: #ReloadSystemMetrics!**auto generated**!COM Interfaces-ID2D1Factory!private! !

!ID2D1Factory class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Factory'
		ID2D1Factory defineTemplate"

	self
		defineFunction: #ReloadSystemMetrics;
		defineFunction: #GetDesktopDpi:dpi_y:
			returnType: 'void'
			argumentTypes: 'float* float*';
		defineFunction: #CreateRectangleGeometry:geometry:
			argumentTypes: 'D2D_RECT_F* ID2D1RectangleGeometry**';
		defineFunction: #CreateRoundedRectangleGeometry:geometry:
			argumentTypes: 'D2D1_ROUNDED_RECT* ID2D1RoundedRectangleGeometry**';
		defineFunction: #CreateEllipseGeometry:geometry:
			argumentTypes: 'D2D1_ELLIPSE* ID2D1EllipseGeometry**';
		defineFunction: #CreateGeometryGroup:geometries:geometry_count:group:
			argumentTypes: 'sdword ID2D1Geometry** dword ID2D1GeometryGroup**';
		defineFunction: #CreateTransformedGeometry:transform:transformed_geometry:
			argumentTypes: 'ID2D1Geometry* D2D_MATRIX_3X2_F* ID2D1TransformedGeometry**';
		defineFunction: #CreatePathGeometry:
			argumentTypes: 'ID2D1PathGeometry**';
		defineFunction: #CreateStrokeStyle:dashes:dash_count:stroke_style:
			argumentTypes: 'D2D1_STROKE_STYLE_PROPERTIES* float* dword ID2D1StrokeStyle**';
		defineFunction: #CreateDrawingStateBlock:text_rendering_params:state_block:
			argumentTypes: 'D2D1_DRAWING_STATE_DESCRIPTION* IDWriteRenderingParams* ID2D1DrawingStateBlock**';
		defineFunction: #CreateWicBitmapRenderTarget:desc:render_target:
			argumentTypes: 'IWICBitmap* D2D1_RENDER_TARGET_PROPERTIES* ID2D1RenderTarget**';
		defineFunction: #CreateHwndRenderTarget:hwnd_rt_desc:render_target:
			argumentTypes: 'D2D1_RENDER_TARGET_PROPERTIES* D2D1_HWND_RENDER_TARGET_PROPERTIES* ID2D1HwndRenderTarget**';
		defineFunction: #CreateDxgiSurfaceRenderTarget:desc:render_target:
			argumentTypes: 'IDXGISurface* D2D1_RENDER_TARGET_PROPERTIES* ID2D1RenderTarget**';
		defineFunction: #CreateDCRenderTarget:render_target:
			argumentTypes: 'D2D1_RENDER_TARGET_PROPERTIES* ID2D1DCRenderTarget**'
! !
!ID2D1Factory class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

