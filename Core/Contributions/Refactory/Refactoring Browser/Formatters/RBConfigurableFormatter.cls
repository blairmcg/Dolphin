"Filed out from Dolphin Smalltalk 7"!

RBSourceFormatter subclass: #RBConfigurableFormatter
	instanceVariableNames: 'lookaheadCode originalSource isInCascadeNode'
	classVariableNames: 'CascadedMessageInsideParentheses FormatCommentWithStatements IndentsForKeywords IndentString KeepBlockInMessage LineUpBlockBrackets MethodSignatureOnMultipleLines MinimumNewLinesBetweenStatements MultiLineMessages NewLineAfterCascade NewLineBeforeFirstCascade NewLineBeforeFirstKeyword NewLineBeforeWhenMultilineMessages NewLinesAfterMethodComment NewLinesAfterMethodPattern NewLinesAfterTemporaries NumberOfArgumentsForMultiLine OneLineMessages PeriodsAtEndOfBlock RetainBlankLinesBeforeComments RetainBlankLinesBetweenStatements StringFollowingReturn StringInsideBlocks StringInsideParentheses TraditionalBinaryPrecedence UseBasicCommentFormat UseTraditionalBinaryPrecedenceForParentheses'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
RBConfigurableFormatter guid: (GUID fromString: '{70FFAAFA-37C2-4408-BFA3-E5417F61CD58}')!
RBConfigurableFormatter comment: 'RBConfigurableFormatter formats the Refactoring Browser''s parse trees. It has many more formatting options than the default formatter used by the RB. To change the RB to use this formatter, execute "RBProgramNode formatterClass: RBConfigurableFormatter". For some refactorings the RB must reformat the code after the change, so it is good to have a formatter configured to your tastes.

Instance Variables:
	lookaheadCode	<Dictionary key: RBProgramNode value: String>	sometimes we need to lookahead while formatting, this dictionary contains the nodes that have already been formatted by lookahead
	originalSource	<String>	the original source before we started formatting. This is used to extract the comments from the original source.

'!
!RBConfigurableFormatter categoriesForClass!System-Compiler-Formatters! !
!RBConfigurableFormatter methodsFor!

addNewLinesBeforeStatementStartingAt: anInteger
	| newLines |
	newLines := MinimumNewLinesBetweenStatements
		max: (RetainBlankLinesBetweenStatements ifTrue: [self newLinesBeforeStartingAt: anInteger] ifFalse: [0]).
	newLines = 0 ifTrue: [self space] ifFalse: [self newLines: newLines]!

basicFormatCommentFor: aComment
	codeStream nextPutAll: (originalSource copyFrom: aComment start to: aComment stop)!

bracketWith: bracketString around: aBlock
	bracketString isEmpty ifTrue: [^aBlock value].
	codeStream nextPut: bracketString first.
	^aBlock
		ensure: [codeStream nextPut: bracketString last]!

characterSeparatorMethodSignatureFor: aMethodNode
	^[(self needsMethodSignatureOnMultipleLinesFor: aMethodNode)
		ifTrue: [self newLine]
		ifFalse: [self space]]!

currentLineLength
	^codeStream position - lineStart!

format: aParseTree
	originalSource := aParseTree source.
	^super format: aParseTree!

formatArray: anArrayNode
	self formatSequenceCommentsFor: anArrayNode.
	self formatSequenceNodeStatementsFor: anArrayNode!

formatBlock: aBlockNode
	(LineUpBlockBrackets and: [self willBeMultiline: aBlockNode body])
		ifTrue: [self newLine]
		ifFalse: [codeStream nextPutAll: StringInsideBlocks].
	self formatBlockArgumentsFor: aBlockNode.
	(self willBeMultiline: aBlockNode body) ifTrue: [self newLine].
	self visitNode: aBlockNode body.
	(LineUpBlockBrackets and: [self willBeMultiline: aBlockNode body])
		ifTrue: [self newLine]
		ifFalse: [codeStream nextPutAll: StringInsideBlocks]!

formatBlockArgumentsFor: aBlockNode
	aBlockNode arguments isEmpty ifTrue: [^self].
	aBlockNode arguments
		do: [:each | 
			codeStream nextPut: $:.
			self visitNode: each.
			FormatCommentWithStatements ifTrue: [self formatCommentsFor: each].
			self space].
	codeStream nextPutAll: '| '!

