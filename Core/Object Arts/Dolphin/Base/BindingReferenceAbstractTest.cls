"Filed out from Dolphin Smalltalk 7"!

DolphinTest subclass: #BindingReferenceAbstractTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
BindingReferenceAbstractTest guid: (GUID fromString: '{bc0780da-05e7-464d-af4f-48755f8f8d52}')!
BindingReferenceAbstractTest isAbstract: true!
BindingReferenceAbstractTest comment: ''!
!BindingReferenceAbstractTest categoriesForClass!Unclassified! !
!BindingReferenceAbstractTest methodsFor!

bindingTestCases
	"May ccontains some examples that currently do not resolve as there are no namespaces."

	| missingNamespace |
	missingNamespace := '_' , GUID newUnique idlString copyReplacing: $- withObject: $_.
	^{#(#(#Object)).
		{#(#Smalltalk #Object). #(#Smalltalk #Object)}.
		#(#(#OpcodePool #Nop)).
		#(#(#Smalltalk #OpcodePool #Nop) #(#Smalltalk #OpcodePool #Nop)).
		{{missingNamespace. '__MissingClass'}. nil}.
		{{missingNamespace. 'Date'}. nil}.
		{#(#Object #_EventsRegister). #(#Object #_EventsRegister)}}!

newTestSubjectWithPath: anArrayOfStrings
	^self subjectClass path: anArrayOfStrings!

newTestSubjectWithPathString: aString
	^self subjectClass pathString: aString!

printStringTestCases
	^#(#(#(#Object) '#{Object}') #(#(#OpcodePool #Nop) '#{OpcodePool.Nop}') #(#('A' 'B' 'C') '#{A.B.C}'))!

subjectClass
	^self subclassResponsibility!

testAsString
	self printStringTestCases do: 
			[:each |
			| subject |
			subject := self newTestSubjectWithPath: each first.
			self assert: subject asString equals: (each last copyFrom: 3 to: each last size - 1)]!

testAsSymbol
	self assert: (self newTestSubjectWithPath: #('Object')) asSymbol identicalTo: #Object.
	self assert: (self newTestSubjectWithPath: #('OpcodePool' 'Break')) asSymbol
		identicalTo: #'OpcodePool.Break'!

testBinding
	self bindingTestCases do: 
			[:each |
			| path subject |
			path := each last.
			subject := self newTestSubjectWithPath: each first.
			path
				ifNil: [self should: [subject binding] raise: NotFoundError]
				ifNotNil: 
					[| expected actual |
					actual := subject binding.
					expected := Smalltalk resolveBindingPath: path.
					self assert: actual identicalTo: expected]]!

testBindingOrNil
	self bindingTestCases do: 
			[:each |
			| actual path |
			actual := (self newTestSubjectWithPath: each first) bindingOrNil.
			path := each last.
			path
				ifNil: [self assertIsNil: actual]
				ifNotNil: 
					[| expected |
					expected := Smalltalk resolveBindingPath: path.
					self assert: actual identicalTo: expected]]!

testEquals
	self assert: (self newTestSubjectWithPath: #('Smalltalk'))
		equals: (self newTestSubjectWithPathString: 'Smalltalk').
	self assert: (self newTestSubjectWithPath: #('Smalltalk' 'Object'))
		equals: (self newTestSubjectWithPathString: 'Smalltalk.Object').
	self deny: (self newTestSubjectWithPath: #('Smalltalk')) equals: Object new.
	"BindingReference equality is a stable property based on the path and starting point. Different paths to the same target binding (of which there may be many) are not equal."
	self deny: (self newTestSubjectWithPath: #('Object'))
		equals: (self newTestSubjectWithPath: #('Smalltalk' 'Object'))!

testHash
	self assert: (self subjectClass path: #('Smalltalk' 'OpcodePool' 'Nop')) hash
		equals: (self subjectClass pathString: 'Smalltalk.OpcodePool.Nop') hash.
	"Same target variable, but different paths, so different hashes."
	self deny: (self subjectClass path: #('Object')) hash
		equals: (self subjectClass path: #('Smalltalk' 'Object')) hash.
	self deny: (self subjectClass path: #('Object')) hash
		equals: (self subjectClass path: #('Smalltalk')) hash!

testIfDefined
	self bindingTestCases do: 
			[:each |
			| subject actual path expected |
			subject := self newTestSubjectWithPath: each first.
			actual := subject ifDefined: [:value | value].
			path := each last.
			expected := path isNil ifFalse: [(Smalltalk resolveBindingPath: path) value].
			self assert: actual identicalTo: expected]!

testIfDefinedIfNotDefined
	self bindingTestCases do: 
			[:each |
			| subject |
			subject := self newTestSubjectWithPath: each first.
			subject
				ifDefined: [:value | self assert: value identicalTo: (Smalltalk resolveBindingPath: each last) value]
				ifNotDefined: [self assertIsNil: each last]]!

testIsDefined
	self bindingTestCases do: 
			[:each |
			| subject |
			subject := self newTestSubjectWithPath: each first.
			self assert: subject isDefined equals: each last notNil]!

testIsLiteral
	self bindingTestCases do: [:each | self assert: (self newTestSubjectWithPath: each first) isLiteral]!

testIsWilcard
	self bindingTestCases do: [:each | self deny: (self newTestSubjectWithPath: each first) isWildcard]!

testPath
	self bindingTestCases do: 
			[:each |
			| subject |
			subject := self newTestSubjectWithPath: each first.
			self assert: subject path equals: each last ?? each first]!

testPathString
	| subject pathString |
	self bindingTestCases do: 
			[:each |
			| path |
			path := each first.
			pathString := String
						streamContents: [:strm | path do: [:id | strm nextPutAll: id] separatedBy: [strm nextPut: $.]].
			subject := self subjectClass pathString: pathString.
			self assert: subject path equals: each last ?? path.
			self deny: subject isWildcard]!

testPrintString
	self printStringTestCases do: 
			[:each |
			| subject |
			subject := self subjectClass path: each first.
			self assert: subject printString equals: each last]!

testRefersToLiteral
	"A BindingReference matches literals for the same path..."

	self assert: (Object fullyQualifiedReference refersToLiteral: (self subjectClass pathString: 'Object')).
	".. and the binding to which it would resolve ..."
	self assert: (#{Object} refersToLiteral: Object binding).
	"... but not the target value."
	self deny: (#{Object} refersToLiteral: #{Object} value).
	"BindingRef to a pool variable."
	self assert: (#{_PrimitiveFailureCode.AccessViolation}
				refersToLiteral: #{_PrimitiveFailureCode.AccessViolation}).
	self assert: (#{_PrimitiveFailureCode.AccessViolation}
				refersToLiteral: #{_PrimitiveFailureCode.AccessViolation} binding).
	"Should a BindingRef implicitly refers to refs along its path? Not sure."
	false
		ifTrue: 
			[self assert: (#{_PrimitiveFailureCode.AccessViolation} refersToLiteral: #{_PrimitiveFailureCode})].
	#todo.	"This should be true, but at present is not because bindings do not know their scope."
	false
		ifTrue: 
			[self
				assert: (#{_PrimitiveFailureCode.AccessViolation} refersToLiteral: #{_PrimitiveFailureCode} binding)]!

testSimpleName
	self bindingTestCases do: 
			[:each |
			| path subject |
			path := each first.
			subject := self newTestSubjectWithPath: path.
			self assert: subject simpleName equals: path last]!

testStoreString
	self printStringTestCases do: 
			[:each |
			| subject |
			subject := self subjectClass path: each first.
			self assert: subject storeString equals: each last]!

testValue
	self bindingTestCases do: 
			[:each |
			| path subject |
			path := each last.
			subject := self newTestSubjectWithPath: each first.
			path
				ifNil: [self should: [subject value] raise: NotFoundError]
				ifNotNil: 
					[| expected actual |
					actual := subject value.
					expected := (Smalltalk resolveBindingPath: path) value.
					self assert: actual identicalTo: expected]]!

testValueOrNil
	self bindingTestCases do: 
			[:each |
			| path subject expected actual |
			path := each last.
			subject := self newTestSubjectWithPath: each first.
			actual := subject valueOrNil.
			expected := path ifNotNil: [(Smalltalk resolveBindingPath: path) value].
			self assert: actual identicalTo: expected]! !
!BindingReferenceAbstractTest categoriesFor: #bindingTestCases!constants!private! !
!BindingReferenceAbstractTest categoriesFor: #newTestSubjectWithPath:!helpers!private! !
!BindingReferenceAbstractTest categoriesFor: #newTestSubjectWithPathString:!helpers!private! !
!BindingReferenceAbstractTest categoriesFor: #printStringTestCases!constants!private! !
!BindingReferenceAbstractTest categoriesFor: #subjectClass!constants!private! !
!BindingReferenceAbstractTest categoriesFor: #testAsString!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testAsSymbol!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testBinding!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testBindingOrNil!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testEquals!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testHash!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testIfDefined!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testIfDefinedIfNotDefined!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testIsDefined!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testIsLiteral!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testIsWilcard!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testPath!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testPathString!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testPrintString!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testRefersToLiteral!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testSimpleName!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testStoreString!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testValue!public!unit tests! !
!BindingReferenceAbstractTest categoriesFor: #testValueOrNil!public!unit tests! !

