﻿"Filed out from Dolphin Smalltalk 7"!

IUnknown subclass: #ISAXErrorHandler
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'MSXMLConstants'
	classInstanceVariableNames: ''!
ISAXErrorHandler guid: (IID fromString: '{A60511C4-CCF5-479E-98A3-DC8DC545B7D0}')!
ISAXErrorHandler comment: '<ISAXErrorHandler> is a wrapper class for the COM interface ''MSXML2.ISAXErrorHandler'' generated from type information in the ''Microsoft XML, v4.0'' library. It contains methods to invoke the member functions exposed by that interface.

The type library contains the following helpstring for this interface
	"ISAXErrorHandler interface"

Warning: This comment was automatically generated from the interface''s type information, but any changes made here will not be overwritten if the wrapper class is regenerated.

IDL definition follows:

[
	object, 
	uuid(A60511C4-CCF5-479E-98A3-DC8DC545B7D0), 
	helpstring("ISAXErrorHandler interface"), 
	hidden
]
interface ISAXErrorHandler : IUnknown
 {
	[id(0x60010000)]
	HRESULT __stdcall error(
		[in]ISAXLocator* pLocator,
		[in]unsigned short* pwchErrorMessage,
		[in]HRESULT hrErrorCode);
	[id(0x60010001)]
	HRESULT __stdcall fatalError(
		[in]ISAXLocator* pLocator,
		[in]unsigned short* pwchErrorMessage,
		[in]HRESULT hrErrorCode);
	[id(0x60010002)]
	HRESULT __stdcall ignorableWarning(
		[in]ISAXLocator* pLocator,
		[in]unsigned short* pwchErrorMessage,
		[in]HRESULT hrErrorCode);
};
'!
!ISAXErrorHandler categoriesForClass!COM-Interfaces!MSXML2-Interfaces! !
!ISAXErrorHandler methodsFor!

Error: pLocator pwchErrorMessage: pwchErrorMessage hrErrorCode: hrErrorCode
	"Invoke the error() method of the COM object.

		HRESULT __stdcall error(
			[in]ISAXLocator* pLocator,
			[in]unsigned short* pwchErrorMessage,
			[in]HRESULT hrErrorCode);"

	<virtual stdcall: hresult 4 ISAXLocator* word* hresult>
	^self invalidCall!

FatalError: pLocator pwchErrorMessage: pwchErrorMessage hrErrorCode: hrErrorCode
	"Invoke the fatalError() method of the COM object.

		HRESULT __stdcall fatalError(
			[in]ISAXLocator* pLocator,
			[in]unsigned short* pwchErrorMessage,
			[in]HRESULT hrErrorCode);"

	<virtual stdcall: hresult 5 ISAXLocator* word* hresult>
	^self invalidCall!

IgnorableWarning: pLocator pwchErrorMessage: pwchErrorMessage hrErrorCode: hrErrorCode
	"Invoke the ignorableWarning() method of the COM object.

		HRESULT __stdcall ignorableWarning(
			[in]ISAXLocator* pLocator,
			[in]unsigned short* pwchErrorMessage,
			[in]HRESULT hrErrorCode);"

	<virtual stdcall: hresult 6 ISAXLocator* word* hresult>
	^self invalidCall! !
!ISAXErrorHandler categoriesFor: #Error:pwchErrorMessage:hrErrorCode:!**auto generated**!COM Interfaces-ISAXErrorHandler!public! !
!ISAXErrorHandler categoriesFor: #FatalError:pwchErrorMessage:hrErrorCode:!**auto generated**!COM Interfaces-ISAXErrorHandler!public! !
!ISAXErrorHandler categoriesFor: #IgnorableWarning:pwchErrorMessage:hrErrorCode:!**auto generated**!COM Interfaces-ISAXErrorHandler!public! !

!ISAXErrorHandler class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'MSXML2.ISAXErrorHandler'
		ISAXErrorHandler defineTemplate"

	self
		defineFunction: #Error:pwchErrorMessage:hrErrorCode:
			argumentTypes: 'ISAXLocator* word* hresult';
		defineFunction: #FatalError:pwchErrorMessage:hrErrorCode:
			argumentTypes: 'ISAXLocator* word* hresult';
		defineFunction: #IgnorableWarning:pwchErrorMessage:hrErrorCode:
			argumentTypes: 'ISAXLocator* word* hresult'
! !
!ISAXErrorHandler class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

