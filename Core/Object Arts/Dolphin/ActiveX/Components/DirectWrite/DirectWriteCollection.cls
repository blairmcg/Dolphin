"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #DirectWriteCollection
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DirectWriteCollection guid: (IID fromString: '{3AC4E8C9-8931-46B3-B19F-1D90ABD30EEB}')!
DirectWriteCollection isAbstract: true!
DirectWriteCollection comment: ''!
!DirectWriteCollection categoriesForClass!COM-Interfaces! !
!DirectWriteCollection methodsFor!

asArray
	"Answer a <Array> of all the objects in the collection."

	^(1 to: self size) collect: [:each | self at: each]
	!

at: anInteger
	^self subclassResponsibility!

size
	"Answer the number of objects in the collection."

	^self subclassResponsibility! !
!DirectWriteCollection categoriesFor: #asArray!converting!public! !
!DirectWriteCollection categoriesFor: #at:!accessing!public! !
!DirectWriteCollection categoriesFor: #size!accessing!public! !

