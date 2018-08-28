"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWritePixelSnapping
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWritePixelSnapping guid: (IID fromString: '{EAF3A2DA-ECF4-4D24-B644-B34F6842024B}')!
IDWritePixelSnapping comment: '`IDWritePixelSnapping` is a wrapper class for the COM interface ''DirectWrite.IDWritePixelSnapping'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWritePixelSnapping interface defines the pixel snapping properties of a text renderer."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(eaf3a2da-ecf4-4d24-b644-b34f6842024b), 
	helpstring("The IDWritePixelSnapping interface defines the pixel snapping properties of a text renderer.")
]
interface IDWritePixelSnapping : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall IsPixelSnappingDisabled(
		[in]void* clientDrawingContext,
		[out]BOOL* isDisabled);
	[id(0x60010001)]
	HRESULT __stdcall GetCurrentTransform(
		[in]void* clientDrawingContext,
		[out]DWRITE_MATRIX* transform);
	[id(0x60010002)]
	HRESULT __stdcall GetPixelsPerDip(
		[in]void* clientDrawingContext,
		[out]float* pixelsPerDip);
};

```'!
!IDWritePixelSnapping categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWritePixelSnapping methodsFor!

getCurrentTransform: clientDrawingContext
	"Answer the <DWRITE_MATRIX> result of invoking the GetCurrentTransform() method of the COM object."

	| answer |
	answer := (DWRITE_MATRIX new).
	self
		GetCurrentTransform: clientDrawingContext
		transform: answer.
	^answer asObject
!

GetCurrentTransform: clientDrawingContext transform: transform
	"Private - Invoke the GetCurrentTransform() method of the COM object.

		HRESULT __stdcall GetCurrentTransform(
			[in]void* clientDrawingContext,
			[out]DWRITE_MATRIX* transform);"

	<virtual stdcall: hresult 5 void* DWRITE_MATRIX*>
	^self invalidCall!

getPixelsPerDip: clientDrawingContext
	"Answer the <FLOAT> result of invoking the GetPixelsPerDip() method of the COM object."

	| answer |
	answer := (FLOAT new).
	self
		GetPixelsPerDip: clientDrawingContext
		pixelsPerDip: answer.
	^answer asObject
!

GetPixelsPerDip: clientDrawingContext pixelsPerDip: pixelsPerDip
	"Private - Invoke the GetPixelsPerDip() method of the COM object.

		HRESULT __stdcall GetPixelsPerDip(
			[in]void* clientDrawingContext,
			[out]float* pixelsPerDip);"

	<virtual stdcall: hresult 6 void* float*>
	^self invalidCall!

isPixelSnappingDisabled: clientDrawingContext
	"Answer the <BOOL> result of invoking the IsPixelSnappingDisabled() method of the COM object."

	| answer |
	answer := (BOOL new).
	self
		IsPixelSnappingDisabled: clientDrawingContext
		isDisabled: answer.
	^answer asObject
!

IsPixelSnappingDisabled: clientDrawingContext isDisabled: isDisabled
	"Private - Invoke the IsPixelSnappingDisabled() method of the COM object.

		HRESULT __stdcall IsPixelSnappingDisabled(
			[in]void* clientDrawingContext,
			[out]BOOL* isDisabled);"

	<virtual stdcall: hresult 4 void* bool*>
	^self invalidCall! !
!IDWritePixelSnapping categoriesFor: #getCurrentTransform:!**auto generated**!methods!public! !
!IDWritePixelSnapping categoriesFor: #GetCurrentTransform:transform:!**auto generated**!COM Interfaces-IDWritePixelSnapping!private! !
!IDWritePixelSnapping categoriesFor: #getPixelsPerDip:!**auto generated**!methods!public! !
!IDWritePixelSnapping categoriesFor: #GetPixelsPerDip:pixelsPerDip:!**auto generated**!COM Interfaces-IDWritePixelSnapping!private! !
!IDWritePixelSnapping categoriesFor: #isPixelSnappingDisabled:!**auto generated**!methods!public! !
!IDWritePixelSnapping categoriesFor: #IsPixelSnappingDisabled:isDisabled:!**auto generated**!COM Interfaces-IDWritePixelSnapping!private! !

!IDWritePixelSnapping class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWritePixelSnapping'
		IDWritePixelSnapping defineTemplate"

	self
		defineFunction: #IsPixelSnappingDisabled:isDisabled:
			argumentTypes: 'void* bool*';
		defineFunction: #GetCurrentTransform:transform:
			argumentTypes: 'void* DWRITE_MATRIX*';
		defineFunction: #GetPixelsPerDip:pixelsPerDip:
			argumentTypes: 'void* float*'
! !
!IDWritePixelSnapping class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

