"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DXGI_SURFACE_DESC
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DXGI_SURFACE_DESC guid: (GUID fromString: '{c4455f78-f7e4-4ce0-bd1d-a1097d65e602}')!
DXGI_SURFACE_DESC comment: '`DXGI_SURFACE_DESC` is an `ExternalStructure` class to wrap the struct ''Direct2d.DXGI_SURFACE_DESC'' from type information in the ''Windows Direct2D API'' library.

The type library contains no documentation for this struct

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef 
struct tagDXGI_SURFACE_DESC {
	unsigned int width;
	unsigned int height;
	DXGI_FORMAT format;
	DXGI_SAMPLE_DESC SampleDesc;
} DXGI_SURFACE_DESC;

```'!
!DXGI_SURFACE_DESC categoriesForClass!Direct2d-Structs! !
!DXGI_SURFACE_DESC methodsFor!

format
	"Answer the <Integer> value of the receiver's 'format' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #format)!

format: anInteger
	"Set the receiver's 'format' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #format) put: anInteger!

height
	"Answer the <Integer> value of the receiver's 'height' field."

	^bytes dwordAtOffset: ##(self offsetOf: #height)!

height: anInteger
	"Set the receiver's 'height' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #height) put: anInteger!

SampleDesc
	"Answer the <DXGI_SAMPLE_DESC> value of the receiver's 'SampleDesc' field."

	^DXGI_SAMPLE_DESC fromAddress: bytes yourAddress + ##(self offsetOf: #SampleDesc)!

SampleDesc: aDXGI_SAMPLE_DESC
	"Set the receiver's 'SampleDesc' field to the value of the argument, aDXGI_SAMPLE_DESC"

	aDXGI_SAMPLE_DESC
		replaceBytesOf: bytes
		from: ##((self offsetOf: #SampleDesc) + 1)
		to: ##((self offsetOf: #SampleDesc) + DXGI_SAMPLE_DESC basicByteSize)
		startingAt: 1!

width
	"Answer the <Integer> value of the receiver's 'width' field."

	^bytes dwordAtOffset: 0!

width: anInteger
	"Set the receiver's 'width' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger! !
!DXGI_SURFACE_DESC categoriesFor: #format!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #format:!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #height!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #height:!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #SampleDesc!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #SampleDesc:!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #width!**compiled accessors**!public! !
!DXGI_SURFACE_DESC categoriesFor: #width:!**compiled accessors**!public! !

!DXGI_SURFACE_DESC class methodsFor!

defineFields
	"Define the fields of the DXGI_SURFACE_DESC structure.

	DXGI_SURFACE_DESC compileDefinition

		typedef 
		struct tagDXGI_SURFACE_DESC {
			unsigned int width;
			unsigned int height;
			DXGI_FORMAT format;
			DXGI_SAMPLE_DESC SampleDesc;
		} DXGI_SURFACE_DESC;
"

	self
		defineField: #width type: DWORDField new offset: 0;
		defineField: #height type: DWORDField new offset: 4;
		defineField: #format type: SDWORDField new offset: 8;
		defineField: #SampleDesc type: (StructureField type: DXGI_SAMPLE_DESC) offset: 12.
	self byteSize: 20! !
!DXGI_SURFACE_DESC class categoriesFor: #defineFields!**auto generated**!initializing!public! !

