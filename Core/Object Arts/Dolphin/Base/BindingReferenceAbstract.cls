"Filed out from Dolphin Smalltalk 7"!

Object subclass: #BindingReferenceAbstract
	instanceVariableNames: 'pathString binding'
	classVariableNames: 'Undeclared'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
BindingReferenceAbstract guid: (GUID fromString: '{2d52489e-7275-4df4-9022-294a7b2f9381}')!
BindingReferenceAbstract isAbstract: true!
BindingReferenceAbstract comment: 'Abstract superclass of binding references.'!
!BindingReferenceAbstract categoriesForClass!System-Namespaces! !
!BindingReferenceAbstract methodsFor!

<= aBindingReference
	"Answer whether the receiver should sort before the argument."

	^aBindingReference == self or: 
			[| cmp |
			cmp := pathString <==> aBindingReference pathString.
			cmp == 0 ifTrue: [self isMeta not or: [aBindingReference isMeta]] ifFalse: [cmp < 0]]!

= anObject
	"Answer whether the receiver and the <Object> argument should be considered equivalent. Binding references are considered equivalent if they have the same path and starting point.
	Note that two binding references that would resolve to the same actual variable binding may not be considered equivalent as the binding resolution is a dynamic quality determined 
	at the time of resolution, and is not necessarily temporally stable. Equality of binding references is a static property based and is such that two equal references will always bind
	to the same variable."

	^self == anObject or: 
			[self species == anObject species and: 
					[pathString = anObject pathString
						and: [self baseClass == anObject baseClass and: [self home == anObject home]]]]!

asMetaReference
	^MetaBindingReference
		pathString: self pathString
		class: self baseClass
		home: self home!

asQualifiedReference
	"Answer the <BindingReference> equivalent of the receiver."

	^self!

asString
	"Answer a <readableString> that expresses the receiver as a qualified name in the context of the home namespace."

	^self pathString!

asSymbol
	"Answer the <symbol> corresponding to the receiver's fully-qualified name."

	^self pathString asSymbol!

baseClass
	"The class in which resolution of the binding should be initiated."

	^self subclassResponsibility!

binding
	"Answer the <VariableBinding> referenced by the receiver (i.e. resolve the variable)."

	^self bindingOrNil ifNil: [NotFoundError signalWith: self]!

bindingOrNil
	"Answer the <VariableBinding> referenced by the receiver (i.e. resolve the variable), or nil if there is no such variable."

	^(binding
		ifNil: 
			[self setBinding: ((self home resolveBindingPath: self path) ifNil: [Undeclared]).
			binding])
			targetVariable!

declare
	"Create a binding in the target namespace that would be resolved by the receiver, if none currently exists."

	| p nsPath ns |
	p := self path.
	nsPath := p allButLast.
	ns := self home.
	nsPath isEmpty
		ifFalse: 
			[(self home resolveBindingPath: nsPath)
				ifNil: [^NotFoundError signalWith: (BindingReference path: nsPath home: self home)]
				ifNotNil: [:nsBinding | ns := nsBinding targetVariable value]].
	^ns declareVariable: p last!

declare: anObject
	"Create a binding in the target namespace that would be resolved by the receiver, if none currently exists.
	Set the value of the new or existing binding to the argument."

	self declare value: anObject!

displayOn: aStream
	"Append, to aStream, a String whose characters are a representation of the receiver as a user
	would want to see it (the qualified name)."

	aStream nextPutAll: self pathString!

hash
	"Answer the <integer> hash value for the receiver."

	^self pathString hash!

home
	"Answer the home <Namespace> to which this binding reference is relative."

	^Smalltalk!

ifDefined: aMonadicValuable
	"If the receiver is defined (see #isDefined), then evaluate the <monadicValuable> argument with the value of the resolved variable.
	Answer the result of the evaluation, or nil if the binding is undefined."

	^self bindingOrNil ifNotNil: [:var | aMonadicValuable value: var value]!

ifDefined: aMonadicValuable ifNotDefined: aNiladicValuable
	"Answer the result of evaluating either the <monadicValuable> argument, if the receiver is defined (see #isDefined), with the value of the resolved variable, or the result of evaluating the <niladicValuable> argument if the receiver is not defined."

	^self bindingOrNil
		ifNil: [aNiladicValuable value]
		ifNotNil: [:var | aMonadicValuable value: (self valueOfBinding: var)]!

ifDefinedDo: aMonadicValuable
	"Ugly selector, but for compatibility. Prefer #ifDefined:"

	^self ifDefined: aMonadicValuable!

ifDefinedDo: aMonadicValuable elseDo: aNiladicValuable
	"Ugly selector, but for compatibility. Prefer #ifDefined:ifNotDefined:"

	^self ifDefined: aMonadicValuable ifNotDefined: aNiladicValuable!

initialize
	pathString := ''.
	^self!

isDefined
	"Answer whether the receiver refers to a defined variable."

	^self bindingOrNil notNil!

