﻿"Filed out from Dolphin Smalltalk 7"!

GdiplusFontCollection subclass: #GdiplusPrivateFontCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
GdiplusPrivateFontCollection guid: (GUID fromString: '{c09d8c05-5f28-11d7-b609-00e0987e8081}')!
GdiplusPrivateFontCollection comment: 'GdiplusPrivateFontCollection is a collection class for fonts. This class keeps a collection of fonts specifically for an application. The fonts in the collection can include installed fonts as well as fonts that have not been installed on the system.

'!
!GdiplusPrivateFontCollection categoriesForClass!Unclassified! !
!GdiplusPrivateFontCollection methodsFor!

addFontFile: aFilename
	"Adds a font file to this private font collection."

	| status |
	(status := GdiplusLibrary default gdipPrivateAddFontFile: self asParameter
				filename: aFilename) = Ok
		ifFalse: [GdiplusError signal: 'GdipPrivateAddFontFile failed' with: status]! !
!GdiplusPrivateFontCollection categoriesFor: #addFontFile:!operations!public! !

!GdiplusPrivateFontCollection class methodsFor!

new
	^self fromInitializer: GdiplusPrivateFontCollectionInitializer new! !
!GdiplusPrivateFontCollection class categoriesFor: #new!instance creation!public! !

