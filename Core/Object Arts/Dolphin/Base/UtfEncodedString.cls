"Filed out from Dolphin Smalltalk 7"!

String variableByteSubclass: #UtfEncodedString
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
UtfEncodedString guid: (GUID fromString: '{f19f0843-d636-4c39-8815-afe452d16cb0}')!
UtfEncodedString isNullTerminated: true!
UtfEncodedString isAbstract: true!
UtfEncodedString comment: ''!
!UtfEncodedString categoriesForClass!Collections-Text! !
!UtfEncodedString methodsFor!

asString
	"Answer a <readableString> containing the same characters as the receiver,
	i.e. the receiver."

	#todo. "For temporary compatibility reasons, this is always an ANSI-encoded byte string."
	^self asAnsiString!

at: anInteger encode: aCharacter
	"Encode the specified <Character> beginning at the specified position in the receiver.
	Answer the number of slots consumed by the encoded representation."

	^self subclassResponsibility!

copyWith: newElement
	"Answer a <sequencedReadableCollection> which is a copy of 
	the receiver that has newElement concatenated to its end."

	^self, (self class with: newElement)!

first: anInteger
	"Answer a new string comprising up to the leftmost anInteger characters of the receiver. 
	Implementation Note: Rather than implement in terms of the generic #copyFrom:to: method, 
	we can take advantage of the fact that this selector is specific to Strings, and implement more 
	efficiently."

	^self readStream next: anInteger!

growSize
	"Private - Answer the number of elements by which the receiver should grow, when growing!!
	(at least 2, in case the receiver is currently empty)"

	^self size max: self maxEncoding!

maxEncoding
	^self subclassResponsibility! !
!UtfEncodedString categoriesFor: #asString!converting!public! !
!UtfEncodedString categoriesFor: #at:encode:!accessing!public! !
!UtfEncodedString categoriesFor: #copyWith:!copying!public! !
!UtfEncodedString categoriesFor: #first:!copying!public! !
!UtfEncodedString categoriesFor: #growSize!accessing!private! !
!UtfEncodedString categoriesFor: #maxEncoding!constants!private! !

UtfEncodedString methodProtocol: #readableString attributes: #(#ansi #readOnly) selectors: #(#, #< #<= #> #>= #after: #asLowercase #asString #asSymbol #asUppercase #at: #at:ifAbsent: #before: #between:and: #copyFrom:to: #copyReplaceAll:with: #copyReplaceFrom:to:with: #copyReplaceFrom:to:withObject: #copyReplacing:withObject: #copyWith: #copyWithout: #do: #findFirst: #findLast: #first #from:to:do: #from:to:keysAndValuesDo: #indexOf: #indexOf:ifAbsent: #indexOfSubCollection:startingAt: #indexOfSubCollection:startingAt:ifAbsent: #keysAndValuesDo: #last #max: #min: #reverse #reverseDo: #sameAs: #subStrings: #with:do:)!
UtfEncodedString methodProtocol: #String attributes: #(#ansi #readOnly) selectors: #(#, #< #<= #> #>= #after: #allSatisfy: #anySatisfy: #asArray #asBag #asByteArray #asLowercase #asOrderedCollection #asSet #asSortedCollection #asSortedCollection: #asString #asSymbol #asUppercase #at: #at:ifAbsent: #at:put: #atAll:put: #atAllPut: #before: #between:and: #collect: #copyFrom:to: #copyReplaceAll:with: #copyReplaceFrom:to:with: #copyReplaceFrom:to:withObject: #copyReplacing:withObject: #copyWith: #copyWithout: #detect: #detect:ifNone: #do: #do:separatedBy: #findFirst: #findLast: #first #from:to:do: #from:to:keysAndValuesDo: #includes: #indexOf: #indexOf:ifAbsent: #indexOfSubCollection:startingAt: #indexOfSubCollection:startingAt:ifAbsent: #inject:into: #isEmpty #keysAndValuesDo: #last #max: #min: #notEmpty #occurrencesOf: #rehash #reject: #replaceFrom:to:with: #replaceFrom:to:with:startingAt: #replaceFrom:to:withObject: #reverse #reverseDo: #sameAs: #select: #size #subStrings: #with:do:)!

!UtfEncodedString class methodsFor!

codePage
	^self subclassResponsibility!

encode: aCharacter on: aPuttableStream
	^self subclassResponsibility!

new: aSmallInteger
	^self subclassResponsibility!

new: elementCount withAll: elementValue
	"Answer a new instance of the receiver with <integer>, elementCount, 
	elements, each of which is initialized to the <Object>, elementValue.
	Note that the result will be of size elementCount * codeUnitsFor(elementValue)."

	| stream |
	stream := self writeStream: elementCount.
	elementCount timesRepeat: [stream nextPut: elementValue].
	^stream contents!

newFixed: aSmallInteger
	^self subclassResponsibility!

with: element1
	"Answer a new instance of the receiver containing the single <Character> element, element1."

	^(self writeStream: 1)
		nextPut: element1;
		contents!

with: element1 with: element2
	"Answer an instance of the receiver containing the <Character> arguments as its elements"

	^(self writeStream: 2)
		nextPut: element1;
		nextPut: element2;
		contents!

with: element1 with: element2 with: element3
	"Answer an instance of the receiver containing the <Character> arguments as its elements"

	^(self writeStream: 3)
		nextPut: element1;
		nextPut: element2;
		nextPut: element3;
		contents!

with: element1 with: element2 with: element3 with: element4
	"Answer an instance of the receiver containing the <Character> arguments as its elements"

	^(self writeStream: 4)
		nextPut: element1;
		nextPut: element2;
		nextPut: element3;
		nextPut: element4;
		contents!

with: element1 with: element2 with: element3 with: element4 with: element5
	"Answer an instance of the receiver containing the <Character> arguments as its elements.
	N.B. This is not an ANSI standard method (up to 4 elements are supported by <Array factory>
	#with:&c messages, for more one must use #withAll:)."

	^(self writeStream: 5)
		nextPut: element1;
		nextPut: element2;
		nextPut: element3;
		nextPut: element4;
		nextPut: element5;
		contents!

withAll: newElements
	"Answer a new instance of the receiver containing all of the <Character> elements of the
	<collection> newElements."

	| stream |
	stream := self writeStream: 10.
	newElements do: [:each | stream nextPut: each].
	^stream contents! !
!UtfEncodedString class categoriesFor: #codePage!constants!public! !
!UtfEncodedString class categoriesFor: #encode:on:!helpers!private! !
!UtfEncodedString class categoriesFor: #new:!instance creation!public! !
!UtfEncodedString class categoriesFor: #new:withAll:!instance creation!public! !
!UtfEncodedString class categoriesFor: #newFixed:!instance creation!public! !
!UtfEncodedString class categoriesFor: #with:!instance creation!public! !
!UtfEncodedString class categoriesFor: #with:with:!instance creation!public! !
!UtfEncodedString class categoriesFor: #with:with:with:!instance creation!public! !
!UtfEncodedString class categoriesFor: #with:with:with:with:!instance creation!public! !
!UtfEncodedString class categoriesFor: #with:with:with:with:with:!instance creation!public! !
!UtfEncodedString class categoriesFor: #withAll:!instance creation!public! !

