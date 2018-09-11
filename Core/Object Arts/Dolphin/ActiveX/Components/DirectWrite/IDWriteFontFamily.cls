"Filed out from Dolphin Smalltalk 7"!

IDWriteFontList subclass: #IDWriteFontFamily
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontFamily guid: (IID fromString: '{DA20D8EF-812A-4C43-9802-62EC4ABD7ADD}')!
IDWriteFontFamily comment: '`IDWriteFontFamily` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontFamily'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The IDWriteFontFamily interface represents a set of fonts that share the same design but are differentiated by weight, stretch, and style."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(da20d8ef-812a-4c43-9802-62ec4abd7add), 
	helpstring("The IDWriteFontFamily interface represents a set of fonts that share the same design but are differentiated by weight, stretch, and style.")
]
interface IDWriteFontFamily : IDWriteFontList
 {
	[id(0x60020000)]
	HRESULT __stdcall GetFamilyNames(
		[out]IDWriteLocalizedStrings** names);
	[id(0x60020001)]
	HRESULT __stdcall GetFirstMatchingFont(
		DWRITE_FONT_WEIGHT weight,
		DWRITE_FONT_STRETCH stretch,
		DWRITE_FONT_STYLE style,
		[out]IDWriteFont** matchingFont);
	[id(0x60020002)]
	HRESULT __stdcall GetMatchingFonts(
		DWRITE_FONT_WEIGHT weight,
		DWRITE_FONT_STRETCH stretch,
		DWRITE_FONT_STYLE style,
		[out]IDWriteFontList** matchingFonts);
};

```'!
!IDWriteFontFamily categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontFamily methodsFor!

familyNames
	"Answer the <IDWriteLocalizedStrings> result of invoking the GetFamilyNames() method of the COM object."

	| answer |
	answer := IDWriteLocalizedStrings newPointer.
	self GetFamilyNames: answer.
	^answer asObject!

GetFamilyNames: names
	"Private - Invoke the GetFamilyNames() method of the COM object.

		HRESULT __stdcall GetFamilyNames(
			[out]IDWriteLocalizedStrings** names);"

	<virtual stdcall: hresult 7 IDWriteLocalizedStrings**>
	^self invalidCall!

getFirstMatchingFont: weight stretch: stretch style: style
	"Answer the <IDWriteFont> result of invoking the GetFirstMatchingFont() method of the COM object."

	| answer |
	answer := IDWriteFont newPointer.
	self
		GetFirstMatchingFont: weight
		stretch: stretch
		style: style
		matchingFont: answer.
	^answer asObject
!

GetFirstMatchingFont: weight stretch: stretch style: style matchingFont: matchingFont
	"Private - Invoke the GetFirstMatchingFont() method of the COM object.

		HRESULT __stdcall GetFirstMatchingFont(
			DWRITE_FONT_WEIGHT weight,
			DWRITE_FONT_STRETCH stretch,
			DWRITE_FONT_STYLE style,
			[out]IDWriteFont** matchingFont);"

	<virtual stdcall: hresult 8 sdword sdword sdword IDWriteFont**>
	^self invalidCall!

getMatchingFonts: weight stretch: stretch style: style
	"Answer the <IDWriteFontList> result of invoking the GetMatchingFonts() method of the COM object."

	| answer |
	answer := IDWriteFontList newPointer.
	self
		GetMatchingFonts: weight
		stretch: stretch
		style: style
		matchingFonts: answer.
	^answer asObject
!

GetMatchingFonts: weight stretch: stretch style: style matchingFonts: matchingFonts
	"Private - Invoke the GetMatchingFonts() method of the COM object.

		HRESULT __stdcall GetMatchingFonts(
			DWRITE_FONT_WEIGHT weight,
			DWRITE_FONT_STRETCH stretch,
			DWRITE_FONT_STYLE style,
			[out]IDWriteFontList** matchingFonts);"

	<virtual stdcall: hresult 9 sdword sdword sdword IDWriteFontList**>
	^self invalidCall!

name
	"Answer the US English font family name."

	^self familyNames at: 'en-us'!

printOn: aStream
	aStream basicPrint: self.
	aStream nextPut: $(; print: self name; nextPut: $)! !
!IDWriteFontFamily categoriesFor: #familyNames!accessing!public! !
!IDWriteFontFamily categoriesFor: #GetFamilyNames:!**auto generated**!COM Interfaces-IDWriteFontFamily!private! !
!IDWriteFontFamily categoriesFor: #getFirstMatchingFont:stretch:style:!**auto generated**!methods!public! !
!IDWriteFontFamily categoriesFor: #GetFirstMatchingFont:stretch:style:matchingFont:!**auto generated**!COM Interfaces-IDWriteFontFamily!private! !
!IDWriteFontFamily categoriesFor: #getMatchingFonts:stretch:style:!**auto generated**!methods!public! !
!IDWriteFontFamily categoriesFor: #GetMatchingFonts:stretch:style:matchingFonts:!**auto generated**!COM Interfaces-IDWriteFontFamily!private! !
!IDWriteFontFamily categoriesFor: #name!accessing!public! !
!IDWriteFontFamily categoriesFor: #printOn:!printing!public! !

!IDWriteFontFamily class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontFamily'
		IDWriteFontFamily defineTemplate"

	self
		defineFunction: #GetFamilyNames:
			argumentTypes: 'IDWriteLocalizedStrings**';
		defineFunction: #GetFirstMatchingFont:stretch:style:matchingFont:
			argumentTypes: 'sdword sdword sdword IDWriteFont**';
		defineFunction: #GetMatchingFonts:stretch:style:matchingFonts:
			argumentTypes: 'sdword sdword sdword IDWriteFontList**'
! !
!IDWriteFontFamily class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

