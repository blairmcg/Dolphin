"Filed out from Dolphin Smalltalk 7"!

ID2D1Brush subclass: #ID2D1BitmapBrush
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
ID2D1BitmapBrush guid: (IID fromString: '{2CD906AA-12E2-11DC-9FED-001143A055F9}')!
ID2D1BitmapBrush comment: '`ID2D1BitmapBrush` is a wrapper class for the COM interface ''Direct2d.ID2D1BitmapBrush'' generated from type information in the ''Windows Direct2D API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains no documentation for this interface

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(2cd906aa-12e2-11dc-9fed-001143a055f9)
]
interface ID2D1BitmapBrush : ID2D1Brush
 {
	[id(0x60030000)]
	void __stdcall SetExtendModeX(
		[in]D2D1_EXTEND_MODE mode);
	[id(0x60030001)]
	void __stdcall SetExtendModeY(
		[in]D2D1_EXTEND_MODE mode);
	[id(0x60030002)]
	void __stdcall SetInterpolationMode(
		[in]D2D1_BITMAP_INTERPOLATION_MODE mode);
	[id(0x60030003)]
	void __stdcall SetBitmap(
		[in]ID2D1Bitmap* bitmap);
	[id(0x60030004)]
	D2D1_EXTEND_MODE __stdcall GetExtendModeX();
	[id(0x60030005)]
	D2D1_EXTEND_MODE __stdcall GetExtendModeY();
	[id(0x60030006)]
	D2D1_BITMAP_INTERPOLATION_MODE __stdcall GetInterpolationMode();
	[id(0x60030007)]
	void __stdcall GetBitmap(
		[out]ID2D1Bitmap** bitmap);
};

```'!
!ID2D1BitmapBrush categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!ID2D1BitmapBrush methodsFor!

getBitmap
	"Answer the <ID2D1Bitmap> result of invoking the GetBitmap() method of the COM object."

	| answer |
	answer := ID2D1Bitmap newPointer.
	self GetBitmap: answer.
	^answer asObject
!

GetBitmap: bitmap
	"Private - Invoke the GetBitmap() method of the COM object.

		void __stdcall GetBitmap(
			[out]ID2D1Bitmap** bitmap);"

	<virtual stdcall: void 16 ID2D1Bitmap**>
	^self invalidCall!

getExtendModeX
	"Answer the <SDWORD> result of invoking the GetExtendModeX() method of the COM object."

	^self GetExtendModeX
!

GetExtendModeX
	"Private - Invoke the GetExtendModeX() method of the COM object.

		D2D1_EXTEND_MODE __stdcall GetExtendModeX();"

	<virtual stdcall: sdword 13>
	^self invalidCall!

getExtendModeY
	"Answer the <SDWORD> result of invoking the GetExtendModeY() method of the COM object."

	^self GetExtendModeY
!

GetExtendModeY
	"Private - Invoke the GetExtendModeY() method of the COM object.

		D2D1_EXTEND_MODE __stdcall GetExtendModeY();"

	<virtual stdcall: sdword 14>
	^self invalidCall!

getInterpolationMode
	"Answer the <SDWORD> result of invoking the GetInterpolationMode() method of the COM object."

	^self GetInterpolationMode
!

GetInterpolationMode
	"Private - Invoke the GetInterpolationMode() method of the COM object.

		D2D1_BITMAP_INTERPOLATION_MODE __stdcall GetInterpolationMode();"

	<virtual stdcall: sdword 15>
	^self invalidCall!

setBitmap: bitmap
	"Answer the <VOID> result of invoking the SetBitmap() method of the COM object."

	self SetBitmap: bitmap
!

SetBitmap: bitmap
	"Private - Invoke the SetBitmap() method of the COM object.

		void __stdcall SetBitmap(
			[in]ID2D1Bitmap* bitmap);"

	<virtual stdcall: void 12 ID2D1Bitmap*>
	^self invalidCall!

setExtendModeX: mode
	"Answer the <VOID> result of invoking the SetExtendModeX() method of the COM object."

	self SetExtendModeX: mode
!

SetExtendModeX: mode
	"Private - Invoke the SetExtendModeX() method of the COM object.

		void __stdcall SetExtendModeX(
			[in]D2D1_EXTEND_MODE mode);"

	<virtual stdcall: void 9 sdword>
	^self invalidCall!

setExtendModeY: mode
	"Answer the <VOID> result of invoking the SetExtendModeY() method of the COM object."

	self SetExtendModeY: mode
!

SetExtendModeY: mode
	"Private - Invoke the SetExtendModeY() method of the COM object.

		void __stdcall SetExtendModeY(
			[in]D2D1_EXTEND_MODE mode);"

	<virtual stdcall: void 10 sdword>
	^self invalidCall!

setInterpolationMode: mode
	"Answer the <VOID> result of invoking the SetInterpolationMode() method of the COM object."

	self SetInterpolationMode: mode
!

SetInterpolationMode: mode
	"Private - Invoke the SetInterpolationMode() method of the COM object.

		void __stdcall SetInterpolationMode(
			[in]D2D1_BITMAP_INTERPOLATION_MODE mode);"

	<virtual stdcall: void 11 sdword>
	^self invalidCall! !
!ID2D1BitmapBrush categoriesFor: #getBitmap!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #GetBitmap:!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #getExtendModeX!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #GetExtendModeX!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #getExtendModeY!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #GetExtendModeY!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #getInterpolationMode!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #GetInterpolationMode!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #setBitmap:!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #SetBitmap:!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #setExtendModeX:!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #SetExtendModeX:!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #setExtendModeY:!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #SetExtendModeY:!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !
!ID2D1BitmapBrush categoriesFor: #setInterpolationMode:!**auto generated**!methods!public! !
!ID2D1BitmapBrush categoriesFor: #SetInterpolationMode:!**auto generated**!COM Interfaces-ID2D1BitmapBrush!private! !

!ID2D1BitmapBrush class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'Direct2d.ID2D1BitmapBrush'
		ID2D1BitmapBrush defineTemplate"

	self
		defineFunction: #SetExtendModeX:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #SetExtendModeY:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #SetInterpolationMode:
			returnType: 'void'
			argumentTypes: 'sdword';
		defineFunction: #SetBitmap:
			returnType: 'void'
			argumentTypes: 'ID2D1Bitmap*';
		defineFunction: #GetExtendModeX
			returnType: 'sdword';
		defineFunction: #GetExtendModeY
			returnType: 'sdword';
		defineFunction: #GetInterpolationMode
			returnType: 'sdword';
		defineFunction: #GetBitmap:
			returnType: 'void'
			argumentTypes: 'ID2D1Bitmap**'
! !
!ID2D1BitmapBrush class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

