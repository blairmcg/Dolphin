"Filed out from Dolphin Smalltalk 7"!

ExternalLibrary subclass: #Direct2dLibrary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'Direct2dConstants'
	classInstanceVariableNames: ''!
Direct2dLibrary guid: (GUID fromString: '{e55ac741-0bd6-4346-b5ba-98e93d9694c7}')!
Direct2dLibrary comment: 'Direct2dLibrary is the `ExternalLibrary` class to represent the dynamic link library, ''D2d1.DLL''.It was generated generated from type information in the ''Windows Direct2D API'' library. It contains methods for each of the functions defined by the corresponding module in that type library.

The type library contains the following helpstring for this module
	"Direct2d API"

_This comment was automatically generated from a type library. Delete this line to prevent any manual edits from being overwritten if the wrapper class is regenerated._
'!
!Direct2dLibrary categoriesForClass!Direct2d-Modules! !
!Direct2dLibrary methodsFor!

d2d1CreateFactory: factory_type iid: iid factory_options: factory_options factory: factory
	"Invoke the D2D1CreateFactory() function of the module wrapped by the receiver.

		HRESULT __stdcall D2D1CreateFactory(
			D2D1_FACTORY_TYPE factory_type,
			GUID* iid,
			D2D1_FACTORY_OPTIONS* factory_options,
			void** factory);"

	<stdcall: hresult D2D1CreateFactory sdword GUID* D2D1_FACTORY_OPTIONS* void**>
	^self invalidCall!

d2d1MakeRotateMatrix: angle center: center matrix: matrix
	"Invoke the D2D1MakeRotateMatrix() function of the module wrapped by the receiver.

		void __stdcall D2D1MakeRotateMatrix(
			float angle,
			D2D_POINT_2F center,
			D2D_MATRIX_3X2_F* matrix);"

	<stdcall: void D2D2MakeRotateMatrix float D2D_POINT_2F D2D_MATRIX_3X2_F*>
	^self invalidCall! !
!Direct2dLibrary categoriesFor: #d2d1CreateFactory:iid:factory_options:factory:!**auto generated**!public! !
!Direct2dLibrary categoriesFor: #d2d1MakeRotateMatrix:center:matrix:!**auto generated**!public! !

!Direct2dLibrary class methodsFor!

fileName
	"Answer the host system file name for the library."

	^'D2d1'
! !
!Direct2dLibrary class categoriesFor: #fileName!**auto generated**!constants!public! !

