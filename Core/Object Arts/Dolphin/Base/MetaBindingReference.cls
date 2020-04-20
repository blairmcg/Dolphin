"Filed out from Dolphin Smalltalk 7"!

BindingReference subclass: #MetaBindingReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
MetaBindingReference guid: (GUID fromString: '{8490e42d-9560-4e7a-bfa3-b3956dd81f38}')!
MetaBindingReference comment: 'MetaclassBindingReference is a specialised BindingReference that resolves to the metaclass of the class that is the value of the referenced binding.'!
!MetaBindingReference categoriesForClass!System-Namespaces! !
!MetaBindingReference methodsFor!

asMetaReference
	^self!

displayOn: aStream
	"Append, to aStream, a String whose characters are a representation of the receiver as a user
	would want to see it (the qualified name)."

	aStream
		nextPutAll: pathString;
		space;
		display: #class!

isMeta
	"Is this a meta binding reference?"

	^true!

valueOfBinding: aVariableBinding
	^aVariableBinding value class! !
!MetaBindingReference categoriesFor: #asMetaReference!public! !
!MetaBindingReference categoriesFor: #displayOn:!converting!displaying!public! !
!MetaBindingReference categoriesFor: #isMeta!public!testing! !
!MetaBindingReference categoriesFor: #valueOfBinding:!accessing!private! !

