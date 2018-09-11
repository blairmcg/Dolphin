"Filed out from Dolphin Smalltalk 7"!

ID2D1Resource subclass: #ID2D1Geometry
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1Geometry guid: (IID fromString: '{2CD906A1-12E2-11DC-9FED-001143A055F9}')!
ID2D1Geometry comment: '`ID2D1Geometry` is a wrapper class for the COM interface ''Direct2d.ID2D1Geometry'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906a1-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1Geometry : ID2D1Resource
 {
	[id(0x60020000)]
	HRESULT __stdcall GetBounds(
		[in]D2D_MATRIX_3X2_F* transform,
		[out]D2D_RECT_F* bounds);
	[id(0x60020001)]
	HRESULT __stdcall GetWidenedBounds(
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]D2D_RECT_F* bounds);
	[id(0x60020002)]
	HRESULT __stdcall StrokeContainsPoint(
		[in]D2D_POINT_2F point,
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]BOOL* contains);
	[id(0x60020003)]
	HRESULT __stdcall FillContainsPoint(
		[in]D2D_POINT_2F point,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]BOOL* contains);
	[id(0x60020004)]
	HRESULT __stdcall CompareWithGeometry(
		[in]ID2D1Geometry* geometry,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]D2D1_GEOMETRY_RELATION* relation);
	[id(0x60020005)]
	HRESULT __stdcall Simplify(
		[in]D2D1_GEOMETRY_SIMPLIFICATION_OPTION option,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[in]ID2D1SimplifiedGeometrySink* sink);
	[id(0x60020006)]
	HRESULT __stdcall Tessellate(
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[in]ID2D1TessellationSink* sink);
	[id(0x60020007)]
	HRESULT __stdcall CombineWithGeometry(
		[in]ID2D1Geometry* geometry,
		[in]D2D1_COMBINE_MODE combine_mode,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[in]ID2D1SimplifiedGeometrySink* sink);
	[id(0x60020008)]
	HRESULT __stdcall Outline(
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[in]ID2D1SimplifiedGeometrySink* sink);
	[id(0x60020009)]
	HRESULT __stdcall ComputeArea(
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]float* area);
	[id(0x6002000a)]
	HRESULT __stdcall ComputeLength(
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]float* length);
	[id(0x6002000b)]
	HRESULT __stdcall ComputePointAtLength(
		[in]float length,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[out]D2D_POINT_2F* point,
		[out]D2D_POINT_2F* tangent);
	[id(0x6002000c)]
	HRESULT __stdcall Widen(
		[in]float stroke_width,
		[in]ID2D1StrokeStyle* stroke_style,
		[in]D2D_MATRIX_3X2_F* transform,
		[in]float tolerance,
		[in]ID2D1SimplifiedGeometrySink* sink);
};

