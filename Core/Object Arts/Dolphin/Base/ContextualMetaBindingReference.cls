"Filed out from Dolphin Smalltalk 7"!

ContextualBindingReference subclass: #ContextualMetaBindingReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ContextualMetaBindingReference guid: (GUID fromString: '{4b1b305f-c736-4908-b640-f15967788c0b}')!
ContextualMetaBindingReference comment: ''!
!ContextualMetaBindingReference categoriesForClass!System-Namespaces! !
!ContextualMetaBindingReference methodsFor!

displayOn: aStream
	"Append, to aStream, a String whose characters are a representation of the receiver as a user
	would want to see it (the qualified name)."

	aStream
		nextPutAll: pathString;
		space;
		display: #class!

hash
	"Answer the <integer> hash value for the receiver."

	^super hash bitXor: 1!

instance
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^ContextualBindingReference pathString: self asString context: self context!

isMeta
	"Is this a meta binding reference?"

	^true!

meta
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^self!

valueOfBinding: aVariableBinding
	^aVariableBinding value class! !
!ContextualMetaBindingReference categoriesFor: #displayOn:!converting!displaying!public! !
!ContextualMetaBindingReference categoriesFor: #hash!comparing!public! !
!ContextualMetaBindingReference categoriesFor: #instance!converting!displaying!public! !
!ContextualMetaBindingReference categoriesFor: #isMeta!public!testing! !
!ContextualMetaBindingReference categoriesFor: #meta!converting!displaying!public! !
!ContextualMetaBindingReference categoriesFor: #valueOfBinding:!accessing!private! !

