﻿"Filed out from Dolphin Smalltalk 7"!

AbstractIN_ADDR subclass: #IN_ADDR
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
IN_ADDR guid: (GUID fromString: '{87b4c5f6-026e-11d3-9fd7-00a0cc3e4a32}')!
IN_ADDR comment: '<IN_ADDR> is an <ExternalStructure> class to wrap the struct ''Win32.IN_ADDR'' from type information in the ''Win32 API'' library.

The type library contains the following helpstring for this struct
	"IPv4 Internet address. This is an ''on-wire'' format structure."

Warning: This comment was automatically generated from the struct''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

typedef [uuid(87B4C5F6-026E-11D3-9FD7-00A0CC3E4A32), helpstring("IPv4 Internet address. This is an ''on-wire'' format structure.")]
struct tagIN_ADDR {
	union {
		[hidden] struct {
			BYTE s_b1;
			BYTE s_b2;
			BYTE s_b3;
			BYTE s_b4;
		};
		[hidden] struct {
			USHORT s_w1;
			USHORT s_w2;
		};
		ULONG s_addr;
	};
} IN_ADDR;
'!
!IN_ADDR categoriesForClass!Win32-Structs! !
!IN_ADDR methodsFor!

address
	"Answers the InternetAddress for the receiver"

	^InternetAddress ipAddress: self!

address: anInternetAddress
	"Sets the address for the receiver to anInternetAddress"

	self s_addr: anInternetAddress ipAddress!

s_addr
	"Answer the <Integer> value of the receiver's 's_addr' field."

	^bytes dwordAtOffset: 0!

s_addr: anInteger
	"Set the receiver's 's_addr' field to the value of the argument, anInteger"

	bytes dwordAtOffset: 0 put: anInteger! !
!IN_ADDR categoriesFor: #address!accessing!public! !
!IN_ADDR categoriesFor: #address:!accessing!public! !
!IN_ADDR categoriesFor: #s_addr!**compiled accessors**!public! !
!IN_ADDR categoriesFor: #s_addr:!**compiled accessors**!public! !

!IN_ADDR class methodsFor!

address: anInternetAddress 
	^(self new)
		address: anInternetAddress;
		yourself!

addressFamily
	^WinSocketConstants.AF_INET!

defineFields
	"Define the fields of the IN_ADDR structure.

	IN_ADDR compileDefinition

		typedef [uuid(87b4c5f6-026e-11d3-9fd7-00a0cc3e4a32), helpstring('IPv4 Internet address. This is an 'on-wire' format structure.')]
		struct tagIN_ADDR {
			union {
				[hidden] struct {
					UCHAR s_b1;
					UCHAR s_b2;
					UCHAR s_b3;
					UCHAR s_b4;
				};
				[hidden] struct {
					USHORT s_w1;
					USHORT s_w2;
				};
				ULONG s_addr;
			};
		} IN_ADDR;
"

	self
		defineField: #s_b1 type: BYTEField new beFiller offset: 0;
		defineField: #s_b2 type: BYTEField new beFiller offset: 1;
		defineField: #s_b3 type: BYTEField new beFiller offset: 2;
		defineField: #s_b4 type: BYTEField new beFiller offset: 3;
		defineField: #s_w1 type: WORDField new beFiller offset: 0;
		defineField: #s_w2 type: WORDField new beFiller offset: 2;
		defineField: #s_addr type: DWORDField new offset: 0.
	self byteSize: 4! !
!IN_ADDR class categoriesFor: #address:!instance creation!public! !
!IN_ADDR class categoriesFor: #addressFamily!constants!public! !
!IN_ADDR class categoriesFor: #defineFields!**auto generated**!initializing!public! !

