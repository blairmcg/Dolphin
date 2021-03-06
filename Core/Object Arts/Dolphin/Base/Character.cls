﻿"Filed out from Dolphin Smalltalk 7"!

Magnitude subclass: #Character
	instanceVariableNames: 'code'
	classVariableNames: 'AnsiCharacters AnsiCodePage AnsiCodePoints CharacterSet EncodingMask EscapeChars Utf16Mask Utf32Mask Utf8Default Utf8Mask Utf8TrailMask'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
Character guid: (GUID fromString: '{87b4c651-026e-11d3-9fd7-00a0cc3e4a32}')!
Character addClassConstant: 'EncodingMask' value: 1056964608!
Character addClassConstant: 'EscapeChars' value: #($0 nil nil nil nil nil nil $a $b $t $n $v $f $r)!
Character addClassConstant: 'Utf16Mask' value: 33554432!
Character addClassConstant: 'Utf32Mask' value: 50331648!
Character addClassConstant: 'Utf8Mask' value: 16777216!
Character addClassConstant: 'Utf8TrailMask' value: 192!
Character comment: 'Character is the class of objects which serve as the elemental values of Smalltalk Strings. Each Character instance represents a specific Unicode code point. The instances for the first 256 code points are unique. Smalltalk characters have a literal syntax which is the $ symbol followed by the normal printed representation of the character. Dolphin also supports the following escaped literal formats to provide a literal representation of any character:
	$\0	- Null
	$\a	- Bell
	$\b	- Backspace
	$\t	- Tab
	$\n	- Newline
	$\v	- Vertical tab
	$\f	- Form Feed
	$\r	- Carriage return
	$\x<HHHH> - where <HHHH> is the hex representation of the character''s code point - can be used to represent any character.

At present only byte characters (that are not control characters) have a printable representation, at least within the IDE.
'!
!Character categoriesForClass!Magnitude-General! !
!Character methodsFor!

_beginsString: aString
	^aString readStream peek = self!

_separateSubStringsIn: tokens
	"Private - Answer the sub-strings of the <readableString> argument
	 separated by the receiver.
	Implementation Note: Although this routine is rather more complex than
	it need be, the performance of #subStrings(:) is important, so it pays
	to optimize this routine. In particular we try to avoid performing any
	work in the common cases where the string is either empty, or does not
	contain the separator at all. However, we must be careful not to over 
	optimize and prevent correct operation for wide (Unicode) strings."

	| start answer size end |
	size := tokens size.
	size == 0 ifTrue: [^Array new].
	end := tokens
				nextIndexOf: self
				from: 1
				to: size.
	end == 0 ifTrue: [^{tokens}].
	answer := Array writeStream: 5.
	start := 1.
	
	[answer nextPut: (tokens copyFrom: start to: end - 1).
	start := end + 1.
	end := tokens
				nextIndexOf: self
				from: start
				to: size.
	end == 0]
			whileFalse.
	"Copy any remaining chars after the last separator"
	start <= size ifTrue: [answer nextPut: (tokens copyFrom: start to: size)].
	^answer contents!

< aCharacter
	"Answer whether the receiver is less than the parameter aCharacter."

	^self codePoint < aCharacter asInteger
!

= comperand
	"Answer whether the receiver is the sames as the parameter, comperand.
	There is a unique Character instance for each possible byte-character value,
	but the instances are not unique for codepoints > 255."

	^self == comperand or: [comperand class == Character and: [comperand code == code]]!

> aCharacter
	"Answer whether the receiver is greater than the parameter aCharacter."

	^self codePoint > aCharacter asInteger
!

ansiValue
	"Answers the ansi character value of the receiver."

	^code <= 16rFF ifTrue: [code] ifFalse: [self error: 'Non-ansi code point']!

appendToStream: puttableStream
	"Private - Append the receiver's elements to the argument, puttableStream.
	Answer the receiver.
	Implementation note: Double dispatched from streams."

	puttableStream nextPut: self!