```'!
!ID2D1Geometry categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1Geometry methodsFor!

combineWithGeometry: geometry combine_mode: combine_mode transform: transform tolerance: tolerance sink: sink
	"Invoke the CombineWithGeometry() method of the COM object."

	^self
		CombineWithGeometry: geometry
		combine_mode: combine_mode
		transform: transform
		tolerance: tolerance
		sink: sink
!

CombineWithGeometry: geometry combine_mode: combine_mode transform: transform tolerance: tolerance sink: sink
	"Private - Invoke the CombineWithGeometry() method of the COM object.

		HRESULT __stdcall CombineWithGeometry(
			[in]ID2D1Geometry* geometry,
			[in]D2D1_COMBINE_MODE combine_mode,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[in]ID2D1SimplifiedGeometrySink* sink);"

	<virtual stdcall: hresult 12 ID2D1Geometry* sdword D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*>
	^self invalidCall!

compareWithGeometry: geometry transform: transform tolerance: tolerance
	"Answer the <SDWORD> result of invoking the CompareWithGeometry() method of the COM object."

	| answer |
	answer := (SDWORD new).
	self
		CompareWithGeometry: geometry
		transform: transform
		tolerance: tolerance
		relation: answer.
	^answer asObject
!

CompareWithGeometry: geometry transform: transform tolerance: tolerance relation: relation
	"Private - Invoke the CompareWithGeometry() method of the COM object.

		HRESULT __stdcall CompareWithGeometry(
			[in]ID2D1Geometry* geometry,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]D2D1_GEOMETRY_RELATION* relation);"

	<virtual stdcall: hresult 9 ID2D1Geometry* D2D_MATRIX_3X2_F* float sdword*>
	^self invalidCall!

computeArea: transform tolerance: tolerance
	"Answer the <FLOAT> result of invoking the ComputeArea() method of the COM object."

	| answer |
	answer := (FLOAT new).
	self
		ComputeArea: transform
		tolerance: tolerance
		area: answer.
	^answer asObject
!

ComputeArea: transform tolerance: tolerance area: area
	"Private - Invoke the ComputeArea() method of the COM object.

		HRESULT __stdcall ComputeArea(
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]float* area);"

	<virtual stdcall: hresult 14 D2D_MATRIX_3X2_F* float float*>
	^self invalidCall!

computeLength: transform tolerance: tolerance
	"Answer the <FLOAT> result of invoking the ComputeLength() method of the COM object."

	| answer |
	answer := (FLOAT new).
	self
		ComputeLength: transform
		tolerance: tolerance
		length: answer.
	^answer asObject
!

ComputeLength: transform tolerance: tolerance length: length
	"Private - Invoke the ComputeLength() method of the COM object.

		HRESULT __stdcall ComputeLength(
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]float* length);"

	<virtual stdcall: hresult 15 D2D_MATRIX_3X2_F* float float*>
	^self invalidCall!

computePointAtLength: length transform: transform tolerance: tolerance
	"Invoke the ComputePointAtLength() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: (D2D_POINT_2F new);
				basicAt: 2 put: (D2D_POINT_2F new);
				yourself.
	self
		ComputePointAtLength: length
		transform: transform
		tolerance: tolerance
		point: (answer basicAt: 1)
		tangent: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

ComputePointAtLength: length transform: transform tolerance: tolerance point: point tangent: tangent
	"Private - Invoke the ComputePointAtLength() method of the COM object.

		HRESULT __stdcall ComputePointAtLength(
			[in]float length,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]D2D_POINT_2F* point,
			[out]D2D_POINT_2F* tangent);"

	<virtual stdcall: hresult 16 float D2D_MATRIX_3X2_F* float D2D_POINT_2F* D2D_POINT_2F*>
	^self invalidCall!

fillContainsPoint: point transform: transform tolerance: tolerance
	"Answer the <BOOL> result of invoking the FillContainsPoint() method of the COM object."

	| answer |
	answer := (BOOL new).
	self
		FillContainsPoint: point
		transform: transform
		tolerance: tolerance
		contains: answer.
	^answer asObject
!

FillContainsPoint: point transform: transform tolerance: tolerance contains: contains
	"Private - Invoke the FillContainsPoint() method of the COM object.

		HRESULT __stdcall FillContainsPoint(
			[in]D2D_POINT_2F point,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]BOOL* contains);"

	<virtual stdcall: hresult 8 D2D_POINT_2F D2D_MATRIX_3X2_F* float bool*>
	^self invalidCall!

getBounds: transform
	"Answer the <D2D_RECT_F> result of invoking the GetBounds() method of the COM object."

	| answer |
	answer := (D2D_RECT_F new).
	self
		GetBounds: transform
		bounds: answer.
	^answer asObject
!

GetBounds: transform bounds: bounds
	"Private - Invoke the GetBounds() method of the COM object.

		HRESULT __stdcall GetBounds(
			[in]D2D_MATRIX_3X2_F* transform,
			[out]D2D_RECT_F* bounds);"

	<virtual stdcall: hresult 5 D2D_MATRIX_3X2_F* D2D_RECT_F*>
	^self invalidCall!

getWidenedBounds: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance
	"Answer the <D2D_RECT_F> result of invoking the GetWidenedBounds() method of the COM object."

	| answer |
	answer := (D2D_RECT_F new).
	self
		GetWidenedBounds: stroke_width
		stroke_style: stroke_style
		transform: transform
		tolerance: tolerance
		bounds: answer.
	^answer asObject
!

GetWidenedBounds: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance bounds: bounds
	"Private - Invoke the GetWidenedBounds() method of the COM object.

		HRESULT __stdcall GetWidenedBounds(
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]D2D_RECT_F* bounds);"

	<virtual stdcall: hresult 6 float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float D2D_RECT_F*>
	^self invalidCall!

outline: transform tolerance: tolerance sink: sink
	"Invoke the Outline() method of the COM object."

	^self
		Outline: transform
		tolerance: tolerance
		sink: sink
!

Outline: transform tolerance: tolerance sink: sink
	"Private - Invoke the Outline() method of the COM object.

		HRESULT __stdcall Outline(
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[in]ID2D1SimplifiedGeometrySink* sink);"

	<virtual stdcall: hresult 13 D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*>
	^self invalidCall!

simplify: option transform: transform tolerance: tolerance sink: sink
	"Invoke the Simplify() method of the COM object."

	^self
		Simplify: option
		transform: transform
		tolerance: tolerance
		sink: sink
!

Simplify: option transform: transform tolerance: tolerance sink: sink
	"Private - Invoke the Simplify() method of the COM object.

		HRESULT __stdcall Simplify(
			[in]D2D1_GEOMETRY_SIMPLIFICATION_OPTION option,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[in]ID2D1SimplifiedGeometrySink* sink);"

	<virtual stdcall: hresult 10 sdword D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*>
	^self invalidCall!

strokeContainsPoint: point stroke_width: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance
	"Answer the <BOOL> result of invoking the StrokeContainsPoint() method of the COM object."

	| answer |
	answer := (BOOL new).
	self
		StrokeContainsPoint: point
		stroke_width: stroke_width
		stroke_style: stroke_style
		transform: transform
		tolerance: tolerance
		contains: answer.
	^answer asObject
!

StrokeContainsPoint: point stroke_width: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance contains: contains
	"Private - Invoke the StrokeContainsPoint() method of the COM object.

		HRESULT __stdcall StrokeContainsPoint(
			[in]D2D_POINT_2F point,
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[out]BOOL* contains);"

	<virtual stdcall: hresult 7 D2D_POINT_2F float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float bool*>
	^self invalidCall!

tessellate: transform tolerance: tolerance sink: sink
	"Invoke the Tessellate() method of the COM object."

	^self
		Tessellate: transform
		tolerance: tolerance
		sink: sink
!

Tessellate: transform tolerance: tolerance sink: sink
	"Private - Invoke the Tessellate() method of the COM object.

		HRESULT __stdcall Tessellate(
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[in]ID2D1TessellationSink* sink);"

	<virtual stdcall: hresult 11 D2D_MATRIX_3X2_F* float ID2D1TessellationSink*>
	^self invalidCall!

widen: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance sink: sink
	"Invoke the Widen() method of the COM object."

	^self
		Widen: stroke_width
		stroke_style: stroke_style
		transform: transform
		tolerance: tolerance
		sink: sink
!

Widen: stroke_width stroke_style: stroke_style transform: transform tolerance: tolerance sink: sink
	"Private - Invoke the Widen() method of the COM object.

		HRESULT __stdcall Widen(
			[in]float stroke_width,
			[in]ID2D1StrokeStyle* stroke_style,
			[in]D2D_MATRIX_3X2_F* transform,
			[in]float tolerance,
			[in]ID2D1SimplifiedGeometrySink* sink);"

	<virtual stdcall: hresult 17 float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*>
	^self invalidCall! !
!ID2D1Geometry categoriesFor: #combineWithGeometry:combine_mode:transform:tolerance:sink:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #CombineWithGeometry:combine_mode:transform:tolerance:sink:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #compareWithGeometry:transform:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #CompareWithGeometry:transform:tolerance:relation:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #computeArea:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #ComputeArea:tolerance:area:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #computeLength:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #ComputeLength:tolerance:length:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #computePointAtLength:transform:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #ComputePointAtLength:transform:tolerance:point:tangent:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #fillContainsPoint:transform:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #FillContainsPoint:transform:tolerance:contains:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #getBounds:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #GetBounds:bounds:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #getWidenedBounds:stroke_style:transform:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #GetWidenedBounds:stroke_style:transform:tolerance:bounds:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #outline:tolerance:sink:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #Outline:tolerance:sink:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #simplify:transform:tolerance:sink:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #Simplify:transform:tolerance:sink:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #strokeContainsPoint:stroke_width:stroke_style:transform:tolerance:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #StrokeContainsPoint:stroke_width:stroke_style:transform:tolerance:contains:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #tessellate:tolerance:sink:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #Tessellate:tolerance:sink:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !
!ID2D1Geometry categoriesFor: #widen:stroke_style:transform:tolerance:sink:!**auto generated**!methods!public! !
!ID2D1Geometry categoriesFor: #Widen:stroke_style:transform:tolerance:sink:!**auto generated**!COM Interfaces-ID2D1Geometry!private! !

!ID2D1Geometry class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1Geometry'
		ID2D1Geometry defineTemplate"

	self
		defineFunction: #GetBounds:bounds:
			argumentTypes: 'D2D_MATRIX_3X2_F* D2D_RECT_F*';
		defineFunction: #GetWidenedBounds:stroke_style:transform:tolerance:bounds:
			argumentTypes: 'float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float D2D_RECT_F*';
		defineFunction: #StrokeContainsPoint:stroke_width:stroke_style:transform:tolerance:contains:
			argumentTypes: 'D2D_POINT_2F float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float bool*';
		defineFunction: #FillContainsPoint:transform:tolerance:contains:
			argumentTypes: 'D2D_POINT_2F D2D_MATRIX_3X2_F* float bool*';
		defineFunction: #CompareWithGeometry:transform:tolerance:relation:
			argumentTypes: 'ID2D1Geometry* D2D_MATRIX_3X2_F* float sdword*';
		defineFunction: #Simplify:transform:tolerance:sink:
			argumentTypes: 'sdword D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*';
		defineFunction: #Tessellate:tolerance:sink:
			argumentTypes: 'D2D_MATRIX_3X2_F* float ID2D1TessellationSink*';
		defineFunction: #CombineWithGeometry:combine_mode:transform:tolerance:sink:
			argumentTypes: 'ID2D1Geometry* sdword D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*';
		defineFunction: #Outline:tolerance:sink:
			argumentTypes: 'D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*';
		defineFunction: #ComputeArea:tolerance:area:
			argumentTypes: 'D2D_MATRIX_3X2_F* float float*';
		defineFunction: #ComputeLength:tolerance:length:
			argumentTypes: 'D2D_MATRIX_3X2_F* float float*';
		defineFunction: #ComputePointAtLength:transform:tolerance:point:tangent:
			argumentTypes: 'float D2D_MATRIX_3X2_F* float D2D_POINT_2F* D2D_POINT_2F*';
		defineFunction: #Widen:stroke_style:transform:tolerance:sink:
			argumentTypes: 'float ID2D1StrokeStyle* D2D_MATRIX_3X2_F* float ID2D1SimplifiedGeometrySink*'
! !
!ID2D1Geometry class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

