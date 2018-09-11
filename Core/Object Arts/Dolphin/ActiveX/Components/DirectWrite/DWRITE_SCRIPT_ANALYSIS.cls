"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_SCRIPT_ANALYSIS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_SCRIPT_ANALYSIS guid: (GUID fromString: '{0d4096ce-15c6-4924-a15c-2530cb68f96c}')!
DWRITE_SCRIPT_ANALYSIS comment: '`DWRITE_SCRIPT_ANALYSIS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_SCRIPT_ANALYSIS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Association of text and its writing system script as well as some display attributes."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(0d4096ce-15c6-4924-a15c-2530cb68f96c), helpstring("Association of text and its writing system script as well as some display attributes.")]
struct tagDWRITE_SCRIPT_ANALYSIS {
	unsigned short script;
	DWRITE_SCRIPT_SHAPES shapes;
} DWRITE_SCRIPT_ANALYSIS;

```'!
!DWRITE_SCRIPT_ANALYSIS categoriesForClass!Direct2d-Structs! !
!DWRITE_SCRIPT_ANALYSIS methodsFor!

script
	"Answer the <Integer> value of the receiver's 'script' field."

	^bytes wordAtOffset: 0!

script: anInteger
	"Set the receiver's 'script' field to the value of the argument, anInteger"

	bytes wordAtOffset: 0 put: anInteger!

shapes
	"Answer the <Integer> value of the receiver's 'shapes' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #shapes)!

shapes: anInteger
	"Set the receiver's 'shapes' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #shapes) put: anInteger! !
!DWRITE_SCRIPT_ANALYSIS categoriesFor: #script!**compiled accessors**!public! !
!DWRITE_SCRIPT_ANALYSIS categoriesFor: #script:!**compiled accessors**!public! !
!DWRITE_SCRIPT_ANALYSIS categoriesFor: #shapes!**compiled accessors**!public! !
!DWRITE_SCRIPT_ANALYSIS categoriesFor: #shapes:!**compiled accessors**!public! !

!DWRITE_SCRIPT_ANALYSIS class methodsFor!

defineFields
	"Define the fields of the DWRITE_SCRIPT_ANALYSIS structure.

	DWRITE_SCRIPT_ANALYSIS compileDefinition

		typedef [uuid(0d4096ce-15c6-4924-a15c-2530cb68f96c), helpstring('Association of text and its writing system script as well as some display attributes.')]
		struct tagDWRITE_SCRIPT_ANALYSIS {
			unsigned short script;
			DWRITE_SCRIPT_SHAPES shapes;
		} DWRITE_SCRIPT_ANALYSIS;
"

	self
		defineField: #script type: WORDField new offset: 0;
		defineField: #shapes type: SDWORDField new offset: 4.
	self byteSize: 8! !
!DWRITE_SCRIPT_ANALYSIS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

