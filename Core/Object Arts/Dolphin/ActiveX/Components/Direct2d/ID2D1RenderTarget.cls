"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1RenderTarget
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1RenderTarget guid: (IID fromString: '{2CD90694-12E2-11DC-9FED-001143A055F9}')!
ID2D1RenderTarget comment: '`ID2D1RenderTarget` is a wrapper class for the COM interface ''Direct2d.ID2D1RenderTarget'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd90694-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1RenderTarget : ID2D1Resource
 {
	[id(0x60020000)]
	HRESULT __stdcall CreateBitmap(
		[in]D2D_SIZE_U size,
		[in]void* src_data,
		[in]unsigned int pitch,
		[in]D2D1_BITMAP_PROPERTIES* desc,
		[out]ID2D1Bitmap** bitmap);
	[id(0x60020001)]
	HRESULT __stdcall CreateBitmapFromWicBitmap(
		[in]IWICBitmapSource* bitmap_source,
		[in]D2D1_BITMAP_PROPERTIES* desc,
		[out]ID2D1Bitmap** bitmap);
	[id(0x60020002)]
	HRESULT __stdcall CreateSharedBitmap(
		[in]GUID* iid,
		[in, out]void* data,
		[in]D2D1_BITMAP_PROPERTIES* desc,
		[out]ID2D1Bitmap** bitmap);
	[id(0x60020003)]
	HRESULT __stdcall CreateBitmapBrush(
		[in]ID2D1Bitmap* bitmap,
		[in]D2D1_BITMAP_BRUSH_PROPERTIES* bitmap_brush_desc,
		[in]D2D1_BRUSH_PROPERTIES* brush_desc,
		[out]ID2D1BitmapBrush** brush);
	[id(0x60020004)]
	HRESULT __stdcall CreateSolidColorBrush(
		[in]D3DCOLORVALUE* color,
		[in]D2D1_BRUSH_PROPERTIES* desc,
		[out]ID2D1SolidColorBrush** brush);
	[id(0x60020005)]
	HRESULT __stdcall CreateGradientStopCollection(
		[in]D2D1_GRADIENT_STOP* stops,
		[in]unsigned int stop_count,
		[in]D2D1_GAMMA gamma,
		[in]D2D1_EXTEND_MODE extend_mode,
		[out]ID2D1GradientStopCollection** gradient);
	[id(0x60020006)]
	HRESULT __stdcall CreateLinearGradientBrush(
		[in]D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES* gradient_brush_desc,
		[in]D2D1_BRUSH_PROPERTIES* brush_desc,
		[in]ID2D1GradientStopCollection* gradient,
		[out]ID2D1LinearGradientBrush** brush);
	[id(0x60020007)]
	HRESULT __stdcall CreateRadialGradientBrush(
		[in]D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES* gradient_brush_desc,
		[in]D2D1_BRUSH_PROPERTIES* brush_desc,
		[in]ID2D1GradientStopCollection* gradient,
		[out]ID2D1RadialGradientBrush** brush);
	[id(0x60020008)]
	HRESULT __stdcall CreateCompatibleRenderTarget(
		[in]D2D_SIZE_F* size,
		[in]D2D_SIZE_U* pixel_size,
		[in]D2D1_PIXEL_FORMAT* format,
		[in]D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS options,
		[out]ID2D1BitmapRenderTarget** render_target);
	[id(0x60020009)]
	HRESULT __stdcall CreateLayer(
		[in]D2D_SIZE_F* size,
		[out]ID2D1Layer** layer);
	[id(0x6002000a)]
	HRESULT __stdcall CreateMesh(
		[out]ID2D1Mesh** mesh);
	[id(0x6002000b)]
	void __stdcall DrawLine(
		[in]D2D_POINT_2F p0,
		[in]D2D_POINT_2F p1,
		[in]ID2D1Brush* brush,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style);
	[id(0x6002000c)]
	void __stdcall DrawRectangle(
		[in]D2D_RECT_F* rect,
		[in]ID2D1Brush* brush,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style);
	[id(0x6002000d)]
	void __stdcall FillRectangle(
		[in]D2D_RECT_F* rect,
		[in]ID2D1Brush* brush);
	[id(0x6002000e)]
	void __stdcall DrawRoundedRectangle(
		[in]D2D1_ROUNDED_RECT* rect,
		[in]ID2D1Brush* brush,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style);
	[id(0x6002000f)]
	void __stdcall FillRoundedRectangle(
		[in]D2D1_ROUNDED_RECT* rect,
		[in]ID2D1Brush* brush);
	[id(0x60020010)]
	void __stdcall DrawEllipse(
		[in]D2D1_ELLIPSE* ellipse,
		[in]ID2D1Brush* brush,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style);
	[id(0x60020011)]
	void __stdcall FillEllipse(
		[in]D2D1_ELLIPSE* ellipse,
		[in]ID2D1Brush* brush);
	[id(0x60020012)]
	void __stdcall DrawGeometry(
		[in]ID2D1Geometry* geometry,
		[in]ID2D1Brush* brush,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style);
	[id(0x60020013)]
	void __stdcall FillGeometry(
		[in]ID2D1Geometry* geometry,
		[in]ID2D1Brush* brush,
		[in]ID2D1Brush* opacity_brush);
	[id(0x60020014)]
	void __stdcall FillMesh(
		[in]ID2D1Mesh* mesh,
		[in]ID2D1Brush* brush);
	[id(0x60020015)]
	void __stdcall FillOpacityMask(
		[in]ID2D1Bitmap* mask,
		[in]ID2D1Brush* brush,
		[in]D2D1_OPACITY_MASK_CONTENT content,
		[in]D2D_RECT_F* dst_rect,
		[in]D2D_RECT_F* src_rect);
	[id(0x60020016)]
	void __stdcall DrawBitmap(
		[in]ID2D1Bitmap* bitmap,
		[in]D2D_RECT_F* dst_rect,
		[in]float opacity,
		[in]D2D1_BITMAP_INTERPOLATION_MODE interpolation_mode,
		[in]D2D_RECT_F* src_rect);
	[id(0x60020017)]
	void __stdcall DrawText(
		[in]unsigned short* string,
		[in]unsigned int string_len,
		[in]IDWriteTextFormat* text_format,
		[in]D2D_RECT_F* layout_rect,
		[in]ID2D1Brush* brush,
		[in]D2D1_DRAW_TEXT_OPTIONS options,
		[in]DWRITE_MEASURING_MODE measuring_mode);
	[id(0x60020018)]
	void __stdcall DrawTextLayout(
		[in]D2D_POINT_2F origin,
		[in]IDWriteTextLayout* layout,
		[in]ID2D1Brush* brush,
		[in]D2D1_DRAW_TEXT_OPTIONS options);
	[id(0x60020019)]
	void __stdcall DrawGlyphRun(
		[in]D2D_POINT_2F baseline_origin,
		[in]DWRITE_GLYPH_RUN* glyph_run,
		[in]ID2D1Brush* brush,
		[in]DWRITE_MEASURING_MODE measuring_mode);
	[id(0x6002001a)]
	void __stdcall SetTransform(
		[in]D2D_MATRIX_3X2_F* transform);
	[id(0x6002001b)]
	void __stdcall GetTransform(
		[out]D2D_MATRIX_3X2_F* transform);
	[id(0x6002001c)]
	void __stdcall SetAntialiasMode(
		[in]D2D1_ANTIALIAS_MODE antialias_mode);
	[id(0x6002001d)]
	D2D1_ANTIALIAS_MODE __stdcall GetAntialiasMode();
	[id(0x6002001e)]
	void __stdcall SetTextAntialiasMode(
		[in]D2D1_TEXT_ANTIALIAS_MODE antialias_mode);
	[id(0x6002001f)]
	D2D1_TEXT_ANTIALIAS_MODE __stdcall GetTextAntialiasMode();
	[id(0x60020020)]
	void __stdcall SetTextRenderingParams(
		[in]IDWriteRenderingParams* text_rendering_params);
	[id(0x60020021)]
	void __stdcall GetTextRenderingParams(
		[out]IDWriteRenderingParams** text_rendering_params);
	[id(0x60020022)]
	void __stdcall SetTags(
		[in]D2D1_TAG tag1,
		[in]D2D1_TAG tag2);
	[id(0x60020023)]
	void __stdcall GetTags(
		[out]D2D1_TAG* tag1,
		[out]D2D1_TAG* tag2);
	[id(0x60020024)]
	void __stdcall PushLayer(
		[in]D2D1_LAYER_PARAMETERS* layer_parameters,
		[in]ID2D1Layer* layer);
	[id(0x60020025)]
	void __stdcall PopLayer();
	[id(0x60020026)]
	HRESULT __stdcall Flush(
		[out]D2D1_TAG* tag1,
		[out]D2D1_TAG* tag2);
	[id(0x60020027)]
	void __stdcall SaveDrawingState(
		[in, out]ID2D1DrawingStateBlock* state_block);
	[id(0x60020028)]
	void __stdcall RestoreDrawingState(
		[in]ID2D1DrawingStateBlock* state_block);
	[id(0x60020029)]
	void __stdcall PushAxisAlignedClip(
		[in]D2D_RECT_F* clip_rect,
		[in]D2D1_ANTIALIAS_MODE antialias_mode);
	[id(0x6002002a)]
	void __stdcall PopAxisAlignedClip();
	[id(0x6002002b)]
	void __stdcall Clear(
		[in]D3DCOLORVALUE* color);
	[id(0x6002002c)]
	void __stdcall BeginDraw();
	[id(0x6002002d)]
	HRESULT __stdcall EndDraw(
		[out]D2D1_TAG* tag1,
		[out]D2D1_TAG* tag2);
	[id(0x6002002e)]
	D2D1_PIXEL_FORMAT __stdcall GetPixelFormat();
	[id(0x6002002f)]
	void __stdcall SetDpi(
		[in]float dpi_x,
		[in]float dpi_y);
	[id(0x60020030)]
	void __stdcall GetDpi(
		[out]float* dpi_x,
		[out]float* dpi_y);
	[id(0x60020031)]
	D2D_SIZE_F __stdcall GetSize();
	[id(0x60020032)]
	D2D_SIZE_U __stdcall GetPixelSize();
	[id(0x60020033)]
	unsigned int __stdcall GetMaximumBitmapSize();
	[id(0x60020034)]
	BOOL __stdcall IsSupported(
		[in]D2D1_RENDER_TARGET_PROPERTIES* desc);
};

