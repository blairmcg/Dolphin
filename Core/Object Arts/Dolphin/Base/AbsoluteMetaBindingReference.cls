"Filed out from Dolphin Smalltalk 7"!

AbsoluteBindingReference subclass: #AbsoluteMetaBindingReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbsoluteMetaBindingReference guid: (GUID fromString: '{8490e42d-9560-4e7a-bfa3-b3956dd81f38}')!
AbsoluteMetaBindingReference comment: 'MetaclassBindingReference is a specialised BindingReference that resolves to the metaclass of the class that is the value of the referenced binding.'!
!AbsoluteMetaBindingReference categoriesForClass!System-Namespaces! !
!AbsoluteMetaBindingReference methodsFor!

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
	"Answer a <BindingReference> that resolves to the value of the binding to which the receiver resolves."

	^AbsoluteBindingReference pathString: self asString!

isMeta
	"Is this a meta binding reference?"

	^true!

meta
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^self!

valueOfBinding: aVariableBinding
	^aVariableBinding value class! !
!AbsoluteMetaBindingReference categoriesFor: #displayOn:!converting!displaying!public! !
!AbsoluteMetaBindingReference categoriesFor: #hash!comparing!public! !
!AbsoluteMetaBindingReference categoriesFor: #instance!converting!public! !
!AbsoluteMetaBindingReference categoriesFor: #isMeta!public!testing! !
!AbsoluteMetaBindingReference categoriesFor: #meta!converting!displaying!public! !
!AbsoluteMetaBindingReference categoriesFor: #valueOfBinding:!accessing!private! !

