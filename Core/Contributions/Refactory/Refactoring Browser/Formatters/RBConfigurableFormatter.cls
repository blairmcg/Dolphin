﻿"Filed out from Dolphin Smalltalk 7"!

RBSourceFormatter subclass: #RBConfigurableFormatter
	instanceVariableNames: 'lookaheadCode originalSource'
	classVariableNames: 'FormatCommentWithStatements IndentsForKeywords IndentString LineUpBlockBrackets MethodSignatureOnMultipleLines MinimumNewLinesBetweenStatements NewLineAfterCascade NewLineBeforeFirstCascade NewLineBeforeFirstKeyword NewLinesAfterMethodComment NewLinesAfterMethodPattern NewLinesAfterTemporaries NumberOfArgumentsForMultiLine PeriodsAtEndOfBlock RetainBlankLinesBetweenStatements StringFollowingReturn StringInsideBlocks StringInsideParentheses TraditionalBinaryPrecedence UseTraditionalBinaryPrecedenceForParentheses'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RBConfigurableFormatter guid: (GUID fromString: '{70ffaafa-37c2-4408-bfa3-e5417f61cd58}')!
RBConfigurableFormatter comment: 'RBConfigurableFormatter formats the Refactoring Browser''s parse trees. It has many more formatting options than the RBFormatter.  For some refactorings the RB must reformat the code after the change, so it is good to have a formatter configured to your tastes.

To switch to this formatter, execute "StProgramNode formatterClass: RBConfigurableFormatter", or look for the #formatterClass option under ''Development System'' in User Preferences.

Instance Variables:
	indent		<Integer>	how many times are we indenting a new line -- indents are normally tabs but could be any whitespace string
	lookaheadCode	<Dictionary key: StProgramNode value: String>	sometimes we need to lookahead while formatting, this dictionary contains the nodes that have already been formatted by lookahead
	originalSource	<String>	the original source before we started formatting. This is used to extract the comments from the original source.

'!
!RBConfigurableFormatter categoriesForClass!System-Compiler-Formatters! !
!RBConfigurableFormatter methodsFor!

addNewLinesBeforeStatementStartingAt: anInteger 
	| newLines |
	newLines := MinimumNewLinesBetweenStatements 
				max: (RetainBlankLinesBetweenStatements 
						ifTrue: [self newLinesBeforeStartingAt: anInteger]
						ifFalse: [0]).
	newLines = 0 ifTrue: [self space] ifFalse: [self newLines: newLines]!

format: aParseTree 
	originalSource := aParseTree source.
	^super format: aParseTree!

formatArray: anArrayNode
	(anArrayNode statements allSatisfy: [:each | each isKindOf: StLiteralValueNode])
		ifTrue: 
			[| current |
			anArrayNode statements do: 
					[:each |
					current := each.
					self visitNode: each]
				separatedBy: 
					[(self isLineTooLong: current formattedCode)
						ifTrue: 
							[codeStream nextPut: $..
							self newLine]
						ifFalse: [codeStream nextPutAll: '. ']]]
		ifFalse: [self formatSequenceNodeStatementsFor: anArrayNode]!

formatBinaryMessage: aMessageNode 
	self space.
	codeStream nextPutAll: aMessageNode selector.
	self space.
	self visitNode: aMessageNode arguments first!

formatBlock: aBlockNode
	(LineUpBlockBrackets and: [self willBeMultiline: aBlockNode body]) ifTrue:
			[self newLine] ifFalse: [codeStream nextPutAll: StringInsideBlocks].
	self formatBlockArgumentsFor: aBlockNode.
	self visitNode: aBlockNode body.
	^(LineUpBlockBrackets and: [self willBeMultiline: aBlockNode body]) ifTrue:
			[self newLine] ifFalse: [codeStream nextPutAll: StringInsideBlocks]!

formatBlockArgumentsFor: aBlockNode
	aBlockNode arguments isEmpty ifTrue: [^self].
	aBlockNode arguments
		do:
			[:each | 
			codeStream nextPut: $:.
			self visitNode: each.
			FormatCommentWithStatements ifTrue: [self formatCommentsFor: each].
			self space].
	codeStream nextPutAll: '| '.
	(self willBeMultiline: aBlockNode body) ifTrue: [self newLine]!