formatCommentsFor: aNode
	originalSource isNil ifTrue: [^self].
	aNode comments do: 
			[:each |
			self basicFormatCommentFor: each.
			self newLine]!

formatMethodBodyFor: aMethodNode
	self
		indentAround: [
			self newLines: NewLinesAfterMethodPattern.
			self formatMethodCommentFor: aMethodNode.
			self formatPragmasFor: aMethodNode.
			self visitNode: aMethodNode body]!

formatMethodCommentFor: aMethodNode
	originalSource isNil ifTrue: [^self].
	(FormatCommentWithStatements ifTrue: [aMethodNode methodComments] ifFalse: [aMethodNode comments])
		do: [:each | 
			self basicFormatCommentFor: each.
			self newLines: NewLinesAfterMethodComment]!

formatMethodPatternFor: aMethodNode
	aMethodNode arguments isEmpty
		ifTrue: [codeStream nextPutAll: aMethodNode selector]
		ifFalse: [self
				with: aMethodNode selectorParts
				and: aMethodNode arguments
				do: [:key :arg | 
					codeStream nextPutAll: key value.
					self space.
					self visitNode: arg]
				separatedBy: [MethodSignatureOnMultipleLines ifTrue: [self newLine] ifFalse: [self space]]]!

formatSelectorAndArguments: aMessageNode
	| newLineBetweenArguments |
	newLineBetweenArguments := self isMultiLineMessage: aMessageNode.
	self
		indent: (newLineBetweenArguments ifTrue: [IndentsForKeywords] ifFalse: [0])
		around: [self
				formatSelectorAndArguments: aMessageNode
				firstSeparator:
					((newLineBetweenArguments or: [NewLineBeforeFirstKeyword])
						ifTrue: [[self newLine]]
						ifFalse: [[self space]])
				restSeparator: (newLineBetweenArguments ifTrue: [[self newLine]] ifFalse: [[self space]])]!

formatSelectorAndArguments: aMessageNode firstSeparator: firstBlock restSeparator: restBlock
	| separatorBlock |
	separatorBlock := firstBlock.
	aMessageNode isUnary
		ifTrue: [
			self handleLineForSelector: aMessageNode selector withSeparatorBlock: separatorBlock.
			codeStream nextPutAll: aMessageNode selector]
		ifFalse: [
			aMessageNode selectorParts
				with: aMessageNode arguments
				do: [:selector :argument | 
					self handleLineForSelector: selector value withSeparatorBlock: separatorBlock.
					separatorBlock := restBlock.
					self
						indentAround: [
							codeStream nextPutAll: selector value.
							self handleLineForArgument: argument]]]!

formatSequenceCommentsFor: aSequenceNode
	originalSource isNil ifTrue: [^self].
	aSequenceNode comments do: 
			[:each |
			codeStream nextPutAll: (originalSource copyFrom: each start to: each stop).
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
							parent isBlock ifTrue: [self class periodsAtEndOfBlock] ifFalse: [self class periodsAtEndOfMethod]]])
				ifTrue: [codeStream nextPut: $.].
			self formatStatementCommentsFor: (statements at: i).
			i < statements size
				ifTrue: [self addNewLinesBeforeStatementStartingAt: (statements at: i + 1) start]]!

formatStatementCommentsFor: aStatementNode
	originalSource isNil ifTrue: [^self].
	FormatCommentWithStatements ifFalse: [^self].
	aStatementNode statementComments do: 
			[:each |
			| count |
			count := self newLinesBeforeStartingAt: each start.
			RetainBlankLinesBeforeComments & (count > 0)
				ifTrue: [self newLines: count]
				ifFalse: [codeStream tab].
			codeStream nextPutAll: (originalSource copyFrom: each start to: each stop)]!

formatTagFor: aMethodNode
	aMethodNode tag ifNotNil: [:tag | self visitNode: tag]!

formattedSourceFor: aNode
	^lookaheadCode at: aNode ifAbsentPut: [self class format: aNode withIndents: indent]!

formatTemporariesFor: aSequenceNode
	aSequenceNode temporaries isEmpty ifTrue: [^self].
	self bracketWith: '|'
		around: 
			[self space.
			aSequenceNode temporaries do: 
					[:each |
					self visitNode: each.
					FormatCommentWithStatements ifTrue: [self formatCommentsFor: each].
					self space]].
	self newLines: NewLinesAfterTemporaries!

