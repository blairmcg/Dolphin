﻿"Filed out from Dolphin Smalltalk 7"!

Core.Object variableSubclass: #'Kernel.MethodAnnotations'
	instanceVariableNames: ''
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
Kernel.MethodAnnotations guid: (Core.GUID fromString: '{0796b2f8-83f3-4c8e-a8b8-3002ef3189f1}')!
Kernel.MethodAnnotations comment: ''!
!Kernel.MethodAnnotations categoriesForClass!Kernel-Objects! !
!Kernel.MethodAnnotations methodsFor!

environment
	"Answer the value of the #namespace: annotation in the receiver, or nil if not present."

	| index |
	^(index := self
				nextIdentityIndexOf: #namespace:
				from: 1
				to: self size) == 0
		ifFalse: [(self at: index + 1) at: 1]!

nextIdentityIndexOf: anObject from: startInteger to: stopInteger
	<primitive: 59>
	startInteger to: stopInteger do: [:i | (self at: i) == anObject ifTrue: [^i]].
	^0!

printOn: aStream
	super printOn: aStream.
	aStream nextPut: $(.
	1 to: self size
		by: 2
		do: 
			[:i |
			| selector keywords args |
			i > 1 ifTrue: [aStream space].
			selector := self at: i.
			aStream nextPut: $<.
			keywords := $: split: selector.
			args := self at: i + 1.
			keywords size = 1
				ifTrue: [aStream print: selector]
				ifFalse: 
					[1 to: keywords size - 1
						do: 
							[:k |
							k > 1 ifTrue: [aStream space].
							aStream
								nextPut: $#;
								nextPutAll: (keywords at: k);
								nextPut: $:;
								space;
								print: (args at: k)]].
			aStream nextPut: $>].
	aStream nextPut: $)! !
!Kernel.MethodAnnotations categoriesFor: #environment!public!searching! !
!Kernel.MethodAnnotations categoriesFor: #nextIdentityIndexOf:from:to:!private!searching! !
!Kernel.MethodAnnotations categoriesFor: #printOn:!printing!public! !

!Kernel.MethodAnnotations class methodsFor!

initialize
	"Private - Initialize the receiver's class variables.
		self initialize
	"
	VMLibrary default registryAt: self name put: self!

uninitialize
	"Private - Tidy up the receiver in preparation for removal from the system."

	VMLibrary default registryAt: self name put: nil! !
!Kernel.MethodAnnotations class categoriesFor: #initialize!development!initializing!private! !
!Kernel.MethodAnnotations class categoriesFor: #uninitialize!class hierarchy-removing!private! !
