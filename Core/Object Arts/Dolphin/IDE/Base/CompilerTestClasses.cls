"Filed out from Dolphin Smalltalk 7"!

DolphinTestClassResource subclass: #CompilerTestClasses
	instanceVariableNames: 'testClass'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
CompilerTestClasses guid: (GUID fromString: '{23db72f8-4a90-4244-adbc-ea3e9c776d0a}')!
CompilerTestClasses comment: ''!
!CompilerTestClasses categoriesForClass!Unclassified! !
!CompilerTestClasses methodsFor!

createClasses
	| ivs |
	ivs := String writeStream.
	1 to: 33
		do: 
			[:i |
			ivs
				nextPutAll: 'iv';
				print: i;
				space].
	testClass := self
				createClass: #CompilerTestClass
				superclass: Object
				instVars: ivs contents
				pools: ''.
	self compileAccessorsFor: testClass!

tearDown
	super tearDown.
	testClass := nil!

testClass
	^testClass! !
!CompilerTestClasses categoriesFor: #createClasses!public!unit tests! !
!CompilerTestClasses categoriesFor: #tearDown!public!Running! !
!CompilerTestClasses categoriesFor: #testClass!public!unit tests! !

