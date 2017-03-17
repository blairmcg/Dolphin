"Filed out from Dolphin Smalltalk 7"!

StSemanticAnalyzer subclass: #StEncoder
	instanceVariableNames: 'instructions sendToSuper literalFrame'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StEncoder guid: (GUID fromString: '{0CDFA669-9A57-4DFD-A6C5-A889E3C9307F}')!
StEncoder comment: ''!
!StEncoder categoriesForClass!Refactory-ParseTree Matching! !
!StEncoder methodsFor!

popStackTop
	^instructions addLast: IrPop new!

processBlock: aStBlockNode
	| blockCopy nop |
	blockCopy := instructions addLast: IrBlockCopy new.
	super processBlock: aStBlockNode.
	nop := instructions addLast: IrNop new.
	blockCopy jumpTarget: nop!

pushActiveFrame
	^instructions addLast: IrLoadFrame new!

pushInstVar: aString
	^instructions addLast: (IrLoadField named: aString)!

pushSelf
	self currentScope needsSelf: true.
	^instructions addLast: IrLoadSelf new!

pushStatic: aVariableNode variable: aVariableBinding
	^instructions addLast: (IrLoadStatic named: aVariableNode name)!

pushSuper
	sendToSuper := true.
	^self pushSelf!

pushTemp: aVariableNode
	^instructions addLast: (IrLoadTemp named: aVariableNode name)!

storeInstVar: aVariableNode
	^instructions addLast: (IrStoreField named: aVariableNode name)!

storeStatic: aVariableNode variable: aVariableBinding
	^instructions addLast: (IrStoreStatic named: aVariableNode name)!

storeTemp: aVariableNode
	^instructions addLast: (IrStoreTemp named: aVariableNode name)!

visitStatements: aNodeCollection
	aNodeCollection do: [:each | self visitNode: each] separatedBy: [self popStackTop]! !
!StEncoder categoriesFor: #popStackTop!instructions-stack ops!private! !
!StEncoder categoriesFor: #processBlock:!private!visitor/double dispatching! !
!StEncoder categoriesFor: #pushActiveFrame!instructions-stack ops!private! !
!StEncoder categoriesFor: #pushInstVar:!instructions-stack ops!private! !
!StEncoder categoriesFor: #pushSelf!instructions-stack ops!private! !
!StEncoder categoriesFor: #pushStatic:variable:!instructions-stack ops!private! !
!StEncoder categoriesFor: #pushSuper!instructions-stack ops!private! !
!StEncoder categoriesFor: #pushTemp:!instructions-stack ops!private! !
!StEncoder categoriesFor: #storeInstVar:!instructions-stack ops!private! !
!StEncoder categoriesFor: #storeStatic:variable:!instructions-stack ops!private! !
!StEncoder categoriesFor: #storeTemp:!instructions-stack ops!private! !
!StEncoder categoriesFor: #visitStatements:!private!visiting! !