isMeta
	"Is this a meta binding reference?"

	^false!

isPrivate
	"Answer whether the receiver represents a private binding reference that should not be used outside its immediate scope."

	^false!

isWildcard
	"Answer whether the receiver represents a wildcard reference to match all the names in a namespace."

	^false!

literalTextStyle
	^#literalBindingReference!

meta
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^MetaBindingReference
		pathString: self asString
		class: self baseClass
		home: self home!

path
	"Answer a <sequencedReadableCollection> of <String>, being the component parts of the qualified name in order from the home namespace."

	^$. split: self pathString!

pathString
	"Answer a <readableString> that expresses the receiver as a qualified name in the context of the home namespace."

	^pathString!

printOn: aStream
	"Append a text to the <puttableStream> argument representing the receiver in the textual form a developer would want (i.e. as a literal qualified reference)."

	aStream
		nextPutAll: '#{';
		display: self;
		nextPut: $}!

refersToLiteral: anObject
	"Private - Answer whether the receiver is a reference to the literal argument.
	This assumes that the receiver is in the role of a literal. Normally this would only be true of LiteralBindingReferences, but other types of BindingReferences could find their way into literal frames if they result from the evaluation of a static expression."

	^self = anObject or: [anObject notNil and: [self bindingOrNil refersToLiteral: anObject]]!

setBinding: aVariableBindingOrNil
	| immutable |
	immutable := self isImmutable: false.
	binding := aVariableBindingOrNil.
	self isImmutable: immutable!

setPathString: aString
	pathString := aString!

simpleName
	"Answer the unqualified name part of the receiver (the final component of the name)."

	^self path last!

storeOn: aStream
	"This should probably store the full path."

	self printOn: aStream!

value
	"Answer the value of the variable named by the receiver. Raise an error if the variable is not defined."

	^self valueOfBinding: self binding!

valueOfBinding: aVariableBinding
	^aVariableBinding value!

valueOrDo: aNiladicValuable
	"Answer the value of the variable named by the receiver, or the result of evaluating the <niladicValuable> argument if not defined."

	^self bindingOrNil ifNil: [aNiladicValuable value] ifNotNil: [:var | self valueOfBinding: var]!

valueOrNil
	"Answer the value of the variable named by the receiver, or nil if not defined.
	Note that it will not be possible to define the cases of an undefined variable and a defined variable with value nil."

	^self bindingOrNil ifNotNil: [:var | self valueOfBinding: var]! !
!BindingReferenceAbstract categoriesFor: #<=!comparing!public! !
!BindingReferenceAbstract categoriesFor: #=!comparing!public! !
!BindingReferenceAbstract categoriesFor: #asMetaReference!public! !
!BindingReferenceAbstract categoriesFor: #asQualifiedReference!converting!public! !
!BindingReferenceAbstract categoriesFor: #asString!converting!public! !
!BindingReferenceAbstract categoriesFor: #asSymbol!converting!public! !
!BindingReferenceAbstract categoriesFor: #baseClass!constants!public! !
!BindingReferenceAbstract categoriesFor: #binding!accessing!converting!public! !
!BindingReferenceAbstract categoriesFor: #bindingOrNil!accessing!converting!public! !
!BindingReferenceAbstract categoriesFor: #declare!operations!public! !
!BindingReferenceAbstract categoriesFor: #declare:!operations!public! !
!BindingReferenceAbstract categoriesFor: #displayOn:!converting!displaying!public! !
!BindingReferenceAbstract categoriesFor: #hash!comparing!converting!public! !
!BindingReferenceAbstract categoriesFor: #home!accessing!converting!public! !
!BindingReferenceAbstract categoriesFor: #ifDefined:!converting!evaluating!public! !
!BindingReferenceAbstract categoriesFor: #ifDefined:ifNotDefined:!converting!evaluating!public! !
!BindingReferenceAbstract categoriesFor: #ifDefinedDo:!converting!evaluating!public! !
!BindingReferenceAbstract categoriesFor: #ifDefinedDo:elseDo:!converting!evaluating!public! !
!BindingReferenceAbstract categoriesFor: #initialize!initializing!private! !
!BindingReferenceAbstract categoriesFor: #isDefined!converting!public!testing! !
!BindingReferenceAbstract categoriesFor: #isMeta!public!testing! !
!BindingReferenceAbstract categoriesFor: #isPrivate!converting!public!testing! !
!BindingReferenceAbstract categoriesFor: #isWildcard!converting!public!testing! !
!BindingReferenceAbstract categoriesFor: #literalTextStyle!converting!public! !
!BindingReferenceAbstract categoriesFor: #meta!converting!displaying!public! !
!BindingReferenceAbstract categoriesFor: #path!accessing!converting!public! !
!BindingReferenceAbstract categoriesFor: #pathString!accessing!public! !
!BindingReferenceAbstract categoriesFor: #printOn:!printing!public! !
!BindingReferenceAbstract categoriesFor: #refersToLiteral:!public!testing! !
!BindingReferenceAbstract categoriesFor: #setBinding:!initializing!private! !
!BindingReferenceAbstract categoriesFor: #setPathString:!initializing!private! !
!BindingReferenceAbstract categoriesFor: #simpleName!accessing!public! !
!BindingReferenceAbstract categoriesFor: #storeOn:!public!storing! !
!BindingReferenceAbstract categoriesFor: #value!accessing!public! !
!BindingReferenceAbstract categoriesFor: #valueOfBinding:!accessing!private! !
!BindingReferenceAbstract categoriesFor: #valueOrDo:!accessing!public! !
!BindingReferenceAbstract categoriesFor: #valueOrNil!accessing!public! !

