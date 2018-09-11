"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DXGI_SAMPLE_DESC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DXGI_SAMPLE_DESC guid: (GUID fromString: '{b13bdbb0-a374-4b72-9dca-65c60e6d1b15}')!
DXGI_SAMPLE_DESC comment: '`DXGI_SAMPLE_DESC` is an `ExternalStructure` class to wrap the struct ''Direct2d.DXGI_SAMPLE_DESC'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagDXGI_SAMPLE_DESC {
	unsigned int count;
	unsigned int Quality;
} DXGI_SAMPLE_DESC;

```'!
!DXGI_SAMPLE_DESC categoriesForClass!Direct2d-Structs! !
!DXGI_SAMPLE_DESC methodsFor!

count
	"Answer the <Integer> value of the receiver's 'count' field."

	^bytes dwordAtOffset: 0!

count: anInteger
	"Set the receiver's 'count' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger!

Quality
	"Answer the <Integer> value of the receiver's 'Quality' field."

	^bytes dwordAtOffset: ##(self offsetOf: #Quality)!

Quality: anInteger
	"Set the receiver's 'Quality' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #Quality) put: anInteger! !
!DXGI_SAMPLE_DESC categoriesFor: #count!**compiled accessors**!public! !
!DXGI_SAMPLE_DESC categoriesFor: #count:!**compiled accessors**!public! !
!DXGI_SAMPLE_DESC categoriesFor: #Quality!**compiled accessors**!public! !
!DXGI_SAMPLE_DESC categoriesFor: #Quality:!**compiled accessors**!public! !

!DXGI_SAMPLE_DESC class methodsFor!

defineFields
	"Define the fields of the DXGI_SAMPLE_DESC structure.

	DXGI_SAMPLE_DESC compileDefinition

		typedef 
		struct tagDXGI_SAMPLE_DESC {
			unsigned int count;
			unsigned int Quality;
		} DXGI_SAMPLE_DESC;
"

	self
		defineField: #count type: DWORDField new offset: 0;
		defineField: #Quality type: DWORDField new offset: 4.
	self byteSize: 8! !
!DXGI_SAMPLE_DESC class categoriesFor: #defineFields!**auto generated**!initializing!public! !

