"Filed out from Dolphin Smalltalk 7"!

Object subclass: #BindingReference
	instanceVariableNames: 'pathString path binding'
	classVariableNames: 'Undeclared'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
BindingReference guid: (GUID fromString: '{2d52489e-7275-4df4-9022-294a7b2f9381}')!
BindingReference isAbstract: true!
BindingReference comment: 'Abstract superclass of binding references.'!
!BindingReference categoriesForClass!System-Namespaces! !
!BindingReference methodsFor!

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
					[self isMeta == anObject isMeta
						and: [self pathString = anObject pathString and: [self context == anObject context]]]]!

asQualifiedReference
	"Answer the <BindingReference> equivalent of the receiver."

	^self!

asString
	"Answer a <readableString> that expresses the receiver as a qualified name in the context of the home namespace."

	^self pathString!

asSymbol
	"Answer the <symbol> corresponding to the receiver's fully-qualified name."

	^self pathString asSymbol!

binding
	"Answer the <VariableBinding> referenced by the receiver (i.e. resolve the variable)."

	^self bindingOrNil ifNil: [self home errorNotFound: self]!

bindingOrNil
	"Answer the <VariableBinding> referenced by the receiver (i.e. resolve the variable), or nil if there is no such variable."

	^(binding
		ifNil: 
			[self setBinding: ((self home resolveBindingPath: self path) ifNil: [Undeclared]).
			binding])
			targetVariable!

context
	"The name context in which resolution of the binding should be initiated."

	^nil!

declare
	"Create a binding in the target namespace that would be resolved by the receiver, if none currently exists."

	| p nsPath ns |
	p := self path.
	nsPath := p allButLast.
	ns := self home.
	nsPath isEmpty
		ifFalse: 
			[(self home resolveBindingPath: nsPath)
				ifNil: [^self home errorNotFound: (BindingReference path: nsPath context: self context)]
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

	^self subclassResponsibility!

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

instance
	"Answer a <BindingReference> that resolves to the value of the binding to which the receiver resolves."

	^self subclassResponsibility!

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

	^self subclassResponsibility!

path
	"Answer a <sequencedReadableCollection> of <String>, being the component parts of the qualified name in order from the home namespace."

	^path
		ifNil: 
			[| immutable |
			immutable := self isImmutable: false.
			path := $. split: pathString.
			self isImmutable: immutable.
			path]!

pathString
	"Answer a <readableString> that expresses the receiver as a qualified name in the context of the home namespace."

	^pathString ifNil: [pathString := $. join: path]!

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

setPath: anArray
	path := anArray!

setPathString: aString
	pathString := aString!

simpleName
	"Answer the unqualified name part of the receiver (the final component of the name)."

	^self path last!

species
	^BindingReference!

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
!BindingReference categoriesFor: #<=!comparing!public! !
!BindingReference categoriesFor: #=!comparing!public! !
!BindingReference categoriesFor: #asQualifiedReference!converting!public! !
!BindingReference categoriesFor: #asString!converting!public! !
!BindingReference categoriesFor: #asSymbol!converting!public! !
!BindingReference categoriesFor: #binding!accessing!public! !
!BindingReference categoriesFor: #bindingOrNil!accessing!public! !
!BindingReference categoriesFor: #context!constants!public! !
!BindingReference categoriesFor: #declare!operations!public! !
!BindingReference categoriesFor: #declare:!operations!public! !
!BindingReference categoriesFor: #displayOn:!displaying!public! !
!BindingReference categoriesFor: #hash!comparing!public! !
!BindingReference categoriesFor: #home!accessing!public! !
!BindingReference categoriesFor: #ifDefined:!evaluating!public! !
!BindingReference categoriesFor: #ifDefined:ifNotDefined:!evaluating!public! !
!BindingReference categoriesFor: #ifDefinedDo:!evaluating!public! !
!BindingReference categoriesFor: #ifDefinedDo:elseDo:!evaluating!public! !
!BindingReference categoriesFor: #initialize!initializing!private! !
!BindingReference categoriesFor: #instance!converting!public! !
!BindingReference categoriesFor: #isDefined!public!testing! !
!BindingReference categoriesFor: #isMeta!public!testing! !
!BindingReference categoriesFor: #isPrivate!public!testing! !
!BindingReference categoriesFor: #isWildcard!public!testing! !
!BindingReference categoriesFor: #literalTextStyle!constants!public! !
!BindingReference categoriesFor: #meta!converting!public! !
!BindingReference categoriesFor: #path!accessing!public! !
!BindingReference categoriesFor: #pathString!accessing!public! !
!BindingReference categoriesFor: #printOn:!printing!public! !
!BindingReference categoriesFor: #refersToLiteral:!public!testing! !
!BindingReference categoriesFor: #setBinding:!initializing!private! !
!BindingReference categoriesFor: #setPath:!initializing!private! !
!BindingReference categoriesFor: #setPathString:!initializing!private! !
!BindingReference categoriesFor: #simpleName!accessing!public! !
!BindingReference categoriesFor: #species!comparing!public! !
!BindingReference categoriesFor: #storeOn:!public!storing! !
!BindingReference categoriesFor: #value!accessing!public! !
!BindingReference categoriesFor: #valueOfBinding:!accessing!private! !
!BindingReference categoriesFor: #valueOrDo:!accessing!public! !
!BindingReference categoriesFor: #valueOrNil!accessing!public! !

!BindingReference class methodsFor!

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
	Undeclared := UndeclaredVariable new.
	VMLibrary default
		registryAt: self name put: self;
		registryAtIndex: 65 put: #pathString:context:meta:!

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
	^self pathString: ''!

newPath: anArray context: anObject
	^anObject
		ifNil: [AbsoluteBindingReference newPath: anArray]
		ifNotNil: [ContextualBindingReference newPath: anArray context: anObject]!

path: aSequencedReadableCollection
	"Answer a new instance of the receiver representing the qualified name composed of the <readableString> elements of the argument."

	^self path: aSequencedReadableCollection context: nil!

path: aSequencedReadableCollection context: anObject
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
				ifTrue: [self newPath: path context: anObject]
				ifFalse: [self errorInvalidIdentifier: last]]!

