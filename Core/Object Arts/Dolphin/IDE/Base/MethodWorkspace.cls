﻿"Filed out from Dolphin Smalltalk 7"!

SmalltalkWorkspace subclass: #MethodWorkspace
	instanceVariableNames: 'parseTree refactoringTool'
	classVariableNames: 'AutoParseDwell AutoParseMask IsAutoParseEnabled'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MethodWorkspace guid: (GUID fromString: '{d7285d4c-35b2-4b52-a673-2e17fde39fec}')!
MethodWorkspace comment: 'MethodWorkspace is a specialised <SmalltalkWorkspace> for displaying method source that expects to be contained in a <MethodBrowser>.

MethodWorkspace maintains a parse tree for the current method that allows it to offer syntax-directed browsing, editing, and (in DPRO) refactoring commands. For example the widenSourceSelection command can be used to expand the selection to encompass the syntactic element containing the currently selected syntactic element (or the syntactic element under the caret if there is no selection).

Instance Variables:
	methodAST		<StMethodNode>. Root of the parse tree.
	refactoringTool	<CodeRefactoringTool>, or nil if not running DPRO.

Class Variables:
	AutoCompleteDwell				<integer>. Number of milliseconds delay before auto-completion list displayed after typing.
	IsAutoCompletionCaseInsensitive	<boolean>. Choice and selection of auto-completion candidates case insensitive?
	IsAutoCompletionEnabled		<boolean>. Automatic display of completion list when typing?
	IsAutoCompletionSpaceAdded	<boolean>. Completion inserts a space if needed before next word?
	IsAutoCompletionTruncating		<boolean>. Word completion by selection from list truncates trailing characters of token?
	KeywordCompletions				<LookupTable>. Common keyword selector completion templates.
	StandardUnaryReturnTypes		<LookupTable>. Return types of common unary messages.

'!
!MethodWorkspace categoriesForClass!Development! !
!MethodWorkspace methodsFor!

accept
	"Save the method source, updating the existing method or adding a new one depending on
	whether the user has edited the method signature."

	parentPresenter saveNewMethod: self source!

addToCommandRoute: route 
	"Update the <OrderedCollection>, path, with the receiver's contribution to the command path
	held by the <CommandPolicy>, route. Answer the next <Presenter> to visit. The receiver is
	guaranteed not to be on the command path already. Implementation Note: We add our method
	refactoring tool to the command route."

	refactoringTool notNil ifTrue: [route appendTarget: refactoringTool].
	^super addToCommandRoute: route!

allDefinedVariablesDo: aMonadicValuable 
	self parseTree 
		ifNotNil: [:ast | ast allDefinedVariableNodesDo: [:each | aMonadicValuable value: each name]]!

autoParse
	self textLength > 0 ifFalse: [^self].
	
	[BrowserSemanticAnalyser
		analyzeParseTree: self parseTree
		for: self selfClass
		context: self evaluationContext
		pools: self allPools]
			on: SmalltalkParser notificationClass
			do: 
				[:err |
				"err toTrace"
				compilationErrors addLast: err.
				err resume].
	self highlightCompilationErrors: 0.
	self errorModel isNil ifTrue: [^self].
	self errorModel value: self firstError!

browseDefinitionsCommand
	"Private - Browse definitions of the object identified by the node under the cursor, or
	failing that prompt for a selector and open a method browser displaying the implementors of
	that selector."

	self selectedNode 
		ifNotNil: 
			[:node | 
			(self selectorFromNode: node) 
				ifNil: 
					[node isVariable 
						ifTrue: 
							[(self variableClassification: node) == #classGlobal 
								ifTrue: 
									[^Message selector: #browseClass:
										argument: (self selectedMethod methodClass environment bindingFor: node name) value]]]
				ifNotNil: 
					[:selector | 
					^Message selector: #browseDefinitionsOfSelector:in:
						arguments: (Array with: selector with: self searchEnvironment)]].
	^super browseDefinitionsCommand!

browseMessage
	| node |
	node := self selectedMessageNode.
	self systemModel browseMethod: ((self targetOfMessage: node) lookupMethod: node selector)!

