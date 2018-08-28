"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #IDWriteFontCollectionLoader
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
IDWriteFontCollectionLoader guid: (IID fromString: '{CCA920E4-52F0-492B-BFA8-29C72EE0A468}')!
IDWriteFontCollectionLoader comment: '`IDWriteFontCollectionLoader` is a wrapper class for the COM interface ''DirectWrite.IDWriteFontCollectionLoader'' generated from type information in the ''Windows DirectWrite API'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"The font collection loader interface is used to construct a collection of fonts given a particular type of key."

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._

IDL definition follows:

```
[
	object, 
	uuid(cca920e4-52f0-492b-bfa8-29c72ee0a468), 
	helpstring("The font collection loader interface is used to construct a collection of fonts given a particular type of key.")
]
interface IDWriteFontCollectionLoader : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall CreateEnumeratorFromKey(
		[in]IDWriteFactory* factory,
		[in]void* collectionKey,
		unsigned int collectionKeySize,
		[out]IDWriteFontFileEnumerator** fontFileEnumerator);
};

```'!
!IDWriteFontCollectionLoader categoriesForClass!COM-Interfaces!Direct2d-Interfaces! !
!IDWriteFontCollectionLoader methodsFor!

createEnumeratorFromKey: factory collectionKey: collectionKey collectionKeySize: collectionKeySize
	"Answer the <IDWriteFontFileEnumerator> result of invoking the CreateEnumeratorFromKey() method of the COM object."

	| answer |
	answer := IDWriteFontFileEnumerator newPointer.
	self
		CreateEnumeratorFromKey: factory
		collectionKey: collectionKey
		collectionKeySize: collectionKeySize
		fontFileEnumerator: answer.
	^answer asObject
!

CreateEnumeratorFromKey: factory collectionKey: collectionKey collectionKeySize: collectionKeySize fontFileEnumerator: fontFileEnumerator
	"Private - Invoke the CreateEnumeratorFromKey() method of the COM object.

		HRESULT __stdcall CreateEnumeratorFromKey(
			[in]IDWriteFactory* factory,
			[in]void* collectionKey,
			unsigned int collectionKeySize,
			[out]IDWriteFontFileEnumerator** fontFileEnumerator);"

	<virtual stdcall: hresult 4 IDWriteFactory* void* dword IDWriteFontFileEnumerator**>
	^self invalidCall! !
!IDWriteFontCollectionLoader categoriesFor: #createEnumeratorFromKey:collectionKey:collectionKeySize:!**auto generated**!methods!public! !
!IDWriteFontCollectionLoader categoriesFor: #CreateEnumeratorFromKey:collectionKey:collectionKeySize:fontFileEnumerator:!**auto generated**!COM Interfaces-IDWriteFontCollectionLoader!private! !

!IDWriteFontCollectionLoader class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'DirectWrite.IDWriteFontCollectionLoader'
		IDWriteFontCollectionLoader defineTemplate"

	self
		defineFunction: #CreateEnumeratorFromKey:collectionKey:collectionKeySize:fontFileEnumerator:
			argumentTypes: 'IDWriteFactory* void* dword IDWriteFontFileEnumerator**'
! !
!IDWriteFontCollectionLoader class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