path: aSequencedReadableCollection home: aNamespaceOrNil
	"Answer a new instance of the receiver representing the qualified name composed of the <readableString> elements of the argument."

	^self path: aSequencedReadableCollection
		context: (aNamespaceOrNil == Smalltalk ifFalse: [aNamespaceOrNil])!

pathString: aString
	"Answer a new instance of the receiver representing the qualified name identified by the <readableString> argument."

	^AbsoluteBindingReference pathString: aString!

pathString: aString context: anObject
	"Answer a new sub-instance of the receiver representing the qualified name identified by the <readableString> argument,
	which is relative to the binding context, anObject. If anObject is nil, then an AbsoluteBindingPath is returned. 
	If anObject is not nil, then it is expected to be some kind of name binding context (i.e. a namespace, class, or method),
	and the new instance will be a ContextualBindingReference with that object as its starting point for resolving the binding."

	^anObject
		ifNil: [AbsoluteBindingReference pathString: aString]
		ifNotNil: [ContextualBindingReference pathString: aString context: anObject]!

pathString: aString context: anObject meta: aBoolean
	"Private - Use by the Compiler to construct literal instances."

	^anObject
		ifNil: [AbsoluteBindingReference pathString: aString meta: aBoolean]
		ifNotNil: 
			[ContextualBindingReference
				pathString: aString
				context: anObject
				meta: aBoolean]!

pathString: aString home: aNamespace
	"Answer a new instance of the receiver representing the qualified name identified by the <readableString> argument,
	homed in the specified <Namespace>."

	^self pathString: aString context: (aNamespace == Smalltalk ifFalse: [aNamespace])!

simpleName: aString
	"Answer a new instance of the receiver representing the variable with the specified unqualified name."

	^self pathString: aString!

simpleName: aString in: aNamespace
	"Answer a new instance of the receiver representing the variable with the specified unqualified name in the specified <Namespace>."

	^self pathString: aString home: aNamespace!

splitQualifiedName: aString
	^$. split: aString!

uninitialize
	VMLibrary default
		registryAt: self name put: nil;
		registryAtIndex: 65 put: nil! !
!BindingReference class categoriesFor: #clearCachedBindings!private! !
!BindingReference class categoriesFor: #errorInvalidIdentifier:!exceptions!private! !
!BindingReference class categoriesFor: #initialize!class initialization!public! !
!BindingReference class categoriesFor: #internQualifiers:!helpers!private! !
!BindingReference class categoriesFor: #isQualifiedName:!enquiries!public! !
!BindingReference class categoriesFor: #isValidQualifiedName:!enquiries!public! !
!BindingReference class categoriesFor: #isValidUnqualifiedName:!enquiries!public! !
!BindingReference class categoriesFor: #new!instance creation!public! !
!BindingReference class categoriesFor: #newPath:context:!instance creation!private! !
!BindingReference class categoriesFor: #path:!instance creation!public! !
!BindingReference class categoriesFor: #path:context:!instance creation!public! !
!BindingReference class categoriesFor: #path:home:!compatibility!instance creation!public! !
!BindingReference class categoriesFor: #pathString:!instance creation!public! !
!BindingReference class categoriesFor: #pathString:context:!instance creation!public! !
!BindingReference class categoriesFor: #pathString:context:meta:!instance creation!private! !
!BindingReference class categoriesFor: #pathString:home:!compatibility!instance creation!public! !
!BindingReference class categoriesFor: #simpleName:!instance creation!public! !
!BindingReference class categoriesFor: #simpleName:in:!instance creation!public! !
!BindingReference class categoriesFor: #splitQualifiedName:!helpers!public! !
!BindingReference class categoriesFor: #uninitialize!class hierarchy-removing!private! !

