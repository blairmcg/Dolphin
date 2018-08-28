"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFont
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFont guid: (IID fromString: '{ACD16696-8C14-4F5D-877E-FE3FC1D32737}')!
IDWriteFont comment: '`IDWriteFont` is a wrapper class for the COM interface ''DirectWrite.IDWriteFont'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteFont interface represents a physical font in a font collection."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(acd16696-8c14-4f5d-877e-fe3fc1d32737), 
	helpstring("The IDWriteFont interface represents a physical font in a font collection.")
]
interface IDWriteFont : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall GetFontFamily(
		[out]IDWriteFontFamily** fontFamily);
	[id(0x60010001)]
	DWRITE_FONT_WEIGHT __stdcall GetWeight();
	[id(0x60010002)]
	DWRITE_FONT_STRETCH __stdcall GetStretch();
	[id(0x60010003)]
	DWRITE_FONT_STYLE __stdcall GetStyle();
	[id(0x60010004)]
	BOOL __stdcall IsSymbolFont();
	[id(0x60010005)]
	HRESULT __stdcall GetFaceNames(
		[out]IDWriteLocalizedStrings** names);
	[id(0x60010006)]
	HRESULT __stdcall GetInformationalStrings(
		DWRITE_INFORMATIONAL_STRING_ID informationalStringID,
		[out]IDWriteLocalizedStrings** informationalStrings,
		[out]BOOL* exists);
	[id(0x60010007)]
	DWRITE_FONT_SIMULATIONS __stdcall GetSimulations();
	[id(0x60010008)]
	void __stdcall GetMetrics(
		[out]DWRITE_FONT_METRICS* fontMetrics);
	[id(0x60010009)]
	HRESULT __stdcall HasCharacter(
		unsigned int unicodeValue,
		[out]BOOL* exists);
	[id(0x6001000a)]
	HRESULT __stdcall CreateFontFace(
		[out]IDWriteFontFace** fontFace);
};