formatCommentsFor: aNode 
	originalSource isNil ifTrue: [^self].
	aNode comments do: 
			[:each | 
			codeStream
				space;
				nextPutAll: (originalSource copyFrom: each first to: each last)]!

formatMethodBodyFor: aMethodNode 
	self indentAround: 
			[self newLines: NewLinesAfterMethodPattern.
			self formatMethodCommentFor: aMethodNode.
			#rbFix.	"Allow for different position of primitive tag relative to temp declarations"
			self tagBeforeTemporaries ifTrue: [self formatTagFor: aMethodNode].
			self visitNode: aMethodNode body]	"Allow for different position of primitive tag relative to temp declarations"!

formatMethodCommentFor: aMethodNode
	originalSource isNil ifTrue: [^self].
	(FormatCommentWithStatements
		ifTrue: [aMethodNode methodComments]
		ifFalse: [aMethodNode comments])
		do:
			[:each | 
			codeStream
				nextPutAll:
					(originalSource
						copyFrom: each first
						to: each last).
			self newLines: NewLinesAfterMethodComment]!

formatMethodPatternFor: aMethodNode 
	aMethodNode arguments isEmpty
		ifTrue: [codeStream nextPutAll: aMethodNode selector]
		ifFalse: 
			[self
				with: aMethodNode selectorParts
				and: aMethodNode arguments
				do: 
					[:key :arg | 
					codeStream nextPutAll: key value.
					self space.
					self visitNode: arg]
				separatedBy: 
					[MethodSignatureOnMultipleLines
						ifTrue: [self newLine]
						ifFalse: [self space]]]!

formatSelectorAndArguments: aMessageNode 
	| newLineBetweenArguments |
	newLineBetweenArguments := self isMultiLineMessage: aMessageNode.
	self indent: IndentsForKeywords
		around: 
			[self 
				formatSelectorAndArguments: aMessageNode
				firstSeparator: (newLineBetweenArguments & NewLineBeforeFirstKeyword 
						ifTrue: [[self newLine]]
						ifFalse: [[self space]])
				restSeparator: (newLineBetweenArguments 
						ifTrue: [[self newLine]]
						ifFalse: [[self space]])]!

formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock 
	| separatorBlock |
	separatorBlock := firstBlock.
	aMessageNode isUnary 
		ifTrue: 
			[(self isLineTooLong: aMessageNode selector) 
				ifTrue: [self newLine]
				ifFalse: [separatorBlock value].
			codeStream nextPutAll: aMessageNode selector]
		ifFalse: 
			[aMessageNode selectorParts with: aMessageNode arguments
				do: 
					[:selector :argument | 
					(self isLineTooLong: selector value) 
						ifTrue: [self newLine]
						ifFalse: [separatorBlock value].
					separatorBlock := restBlock.
					self indentAround: 
							[codeStream nextPutAll: selector value.
							((self willBeMultiline: argument) 
								or: [self isLineTooLong: (self formattedSourceFor: argument)]) 
									ifTrue: [self newLine]
									ifFalse: [self space].
							self visitNode: argument]]]!

formatSequenceCommentsFor: aSequenceNode
	originalSource isNil ifTrue: [^self].
	aSequenceNode comments
		do:
			[:each | 
			codeStream
				nextPutAll:
					(originalSource
						copyFrom: each first
						to: each last).
			self newLine]!

formatSequenceNodeStatementsFor: aSequenceNode 
	| statements |
	statements := aSequenceNode statements.
	statements isEmpty ifTrue: [^self].
	1 to: statements size
		do: 
			[:i | 
			self visitNode: (statements at: i).
			(i < statements size or: 
					[aSequenceNode parent 
						ifNil: [self class periodsAsTerminators]
						ifNotNil: 
							[:parent | 
							parent isBlock 
								ifTrue: [self class periodsAtEndOfBlock]
								ifFalse: [self class periodsAtEndOfMethod]]]) 
				ifTrue: [codeStream nextPut: $.].
			self formatStatementCommentsFor: (statements at: i).
			i < statements size 
				ifTrue: [self addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start]]!

