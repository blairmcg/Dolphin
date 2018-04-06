"Filed out from Dolphin Smalltalk 7"!

String variableByteSubclass: #Utf32String
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Utf32String guid: (GUID fromString: '{4c1290ce-1711-4dcd-86c0-6ca89b5b9287}')!
Utf32String isNullTerminated: true!
Utf32String comment: 'Utf32String is the class of <Strings>s that use the four byte UTF-32 encoding.

UTF-32 has the advantage of being a fixed-width encoding - one code unit equates to one code point. This means it fits without issue into the Smalltalk SequenceableCollection hierarchy. However, it has the significant disadvantage of consuming four bytes for every character. This is very wasteful, especially as a Unicode code point requires only 21-bits, so a byte is wasted even for characters beyond the basic multi-lingual plane.

** This class is a placeholder. The implementation is unfinished **'!
!Utf32String categoriesForClass!Collections-Text! !
!Utf32String methodsFor!

byteSize
	"Private - Answer the size in bytes of this object. N.B. this includes a null terminator,
	which may be of 1, 2, or 4 bytes length (see class #elementSize)."

	^self basicSize + 1 << 2!

stbSaveOn: anSTBOutFiler
	"At present this is needed because STB doesn't work correctly with quad-byte objects. It
	is may be desirable, anyway, to save as UTF-8 to save space, and the intention is that
	Utf8String and Utf32String instances be largely interchangeable."

	^self asUtf8String stbSaveOn: anSTBOutFiler!

trimNulls
	"Answer a copy of the receiver with trailing nulls removed."

	^Error notYetImplemented! !
!Utf32String categoriesFor: #byteSize!accessing!private! !
!Utf32String categoriesFor: #stbSaveOn:!binary filing!public! !
!Utf32String categoriesFor: #trimNulls!copying!public! !

!Utf32String class methodsFor!

decode: anInteger
	"Answer a <Character> that corresponds to the UTF-32 code unit (i.e. a Unicode code point),
	anInteger."

	^Character codePoint: anInteger!

decodeNextFrom: aReadStream
	"Read the next <Character> in the receiver's encoding from the <ReadStream> argument ."

	^Character value: aReadStream basicNext!

elementSize
	"Answer the size of the elements of the receiver in bytes."

	^4!

emitEncodingMarkerOn: aPositionableStream
	"Emit any encoding marker used for the stream encoding this collection represents onto the
	<PositionableStream> argument, which is assumed to be at the start of its sequence. This
	typically only relevant to string encodings, so there is nothing to do by default."

	^Error notYetImplemented!

encodeOn: aWriteStream put: aCharacter
	"Encode the <Character> argument onto the <WriteStream> argument using the character
	encoding of the receiver. In this case the underlying representation is UTF-32, so can
	always directly encode the full Unicode code point of the character in one 4-byte code
	unit."

	^aWriteStream basicNextPut: aCharacter codePoint!

fromString: aString
	"Answer an instance of the receiver containing the same characters as the argument, aString."

	^Error notYetImplemented!

initialize
	empty := self new
				isImmutable: true;
				yourself.
	"VMLibrary default registryAt: #Utf32String put: self."
	self extraInstanceSpec: EncodingUtf32!

skipEncodingMarkerFrom: aGettableStream
	"Skip over any encoding marker used for the stream encoding this collection represents on the <gettableStream> argument, which 
	is assumed to be at the start of its sequence."

	^Error notYetImplemented! !
!Utf32String class categoriesFor: #decode:!encode/decode!public! !
!Utf32String class categoriesFor: #decodeNextFrom:!encode/decode!public! !
!Utf32String class categoriesFor: #elementSize!constants!public! !
!Utf32String class categoriesFor: #emitEncodingMarkerOn:!encode/decode!public! !
!Utf32String class categoriesFor: #encodeOn:put:!encode/decode!public! !
!Utf32String class categoriesFor: #fromString:!instance creation!public! !
!Utf32String class categoriesFor: #initialize!development!initializing!public! !
!Utf32String class categoriesFor: #skipEncodingMarkerFrom:!encode/decode!public! !