```'!
!IDWriteFont categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFont methodsFor!

createFontFace
	"Answer the <IDWriteFontFace> result of invoking the CreateFontFace() method of the COM object."

	| answer |
	answer := IDWriteFontFace newPointer.
	self CreateFontFace: answer.
	^answer asObject
!

CreateFontFace: fontFace
	"Private - Invoke the CreateFontFace() method of the COM object.

		HRESULT __stdcall CreateFontFace(
			[out]IDWriteFontFace** fontFace);"

	<virtual stdcall: hresult 14 IDWriteFontFace**>
	^self invalidCall!

getFaceNames
	"Answer the <IDWriteLocalizedStrings> result of invoking the GetFaceNames() method of the COM object."

	| answer |
	answer := IDWriteLocalizedStrings newPointer.
	self GetFaceNames: answer.
	^answer asObject
!

GetFaceNames: names
	"Private - Invoke the GetFaceNames() method of the COM object.

		HRESULT __stdcall GetFaceNames(
			[out]IDWriteLocalizedStrings** names);"

	<virtual stdcall: hresult 9 IDWriteLocalizedStrings**>
	^self invalidCall!

getFontFamily
	"Answer the <IDWriteFontFamily> result of invoking the GetFontFamily() method of the COM object."

	| answer |
	answer := IDWriteFontFamily newPointer.
	self GetFontFamily: answer.
	^answer asObject
!

GetFontFamily: fontFamily
	"Private - Invoke the GetFontFamily() method of the COM object.

		HRESULT __stdcall GetFontFamily(
			[out]IDWriteFontFamily** fontFamily);"

	<virtual stdcall: hresult 4 IDWriteFontFamily**>
	^self invalidCall!

getInformationalStrings: informationalStringID
	"Invoke the GetInformationalStrings() method of the COM object."

	| answer |
	answer := (Array new: 2)
				basicAt: 1 put: IDWriteLocalizedStrings newPointer;
				basicAt: 2 put: (BOOL new);
				yourself.
	self
		GetInformationalStrings: informationalStringID
		informationalStrings: (answer basicAt: 1)
		exists: (answer basicAt: 2).
	^answer collect: [:each | each asObject]
!

GetInformationalStrings: informationalStringID informationalStrings: informationalStrings exists: exists
	"Private - Invoke the GetInformationalStrings() method of the COM object.

		HRESULT __stdcall GetInformationalStrings(
			DWRITE_INFORMATIONAL_STRING_ID informationalStringID,
			[out]IDWriteLocalizedStrings** informationalStrings,
			[out]BOOL* exists);"

	<virtual stdcall: hresult 10 sdword IDWriteLocalizedStrings** bool*>
	^self invalidCall!

getMetrics
	"Answer the <DWRITE_FONT_METRICS> result of invoking the GetMetrics() method of the COM object."

	| answer |
	answer := (DWRITE_FONT_METRICS new).
	self GetMetrics: answer.
	^answer asObject
!

GetMetrics: fontMetrics
	"Private - Invoke the GetMetrics() method of the COM object.

		void __stdcall GetMetrics(
			[out]DWRITE_FONT_METRICS* fontMetrics);"

	<virtual stdcall: void 12 DWRITE_FONT_METRICS*>
	^self invalidCall!

getSimulations
	"Answer the <SDWORD> result of invoking the GetSimulations() method of the COM object."

	^self GetSimulations
!

GetSimulations
	"Private - Invoke the GetSimulations() method of the COM object.

		DWRITE_FONT_SIMULATIONS __stdcall GetSimulations();"

	<virtual stdcall: sdword 11>
	^self invalidCall!

getStretch
	"Answer the <SDWORD> result of invoking the GetStretch() method of the COM object."

	^self GetStretch
!

GetStretch
	"Private - Invoke the GetStretch() method of the COM object.

		DWRITE_FONT_STRETCH __stdcall GetStretch();"

	<virtual stdcall: sdword 6>
	^self invalidCall!

getStyle
	"Answer the <SDWORD> result of invoking the GetStyle() method of the COM object."

	^self GetStyle
!

GetStyle
	"Private - Invoke the GetStyle() method of the COM object.

		DWRITE_FONT_STYLE __stdcall GetStyle();"

	<virtual stdcall: sdword 7>
	^self invalidCall!

getWeight
	"Answer the <SDWORD> result of invoking the GetWeight() method of the COM object."

	^self GetWeight
!

GetWeight
	"Private - Invoke the GetWeight() method of the COM object.

		DWRITE_FONT_WEIGHT __stdcall GetWeight();"

	<virtual stdcall: sdword 5>
	^self invalidCall!

hasCharacter: unicodeValue
	"Answer the <BOOL> result of invoking the HasCharacter() method of the COM object."

	| answer |
	answer := (BOOL new).
	self
		HasCharacter: unicodeValue
		exists: answer.
	^answer asObject
!

HasCharacter: unicodeValue exists: exists
	"Private - Invoke the HasCharacter() method of the COM object.

		HRESULT __stdcall HasCharacter(
			unsigned int unicodeValue,
			[out]BOOL* exists);"

	<virtual stdcall: hresult 13 dword bool*>
	^self invalidCall!

isSymbolFont
	"Answer the <BOOL> result of invoking the IsSymbolFont() method of the COM object."

	^self IsSymbolFont
!

IsSymbolFont
	"Private - Invoke the IsSymbolFont() method of the COM object.

		BOOL __stdcall IsSymbolFont();"

	<virtual stdcall: bool 8>
	^self invalidCall! !
!IDWriteFont categoriesFor: #createFontFace!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #CreateFontFace:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getFaceNames!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetFaceNames:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getFontFamily!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetFontFamily:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getInformationalStrings:!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetInformationalStrings:informationalStrings:exists:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getMetrics!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetMetrics:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getSimulations!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetSimulations!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getStretch!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetStretch!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getStyle!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetStyle!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #getWeight!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #GetWeight!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #hasCharacter:!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #HasCharacter:exists:!**auto generated**!COM Interfaces-IDWriteFont!private! !
!IDWriteFont categoriesFor: #isSymbolFont!**auto generated**!methods!public! !
!IDWriteFont categoriesFor: #IsSymbolFont!**auto generated**!COM Interfaces-IDWriteFont!private! !

!IDWriteFont class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFont'
		IDWriteFont defineTemplate"

	self
		defineFunction: #GetFontFamily:
			argumentTypes: 'IDWriteFontFamily**';
		defineFunction: #GetWeight
			returnType: 'sdword';
		defineFunction: #GetStretch
			returnType: 'sdword';
		defineFunction: #GetStyle
			returnType: 'sdword';
		defineFunction: #IsSymbolFont
			returnType: 'bool';
		defineFunction: #GetFaceNames:
			argumentTypes: 'IDWriteLocalizedStrings**';
		defineFunction: #GetInformationalStrings:informationalStrings:exists:
			argumentTypes: 'sdword IDWriteLocalizedStrings** bool*';
		defineFunction: #GetSimulations
			returnType: 'sdword';
		defineFunction: #GetMetrics:
			returnType: 'void'
			argumentTypes: 'DWRITE_FONT_METRICS*';
		defineFunction: #HasCharacter:exists:
			argumentTypes: 'dword bool*';
		defineFunction: #CreateFontFace:
			argumentTypes: 'IDWriteFontFace**'
! !
!IDWriteFont class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

