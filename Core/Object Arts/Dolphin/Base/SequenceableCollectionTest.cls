﻿"Filed out from Dolphin Smalltalk 7"!

DolphinCollectionTest subclass: #SequenceableCollectionTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
SequenceableCollectionTest guid: (GUID fromString: '{4c32dbcc-4044-442b-95d9-d6e8ad2396cf}')!
SequenceableCollectionTest isAbstract: true!
SequenceableCollectionTest comment: 'SUnitBrowser openOnTestCase: self'!
!SequenceableCollectionTest categoriesForClass!Unclassified! !
!SequenceableCollectionTest methodsFor!

assimilateResultElement: anObject
	^self assimilate: anObject!

byteArrayForSequence: aCollection
	| answer |
	answer := ByteArray new: aCollection size.
	1 to: aCollection size do: [:each | answer at: each put: (aCollection at: each) asInteger].
	^answer!

newCopy: aCollection
	^self newCollection: aCollection!

newEmptyCollection: anInteger
	^self collectionClass new: anInteger!

newNumericArray: anInteger 
	^self newCollection: (1 to: anInteger)!

newUnsortedCollection: aCollection
	^self unsortedCollectionClass withAll: (self assimilateElements: aCollection)!

testAsByteArray
	| sequence |
	sequence := #().
	self assert: (self newCollection: sequence) asByteArray
		equals: (self byteArrayForSequence: sequence).
	sequence := #(65).
	self assert: (self newCollection: sequence) asByteArray
		equals: (self byteArrayForSequence: sequence).
	sequence := #(65 66).
	self assert: (self newCollection: sequence) asByteArray
		equals: (self byteArrayForSequence: sequence).
	sequence := #(65 66 67).
	self assert: (self newCollection: sequence) asByteArray
		equals: (self byteArrayForSequence: sequence).
	sequence := #(65 66 67 68).
	self assert: (self newCollection: sequence) asByteArray
		equals: (self byteArrayForSequence: sequence)!

testAt
	| subject |
	subject := self newCollection: #().
	-1 to: 1 do: [:i | self should: [subject at: i] raise: BoundsError].
	subject := self newCollection: #(65).
	self assert: (subject at: 1) equals: (self assimilate: 65).
	#(-1 0 2) do: [:i | self should: [subject at: i] raise: BoundsError].
	subject := self newCollection: #(65 66 67).
	1 to: subject size do: [:i | self assert: (subject at: i) equals: (self assimilate: 65 + i - 1)].
	(Array
		with: -1
		with: 0
		with: subject size + 1) do: [:i | self should: [subject at: i] raise: BoundsError]!

