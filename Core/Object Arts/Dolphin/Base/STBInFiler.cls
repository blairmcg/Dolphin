﻿"Filed out from Dolphin Smalltalk 7"!

STBFiler subclass: #STBInFiler
	instanceVariableNames: 'readMap converters classLocator deferredActions flags'
	classVariableNames: 'UpgradingMask'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
STBInFiler guid: (GUID fromString: '{87b4c6e7-026e-11d3-9fd7-00a0cc3e4a32}')!
STBInFiler comment: ''!
!STBInFiler categoriesForClass!System-Binary storage! !
!STBInFiler methodsFor!

basicNext
	"Private - Answer the next object from the receiver's stream."

	| prefix |
	prefix := self readInteger.
	^self readObjectWithPrefix: prefix!

classAt: anInteger
	"Private - Answer the map value for a class at anInteger. If anInteger is zero then answer nil.
	Signal an exception if there is no such entry."

	^readMap at: anInteger!

classLocator
	"Answer the receiver's classLocator inst var. This holds the context of any remote
	class references and provides the mechanism of resolving them."

	^classLocator!

classLocator: aClassLocator
	"Sets the receiver's classLocator instVar to aClassLocator.
	This is required to hold the context of any relative class reference and to provide
	the mechanism for resolving it."

	classLocator := aClassLocator!

contents
	"Answer an array of the objects stored in the stream."

	| writeStream |
	writeStream := Array writeStream: 16.
	[self atEnd]
		whileFalse: [writeStream nextPut: self next].
	^writeStream contents!

defaultClassLocatorClass
	"Answer the class of Class Locator to use by default for finding and validating
	classes in the receiver's input stream."

	^ClassLocator!

deferAction: aNiladicValuable
	"Add the <niladicValuable> argument to the receiver's deferredActions collection for later 
	evaluation just before the receiver answers from its #next method. This method is available for 
	use by the #fixup:at: method of STBProxy classes to defer a <niladicValuable> for fixing-up
	of new instances when all filed-in objects are in a known state."

	deferredActions isNil ifTrue: [deferredActions := OrderedCollection new].
	deferredActions addLast: aNiladicValuable!

evaluateDeferredActions
	"Private - Evaluate any deferred actions then clear the deferredActions collection."

	deferredActions notNil ifTrue: [
		deferredActions do: [:aNiladicValuable | aNiladicValuable value].
		deferredActions := nil]!

fixup: anInteger to: anObject
	"Replace the readMap entry at anInteger with anObject."

	readMap at: anInteger put: anObject
!

initialize
	"Private - Initialize the receiver."

	classLocator := self defaultClassLocatorClass new.
	flags := 0.
	^super initialize!

isUpgrading
	^flags allMask: UpgradingMask!

isUpgrading: aBoolean 
	flags := flags mask: UpgradingMask set: aBoolean!

next
	"Answer the next object from the receiver's stream."

	| nextObject |
	nextObject := self basicNext.
	self evaluateDeferredActions.
	^nextObject!

objectAt: anInteger
	"Private - Answer the map value at anInteger. Signal an exception if there is no such entry."

	^readMap at: anInteger!

readClassData: anInteger 
	"Private - Answer the class whose details are prefixed by the specified <integer> flags
	in <STBPrefix> format."

	| versionBeingRead class |
	versionBeingRead := (anInteger allMask: STBPrefix.NonZeroVersionMask) ifTrue: [self readInteger] ifFalse: [0].
	class := self readClassLocator: anInteger.
	self register: class.
	versionBeingRead = class stbVersion 
		ifFalse: 
			[| format |
			format := STBClassConversion 
						forFiler: self
						class: class
						version: versionBeingRead
						prefix: anInteger.
			format converterBlock isNil 
				ifTrue: [^self class errorUnrecognisedClass: class version: versionBeingRead].
			converters at: class put: format].
	^class!

readClassLocator: anIntegerFlags
	| locatorString |
	locatorString := (stream next: (anIntegerFlags bitShift: STBPrefix.LocatorLenShift)) asString.
	^(classLocator key: locatorString) locateClass!

readInteger
	"Private - Answer the next 32-bit integer in the stream."

	^stream nextSDWORD!

readLiteralData
	self shouldNotImplement!

readMap
	"Private - Answer the value of the receiver's readMap. This is an OrderedCollection of all
	the object read so far from the filer. It is used  to map the object identifiers in
	the file stream (which are really the indices into the collection) to the actual
	objects"

	^readMap!

readObjectOfClass: aClass
	| converter |
	converter := converters lookup: aClass.
	^aClass stbReadFrom: self format: converter!

readObjectOfClass: aClass format: anSTBClassConversion
	"Private - Read the stream for the data to create an instance of aClass."

	| basicSize fullSize newObject variable |
	variable := aClass isVariable.
	basicSize := (variable or: [self version < 3]) ifTrue: [self readInteger] ifFalse: [0].
	"Create a new object of sufficient size to hold the stored data."
	anSTBClassConversion isNil
		ifTrue: 
			["The object is of the current format.
			Create an instance of the appropriate class."
			fullSize := aClass instSize + basicSize.
			newObject := variable ifTrue: [aClass basicNew: basicSize] ifFalse: [aClass basicNew]]
		ifFalse: 
			["The object is of an old format.
			Create an Array or ByteArray to hold the stored data. This is
			passed to the converter block which answers an instance of the
			real class initialised from it."
			fullSize := anSTBClassConversion instSize + basicSize.
			newObject := anSTBClassConversion dataClass basicNew: fullSize].
	"Register the new object before reading its instance variables, in case of circular references"
	self register: newObject.

	"Read the object's instance data."
	aClass isBytes
		ifTrue: 
			["Many of these objects will be Strings, so some optimization may be possible"
			1 to: fullSize do: [:i | newObject basicAt: i put: stream next]]
		ifFalse: [1 to: fullSize do: [:i | newObject instVarAt: i put: self basicNext]].
	anSTBClassConversion notNil
		ifTrue: 
			["Initialise a new instance from the old format object data and become it."
			newObject become: (anSTBClassConversion converterBlock value: newObject)].
	^newObject!

