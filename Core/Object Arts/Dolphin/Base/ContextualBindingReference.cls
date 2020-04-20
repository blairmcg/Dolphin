"Filed out from Dolphin Smalltalk 7"!

BindingReference subclass: #ContextualBindingReference
	instanceVariableNames: 'context'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ContextualBindingReference guid: (GUID fromString: '{e09513fa-015b-4225-a0cf-00a0a66366dc}')!
ContextualBindingReference comment: ''!
!ContextualBindingReference categoriesForClass!System-Namespaces! !
!ContextualBindingReference methodsFor!

context
	"Answer the naming context in which this reference should be resolved."

	^context!

context: anObject
	context := anObject!

hash
	"Answer the <integer> hash value for the receiver."

	^context hash hashMultiply + pathString hash bitAnd: VMConstants.SmallIntegerMax!

home
	"Answer the home namespace to which this BindingReference is relative."

	^context localEnvironment!

meta
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^ContextualMetaBindingReference pathString: self asString context: self context! !
!ContextualBindingReference categoriesFor: #context!accessing!public! !
!ContextualBindingReference categoriesFor: #context:!initializing!private! !
!ContextualBindingReference categoriesFor: #hash!comparing!public! !
!ContextualBindingReference categoriesFor: #home!accessing!public! !
!ContextualBindingReference categoriesFor: #meta!converting!displaying!public! !

!ContextualBindingReference class methodsFor!

newPath: anArray context: anObject
	^self basicNew
		setPath: anArray;
		context: anObject;
		yourself!

pathString: aString context: aBehavior
	^self basicNew
		setPathString: aString;
		context: aBehavior;
		yourself!

pathString: aString context: anObject meta: aBoolean
	"Private - Use by the Compiler to construct literal instances."

	^(aBoolean ifTrue: [ContextualMetaBindingReference] ifFalse: [self]) pathString: aString
		context: anObject! !
!ContextualBindingReference class categoriesFor: #newPath:context:!instance creation!private! !
!ContextualBindingReference class categoriesFor: #pathString:context:!instance creation!public! !
!ContextualBindingReference class categoriesFor: #pathString:context:meta:!instance creation!private! !

