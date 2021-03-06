﻿"Filed out from Dolphin Smalltalk 7"!

ClassBrowserPlugin subclass: #AstPlugin
	instanceVariableNames: 'astPresenter sourcePresenter'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AstPlugin guid: (GUID fromString: '{4aba7565-bc07-4387-b7e4-16e2f57f1801}')!
AstPlugin comment: 'AstPlugin is a <classBrowserPlugin> that displays the syntax tree for the currently selected method alongside the source.
	
Selecting a node will select the corresponding range of source. The Debug and Optimized checkboxes can be toggled to see the effect on the generated bytecodes, although note that Debug methods are never optimized.

Since this facility is probably not of interest to most developers it is not installed as one of the default plugins. If you wish to add this plugin to all browsers please evaluate:

	ClassBrowserAbstract allSubclasses do: [:each | each plugins add: self]

Alternatively Tools/Options/Inspect Options, then double click plugins, press the * button, and choose AstPlugin from the list, Ok out. The plugin will appear in any subsequently opened browser.'!
!AstPlugin categoriesForClass!MVP-Presenters! !
!AstPlugin methodsFor!

clear
	sourcePresenter text: ''.
	astPresenter model clear!

createComponents
	"Create the presenters contained by the receiver"

	super createComponents.
	astPresenter := self add: TreePresenter new name: 'syntaxTree'.
	sourcePresenter := self add: Smalltalk developmentSystem methodWorkspaceClass new name: 'source'.
	sourcePresenter isAutoParseEnabled: false.!

createSchematicWiring
	"Create the trigger wiring for the receiver"

	super createSchematicWiring.
	astPresenter
		when: #selectionChanged
		send: #onNodeSelected
		to: self.
	(self model)
		when: #classSelected
			send: #onBrowserClassSelected
			to: self;
		when: #methodSelected
			send: #onBrowserMethodSelected
			to: self!

displayMethod
	| treeModel method |
	method := self selectedMethod.
	method isNil
		ifTrue: 
			[self clear.
			^self].
	sourcePresenter text: method getSource.
	treeModel := VirtualTreeModel withRoots: (OrderedCollection with: self browser parseTree).
	astPresenter model: treeModel!

displayOn: aWriteStream 
	^aWriteStream nextPutAll: 'Syntax Tree'!

onBrowserClassSelected
	self isCurrentCard ifTrue: [self browser ensureDefinitionVisible]!

onBrowserMethodSelected
	"Event handler for a method being selected within the receiver's associated browser. "

	self isCurrentCard ifTrue: [self displayMethod]!

onNodeSelected
	sourcePresenter
		selectionRange: (astPresenter selection ifNil: [1 to: 0] ifNotNil: [:node | node sourceInterval])!

onShownInBrowser
	"Event handler indicating that the receiver has been displayed within it's browser. "

	super onShownInBrowser.
	"For efficiency we defer the creation of the diagram until the receiver becomes the current card"
	self displayMethod!

selectedMethod
	^self browser selectedMethod! !
!AstPlugin categoriesFor: #clear!private! !
!AstPlugin categoriesFor: #createComponents!initializing!public! !
!AstPlugin categoriesFor: #createSchematicWiring!initializing!public! !
!AstPlugin categoriesFor: #displayMethod!operations!private! !
!AstPlugin categoriesFor: #displayOn:!public! !
!AstPlugin categoriesFor: #onBrowserClassSelected!event handling!private! !
!AstPlugin categoriesFor: #onBrowserMethodSelected!event handling!private! !
!AstPlugin categoriesFor: #onNodeSelected!event handling!private! !
!AstPlugin categoriesFor: #onShownInBrowser!event handling!public! !
!AstPlugin categoriesFor: #selectedMethod!accessing!private! !