handleLineForArgument: anArgument
	(KeepBlockInMessage and: [anArgument isBlock])
		ifTrue: [
			(self willBeMultiline: anArgument)
				ifTrue: [
					(self formattedSourceFor: anArgument) lines first size > MaxLineLength
						ifTrue: [self newLine]
						ifFalse: [self space]]
				ifFalse: [
					(self formattedSourceFor: anArgument) size > MaxLineLength
						ifTrue: [self newLine]
						ifFalse: [self space]]]
		ifFalse: [
			((self willBeMultiline: anArgument) or: [(self formattedSourceFor: anArgument) size > MaxLineLength])
				ifTrue: [
					isInCascadeNode
						ifTrue: [
							codeStream nextPut: Character cr.
							indent - 1 timesRepeat: [codeStream nextPutAll: IndentString]]
						ifFalse: [self newLine]]
				ifFalse: [self space]].
	self visitNode: anArgument!

handleLineForSelector: selector withSeparatorBlock: aBlock
	^(self isLineTooLong: selector) ifTrue: [self newLine] ifFalse: [aBlock value]!

indentAround: aBlock
	self indent: 1 around: aBlock!

initialize
	super initialize.
	lookaheadCode := IdentityDictionary new.
	isInCascadeNode := false!

isLineTooLong: aString
	^self currentLineLength + (aString indexOf: Character cr ifAbsent: [aString size]) >= MaxLineLength!

isMultilineBlock: aBlockNode
	^aBlockNode isBlock and: [self willBeMultiline: aBlockNode]!

isMultiLineMessage: aMessageNode
	| messageStream |
	(MultiLineMessages includes: aMessageNode selector) ifTrue: [^true].
	(OneLineMessages includes: aMessageNode selector) ifTrue: [^false].
	NumberOfArgumentsForMultiLine <= aMessageNode arguments size ifTrue: [^true].
	(aMessageNode arguments
		anySatisfy: [:each | self indent: IndentsForKeywords + 1 around: [self willBeMultiline: each]])
			ifTrue: [^true].
	aMessageNode isUnary ifTrue: [^self isLineTooLong: aMessageNode selector].
	messageStream := WriteStream on: (String new: 100).
	self
		with: aMessageNode selectorParts
		and: aMessageNode arguments
		do: 
			[:selector :arg |
			messageStream
				nextPutAll: selector value;
				space;
				nextPutAll: (self formattedSourceFor: arg)]
		separatedBy: [messageStream space].
	^self isLineTooLong: messageStream contents!

needsMethodSignatureOnMultipleLinesFor: aMethodNode 
	^Error notYetImplemented!

needsParenthesisFor: aNode
	| parent grandparent |
	aNode ifNil: [^false].
	aNode isValue ifFalse: [^false].
	parent := aNode parent ifNil: [^false].
	(CascadedMessageInsideParentheses
		and: [aNode isMessage and: [parent isMessage and: [parent receiver == aNode]]])
			ifTrue: 
				[grandparent := parent parent.
				(grandparent notNil and: [grandparent isCascade]) ifTrue: [^true]].
	aNode precedence < parent precedence ifTrue: [^false].
	(aNode isAssignment and: [parent isAssignment]) ifTrue: [^false].
	(aNode isAssignment and: [aNode isCascade]) ifTrue: [^true].
	aNode precedence = 0 ifTrue: [^false].
	aNode isMessage ifFalse: [^true].
	aNode precedence = parent precedence ifFalse: [^true].
	aNode isUnary ifTrue: [^false].
	aNode isKeyword ifTrue: [^true].
	parent receiver == aNode ifFalse: [^true].
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
	originalSource ifNil: [^0].
	(anIndex isNil or: [anIndex > originalSource size]) ifTrue: [^0].
	cr := Character value: 13.
	lf := Character value: 10.
	count := 0.
	index := anIndex - 1.
	[index > 0 and: [(char := originalSource at: index) isSeparator]] whileTrue: 
			[char == lf
				ifTrue: 
					[count := count + 1.
					(originalSource at: (index - 1 max: 1)) == cr ifTrue: [index := index - 1]].
			char == cr ifTrue: [count := count + 1].
			index := index - 1].
	^count!

precedenceOf: parentSelector greaterThan: childSelector
	"Put parenthesis around things that are preceived to have 'lower' precedence. For example, 'a + b * c' 
	-> '(a + b) * c' but 'a * b + c' -> 'a * b + c'"

	| childIndex parentIndex |
	childIndex := 0.
	parentIndex := 0.
	1 to: TraditionalBinaryPrecedence size
		do: 
			[:i |
			((TraditionalBinaryPrecedence at: i) includes: parentSelector first) ifTrue: [parentIndex := i].
			((TraditionalBinaryPrecedence at: i) includes: childSelector first) ifTrue: [childIndex := i]].
	^childIndex < parentIndex!

