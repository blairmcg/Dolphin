﻿"Filed out from Dolphin Smalltalk 7"!

UI.MouseEvent subclass: #'UI.MouseWheelEvent'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.MouseWheelEvent guid: (Core.GUID fromString: '{0f3cb79b-5666-44e1-9b9b-bd204e740e22}')!
UI.MouseWheelEvent comment: 'MouseWheelEvent represents the subclass of events generated by mouse hardware input devices for scrolling of the wheel (where present), including horizontal scrolling (where supported by the device).'!
!UI.MouseWheelEvent categoriesForClass!Events! !
!UI.MouseWheelEvent methodsFor!

isVertical
	"Answer whether the receiver represents a vertical mouse wheel event (as opposed to a horizontal wheeling)."

	^message == WM_MOUSEWHEEL!

wheelRotation
	"Answer the <number> of notches that the mouse wheel was rotated to generate this event."

	^wParam highPartSigned / WHEEL_DELTA! !
!UI.MouseWheelEvent categoriesFor: #isVertical!public! !
!UI.MouseWheelEvent categoriesFor: #wheelRotation!public! !
