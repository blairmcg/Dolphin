"Filed out from Dolphin Smalltalk 7"!

BindingReferenceTest subclass: #AbsoluteBindingReferenceTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbsoluteBindingReferenceTest guid: (GUID fromString: '{44a97a25-3e9f-43f4-b1aa-4cadf406ed5d}')!
AbsoluteBindingReferenceTest comment: ''!
!AbsoluteBindingReferenceTest categoriesForClass!Unclassified! !
!AbsoluteBindingReferenceTest methodsFor!

subjectClass
	^AbsoluteBindingReference!

testAsQualifiedReference
	| object |
	object := self subjectClass path: #(#Object).
	self assert: 'Object' asQualifiedReference equals: object.
	"Although these two binding refs would resolve to the same binding, they are not equivalent as one has a more specific path."
	self deny: 'Smalltalk.Object' asQualifiedReference equals: object.
	self assert: object asQualifiedReference identicalTo: object.
	self assert: 'Object._EventsRegister' asQualifiedReference
		equals: (self subjectClass path: #(#Object #_EventsRegister))!

testEquals
	super testEquals.
	self assert: (self subjectClass path: #('Core'))
		equals: (self subjectClass simpleName: 'Core' in: Smalltalk).
	"This demonstrates a significant gotcha with BindingReferences: Literal binding refs start the binding search in the method class, so they are not equivalent to a BindingReference constructed from just a path string that does not have a context class.
	Many BindingReferences that are not considered equivalent may eventually bind to the same target binding - this is a necessary condition for BindingReference equivalence, but it is not sufficient. BindingReferences are only equivalent if they represent the same binding path from the same starting point. An exception to this is literal binding refs in expressions that are compiled without context (e.g. in a workspace or a file-in), these do not have a starting context because the expressions
	are not explicitly compiled in any particular class and can only reference variables in Smalltalk with unqualified names, not the class variables of Object or any variables in namespaces imported into Object."
	self deny: 'Object' asQualifiedReference equals: #{Object}.!

testHash
	super testHash.
	self assert: (BindingReference path: #('Core' 'Object')) hash
		equals: (BindingReference path: #('Core' 'Object') home: Smalltalk) hash!

testHome
	| subject |
	subject := self subjectClass path: #('OpcodePool' 'Nop').
	self assert: subject home identicalTo: Smalltalk.
	subject := self subjectClass path: #('Nop') home: OpcodePool.
	self assert: subject home identicalTo: OpcodePool
!

testIsValidGlobalName
	#('A' 'A1' 'A_' '_A' 'a' '_a' '__A_B' 'A.B' 'Abc.D' '_Abc._d' 'abc.d')
		do: [:each | self assert: (BindingReference isValidQualifiedName: each)].
	#('_' '_.' 'A.' '.A' '_A.' '_.A' '.' 'a.' '_.a' '*' '' 'A.*' '*.' 'A..B')
		do: [:each | self deny: (BindingReference isValidQualifiedName: each)]!

testLessOrEqual
	| a a1 b ameta a1meta |
	a := self subjectClass pathString: 'Core.Object'.
	a1 := self subjectClass pathString: 'Core.Object'.
	b := self subjectClass pathString: 'Core.object'.
	self assert: a <= a.
	self assert: a <= a1.
	self assert: a1 <= a.
	self deny: a <= b.
	
	ameta := a meta.
	a1meta := a1 meta.

	self deny: ameta <= b.
	self assert: a <= ameta.
	self assert: ameta <= ameta.
	self assert: ameta <= a1meta.
	self deny: ameta <= a.

	!

testPathString
	| subject |
	super testPathString.
	#('*' 'Smalltalk.Core.*')
		do: [:each | self assert: (self subjectClass pathString: each) pathString equals: each].
	subject := self subjectClass pathString: ''.
	self assert: subject path equals: #().
	self deny: subject isWildcard! !
!AbsoluteBindingReferenceTest categoriesFor: #subjectClass!constants!private! !
!AbsoluteBindingReferenceTest categoriesFor: #testAsQualifiedReference!public! !
!AbsoluteBindingReferenceTest categoriesFor: #testEquals!public!unit tests! !
!AbsoluteBindingReferenceTest categoriesFor: #testHash!public!unit tests! !
!AbsoluteBindingReferenceTest categoriesFor: #testHome!public!unit tests! !
!AbsoluteBindingReferenceTest categoriesFor: #testIsValidGlobalName!public!unit tests! !
!AbsoluteBindingReferenceTest categoriesFor: #testLessOrEqual!public!unit tests! !
!AbsoluteBindingReferenceTest categoriesFor: #testPathString!public!unit tests! !

