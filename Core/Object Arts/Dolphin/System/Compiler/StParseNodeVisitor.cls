"Filed out from Dolphin Smalltalk 7"!

Object subclass: #StParseNodeVisitor
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StParseNodeVisitor guid: (GUID fromString: '{8CF81BE6-059C-46DA-86E3-B21A6781066B}')!
StParseNodeVisitor comment: 'BRProgramNodeVisitor is an abstract visitor for the BRProgramNodes.

'!
!StParseNodeVisitor categoriesForClass!Refactory-ParseTree Matching! !
!StParseNodeVisitor methodsFor!

processBlock: aBlockNode
	self visitArgumentNodes: aBlockNode arguments.
	self visitNode: aBlockNode body!

visitArgumentNode: aStVariableNode
	"Private - Here to allow subclasses to detect arguments or temporaries."

	^self visitVariableNode: aStVariableNode!

visitArgumentNodes: aNodeCollection
	^aNodeCollection do: [:each | self visitArgumentNode: each]!

visitArrayNode: anArrayNode
	anArrayNode children do: [:each | self visitNode: each]!

visitAssignmentNode: anAssignmentNode
	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value!

visitBlockNode: aBlockNode
	self processBlock: aBlockNode!

visitCascadeNode: aCascadeNode
	aCascadeNode messages do: [:each | self visitNode: each]!

visitExternalArgTypeNode: anAssignmentNode
	"Dolphin specific extension"

	!

visitExternalCallNode: anStExternalCallNode
	"Dolphin specific extension"

	!

visitLiteralArrayNode: aLiteralArrayNode
	aLiteralArrayNode contents do: [:each | self visitNode: each]!

visitLiteralNode: aLiteralNode
	!

visitMessageNode: aMessageNode
	(aMessageNode isCascaded not or: [aMessageNode isFirstCascaded])
		ifTrue: [self visitNode: aMessageNode receiver].
	aMessageNode arguments do: [:each | self visitNode: each]!

visitMethodNode: aMethodNode
	self visitArgumentNodes: aMethodNode arguments.
	self visitNode: aMethodNode body!

visitNode: aNode
	^aNode acceptVisitor: self!

visitOptimizedNode: anOptimizedNode
	self visitNode: anOptimizedNode body!

visitPragmaNode: aPragmaNode
	aPragmaNode arguments do: [:each | self visitNode: each]!

visitPrimitiveNode: anStPrimitiveNode
	!

visitReturnNode: aReturnNode
	self visitNode: aReturnNode value!

visitSequenceNode: aSequenceNode
	| statements |
	self visitTempDecls: aSequenceNode temporaries.
	aSequenceNode parent
		ifNotNil: [:parent | parent isMethod ifTrue: [parent tag ifNotNil: [:tag | self visitNode: tag]]].
	statements := aSequenceNode statements.
	self visitStatements: statements!

visitStatements: aNodeCollection
	aNodeCollection do: [:each | self visitNode: each]!

visitTempDecls: aNodeCollection
	^self visitArgumentNodes: aNodeCollection!

visitVariableNode: aVariableNode
	! !
!StParseNodeVisitor categoriesFor: #processBlock:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitArgumentNode:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitArgumentNodes:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitArrayNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitAssignmentNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitBlockNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitCascadeNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitExternalArgTypeNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitExternalCallNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitLiteralArrayNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitLiteralNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitMessageNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitMethodNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitNode:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitOptimizedNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitPragmaNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitPrimitiveNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitReturnNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitSequenceNode:!public!visiting! !
!StParseNodeVisitor categoriesFor: #visitStatements:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitTempDecls:!private!visiting! !
!StParseNodeVisitor categoriesFor: #visitVariableNode:!public!visiting! !

!StParseNodeVisitor class methodsFor!

new
	^super new initialize! !
!StParseNodeVisitor class categoriesFor: #new!instance creation!public! !

