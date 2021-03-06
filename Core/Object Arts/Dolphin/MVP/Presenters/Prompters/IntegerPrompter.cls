﻿"Filed out from Dolphin Smalltalk 7"!

Prompter subclass: #IntegerPrompter
	instanceVariableNames: 'intervalPresenter interval'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IntegerPrompter guid: (GUID fromString: '{f0928363-bf5c-4f5e-98e2-714351f9e977}')!
IntegerPrompter comment: 'IntegerPrompter is a <Prompter> specialised to accept only integer input within a defined interval. The validation block is set so that the OK button is only enabled if the value in the reply field is a member of the interval. If the view has a SpinButton, then this is set to step between the elements of the interval.

Example Usage:
	IntegerPrompter 
		on: (Debugger aspectValue: #animatePause)
		prompt: ''Millisecond delay between debug animation steps:''
		caption: nil
		interval: (50 to: 5000 by: 50)

Instance Variables:
	intervalPresenter	<NumberPresenter>. SpinButton, if available
	interval		<Interval>. Defines acceptable input. Must be integral, but may have step other than one, e.g. (0 to: 48 by: 6)

'!
!IntegerPrompter categoriesForClass!MVP-Presenters! !
!IntegerPrompter methodsFor!

createComponents
	"Create the presenters contained by the receiver."

	"Implementation Note: We don't supersend because we want to connect the reply field to a 
	NumberPresenter, not a TextPresenter."

	promptPresenter := self add: TextPresenter new name: 'prompt'.
	replyPresenter := self add: NumberPresenter new name: 'reply'.
	intervalPresenter := self add: NumberPresenter new name: 'spinner'!

initialize
	"Private - Initialize the receiver"

	super initialize.
	interval := 1 to: 100.
	validationBlock := [:reply | interval includes: reply]!

interval
	^interval!

interval: anInterval 
	interval := anInterval.
	self isOpen ifTrue: [self setSpinnerRange]!

onViewOpened
	"Received when the receiver's view has been connected. "

	super onViewOpened.
	self setSpinnerRange.
	"We have to delay setting the model until now (rather than in an override of #model:) because 
	 the value may not be in the range of the view's default interval."
	intervalPresenter model: self model!

setSpinnerRange
	intervalPresenter view range: self interval! !
!IntegerPrompter categoriesFor: #createComponents!initializing!public! !
!IntegerPrompter categoriesFor: #initialize!initializing!private! !
!IntegerPrompter categoriesFor: #interval!accessing!public! !
!IntegerPrompter categoriesFor: #interval:!accessing!public! !
!IntegerPrompter categoriesFor: #onViewOpened!event handling!public! !
!IntegerPrompter categoriesFor: #setSpinnerRange!helpers!private! !

!IntegerPrompter class methodsFor!

defaultModel
	^1 asValue!

on: aValueModel prompt: aStringPrompt caption: aStringCaptionOrNil 
	^self 
		on: aValueModel
		prompt: aStringPrompt
		caption: aStringCaptionOrNil
		interval: (1 to: SmallInteger maximum)!

on: aValueModel prompt: aStringPrompt caption: aStringCaptionOrNil interval: anInterval 
	"Creates an instance of the receiver on aValueModel with and aStringPrompt. 
	The prompter is given a caption according to aStringCaptionOrNil; if nil
	a default caption is used. The prompter is displayed modally, prompting 
	for a String reply. The initial value of the reply field is the original
	value of aSubjectModel.

	Answer the reply, or nil if the dialog is cancelled"

	| prompter |
	prompter := self on: aValueModel.
	prompter
		interval: anInterval;
		createView: self defaultView;
		prompt: aStringPrompt.
	aStringCaptionOrNil notNil ifTrue: [prompter caption: aStringCaptionOrNil].
	^prompter showModal!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.DialogView) 34 30 nil nil 8 #(13107200 65536) 416 nil 524550 ##(Smalltalk.ColorRef) 8 4278190080 nil 167 nil 263174 ##(Smalltalk.Font) nil true 524550 ##(Smalltalk.LOGFONTW) 8 #[244 255 255 255 0 0 0 0 0 0 0 0 0 0 0 0 144 1 0 0 0 0 0 0 3 2 1 34 83 0 101 0 103 0 111 0 101 0 32 0 85 0 73 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0] 328198 ##(Smalltalk.Point) 193 193 nil 416 852230 ##(Smalltalk.FramingLayout) 170 176 34 6 410 ##(Smalltalk.StaticText) 34 16 nil 416 34 2 8 1140850944 1 688 721990 2 ##(Smalltalk.ValueHolder) nil nil 1114118 ##(Smalltalk.NeverSearchPolicy) 8 '' nil nil 7 nil nil nil 688 nil 8 1906774720 852486 ##(Smalltalk.NullConverter) nil nil true 983302 ##(Smalltalk.MessageSequence) 138 144 34 2 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 594 41 33 594 231 81 688 946 #text: 34 1 8 'Enter number:' 688 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 20 0 0 0 16 0 0 0 135 0 0 0 56 0 0 0] 8 #() 594 193 193 nil 27 1181766 2 ##(Smalltalk.FramingConstraints) 1180678 ##(Smalltalk.FramingCalculation) #fixedParentLeft 21 1186 #fixedViewLeft 231 1186 #fixedParentTop 3 1186 #fixedViewTop 81 410 ##(Smalltalk.TextEdit) 34 16 nil 416 34 2 8 1140924544 1025 1264 nil 466 496 nil 7 nil nil nil 1264 nil 8 1906818384 852742 ##(Smalltalk.IntegerToText) nil 8 '' nil 1 882 138 144 34 2 946 #createAt:extent: 34 2 594 291 31 594 149 45 1264 946 #setMarginWidths: 34 1 8 #(3 3) 1264 1074 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 145 0 0 0 15 0 0 0 219 0 0 0 37 0 0 0] 8 #() 1136 nil 27 1154 1186 #fixedPreviousRight 21 1216 149 1232 1 1248 45 410 ##(Smalltalk.ReferenceView) 34 14 nil 416 34 2 8 1140850688 131073 1648 nil nil nil 7 nil nil nil 1648 1180166 ##(Smalltalk.ResourceIdentifier) ##(Smalltalk.Presenter) #resource_OK_Cancel_button_block nil 882 138 144 34 1 946 #createAt:extent: 34 2 594 21 131 594 429 53 1648 1074 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 10 0 0 0 65 0 0 0 224 0 0 0 91 0 0 0] 8 #() 1136 nil 27 1154 1200 1 1186 #fixedParentRight 1 1186 #fixedViewBottom -51 1186 #fixedParentBottom 1 170 192 34 4 688 8 'prompt' 1264 8 'reply' 590342 ##(Smalltalk.Rectangle) 594 21 31 594 21 21 nil nil nil nil 24051 nil nil nil nil 1 nil nil 590598 ##(Smalltalk.Semaphore) nil nil 1 nil 8 2010075552 882 138 144 34 3 946 #createAt:extent: 34 2 594 3839 21 594 501 281 416 946 #text: 34 1 8 'Please respond:' 416 946 #updateMenuBar 1888 416 1074 8 #[44 0 0 0 0 0 0 0 0 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 121 8 0 0 150 0 0 0] 34 3 688 1264 1648 1136 nil 27 )! !
!IntegerPrompter class categoriesFor: #defaultModel!models!public! !
!IntegerPrompter class categoriesFor: #on:prompt:caption:!instance creation!public! !
!IntegerPrompter class categoriesFor: #on:prompt:caption:interval:!instance creation!public! !
!IntegerPrompter class categoriesFor: #resource_Default_view!public!resources-views! !