!BindingReferenceAbstract class methodsFor!

clearCachedBindings
	"	Transcript nextPutAll: '** Clearing cached bindings:'; cr.
	Processor activeProcess topFrame printStackOn: Transcript depth: 20.
	Transcript cr; cr.
	"

	| instances |
	instances := self primAllSubinstances.
	1 to: instances size do: [:i | (instances at: i) setBinding: nil]!

errorInvalidIdentifier: aString
	^self error: ('Invalid identifier: ''<s>''' expandMacrosWith: aString)!

initialize
	self addClassConstant: 'Undeclared' value: UndeclaredVariable new!

internQualifiers: aSequencedReadableCollection
	"Private - Convert the argument to an <Array> of <Symbol>, validating that each qualifier (i.e. not including the last part) is valid as part of a static variable name."

	| size path |
	size := aSequencedReadableCollection size.
	size == 0 ifTrue: [^#()].
	path := Array writeStream: size.
	aSequencedReadableCollection
		from: 1
		to: size - 1
		do: 
			[:each |
			(self isValidUnqualifiedName: each) ifFalse: [^self errorInvalidIdentifier: each].
			path nextPut: each].
	path nextPut: (aSequencedReadableCollection at: size).
	^path collection!

isQualifiedName: aString
	"Answer whether the argument is probably a qualified name (as opposed to an unqualified, or simple, name)."

	^(aString
		nextIdentityIndexOf: $.
		from: 1
		to: aString size) ~~ 0!

isValidQualifiedName: aString
	"Answer whether the argument is a valid static variable name, qualified or unqualified."

	^(self isQualifiedName: aString)
		ifTrue: [(self splitQualifiedName: aString) allSatisfy: [:each | self isValidUnqualifiedName: each]]
		ifFalse: [self isValidUnqualifiedName: aString]!

isValidUnqualifiedName: aString
	| size |
	size := aString size.
	^size ~~ 0 and: 
			[| first |
			first := aString at: 1.
			"We allow identifiers to start with underscores or any letter. We don't insist on uppercase letters as this is a convention, not a syntax restriction."
			((first == $_ and: [size > 1]) or: [first isLetter])
				and: [aString allSatisfy: [:each | each isAlphaNumeric or: [each == $_]]]]!

new
	^self basicNew
		initialize;
		yourself!

path: aSequencedReadableCollection
	"Answer a new instance of the receiver representing the qualified name composed of the <readableString> elements of the argument."

	| path depth |
	path := self internQualifiers: aSequencedReadableCollection.
	depth := path size.
	^depth == 0
		ifTrue: [self new]
		ifFalse: 
			[| last |
			last := path last.
			(self isValidUnqualifiedName: last)
				ifTrue: [self pathString: ($. join: path)]
				ifFalse: [self errorInvalidIdentifier: last]]!

pathString: aString
	"Answer a new instance of the receiver representing the qualified name identified by the <readableString> argument."

	^self basicNew
		setPathString: aString;
		yourself!

simpleName: aString
	"Answer a new instance of the receiver representing the variable with the specified unqualified name."

	^self pathString: aString!

splitQualifiedName: aString
	^$. split: aString! !
!BindingReferenceAbstract class categoriesFor: #clearCachedBindings!private! !
!BindingReferenceAbstract class categoriesFor: #errorInvalidIdentifier:!exceptions!private! !
!BindingReferenceAbstract class categoriesFor: #initialize!class initialization!public! !
!BindingReferenceAbstract class categoriesFor: #internQualifiers:!helpers!private! !
!BindingReferenceAbstract class categoriesFor: #isQualifiedName:!enquiries!public! !
!BindingReferenceAbstract class categoriesFor: #isValidQualifiedName:!enquiries!public! !
!BindingReferenceAbstract class categoriesFor: #isValidUnqualifiedName:!enquiries!public! !
!BindingReferenceAbstract class categoriesFor: #new!instance creation!public! !
!BindingReferenceAbstract class categoriesFor: #path:!instance creation!public! !
!BindingReferenceAbstract class categoriesFor: #pathString:!instance creation!public! !
!BindingReferenceAbstract class categoriesFor: #simpleName:!instance creation!public! !
!BindingReferenceAbstract class categoriesFor: #splitQualifiedName:!helpers!public! !

