"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_GLYPH_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_GLYPH_METRICS guid: (GUID fromString: '{04788540-9b6f-46f7-be7c-66d63a869827}')!
DWRITE_GLYPH_METRICS comment: '`DWRITE_GLYPH_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_GLYPH_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_GLYPH_METRICS structure specifies the metrics of an individual glyph. The units depend on how the metrics are obtained."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(04788540-9b6f-46f7-be7c-66d63a869827), helpstring("The DWRITE_GLYPH_METRICS structure specifies the metrics of an individual glyph. The units depend on how the metrics are obtained.")]
struct tagDWRITE_GLYPH_METRICS {
	int leftSideBearing;
	unsigned int advanceWidth;
	int rightSideBearing;
	int topSideBearing;
	unsigned int advanceHeight;
	int bottomSideBearing;
	int verticalOriginY;
} DWRITE_GLYPH_METRICS;

```'!
!DWRITE_GLYPH_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_GLYPH_METRICS methodsFor!

advanceHeight
	"Answer the <Integer> value of the receiver's 'advanceHeight' field."

	^bytes dwordAtOffset: ##(self offsetOf: #advanceHeight)!

advanceHeight: anInteger
	"Set the receiver's 'advanceHeight' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #advanceHeight) put: anInteger!

advanceWidth
	"Answer the <Integer> value of the receiver's 'advanceWidth' field."

	^bytes dwordAtOffset: ##(self offsetOf: #advanceWidth)!

advanceWidth: anInteger
	"Set the receiver's 'advanceWidth' field to the value of the argument, anInteger"

	bytes dwordAtOffset: ##(self offsetOf: #advanceWidth) put: anInteger!

bottomSideBearing
	"Answer the <Integer> value of the receiver's 'bottomSideBearing' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #bottomSideBearing)!

bottomSideBearing: anInteger
	"Set the receiver's 'bottomSideBearing' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #bottomSideBearing) put: anInteger!

leftSideBearing
	"Answer the <Integer> value of the receiver's 'leftSideBearing' field."

	^bytes sdwordAtOffset: 0!

leftSideBearing: anInteger
	"Set the receiver's 'leftSideBearing' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: 0 put: anInteger!

rightSideBearing
	"Answer the <Integer> value of the receiver's 'rightSideBearing' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #rightSideBearing)!

rightSideBearing: anInteger
	"Set the receiver's 'rightSideBearing' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #rightSideBearing) put: anInteger!

topSideBearing
	"Answer the <Integer> value of the receiver's 'topSideBearing' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #topSideBearing)!

topSideBearing: anInteger
	"Set the receiver's 'topSideBearing' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #topSideBearing) put: anInteger!

verticalOriginY
	"Answer the <Integer> value of the receiver's 'verticalOriginY' field."

	^bytes sdwordAtOffset: ##(self offsetOf: #verticalOriginY)!

verticalOriginY: anInteger
	"Set the receiver's 'verticalOriginY' field to the value of the argument, anInteger"

	bytes sdwordAtOffset: ##(self offsetOf: #verticalOriginY) put: anInteger! !
!DWRITE_GLYPH_METRICS categoriesFor: #advanceHeight!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #advanceHeight:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #advanceWidth!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #advanceWidth:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #bottomSideBearing!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #bottomSideBearing:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #leftSideBearing!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #leftSideBearing:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #rightSideBearing!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #rightSideBearing:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #topSideBearing!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #topSideBearing:!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #verticalOriginY!**compiled accessors**!public! !
!DWRITE_GLYPH_METRICS categoriesFor: #verticalOriginY:!**compiled accessors**!public! !

!DWRITE_GLYPH_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_GLYPH_METRICS structure.

	DWRITE_GLYPH_METRICS compileDefinition

		typedef [uuid(04788540-9b6f-46f7-be7c-66d63a869827), helpstring('The DWRITE_GLYPH_METRICS structure specifies the metrics of an individual glyph. The units depend on how the metrics are obtained.')]
		struct tagDWRITE_GLYPH_METRICS {
			int leftSideBearing;
			unsigned int advanceWidth;
			int rightSideBearing;
			int topSideBearing;
			unsigned int advanceHeight;
			int bottomSideBearing;
			int verticalOriginY;
		} DWRITE_GLYPH_METRICS;
"

	self
		defineField: #leftSideBearing type: SDWORDField new offset: 0;
		defineField: #advanceWidth type: DWORDField new offset: 4;
		defineField: #rightSideBearing type: SDWORDField new offset: 8;
		defineField: #topSideBearing type: SDWORDField new offset: 12;
		defineField: #advanceHeight type: DWORDField new offset: 16;
		defineField: #bottomSideBearing type: SDWORDField new offset: 20;
		defineField: #verticalOriginY type: SDWORDField new offset: 24.
	self byteSize: 28! !
!DWRITE_GLYPH_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

