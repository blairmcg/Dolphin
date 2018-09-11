"Filed out from Dolphin Smalltalk 7"!

ExternalLibrary subclass: #DirectWriteLibrary
	instanceVariableNames: ''
	classVariableNames: 'Factory'
	poolDictionaries: 'DirectWriteConstants'
	classInstanceVariableNames: ''!
DirectWriteLibrary guid: (GUID fromString: '{d8d5e1fe-d0ba-42cb-b292-581a0c72a988}')!
DirectWriteLibrary comment: 'DirectWriteLibrary is the <ExternalLibrary> class to represent the dynamic link library, ''dwrite.DLL''.It was generated generated from type information in the ''Windows Direct2D API'' library. It contains methods for each of the functions defined by the corresponding module in that type library.

The type library contains the following helpstring for this module
	"DirectWrite API"

** This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated. **
'!
!DirectWriteLibrary categoriesForClass!Direct2d-Modules! !
!DirectWriteLibrary methodsFor!

dWriteCreateFactory: factoryType iid: iid factory: factory
	"Invoke the DWriteCreateFactory() function of the module wrapped by the receiver.
	Helpstring: Creates a DirectWrite factory object that is used for subsequent creation of individual DirectWrite objects.

		HRESULT __stdcall DWriteCreateFactory(
			[in]DWRITE_FACTORY_TYPE factoryType,
			[in]GUID* iid,
			[out]IUnknown** factory);"

	<stdcall: hresult DWriteCreateFactory sdword GUID* IUnknown**>
	^self invalidCall! !
!DirectWriteLibrary categoriesFor: #dWriteCreateFactory:iid:factory:!**auto generated**!public! !

!DirectWriteLibrary class methodsFor!

factory
	Factory isNull ifTrue: [
		Factory := IDWriteFactory newPointer.
		self default dWriteCreateFactory: DWRITE_FACTORY_TYPE_SHARED iid: IDWriteFactory iid factory: Factory].
	^Factory!

fileName
	"Answer the host system file name for the library."

	^'dwrite'
!

gdiInterop
	^self factory gdiInterop! !
!DirectWriteLibrary class categoriesFor: #factory!accessing!public! !
!DirectWriteLibrary class categoriesFor: #fileName!**auto generated**!constants!public! !
!DirectWriteLibrary class categoriesFor: #gdiInterop!accessing!public! !