asAnsiString
	"Answer a new ANSI-encoded <String> whose sole element is the receiver. It is an error if
	the receiver's code point cannot be represented in ANSI encoding."

	^AnsiString with: self!

asciiValue
	"Answers the ascii character value of the receiver."

	^code < 128 ifTrue: [code] ifFalse: [self error: 'Non-ascii code point']!

asInteger
	"Answer the <integer> character encoding (i.e. the Unicode code point) that the receiver
	represents."

	^self codePoint!

asLowercase
	"Answer a <Character> which is the lowercase equivalent of the receiver."

	"Implementation Note: Apart from the ANSI asLowercase character mappings (basically all the
	uppercase letters are mapped to lowercase letters), this implementation will map other
	characters, depending on the configured locale of the host OS."

	| ucp |
	^(ucp := self codePoint) <= 16rFFFF
		ifTrue: [self class codePoint: (UserLibrary default charLower: ucp)]
		ifFalse: [self]!

asString
	"Answer a new <String> whose sole element is the receiver."

	^Utf8String with: self!

asSymbol
	"Answer the Symbol representation of the receiver."

	^Symbol internCharacter: self!

asUppercase
	"Answer a <Character> which is the uppercase equivalent of the receiver."

	"Implementation Note: Apart from the ASCII asUppercase character mappings (basically all the
	lowercase letters are mapped to uppercase letters), this implementation will map other
	characters, depending on the configured locale of the host OS."

	| ucp |
	^(ucp := self codePoint) <= 16rFFFF
		ifTrue: [self class codePoint: (UserLibrary default charUpper: ucp)]
		ifFalse: [self]!

asUtf16String
	"Answer a new UTF-16 encoded <String> whose sole element is the receiver."

	^Utf16String with: self!

asUtf8String
	"Answer a new <Utf8String> encoding the receiver's code point."

	^Utf8String with: self!

basicEncoding
	"Private - Answer the <integer> encoding of the character, which will be one of the String encoding constants."

	^code bitShift: -24!

basicShallowCopy
	"Answer the receiver as Characters are immutable."

	^self!

code
	^code!

codePoint
	"Answer the <integer> Unicode code point that the receiver represents. If the receiver is a 
	UTF-8 or UTF-16 surrogate (partial character) this may not be a valid Unicode code point."

	"Note that Dolphin will prefer to return an ANSI encoded character from the pre-allocated
	set of 256 ANSI characters, or a UTF-32 encoded character for code points outside the ANSI
	character set. Characters encounted when streaming or enumerating over any type of string
	(including Utf8String and Utf16String) will always be either be either ANSI encoded or
	UTF-32 encoded. UTF-32 encoded characters represent a full code point. However, in the case
	of code that directly performs indexed access into a Utf8String or Utf16String, the VM may
	return UTF-8 or UTF16- surrogates (respectively). These surrogates are really only valid for
	use with further strings of their native encoding, as they do not represent a complete code
	point and cannot be translated to another encoding without their companion surrogates."

	^code <= 16rFF
		ifTrue: [AnsiCodePoints at: code +1]
		ifFalse: 
			["If this is a UTF-8 or UTF-16 surrogate, the code point will be invalid"
			code bitAnd: 16r1FFFFF]!

codeUnit
	"Answer the <integer> character code for the character in its native encoding. This can
	never be greater than 16r10FFFF, which is the maximum Unicode code point."

	^code bitAnd: 16r1FFFFF!

deepCopy
	"Answer the receiver, as Characters are immutable"

	^self!

digitValue
	"Answer the digit representation of the receiver. 'digit' is defined as either 0-9, or
	uppercase A-Z (for 10-35)."

	"Note: In versions of Dolphin prior to 3.0 this raised an error if the character was not a
	valid digit character, but for compatibility with VW it now returns -1. The method is now
	optimized for improved performance too."

	^code > ##($Z codePoint)
		ifTrue: [-1]
		ifFalse: 
			[(#[0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 2 3 4 5 6 7 8 9 10 0 0 0 0 0 0 0 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36]
				at: code + 1) - 1]!

