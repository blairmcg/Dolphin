"Filed out from Dolphin Smalltalk 7"!

DirectWriteStructure subclass: #DWRITE_FONT_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_FONT_METRICS guid: (GUID fromString: '{fe637b79-8c6d-4208-a2d7-f490b3b9f4cb}')!
DWRITE_FONT_METRICS comment: '`DWRITE_FONT_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_FONT_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"The DWRITE_FONT_METRICS structure specifies the metrics of a font face that are applicable to all glyphs within the font face."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(fe637b79-8c6d-4208-a2d7-f490b3b9f4cb), helpstring("The DWRITE_FONT_METRICS structure specifies the metrics of a font face that are applicable to all glyphs within the font face.")]
struct tagDWRITE_FONT_METRICS {
	unsigned short designUnitsPerEm;
	unsigned short ascent;
	unsigned short descent;
	short lineGap;
	unsigned short capHeight;
	unsigned short xHeight;
	short underlinePosition;
	unsigned short underlineThickness;
	short strikethroughPosition;
	unsigned short strikethroughThickness;
} DWRITE_FONT_METRICS;

```'!
!DWRITE_FONT_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_FONT_METRICS methodsFor!

ascent
	"Answer the <Integer> value of the receiver's 'ascent' field."

	^bytes wordAtOffset: ##(self offsetOf: #ascent)!

ascent: anInteger
	"Set the receiver's 'ascent' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #ascent) put: anInteger!

capHeight
	"Answer the <Integer> value of the receiver's 'capHeight' field."

	^bytes wordAtOffset: ##(self offsetOf: #capHeight)!

capHeight: anInteger
	"Set the receiver's 'capHeight' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #capHeight) put: anInteger!

descent
	"Answer the <Integer> value of the receiver's 'descent' field."

	^bytes wordAtOffset: ##(self offsetOf: #descent)!

descent: anInteger
	"Set the receiver's 'descent' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #descent) put: anInteger!

designUnitsPerEm
	"Answer the <Integer> value of the receiver's 'designUnitsPerEm' field."

	^bytes wordAtOffset: 0!

designUnitsPerEm: anInteger
	"Set the receiver's 'designUnitsPerEm' field to the value of the argument, anInteger"

	bytes wordAtOffset: 0 put: anInteger!

lineGap
	"Answer the <Integer> value of the receiver's 'lineGap' field."

	^bytes swordAtOffset: ##(self offsetOf: #lineGap)!

lineGap: anInteger
	"Set the receiver's 'lineGap' field to the value of the argument, anInteger"

	bytes swordAtOffset: ##(self offsetOf: #lineGap) put: anInteger!

strikethroughPosition
	"Answer the <Integer> value of the receiver's 'strikethroughPosition' field."

	^bytes swordAtOffset: ##(self offsetOf: #strikethroughPosition)!

strikethroughPosition: anInteger
	"Set the receiver's 'strikethroughPosition' field to the value of the argument, anInteger"

	bytes swordAtOffset: ##(self offsetOf: #strikethroughPosition) put: anInteger!

strikethroughThickness
	"Answer the <Integer> value of the receiver's 'strikethroughThickness' field."

	^bytes wordAtOffset: ##(self offsetOf: #strikethroughThickness)!

strikethroughThickness: anInteger
	"Set the receiver's 'strikethroughThickness' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #strikethroughThickness) put: anInteger!

underlinePosition
	"Answer the <Integer> value of the receiver's 'underlinePosition' field."

	^bytes swordAtOffset: ##(self offsetOf: #underlinePosition)!

underlinePosition: anInteger
	"Set the receiver's 'underlinePosition' field to the value of the argument, anInteger"

	bytes swordAtOffset: ##(self offsetOf: #underlinePosition) put: anInteger!

underlineThickness
	"Answer the <Integer> value of the receiver's 'underlineThickness' field."

	^bytes wordAtOffset: ##(self offsetOf: #underlineThickness)!

underlineThickness: anInteger
	"Set the receiver's 'underlineThickness' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #underlineThickness) put: anInteger!

xHeight
	"Answer the <Integer> value of the receiver's 'xHeight' field."

	^bytes wordAtOffset: ##(self offsetOf: #xHeight)!

xHeight: anInteger
	"Set the receiver's 'xHeight' field to the value of the argument, anInteger"

	bytes wordAtOffset: ##(self offsetOf: #xHeight) put: anInteger! !
!DWRITE_FONT_METRICS categoriesFor: #ascent!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #ascent:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #capHeight!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #capHeight:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #descent!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #descent:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #designUnitsPerEm!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #designUnitsPerEm:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #lineGap!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #lineGap:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #strikethroughPosition!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #strikethroughPosition:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #strikethroughThickness!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #strikethroughThickness:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #underlinePosition!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #underlinePosition:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #underlineThickness!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #underlineThickness:!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #xHeight!**compiled accessors**!public! !
!DWRITE_FONT_METRICS categoriesFor: #xHeight:!**compiled accessors**!public! !

!DWRITE_FONT_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_FONT_METRICS structure.

	DWRITE_FONT_METRICS compileDefinition

		typedef [uuid(fe637b79-8c6d-4208-a2d7-f490b3b9f4cb), helpstring('The DWRITE_FONT_METRICS structure specifies the metrics of a font face that are applicable to all glyphs within the font face.')]
		struct tagDWRITE_FONT_METRICS {
			unsigned short designUnitsPerEm;
			unsigned short ascent;
			unsigned short descent;
			short lineGap;
			unsigned short capHeight;
			unsigned short xHeight;
			short underlinePosition;
			unsigned short underlineThickness;
			short strikethroughPosition;
			unsigned short strikethroughThickness;
		} DWRITE_FONT_METRICS;
"

	self
		defineField: #designUnitsPerEm type: WORDField new offset: 0;
		defineField: #ascent type: WORDField new offset: 2;
		defineField: #descent type: WORDField new offset: 4;
		defineField: #lineGap type: SWORDField new offset: 6;
		defineField: #capHeight type: WORDField new offset: 8;
		defineField: #xHeight type: WORDField new offset: 10;
		defineField: #underlinePosition type: SWORDField new offset: 12;
		defineField: #underlineThickness type: WORDField new offset: 14;
		defineField: #strikethroughPosition type: SWORDField new offset: 16;
		defineField: #strikethroughThickness type: WORDField new offset: 18.
	self byteSize: 20! !
!DWRITE_FONT_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