browseReferencesCommand
	"Private - Prompt for a selector and open a method browser displaying the references to that
	selector."

	self selectedNode 
		ifNotNil: 
			[:node | 
			(self selectorFromNode: node) 
				ifNil: 
					[node isVariable 
						ifTrue: 
							[| varClass |
							varClass := self variableClassification: node.
							(varClass == #classGlobal or: [varClass == #global]) 
								ifTrue: 
									[^Message selector: #browseGlobalReferences:in:
										arguments: (Array with: (self selectedMethod methodClass environment bindingFor: node name)
												with: self searchEnvironment)]]]
				ifNotNil: 
					[:literal | 
					^Message selector: #browseReferencesToLiteral:in:
						arguments: (Array with: literal with: self searchEnvironment)]].
	^super browseReferencesCommand!

buildParseTree
	| methodClass |
	methodClass := self parseContext ?? ProtoObject.
	self clearErrors.
	self selectedMethod 
		ifNotNil: 
			[:method | 
			method isExpression ifTrue: [^SmalltalkParser parseExpression: method getSource in: methodClass]].
	^[self parseSourceIn: methodClass] on: Compiler notificationClass
		do: 
			[:err | 
			compilationErrors addLast: err.
			err resume]!

canSaveMethod
	^self isReadOnly not and: [parentPresenter canSaveMethod and: [self textLength > 0]]!

clear
	"Remove all contents in the receiver's view"

	super clear.
	self clearParseTree!

clearParseTree
	"Private - Set the parse tree cache for the current method to the DeafObject to distinguish
	the case where the method has not yet been parsed from the case where the method failed to
	compile (in which case methodAST will have the value nil)."

	parseTree := DeafObject current.
	self resetParseTimer!

contextBindingFor: aString 
	self allPools do: [:each | (each bindingFor: aString) ifNotNil: [:binding | ^binding]].
	^nil!

createComponents
	"Create the presenters contained by the receiver. At this stage the receiver has not yet
	been initialized."

	super createComponents.
	refactoringTool := self systemModel newCodeRefactoringToolFor: self!

createSchematicWiring
	"Create the trigger wiring for the receiver"

	super createSchematicWiring.
	self
		when: #textChanged
			send: #onTextChanged
			to: self;
		when: #updateUI:
			send: #onUpdateUI:
			to: self!

defaultStylerClass
	^SmalltalkMethodStyler!

evaluationContext
	"Answers the evaluation context for this workspace."

	^evaluationContext ifNil: [self parseContext ifNotNil: [:class | class instanceClass]]!

formattedCode: anStProgramNode
	^anStProgramNode formattedCode!

hasErrors
	"Answer whether there are any errors in the source code (not warnings)"

	^self parseTree isNil or: [super hasErrors]!

initialize
	super initialize.
	self isAutoParseEnabled: self class isAutoParseEnabled!

isAutoParseEnabled
	^flags allMask: AutoParseMask!

isAutoParseEnabled: aBoolean 
	flags := flags mask: AutoParseMask set: aBoolean!

isEditable
	^super isEditable and: [parentPresenter hasEditableMethodSelected]!

isTempVariable: anStVariableNode 
	"Private - Answer whether the specified variable node represents one of the temporaries in
	the current method (note that parameters are included)."

	self parseTree allDefinedVariableNodesDo: [:each | each = anStVariableNode ifTrue: [^true]].
	^false!

killParseTimer
	self view killTimer: 1000!

lineFromPosition: anInteger 
	^view lineFromPosition: anInteger!

method
	Notification deprecated.
	^self selectedMethod!

nodeForRange: anInterval 
	^self parseTree 
		ifNotNil: 
			[:tree | 
			| node |
			node := tree whichNodeIsContainedBy: anInterval.
			node isNil ifTrue: [node := tree bestNodeFor: anInterval].
			node]!

onAboutToDisplayMenu: aMenu 
	"The system is about to display the <Menu> argument this is our chance to fiddle with it."

	super onAboutToDisplayMenu: aMenu.
	refactoringTool notNil ifTrue: [^refactoringTool onAboutToDisplayMenu: aMenu]!

onTextChanged
	"The text in the receiver's view has been changed. Clear cached information."

	self clearParseTree!

onTimerTick: anInteger 
	anInteger == 1000 ifFalse: [^super onTimerTick: anInteger].
	self killParseTimer.
	self isAutoParseEnabled ifTrue: [self autoParse]!

onUpdateUI: anSCNotification

	anSCNotification updated == 16r2 "SC_UPDATE_SELECTION" 
		ifTrue: [self selectionChanged].
!

parseContext
	^parentPresenter ifNotNil: [:p | p parseContext]!

parseSourceIn: methodClass 
	^SmalltalkParser parseMethod: self source in: methodClass!

parseTree
	parseTree == DeafObject current ifTrue: [parseTree := self buildParseTree].
	^parseTree!

promptToSaveChanges
	^parentPresenter promptToSaveChanges!

queryCommand: aCommandQuery
	"Private - Enter details about a potential command for the receiver into the
	<CommandQuery>."

	| selector |
	selector := aCommandQuery commandSymbol.
	#reformatMenu == selector
		ifTrue: 
			[aCommandQuery isEnabled: self isReadOnly not.
			^true].
	(#(#accept #reformatAccept) identityIncludes: selector)
		ifTrue: 
			[aCommandQuery isEnabled: self canSaveMethod.
			^true].
	#reformatSource == selector
		ifTrue: 
			[aCommandQuery isEnabled: (self isReadOnly not and: [self textLength > 0]).
			^true].
	(#(#browseDefinitions #browseReferences) identityIncludes: selector)
		ifTrue: 
			[| message |
			message := self selectedMessage.
			aCommandQuery
				isEnabled: true;
				text: (aCommandQuery commandDescription menuText expandMacrosWith: message ?? '...').
			^true].
	#browseMessage == selector
		ifTrue: 
			[| text node |
			node := self selectedMessageNode.
			(node isNil or: 
					[| target |
					target := self targetOfMessage: node.
					target isNil or: [(text := target lookupMethod: node selector) isNil]])
				ifTrue: 
					[aCommandQuery isEnabled: false.
					text := 'Message']
				ifFalse: [aCommandQuery isEnabled: true].
			aCommandQuery text: (aCommandQuery commandDescription menuText expandMacrosWith: text).
			^true].
	^super queryCommand: aCommandQuery!

reformatAccept
	self reformattedSource ifNotNil: [:aString | parentPresenter saveNewMethod: aString]!

reformatSource
	"Reformat and syntax colour the current contents of the method source pane, but do not
	accept it."

	| formatted |
	self hasSelection ifTrue: [^super reformatSource].
	formatted := self reformattedSource.
	(formatted notNil and: [formatted ~= self source]) ifFalse: [^self].
	self clearParseTree.
	"Use the target for replacement to avoid any visible selection"
	view
		targetAll;
		replaceTarget: formatted!

reformattedSource
	| ast |
	ast := self parseTree.
	^(compilationErrors detect: [:each | each severityClass == Error] ifNone: []) 
		ifNil: [self formattedCode: ast]
		ifNotNil: 
			[:ex | 
			self showError: ex offset: 0.
			nil]!

repositionAtSourceLine: anInteger 
	anInteger <= view lineCount ifFalse: [^self].
	self caretPosition: (view positionAtLine: anInteger).
	"Moves caret to the first non-whitespace on the line"
	view moveToVcHome!

resetParseTimer
	self
		killParseTimer;
		setParseTimer!

selectedErrorRange
	^self selectedNode sourceInterval!

selectedMessage
	#todo.	"Handle case of selected node being method signature"
	^self selectedNode 
		ifNotNil: 
			[:node | 
			node isMessage 
				ifTrue: [node selector]
				ifFalse: [(node isLiteralNode and: [node value isKindOf: Symbol]) ifTrue: [node value]]]!

selectedMessageNode
	^self selectedNode ifNotNil: [:node | node isMessage ifTrue: [node]]!

selectedMethod
	^parentPresenter ifNotNil: [:p | p selectedMethod]!

selectedNode
	"Answer an <StProgramNode> to represent the syntactic element which is currently selected,
	or which is under the caret."

	| range |
	range := self selectionRange.
	range isEmpty ifTrue: [range := range start to: range start].
	^(self nodeForRange: range) ifNil: [self parseTree]!

selectionChanged
	"The receiver highlights all text matching <view selection>"

	view identifyTextMatchingSelectionWithStyleName: #secondarySelection.!

selectorFromNode: aStProgramNode 
	^aStProgramNode isMessage 
		ifTrue: [aStProgramNode selector]
		ifFalse: 
			[(aStProgramNode isLiteralNode and: [aStProgramNode value isKindOf: Symbol]) 
				ifTrue: [aStProgramNode value]]!

selfClass
	^evaluationContext 
		ifNil: [self parseContext ?? UndefinedObject]
		ifNotNil: [:context | context basicClass]!

setParseTimer
	self view setTimer: 1000 interval: self class autoParseDwell!

source
	^self plainText!

source: aString 
	self
		text: aString;
		isModified: true!

targetOfMessage: aStMessageNode
	| receiver |
	receiver := aStMessageNode receiver.
	receiver isVariable
		ifTrue: 
			[| methodClass identifier |
			methodClass := self selectedMethod methodClass.
			"Semantic analysis may not have been run, but special variables can be identified syntactically."
			receiver isSpecialVariable ifTrue: [^receiver valueClassIn: methodClass].
			identifier := receiver name.
			(self isTempVariable: receiver)
				ifTrue: 
					["If hosted in the debugger can make a stab at these"
					(self contextBindingFor: identifier)
						ifNotNil: [:binding | binding value ifNotNil: [:value | ^value basicClass]].
					^nil].
			((self evaluationContext isKindOf: methodClass)
				and: [methodClass allInstVarNames includes: identifier])
					ifTrue: 
						["In the debugger will have an evaluation context which is the receiver."
						^(self evaluationContext instVarNamed: identifier) basicClass].
			(methodClass fullBindingFor: identifier)
				ifNotNil: [:binding | binding value ifNotNil: [:value | ^value basicClass]]]
		ifFalse: [receiver isLiteralNode ifTrue: [^aStMessageNode receiver value basicClass]].
	^nil!

variableClassification: anStVariableNode 
	| class |
	(anStVariableNode notNil and: [anStVariableNode isVariable]) ifFalse: [^nil].
	(self isTempVariable: anStVariableNode) ifTrue: [^#temporary].
	class := self parseContext.
	(class allInstVarNames includes: anStVariableNode name) ifTrue: [^#instance].
	(class classPool bindingFor: anStVariableNode name) ifNotNil: [^#class].
	(class environment bindingFor: anStVariableNode name) 
		ifNotNil: 
			[:var | 
			^(var value basicClass isMeta and: [var value name == var key]) ifTrue: [#classGlobal] ifFalse: [#global]].
	"Variable name not found in this context"
	^nil!

widenSourceSelection
	"Expand the selection to encompass the next greater syntactic element."

	| node |
	node := self selectedNode.
	
	[node isNil 
		ifTrue: 
			[Sound warningBeep.
			^self].
	self selectionRange = node sourceInterval] 
			whileTrue: [node := node parent].
	self selectionRange: node sourceInterval! !
!MethodWorkspace categoriesFor: #accept!commands!public! !
!MethodWorkspace categoriesFor: #addToCommandRoute:!commands!public! !
!MethodWorkspace categoriesFor: #allDefinedVariablesDo:!autocompletion!enumerating!private! !
!MethodWorkspace categoriesFor: #autoParse!helpers!private! !
!MethodWorkspace categoriesFor: #browseDefinitionsCommand!commands!private! !
!MethodWorkspace categoriesFor: #browseMessage!commands!public! !
!MethodWorkspace categoriesFor: #browseReferencesCommand!commands!private! !
!MethodWorkspace categoriesFor: #buildParseTree!helpers!private! !
!MethodWorkspace categoriesFor: #canSaveMethod!commands!private! !
!MethodWorkspace categoriesFor: #clear!operations!public! !
!MethodWorkspace categoriesFor: #clearParseTree!helpers!private! !
!MethodWorkspace categoriesFor: #contextBindingFor:!private!refactoring! !
!MethodWorkspace categoriesFor: #createComponents!initializing!public! !
!MethodWorkspace categoriesFor: #createSchematicWiring!initializing!public! !
!MethodWorkspace categoriesFor: #defaultStylerClass!constants!private! !
!MethodWorkspace categoriesFor: #evaluationContext!accessing!public! !
!MethodWorkspace categoriesFor: #formattedCode:!helpers!private! !
!MethodWorkspace categoriesFor: #hasErrors!public!testing! !
!MethodWorkspace categoriesFor: #initialize!initializing!private! !
!MethodWorkspace categoriesFor: #isAutoParseEnabled!accessing!public! !
!MethodWorkspace categoriesFor: #isAutoParseEnabled:!accessing!public! !
!MethodWorkspace categoriesFor: #isEditable!private!testing! !
!MethodWorkspace categoriesFor: #isTempVariable:!private!refactoring! !
!MethodWorkspace categoriesFor: #killParseTimer!helpers!private! !
!MethodWorkspace categoriesFor: #lineFromPosition:!enquiries!public! !
!MethodWorkspace categoriesFor: #method!accessing!private! !
!MethodWorkspace categoriesFor: #nodeForRange:!helpers!private! !
!MethodWorkspace categoriesFor: #onAboutToDisplayMenu:!event handling!public! !
!MethodWorkspace categoriesFor: #onTextChanged!event handling!public! !
!MethodWorkspace categoriesFor: #onTimerTick:!event handling!public! !
!MethodWorkspace categoriesFor: #onUpdateUI:!event handling!public! !
!MethodWorkspace categoriesFor: #parseContext!accessing!private! !
!MethodWorkspace categoriesFor: #parseSourceIn:!helpers!private! !
!MethodWorkspace categoriesFor: #parseTree!accessing!private! !
!MethodWorkspace categoriesFor: #promptToSaveChanges!helpers!public! !
!MethodWorkspace categoriesFor: #queryCommand:!commands!private! !
!MethodWorkspace categoriesFor: #reformatAccept!commands!public! !
!MethodWorkspace categoriesFor: #reformatSource!commands!public! !
!MethodWorkspace categoriesFor: #reformattedSource!helpers!private! !
!MethodWorkspace categoriesFor: #repositionAtSourceLine:!operations!public! !
!MethodWorkspace categoriesFor: #resetParseTimer!helpers!private! !
!MethodWorkspace categoriesFor: #selectedErrorRange!accessing!private!refactoring! !
!MethodWorkspace categoriesFor: #selectedMessage!accessing!private! !
!MethodWorkspace categoriesFor: #selectedMessageNode!accessing!private!refactoring! !
!MethodWorkspace categoriesFor: #selectedMethod!accessing!public! !
!MethodWorkspace categoriesFor: #selectedNode!accessing!public! !
!MethodWorkspace categoriesFor: #selectionChanged!event handling!public! !
!MethodWorkspace categoriesFor: #selectorFromNode:!commands!private! !
!MethodWorkspace categoriesFor: #selfClass!autocompletion!private! !
!MethodWorkspace categoriesFor: #setParseTimer!helpers!private! !
!MethodWorkspace categoriesFor: #source!accessing!public! !
!MethodWorkspace categoriesFor: #source:!accessing!public! !
!MethodWorkspace categoriesFor: #targetOfMessage:!commands!private!refactoring! !
!MethodWorkspace categoriesFor: #variableClassification:!helpers!private! !
!MethodWorkspace categoriesFor: #widenSourceSelection!commands!public! !

!MethodWorkspace class methodsFor!

autoParseDwell
	"Answer the <integer> number of milliseconds that must elapse after the user stops typing
	before an attempt is made to pro-actively parse the method source for errors."

	^AutoParseDwell!

autoParseDwell: anInteger
	"Set the <integer> number of milliseconds that must elapse after the user stops typing
	before an attempt is made to pro-actively parse the method source for errors."

	AutoParseDwell := anInteger!

defaultAdditionalAccelerators
	"Private - Answer a collection of additional accelerator definitions to be bound to the receiver's commands.
	Each element of the collection should be a two element <Array>, the first element of which is the command symbol
	and the second the accelerator key string."

	^super defaultAdditionalAccelerators , #(#(#widenSourceSelection 'Ctrl+U'))!

initialize
	"Private - Initialize the receiver's class variables.
		self initialize
	"

	AutoParseDwell := 1000.
	IsAutoParseEnabled := true.
	AutoParseMask := 16r100000!

isAutoParseEnabled
	"Answer whether the method source will be automatically parsed after the user has paused for a short while."

	^IsAutoParseEnabled!

isAutoParseEnabled: aBoolean
	IsAutoParseEnabled := aBoolean!

resource_Debugger_source
	"Answer the literal data from which the 'Debugger source' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Debugger_source)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ScintillaView) 34 50 nil nil 34 2 8 1445007684 1 416 nil 524550 ##(Smalltalk.ColorRef) 8 4278190080 nil 21 265030 4 ##(Smalltalk.Menu) nil true 34 21 984134 2 ##(Smalltalk.CommandMenuItem) 1 1180998 4 ##(Smalltalk.CommandDescription) #accept 18 7 38 65 99 99 101 112 116 1 1 nil nil nil 578 1 610 #reformatAccept 18 16 82 101 102 38 111 114 109 97 116 47 65 99 99 101 112 116 1 1 nil nil nil 578 1 610 #acceptNoRestart 18 18 65 99 99 101 38 112 116 32 78 111 32 82 101 115 116 97 114 116 1 1 nil nil nil 983366 1 ##(Smalltalk.DividerMenuItem) 4097 578 1 610 #runToCursor 18 14 38 82 117 110 32 116 111 32 67 117 114 115 111 114 1 1 nil nil nil 578 1 610 #toggleBreakpoint 18 18 38 84 111 103 103 108 101 32 66 114 101 97 107 112 111 105 110 116 1 1 nil nil nil 578 1 610 #toggleDisassembly 18 12 68 105 115 97 115 115 101 38 109 98 108 121 1 1 nil nil nil 754 4097 530 nil true 8 #() 18 13 65 117 116 111 45 38 99 111 114 114 101 99 116 #autoCorrectMenu 134217729 nil nil nil nil nil 530 nil true 34 16 578 1 610 #renameNode 18 15 82 101 38 110 97 109 101 32 60 49 100 62 46 46 46 1 1 nil nil nil 754 4097 578 1 610 #extractToTemporary 18 24 69 120 116 114 97 99 116 32 116 111 32 38 84 101 109 112 111 114 97 114 121 46 46 46 1 1 nil nil nil 578 1 610 #extractMethod 18 18 69 38 120 116 114 97 99 116 32 77 101 116 104 111 100 46 46 46 1 1 nil nil nil 578 1 610 #extractToComponent 18 24 69 120 116 114 97 99 116 32 116 111 32 38 67 111 109 112 111 110 101 110 116 46 46 46 1 5 nil nil nil 754 4097 578 1 610 #inlineMessage 18 15 73 110 108 105 110 101 32 38 77 101 115 115 97 103 101 1 1 nil nil nil 530 nil true 8 #() 18 21 73 109 112 108 38 101 109 101 110 116 32 77 101 115 115 97 103 101 32 73 110 #implementMessageMenu 134217729 nil nil nil nil nil 754 4097 578 1 610 #inlineTemporary 18 17 38 73 110 108 105 110 101 32 84 101 109 112 111 114 97 114 121 1 1 nil nil nil 578 1 610 #moveTempToInnerScope 18 20 77 111 118 101 32 116 111 32 73 110 110 101 114 32 38 83 99 111 112 101 1 1 nil nil nil 578 1 610 #convertTempToInstVar 18 29 67 111 110 38 118 101 114 116 32 116 111 32 73 110 115 116 97 110 99 101 32 86 97 114 105 97 98 108 101 1 1 nil nil nil 754 4097 578 1 610 #addParameterToMessage 18 25 38 65 100 100 32 80 97 114 97 109 101 116 101 114 32 116 111 32 60 49 100 62 46 46 46 1 1 nil nil nil 578 1 610 #inlineParameter 18 17 73 110 38 108 105 110 101 32 80 97 114 97 109 101 116 101 114 1 1 nil nil nil 578 1 610 #removeParameter 18 17 82 101 109 111 118 101 32 38 80 97 114 97 109 101 116 101 114 1 1 nil nil nil 18 13 82 101 102 97 99 116 111 114 105 110 38 103 115 #codeRefactoringsMenu 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 18 15 82 101 102 97 99 116 111 114 105 110 103 46 105 99 111 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 18 14 100 111 108 112 104 105 110 100 114 55 46 100 108 108 nil nil nil nil nil 754 4097 530 nil true 34 9 578 1 610 #undo 18 5 38 85 110 100 111 1 1 1682 nil true 1728 18 12 69 100 105 116 85 110 100 111 46 105 99 111 1776 nil nil 754 4097 578 1 610 #cutSelection 18 4 67 117 38 116 1 1 1682 nil true 1728 18 11 69 100 105 116 67 117 116 46 105 99 111 1776 nil nil 578 1 610 #copySelection 18 5 38 67 111 112 121 1 1 1682 nil true 1728 18 12 69 100 105 116 67 111 112 121 46 105 99 111 1776 nil nil 578 1 610 #pasteClipboard 18 6 38 80 97 115 116 101 1 1 1682 nil true 1728 18 13 69 100 105 116 80 97 115 116 101 46 105 99 111 1776 nil nil 578 1 610 #clearSelection 18 7 68 101 38 108 101 116 101 1 1 1682 nil true 1728 18 13 69 100 105 116 67 108 101 97 114 46 105 99 111 1776 nil nil 578 1 610 #reformatSource 18 9 82 101 38 102 111 114 109 97 116 1 1 nil nil nil 754 4097 578 1 610 #selectAll 18 11 38 83 101 108 101 99 116 32 65 108 108 1 1 nil nil nil 18 5 38 69 100 105 116 nil 134217729 nil nil nil nil nil 530 nil true 34 10 578 1 610 #inspectWorkspacePool 18 10 86 97 114 105 97 98 38 108 101 115 1 1 nil nil nil 578 1 610 #cloneNew 18 6 67 108 111 38 110 101 1 1 1682 nil true 1728 18 22 83 109 97 108 108 116 97 108 107 87 111 114 107 115 112 97 99 101 46 105 99 111 1776 nil nil 754 4097 578 1 610 #toggleAutoCompletion 18 13 65 117 116 111 45 99 111 109 112 108 101 116 101 1 1 nil nil nil 578 1 610 #toggleIndentationGuides 18 19 73 110 100 101 110 116 97 116 105 111 110 32 38 71 117 105 100 101 115 1 1 nil nil nil 578 1 610 #toggleLineNumbers 18 13 76 105 110 101 32 78 38 117 109 98 101 114 115 1 1 nil nil nil 578 1 610 #toggleLineEndings 18 13 76 105 110 101 32 38 69 110 100 105 110 103 115 1 1 nil nil nil 578 1 610 #toggleStyling 18 16 38 83 121 110 116 97 120 32 67 111 108 111 114 105 110 103 1 1 nil nil nil 578 1 610 #toggleWhitespace 18 11 87 38 104 105 116 101 115 112 97 99 101 1 1 nil nil nil 578 1 610 #toggleWordWrap 18 10 38 87 111 114 100 32 87 114 97 112 1 1 nil nil nil 18 10 87 111 114 38 107 115 112 97 99 101 nil 134217729 nil nil nil nil nil 754 4097 578 1 610 #browseIt 18 10 66 114 111 38 119 115 101 32 73 116 1 1 1682 nil true 1728 18 21 67 108 97 115 115 66 114 111 119 115 101 114 83 104 101 108 108 46 105 99 111 1776 nil nil 578 1 610 #displayIt 18 11 38 68 105 115 112 108 97 121 32 73 116 1 1 1682 nil true 1728 18 13 68 105 115 112 108 97 121 73 116 46 105 99 111 1776 nil nil 578 1 610 #evaluateIt 18 12 69 38 118 97 108 117 97 116 101 32 73 116 1 1 1682 nil true 1728 18 14 69 118 97 108 117 97 116 101 73 116 46 105 99 111 1776 nil nil 578 1 610 #inspectIt 18 11 38 73 110 115 112 101 99 116 32 73 116 1 1 1682 nil true 1728 18 13 73 110 115 112 101 99 116 73 116 46 105 99 111 1776 nil nil 578 1 610 #debugIt 18 9 68 101 98 38 117 103 32 73 116 1 1 1682 nil true 1728 18 12 68 101 98 117 103 103 101 114 46 105 99 111 1776 nil nil 754 4097 530 nil true 34 4 578 2097153 610 #browseDefinitions 18 20 38 68 101 102 105 110 105 116 105 111 110 115 32 111 102 32 60 49 100 62 1 1 nil nil nil 578 1 610 #browseReferences 18 19 38 82 101 102 101 114 101 110 99 101 115 32 116 111 32 60 49 100 62 1 1 nil nil nil 754 4097 578 1 610 #browseMessage 18 4 60 49 100 62 1 1 nil nil nil 18 7 38 66 114 111 119 115 101 nil 1 nil nil nil nil nil 18 10 38 87 111 114 107 115 112 97 99 101 nil 134217729 nil nil nil nil nil nil nil 416 nil 8 4294912177 852486 ##(Smalltalk.NullConverter) nil nil 9 nil 170 192 34 4 #normal 1182790 1 ##(Smalltalk.ScintillaTextStyle) 1 nil nil 1 nil nil nil nil #normal nil nil nil #callTip 3666 77 786694 ##(Smalltalk.IndexedColor) 33554457 3714 33554471 1 nil nil nil nil #callTip nil nil nil 34 40 3680 nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 1377542 ##(Smalltalk.SmalltalkMethodStyler) 1 nil nil false 138 144 8 #() 170 192 34 2 #default 1641542 1 ##(Smalltalk.ScintillaMarkerDefinition) 1 nil nil nil 416 #circle nil nil nil nil nil nil 138 ##(Smalltalk.IdentitySet) 3824 nil 170 176 3824 9215 nil nil nil nil 3714 33554447 nil nil 65 nil nil 170 192 34 6 #literalBytes 18 2 91 93 #specialCharacter 18 6 40 41 91 93 60 62 #literalArray 18 2 40 41 18 0 3 170 192 34 2 #container 3632 nil nil nil nil 3 nil 170 192 3824 nil nil 170 192 34 6 #Notification 3666 1029 nil 196934 1 ##(Smalltalk.RGB) 31185883 1 nil nil nil nil #Notification nil nil nil #Warning 3666 1027 4146 60239 4146 31326207 1 nil nil nil nil #Warning nil nil nil #Error 3666 1031 4146 335 4146 31317503 1 nil nil nil nil #Error nil nil nil nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 10 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 3839 21 4386 641 441 416 4338 #contextMenu: 34 1 544 416 4338 #modificationEventMask: 8 #(4607) 416 4338 #hoverTime: 8 #(500) 416 4338 #caretPeriod: 8 #(530) 416 4338 #wordWrap: 8 #(true) 416 4338 #margins: 34 1 34 3 985158 2 ##(Smalltalk.ScintillaMargin) 1 416 1 3 nil nil nil nil 4642 3 416 1 nil nil 67108863 nil nil 4642 5 416 1 nil nil nil nil nil 416 4338 #tabWidth: 8 #(4) 416 4338 #maxCompletionListHeight: 8 #(9) 416 4338 #sciSetCodePage: 8 #(65001) 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 191 8 0 0 230 0 0 0] 8 #() 4386 193 193 nil 29 )!

resource_Default_view
	"Answer the literal data from which the 'Default view' resource can be reconstituted.
	DO NOT EDIT OR RECATEGORIZE THIS METHOD.

	If you wish to modify this resource evaluate:
	ViewComposer openOn: (ResourceIdentifier class: self selector: #resource_Default_view)
	"

	^#(#'!!STL' 4 788558 10 ##(Smalltalk.STBViewProxy) ##(Smalltalk.ScintillaView) 34 50 nil nil 34 2 8 1445007684 1 416 nil 524550 ##(Smalltalk.ColorRef) 8 4278190080 nil 21 265030 4 ##(Smalltalk.Menu) nil true 34 17 984134 2 ##(Smalltalk.CommandMenuItem) 1 1180998 4 ##(Smalltalk.CommandDescription) #accept 18 7 38 65 99 99 101 112 116 1 1 nil nil nil 578 1 610 #reformatAccept 18 16 82 101 102 38 111 114 109 97 116 47 65 99 99 101 112 116 1 1 nil nil nil 983366 1 ##(Smalltalk.DividerMenuItem) 4097 530 nil true 8 #() 18 13 65 117 116 111 45 38 99 111 114 114 101 99 116 #autoCorrectMenu 134217729 nil nil nil nil nil 530 nil true 34 16 578 1 610 #renameNode 18 15 82 101 38 110 97 109 101 32 60 49 100 62 46 46 46 1 1 nil nil nil 706 4097 578 1 610 #extractToTemporary 18 24 69 120 116 114 97 99 116 32 116 111 32 38 84 101 109 112 111 114 97 114 121 46 46 46 1 1 nil nil nil 578 1 610 #extractMethod 18 18 69 38 120 116 114 97 99 116 32 77 101 116 104 111 100 46 46 46 1 1 nil nil nil 578 1 610 #extractToComponent 18 24 69 120 116 114 97 99 116 32 116 111 32 38 67 111 109 112 111 110 101 110 116 46 46 46 1 5 nil nil nil 706 4097 578 1 610 #inlineMessage 18 15 73 110 108 105 110 101 32 38 77 101 115 115 97 103 101 1 1 nil nil nil 530 nil true 8 #() 18 21 73 109 112 108 38 101 109 101 110 116 32 77 101 115 115 97 103 101 32 73 110 #implementMessageMenu 134217729 nil nil nil nil nil 706 4097 578 1 610 #inlineTemporary 18 17 38 73 110 108 105 110 101 32 84 101 109 112 111 114 97 114 121 1 1 nil nil nil 578 1 610 #moveTempToInnerScope 18 20 77 111 118 101 32 116 111 32 73 110 110 101 114 32 38 83 99 111 112 101 1 1 nil nil nil 578 1 610 #convertTempToInstVar 18 29 67 111 110 38 118 101 114 116 32 116 111 32 73 110 115 116 97 110 99 101 32 86 97 114 105 97 98 108 101 1 1 nil nil nil 706 4097 578 1 610 #addParameterToMessage 18 25 38 65 100 100 32 80 97 114 97 109 101 116 101 114 32 116 111 32 60 49 100 62 46 46 46 1 1 nil nil nil 578 1 610 #inlineParameter 18 17 73 110 38 108 105 110 101 32 80 97 114 97 109 101 116 101 114 1 1 nil nil nil 578 1 610 #removeParameter 18 17 82 101 109 111 118 101 32 38 80 97 114 97 109 101 116 101 114 1 1 nil nil nil 18 13 82 101 102 97 99 116 111 114 105 110 38 103 115 #codeRefactoringsMenu 1 263494 3 ##(Smalltalk.Icon) nil true 1572870 ##(Smalltalk.ImageRelativeFileLocator) 18 15 82 101 102 97 99 116 111 114 105 110 103 46 105 99 111 2032142 ##(Smalltalk.STBExternalResourceLibraryProxy) 18 14 100 111 108 112 104 105 110 100 114 55 46 100 108 108 nil nil nil nil nil 530 nil true 34 2 578 1 610 #reformatSource 18 7 38 83 111 117 114 99 101 1 1 nil nil nil 578 1 610 #reformatComment 18 8 38 67 111 109 109 101 110 116 1 1 nil nil nil 18 9 82 101 38 102 111 114 109 97 116 #reformatMenu 1 nil nil nil nil nil 706 4097 530 nil true 34 9 578 1 610 #undo 18 5 38 85 110 100 111 1 1 1474 nil true 1520 18 12 69 100 105 116 85 110 100 111 46 105 99 111 1568 nil nil 706 4097 578 1 610 #cutSelection 18 4 67 117 38 116 1 1 1474 nil true 1520 18 11 69 100 105 116 67 117 116 46 105 99 111 1568 nil nil 578 1 610 #copySelection 18 5 38 67 111 112 121 1 1 1474 nil true 1520 18 12 69 100 105 116 67 111 112 121 46 105 99 111 1568 nil nil 578 1 610 #pasteClipboard 18 6 38 80 97 115 116 101 1 1 1474 nil true 1520 18 13 69 100 105 116 80 97 115 116 101 46 105 99 111 1568 nil nil 578 1 610 #clearSelection 18 7 68 101 38 108 101 116 101 1 1 1474 nil true 1520 18 13 69 100 105 116 67 108 101 97 114 46 105 99 111 1568 nil nil 706 4097 578 1 610 #selectAll 18 11 38 83 101 108 101 99 116 32 65 108 108 1 1 nil nil nil 578 1 610 #widenSourceSelection 18 16 38 87 105 100 101 110 32 83 101 108 101 99 116 105 111 110 1 1 nil nil nil 18 5 38 69 100 105 116 nil 134217729 nil nil nil nil nil 530 nil true 34 10 578 1 610 #inspectWorkspacePool 18 10 86 97 114 105 97 98 38 108 101 115 1 1 nil nil nil 578 1 610 #cloneNew 18 6 67 108 111 38 110 101 1 1 1474 nil true 1520 18 22 83 109 97 108 108 116 97 108 107 87 111 114 107 115 112 97 99 101 46 105 99 111 1568 nil nil 706 4097 578 1 610 #toggleAutoCompletion 18 13 65 117 116 111 45 99 111 109 112 108 101 116 101 1 1 nil nil nil 578 1 610 #toggleIndentationGuides 18 19 73 110 100 101 110 116 97 116 105 111 110 32 38 71 117 105 100 101 115 1 1 nil nil nil 578 1 610 #toggleLineNumbers 18 13 76 105 110 101 32 78 38 117 109 98 101 114 115 1 1 nil nil nil 578 1 610 #toggleLineEndings 18 13 76 105 110 101 32 38 69 110 100 105 110 103 115 1 1 nil nil nil 578 1 610 #toggleStyling 18 16 38 83 121 110 116 97 120 32 67 111 108 111 114 105 110 103 1 1 nil nil nil 578 1 610 #toggleWhitespace 18 11 87 38 104 105 116 101 115 112 97 99 101 1 1 nil nil nil 578 1 610 #toggleWordWrap 18 10 38 87 111 114 100 32 87 114 97 112 1 1 nil nil nil 18 10 87 111 114 38 107 115 112 97 99 101 nil 134217729 nil nil nil nil nil 706 4097 578 1 610 #browseIt 18 10 66 114 111 38 119 115 101 32 73 116 1 1 1474 nil true 1520 18 21 67 108 97 115 115 66 114 111 119 115 101 114 83 104 101 108 108 46 105 99 111 1568 nil nil 578 1 610 #displayIt 18 11 38 68 105 115 112 108 97 121 32 73 116 1 1 1474 nil true 1520 18 13 68 105 115 112 108 97 121 73 116 46 105 99 111 1568 nil nil 578 1 610 #evaluateIt 18 12 69 38 118 97 108 117 97 116 101 32 73 116 1 1 1474 nil true 1520 18 14 69 118 97 108 117 97 116 101 73 116 46 105 99 111 1568 nil nil 578 1 610 #inspectIt 18 11 38 73 110 115 112 101 99 116 32 73 116 1 1 1474 nil true 1520 18 13 73 110 115 112 101 99 116 73 116 46 105 99 111 1568 nil nil 578 1 610 #debugIt 18 9 68 101 98 38 117 103 32 73 116 1 1 1474 nil true 1520 18 12 68 101 98 117 103 103 101 114 46 105 99 111 1568 nil nil 706 4097 530 nil true 34 4 578 2097153 610 #browseDefinitions 18 20 68 101 102 105 38 110 105 116 105 111 110 115 32 111 102 32 60 49 100 62 1 1 nil nil nil 578 1 610 #browseReferences 18 19 38 82 101 102 101 114 101 110 99 101 115 32 116 111 32 60 49 100 62 1 1 nil nil nil 706 4097 578 1 610 #browseMessage 18 4 60 49 100 62 1 1 nil nil nil 18 7 38 66 114 111 119 115 101 nil 1 nil nil nil nil nil 18 10 38 87 111 114 107 115 112 97 99 101 nil 134217729 nil nil nil nil nil nil nil 416 nil 8 4294912177 852486 ##(Smalltalk.NullConverter) nil nil 9 nil 170 192 34 4 #normal 1182790 1 ##(Smalltalk.ScintillaTextStyle) 1 nil nil 1 nil nil nil nil #normal nil nil nil #callTip 3602 77 786694 ##(Smalltalk.IndexedColor) 33554457 3650 33554471 1 nil nil nil nil #callTip nil nil nil 34 40 3616 nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil 1377542 ##(Smalltalk.SmalltalkMethodStyler) 1 nil nil false 138 144 8 #() 170 192 34 2 #default 1641542 1 ##(Smalltalk.ScintillaMarkerDefinition) 1 nil nil nil 416 #circle nil nil nil nil nil nil 138 ##(Smalltalk.IdentitySet) 3760 nil 170 176 3760 9215 nil nil nil nil 3650 33554447 nil nil 65 nil nil 170 192 34 6 #literalBytes 18 2 91 93 #specialCharacter 18 6 40 41 91 93 60 62 #literalArray 18 2 40 41 18 0 3 170 192 34 2 #container 3568 nil nil nil nil 3 nil 170 192 3760 nil nil 170 192 34 6 #Notification 3602 1029 nil 196934 1 ##(Smalltalk.RGB) 31185883 1 nil nil nil nil #Notification nil nil nil #Warning 3602 1027 4082 60239 4082 31326207 1 nil nil nil nil #Warning nil nil nil #Error 3602 1031 4082 335 4082 31317503 1 nil nil nil nil #Error nil nil nil nil 983302 ##(Smalltalk.MessageSequence) 138 144 34 10 721670 ##(Smalltalk.MessageSend) #createAt:extent: 34 2 328198 ##(Smalltalk.Point) 3839 21 4322 641 441 416 4274 #contextMenu: 34 1 544 416 4274 #modificationEventMask: 8 #(4607) 416 4274 #hoverTime: 8 #(500) 416 4274 #caretPeriod: 8 #(530) 416 4274 #wordWrap: 8 #(true) 416 4274 #margins: 34 1 34 3 985158 2 ##(Smalltalk.ScintillaMargin) 1 416 1 3 nil nil nil nil 4578 3 416 1 nil nil 67108863 nil nil 4578 5 416 1 nil nil nil nil nil 416 4274 #backspaceUnindents: 8 #(true) 416 4274 #maxCompletionListHeight: 8 #(9) 416 4274 #sciSetCodePage: 8 #(65001) 416 983302 ##(Smalltalk.WINDOWPLACEMENT) 8 #[44 0 0 0 0 0 0 0 1 0 0 0 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 255 127 7 0 0 10 0 0 0 191 8 0 0 230 0 0 0] 8 #() 4322 193 193 nil 29 )! !
!MethodWorkspace class categoriesFor: #autoParseDwell!accessing!public! !
!MethodWorkspace class categoriesFor: #autoParseDwell:!accessing!public! !
!MethodWorkspace class categoriesFor: #defaultAdditionalAccelerators!constants!private! !
!MethodWorkspace class categoriesFor: #initialize!initializing!public! !
!MethodWorkspace class categoriesFor: #isAutoParseEnabled!accessing!public! !
!MethodWorkspace class categoriesFor: #isAutoParseEnabled:!accessing!public! !
!MethodWorkspace class categoriesFor: #resource_Debugger_source!public!resources-views! !
!MethodWorkspace class categoriesFor: #resource_Default_view!public!resources-views! !