displayOn: aStream
	"Append the end-user display representation of the receiver to aStream."

	aStream nextPut: self!

encoding
	"Answer a <Symbol> naming the encoding of the character, which will be one of #ansi, #utf8, #utf16 or #utf32."

	^String encodingName: self basicEncoding!

hash
	"Answer the <SmallInteger> hash value for the receiver."

	^self codePoint!

isAlphaNumeric
	"Answer whether the receiver is a letter or a digit."

	^UserLibrary default isCharAlphaNumeric: self!

isAscii
	"Answer whether the receiver is an ascii character"

	^(code bitAnd: 16r1FFFFF) < 16r80!

isAtomic
	"Answer whether or not the receiver is the single unique instance of its class that
	represents its value."

	"Byte characters are atomic"

	^code <= 255!

isCharacter
	"Answer whether the receiver conforms to the <Character> protocol."

	^true!

isControl
	"Answer whether the receiver is a control character."

	^CRTLibrary default iswcntrl: self!

isDigit
	"Answer whether the receiver is a representation of a decimal-digit character
	(i.e. it is one of $0 $1 $2 $3 $4 $5 $6 $7 $8 $9)."

	^code >= ##($0 codePoint) and: [code <= ##($9 codePoint)]!

isEnglishLetter
	"Answer whether the receiver is a letter from the English alphabet."

	| codePoint |
	^(codePoint := self codePoint) <= ##($z codePoint) and: 
			[codePoint >= ##($A codePoint)
				and: [codePoint >= ##($a codePoint) or: [codePoint <= ##($Z codePoint)]]]!

isGraph
	"Answer whether the receiver is a printable character other than a space."

	#todo. "The CRT functions for character classificiation don't work correctly for characters outside the BMP"
	^CRTLibrary default iswgraph: self!

isHexDigit
	"Answer whether the receiver is a valid Smalltalk hexadecimal digit (i.e. digits and the
	uppercase characters A through F)."

	^self isDigit or: [code >= ##($A codePoint) and: [code <= ##($F codePoint)]]!

isLetter
	"Answer whether the receiver is an alphabetic character."

	^UserLibrary default isCharAlpha: self
!

isLinefeed
	"Answer whether the receiver is the line-feed character."

	^self == $\n!

isLiteral
	"Answer whether the receiver has a literal representation which is directly recognised by
	the Compiler."

	"In Dolphin this is always true because we have an escaped code point literal form."

	^true!

isLowercase
	"Answer whether the receiver is a lowercase letter."

	^UserLibrary default isCharLower: self!

isLowerCase
	"Answer whether the receiver is a lowercase letter."

	^self isLowercase!

isPrintable
	"Answer whether the receiver is a printable character."

	#todo. "The CRT functions for character classificiation don't work correctly for characters outside the BMP"
	^CRTLibrary default iswprint: self!

isPunctuation
	"Answer whether the receiver is a punctuation character."

	#todo. "The CRT functions for character classificiation don't work correctly for characters outside the BMP"
	^CRTLibrary default iswpunct: self!

isSeparator
	"Answer whether the receiver is an ASCII separator character (i.e. whitespace)."

	^code == 32 or: [code >= 9 and: [code <= 13]]!

isSurrogate
	"Answer whether the receiver is a leading or trailing code unit of a multi-code unit character in it's encoding."

	^self isUtf16Surrogate or: [self isUtf8Surrogate]!

isUppercase
	"Answer whether the receiver is an uppercase letter."

	^UserLibrary default isCharUpper: self!

isUpperCase
	"Answer whether the receiver is an uppercase letter."

	^self isUppercase
!

isUtf16Lead
	"Answer whether the receiver is a UTF-16 lead surrogate (leading code unit of two part character)."

	^(code bitAnd: 16rFFFC00) == 16rD800!

isUtf16Surrogate
	"Answer whether the receiver is a UTF-16 surrogate (partial character)."

	^(code bitAnd: 16rFFF800) == 16rD800!

isUtf16Trail
	"Answer whether the receiver is a UTF-16 lead surrogate (leading code unit of two part character)."

	^(code bitAnd: 16rFFFC00) == 16rDC00!

isUtf8
	"Answer whether the receiver is a UTF-8 code unit."

	^code < 16r80 or: [(code bitAnd: EncodingMask) == Utf8Mask]!

isUtf8Lead
	"Answer whether the receiver is a UTF-8 leading byte."

	^(code bitAnd: EncodingMask) == Utf8Mask and: [code allMask: 2r11000000]!

isUtf8Surrogate
	"Answer whether the receiver is a UTF-8 surrogate (partial character)."

	^(code bitAnd: EncodingMask | 16r80) == ##(Utf8Mask | 16r80)!

isUtf8Trail
	"Answer whether the receiver is a UTF-8 trailing byte."

	^(code bitAnd: ##(EncodingMask | Utf8TrailMask)) == ##(Utf8Mask | 16r80)!

isVowel
	"Answer whether the receiver is an English vowel (a, e, i, o, or u).
	This test is case insensitive."

	^'aAeEiIoOuU' identityIncludes: self!

isWhitespace
	"Answer whether the receiver is a white space character.
	This is a synonym for #isSeparator as currently defined."

	^self isSeparator!

printOn: aStream
	"Append the literal representation of the receiver to the <puttableStream> argument."

	| codePoint |
	aStream nextPut: $$.
	codePoint := self codePoint.
	(codePoint > 32 and: [codePoint < 127 or: [codePoint <= 255 and: [self isGraph]]])
		ifTrue: [aStream nextPut: self]
		ifFalse: 
			[aStream nextPut: $\.
			(EscapeChars lookup: codePoint + 1)
				ifNotNil: [:char | aStream nextPut: char]
				ifNil: 
					[aStream nextPut: $x.
					codePoint
						printOn: aStream
						base: 16
						showRadix: false]]!

shallowCopy
	"Answer the receiver, as Characters are immutable."

	^self! !
!Character categoriesFor: #_beginsString:!comparing!double dispatch!private! !
!Character categoriesFor: #_separateSubStringsIn:!double dispatch!private! !
!Character categoriesFor: #<!comparing!public! !
!Character categoriesFor: #=!comparing!public! !
!Character categoriesFor: #>!comparing!public! !
!Character categoriesFor: #ansiValue!accessing!public! !
!Character categoriesFor: #appendToStream:!double dispatch!private! !
!Character categoriesFor: #asAnsiString!converting!public! !
!Character categoriesFor: #asciiValue!accessing!public! !
!Character categoriesFor: #asInteger!converting!public! !
!Character categoriesFor: #asLowercase!converting!public! !
!Character categoriesFor: #asString!converting!public! !
!Character categoriesFor: #asSymbol!converting!public! !
!Character categoriesFor: #asUppercase!converting!public! !
!Character categoriesFor: #asUtf16String!converting!public! !
!Character categoriesFor: #asUtf8String!converting!public! !
!Character categoriesFor: #basicEncoding!accessing!private! !
!Character categoriesFor: #basicShallowCopy!copying!public! !
!Character categoriesFor: #code!accessing!private! !
!Character categoriesFor: #codePoint!accessing!public! !
!Character categoriesFor: #codeUnit!accessing!public! !
!Character categoriesFor: #deepCopy!copying!public! !
!Character categoriesFor: #digitValue!accessing!public! !
!Character categoriesFor: #displayOn:!printing!public! !
!Character categoriesFor: #encoding!accessing!public! !
!Character categoriesFor: #hash!comparing!public! !
!Character categoriesFor: #isAlphaNumeric!public!testing! !
!Character categoriesFor: #isAscii!public!testing! !
!Character categoriesFor: #isAtomic!public!testing! !
!Character categoriesFor: #isCharacter!public!testing! !
!Character categoriesFor: #isControl!public!testing! !
!Character categoriesFor: #isDigit!public!testing! !
!Character categoriesFor: #isEnglishLetter!public!testing! !
!Character categoriesFor: #isGraph!public!testing! !
!Character categoriesFor: #isHexDigit!public!testing! !
!Character categoriesFor: #isLetter!public!testing! !
!Character categoriesFor: #isLinefeed!public!testing! !
!Character categoriesFor: #isLiteral!public!testing! !
!Character categoriesFor: #isLowercase!public!testing! !
!Character categoriesFor: #isLowerCase!public!testing! !
!Character categoriesFor: #isPrintable!public!testing! !
!Character categoriesFor: #isPunctuation!public!testing! !
!Character categoriesFor: #isSeparator!public!testing! !
!Character categoriesFor: #isSurrogate!public!testing! !
!Character categoriesFor: #isUppercase!public!testing! !
!Character categoriesFor: #isUpperCase!public!testing! !
!Character categoriesFor: #isUtf16Lead!public!testing! !
!Character categoriesFor: #isUtf16Surrogate!public!testing! !
!Character categoriesFor: #isUtf16Trail!public!testing! !
!Character categoriesFor: #isUtf8!public!testing! !
!Character categoriesFor: #isUtf8Lead!public!testing! !
!Character categoriesFor: #isUtf8Surrogate!public!testing! !
!Character categoriesFor: #isUtf8Trail!public!testing! !
!Character categoriesFor: #isVowel!public!testing! !
!Character categoriesFor: #isWhitespace!public!testing! !
!Character categoriesFor: #printOn:!printing!public! !
!Character categoriesFor: #shallowCopy!copying!public! !

Character methodProtocol: #Character attributes: #(#ansi #readOnly) selectors: #(#asLowercase #asString #asUppercase #codePoint #isAlphaNumeric #isDigit #isLetter #isLowercase #isUppercase)!

!Character class methodsFor!

ansiValue: anInteger
	^(CharacterSet lookup: anInteger + 1)
		ifNil: [self error: 'Invalid ANSI code unit: ' , anInteger printString]!

asciiValue: anInteger
	^(anInteger >= 0 and: [anInteger <= 127])
		ifTrue: [CharacterSet at: anInteger + 1]
		ifFalse: [self error: 'Invalid ASCII code point: ' , anInteger printString]!

backspace
	"Answer the backspace control <Character>."

	^$\b
!

basicNew
	"Characters should not be instantiated directly; they can be created by literal references,
	by operations on other Characters or Strings, or with the Character>>value: message."

	^self shouldNotImplement!

byteCharacterSet
	"Answer the ANSI character set, i.e. the complete set of Characters that can be encoded in an <AnsiString>."

	^CharacterSet!

codePoint: integer
	"Answer a <Character> representing the specified <integer> Unicode code point.
	Raise an error if the argument is not a valid Unicode character code point."

	^integer < 16r80
		ifTrue: [CharacterSet at: integer + 1]
		ifFalse: 
			[(AnsiCharacters lookup: integer)
				ifNil: 
					[(self isValidCodePoint: integer)
						ifTrue: [(self newCode: (Utf32Mask bitOr: integer)) isImmutable: true]
						ifFalse: [self error: 'Invalid code point ' , integer hex]]]!

cr
	"Answer the carriage return control <Character>."

	^$\r!

digitValue: anInteger
	"Answer the <Character> that represents the specified digit. 0-9 map to $0-$9, 10-35 map to
	$A-$Z. If anInteger is not in the range 0..35, then the String #at: will fail with a bounds
	error."

	^'0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ' at: anInteger+1!

dolphin
	"Answer a <Character> representing the Dolphin symbol, i.e. Unicode code point U+1F42C."

	"Like most symbolic code points, this is outside the basic multi-lingual plane, and so requires
	multi-part UTF encodings (4x 8-bit code units in UTF-8 and 2x 16-bit code units in UTF-16),
	making it useful for testing."

	^$\x1F42C!

eof
	"Answer the EOF (Ctrl+Z) control <Character>.
	DOS interprets this character as marking the end of a file."

	^$\x1A!

esc
	"Answer the escape control <Character>."

	^$\x1B!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon!

initialize
	self addClassConstant: 'CharacterSet'
		value: ((AnsiString fromByteArray: (0 to: 255) asByteArray)
				isImmutable: true;
				yourself).
	self addClassConstant: 'EscapeChars'
		value: ((Array new: 14)
				at: 0 + 1 put: $0;
				at: 7 + 1 put: $a;
				at: 8 + 1 put: $b;
				at: 9 + 1 put: $t;
				at: 10 + 1 put: $n;
				at: 11 + 1 put: $v;
				at: 12 + 1 put: $f;
				at: 13 + 1 put: $r;
				yourself).
	self addClassConstant: 'Utf8Mask' value: String.EncodingUtf8 << 24.
	self addClassConstant: 'Utf16Mask' value: String.EncodingUtf16 << 24.
	self addClassConstant: 'Utf32Mask' value: String.EncodingUtf16 << 24.
	self addClassConstant: 'EncodingMask' value: 2r111111 << 24.
	self addClassConstant: 'Utf8TrailMask' value: 16rC0.!

isValidCodePoint: anInteger
	"Answer whether the <integer> argument represents a valid Unicode code point. Invalid code
	points are those outside the range 0..0x10FFFF, or within that range but non-characters."

	#todo.	"This is not complete"
	^anInteger <= Win32Constants.MAX_UCSCHAR and: [(anInteger bitAnd: 16rFFFE) ~~ 16rFFFE]!

lf
	"Answer the linefeed control <Character>."

	^$\n!

new
	"Characters should not be instantiated directly; they can be created by literal references,
	by extraction from Strings, or from an <integer> code point."

	^self shouldNotImplement!

newCode: anInteger
	"Private - Answer a new instance of the receiver with the specified code. This should
	only be used for code points > 128."

	<primitive: 157>
	^self primitiveFailed!

newPage
	"Answer the new page control <Character>."

	^$\f!

nl
	"Answer the new line control <Character> (synonym for lf)"

	^$\n!

null
	"Answer the NULL control character"

	^$\0!

onStartup
	| utf ansiCharacters |
	AnsiCodePage := (VMLibrary default getProcAddress: 'AnsiCodePage' ifAbsent: [#[0 0 0 0]])
				dwordAtOffset: 0.
	utf := self byteCharacterSet asUtf16String.
	AnsiCodePoints := ((0 to: utf size * 2 - 1 by: 2) collect: [:each | utf wordAtOffset: each])
				isImmutable: true;
				yourself.
	ansiCharacters := IdentityDictionary new.
	Character byteCharacterSet do: [:each | ansiCharacters at: each codePoint put: each].
	ansiCharacters isImmutable: true.
	AnsiCharacters := ansiCharacters.
	Utf8Default := (CPINFOEXW codePage: Win32Constants.CP_UTF8) unicodeDefaultChar!

replacement
	"Answer the Unicode replacement <Character>, used to substitute for invalid code points and
	encodings."

	^Utf8Default!

safeCodePoint: anInteger
	"Answer a <Character> representing the specified <integer> Unicode code point, or the
	replacement Character if the code point is not the code point of a valid Unicode character."

	^anInteger < 16r80
		ifTrue: [CharacterSet at: anInteger + 1]
		ifFalse: 
			[(AnsiCharacters lookup: anInteger)
				ifNil: 
					[(self isValidCodePoint: anInteger)
						ifTrue: [(self newCode: (Utf32Mask bitOr: anInteger)) isImmutable: true]
						ifFalse: [self replacement]]]!

space
	"Answer the space <Character>."

	^$\x20!

tab
	"Answer the tab control <Character>."

	^$\t!

utf16Value: anInteger
	"Answer a <Character> representing the <integer> UTF-16 code unit, anInteger.
	Note that the resulting Character may not represent a valid Unicode code point."

	^anInteger < 16r80
		ifTrue: 
			["Ascii"
			CharacterSet at: anInteger + 1]
		ifFalse: 
			[(AnsiCharacters lookup: anInteger)
				ifNil: 
					[(anInteger >= 16rD800 and: [anInteger <= 16rDFFF])
						ifTrue: 
							["Surrogate"
							self newCode: (Utf16Mask bitOr: anInteger)]
						ifFalse: 
							[anInteger <= 16rFFFF
								ifTrue: 
									["Valid non-ascii/non-ansi code point"
									self newCode: (Utf32Mask bitOr: anInteger)]
								ifFalse: [self error: 'Invalid UTF-16 code unit: ' , anInteger printString]]]]!

utf8Value: anInteger
	"Answer a <Character> representing the <integer> UTF-8 code unit, anInteger.
	Note that the resulting Character may not represent a valid Unicode code point."

	^anInteger < 16r80
		ifTrue: 
			["Ascii"
			CharacterSet at: anInteger + 1]
		ifFalse: 
			[anInteger <= 16rFF
				ifTrue: 
					["Some kind of surrogate"
					self newCode: (Utf8Mask bitOr: anInteger)]
				ifFalse: [self error: 'Invalid UTF-8 code unit: ' , anInteger printString]]!

value: anInteger
	"Answer a <Character> representing the specified <integer> Unicode code point.
	Raise an error if the argument is not a valid Unicode character code point."

	^self codePoint: anInteger! !
!Character class categoriesFor: #ansiValue:!instance creation!public! !
!Character class categoriesFor: #asciiValue:!instance creation!public! !
!Character class categoriesFor: #backspace!constants!public! !
!Character class categoriesFor: #basicNew!instance creation!public! !
!Character class categoriesFor: #byteCharacterSet!constants!public! !
!Character class categoriesFor: #codePoint:!instance creation!public! !
!Character class categoriesFor: #cr!constants!public! !
!Character class categoriesFor: #digitValue:!instance creation!public! !
!Character class categoriesFor: #dolphin!constants!public! !
!Character class categoriesFor: #eof!constants!public! !
!Character class categoriesFor: #esc!constants!public! !
!Character class categoriesFor: #icon!constants!public! !
!Character class categoriesFor: #initialize!development!initializing!public! !
!Character class categoriesFor: #isValidCodePoint:!enquiries!public! !
!Character class categoriesFor: #lf!constants!public! !
!Character class categoriesFor: #new!instance creation!public! !
!Character class categoriesFor: #newCode:!instance creation!private! !
!Character class categoriesFor: #newPage!constants!public! !
!Character class categoriesFor: #nl!constants!public! !
!Character class categoriesFor: #null!constants!public! !
!Character class categoriesFor: #onStartup!event handling!public! !
!Character class categoriesFor: #replacement!constants!public! !
!Character class categoriesFor: #safeCodePoint:!instance creation!public! !
!Character class categoriesFor: #space!constants!public! !
!Character class categoriesFor: #tab!constants!public! !
!Character class categoriesFor: #utf16Value:!instance creation!public! !
!Character class categoriesFor: #utf8Value:!instance creation!public! !
!Character class categoriesFor: #value:!instance creation!public! !

Character class methodProtocol: #'Character factory' attributes: #(#ansi #readOnly) selectors: #(#codePoint: #cr #lf #space #tab)!