visitArrayNode: anArrayNode
	self bracketWith: '{}' around: [self formatArray: anArrayNode]!

visitAssignmentNode: anAssignmentNode
	self visitNode: anAssignmentNode variable.
	codeStream
		space;
		nextPutAll: anAssignmentNode assignmentOperator;
		space.
	self visitNode: anAssignmentNode value!

visitBlockNode: aBlockNode
	self bracketWith: '[]' around: [self formatBlock: aBlockNode]!

visitCascadeNode: aCascadeNode
	isInCascadeNode := true.
	self visitNode: aCascadeNode receiver.
	self indentAround: [
			NewLineBeforeFirstCascade ifTrue: [self newLine] ifFalse: [self space].
			aCascadeNode messages
				do: [:each | 
					self indentAround: [
							self
								formatSelectorAndArguments: each
								firstSeparator: []
								restSeparator: ((self isMultiLineMessage: each) ifTrue: [[self newLine]] ifFalse: [[self space]])]]
				separatedBy: [
					codeStream nextPut: $;.
					NewLineAfterCascade ifTrue: [self newLine] ifFalse: [self space]]].
	isInCascadeNode := false!

visitLiteralArrayNode: aRBArrayLiteralNode
	| brackets |
	codeStream nextPut: $#.
	brackets := aRBArrayLiteralNode isForByteArray ifTrue: ['[]'] ifFalse: ['()'].
	self
		bracketWith: brackets
		around: [aRBArrayLiteralNode contents do: [:each | self visitNode: each] separatedBy: [self space]]!

visitLiteralNode: aLiteralNode
	self writeString: (aLiteralNode token formattedFrom: originalSource)!

visitMessageNode: aMessageNode
	self visitNode: aMessageNode receiver.
	self formatSelectorAndArguments: aMessageNode!

visitNode: aNode
	| needsParenthesis |
	(lookaheadCode includesKey: aNode) ifTrue: [^self writeString: (lookaheadCode at: aNode)].
	needsParenthesis := self needsParenthesisFor: aNode.
	self bracketWith: (needsParenthesis ifTrue: ['()'] ifFalse: [''])
		around: 
			[needsParenthesis ifTrue: [codeStream nextPutAll: StringInsideParentheses].
			super visitNode: aNode.
			(FormatCommentWithStatements or: [aNode isMethod or: [aNode isSequence]])
				ifFalse: [self formatCommentsFor: aNode].
			needsParenthesis ifTrue: [codeStream nextPutAll: StringInsideParentheses]]!

visitOptimizedNode: anOptimizedNode
	codeStream nextPutAll: '##'.
	self bracketWith: '()' around: [self indentAround: [self visitNode: anOptimizedNode body]]!

visitPatternBlockNode: aRBPatternBlockNode
	codeStream nextPut: $`.
	self bracketWith: '{}' around: [self formatBlock: aRBPatternBlockNode]!

visitPatternWrapperBlockNode: aRBPatternWrapperBlockNode
	self visitNode: aRBPatternWrapperBlockNode wrappedNode.
	codeStream nextPut: $`.
	self bracketWith: '{}' around: [self formatBlock: aRBPatternWrapperBlockNode]!

visitPragmaNode: aPragmaNode
	codeStream nextPut: $<.
	self
		formatSelectorAndArguments: aPragmaNode
		firstSeparator: [aPragmaNode selector isInfix ifTrue: [self space]]
		restSeparator: [self space].
	codeStream nextPut: $>!

visitReturnNode: aReturnNode
	codeStream
		nextPut: $^;
		nextPutAll: StringFollowingReturn.
	self visitNode: aReturnNode value!

visitSequenceNode: aSequenceNode
	self formatTemporariesFor: aSequenceNode.
	aSequenceNode parent ifNotNil: [:parent | parent isMethod ifTrue: [self formatTagFor: parent]].
	self formatSequenceCommentsFor: aSequenceNode.
	self formatSequenceNodeStatementsFor: aSequenceNode!

willBeMultiline: aNode
	^(self formattedSourceFor: aNode) includes: Character cr!

