"Filed out from Dolphin Smalltalk 7"!

UtfEncodedString variableByteSubclass: #Utf8String
	instanceVariableNames: ''
	classVariableNames: 'LeadByteMask2 LeadByteMask3 LeadByteMask4 TrailByteMask'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Utf8String guid: (GUID fromString: '{c5ab1b05-241f-4955-8b44-0c80b93bafbb}')!
Utf8String isNullTerminated: true!
Utf8String addClassConstant: 'LeadByteMask2' value: 192!
Utf8String addClassConstant: 'LeadByteMask3' value: 224!
Utf8String addClassConstant: 'LeadByteMask4' value: 240!
Utf8String addClassConstant: 'TrailByteMask' value: 128!
Utf8String comment: 'Utf8String is a nascent class to support UTF8 encoded byte character strings.'!
!Utf8String categoriesForClass!Collections-Text! !
!Utf8String methodsFor!

asLowercase
	"Answer a <readableString> which is a copy of the receiver but with the contents converted
	to lowercase."

	#todo.	"Provide a more efficient implementation"
	^self asUtf16String asLowercase asUtf8String!

asUppercase
	"Answer a <readableString> which is a copy of the receiver but with the contents converted
	to uppercase."

	#todo.	"Provide a more efficient implementation"
	^self asUtf16String asUppercase asUtf8String!

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
						basicAt: anInteger put: (LeadByteMask2 bitOr: (codePoint bitShift: -6));
						basicAt: anInteger + 1 put: (TrailByteMask bitOr: (codePoint bitAnd: 16r3F)).
					2]
				ifFalse: 
					[codePoint < 16rFFFF
						ifTrue: 
							["3-byte encoding"
							self
								basicAt: anInteger put: (LeadByteMask3 bitOr: (codePoint bitShift: -12));
								basicAt: anInteger + 1 put: (TrailByteMask bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
								basicAt: anInteger + 2 put: (TrailByteMask bitOr: (codePoint bitAnd: 16r3F)).
							3]
						ifFalse: 
							["4-byte encoding"
							codePoint <= Win32Constants.MAX_UCSCHAR
								ifTrue: 
									[self
										basicAt: anInteger put: (LeadByteMask4 bitOr: (codePoint bitShift: -18));
										basicAt: anInteger + 1 put: (TrailByteMask bitOr: ((codePoint bitShift: -12) bitAnd: 16r3F));
										basicAt: anInteger + 2 put: (TrailByteMask bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
										basicAt: anInteger + 3 put: (TrailByteMask bitOr: (codePoint bitAnd: 16r3F)).
									4]
								ifFalse: [self class errorInvalidCodePoint: codePoint]]]]!

copyToBuffer: anAddress ofSize: anInteger
	CRTLibrary default
		strncpy_s: anAddress
		bufferSize: anInteger
		strSource: self
		count: CRTConstants._TRUNCATE!

maxEncoding
	^4!

reverse
	"Answer a copy of the receiver but with its elements in reverse order."

	| reversed i j size |
	j := size := self size.
	reversed := self class new: size.
	i := 1.
	[i <= size] whileTrue: 
			[| ch |
			ch := self basicAt: i.
			ch < TrailByteMask
				ifTrue: 
					[reversed basicAt: j put: ch.
					i := i + 1.
					j := j - 1]
				ifFalse: 
					["Now expect at least one trailing byte. The lead byte can tell us how many."
					ch < LeadByteMask3
						ifTrue: 
							[ch >= LeadByteMask2
								ifFalse: 
									["Trailing byte with no lead byte"
									^self error: 'Invalid UTF-8 string'].
							"2r110xxxxx  16rC0..16rDF   First byte of a 2-byte character encoding"
							reversed
								basicAt: j put: (self basicAt: i + 1);
								basicAt: j - 1 put: ch.
							i := i + 2.
							j := j - 2]
						ifFalse: 
							[ch < LeadByteMask4
								ifTrue: 
									["2r1110xxxx  16rE0..16rEF   First byte of a 3-byte character encoding"
									reversed
										basicAt: j put: (self basicAt: i + 2);
										basicAt: j - 1 put: (self basicAt: i + 1);
										basicAt: j - 2 put: ch.
									j := j - 3.
									i := i + 3]
								ifFalse: 
									["2r11110xxx  16rF0..16rF4   First byte of a 4-byte character encoding"
									reversed
										basicAt: j put: (self basicAt: i + 3);
										basicAt: j - 1 put: (self basicAt: i + 2);
										basicAt: j - 2 put: (self basicAt: i + 1);
										basicAt: j - 3 put: ch.
									j := j - 4.
									i := i + 4]]]].
	^reversed! !
!Utf8String categoriesFor: #asLowercase!converting!public! !
!Utf8String categoriesFor: #asUppercase!converting!public! !
!Utf8String categoriesFor: #asUtf8String!converting!public! !
!Utf8String categoriesFor: #at:encode:!accessing!public! !
!Utf8String categoriesFor: #copyToBuffer:ofSize:!copying!private! !
!Utf8String categoriesFor: #maxEncoding!constants!private! !
!Utf8String categoriesFor: #reverse!copying!public! !

!Utf8String class methodsFor!

codePage
	^Win32Constants.CP_UTF8!

encode: aCharacter on: aPuttableStream
	^aCharacter isUtf8
		ifTrue: [aPuttableStream nextBytePut: aCharacter codeUnit]
		ifFalse: 
			[| codePoint |
			codePoint := aCharacter codePoint.
			codePoint < 16r800
				ifTrue: 
					["2-byte encoding"
					aPuttableStream
						nextBytePut: (16rC0 bitOr: (codePoint bitShift: -6));
						nextBytePut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]
				ifFalse: 
					[codePoint < 16rFFFF
						ifTrue: 
							["3-byte encoding"
							(codePoint bitAnd: 16rF800) == 16rD800
								ifTrue: [self error: 'Cannot encode UTF-16 surrogate into UTF-8']
								ifFalse: 
									[aPuttableStream
										nextBytePut: (16rE0 bitOr: (codePoint bitShift: -12));
										nextBytePut: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
										nextBytePut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]]
						ifFalse: 
							["4-byte encoding"
							codePoint <= Win32Constants.MAX_UCSCHAR
								ifTrue: 
									[aPuttableStream
										nextBytePut: (16rF0 bitOr: (codePoint bitShift: -18));
										nextBytePut: (16r80 bitOr: ((codePoint bitShift: -12) bitAnd: 16r3F));
										nextBytePut: (16r80 bitOr: ((codePoint bitShift: -6) bitAnd: 16r3F));
										nextBytePut: (16r80 bitOr: (codePoint bitAnd: 16r3F))]
								ifFalse: [self errorInvalidCodePoint: codePoint]]]]!

fromString: aString
	"Answer an instance of the receiver containing the same characters as the argument, aString."

	^aString asUtf8String!

initialize
	empty := self new
				isImmutable: true;
				yourself.
	VMLibrary default registryAt: #Utf8String put: self.
	self addClassConstant: 'LeadByteMask2' value: 16rC0.
	self addClassConstant: 'LeadByteMask3' value: 16rE0.
	self addClassConstant: 'LeadByteMask4' value: 16rF0.
	self addClassConstant: 'TrailByteMask' value: 16r80!

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

