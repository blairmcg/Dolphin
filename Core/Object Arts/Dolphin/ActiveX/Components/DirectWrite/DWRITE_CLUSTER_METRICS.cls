"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_CLUSTER_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_CLUSTER_METRICS guid: (GUID fromString: '{671fe041-43e3-4a81-b091-b349b19aaed1}')!
DWRITE_CLUSTER_METRICS comment: '`DWRITE_CLUSTER_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_CLUSTER_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_CLUSTER_METRICS structure contains information about a glyph cluster."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(671fe041-43e3-4a81-b091-b349b19aaed1), helpstring("The DWRITE_CLUSTER_METRICS structure contains information about a glyph cluster.")]
struct tagDWRITE_CLUSTER_METRICS {
	float width;
	unsigned short length;
	unsigned short flags;
} DWRITE_CLUSTER_METRICS;

```'!
!DWRITE_CLUSTER_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_CLUSTER_METRICS methodsFor!

flags
	"Answer the <Integer> value of the receiver's 'flags' field."

	^bytes wordAtOffset: ##(self offsetOf: #flags)!

flags: anInteger
	"Set the receiver's 'flags' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #flags) put: anInteger!

length
	"Answer the <Integer> value of the receiver's 'length' field."

	^bytes wordAtOffset: ##(self offsetOf: #length)!

length: anInteger
	"Set the receiver's 'length' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #length) put: anInteger!

width
	"Answer the <Float> value of the receiver's 'width' field."

	^bytes floatAtOffset: 0!

width: aFloat
	"Set the receiver's 'width' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!DWRITE_CLUSTER_METRICS categoriesFor: #flags!**compiled accessors**!public! !
!DWRITE_CLUSTER_METRICS categoriesFor: #flags:!**compiled accessors**!public! !
!DWRITE_CLUSTER_METRICS categoriesFor: #length!**compiled accessors**!public! !
!DWRITE_CLUSTER_METRICS categoriesFor: #length:!**compiled accessors**!public! !
!DWRITE_CLUSTER_METRICS categoriesFor: #width!**compiled accessors**!public! !
!DWRITE_CLUSTER_METRICS categoriesFor: #width:!**compiled accessors**!public! !

!DWRITE_CLUSTER_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_CLUSTER_METRICS structure.

	DWRITE_CLUSTER_METRICS compileDefinition

		typedef [uuid(671fe041-43e3-4a81-b091-b349b19aaed1), helpstring('The DWRITE_CLUSTER_METRICS structure contains information about a glyph cluster.')]
		struct tagDWRITE_CLUSTER_METRICS {
			float width;
			unsigned short length;
			unsigned short flags;
		} DWRITE_CLUSTER_METRICS;
"

	self
		defineField: #width type: FLOATField new offset: 0;
		defineField: #length type: WORDField new offset: 4;
		defineField: #flags type: WORDField new offset: 6.
	self byteSize: 8! !
!DWRITE_CLUSTER_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