with: firstCollection and: secondCollection do: aBlock separatedBy: separatorBlock
	firstCollection isEmpty ifTrue: [^self].
	aBlock value: firstCollection first value: secondCollection first.
	2 to: firstCollection size
		do: 
			[:i |
			separatorBlock value.
			aBlock value: (firstCollection at: i) value: (secondCollection at: i)]!

writeString: aString
	| index |
	index := aString lastIndexOf: Character cr ifAbsent: [0].
	codeStream nextPutAll: aString.
	index > 0 ifTrue: [lineStart := codeStream position - (aString size - index)]! !
!RBConfigurableFormatter categoriesFor: #addNewLinesBeforeStatementStartingAt:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #basicFormatCommentFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #bracketWith:around:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #characterSeparatorMethodSignatureFor:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #currentLineLength!helpers!private! !
!RBConfigurableFormatter categoriesFor: #format:!operations!public! !
!RBConfigurableFormatter categoriesFor: #formatArray:!formatting!private! !
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
!RBConfigurableFormatter categoriesFor: #formatTagFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formattedSourceFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #formatTemporariesFor:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #handleLineForArgument:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #handleLineForSelector:withSeparatorBlock:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #indentAround:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #initialize!initializing!private! !
!RBConfigurableFormatter categoriesFor: #isLineTooLong:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #isMultilineBlock:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #isMultiLineMessage:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #needsMethodSignatureOnMultipleLinesFor:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #needsParenthesisFor:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #newLine!formatting!private! !
!RBConfigurableFormatter categoriesFor: #newLines:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #newLinesBeforeStartingAt:!formatting!private! !
!RBConfigurableFormatter categoriesFor: #precedenceOf:greaterThan:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #visitArrayNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitAssignmentNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitBlockNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitCascadeNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitLiteralArrayNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitLiteralNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitMessageNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitNode:!formatting!private!visiting! !
!RBConfigurableFormatter categoriesFor: #visitOptimizedNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitPatternBlockNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitPatternWrapperBlockNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitPragmaNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitReturnNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #visitSequenceNode:!public!visiting! !
!RBConfigurableFormatter categoriesFor: #willBeMultiline:!helpers!private! !
!RBConfigurableFormatter categoriesFor: #with:and:do:separatedBy:!formatting!private!utility! !
!RBConfigurableFormatter categoriesFor: #writeString:!formatting!private! !

!RBConfigurableFormatter class methodsFor!

cascadedMessageInsideParentheses
	^CascadedMessageInsideParentheses!

cascadedMessageInsideParentheses: aBoolean
	CascadedMessageInsideParentheses := aBoolean!

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

	CascadedMessageInsideParentheses := false.
	FormatCommentWithStatements := true.
	IndentString := String with: Character tab.
	IndentsForKeywords := 1.
	KeepBlockInMessage := true.
	LineUpBlockBrackets := false.
	MaxLineLength := 100.
	MethodSignatureOnMultipleLines := false.
	MinimumNewLinesBetweenStatements := 1.
	MultiLineMessages := #(#on:do: #ensure: #ifCurtailed:).
	NewLineAfterCascade := true.
	NewLineBeforeFirstCascade := true.
	NewLineBeforeFirstKeyword := false.
	NewLinesAfterMethodComment := 2.
	NewLinesAfterMethodPattern := 1.
	NewLinesAfterTemporaries := 1.
	NumberOfArgumentsForMultiLine := 4.
	OneLineMessages := #(#to: #to:do: #to:by: #to:by:do:).
	PeriodsAtEndOfBlock := false.
	PeriodsAtEndOfMethod := false.
	RetainBlankLinesBetweenStatements := false.
	RetainBlankLinesBeforeComments := true.
	StringFollowingReturn := ''.
	StringInsideBlocks := ''.
	StringInsideParentheses := ''.
	TraditionalBinaryPrecedence := #(#($| $& $?) #($= $~ $< $>) #($- $+) #($* $/ $% $\) #($@)).
	UseBasicCommentFormat := true.
	UseTraditionalBinaryPrecedenceForParentheses := true!

keepBlockInMessage
	^KeepBlockInMessage!

keepBlockInMessage: aBoolean
	KeepBlockInMessage := aBoolean!

lineUpBlockBrackets
	^LineUpBlockBrackets!

lineUpBlockBrackets: aBoolean
	LineUpBlockBrackets := aBoolean!

maxLineLength
	^MaxLineLength!

maxLineLength: anInteger
	MaxLineLength := anInteger!

