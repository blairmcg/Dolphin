"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteNumberSubstitution
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteNumberSubstitution guid: (IID fromString: '{14885CC9-BAB0-4F90-B6ED-5C366A2CD03D}')!
IDWriteNumberSubstitution comment: '`IDWriteNumberSubstitution` is a wrapper class for the COM interface ''DirectWrite.IDWriteNumberSubstitution'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"Holds the appropriate digits and numeric punctuation for a given locale."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(14885cc9-bab0-4f90-b6ed-5c366a2cd03d), 
	helpstring("Holds the appropriate digits and numeric punctuation for a given locale.")
]
interface IDWriteNumberSubstitution : IUnknown
 {
};

```'!
!IDWriteNumberSubstitution categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteNumberSubstitution class methodsFor!

new: substitutionMethod localeName: localeName ignoreUserOverride: ignoreUserOverride
	| answer |
	answer := self newPointer.
	DirectWriteLibrary factory
		CreateNumberSubstitution: substitutionMethod
		localeName: localeName
		ignoreUserOverride: ignoreUserOverride
		numberSubstitution: answer.
	^answer! !
!IDWriteNumberSubstitution class categoriesFor: #new:localeName:ignoreUserOverride:!public! !

