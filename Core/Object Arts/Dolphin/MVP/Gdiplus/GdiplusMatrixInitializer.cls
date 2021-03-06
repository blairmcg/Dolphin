﻿"Filed out from Dolphin Smalltalk 7"!

GdiplusInitializer subclass: #GdiplusMatrixInitializer
	instanceVariableNames: 'm11 m12 m21 m22 m31 m32'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GdiplusMatrixInitializer guid: (GUID fromString: '{1a1a5ea6-6151-11d7-b609-00e0987e8081}')!
GdiplusMatrixInitializer comment: ''!
!GdiplusMatrixInitializer categoriesForClass!Unclassified! !
!GdiplusMatrixInitializer methodsFor!

createHandle
	| gpHandle status |
	gpHandle := ExternalHandle new.
	status := self library 
				gdipCreateMatrix2: m11
				m12: m12
				m21: m21
				m22: m22
				dx: m31
				dy: m32
				matrix: gpHandle.
	self assertStatusOk: status.
	^gpHandle!

gdiplusConstructorErrorDescription
	^'Error creating Matrix'!

m11: aReal11 m12: aReal12 m21: aReal21 m22: aReal22 m31: aReal31 m32: aReal32
	m11 := aReal11.
	m12 := aReal12.
	m21 := aReal21.
	m22 := aReal22.
	m31 := aReal31.
	m32 := aReal32! !
!GdiplusMatrixInitializer categoriesFor: #createHandle!public!realizing/unrealizing! !
!GdiplusMatrixInitializer categoriesFor: #gdiplusConstructorErrorDescription!constants!private! !
!GdiplusMatrixInitializer categoriesFor: #m11:m12:m21:m22:m31:m32:!accessing!public! !

!GdiplusMatrixInitializer class methodsFor!

m11: aReal11 m12: aReal12 m21: aReal21 m22: aReal22 m31: aReal31 m32: aReal32
	^self new 
		m11: aReal11
		m12: aReal12
		m21: aReal21
		m22: aReal22
		m31: aReal31
		m32: aReal32! !
!GdiplusMatrixInitializer class categoriesFor: #m11:m12:m21:m22:m31:m32:!instance creation!public! !

