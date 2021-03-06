﻿"Filed out from Dolphin Smalltalk 7"!

StaticView subclass: #ColorView
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ColorView guid: (GUID fromString: '{87b4c73c-026e-11d3-9fd7-00a0cc3e4a32}')!
ColorView comment: 'ColorView is a <valueView> for displaying static <color>s. The <valueModel> associated with a ColorView must always yield a <color> value when mapped through the installed type converter. A ColorView will normally be used in conjunction with a <ColorPresenter>.'!
!ColorView categoriesForClass!MVP-Views! !
!ColorView methodsFor!

basicActualBackcolor
	| color |
	color := super basicActualBackcolor.
	"Since the purpose of this view is to display a colour, transparency doesn't make sense, so paint it white instead"
	^color isNone ifTrue: [Color window] ifFalse: [color]!

displayValue
	"Answer the displayable contents of the receiver"

	^self backcolor!

displayValue: aColor
	"Private - Set the displayable contents of the receiver, the color"

	self backcolor: aColor
! !
!ColorView categoriesFor: #basicActualBackcolor!accessing!private! !
!ColorView categoriesFor: #displayValue!private!updating! !
!ColorView categoriesFor: #displayValue:!private!updating! !

!ColorView class methodsFor!

defaultModel
	"Answer a default model to be assigned to the receiver when it is initialized."

	^Color black asValue!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon! !
!ColorView class categoriesFor: #defaultModel!models!public! !
!ColorView class categoriesFor: #icon!constants!public! !

