"Filed out from Dolphin Smalltalk 7"!

MethodWorkspace subclass: #ExpressionWorkspace
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ExpressionWorkspace guid: (GUID fromString: '{EA12093C-6DAF-49D6-B548-BFD1D31522B0}')!
ExpressionWorkspace comment: ''!
!ExpressionWorkspace categoriesForClass!Development! !
!ExpressionWorkspace methodsFor!

accept
	"Save the method source, updating the existing method or adding a new one depending on
	whether the user has edited the method signature."

	self halt.
	super accept!

canRefactor
	^self isEditable and: [self isModified not and: [self systemModel canRefactor]]!

canSaveMethod
	^true!

formattedCode: anStProgramNode
	| formatter reformatted |
	formatter := anStProgramNode formatterClass new.
	formatter
		indent: 1
		around: [reformatted := (String with: Character tab) , (formatter format: anStProgramNode)].
	^reformatted!

parseSourceIn: methodClass 
	^SmalltalkParser parseExpression: self source in: methodClass!

reformatSource
	"Reformat and syntax colour the current contents of the method source pane, but do not
	accept it."

	| formatted |
self halt.
	self hasSelection ifTrue: [^super reformatSource].
	formatted := self reformattedSource.
	(formatted notNil and: [formatted ~= self source]) ifFalse: [^self].
	self clearParseTree.
	"Use the target for replacement to avoid any visible selection"
	view
		targetAll;
		replaceTarget: formatted! !
!ExpressionWorkspace categoriesFor: #accept!commands!public! !
!ExpressionWorkspace categoriesFor: #canRefactor!public!refactoring!testing! !
!ExpressionWorkspace categoriesFor: #canSaveMethod!public! !
!ExpressionWorkspace categoriesFor: #formattedCode:!helpers!private! !
!ExpressionWorkspace categoriesFor: #parseSourceIn:!helpers!private! !
!ExpressionWorkspace categoriesFor: #reformatSource!commands!public! !

