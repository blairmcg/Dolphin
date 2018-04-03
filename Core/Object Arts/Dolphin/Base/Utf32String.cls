"Filed out from Dolphin Smalltalk 7"!

String variableByteSubclass: #Utf32String
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Utf32String guid: (GUID fromString: '{4c1290ce-1711-4dcd-86c0-6ca89b5b9287}')!
Utf32String isNullTerminated: true!
Utf32String comment: ''!
!Utf32String categoriesForClass!Collections-Text! !
!Utf32String class methodsFor!

decode: anInteger
	"Answer a <Character> that corresponds to the UTF-32 code unit (i.e. a Unicode code point),
	anInteger."

	^Character codePoint: anInteger!

elementSize
	"Answer the size of the elements of the receiver in bytes."

	^4!

encode: aCharacter on: aWriteStream
	"Encode the <Character> argument onto the <WriteStream> argument using the character
	encoding of the receiver. In this case the underlying representation is UTF-32, so can
	always directly encode the full Unicode code point of the character in one 4-byte code
	unit."

	^aWriteStream basicNextPut: aCharacter codePoint!

initialize
	empty := self new
				isImmutable: true;
				yourself.
	"VMLibrary default registryAt: #Utf32String put: self."
	self extraInstanceSpec: EncodingUtf32! !
!Utf32String class categoriesFor: #decode:!encode/decode!public! !
!Utf32String class categoriesFor: #elementSize!constants!public! !
!Utf32String class categoriesFor: #encode:on:!encode/decode!public! !
!Utf32String class categoriesFor: #initialize!development!initializing!public! !