formatStatementCommentsFor: aStatementNode
	originalSource isNil ifTrue: [^self].
	FormatCommentWithStatements ifFalse: [^self].
	aStatementNode statementComments
		do:
			[:each | 
			codeStream
				tab;
				nextPutAll:
						(originalSource
								copyFrom: each first
								to: each last)]!

formattedSourceFor: aNode 
	^lookaheadCode at: aNode
		ifAbsentPut: [self class format: aNode withIndents: indent]!

formatTemporariesFor: aSequenceNode
	aSequenceNode temporaries isEmpty ifTrue: [^self].
	self
		bracketWith: '|'
		around:
			[self space.
			aSequenceNode temporaries
				do:
					[:each | 
					self visitNode: each.
					FormatCommentWithStatements ifTrue: [self formatCommentsFor: each].
					self space]].
	self newLines: NewLinesAfterTemporaries!

indentAround: aBlock 
	self indent: 1 around: aBlock!

initialize
	super initialize.
	lookaheadCode := IdentityDictionary new!

isMultilineBlock: aBlockNode 
	^aBlockNode isBlock and: [self willBeMultiline: aBlockNode]!

isMultiLineMessage: aMessageNode 
	| messageStream |
	aMessageNode arguments size >= NumberOfArgumentsForMultiLine 
		ifTrue: [^true].
	(aMessageNode arguments anySatisfy: 
			[:each | 
			self indent: IndentsForKeywords + 1 around: [self willBeMultiline: each]]) 
		ifTrue: [^true].
	aMessageNode isUnary ifTrue: [^self isLineTooLong: aMessageNode selector].
	messageStream := WriteStream on: (Utf8String new: 100).
	self 
		with: aMessageNode selectorParts
		and: aMessageNode arguments
		do: 
			[:sel :arg | 
			messageStream
				nextPutAll: sel value;
				space;
				nextPutAll: (self formattedSourceFor: arg)]
		separatedBy: [messageStream space].
	^self isLineTooLong: messageStream contents!

needsParenthesisFor: aNode 
	| parent |
	parent := aNode parent.
	(parent isNil or: [parent isMessage not]) ifTrue: [^false].
	(aNode isMessage and: [parent isMessage and: [parent receiver == aNode]]) 
		ifTrue: 
			[| grandparent |
			grandparent := parent parent.
			(grandparent notNil and: [grandparent isCascade]) ifTrue: [^true]].
	aNode precedence < parent precedence ifTrue: [^false].
	(parent receiver ~~ aNode and: [aNode precedence >= parent precedence]) ifTrue: [^true].
	(parent receiver == aNode 
		and: [aNode precedence > parent precedence or: [aNode isKeyword]]) ifTrue: [^true].
	aNode isBinary ifFalse: [^false].
	^UseTraditionalBinaryPrecedenceForParentheses 
		and: [self precedenceOf: parent selector greaterThan: aNode selector]!

newLine
	self newLines: 1!

newLines: anInteger 
	anInteger + IndentString size = 0 ifTrue: [codeStream space].
	anInteger timesRepeat: [codeStream cr].
	lineStart := codeStream position.
	indent timesRepeat: [codeStream nextPutAll: IndentString]!

newLinesBeforeStartingAt: anIndex 
	| count cr lf index char |
	(anIndex isNil or: [anIndex > originalSource size]) ifTrue: [^0].
	cr := Character value: 13.
	lf := Character value: 10.
	count := 0.
	index := anIndex - 1.
	[index > 0 and: [(char := originalSource at: index) isSeparator]] 
		whileTrue: 
			[char == lf 
				ifTrue: 
					[count := count + 1.
					(originalSource at: (index - 1 max: 1)) == cr ifTrue: [index := index - 1]].
			char == cr ifTrue: [count := count + 1].
			index := index - 1].
	^count!

precedenceOf: parentSelector greaterThan: childSelector 
	"Put parenthesis around things that are perceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"

	| childIndex parentIndex |
	childIndex := 0.
	parentIndex := 0.
	1 to: TraditionalBinaryPrecedence size
		do: 
			[:i | 
			((TraditionalBinaryPrecedence at: i) includes: parentSelector first) 
				ifTrue: [parentIndex := i].
			((TraditionalBinaryPrecedence at: i) includes: childSelector first) 
				ifTrue: [childIndex := i]].
	^childIndex < parentIndex!

