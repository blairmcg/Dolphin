﻿"Filed out from Dolphin Smalltalk 7"!

GdiplusInitializer subclass: #GdiplusFontFromFontFamilyInitializer
	instanceVariableNames: 'fontFamily emSize style unit'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GdiplusFontFromFontFamilyInitializer guid: (GUID fromString: '{f4b7aa80-5fd1-11d7-b609-00e0987e8081}')!
GdiplusFontFromFontFamilyInitializer comment: ''!
!GdiplusFontFromFontFamilyInitializer categoriesForClass!Unclassified! !
!GdiplusFontFromFontFamilyInitializer methodsFor!

createHandle
	| gpHandle status |
	gpHandle := ExternalHandle new.
	status := self library 
				gdipCreateFont: fontFamily
				emSize: emSize
				style: style
				unit: unit
				font: gpHandle.
	self assertStatusOk: status.
	^gpHandle!

fontFamily: aFontFamily emSize: aNumberSize style: aNumberStyle unit: aNumberUnit
	fontFamily := aFontFamily.
	emSize := aNumberSize.
	style := aNumberStyle.
	unit := aNumberUnit!

gdiplusConstructorErrorDescription
	^'Error creating Font'! !
!GdiplusFontFromFontFamilyInitializer categoriesFor: #createHandle!public!realizing/unrealizing! !
!GdiplusFontFromFontFamilyInitializer categoriesFor: #fontFamily:emSize:style:unit:!accessing!public! !
!GdiplusFontFromFontFamilyInitializer categoriesFor: #gdiplusConstructorErrorDescription!constants!private! !

!GdiplusFontFromFontFamilyInitializer class methodsFor!

fontFamily: fontFamily emSize: emSize style: style unit: unit
	^self new 
		fontFamily: fontFamily
		emSize: emSize
		style: style
		unit: unit! !
!GdiplusFontFromFontFamilyInitializer class categoriesFor: #fontFamily:emSize:style:unit:!instance creation!public! !

