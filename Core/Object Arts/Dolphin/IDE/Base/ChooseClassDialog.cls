﻿"Filed out from Dolphin Smalltalk 7"!

ValueDialog subclass: #ChooseClassDialog
	instanceVariableNames: 'classesPresenter allowNil'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ChooseClassDialog guid: (GUID fromString: '{7a80fce1-9f6e-4c81-b2e1-ba93fa3c693a}')!
ChooseClassDialog comment: 'ChooseClassDialog is a <valueDialogPresenter> that can be used to prompt for a <Class>.

Instance Variables:
	classesPresenter		<classSelector> the presenter from which the choice of class can be made
	allowNil				<boolean>, controls whether the OK button is enabled when there is no selection

'!
!ChooseClassDialog categoriesForClass!MVP-Presenters! !
!ChooseClassDialog methodsFor!

allowNil
	^allowNil!

allowNil: aBoolean
	allowNil := aBoolean!

classesPresenterClass
	^ClassHierarchySelector!

createClassesPresenter
	classesPresenter := self add: self classesPresenterClass new name: 'classSelector'!

createComponents
	"Create the presenters contained by the receiver"

	super createComponents.
	self createClassesPresenter!

createSchematicWiring
	"Create the trigger wiring for the receiver. At this stage the initialization
	is complete and the view is open"

	super createSchematicWiring.
	classesPresenter 
		when: #selectionChanged
		send: #onClassSelected
		to: self!

initialize
	super initialize.
	allowNil := false!

onClassSelected
	self value: classesPresenter selectionOrNil!

onViewOpened
	"Received when the receiver's view has been connected."

	super onViewOpened.
	"Unfortunately the selection is not represented as a value model, so we must sync. it manually"
	classesPresenter selectionOrNil: self model value!

packages: aCollection 
	"Set the packages selected in the receiver. Ignored at this level."

	!

queryCommand: query
	"Private - Enters details about a potential command for the receiver into 
	the <CommandQuery>, query"

	| cmd |
	cmd := query commandSymbol.
	cmd == #ok 
		ifTrue: 
			[query isEnabled: (allowNil or: [self value notNil]).
			^true].
	^super queryCommand: query! !
!ChooseClassDialog categoriesFor: #allowNil!accessing!public! !
!ChooseClassDialog categoriesFor: #allowNil:!accessing!public! !
!ChooseClassDialog categoriesFor: #classesPresenterClass!constants!private! !
!ChooseClassDialog categoriesFor: #createClassesPresenter!initializing!private! !
!ChooseClassDialog categoriesFor: #createComponents!initializing!public! !
!ChooseClassDialog categoriesFor: #createSchematicWiring!initializing!public! !
!ChooseClassDialog categoriesFor: #initialize!initializing!private! !
!ChooseClassDialog categoriesFor: #onClassSelected!event handling!public! !
!ChooseClassDialog categoriesFor: #onViewOpened!event handling!public! !
!ChooseClassDialog categoriesFor: #packages:!public!selection! !
!ChooseClassDialog categoriesFor: #queryCommand:!commands!private! !

!ChooseClassDialog class methodsFor!

icon
	"Answers an Icon that can be used to represent this class."

	^Smalltalk developmentSystem icon
!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.DialogView) 34 30 nil nil 8 #(13369344 65536) 416 nil 524550 ##(Smalltalk.ColorRef) 8 4278190080 nil 167 nil 263174 ##(Smalltalk.Font) nil true 524550 ##(Smalltalk.LOGFONTW) 8 #[244 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] 328198 ##(Smalltalk.Point) 193 193 nil 416 788230 ##(Smalltalk.BorderLayout) 1 1 nil 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 656 nil nil nil 7 nil nil nil 656 1180166 ##(Smalltalk.ResourceIdentifier) ##(Smalltalk.Presenter) #resource_OK_Cancel_button_block nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 1 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 594 21 633 594 689 71 656 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 60 1 0 0 98 1 0 0 95 1 0 0] 8 #() 594 193 193 nil 27 nil nil 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 132097 976 nil nil nil 7 nil nil nil 976 722 ##(Smalltalk.ClassHierarchySelector) #resource_Default_view nil 754 138 144 34 1 818 #createAt:extent: 34 2 594 21 21 594 689 613 976 898 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 10 0 0 0 98 1 0 0 60 1 0 0] 944 960 nil 27 170 192 34 2 976 8 'classSelector' 590342 ##(Smalltalk.Rectangle) 594 21 21 594 21 21 nil nil nil nil 22715 nil nil nil 594 661 521 1 nil nil 590598 ##(Smalltalk.Semaphore) nil nil 1 nil 8 2010075552 754 138 144 34 3 818 #createAt:extent: 34 2 594 3839 21 594 761 801 416 818 #text: 34 1 8 'Choose Class...' 416 818 #updateMenuBar 944 416 898 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 251 8 0 0 154 1 0 0] 34 2 976 656 960 nil 27 )! !
!ChooseClassDialog class categoriesFor: #icon!accessing!constants!public! !
!ChooseClassDialog class categoriesFor: #resource_Default_view!public!resources-views! !