readObjectWithPrefix: anInteger
	| anObject newObjectIndex class |
	anInteger == 0 ifTrue: [^nil].	"optimize for nil"

	"SmallInteger?"
	(anInteger allMask: STBPrefix.SmallIntegerMask) ifTrue: [^anInteger bitShift: -1].

	"Literal? (Hook for STL filer)"
	anInteger == STBPrefix.LiteralPrefixMask ifTrue: [^self readLiteralData].
	(anInteger allMask: STBPrefix.DataPrefixMask)
		ifFalse: 
			[^(anInteger allMask: STBPrefix.CharacterMask)
				ifTrue: [Character value: (anInteger bitShift: STBPrefix.IndexShift)]
				ifFalse: [self objectAt: (anInteger bitShift: STBPrefix.IndexShift)]].

	"Ascertain the class of the object."
	class := (anInteger allMask: STBPrefix.ClassPrefixMask)
				ifTrue: [self readClassData: anInteger]
				ifFalse: [self classAt: (anInteger bitShift: STBPrefix.IndexShift)].

	"Now read the object data."
	newObjectIndex := readMap size + 1.
	anObject := self readObjectOfClass: class.

	"If anObject was a proxy for the real one, evaluate it now."
	^anObject stbFixup: self at: newObjectIndex!

readVersion
	| char |
	version := 0.
	[(char := Character ansiValue: stream next) isDigit]
		whileTrue: [version := version * 10 + char digitValue].
	char == $\x20 ifFalse: [self class errorNotSTB]!

register: anObject
	"Private - Add anObject to the readMap."

	^readMap addAnsweringIndex: anObject!

reset
	"Private - Reset the instance.
	Read the stream to establish whether it is in STB format
	and if so initialise the readMap."

	self resetAndValidateStream.
	readMap := OrderedCollection new: 512.
	converters := IdentityDictionary new.
	deferredActions := nil.
	super reset!

resetAndValidateStream
	(self class peekForSignatureIn: stream) ifFalse: [self class errorNotSTB].
	self readVersion.
	version > self class version ifTrue: [self class errorVersion: version]!

setRefOffset: anInteger
	readMap setSize: anInteger!

timedNext
	"Answer the next object from the receiver's stream."

	| nextObject |
	Notification signal: (Time millisecondsToRun: [nextObject := self basicNext]) displayString.
	self evaluateDeferredActions.
	^nextObject! !
!STBInFiler categoriesFor: #basicNext!accessing!private! !
!STBInFiler categoriesFor: #classAt:!accessing!private! !
!STBInFiler categoriesFor: #classLocator!accessing!public! !
!STBInFiler categoriesFor: #classLocator:!accessing!public! !
!STBInFiler categoriesFor: #contents!enumerating!public! !
!STBInFiler categoriesFor: #defaultClassLocatorClass!constants!private! !
!STBInFiler categoriesFor: #deferAction:!deferred actions!public! !
!STBInFiler categoriesFor: #evaluateDeferredActions!deferred actions!private! !
!STBInFiler categoriesFor: #fixup:to:!operations!public! !
!STBInFiler categoriesFor: #initialize!initializing!private! !
!STBInFiler categoriesFor: #isUpgrading!public!testing! !
!STBInFiler categoriesFor: #isUpgrading:!accessing!public! !
!STBInFiler categoriesFor: #next!operations!public! !
!STBInFiler categoriesFor: #objectAt:!accessing!private! !
!STBInFiler categoriesFor: #readClassData:!helpers!private! !
!STBInFiler categoriesFor: #readClassLocator:!helpers!private! !
!STBInFiler categoriesFor: #readInteger!helpers!private! !
!STBInFiler categoriesFor: #readLiteralData!helpers!private! !
!STBInFiler categoriesFor: #readMap!accessing!private! !
!STBInFiler categoriesFor: #readObjectOfClass:!accessing!private! !
!STBInFiler categoriesFor: #readObjectOfClass:format:!operations!private! !
!STBInFiler categoriesFor: #readObjectWithPrefix:!accessing!private! !
!STBInFiler categoriesFor: #readVersion!initializing!private! !
!STBInFiler categoriesFor: #register:!helpers!private! !
!STBInFiler categoriesFor: #reset!initializing!private! !
!STBInFiler categoriesFor: #resetAndValidateStream!initializing!private! !
!STBInFiler categoriesFor: #setRefOffset:!accessing!private! !
!STBInFiler categoriesFor: #timedNext!development!public! !

!STBInFiler class methodsFor!

initialize
	UpgradingMask := 1!

peekForSignatureIn: aReadStream
	"Answer whether the <readableStream> argument, aReadStream, appears to
	be an STB stream (or is positioned at the start of an STB stream). If the STB
	signature is found, then the stream is left positioned immediately after it, 
	otherwise the stream position is not changed."

	| position |
	position := aReadStream position.
	^(aReadStream next: self signature size) asByteArray = self signature
		or: [aReadStream position: position. false]! !
!STBInFiler class categoriesFor: #initialize!development!initializing!public! !
!STBInFiler class categoriesFor: #peekForSignatureIn:!public!testing! !