methodSignatureOnMultipleLines
	^MethodSignatureOnMultipleLines!

methodSignatureOnMultipleLines: aBoolean
	MethodSignatureOnMultipleLines := aBoolean!

minimumNewLinesBetweenStatements
	^MinimumNewLinesBetweenStatements!

minimumNewLinesBetweenStatements: anInteger
	MinimumNewLinesBetweenStatements := anInteger!

multiLineMessages
	^MultiLineMessages!

multiLineMessages: anArray
	MultiLineMessages := anArray!

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

newLineBeforeWhenMultilineMessages
	^NewLineBeforeWhenMultilineMessages!

newLineBeforeWhenMultilineMessages: anObject
	NewLineBeforeWhenMultilineMessages := anObject!

newLinesAfterMethodComment
	^NewLinesAfterMethodComment!

newLinesAfterMethodComment: anInteger
	NewLinesAfterMethodComment := anInteger!

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

oneLineMessages
	^OneLineMessages!

oneLineMessages: anArray
	OneLineMessages := anArray!

periodsAsTerminators
	^PeriodsAtEndOfBlock and: [PeriodsAtEndOfMethod]!

periodsAsTerminators: aBoolean
	PeriodsAtEndOfBlock := aBoolean.
	PeriodsAtEndOfMethod := aBoolean!

periodsAtEndOfBlock
	^PeriodsAtEndOfBlock!

periodsAtEndOfBlock: aBoolean
	PeriodsAtEndOfBlock := aBoolean!

periodsAtEndOfMethod
	^PeriodsAtEndOfMethod!

periodsAtEndOfMethod: aBoolean
	PeriodsAtEndOfMethod := aBoolean!

retainBlankLinesBeforeComments
	^RetainBlankLinesBeforeComments!

retainBlankLinesBeforeComments: aBoolean
	RetainBlankLinesBeforeComments := aBoolean!

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
!RBConfigurableFormatter class categoriesFor: #cascadedMessageInsideParentheses!public!settings! !
!RBConfigurableFormatter class categoriesFor: #cascadedMessageInsideParentheses:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #format:!public!public interface! !
!RBConfigurableFormatter class categoriesFor: #format:withIndents:!public!public interface! !
!RBConfigurableFormatter class categoriesFor: #formatCommentWithStatements!public!settings! !
!RBConfigurableFormatter class categoriesFor: #formatCommentWithStatements:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentsForKeywords!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentsForKeywords:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentString!public!settings! !
!RBConfigurableFormatter class categoriesFor: #indentString:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #initialize!initializing!public! !
!RBConfigurableFormatter class categoriesFor: #keepBlockInMessage!public!settings! !
!RBConfigurableFormatter class categoriesFor: #keepBlockInMessage:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #lineUpBlockBrackets!public!settings! !
!RBConfigurableFormatter class categoriesFor: #lineUpBlockBrackets:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #maxLineLength!public!settings! !
!RBConfigurableFormatter class categoriesFor: #maxLineLength:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #methodSignatureOnMultipleLines!public!settings! !
!RBConfigurableFormatter class categoriesFor: #methodSignatureOnMultipleLines:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #minimumNewLinesBetweenStatements!public!settings! !
!RBConfigurableFormatter class categoriesFor: #minimumNewLinesBetweenStatements:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #multiLineMessages!public!settings! !
!RBConfigurableFormatter class categoriesFor: #multiLineMessages:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineAfterCascade!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineAfterCascade:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstCascade!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstCascade:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstKeyword!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeFirstKeyword:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeWhenMultilineMessages!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLineBeforeWhenMultilineMessages:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodComment!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodComment:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodPattern!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterMethodPattern:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterTemporaries!public!settings! !
!RBConfigurableFormatter class categoriesFor: #newLinesAfterTemporaries:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #numberOfArgumentsForMultiLine!public!settings! !
!RBConfigurableFormatter class categoriesFor: #numberOfArgumentsForMultiLine:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #oneLineMessages!public!settings! !
!RBConfigurableFormatter class categoriesFor: #oneLineMessages:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAsTerminators!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAsTerminators:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfBlock!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfBlock:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfMethod!public!settings! !
!RBConfigurableFormatter class categoriesFor: #periodsAtEndOfMethod:!public!settings! !
!RBConfigurableFormatter class categoriesFor: #retainBlankLinesBeforeComments!public!settings! !
!RBConfigurableFormatter class categoriesFor: #retainBlankLinesBeforeComments:!public!settings! !
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

