"Filed out from Dolphin Smalltalk 7"!

StValueToken subclass: #StErrorToken
	instanceVariableNames: 'code position'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
StErrorToken guid: (GUID fromString: '{b771f905-0b99-4c88-85f3-eaab853d8831}')!
StErrorToken comment: 'StErrorToken is the <StToken> class used to represent errors detected by the <SmalltalkScanner>.

Instance Variables:
	code		<integer>. Lexical error code from the LErr* constants defined in the SmalltalkParseErrorCodes pool
	position	<integer>. The source position at which the error should be reported (not necessarily the start of the erroneous token, may even be the start of the next token)
'!
!StErrorToken categoriesForClass!System-Compiler! !
!StErrorToken methodsFor!

acceptVisitor: anStParseNodeVisitor
	^anStParseNodeVisitor visitErrorToken: self!

code
	"Answer the <integer> lexical error code."

	^code!

code: anInteger
	code := anInteger!

length
	^position - self start + 1!

position
	"The <integer> source position of the last character in the erroneous token."

	^position!

position: anInteger
	position := anInteger! !
!StErrorToken categoriesFor: #acceptVisitor:!public!visitor! !
!StErrorToken categoriesFor: #code!accessing!public! !
!StErrorToken categoriesFor: #code:!initializing!private! !
!StErrorToken categoriesFor: #length!accessing!private! !
!StErrorToken categoriesFor: #position!accessing!public! !
!StErrorToken categoriesFor: #position:!initializing!private! !

!StErrorToken class methodsFor!

start: anInteger comments: aCollectionOrNil value: aString
	<primitive: 157>
	^self new
		start: anInteger;
		comments: aCollectionOrNil;
		value: aString;
		yourself!

start: anInteger comments: aCollectionOrNil value: aString code: errorInteger position: positionInteger
	<primitive: 157>
	^self new
		start: anInteger;
		comments: aCollectionOrNil;
		value: aString;
		code: errorInteger;
		position: positionInteger;
		yourself! !
!StErrorToken class categoriesFor: #start:comments:value:!instance creation!public! !
!StErrorToken class categoriesFor: #start:comments:value:code:position:!instance creation!public! !