testBeginsWith
	"Test SequenceableCollection>>beginsWith:"

	| sequence one two oneTwo empty |
	one := self newCollection: #($1).
	two := self newCollection: #($2).
	empty := self newCollection: #().
	sequence := empty.
	self assert: (sequence beginsWith: empty).
	self assert: (sequence beginsWith: one) not.
	oneTwo := self newCollection: #($1 $2).
	self assert: (sequence beginsWith: oneTwo) not.
	sequence := one copy.
	self assert: (sequence beginsWith: empty).
	self assert: (sequence beginsWith: one).
	self assert: (sequence beginsWith: two) not.
	self assert: (sequence beginsWith: oneTwo) not.
	self assert: (sequence beginsWith: #($2 $3)) not.
	sequence := oneTwo copy.
	self assert: (sequence beginsWith: empty).
	self assert: (sequence beginsWith: one).
	self assert: (sequence beginsWith: two) not.
	self assert: (sequence beginsWith: oneTwo).
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($2 $1))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($2 $1 $3))) not.
	sequence := self newCollection: #($1 $2 $3 $4 $5).
	self assert: (sequence beginsWith: one).
	self assert: (sequence beginsWith: two) not.
	self assert: (sequence beginsWith: oneTwo).
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($2 $1))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3))).
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($3 $1 $2))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $3 $2))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $4))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3 $4))).
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($4 $1 $2 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $4 $2 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $4 $3))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3 $5))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3 $4 $5))).
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($5 $1 $2 $3 $4))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $5 $2 $3 $4))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $5 $3 $4))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3 $5 $4))) not.
	self assert: (sequence beginsWith: (self newUnsortedCollection: #($1 $2 $3 $4 $5 $6))) not!

testBinarySearch
	| searchee lessThan |
	lessThan := [:x :y | x < y].
	searchee := self newCollection: 'abcdefghijklmnopqrstuvwxyz'.
	(searchee respondsTo: #binarySearchFor:using:)
		ifFalse: 
			["Binary search method introduced in D6"
			^self].
	self assert: (searchee binarySearchFor: (searchee at: 1) using: lessThan) equals: 1.
	self assert: (searchee binarySearchFor: (searchee at: 8) using: lessThan) equals: 8.
	self assert: (searchee binarySearchFor: (searchee at: 26) using: lessThan) equals: 26!

testConcatenation
	| a b |
	#(#(#() #()) #(#() #($a)) #(#() #($a $b)) #(#($a) #($b)) #(#($a) #($b $c)) #(#($a $b) #($c $d)))
		do: 
			[:eachPair |
			a := self newUnsortedCollection: eachPair first.
			b := self newCollection: eachPair last.
			self verifyConcatenation: a with: b.
			self verifyConcatenation: b with: a]!

testCopyFromTo
	| source empty |
	source := self newCollection: #().
	empty := self newCopy: #().
	self should: [source copyFrom: -2 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: 0] raise: BoundsError.
	self should: [source copyFrom: 0 to: 0] raise: BoundsError.
	self assert: (source copyFrom: 1 to: 0) equals: empty.
	self should: [source copyFrom: 1 to: 1] raise: BoundsError.
	self should: [source copyFrom: 1 to: 2] raise: BoundsError.
	self should: [source copyFrom: 1 to: 3] raise: BoundsError.
	self should: [source copyFrom: 2 to: 2] raise: BoundsError.
	self should: [source copyFrom: 2 to: 3] raise: BoundsError.
	self should: [source copyFrom: 2 to: 4] raise: BoundsError.
	source := self newCollection: #($1).
	self should: [source copyFrom: -2 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: 0] raise: BoundsError.
	self should: [source copyFrom: 0 to: 0] raise: BoundsError.
	self assert: (source copyFrom: 1 to: 0) equals: empty.
	self assert: (source copyFrom: 1 to: 1) equals: (self newCopy: source).
	self should: [source copyFrom: 1 to: 2] raise: BoundsError.
	self should: [source copyFrom: 1 to: 3] raise: BoundsError.
	self should: [source copyFrom: 2 to: 2] raise: BoundsError.
	self should: [source copyFrom: 2 to: 3] raise: BoundsError.
	self should: [source copyFrom: 2 to: 4] raise: BoundsError.
	source := self newCollection: #($1 $2).
	self should: [source copyFrom: -2 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: 0] raise: BoundsError.
	self should: [source copyFrom: 0 to: 0] raise: BoundsError.
	self assert: (source copyFrom: 1 to: 0) equals: empty.
	self assert: (source copyFrom: 1 to: 1) equals: (self newCopy: #($1)).
	self assert: (source copyFrom: 1 to: 2) equals: (self newCopy: source).
	self should: [source copyFrom: 1 to: 3] raise: BoundsError.
	self assert: (source copyFrom: 2 to: 2) equals: (self newCopy: #($2)).
	self should: [source copyFrom: 2 to: 3] raise: BoundsError.
	self should: [source copyFrom: 2 to: 4] raise: BoundsError.
	source := self newCollection: #($1 $2 $3).
	self should: [source copyFrom: -2 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: 0] raise: BoundsError.
	self should: [source copyFrom: 0 to: 0] raise: BoundsError.
	self assert: (source copyFrom: 1 to: 0) equals: empty.
	self assert: (source copyFrom: 1 to: 1) equals: (self newCopy: #($1)).
	self assert: (source copyFrom: 1 to: 2) equals: (self newCopy: #($1 $2)).
	self assert: (source copyFrom: 1 to: 3) equals: (self newCopy: source).
	self assert: (source copyFrom: 2 to: 2) equals: (self newCopy: #($2)).
	self assert: (source copyFrom: 2 to: 3) equals: (self newCopy: #($2 $3)).
	self assert: (source copyFrom: 3 to: 3) equals: (self newCopy: #($3)).
	self should: [source copyFrom: 2 to: 4] raise: BoundsError.
	source := self newCollection: #($1 $2 $3 $4).
	self should: [source copyFrom: -2 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: -1] raise: BoundsError.
	self should: [source copyFrom: -1 to: 0] raise: BoundsError.
	self should: [source copyFrom: 0 to: 0] raise: BoundsError.
	self assert: (source copyFrom: 1 to: 0) equals: empty.
	self assert: (source copyFrom: 1 to: 1) equals: (self newCopy: #($1)).
	self assert: (source copyFrom: 1 to: 2) equals: (self newCopy: #($1 $2)).
	self assert: (source copyFrom: 1 to: 3) equals: (self newCopy: #($1 $2 $3)).
	self assert: (source copyFrom: 1 to: 4) equals: (self newCopy: source).
	self assert: (source copyFrom: 2 to: 2) equals: (self newCopy: #($2)).
	self assert: (source copyFrom: 2 to: 3) equals: (self newCopy: #($2 $3)).
	self assert: (source copyFrom: 2 to: 4) equals: (self newCopy: #($2 $3 $4)).
	self assert: (source copyFrom: 3 to: 3) equals: (self newCopy: #($3)).
	self assert: (source copyFrom: 4 to: 4) equals: (self newCopy: #($4)).
	self should: [source copyFrom: 4 to: 5] raise: BoundsError!

testCopyReplaceAllWith
	| testCases |
	testCases := OrderedCollection new.
	"Empty replacements"
	testCases
		add: #(#() #() #() #());
		add: #(#($a) #($a) #() #());
		add: #(#($a) #($b) #() #($a));
		add: #(#($a $x) #($a) #() #($x));
		add: #(#($x $a) #($a) #() #($x));
		add: #(#($a $a) #($a) #() #());
		add: #(#($a $x $a) #($a) #() #($x));
		add: #(#($a $x $a $a $y) #($a) #() #($x $y));
		add: #(#($x $y $a $a $z) #($a) #() #($x $y $z));
		add: #(#($a $b $x $a $b $y $a $b) #($a $b) #() #($x $y)).

	"Single element replacements"
	testCases
		add: #(#() #($a) #($b) #());
		add: #(#($a) #($a) #($b) #($b));
		add: #(#($a) #($b) #($c) #($a));
		add: #(#($a $x) #($a) #($b) #($b $x));
		add: #(#($x $a) #($a) #($b) #($x $b));
		add: #(#($a $a) #($a) #($b) #($b $b));
		add: #(#($a $x $a) #($a) #($b) #($b $x $b));
		add: #(#($a $x $a $a $y) #($a) #($b) #($b $x $b $b $y));
		add: #(#($x $y $a $a $z) #($a) #($b) #($x $y $b $b $z)).
	"Replacement of one element with more than one"
	testCases
		add: #(#() #($a) #($b $c) #());
		add: #(#($a) #($a) #($b $c) #($b $c));
		add: #(#($a) #($b) #($c $d) #($a));
		add: #(#($a $x) #($a) #($b $c) #($b $c $x));
		add: #(#($x $a) #($a) #($b $c) #($x $b $c));
		add: #(#($a $a) #($a) #($b $c) #($b $c $b $c));
		add: #(#($a $x $a) #($a) #($b $c) #($b $c $x $b $c));
		add: #(#($a $x $a $a $y) #($a) #($b $c) #($b $c $x $b $c $b $c $y));
		add: #(#($x $y $a $a $z) #($a) #($b $c $d) #($x $y $b $c $d $b $c $d $z)).
	"Replacement of more than one element with one"
	testCases
		add: #(#() #($a $b) #($c) #());
		add: #(#($a) #($a $b) #($c) #($a));
		add: #(#($a $b) #($a $b) #($c) #($c));
		add: #(#($a $b $x) #($a $b) #($c) #($c $x));
		add: #(#($x $a $b) #($a $b) #($c) #($x $c));
		add: #(#($x $a $b $y $z) #($a $b) #($c) #($x $c $y $z));
		add: #(#($x $a $b $y $a $b $z) #($a $b) #($c) #($x $c $y $c $z));
		add: #(#($a $b $a $b $x $a $b $y $z $a $b $a $b) #($a $b) #($c) #($c $c $x $c $y $z $c $c));
		add: #(#($a $b $a $x $a $b $y $z $a $b $b) #($a $b) #($c) #($c $a $x $c $y $z $c $b)).
	"Replacement of more than one element with more than one"
	testCases
		add: #(#() #($a $b) #($c $d) #());
		add: #(#($a) #($a $b) #($c $d) #($a));
		add: #(#($a $b) #($a $b) #($c $d) #($c $d));
		add: #(#($a $b $x) #($a $b) #($c $d) #($c $d $x));
		add: #(#($x $a $b) #($a $b) #($c $d) #($x $c $d));
		add: #(#($x $a $b $y $z) #($a $b) #($c $d) #($x $c $d $y $z));
		add: #(#($x $a $b $y $a $b $z) #($a $b) #($c $d) #($x $c $d $y $c $d $z));
		add: #(#($a $b $a $b $x $a $b $y $z $a $b $a $b) #($a $b) #($c $d) #($c  $d $c $d $x $c $d $y $z $c $d $c $d));
		add: #(#($a $b $a $x $a $b $y $z $a $b $b) #($a $b) #($c $d) #($c $d $a $x $c $d $y $z $c $d $b)).
	testCases do: 
			[:eachCase |
			| subject expected actual |
			subject := self newCollection: eachCase first.
			expected := self newCopy: eachCase last.
			actual := subject copyReplaceAll: (self newCollection: eachCase second)
						with: (self newCollection: eachCase third).
			self assert: actual equals: expected]!

testEndsWith
	"Test SequenceableCollection>>endsWith:"

	| sequence |
	sequence := self newCollection: #().
	self assert: (sequence endsWith: (self newUnsortedCollection: #())).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2))) not.
	sequence := self newCollection: #($1).
	self assert: (sequence endsWith: (self newUnsortedCollection: #())).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2 $3))) not.
	sequence := self newCollection: #($1 $2).
	self assert: (sequence endsWith: (self newUnsortedCollection: #())).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2 $1))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $3))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2 $3))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2 $1 $3))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2 $4))) not.
	sequence := self newCollection: #($1 $2 $3).
	self assert: (sequence endsWith: (self newUnsortedCollection: #())).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($3))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2 $3))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($2 $1))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2 $3))).
	self assert: (sequence endsWith: (self newUnsortedCollection: #($3 $1 $2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $3 $2))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2 $4))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($1 $2 $3 $4))) not.
	self assert: (sequence endsWith: (self newUnsortedCollection: #($4 $1 $2 $3))) not!

testFindFirst
	| subject matchAll matchNone b c d matchB matchC |
	matchAll := [:each | true].
	matchNone := [:each | false].
	subject := self newCollection: #().
	self assert: (subject findFirst: matchAll) equals: 0.
	self assert: (subject findFirst: matchNone) equals: 0.
	subject := self newCollection: #($a).
	self assert: (subject findFirst: matchAll) equals: 1.
	self assert: (subject findFirst: matchNone) equals: 0.
	subject := self newCollection: #($a $b).
	subject := self newCollection: #($a $b $c).
	b := subject at: 2.
	c := subject at: 3.
	d := self assimilate: $d.
	matchB := [:each | each = b].
	matchC := [:each | each = c].
	self assert: (subject findFirst: matchB) equals: 2.
	self assert: (subject findFirst: [:each | each = d]) equals: 0.
	self assert: (subject findFirst: matchC) equals: 3!

testFirst
	| first |
	self should: [(self newCollection: #()) first] raise: BoundsError.
	first := (self newCollection: #(49)) at: 1.
	self assert: (self newCollection: #(49)) first equals: first.
	self assert: (self newCollection: #(49 50)) first equals: first!

testFirstColon
	| empty one two three |
	empty := self newCollection: #().
	self assert: (empty first: 0) equals: (self newCopy: empty).
	self should: [empty first: 1] raise: Error.
	self should: [empty first: 2] raise: Error.
	self should: [empty first: -1] raise: Error.
	one := self newCollection: #($1).
	self assert: (one first: 0) equals: (self newCopy: empty).
	self assert: (one first: 1) equals: (self newCopy: one).
	self should: [one first: 2] raise: Error.
	self should: [one first: -1] raise: Error.
	two := self newCollection: #($1 $2).
	self assert: (two first: 0) equals: (self newCopy: empty).
	self assert: (two first: 1) equals: (self newCopy: one).
	self assert: (two first: 2) equals: (self newCopy: two).
	self should: [two first: 3] raise: Error.
	self should: [one first: -1] raise: Error.
	three := self newCollection: #($1 $2 $3).
	self assert: (three first: 0) equals: (self newCopy: empty).
	self assert: (three first: 1) equals: (self newCopy: one).
	self assert: (three first: 2) equals: (self newCopy: two).
	self assert: (three first: 3) equals: (self newCopy: three).
	self should: [two first: 4] raise: Error.
	self should: [one first: -1] raise: Error!

testFromToKeysAndValuesDo
	"Empty array"

	| array pairs |
	array := self newNumericArray: 0.
	pairs := OrderedCollection new.
	#(#(1 0)) do: 
			[:each |
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue].
			self assert: pairs isEmpty].
	#(#(0 -1) #(-1 0) #(0 1) #(1 1) #(2 2) #(2 1) #(3 2)) do: 
			[:each |
			self should: 
					[array
						from: each first
						to: each last
						keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue]]
				raise: BoundsError.
			self assert: pairs isEmpty].
	"Array of 1 element"
	array := self newNumericArray: 1.
	#(#(1 0) #(2 1)) do: 
			[:each |
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue].
			self assert: pairs isEmpty].
	#(#(1 1)) do: 
			[:each |
			| expected |
			pairs := OrderedCollection new.
			array
				from: 1
				to: 1
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString].
			expected := (each first to: each last) collect: [:i | i -> i printString].
			self assert: pairs asArray equals: expected].
	#(#(1 2) #(2 2) #(3 2)) do: 
			[:each |
			self should: 
					[array
						from: each first
						to: each last
						keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString]]
				raise: BoundsError].
	pairs := OrderedCollection new.
	"Array of two elements"
	array := self newNumericArray: 2.
	#(#(1 0) #(2 1) #(3 2)) do: 
			[:each |
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString].
			self assert: pairs isEmpty].
	#(#(1 1) #(1 2) #(2 2)) do: 
			[:each |
			| expected |
			pairs := OrderedCollection new.
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString].
			expected := (each first to: each last) collect: [:i | i -> i printString].
			self assert: pairs asArray equals: expected].
	#(#(1 3) #(2 3) #(3 3)) do: 
			[:each |
			self should: 
					[array
						from: each first
						to: each last
						keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString]]
				raise: BoundsError].
	"Array of three elements"
	pairs := OrderedCollection new.
	array := self newNumericArray: 3.
	#(#(1 0) #(2 1) #(3 2) #(4 3)) do: 
			[:each |
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString].
			self assert: pairs isEmpty].
	#(#(1 1) #(1 2) #(2 2) #(1 3) #(2 3) #(3 3)) do: 
			[:each |
			| expected |
			pairs := OrderedCollection new.
			array
				from: each first
				to: each last
				keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString].
			expected := (each first to: each last) collect: [:i | i -> i printString].
			self assert: pairs asArray equals: expected].
	#(#(1 4) #(2 4) #(3 4) #(4 4)) do: 
			[:each |
			self should: 
					[array
						from: each first
						to: each last
						keysAndValuesDo: [:eachKey :eachValue | pairs addLast: eachKey -> eachValue displayString]]
				raise: BoundsError]!

testFromToKeysAndValuesDo2
	#(#() #(65) #(65 66) #(65 66 67) #(65 66 67 68)) do: 
			[:sequence |
			| enum collection |
			enum := OrderedCollection new.
			collection := self newCollection: sequence.
			"Deliberate enumeration over an empty interval - should be valid"
			collection
				from: sequence size + 1
				to: sequence size
				keysAndValuesDo: [:i :each | enum add: each].
			self assert: enum isEmpty.
			collection
				from: 1
				to: sequence size
				keysAndValuesDo: [:i :each | enum add: each].
			self assert: enum asArray equals: collection asArray.
			self should: 
					[collection
						from: 0
						to: sequence size
						keysAndValuesDo: [:i :each | enum add: each]]
				raise: BoundsError.
			self should: 
					[collection
						from: 1
						to: sequence size + 1
						keysAndValuesDo: [:i :each | enum add: each]]
				raise: BoundsError]!

testIdentityIncludes
	| searchee |
	searchee := self newCollection: 'abc'.
	self assert: (searchee identityIncludes: (self assimilate: $a)).
	self assert: (searchee identityIncludes: (self assimilate: $b)).
	self assert: (searchee identityIncludes: (self assimilate: $c)).
	self deny: (searchee identityIncludes: (self assimilate: $A)).
	self deny: (searchee identityIncludes: (self assimilate: $d)).
	self deny: (searchee identityIncludes: Object new)!

testIncludes
	| searchee |
	searchee := self newCollection: 'abc'.
	self assert: (searchee includes: (self assimilate: $a)).
	self assert: (searchee includes: (self assimilate: $b)).
	self assert: (searchee includes: (self assimilate: $c)).
	self deny: (searchee includes: (self assimilate: $A)).
	self deny: (searchee includes: (self assimilate: $d)).
	self deny: (searchee includes: Object new)!

testIncludesAnyOf
	| searchee |
	searchee := self newCollection: 'abcdefgabcdef'.
	self assert: (searchee includesAnyOf: (self newCollection: 'a')).
	self assert: (searchee includesAnyOf: (self newCollection: 'bc')).
	self assert: (searchee includesAnyOf: (self newCollection: 'ez')).
	self deny: (searchee includesAnyOf: (self newCollection: '')).
	self deny: (searchee includesAnyOf: (self newCollection: 'z')).
	self deny: (searchee includesAnyOf: (self newCollection: 'xyz')).
	searchee := self newCollection: ''.
	self deny: (searchee includesAnyOf: (self newCollection: '')).
	self deny: (searchee includesAnyOf: (self newCollection: 'a')).
	self deny: (searchee includesAnyOf: (self newCollection: 'ab')).
	"#715"
	searchee := self newEmptyCollection: 10.
	self deny: (searchee includesAnyOf: (self newCollection: 'a')).
	searchee := (self newEmptyCollection: 1) , (self newCollection: 'abc').
	self assert: (searchee includesAnyOf: (self newCollection: 'b'))!

testIndexOfAnyOfStartingAt
	| searchee db bd de a d abc offset aa |
	db := self newCollection: 'db'.
	a := self newCollection: 'a'.
	d := self newCollection: 'd'.
	abc := self newCollection: 'abc'.
	searchee := self newCollection: ''.
	self 
		verifyIndexOfAnyOf: searchee
		startingAt: 1
		in: searchee
		is: 0.
	self 
		verifyIndexOfAnyOf: a
		startingAt: 1
		in: searchee
		is: 0.
	self 
		verifyIndexOfAnyOf: db
		startingAt: 1
		in: searchee
		is: 0.
	searchee := abc.
	self 
		verifyIndexOfAnyOf: db
		startingAt: 1
		in: searchee
		is: 2.
	self 
		verifyIndexOfAnyOf: db
		startingAt: 2
		in: searchee
		is: 2.
	self 
		verifyIndexOfAnyOf: db
		startingAt: 3
		in: searchee
		is: 0.
	bd := self newCollection: 'bd'.
	self 
		verifyIndexOfAnyOf: bd
		startingAt: 1
		in: searchee
		is: 2.
	de := self newCollection: 'de'.
	self 
		verifyIndexOfAnyOf: de
		startingAt: 1
		in: searchee
		is: 0.
	searchee := self newCollection: (String new: 1).
	searchee isSymbol 
		ifFalse: 
			[self 
				verifyIndexOfAnyOf: searchee
				startingAt: 1
				in: searchee
				is: 1.
			self 
				verifyIndexOfAnyOf: a
				startingAt: 1
				in: searchee
				is: 0.
			self 
				verifyIndexOfAnyOf: db
				startingAt: 1
				in: searchee
				is: 0].
	searchee := abc , (self newCollection: (String new: 1)).
	offset := searchee first == Character null ifTrue: [1] ifFalse: [0].
	aa := 1.
	self 
		verifyIndexOfAnyOf: db
		startingAt: aa
		in: searchee
		is: 2 + offset.
	self 
		verifyIndexOfAnyOf: a
		startingAt: aa
		in: searchee
		is: 1 + offset.
	self 
		verifyIndexOfAnyOf: de
		startingAt: aa
		in: searchee
		is: 0!

testLast
	self should: [(self newCollection: #()) last] raise: BoundsError.
	self assert: (self newCollection: #(49)) last equals: (self assimilate: 49).
	self assert: (self newCollection: #(49 50)) last equals: (self assimilate: 50).
	self assert: (self newCollection: #(49 50 51)) last equals: (self assimilate: 51)!

testLastColon
	| empty one two three |
	empty := self newCollection: #().
	self assert: (empty last: 0) equals: (self newCopy: empty).
	self should: [empty last: 1] raise: BoundsError.
	self should: [empty last: 2] raise: BoundsError.
	self should: [empty last: -1] raise: Error.
	one := self newCollection: #($2).
	self assert: (one last: 0) equals: (self newCopy: empty).
	self assert: (one last: 1) equals: (self newCopy: one).
	self should: [one last: 2] raise: BoundsError.
	self should: [one last: -1] raise: Error.
	two := self newCollection: #($1 $2).
	self assert: (two last: 0) equals: (self newCopy: empty).
	self assert: (two last: 1) equals: (self newCopy: #($2)).
	self assert: (two last: 2) equals: (self newCopy: two).
	self should: [two last: 3] raise: BoundsError.
	self should: [one last: -1] raise: Error.
	three := self newCollection: #($1 $2 $3).
	self assert: (three last: 0) equals: (self newCopy: empty).
	self assert: (three last: 1) equals: (self newCopy: #($3)).
	self assert: (three last: 2) equals: (self newCopy: #($2 $3)).
	self assert: (three last: 3) equals: (self newCopy: three).
	self should: [two last: 4] raise: BoundsError.
	self should: [one last: -1] raise: Error!

testMixedConcatenation
	"Test concatenating other types of sequenceable collection onto an array"

	| subjects |
	subjects := #(#() #(100) #(101 102)) collect: [:each | self newCollection: each].
	{{String empty.
			Utf8String empty.
			Utf16String empty.
			ByteArray new.
			OrderedCollection new.
			1 to: 0}.
		{'c'. 'c' asUtf8String. 'c' asUtf16String. OrderedCollection with: ${}.
		{'cd'. 'cd' asUtf8String. 'cd' asUtf16String. OrderedCollection with: $£ with: $x}} do: 
				[:args |
				args do: 
						[:eachCase |
						subjects do: 
								[:each |
								| result |
								result := self verifyConcatenation: eachCase with: each.
								self deny: each identicalTo: result]]]!

testReplaceFromToWithStartingAt
	| a |
	a := self newCollection: #($1 $2 $3 $4 $5).
	a
		replaceFrom: 2
		to: 4
		with: (self newCollection: #($a $b $c $d $e))
		startingAt: 2.
	self assert: a equals: (self newCollection: #($1 $b $c $d $5)).
	a := self newCollection: #($1 $2 $3 $4 $5).
	a
		replaceFrom: 2
		to: 4
		with: a
		startingAt: 3.
	self assert: a equals: (self newCollection: #($1 $3 $4 $5 $5)).
	a := self newCollection: #($1 $2 $3 $4 $5).
	a
		replaceFrom: 2
		to: 4
		with: a
		startingAt: 1.
	self assert: a equals: (self newCollection: #($1 $1 $2 $3 $5))!

testResize
	| subject actual original |
	subject := self newCollection: #().
	actual := subject resize: 0.
	self assert: actual identicalTo: subject.
	self assert: actual equals: (self newCollection: #()).
	actual := subject resize: 1.
	self assert: subject size equals: 1.
	self assert: actual identicalTo: subject.
	self assert: actual equals: (self collectionClass ofSize: 1).
	actual := subject resize: 0.
	self assert: subject size equals: 0.
	self assert: actual identicalTo: subject.
	self assert: actual equals: (self collectionClass ofSize: 0).
	actual := subject resize: 2.
	self assert: subject size equals: 2.
	self assert: actual identicalTo: subject.
	self assert: actual equals: (self collectionClass ofSize: 2).
	original := self newCollection: #($a).
	subject := original copy.
	actual := subject resize: 2.
	self assert: subject size equals: 2.
	self assert: actual equals: original , (self collectionClass ofSize: 1).
	actual := subject resize: 1.
	self assert: subject size equals: 1.
	self assert: actual equals: original.
	original := self newCollection: #($a $b).
	subject := original copy.
	actual := subject resize: 4.
	self assert: subject size equals: 4.
	self assert: actual equals: original , (self collectionClass ofSize: 2).
	actual := subject resize: 1.
	self assert: subject size equals: 1.
	self assert: actual equals: (self newCollection: #($a))!

unsortedCollectionClass
	^self collectionClass!

verifyConcatenation: b with: a
	| result aSize bSize aElems bElems resultElems |
	result := a , b.
	aSize := 0.
	aElems := OrderedCollection new.
	a readStream do: [:e | aElems addLast: e].
	aSize := aElems size.
	bElems := OrderedCollection new.
	b readStream do: [:e | bElems addLast: e].
	bSize := bElems size.
	resultElems := OrderedCollection new.
	result readStream do: [:e | resultElems addLast: e].
	self assert: resultElems size equals: aSize + bSize.
	1 to: aSize do: [:i | self assert: (resultElems at: i) equals: (aElems at: i)].
	1 to: bSize
		do: [:i | self assert: (resultElems at: i + aSize) equals: (self assimilateResultElement: (bElems at: i))].
	self
		verifyConcatenationResult: result
		of: a
		with: b.
	^result!

verifyConcatenationResult: resultCollection of: receiverCollection with: argumentCollection
	self assert: resultCollection isKindOf: receiverCollection species!

verifyIndexOfAnyOf: searchFor startingAt: startInteger in: searchee is: foundInteger
	self assert: (searchee indexOfAnyOf: searchFor startingAt: startInteger) equals: foundInteger.
	self assert: (searchee indexOfAnyOf: searchFor asArray startingAt: startInteger)
		equals: foundInteger! !
!SequenceableCollectionTest categoriesFor: #assimilateResultElement:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #byteArrayForSequence:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #newCopy:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #newEmptyCollection:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #newNumericArray:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #newUnsortedCollection:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #testAsByteArray!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testAt!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testBeginsWith!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testBinarySearch!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testConcatenation!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testCopyFromTo!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testCopyReplaceAllWith!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testEndsWith!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testFindFirst!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testFirst!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testFirstColon!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testFromToKeysAndValuesDo!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testFromToKeysAndValuesDo2!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testIdentityIncludes!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testIncludes!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testIncludesAnyOf!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testIndexOfAnyOfStartingAt!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testLast!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testLastColon!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testMixedConcatenation!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testReplaceFromToWithStartingAt!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #testResize!public!unit tests! !
!SequenceableCollectionTest categoriesFor: #unsortedCollectionClass!constants!private! !
!SequenceableCollectionTest categoriesFor: #verifyConcatenation:with:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #verifyConcatenationResult:of:with:!helpers!private! !
!SequenceableCollectionTest categoriesFor: #verifyIndexOfAnyOf:startingAt:in:is:!helpers!private! !

