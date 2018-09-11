"Filed out from Dolphin Smalltalk 7"!

Direct2dStructure subclass: #D2D1_FACTORY_OPTIONS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
D2D1_FACTORY_OPTIONS guid: (GUID fromString: '{81e8cfb8-c165-4ed5-a061-093f6492efe5}')!
D2D1_FACTORY_OPTIONS comment: '`D2D1_FACTORY_OPTIONS` is an `ExternalStructure` class to wrap the struct ''Direct2d.D2D1_FACTORY_OPTIONS'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(81e8cfb8-c165-4ed5-a061-093f6492efe5)]
struct tagD2D1_FACTORY_OPTIONS {
	D2D1_DEBUG_LEVEL debugLevel;
} D2D1_FACTORY_OPTIONS;

```'!
!D2D1_FACTORY_OPTIONS categoriesForClass!Direct2d-Structs! !
!D2D1_FACTORY_OPTIONS methodsFor!

debugLevel
	"Answer the <Integer> value of the receiver's 'debugLevel' field."

	^bytes sdwordAtOffset: 0!

debugLevel: anInteger
	"Set the receiver's 'debugLevel' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger! !
!D2D1_FACTORY_OPTIONS categoriesFor: #debugLevel!**compiled accessors**!public! !
!D2D1_FACTORY_OPTIONS categoriesFor: #debugLevel:!**compiled accessors**!public! !

!D2D1_FACTORY_OPTIONS class methodsFor!

defineFields
	"Define the fields of the D2D1_FACTORY_OPTIONS structure.

	D2D1_FACTORY_OPTIONS compileDefinition

		typedef [uuid(81e8cfb8-c165-4ed5-a061-093f6492efe5)]
		struct tagD2D1_FACTORY_OPTIONS {
			D2D1_DEBUG_LEVEL debugLevel;
		} D2D1_FACTORY_OPTIONS;
"

	self
		defineField: #debugLevel type: SDWORDField new offset: 0.
	self byteSize: 4! !
!D2D1_FACTORY_OPTIONS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