```'!
!ID2D1RenderTarget categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1RenderTarget methodsFor!

beginDraw
	"Answer the <VOID> result of invoking the BeginDraw() method of the COM object."

	self BeginDraw
!

BeginDraw
	"Private - Invoke the BeginDraw() method of the COM object.

		void __stdcall BeginDraw();"

	<virtual stdcall: void 49>
	^self invalidCall!

clear: color
	"Answer the <VOID> result of invoking the Clear() method of the COM object."

	self Clear: color
!

Clear: color
	"Private - Invoke the Clear() method of the COM object.

		void __stdcall Clear(
			[in]D3DCOLORVALUE* color);"

	<virtual stdcall: void 48 D3DCOLORVALUE*>
	^self invalidCall!

createBitmap: size src_data: src_data pitch: pitch desc: desc
	"Answer the <ID2D1Bitmap> result of invoking the CreateBitmap() method of the COM object."

	| answer |
	answer := ID2D1Bitmap newPointer.
	self
		CreateBitmap: size
		src_data: src_data
		pitch: pitch
		desc: desc
		bitmap: answer.
	^answer asObject
!

CreateBitmap: size src_data: src_data pitch: pitch desc: desc bitmap: bitmap
	"Private - Invoke the CreateBitmap() method of the COM object.

		HRESULT __stdcall CreateBitmap(
			[in]D2D_SIZE_U size,
			[in]void* src_data,
			[in]unsigned int pitch,
			[in]D2D1_BITMAP_PROPERTIES* desc,
			[out]ID2D1Bitmap** bitmap);"

	<virtual stdcall: hresult 5 D2D_SIZE_U void* dword D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**>
	^self invalidCall!

createBitmapBrush: bitmap bitmap_brush_desc: bitmap_brush_desc brush_desc: brush_desc
	"Answer the <ID2D1BitmapBrush> result of invoking the CreateBitmapBrush() method of the COM object."

	| answer |
	answer := ID2D1BitmapBrush newPointer.
	self
		CreateBitmapBrush: bitmap
		bitmap_brush_desc: bitmap_brush_desc
		brush_desc: brush_desc
		brush: answer.
	^answer asObject
!

CreateBitmapBrush: bitmap bitmap_brush_desc: bitmap_brush_desc brush_desc: brush_desc brush: brush
	"Private - Invoke the CreateBitmapBrush() method of the COM object.

		HRESULT __stdcall CreateBitmapBrush(
			[in]ID2D1Bitmap* bitmap,
			[in]D2D1_BITMAP_BRUSH_PROPERTIES* bitmap_brush_desc,
			[in]D2D1_BRUSH_PROPERTIES* brush_desc,
			[out]ID2D1BitmapBrush** brush);"

	<virtual stdcall: hresult 8 ID2D1Bitmap* D2D1_BITMAP_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1BitmapBrush**>
	^self invalidCall!

createBitmapFromWicBitmap: bitmap_source desc: desc
	"Answer the <ID2D1Bitmap> result of invoking the CreateBitmapFromWicBitmap() method of the COM object."

	| answer |
	answer := ID2D1Bitmap newPointer.
	self
		CreateBitmapFromWicBitmap: bitmap_source
		desc: desc
		bitmap: answer.
	^answer asObject
!

CreateBitmapFromWicBitmap: bitmap_source desc: desc bitmap: bitmap
	"Private - Invoke the CreateBitmapFromWicBitmap() method of the COM object.

		HRESULT __stdcall CreateBitmapFromWicBitmap(
			[in]IWICBitmapSource* bitmap_source,
			[in]D2D1_BITMAP_PROPERTIES* desc,
			[out]ID2D1Bitmap** bitmap);"

	<virtual stdcall: hresult 6 IWICBitmapSource* D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**>
	^self invalidCall!

createCompatibleRenderTarget: size pixel_size: pixel_size format: format options: options
	"Answer the <ID2D1BitmapRenderTarget> result of invoking the CreateCompatibleRenderTarget() method of the COM object."

	| answer |
	answer := ID2D1BitmapRenderTarget newPointer.
	self
		CreateCompatibleRenderTarget: size
		pixel_size: pixel_size
		format: format
		options: options
		render_target: answer.
	^answer asObject
!

CreateCompatibleRenderTarget: size pixel_size: pixel_size format: format options: options render_target: render_target
	"Private - Invoke the CreateCompatibleRenderTarget() method of the COM object.

		HRESULT __stdcall CreateCompatibleRenderTarget(
			[in]D2D_SIZE_F* size,
			[in]D2D_SIZE_U* pixel_size,
			[in]D2D1_PIXEL_FORMAT* format,
			[in]D2D1_COMPATIBLE_RENDER_TARGET_OPTIONS options,
			[out]ID2D1BitmapRenderTarget** render_target);"

	<virtual stdcall: hresult 13 D2D_SIZE_F* D2D_SIZE_U* D2D1_PIXEL_FORMAT* sdword ID2D1BitmapRenderTarget**>
	^self invalidCall!

createGradientStopCollection: stops stop_count: stop_count gamma: gamma extend_mode: extend_mode
	"Answer the <ID2D1GradientStopCollection> result of invoking the CreateGradientStopCollection() method of the COM object."

	| answer |
	answer := ID2D1GradientStopCollection newPointer.
	self
		CreateGradientStopCollection: stops
		stop_count: stop_count
		gamma: gamma
		extend_mode: extend_mode
		gradient: answer.
	^answer asObject
!

CreateGradientStopCollection: stops stop_count: stop_count gamma: gamma extend_mode: extend_mode gradient: gradient
	"Private - Invoke the CreateGradientStopCollection() method of the COM object.

		HRESULT __stdcall CreateGradientStopCollection(
			[in]D2D1_GRADIENT_STOP* stops,
			[in]unsigned int stop_count,
			[in]D2D1_GAMMA gamma,
			[in]D2D1_EXTEND_MODE extend_mode,
			[out]ID2D1GradientStopCollection** gradient);"

	<virtual stdcall: hresult 10 D2D1_GRADIENT_STOP* dword sdword sdword ID2D1GradientStopCollection**>
	^self invalidCall!

createLayer: size
	"Answer the <ID2D1Layer> result of invoking the CreateLayer() method of the COM object."

	| answer |
	answer := ID2D1Layer newPointer.
	self
		CreateLayer: size
		layer: answer.
	^answer asObject
!

CreateLayer: size layer: layer
	"Private - Invoke the CreateLayer() method of the COM object.

		HRESULT __stdcall CreateLayer(
			[in]D2D_SIZE_F* size,
			[out]ID2D1Layer** layer);"

	<virtual stdcall: hresult 14 D2D_SIZE_F* ID2D1Layer**>
	^self invalidCall!

createLinearGradientBrush: gradient_brush_desc brush_desc: brush_desc gradient: gradient
	"Answer the <ID2D1LinearGradientBrush> result of invoking the CreateLinearGradientBrush() method of the COM object."

	| answer |
	answer := ID2D1LinearGradientBrush newPointer.
	self
		CreateLinearGradientBrush: gradient_brush_desc
		brush_desc: brush_desc
		gradient: gradient
		brush: answer.
	^answer asObject
!

CreateLinearGradientBrush: gradient_brush_desc brush_desc: brush_desc gradient: gradient brush: brush
	"Private - Invoke the CreateLinearGradientBrush() method of the COM object.

		HRESULT __stdcall CreateLinearGradientBrush(
			[in]D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES* gradient_brush_desc,
			[in]D2D1_BRUSH_PROPERTIES* brush_desc,
			[in]ID2D1GradientStopCollection* gradient,
			[out]ID2D1LinearGradientBrush** brush);"

	<virtual stdcall: hresult 11 D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1GradientStopCollection* ID2D1LinearGradientBrush**>
	^self invalidCall!

createMesh
	"Answer the <ID2D1Mesh> result of invoking the CreateMesh() method of the COM object."

	| answer |
	answer := ID2D1Mesh newPointer.
	self CreateMesh: answer.
	^answer asObject
!

CreateMesh: mesh
	"Private - Invoke the CreateMesh() method of the COM object.

		HRESULT __stdcall CreateMesh(
			[out]ID2D1Mesh** mesh);"

	<virtual stdcall: hresult 15 ID2D1Mesh**>
	^self invalidCall!

createRadialGradientBrush: gradient_brush_desc brush_desc: brush_desc gradient: gradient
	"Answer the <ID2D1RadialGradientBrush> result of invoking the CreateRadialGradientBrush() method of the COM object."

	| answer |
	answer := ID2D1RadialGradientBrush newPointer.
	self
		CreateRadialGradientBrush: gradient_brush_desc
		brush_desc: brush_desc
		gradient: gradient
		brush: answer.
	^answer asObject
!

CreateRadialGradientBrush: gradient_brush_desc brush_desc: brush_desc gradient: gradient brush: brush
	"Private - Invoke the CreateRadialGradientBrush() method of the COM object.

		HRESULT __stdcall CreateRadialGradientBrush(
			[in]D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES* gradient_brush_desc,
			[in]D2D1_BRUSH_PROPERTIES* brush_desc,
			[in]ID2D1GradientStopCollection* gradient,
			[out]ID2D1RadialGradientBrush** brush);"

	<virtual stdcall: hresult 12 D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1GradientStopCollection* ID2D1RadialGradientBrush**>
	^self invalidCall!

createSharedBitmap: iid data: data desc: desc
	"Invoke the CreateSharedBitmap() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (VOID new value: data; yourself);
				basicAt: 2 put: ID2D1Bitmap newPointer;
				yourself.
	self
		CreateSharedBitmap: iid
		data: (answer basicAt: 1)
		desc: desc
		bitmap: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

CreateSharedBitmap: iid data: data desc: desc bitmap: bitmap
	"Private - Invoke the CreateSharedBitmap() method of the COM object.

		HRESULT __stdcall CreateSharedBitmap(
			[in]GUID* iid,
			[in, out]void* data,
			[in]D2D1_BITMAP_PROPERTIES* desc,
			[out]ID2D1Bitmap** bitmap);"

	<virtual stdcall: hresult 7 GUID* void* D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**>
	^self invalidCall!

createSolidColorBrush: color desc: desc
	"Answer the <ID2D1SolidColorBrush> result of invoking the CreateSolidColorBrush() method of the COM object."

	| answer |
	answer := ID2D1SolidColorBrush newPointer.
	self
		CreateSolidColorBrush: color
		desc: desc
		brush: answer.
	^answer asObject
!

CreateSolidColorBrush: color desc: desc brush: brush
	"Private - Invoke the CreateSolidColorBrush() method of the COM object.

		HRESULT __stdcall CreateSolidColorBrush(
			[in]D3DCOLORVALUE* color,
			[in]D2D1_BRUSH_PROPERTIES* desc,
			[out]ID2D1SolidColorBrush** brush);"

	<virtual stdcall: hresult 9 D3DCOLORVALUE* D2D1_BRUSH_PROPERTIES* ID2D1SolidColorBrush**>
	^self invalidCall!

drawBitmap: bitmap dst_rect: dst_rect opacity: opacity interpolation_mode: interpolation_mode src_rect: src_rect
	"Answer the <VOID> result of invoking the DrawBitmap() method of the COM object."

	self
		DrawBitmap: bitmap
		dst_rect: dst_rect
		opacity: opacity
		interpolation_mode: interpolation_mode
		src_rect: src_rect
!

DrawBitmap: bitmap dst_rect: dst_rect opacity: opacity interpolation_mode: interpolation_mode src_rect: src_rect
	"Private - Invoke the DrawBitmap() method of the COM object.

		void __stdcall DrawBitmap(
			[in]ID2D1Bitmap* bitmap,
			[in]D2D_RECT_F* dst_rect,
			[in]float opacity,
			[in]D2D1_BITMAP_INTERPOLATION_MODE interpolation_mode,
			[in]D2D_RECT_F* src_rect);"

	<virtual stdcall: void 27 ID2D1Bitmap* D2D_RECT_F* float sdword D2D_RECT_F*>
	^self invalidCall!

drawEllipse: ellipse brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Answer the <VOID> result of invoking the DrawEllipse() method of the COM object."

	self
		DrawEllipse: ellipse
		brush: brush
		stroke_width: stroke_width
		stroke_style: stroke_style
!

DrawEllipse: ellipse brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Private - Invoke the DrawEllipse() method of the COM object.

		void __stdcall DrawEllipse(
			[in]D2D1_ELLIPSE* ellipse,
			[in]ID2D1Brush* brush,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style);"

	<virtual stdcall: void 21 D2D1_ELLIPSE* ID2D1Brush* float ID2D1StrokeStyle*>
	^self invalidCall!

drawGeometry: geometry brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Answer the <VOID> result of invoking the DrawGeometry() method of the COM object."

	self
		DrawGeometry: geometry
		brush: brush
		stroke_width: stroke_width
		stroke_style: stroke_style
!

DrawGeometry: geometry brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Private - Invoke the DrawGeometry() method of the COM object.

		void __stdcall DrawGeometry(
			[in]ID2D1Geometry* geometry,
			[in]ID2D1Brush* brush,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style);"

	<virtual stdcall: void 23 ID2D1Geometry* ID2D1Brush* float ID2D1StrokeStyle*>
	^self invalidCall!

drawGlyphRun: baseline_origin glyph_run: glyph_run brush: brush measuring_mode: measuring_mode
	"Answer the <VOID> result of invoking the DrawGlyphRun() method of the COM object."

	self
		DrawGlyphRun: baseline_origin
		glyph_run: glyph_run
		brush: brush
		measuring_mode: measuring_mode
!

DrawGlyphRun: baseline_origin glyph_run: glyph_run brush: brush measuring_mode: measuring_mode
	"Private - Invoke the DrawGlyphRun() method of the COM object.

		void __stdcall DrawGlyphRun(
			[in]D2D_POINT_2F baseline_origin,
			[in]DWRITE_GLYPH_RUN* glyph_run,
			[in]ID2D1Brush* brush,
			[in]DWRITE_MEASURING_MODE measuring_mode);"

	<virtual stdcall: void 30 D2D_POINT_2F DWRITE_GLYPH_RUN* ID2D1Brush* sdword>
	^self invalidCall!

drawLine: p0 p1: p1 brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Answer the <VOID> result of invoking the DrawLine() method of the COM object."

	self
		DrawLine: p0
		p1: p1
		brush: brush
		stroke_width: stroke_width
		stroke_style: stroke_style
!

DrawLine: p0 p1: p1 brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Private - Invoke the DrawLine() method of the COM object.

		void __stdcall DrawLine(
			[in]D2D_POINT_2F p0,
			[in]D2D_POINT_2F p1,
			[in]ID2D1Brush* brush,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style);"

	<virtual stdcall: void 16 D2D_POINT_2F D2D_POINT_2F ID2D1Brush* float ID2D1StrokeStyle*>
	^self invalidCall!

drawRectangle: rect brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Answer the <VOID> result of invoking the DrawRectangle() method of the COM object."

	self
		DrawRectangle: rect
		brush: brush
		stroke_width: stroke_width
		stroke_style: stroke_style
!

DrawRectangle: rect brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Private - Invoke the DrawRectangle() method of the COM object.

		void __stdcall DrawRectangle(
			[in]D2D_RECT_F* rect,
			[in]ID2D1Brush* brush,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style);"

	<virtual stdcall: void 17 D2D_RECT_F* ID2D1Brush* float ID2D1StrokeStyle*>
	^self invalidCall!

drawRoundedRectangle: rect brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Answer the <VOID> result of invoking the DrawRoundedRectangle() method of the COM object."

	self
		DrawRoundedRectangle: rect
		brush: brush
		stroke_width: stroke_width
		stroke_style: stroke_style
!

DrawRoundedRectangle: rect brush: brush stroke_width: stroke_width stroke_style: stroke_style
	"Private - Invoke the DrawRoundedRectangle() method of the COM object.

		void __stdcall DrawRoundedRectangle(
			[in]D2D1_ROUNDED_RECT* rect,
			[in]ID2D1Brush* brush,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style);"

	<virtual stdcall: void 19 D2D1_ROUNDED_RECT* ID2D1Brush* float ID2D1StrokeStyle*>
	^self invalidCall!

drawText: string string_len: string_len text_format: text_format layout_rect: layout_rect brush: brush options: options measuring_mode: measuring_mode
	"Answer the <VOID> result of invoking the DrawText() method of the COM object."

	self
		DrawText: string
		string_len: string_len
		text_format: text_format
		layout_rect: layout_rect
		brush: brush
		options: options
		measuring_mode: measuring_mode
!

DrawText: string string_len: string_len text_format: text_format layout_rect: layout_rect brush: brush options: options measuring_mode: measuring_mode
	"Private - Invoke the DrawText() method of the COM object.

		void __stdcall DrawText(
			[in]unsigned short* string,
			[in]unsigned int string_len,
			[in]IDWriteTextFormat* text_format,
			[in]D2D_RECT_F* layout_rect,
			[in]ID2D1Brush* brush,
			[in]D2D1_DRAW_TEXT_OPTIONS options,
			[in]DWRITE_MEASURING_MODE measuring_mode);"

	<virtual stdcall: void 28 word* dword IDWriteTextFormat* D2D_RECT_F* ID2D1Brush* sdword sdword>
	^self invalidCall!

drawTextLayout: origin layout: layout brush: brush options: options
	"Answer the <VOID> result of invoking the DrawTextLayout() method of the COM object."

	self
		DrawTextLayout: origin
		layout: layout
		brush: brush
		options: options
!

DrawTextLayout: origin layout: layout brush: brush options: options
	"Private - Invoke the DrawTextLayout() method of the COM object.

		void __stdcall DrawTextLayout(
			[in]D2D_POINT_2F origin,
			[in]IDWriteTextLayout* layout,
			[in]ID2D1Brush* brush,
			[in]D2D1_DRAW_TEXT_OPTIONS options);"

	<virtual stdcall: void 29 D2D_POINT_2F IDWriteTextLayout* ID2D1Brush* sdword>
	^self invalidCall!

endDraw
	"Invoke the EndDraw() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (ULARGE_INTEGER new);
				basicAt: 2 put: (ULARGE_INTEGER new);
				yourself.
	self
		EndDraw: (answer basicAt: 1)
		tag2: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

EndDraw: tag1 tag2: tag2
	"Private - Invoke the EndDraw() method of the COM object.

		HRESULT __stdcall EndDraw(
			[out]D2D1_TAG* tag1,
			[out]D2D1_TAG* tag2);"

	<virtual stdcall: hresult 50 qword* qword*>
	^self invalidCall!

fillEllipse: ellipse brush: brush
	"Answer the <VOID> result of invoking the FillEllipse() method of the COM object."

	self
		FillEllipse: ellipse
		brush: brush
!

FillEllipse: ellipse brush: brush
	"Private - Invoke the FillEllipse() method of the COM object.

		void __stdcall FillEllipse(
			[in]D2D1_ELLIPSE* ellipse,
			[in]ID2D1Brush* brush);"

	<virtual stdcall: void 22 D2D1_ELLIPSE* ID2D1Brush*>
	^self invalidCall!

fillGeometry: geometry brush: brush opacity_brush: opacity_brush
	"Answer the <VOID> result of invoking the FillGeometry() method of the COM object."

	self
		FillGeometry: geometry
		brush: brush
		opacity_brush: opacity_brush
!

FillGeometry: geometry brush: brush opacity_brush: opacity_brush
	"Private - Invoke the FillGeometry() method of the COM object.

		void __stdcall FillGeometry(
			[in]ID2D1Geometry* geometry,
			[in]ID2D1Brush* brush,
			[in]ID2D1Brush* opacity_brush);"

	<virtual stdcall: void 24 ID2D1Geometry* ID2D1Brush* ID2D1Brush*>
	^self invalidCall!

fillMesh: mesh brush: brush
	"Answer the <VOID> result of invoking the FillMesh() method of the COM object."

	self
		FillMesh: mesh
		brush: brush
!

FillMesh: mesh brush: brush
	"Private - Invoke the FillMesh() method of the COM object.

		void __stdcall FillMesh(
			[in]ID2D1Mesh* mesh,
			[in]ID2D1Brush* brush);"

	<virtual stdcall: void 25 ID2D1Mesh* ID2D1Brush*>
	^self invalidCall!

fillOpacityMask: mask brush: brush content: content dst_rect: dst_rect src_rect: src_rect
	"Answer the <VOID> result of invoking the FillOpacityMask() method of the COM object."

	self
		FillOpacityMask: mask
		brush: brush
		content: content
		dst_rect: dst_rect
		src_rect: src_rect
!

FillOpacityMask: mask brush: brush content: content dst_rect: dst_rect src_rect: src_rect
	"Private - Invoke the FillOpacityMask() method of the COM object.

		void __stdcall FillOpacityMask(
			[in]ID2D1Bitmap* mask,
			[in]ID2D1Brush* brush,
			[in]D2D1_OPACITY_MASK_CONTENT content,
			[in]D2D_RECT_F* dst_rect,
			[in]D2D_RECT_F* src_rect);"

	<virtual stdcall: void 26 ID2D1Bitmap* ID2D1Brush* sdword D2D_RECT_F* D2D_RECT_F*>
	^self invalidCall!

fillRectangle: rect brush: brush
	"Answer the <VOID> result of invoking the FillRectangle() method of the COM object."

	self
		FillRectangle: rect
		brush: brush
!

FillRectangle: rect brush: brush
	"Private - Invoke the FillRectangle() method of the COM object.

		void __stdcall FillRectangle(
			[in]D2D_RECT_F* rect,
			[in]ID2D1Brush* brush);"

	<virtual stdcall: void 18 D2D_RECT_F* ID2D1Brush*>
	^self invalidCall!

fillRoundedRectangle: rect brush: brush
	"Answer the <VOID> result of invoking the FillRoundedRectangle() method of the COM object."

	self
		FillRoundedRectangle: rect
		brush: brush
!

FillRoundedRectangle: rect brush: brush
	"Private - Invoke the FillRoundedRectangle() method of the COM object.

		void __stdcall FillRoundedRectangle(
			[in]D2D1_ROUNDED_RECT* rect,
			[in]ID2D1Brush* brush);"

	<virtual stdcall: void 20 D2D1_ROUNDED_RECT* ID2D1Brush*>
	^self invalidCall!

flush
	"Invoke the Flush() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (ULARGE_INTEGER new);
				basicAt: 2 put: (ULARGE_INTEGER new);
				yourself.
	self
		Flush: (answer basicAt: 1)
		tag2: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

Flush: tag1 tag2: tag2
	"Private - Invoke the Flush() method of the COM object.

		HRESULT __stdcall Flush(
			[out]D2D1_TAG* tag1,
			[out]D2D1_TAG* tag2);"

	<virtual stdcall: hresult 43 qword* qword*>
	^self invalidCall!

getAntialiasMode
	"Answer the <SDWORD> result of invoking the GetAntialiasMode() method of the COM object."

	^self GetAntialiasMode
!

GetAntialiasMode
	"Private - Invoke the GetAntialiasMode() method of the COM object.

		D2D1_ANTIALIAS_MODE __stdcall GetAntialiasMode();"

	<virtual stdcall: sdword 34>
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

	<virtual stdcall: void 53 float* float*>
	^self invalidCall!

getMaximumBitmapSize
	"Answer the <DWORD> result of invoking the GetMaximumBitmapSize() method of the COM object."

	^self GetMaximumBitmapSize
!

GetMaximumBitmapSize
	"Private - Invoke the GetMaximumBitmapSize() method of the COM object.

		unsigned int __stdcall GetMaximumBitmapSize();"

	<virtual stdcall: dword 56>
	^self invalidCall!

getPixelFormat
	"Answer the <D2D1_PIXEL_FORMAT> result of invoking the GetPixelFormat() method of the COM object."

	^self GetPixelFormat
!

GetPixelFormat
	"Private - Invoke the GetPixelFormat() method of the COM object.

		D2D1_PIXEL_FORMAT __stdcall GetPixelFormat();"

	<virtual stdcall: D2D1_PIXEL_FORMAT 51>
	^self invalidCall!

getPixelSize
	"Answer the <D2D_SIZE_U> result of invoking the GetPixelSize() method of the COM object."

	^self GetPixelSize
!

GetPixelSize
	"Private - Invoke the GetPixelSize() method of the COM object.

		D2D_SIZE_U __stdcall GetPixelSize();"

	<virtual stdcall: D2D_SIZE_U 55>
	^self invalidCall!

getSize
	"Answer the <D2D_SIZE_F> result of invoking the GetSize() method of the COM object."

	^self GetSize
!

GetSize
	"Private - Invoke the GetSize() method of the COM object.

		D2D_SIZE_F __stdcall GetSize();"

	<virtual stdcall: D2D_SIZE_F 54>
	^self invalidCall!

getTags
	"Invoke the GetTags() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (ULARGE_INTEGER new);
				basicAt: 2 put: (ULARGE_INTEGER new);
				yourself.
	self
		GetTags: (answer basicAt: 1)
		tag2: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetTags: tag1 tag2: tag2
	"Private - Invoke the GetTags() method of the COM object.

		void __stdcall GetTags(
			[out]D2D1_TAG* tag1,
			[out]D2D1_TAG* tag2);"

	<virtual stdcall: void 40 qword* qword*>
	^self invalidCall!

getTextAntialiasMode
	"Answer the <SDWORD> result of invoking the GetTextAntialiasMode() method of the COM object."

	^self GetTextAntialiasMode
!

GetTextAntialiasMode
	"Private - Invoke the GetTextAntialiasMode() method of the COM object.

		D2D1_TEXT_ANTIALIAS_MODE __stdcall GetTextAntialiasMode();"

	<virtual stdcall: sdword 36>
	^self invalidCall!

getTextRenderingParams
	"Answer the <IDWriteRenderingParams> result of invoking the GetTextRenderingParams() method of the COM object."

	| answer |
	answer := IDWriteRenderingParams newPointer.
	self GetTextRenderingParams: answer.
	^answer asObject
!

GetTextRenderingParams: text_rendering_params
	"Private - Invoke the GetTextRenderingParams() method of the COM object.

		void __stdcall GetTextRenderingParams(
			[out]IDWriteRenderingParams** text_rendering_params);"

	<virtual stdcall: void 38 IDWriteRenderingParams**>
	^self invalidCall!

getTransform
	"Answer the <D2D_MATRIX_3X2_F> result of invoking the GetTransform() method of the COM object."

	| answer |
	answer := (D2D_MATRIX_3X2_F new).
	self GetTransform: answer.
	^answer asObject
!

GetTransform: transform
	"Private - Invoke the GetTransform() method of the COM object.

		void __stdcall GetTransform(
			[out]D2D_MATRIX_3X2_F* transform);"

	<virtual stdcall: void 32 D2D_MATRIX_3X2_F*>
	^self invalidCall!

isSupported: desc
	"Answer the <BOOL> result of invoking the IsSupported() method of the COM object."

	^self IsSupported: desc
!

IsSupported: desc
	"Private - Invoke the IsSupported() method of the COM object.

		BOOL __stdcall IsSupported(
			[in]D2D1_RENDER_TARGET_PROPERTIES* desc);"

	<virtual stdcall: bool 57 D2D1_RENDER_TARGET_PROPERTIES*>
	^self invalidCall!

popAxisAlignedClip
	"Answer the <VOID> result of invoking the PopAxisAlignedClip() method of the COM object."

	self PopAxisAlignedClip
!

PopAxisAlignedClip
	"Private - Invoke the PopAxisAlignedClip() method of the COM object.

		void __stdcall PopAxisAlignedClip();"

	<virtual stdcall: void 47>
	^self invalidCall!

popLayer
	"Answer the <VOID> result of invoking the PopLayer() method of the COM object."

	self PopLayer
!

PopLayer
	"Private - Invoke the PopLayer() method of the COM object.

		void __stdcall PopLayer();"

	<virtual stdcall: void 42>
	^self invalidCall!

pushAxisAlignedClip: clip_rect antialias_mode: antialias_mode
	"Answer the <VOID> result of invoking the PushAxisAlignedClip() method of the COM object."

	self
		PushAxisAlignedClip: clip_rect
		antialias_mode: antialias_mode
!

PushAxisAlignedClip: clip_rect antialias_mode: antialias_mode
	"Private - Invoke the PushAxisAlignedClip() method of the COM object.

		void __stdcall PushAxisAlignedClip(
			[in]D2D_RECT_F* clip_rect,
			[in]D2D1_ANTIALIAS_MODE antialias_mode);"

	<virtual stdcall: void 46 D2D_RECT_F* sdword>
	^self invalidCall!

pushLayer: layer_parameters layer: layer
	"Answer the <VOID> result of invoking the PushLayer() method of the COM object."

	self
		PushLayer: layer_parameters
		layer: layer
!

PushLayer: layer_parameters layer: layer
	"Private - Invoke the PushLayer() method of the COM object.

		void __stdcall PushLayer(
			[in]D2D1_LAYER_PARAMETERS* layer_parameters,
			[in]ID2D1Layer* layer);"

	<virtual stdcall: void 41 D2D1_LAYER_PARAMETERS* ID2D1Layer*>
	^self invalidCall!

restoreDrawingState: state_block
	"Answer the <VOID> result of invoking the RestoreDrawingState() method of the COM object."

	self RestoreDrawingState: state_block
!

RestoreDrawingState: state_block
	"Private - Invoke the RestoreDrawingState() method of the COM object.

		void __stdcall RestoreDrawingState(
			[in]ID2D1DrawingStateBlock* state_block);"

	<virtual stdcall: void 45 ID2D1DrawingStateBlock*>
	^self invalidCall!

saveDrawingState: state_block
	"Answer the <VOID> result of invoking the SaveDrawingState() method of the COM object."

	self SaveDrawingState: state_block
!

SaveDrawingState: state_block
	"Private - Invoke the SaveDrawingState() method of the COM object.

		void __stdcall SaveDrawingState(
			[in, out]ID2D1DrawingStateBlock* state_block);"

	<virtual stdcall: void 44 ID2D1DrawingStateBlock*>
	^self invalidCall!

setAntialiasMode: antialias_mode
	"Answer the <VOID> result of invoking the SetAntialiasMode() method of the COM object."

	self SetAntialiasMode: antialias_mode
!

SetAntialiasMode: antialias_mode
	"Private - Invoke the SetAntialiasMode() method of the COM object.

		void __stdcall SetAntialiasMode(
			[in]D2D1_ANTIALIAS_MODE antialias_mode);"

	<virtual stdcall: void 33 sdword>
	^self invalidCall!

setDpi: dpi_x dpi_y: dpi_y
	"Answer the <VOID> result of invoking the SetDpi() method of the COM object."

	self
		SetDpi: dpi_x
		dpi_y: dpi_y
!

SetDpi: dpi_x dpi_y: dpi_y
	"Private - Invoke the SetDpi() method of the COM object.

		void __stdcall SetDpi(
			[in]float dpi_x,
			[in]float dpi_y);"

	<virtual stdcall: void 52 float float>
	^self invalidCall!

setTags: tag1 tag2: tag2
	"Answer the <VOID> result of invoking the SetTags() method of the COM object."

	self
		SetTags: tag1
		tag2: tag2
!

SetTags: tag1 tag2: tag2
	"Private - Invoke the SetTags() method of the COM object.

		void __stdcall SetTags(
			[in]D2D1_TAG tag1,
			[in]D2D1_TAG tag2);"

	<virtual stdcall: void 39 qword qword>
	^self invalidCall!

setTextAntialiasMode: antialias_mode
	"Answer the <VOID> result of invoking the SetTextAntialiasMode() method of the COM object."

	self SetTextAntialiasMode: antialias_mode
!

SetTextAntialiasMode: antialias_mode
	"Private - Invoke the SetTextAntialiasMode() method of the COM object.

		void __stdcall SetTextAntialiasMode(
			[in]D2D1_TEXT_ANTIALIAS_MODE antialias_mode);"

	<virtual stdcall: void 35 sdword>
	^self invalidCall!

setTextRenderingParams: text_rendering_params
	"Answer the <VOID> result of invoking the SetTextRenderingParams() method of the COM object."

	self SetTextRenderingParams: text_rendering_params
!

SetTextRenderingParams: text_rendering_params
	"Private - Invoke the SetTextRenderingParams() method of the COM object.

		void __stdcall SetTextRenderingParams(
			[in]IDWriteRenderingParams* text_rendering_params);"

	<virtual stdcall: void 37 IDWriteRenderingParams*>
	^self invalidCall!

setTransform: transform
	"Answer the <VOID> result of invoking the SetTransform() method of the COM object."

	self SetTransform: transform
!

SetTransform: transform
	"Private - Invoke the SetTransform() method of the COM object.

		void __stdcall SetTransform(
			[in]D2D_MATRIX_3X2_F* transform);"

	<virtual stdcall: void 31 D2D_MATRIX_3X2_F*>
	^self invalidCall! !
!ID2D1RenderTarget categoriesFor: #beginDraw!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #BeginDraw!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #clear:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #Clear:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createBitmap:src_data:pitch:desc:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateBitmap:src_data:pitch:desc:bitmap:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createBitmapBrush:bitmap_brush_desc:brush_desc:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateBitmapBrush:bitmap_brush_desc:brush_desc:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createBitmapFromWicBitmap:desc:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateBitmapFromWicBitmap:desc:bitmap:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createCompatibleRenderTarget:pixel_size:format:options:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateCompatibleRenderTarget:pixel_size:format:options:render_target:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createGradientStopCollection:stop_count:gamma:extend_mode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateGradientStopCollection:stop_count:gamma:extend_mode:gradient:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createLayer:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateLayer:layer:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createLinearGradientBrush:brush_desc:gradient:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateLinearGradientBrush:brush_desc:gradient:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createMesh!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateMesh:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createRadialGradientBrush:brush_desc:gradient:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateRadialGradientBrush:brush_desc:gradient:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createSharedBitmap:data:desc:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateSharedBitmap:data:desc:bitmap:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #createSolidColorBrush:desc:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #CreateSolidColorBrush:desc:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawBitmap:dst_rect:opacity:interpolation_mode:src_rect:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawBitmap:dst_rect:opacity:interpolation_mode:src_rect:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawEllipse:brush:stroke_width:stroke_style:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawEllipse:brush:stroke_width:stroke_style:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawGeometry:brush:stroke_width:stroke_style:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawGeometry:brush:stroke_width:stroke_style:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawGlyphRun:glyph_run:brush:measuring_mode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawGlyphRun:glyph_run:brush:measuring_mode:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawLine:p1:brush:stroke_width:stroke_style:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawLine:p1:brush:stroke_width:stroke_style:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawRectangle:brush:stroke_width:stroke_style:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawRectangle:brush:stroke_width:stroke_style:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawRoundedRectangle:brush:stroke_width:stroke_style:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawRoundedRectangle:brush:stroke_width:stroke_style:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawText:string_len:text_format:layout_rect:brush:options:measuring_mode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawText:string_len:text_format:layout_rect:brush:options:measuring_mode:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #drawTextLayout:layout:brush:options:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #DrawTextLayout:layout:brush:options:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #endDraw!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #EndDraw:tag2:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillEllipse:brush:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillEllipse:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillGeometry:brush:opacity_brush:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillGeometry:brush:opacity_brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillMesh:brush:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillMesh:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillOpacityMask:brush:content:dst_rect:src_rect:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillOpacityMask:brush:content:dst_rect:src_rect:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillRectangle:brush:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillRectangle:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #fillRoundedRectangle:brush:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #FillRoundedRectangle:brush:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #flush!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #Flush:tag2:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getAntialiasMode!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetAntialiasMode!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getDpi!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetDpi:dpi_y:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getMaximumBitmapSize!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetMaximumBitmapSize!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getPixelFormat!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetPixelFormat!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getPixelSize!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetPixelSize!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getSize!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetSize!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getTags!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetTags:tag2:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getTextAntialiasMode!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetTextAntialiasMode!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getTextRenderingParams!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetTextRenderingParams:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #getTransform!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #GetTransform:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #isSupported:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #IsSupported:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #popAxisAlignedClip!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #PopAxisAlignedClip!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #popLayer!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #PopLayer!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #pushAxisAlignedClip:antialias_mode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #PushAxisAlignedClip:antialias_mode:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #pushLayer:layer:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #PushLayer:layer:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #restoreDrawingState:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #RestoreDrawingState:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #saveDrawingState:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SaveDrawingState:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setAntialiasMode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetAntialiasMode:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setDpi:dpi_y:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetDpi:dpi_y:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setTags:tag2:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetTags:tag2:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setTextAntialiasMode:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetTextAntialiasMode:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setTextRenderingParams:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetTextRenderingParams:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !
!ID2D1RenderTarget categoriesFor: #setTransform:!**auto generated**!methods!public! !
!ID2D1RenderTarget categoriesFor: #SetTransform:!**auto generated**!COM Interfaces-ID2D1RenderTarget!private! !

!ID2D1RenderTarget class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1RenderTarget'
		ID2D1RenderTarget defineTemplate"

	self
		defineFunction: #CreateBitmap:src_data:pitch:desc:bitmap:
			argumentTypes: 'D2D_SIZE_U void* dword D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**';
		defineFunction: #CreateBitmapFromWicBitmap:desc:bitmap:
			argumentTypes: 'IWICBitmapSource* D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**';
		defineFunction: #CreateSharedBitmap:data:desc:bitmap:
			argumentTypes: 'GUID* void* D2D1_BITMAP_PROPERTIES* ID2D1Bitmap**';
		defineFunction: #CreateBitmapBrush:bitmap_brush_desc:brush_desc:brush:
			argumentTypes: 'ID2D1Bitmap* D2D1_BITMAP_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1BitmapBrush**';
		defineFunction: #CreateSolidColorBrush:desc:brush:
			argumentTypes: 'D3DCOLORVALUE* D2D1_BRUSH_PROPERTIES* ID2D1SolidColorBrush**';
		defineFunction: #CreateGradientStopCollection:stop_count:gamma:extend_mode:gradient:
			argumentTypes: 'D2D1_GRADIENT_STOP* dword sdword sdword ID2D1GradientStopCollection**';
		defineFunction: #CreateLinearGradientBrush:brush_desc:gradient:brush:
			argumentTypes: 'D2D1_LINEAR_GRADIENT_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1GradientStopCollection* ID2D1LinearGradientBrush**';
		defineFunction: #CreateRadialGradientBrush:brush_desc:gradient:brush:
			argumentTypes: 'D2D1_RADIAL_GRADIENT_BRUSH_PROPERTIES* D2D1_BRUSH_PROPERTIES* ID2D1GradientStopCollection* ID2D1RadialGradientBrush**';
		defineFunction: #CreateCompatibleRenderTarget:pixel_size:format:options:render_target:
			argumentTypes: 'D2D_SIZE_F* D2D_SIZE_U* D2D1_PIXEL_FORMAT* sdword ID2D1BitmapRenderTarget**';
		defineFunction: #CreateLayer:layer:
			argumentTypes: 'D2D_SIZE_F* ID2D1Layer**';
		defineFunction: #CreateMesh:
			argumentTypes: 'ID2D1Mesh**';
		defineFunction: #DrawLine:p1:brush:stroke_width:stroke_style:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F D2D_POINT_2F ID2D1Brush* float ID2D1StrokeStyle*';
		defineFunction: #DrawRectangle:brush:stroke_width:stroke_style:
			returnType: 'void'
			argumentTypes: 'D2D_RECT_F* ID2D1Brush* float ID2D1StrokeStyle*';
		defineFunction: #FillRectangle:brush:
			returnType: 'void'
			argumentTypes: 'D2D_RECT_F* ID2D1Brush*';
		defineFunction: #DrawRoundedRectangle:brush:stroke_width:stroke_style:
			returnType: 'void'
			argumentTypes: 'D2D1_ROUNDED_RECT* ID2D1Brush* float ID2D1StrokeStyle*';
		defineFunction: #FillRoundedRectangle:brush:
			returnType: 'void'
			argumentTypes: 'D2D1_ROUNDED_RECT* ID2D1Brush*';
		defineFunction: #DrawEllipse:brush:stroke_width:stroke_style:
			returnType: 'void'
			argumentTypes: 'D2D1_ELLIPSE* ID2D1Brush* float ID2D1StrokeStyle*';
		defineFunction: #FillEllipse:brush:
			returnType: 'void'
			argumentTypes: 'D2D1_ELLIPSE* ID2D1Brush*';
		defineFunction: #DrawGeometry:brush:stroke_width:stroke_style:
			returnType: 'void'
			argumentTypes: 'ID2D1Geometry* ID2D1Brush* float ID2D1StrokeStyle*';
		defineFunction: #FillGeometry:brush:opacity_brush:
			returnType: 'void'
			argumentTypes: 'ID2D1Geometry* ID2D1Brush* ID2D1Brush*';
		defineFunction: #FillMesh:brush:
			returnType: 'void'
			argumentTypes: 'ID2D1Mesh* ID2D1Brush*';
		defineFunction: #FillOpacityMask:brush:content:dst_rect:src_rect:
			returnType: 'void'
			argumentTypes: 'ID2D1Bitmap* ID2D1Brush* sdword D2D_RECT_F* D2D_RECT_F*';
		defineFunction: #DrawBitmap:dst_rect:opacity:interpolation_mode:src_rect:
			returnType: 'void'
			argumentTypes: 'ID2D1Bitmap* D2D_RECT_F* float sdword D2D_RECT_F*';
		defineFunction: #DrawText:string_len:text_format:layout_rect:brush:options:measuring_mode:
			returnType: 'void'
			argumentTypes: 'word* dword IDWriteTextFormat* D2D_RECT_F* ID2D1Brush* sdword sdword';
		defineFunction: #DrawTextLayout:layout:brush:options:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F IDWriteTextLayout* ID2D1Brush* sdword';
		defineFunction: #DrawGlyphRun:glyph_run:brush:measuring_mode:
			returnType: 'void'
			argumentTypes: 'D2D_POINT_2F DWRITE_GLYPH_RUN* ID2D1Brush* sdword';
		defineFunction: #SetTransform:
			returnType: 'void'
			argumentTypes: 'D2D_MATRIX_3X2_F*';
		defineFunction: #GetTransform:
			returnType: 'void'
			argumentTypes: 'D2D_MATRIX_3X2_F*';
		defineFunction: #SetAntialiasMode:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #GetAntialiasMode
			returnType: 'sdword';
		defineFunction: #SetTextAntialiasMode:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #GetTextAntialiasMode
			returnType: 'sdword';
		defineFunction: #SetTextRenderingParams:
			returnType: 'void'
			argumentTypes: 'IDWriteRenderingParams*';
		defineFunction: #GetTextRenderingParams:
			returnType: 'void'
			argumentTypes: 'IDWriteRenderingParams**';
		defineFunction: #SetTags:tag2:
			returnType: 'void'
			argumentTypes: 'qword qword';
		defineFunction: #GetTags:tag2:
			returnType: 'void'
			argumentTypes: 'qword* qword*';
		defineFunction: #PushLayer:layer:
			returnType: 'void'
			argumentTypes: 'D2D1_LAYER_PARAMETERS* ID2D1Layer*';
		defineFunction: #PopLayer
			returnType: 'void';
		defineFunction: #Flush:tag2:
			argumentTypes: 'qword* qword*';
		defineFunction: #SaveDrawingState:
			returnType: 'void'
			argumentTypes: 'ID2D1DrawingStateBlock*';
		defineFunction: #RestoreDrawingState:
			returnType: 'void'
			argumentTypes: 'ID2D1DrawingStateBlock*';
		defineFunction: #PushAxisAlignedClip:antialias_mode:
			returnType: 'void'
			argumentTypes: 'D2D_RECT_F* sdword';
		defineFunction: #PopAxisAlignedClip
			returnType: 'void';
		defineFunction: #Clear:
			returnType: 'void'
			argumentTypes: 'D3DCOLORVALUE*';
		defineFunction: #BeginDraw
			returnType: 'void';
		defineFunction: #EndDraw:tag2:
			argumentTypes: 'qword* qword*';
		defineFunction: #GetPixelFormat
			returnType: 'D2D1_PIXEL_FORMAT';
		defineFunction: #SetDpi:dpi_y:
			returnType: 'void'
			argumentTypes: 'float float';
		defineFunction: #GetDpi:dpi_y:
			returnType: 'void'
			argumentTypes: 'float* float*';
		defineFunction: #GetSize
			returnType: 'D2D_SIZE_F';
		defineFunction: #GetPixelSize
			returnType: 'D2D_SIZE_U';
		defineFunction: #GetMaximumBitmapSize
			returnType: 'dword';
		defineFunction: #IsSupported:
			returnType: 'bool'
			argumentTypes: 'D2D1_RENDER_TARGET_PROPERTIES*'
! !
!ID2D1RenderTarget class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