visitAssignmentNode: anAssignmentNode
	self visitNode: anAssignmentNode variable.
	codeStream nextPutAll: ' := '.
	self visitNode: anAssignmentNode value!

visitBlockNode: aBlockNode
	self bracketWith: '[]' around: [self formatBlock: aBlockNode]!

visitCascadeNode: aCascadeNode
	self visitNode: aCascadeNode receiver.
	self indentAround: 
			[NewLineBeforeFirstCascade ifTrue: [self newLine] ifFalse: [self space].
			aCascadeNode messages do: 
					[:each |
					self indentAround: 
							[self
								formatSelectorAndArguments: each
								firstSeparator: []
								restSeparator: ((self isMultiLineMessage: each) ifTrue: [[self newLine]] ifFalse: [[self space]])]]
				separatedBy: 
					[codeStream nextPut: $;.
					NewLineAfterCascade ifTrue: [self newLine] ifFalse: [self space]]]!

visitLiteralArrayNode: aRBArrayLiteralNode
	| brackets |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray ifTrue: ['[]'] ifFalse: ['()'].
	self bracketWith: brackets
		around: [aRBArrayLiteralNode contents do: [:each | self visitNode: each] separatedBy: [self space]]!

visitLiteralNode: aLiteralNode
	self writeString: (aLiteralNode token formattedFrom: originalSource)!

visitMessageNode: aMessageNode
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode!

visitNode: aNode
	| needsParenthesis |
	(lookaheadCode includesKey: aNode)
		ifTrue: [^self writeString: (lookaheadCode at: aNode)].
	needsParenthesis := self needsParenthesisFor: aNode.
	self
		bracketWith:
			(needsParenthesis
				ifTrue: ['()']
				ifFalse: [''])
		around:
			[needsParenthesis ifTrue: [codeStream nextPutAll: StringInsideParentheses].
			super visitNode: aNode.
			(FormatCommentWithStatements or: [aNode isMethod or: [aNode isSequence]])
				ifFalse: [self formatCommentsFor: aNode].
			needsParenthesis
				ifTrue: [codeStream nextPutAll: StringInsideParentheses]]!

visitOptimizedNode: anOptimizedNode
	codeStream nextPutAll: '##'.
	self bracketWith: '()' around: [self indentAround: [self visitNode: anOptimizedNode body]]!

