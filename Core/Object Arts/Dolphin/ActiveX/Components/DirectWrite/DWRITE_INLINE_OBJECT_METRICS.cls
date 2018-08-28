"Filed out from Dolphin Smalltalk 7"!

ExternalStructure subclass: #DWRITE_INLINE_OBJECT_METRICS
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
DWRITE_INLINE_OBJECT_METRICS guid: (GUID fromString: '{51e1c6ba-d0c6-4fed-ae62-bf6cdce10ca0}')!
DWRITE_INLINE_OBJECT_METRICS comment: '`DWRITE_INLINE_OBJECT_METRICS` is an `ExternalStructure` class to wrap the struct ''DirectWrite.DWRITE_INLINE_OBJECT_METRICS'' from type information in the ''Windows DirectWrite API'' library.

The type library contains the following helpstring for this struct
	"Properties describing the geometric measurement of an application-defined inline object."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
typedef [uuid(51e1c6ba-d0c6-4fed-ae62-bf6cdce10ca0), helpstring("Properties describing the geometric measurement of an application-defined inline object.")]
struct tagDWRITE_INLINE_OBJECT_METRICS {
	float width;
	float height;
	float baseline;
	BOOL supportsSideways;
} DWRITE_INLINE_OBJECT_METRICS;

```'!
!DWRITE_INLINE_OBJECT_METRICS categoriesForClass!Direct2d-Structs! !
!DWRITE_INLINE_OBJECT_METRICS methodsFor!

baseline
	"Answer the <Float> value of the receiver's 'baseline' field."

	^bytes floatAtOffset: ##(self offsetOf: #baseline)!

baseline: aFloat
	"Set the receiver's 'baseline' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #baseline) put: aFloat!

height
	"Answer the <Float> value of the receiver's 'height' field."

	^bytes floatAtOffset: ##(self offsetOf: #height)!

height: aFloat
	"Set the receiver's 'height' field to the value of the argument, aFloat"

	bytes floatAtOffset: ##(self offsetOf: #height) put: aFloat!

supportsSideways
	"Answer the <Boolean> value of the receiver's 'supportsSideways' field."

	^(bytes dwordAtOffset: ##(self offsetOf: #supportsSideways)) asBoolean!

supportsSideways: aBoolean
	"Set the receiver's 'supportsSideways' field to the value of the argument, aBoolean"

	bytes dwordAtOffset: ##(self offsetOf: #supportsSideways) put: aBoolean asParameter!

width
	"Answer the <Float> value of the receiver's 'width' field."

	^bytes floatAtOffset: 0!

width: aFloat
	"Set the receiver's 'width' field to the value of the argument, aFloat"

	bytes floatAtOffset: 0 put: aFloat! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #baseline!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #baseline:!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #height!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #height:!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #supportsSideways!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #supportsSideways:!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #width!**compiled accessors**!public! !
!DWRITE_INLINE_OBJECT_METRICS categoriesFor: #width:!**compiled accessors**!public! !

!DWRITE_INLINE_OBJECT_METRICS class methodsFor!

defineFields
	"Define the fields of the DWRITE_INLINE_OBJECT_METRICS structure.

	DWRITE_INLINE_OBJECT_METRICS compileDefinition

		typedef [uuid(51e1c6ba-d0c6-4fed-ae62-bf6cdce10ca0), helpstring('Properties describing the geometric measurement of an application-defined inline object.')]
		struct tagDWRITE_INLINE_OBJECT_METRICS {
			float width;
			float height;
			float baseline;
			BOOL supportsSideways;
		} DWRITE_INLINE_OBJECT_METRICS;
"

	self
		defineField: #width type: FLOATField new offset: 0;
		defineField: #height type: FLOATField new offset: 4;
		defineField: #baseline type: FLOATField new offset: 8;
		defineField: #supportsSideways type: BOOLField new offset: 12.
	self byteSize: 16! !
!DWRITE_INLINE_OBJECT_METRICS class categoriesFor: #defineFields!**auto generated**!initializing!public! !

