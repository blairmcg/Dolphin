﻿"Filed out from Dolphin Smalltalk 7"!

Object subclass: #AXMethodName
	instanceVariableNames: 'keywords argumentNames indices'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AXMethodName guid: (GUID fromString: '{fdfdeb82-6021-4e02-9882-cc75d3a22b22}')!
AXMethodName comment: ''!
!AXMethodName categoriesForClass!Kernel-Objects! !
!AXMethodName methodsFor!

argumentCount
	^argumentNames size!

argumentNames
	^argumentNames!

indices
	^indices!

keywords
	^keywords!

primary
	^keywords first!

printOn: aPuttableStream
	aPuttableStream basicPrint: self; nextPut: $(.
	self printSignatureOn: aPuttableStream.
	aPuttableStream nextPut: $)!

printSelectorOn: aPuttableStream
	keywords do: [:each | aPuttableStream nextPutAll: each]!

printSignatureOn: aPuttableStream
	"Emit the method signature described by the receiver to the <puttableStream> argument."

	argumentNames isEmpty 
		ifTrue: 
			["Unary selector"

			aPuttableStream nextPutAll: keywords first]
		ifFalse: 
			[| first |
			first := true.
			keywords with: argumentNames
				do: 
					[:eachKeyword :eachArgument | 
					first ifTrue: [first := false] ifFalse: [aPuttableStream space].
					aPuttableStream
						nextPutAll: eachKeyword;
						space;
						display: eachArgument]]!

selector
	| stream |
	stream := String writeStream: 80.
	self printSelectorOn: stream.
	^stream contents asSymbol!

setKeywords: keywordsCollection argumentNames: argsCollection indices: indexCollection 
	self assert: 
			[keywordsCollection size = argsCollection size or: 
					[argsCollection isEmpty 
						and: [keywordsCollection size = 1 and: [keywordsCollection first last ~~ $:]]]].
	keywords := keywordsCollection.
	argumentNames := argsCollection.
	indices := indexCollection.
	^self! !
!AXMethodName categoriesFor: #argumentCount!accessing!public! !
!AXMethodName categoriesFor: #argumentNames!accessing!public! !
!AXMethodName categoriesFor: #indices!accessing!public! !
!AXMethodName categoriesFor: #keywords!accessing!public! !
!AXMethodName categoriesFor: #primary!accessing!public! !
!AXMethodName categoriesFor: #printOn:!printing!public! !
!AXMethodName categoriesFor: #printSelectorOn:!printing!public! !
!AXMethodName categoriesFor: #printSignatureOn:!printing!public! !
!AXMethodName categoriesFor: #selector!accessing!public! !
!AXMethodName categoriesFor: #setKeywords:argumentNames:indices:!initializing!private! !

!AXMethodName class methodsFor!

icon
	"Answers an <Icon> that can be used to represent this class"

	^AXTypeLibraryAnalyzer icon!

keywords: keywordsCollection argumentNames: argumentsCollection indices: indexCollection
	^self new 
		setKeywords: keywordsCollection
		argumentNames: argumentsCollection
		indices: indexCollection! !
!AXMethodName class categoriesFor: #icon!constants!development!public! !
!AXMethodName class categoriesFor: #keywords:argumentNames:indices:!instance creation!public! !