visitPatternBlockNode: aRBPatternBlockNode
	codeStream nextPut: $`.
	self bracketWith: '{}' around: [self formatBlock: aRBPatternBlockNode]!

visitReturnNode: aReturnNode
	codeStream
		nextPut: $^;
		nextPutAll: StringFollowingReturn.
	self visitNode: aReturnNode value!

visitSequenceNode: aSequenceNode
	self formatTemporariesFor: aSequenceNode.
	#rbFix.	"Dolphin's primitive tags follow the temp definitions"
	self tagBeforeTemporaries
		ifFalse: 
			[aSequenceNode parent ifNotNil: [:parent | parent isMethod ifTrue: [self formatTagFor: parent]]].
	self formatSequenceCommentsFor: aSequenceNode.
	self formatSequenceNodeStatementsFor: aSequenceNode!

willBeMultiline: aNode 
	^(self formattedSourceFor: aNode) includes: Character cr!

with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock 
	firstCollection isEmpty ifTrue: [^self].
	aBlock
		value: firstCollection first
		value: secondCollection first.
	2
		to: firstCollection size
		do: 
			[:i | 
			separatorBlock value.
			aBlock
				value: (firstCollection at: i)
				value: (secondCollection at: i)]!

writeString: aString 
	| index |
	index := aString lastIndexOf: Character cr ifAbsent: [0].
	codeStream nextPutAll: aString.
	index > 0 
		ifTrue: [lineStart := codeStream position - (aString size - index)]! !
!RBConfigurableFormatter categoriesFor: #addNewLinesBeforeStatementStartingAt:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #format:!operations!public! !
!RBConfigurableFormatter categoriesFor: #formatArray:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatBinaryMessage:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatBlock:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatBlockArgumentsFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatCommentsFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatMethodBodyFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatMethodCommentFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatMethodPatternFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatSelectorAndArguments:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatSelectorAndArguments:firstSeparator:restSeparator:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatSequenceCommentsFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatSequenceNodeStatementsFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatStatementCommentsFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formattedSourceFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatTemporariesFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #indentAround:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #initialize!initializing!private! !
!RBConfigurableFormatter categoriesFor: #isMultilineBlock:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #isMultiLineMessage:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #needsParenthesisFor:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #newLine!formatting!private! !
!RBConfigurableFormatter categoriesFor: #newLines:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #newLinesBeforeStartingAt:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #precedenceOf:greaterThan:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #visitAssignmentNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitBlockNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitCascadeNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitLiteralArrayNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitLiteralNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitMessageNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitNode:!formatting!private!visiting! !
!RBConfigurableFormatter categoriesFor: #visitOptimizedNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitPatternBlockNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitReturnNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #visitSequenceNode:!public!visitor/double dispatching! !
!RBConfigurableFormatter categoriesFor: #willBeMultiline:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #with:and:do:separatedBy:!formatting!private!utility! !
!RBConfigurableFormatter categoriesFor: #writeString:!formatting!private! !

!RBConfigurableFormatter class methodsFor!

format: aParseTree 
	^self format: aParseTree withIndents: 0!

format: aParseTree withIndents: anInteger 
	^(self new)
		indent: anInteger;
		format: aParseTree!

formatCommentWithStatements
	^FormatCommentWithStatements!

formatCommentWithStatements: aBoolean 
	FormatCommentWithStatements := aBoolean!

indentsForKeywords
	^IndentsForKeywords!

indentsForKeywords: anInteger
	IndentsForKeywords := anInteger!

indentString
	^IndentString!

indentString: aString
	IndentString := aString!

initialize
	"
		self initialize
	"

	FormatCommentWithStatements := true.
	IndentsForKeywords := 1.
	IndentString := String with: Character tab.
	LineUpBlockBrackets := false.
	MethodSignatureOnMultipleLines := false.
	MinimumNewLinesBetweenStatements := 1.
	NewLineAfterCascade := true.
	NewLineBeforeFirstCascade := true.
	NewLineBeforeFirstKeyword := true.	

	"One blank line after method comment"
	NewLinesAfterMethodComment := 2.
	NewLinesAfterMethodPattern := 1.
	NewLinesAfterTemporaries := 1.
	NumberOfArgumentsForMultiLine := 3.
	PeriodsAtEndOfBlock := PeriodsAtEndOfMethod := false.
	RetainBlankLinesBetweenStatements := false.
	StringFollowingReturn := ''.
	StringInsideBlocks := ''.
	StringInsideParentheses := ''.
	TraditionalBinaryPrecedence := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	UseTraditionalBinaryPrecedenceForParentheses := true!

lineUpBlockBrackets
	^LineUpBlockBrackets!

lineUpBlockBrackets: aBoolean
	LineUpBlockBrackets := aBoolean!

methodSignatureOnMultipleLines
	^MethodSignatureOnMultipleLines!

methodSignatureOnMultipleLines: aBoolean
	MethodSignatureOnMultipleLines := aBoolean!

minimumNewLinesBetweenStatements
	^MinimumNewLinesBetweenStatements!

minimumNewLinesBetweenStatements: anInteger 
	MinimumNewLinesBetweenStatements := anInteger!

newLineAfterCascade
	^NewLineAfterCascade!

newLineAfterCascade: aBoolean
	NewLineAfterCascade := aBoolean!

newLineBeforeFirstCascade
	^NewLineBeforeFirstCascade!

newLineBeforeFirstCascade: aBoolean
	NewLineBeforeFirstCascade := aBoolean!

newLineBeforeFirstKeyword
	^NewLineBeforeFirstKeyword!

newLineBeforeFirstKeyword: aBoolean
	NewLineBeforeFirstKeyword := aBoolean!

newLinesAfterMethodComment
	 ^NewLinesAfterMethodComment!

newLinesAfterMethodComment: anInteger
	 NewLinesAfterMethodComment := anInteger.!

newLinesAfterMethodPattern
	^NewLinesAfterMethodPattern!

newLinesAfterMethodPattern: anInteger
	NewLinesAfterMethodPattern := anInteger!

newLinesAfterTemporaries
	^NewLinesAfterTemporaries!

newLinesAfterTemporaries: anInteger
	NewLinesAfterTemporaries := anInteger!

numberOfArgumentsForMultiLine
	^NumberOfArgumentsForMultiLine!

numberOfArgumentsForMultiLine: anInteger
	NumberOfArgumentsForMultiLine := anInteger!

periodsAsTerminators
	^PeriodsAtEndOfBlock and: [PeriodsAtEndOfMethod]!

periodsAsTerminators: aBoolean 
	PeriodsAtEndOfBlock := aBoolean.
	PeriodsAtEndOfMethod := aBoolean!

periodsAtEndOfBlock
	^PeriodsAtEndOfBlock!

periodsAtEndOfBlock: aBoolean 
	PeriodsAtEndOfBlock := aBoolean!

retainBlankLinesBetweenStatements
	^RetainBlankLinesBetweenStatements!

retainBlankLinesBetweenStatements: aBoolean
	RetainBlankLinesBetweenStatements := aBoolean!

stringFollowingReturn
	^StringFollowingReturn!

stringFollowingReturn: aString
	StringFollowingReturn := aString!

stringInsideBlocks
	^StringInsideBlocks!

stringInsideBlocks: aString 
	StringInsideBlocks := aString!

stringInsideParentheses
	^StringInsideParentheses!

stringInsideParentheses: aString 
	StringInsideParentheses := aString!

traditionalBinaryPrecedence
	^TraditionalBinaryPrecedence!

traditionalBinaryPrecedence: anArray
	TraditionalBinaryPrecedence := anArray!

useTraditionalBinaryPrecedenceForParentheses
	^UseTraditionalBinaryPrecedenceForParentheses!

useTraditionalBinaryPrecedenceForParentheses: aBoolean 
	UseTraditionalBinaryPrecedenceForParentheses := aBoolean! !
!RBConfigurableFormatter class categoriesFor: #format:!public!public interface! !
!RBConfigurableFormatter class categoriesFor: #format:withIndents:!public!public interface! !
!RBConfigurableFormatter class categoriesFor: #formatCommentWithStatements!public!settings! !
!RBConfigurableFormatter class categoriesFor: #formatCommentWithStatements:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentsForKeywords!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentsForKeywords:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentString!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentString:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #initialize!initializing!public! !
!RBConfigurableFormatter class categoriesFor: #lineUpBlockBrackets!public!settings! !
!RBConfigurableFormatter class categoriesFor: #lineUpBlockBrackets:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #methodSignatureOnMultipleLines!public!settings! !
!RBConfigurableFormatter class categoriesFor: #methodSignatureOnMultipleLines:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #minimumNewLinesBetweenStatements!public!settings! !
!RBConfigurableFormatter class categoriesFor: #minimumNewLinesBetweenStatements:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineAfterCascade!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineAfterCascade:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstCascade!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstCascade:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstKeyword!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstKeyword:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodComment!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodComment:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodPattern!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodPattern:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterTemporaries!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterTemporaries:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #numberOfArgumentsForMultiLine!public!settings! !
!RBConfigurableFormatter class categoriesFor: #numberOfArgumentsForMultiLine:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAsTerminators!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAsTerminators:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfBlock!public! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfBlock:!public! !
!RBConfigurableFormatter class categoriesFor: #retainBlankLinesBetweenStatements!public!settings! !
!RBConfigurableFormatter class categoriesFor: #retainBlankLinesBetweenStatements:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringFollowingReturn!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringFollowingReturn:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringInsideBlocks!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringInsideBlocks:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringInsideParentheses!public!settings! !
!RBConfigurableFormatter class categoriesFor: #stringInsideParentheses:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #traditionalBinaryPrecedence!public!settings! !
!RBConfigurableFormatter class categoriesFor: #traditionalBinaryPrecedence:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #useTraditionalBinaryPrecedenceForParentheses!public!settings! !
!RBConfigurableFormatter class categoriesFor: #useTraditionalBinaryPrecedenceForParentheses:!public!settings! !