!AstPlugin class methodsFor!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ContainerView) 34 15 0 0 34 2 8 1409286144 131073 416 0 0 0 5 0 0 0 416 1180166 ##(Smalltalk.ProportionalLayout) 170 176 8 #() true 170 192 34 4 410 ##(Smalltalk.ScintillaView) 34 50 0 416 34 2 8 1445007428 1025 576 721990 2 ##(Smalltalk.ValueHolder) 0 false 1310726 ##(Smalltalk.EqualitySearchPolicy) 0 524550 ##(Smalltalk.ColorRef) 8 4278190080 0 5 0 0 0 576 0 8 4294906539 852486 ##(Smalltalk.NullConverter) 0 0 9 0 170 192 34 4 #callTip 1182790 1 ##(Smalltalk.ScintillaTextStyle) 77 786694 ##(Smalltalk.IndexedColor) 33554457 866 33554471 1 0 0 0 0 #callTip 0 0 0 #normal 834 1 0 0 1 0 0 0 0 #normal 0 0 0 34 40 912 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1377542 ##(Smalltalk.SmalltalkMethodStyler) 1 0 0 false 138 144 528 170 192 34 2 #default 1641542 1 ##(Smalltalk.ScintillaMarkerDefinition) 1 0 0 0 576 #circle 0 0 0 0 0 0 138 ##(Smalltalk.IdentitySet) 528 0 170 176 528 9215 0 0 0 0 866 33554447 0 0 65 0 0 170 192 34 6 #specialCharacter 8 '()[]<>' #literalBytes 8 '[]' #literalArray 8 '()' 8 '' 3 170 192 34 2 #container 800 0 0 0 0 1 0 170 192 34 6 1 1510470 2 ##(Smalltalk.ScintillaIndicatorStyle) 1 576 65025 3 false 1 0 0 0 0 0 0 3 1266 3 576 33423361 5 false 3 0 0 0 0 0 0 5 1266 5 576 511 1 false 5 0 0 0 0 0 0 0 0 170 192 34 6 #Notification 834 1029 0 196934 1 ##(Smalltalk.RGB) 31185883 1 0 0 0 0 #Notification 0 0 0 #Warning 834 1027 1378 60239 1378 31326207 1 0 0 0 0 #Warning 0 0 0 #Error 834 1031 1378 335 1378 31317503 1 0 0 0 0 #Error 0 0 0 0 983302 ##(Smalltalk.MessageSequence) 138 144 34 5 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 1 255 1618 701 247 576 1570 #modificationEventMask: 8 #(4607) 576 1570 #caretPeriod: 8 #(530) 576 1570 #margins: 34 1 34 3 985158 2 ##(Smalltalk.ScintillaMargin) 1 576 1 3 0 0 0 0 1778 3 576 33 0 3 67108863 0 0 1778 5 576 1 0 3 -67108863 0 0 576 1570 #tabWidth: 8 #(4) 576 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 127 0 0 0 94 1 0 0 250 0 0 0] 8 #() 1618 193 193 0 29 8 'source' 410 ##(Smalltalk.MoenTreeView) 34 30 0 416 34 2 8 1409286144 1 1968 590918 3 ##(Smalltalk.TreeModel) 0 1310726 ##(Smalltalk.IdentitySearchPolicy) 525062 ##(Smalltalk.TreeNode) 0 0 0 170 192 528 706 8 4278190080 0 517 0 0 0 1968 788998 ##(Smalltalk.MoenTreeNode) 0 721926 ##(Smalltalk.MoenContour) 0 0 0 0 1618 1 1 2240 0 0 0 0 0 7 459270 ##(Smalltalk.Message) #displayString 8 #() ##(Smalltalk.MoenTreeView) 268435457 1618 5 3 1049926 1 ##(Smalltalk.IconImageManager) 1618 1 1 41 0 197382 ##(Smalltalk.Pen) 0 true 393478 ##(Smalltalk.LOGPEN) 8 #[0 0 0 0 1 0 0 0 0 0 0 0 192 192 192 0] 1618 33 33 1618 19999 19999 114721 2352 1618 35 1 0 0 0 1506 138 144 34 1 1570 #createAt:extent: 34 2 1618 1 1 1618 701 245 1968 1874 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 0 0 0 0 94 1 0 0 122 0 0 0] 8 #() 1936 0 27 8 'syntaxTree' 0 1506 138 144 34 1 1570 #createAt:extent: 34 2 1618 3839 21 1618 701 501 416 1874 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 221 8 0 0 4 1 0 0] 34 3 1968 410 ##(Smalltalk.Splitter) 34 12 0 416 34 2 8 1140850688 1 2832 0 706 8 4278190080 0 517 0 0 0 2832 1506 138 144 34 1 1570 #createAt:extent: 34 2 1618 1 245 1618 701 11 2832 1874 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 0 0 0 0 122 0 0 0 94 1 0 0 127 0 0 0] 8 #() 1936 0 27 576 1936 0 27 )! !
!AstPlugin class categoriesFor: #resource_Default_view!public!resources-views! !

