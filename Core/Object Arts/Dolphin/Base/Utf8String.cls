"Filed out from Dolphin Smalltalk 7"!

UtfEncodedString variableByteSubclass: #Utf8String
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Utf8String guid: (GUID fromString: '{c5ab1b05-241f-4955-8b44-0c80b93bafbb}')!
Utf8String isNullTerminated: true!
Utf8String comment: 'Utf8String is a nascent class to support UTF8 encoded byte character strings.'!
!Utf8String categoriesForClass!Collections-Text! !
!Utf8String methodsFor!

asLowercase
	"Answer a <readableString> which is a copy of the receiver but with the contents converted
	to lowercase."

	| utf16 |
	#todo.	"Provide a more efficient implementation"
	utf16 := self asUtf16String.
	UserLibrary default stringLowerW: utf16.
	^utf16 asUtf8String!

asUppercase
	"Answer a <readableString> which is a copy of the receiver but with the contents converted
	to uppercase."

	| utf16 |
	#todo.	"Provide a more efficient implementation"
	utf16 := self asUtf16String.
	UserLibrary default stringUpperW: utf16.
	^utf16 asUtf8String!

asUtf8String
	"Answer a UTF8 encoded string representation of the receiver."

	^self!

at: anInteger encode: aCharacter
	"Encode the specified <Character> beginning at the specified position in the receiver.
	Answer the number of slots consumed by the encoded representation."

	| codePoint |
	codePoint := aCharacter codePoint.
	^codePoint < 16r80
		ifTrue: 
			[self basicAt: anInteger put: codePoint.
			1]
		ifFalse: 
			[codePoint < 16r800
				ifTrue: 
					["2-byte encoding"
					self
						basicAt: anInteger put: (16rC0 bitOr: (codePoint bitShift: -6));
						basicAt: anInteger + 1 put: (16r80 bitOr: (codePoint bitAnd: 16r3F)).
					2]
				ifFalse: 
					[codePoint < 16rFFFF
						ifTrue: 
							["3-byte encoding"
							self
								basicAt: anInteger put: (16rE0 bitOr: (codePoint bitShift: -12));
								basicAt: anInteger + 1 put: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
								basicAt: anInteger + 2 put: (16r80 bitOr: (codePoint bitAnd: 16r3F)).
							3]
						ifFalse: 
							["4-byte encoding"
							codePoint <= Win32Constants.MAX_UCSCHAR
								ifTrue: 
									[self
										basicAt: anInteger put: (16rF0 bitOr: (codePoint bitShift: -18));
										basicAt: anInteger + 1 put: (16r80 bitOr: ((codePoint bitShift: -12) bitAnd: 16r3F));
										basicAt: anInteger + 2 put: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
										basicAt: anInteger + 3 put: (16r80 bitOr: (codePoint bitAnd: 16r3F)).
									4]
								ifFalse: [self class errorInvalidCodePoint: codePoint]]]]!

copyToBuffer: anAddress ofSize: anInteger
	CRTLibrary default
		strncpy_s: anAddress
		bufferSize: anInteger
		strSource: self
		count: CRTConstants._TRUNCATE!

maxEncoding
	^4! !
!Utf8String categoriesFor: #asLowercase!converting!public! !
!Utf8String categoriesFor: #asUppercase!converting!public! !
!Utf8String categoriesFor: #asUtf8String!converting!public! !
!Utf8String categoriesFor: #at:encode:!accessing!public! !
!Utf8String categoriesFor: #copyToBuffer:ofSize:!copying!private! !
!Utf8String categoriesFor: #maxEncoding!constants!private! !

!Utf8String class methodsFor!

codePage
	^Win32Constants.CP_UTF8!

encode: aCharacter on: aPuttableStream
	| codePoint |
	codePoint := aCharacter codePoint.
	^codePoint < 16r80
		ifTrue: [aPuttableStream nextPut: codePoint]
		ifFalse: 
			[codePoint < 16r800
				ifTrue: 
					["2-byte encoding"
					aPuttableStream
						nextPut: (16rC0 bitOr: (codePoint bitShift: -6));
						nextPut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]
				ifFalse: 
					[codePoint < 16rFFFF
						ifTrue: 
							["3-byte encoding"
							aPuttableStream
								nextPut: (16rE0 bitOr: (codePoint bitShift: -12));
								nextPut: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
								nextPut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]
						ifFalse: 
							["4-byte encoding"
							codePoint <= Win32Constants.MAX_UCSCHAR
								ifTrue: 
									[aPuttableStream
										nextPut: (16rF0 bitOr: (codePoint bitShift: -18));
										nextPut: (16r80 bitOr: ((codePoint bitShift: -12) bitAnd: 16r3F));
										nextPut: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
										nextPut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]
								ifFalse: [self errorInvalidCodePoint: codePoint]]]]!

fromString: aString
	"Answer an instance of the receiver containing the same characters as the argument, aString."

	^aString asUtf8String!

initialize
	empty := self new
				isImmutable: true;
				yourself.
	VMLibrary default registryAt: #Utf8String put: self!

new: aSmallInteger
	"Answer a new instance of the receiver of sufficient size to hold the specified number of code units."

	<primitive: 71>
	^self primitiveFailed!

newFixed: aSmallInteger
	"Answer an instance of the receiver of size aSmallInteger bytes (this method is 
	only valid for byte objects). The object is allocated from the fixed memory heap
	and will not move in memory (objects allocated with primitive 71 are free to 
	move to assist garbage collection, whereas those allocated with primitive 76 
	are in a traditional fixed heap)."

	<primitive: 76>
	^self primitiveFailed! !
!Utf8String class categoriesFor: #codePage!instance creation!public! !
!Utf8String class categoriesFor: #encode:on:!helpers!private! !
!Utf8String class categoriesFor: #fromString:!instance creation!public! !
!Utf8String class categoriesFor: #initialize!development!initializing!public! !
!Utf8String class categoriesFor: #new:!instance creation!public! !
!Utf8String class categoriesFor: #newFixed:!instance creation!public! !

