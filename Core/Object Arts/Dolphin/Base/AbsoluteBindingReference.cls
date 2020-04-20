"Filed out from Dolphin Smalltalk 7"!

BindingReference subclass: #AbsoluteBindingReference
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
AbsoluteBindingReference guid: (GUID fromString: '{801fde8c-7556-4b95-bb9d-eafb33552e79}')!
AbsoluteBindingReference comment: 'Generic binding reference.'!
!AbsoluteBindingReference categoriesForClass!System-Namespaces! !
!AbsoluteBindingReference methodsFor!

hash
	"Answer the <integer> hash value for the receiver."

	^self pathString hash!

home
	"Answer the home namespace to which this BindingReference is relative."

	^Smalltalk!

instance
	"Answer a <BindingReference> that resolves to the value of the binding to which the receiver resolves."

	^self!

isLiteral
	"Answer whether or not the receiver has a literal representation (probably its printString) which is directly recognised by the Compiler"

	^true!

meta
	"Answer a <BindingReference> that resolves to the class of the value of the binding to which the receiver resolves."

	^AbsoluteMetaBindingReference pathString: self asString! !
!AbsoluteBindingReference categoriesFor: #hash!comparing!public! !
!AbsoluteBindingReference categoriesFor: #home!accessing!public! !
!AbsoluteBindingReference categoriesFor: #instance!converting!public! !
!AbsoluteBindingReference categoriesFor: #isLiteral!public!testing! !
!AbsoluteBindingReference categoriesFor: #meta!converting!displaying!public! !

!AbsoluteBindingReference class methodsFor!

newPath: anArray
	^self basicNew
		setPath: anArray;
		yourself!

pathString: aString
	"Answer a new instance of the receiver representing the qualified name identified by the <readableString> argument."

	^self basicNew
		setPathString: aString;
		yourself!

pathString: aString meta: aBoolean
	"Private - Use by the Compiler to construct literal instances."

	^(aBoolean ifTrue: [AbsoluteMetaBindingReference] ifFalse: [self]) pathString: aString! !
!AbsoluteBindingReference class categoriesFor: #newPath:!instance creation!private! !
!AbsoluteBindingReference class categoriesFor: #pathString:!instance creation!public! !
!AbsoluteBindingReference class categoriesFor: #pathString:meta:!instance creation!private! !

