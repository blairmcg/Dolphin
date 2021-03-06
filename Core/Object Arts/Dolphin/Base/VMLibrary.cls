﻿"Filed out from Dolphin Smalltalk 7"!

PermanentLibrary subclass: #VMLibrary
	instanceVariableNames: 'wndProc dlgProc genericCallback vtable specialSelectorStart'
	classVariableNames: 'Registry RegistryKeys WinVerOrGreaterMask'
	poolDictionaries: ''
	classInstanceVariableNames: ''!
VMLibrary guid: (GUID fromString: '{87b4c58f-026e-11d3-9fd7-00a0cc3e4a32}')!
VMLibrary comment: 'VMLibrary is an <ExternalLibrary> to represent the Dolphin Smalltalk Virtual Machine (VM). 

The VM contains, for example, a number of exports to implement pseudo-primitive operations, in particular to simplify the interface to other external library functions, and external call methods to access these exported functions are implemented here.

Instance Variables:
	wndProc 		- <Integer> address of the VM''s window procedure.
	dlgProc 		- <ExternalAddress>. Pointer to the VM''s dialog procedure.
	genericCallback 	- <Integer> address of the VM''s common callback entry point.
	vtable		- <ExternalAddress>. Pointer to the VM''s common virtual table (for implementing C++/COM objects).

Class Variables:
	Registry		- <Array> of <Object>s shared between the VM and the image. 	N.B. It is not possible to modify this object directly, as it is read-only.
	RegistryKeys	- <LookupTable> mapping symbolic names to the <Integer> indices of objects in the VM registry.
'!
!VMLibrary categoriesForClass!External-Libraries! !
!VMLibrary methodsFor!

_snprintf_s: buffer bufferSize: sizeInteger count: countInteger format: format with: arg
	"Private - Write data formatted by the format string into the buffer.
	see _snprintf:count:format:with:with:with: for further information."

	<cdecl: sdword _snprintf_s lpvoid intptr intptr lpstr lpvoid>
	^self invalidCall!

_snprintf_s: buffer bufferSize: sizeInteger count: countInteger format: format with: arg1 with: arg2
	"Private - Write data formatted by the format string into the buffer.
	see _snprintf:count:format:with:with:with: for further information."

	<cdecl: sdword _snprintf_s lpvoid intptr intptr lpstr lpvoid lpvoid>
	^self invalidCall!

addressFromInteger: anInteger
	"Private - Answer a new ExternalAddress instantiated from the argument.
	Implementation Note: AnswerDWORD() is a simple function which returns its 32-bit argument.
	By appropriately specifying the argument and return types, we can use external call
	primitive's argument coercion and return object instantiation, to perform useful type
	conversions very quickly."

	<stdcall: lpvoid AnswerDWORD dword>
	^self invalidCall!

applicationHandle
	"Answer the handle of the Dolphin application instance."

	^Registry at: 123!

argc
	"Private - Answer the number of arguments passed to the host executable at startup"

	<cdecl: sdword argc>
	^self invalidCall!

argv
	"Private - Answer a pointer to the array of UTF-16 strings which constitute the command line arguments, 
	starting with the host executable's full path."

	<cdecl: lpvoid argv>
	^self invalidCall!

basePatchLevel
	"Private - Answer the base patch level of this image. We can assume that the image already
	incorporates patches to this level so we don't allow patches below this to be installed"

	^0!

bytecodeVersion
	"Answer the <integer> bytecode version number.
		VMLibrary default bytecodeVersion
	"

	^Integer fromString: (self versionInfo at: 'PrivateBuild')!

compilerFileName
	"Private - Answer the name of the compiler library."

	^self fileName!

crashDump: message
	"Private - Write a full VM state log to the crash dump file with the <readableString>,
	message, as an exception argument which will appear in the dump.
	This can be handy for debugging in run-time systems when you detect an
	unexpected situation and want the sort of information available in the crash
	dump (the stack state at the time, etc), but you don't actually want to raise a
	non-continuable exception.
		VMLibrary default crashDump: 'Hello'
	N.B. In order for a crash dump to be produced the registry on the machine
	must be appropriately configured."

	| parms str |
	parms := ByteArray new: VMConstants.IntPtrSize.
	str := message asUtf16String.
	parms intPtrAtOffset: 0 put: str yourAddress.
	KernelLibrary default
		raiseException: 16r20000002
		dwExceptionFlags: 0
		nNumberOfArguments: 1
		lpArguments: parms	"Special exception code recognised by the VM"!

crtHandle
	"Private - Answer the handle of the CRTLibrary. This cannot be obtained in the normal way
	as we do not necessarily know which CRT library the VM is itself using."

	^self registryAt: #CRTHandle!

debugDump: msgString
	"Write a VM state log with unconstrained stack and walkback dumps to 
	the OS debug trace device with <readableString> message, 
	msgString, as the header description"

	<stdcall: void DebugDump lpwstr>
	^self invalidCall
!

defaultProductDetails
	"Private - Answers an eight element<Array> describing the default
	 version of the development environment as based on the VM version.

	1. <readableString> Product name 
	2. <readableString> Short product name
	3. <Float> Version number
	4. <readableString> Version special
	5. <Integer> Image patch level
	6 <readableString> Very short name
	7 <readableString> Serial number
	8 <readableString> Boot source version information"

	| version |
	version := self versionInfo.
	^(Array new: 8)
		at: 1 put: (version formatVersionString: '%1 %2!!d!!');
		at: 2 put: (version formatVersionString: '%1');
		at: 3 put: (Float fromString: (version formatVersionString: '%3!!d!!.%4!!d!!'));
		at: 4 put: version specialBuild;
		at: 5 put: self basePatchLevel;
		at: 6 put: 'D7';
		at: 7 put: nil; "Serial #"
		at: 8 put: nil; "Boot info"
		yourself!

dump: msgString path: pathString stackDepth: slotsInteger walkbackDepth: framesInteger
	"Write a VM state log to the file with <readableString> path, pathString, with the 
	<readableString> message, msgString, as the header description, and with the
	stack and walkback depths constrained to the depths specified by the <integer>s, 
	slotInteger and framesInteger, respectively (-1 can be used for unconstrained
	dumps). If either depth is less than that required to dump the entire stack, then
	stack slots or frames (respectively) will be omitted from the dump. In the case of
	the raw stack dump, slots are omitted from the middle of the stack. In the case
	of the walkback, frames are omitted at the bottom of the stack.
	This method can be handy for debugging in run-time systems when you detect an
	unexpected situation and want the sort of information available in the crash
	dump (the stack state at the time, etc), but you don't actually want to raise a
	non-continuable exception, and you want want to output a crash dump using
	parameters (such as the log file) other than those in the registry."

	<stdcall: void Dump lpwstr lpwstr sdword sdword>
	^self invalidCall
!

emptyBlock
	"Private - Answer the singleton empty clean block instance the the compiler installs into methods with empty zero-arg blocks as a space saving optimization."

	^self registry at: 7!

errorIntegerMoreThan32Bits: anInteger
	"Private - Raise an exception to the effect that anInteger cannot be represented
	as a 32-bit two's complement integer (it's too 'large')."

	^self
		error: ('<1d> is too large for 32-bit two''s complement representation.' expandMacrosWith: anInteger)!

fullVersion
	"Answer a String which describes the full name and version number of the VM."

	^self versionInfo formatVersionString: '%1 %2!!d!! release %3!!d!!.%4!!d!!%5!!d!!'!

getDlgProc
	"Private - Answer a pointer to the VM's dialog window procedure.
	The dialog window procedure does nothing except return 0. It's purpose is to act
	as the target of a CallDefaultProc() in order to regularize the interface
	so that there is no difference in handling between dialogs and non-dialogs."

	dlgProc isNil ifTrue: [ dlgProc := self getProcAddress: 'DlgProc' ].
	^dlgProc!

getGenericCallback
	"Private - Answer a pointer to the VM's generic callback function."

	genericCallback isNil ifTrue: [ 
		genericCallback := KernelLibrary default 
				getProcAddressDWORD: self asParameter lpProcName: 'GenericCallback'].
	^genericCallback!

getVTable
	"Private - Answer a pointer to the VM's vtable (a fixed size virtual
	function pointer table for use in conjunction with the COM implementation)."

	vtable isNil ifTrue: [vtable := self getProcAddress: 'VTable'].
	^vtable!

getWndProc
	"Answer a pointer to the VM's window procedure. The VM's window procedure does very little
	except forward messages to Smalltalk for dispatching to the appropriate Window. It
	calls the windows default proc (either the proc. before the window was subclassed by Dolphin
	or the DefWindowProc if a Dolphin Window) if a non-integer value is returned to it."

	"There is not point throwing an error here if it fails, because that will be terminal anyway."
	wndProc isNil ifTrue: [ 
		wndProc := KernelLibrary default 
			getProcAddressDWORD: self asParameter lpProcName: 'WndProc' ].
	^wndProc!

handleFromInteger: anInteger
	"Private - Answer a new ExternalHandle instantiated from the argument.
	Implementation Note: AnswerDWORD() is a simple function which returns its 32-bit argument.
	By appropriately specifying the argument and return types, we can use external call
	primitive's argument coercion and return object instantiation, to perform useful type
	conversions very quickly."

	<stdcall: handle AnswerDWORD dword>
	^ExternalHandle new value: anInteger asInteger!

hashBytes: aByteObject count: anInteger
	"Private - Hash the specified number of bytes at the specified address using the function
	which implements the standard byte hashing primitive (106). "

	"Implementation Notes: The algorithm is FNV1a."

	<cdecl: dword HashBytes lpvoid dword>
	^self invalidCall!

highBit: anInteger
	"Answer the index of the high bit of the argument."

	<stdcall: sdword highBit dword>
	^self invalidCall!

indexOfSpecialSelector: aSymbol ifAbsent: exceptionHandler
	"Private - Answer the index of the special selector, aSymbol, or 
	the result of evalating the niladic valuable, exceptionHandler,
	if aSymbol is not a Special Selector."

	| index |
	index := Registry 
				nextIdentityIndexOf: aSymbol
				from: specialSelectorStart
				to: specialSelectorStart + 31.
	^index == 0 
		ifTrue: [exceptionHandler value]
		ifFalse: [index - specialSelectorStart + 1]!

inputQueueMask
	"Private - Answer the 16-bit <integer> mask to be used when querying for Windows message queue
	input on the host platform. This may vary depending on the version of Windows on which
	Dolphin is running."

	"Implementation Note: See the WinUser.h header file in the Windows SDK"

	| qs_Input |
	qs_Input := self isWindows8OrGreater
				ifTrue: [##(QS_MOUSE | QS_KEY | QS_RAWINPUT | QS_TOUCH | QS_POINTER)]
				ifFalse: 
					[self isWindowsXPOrGreater
						ifTrue: [##(QS_MOUSE | QS_KEY | QS_RAWINPUT)]
						ifFalse: [##(QS_MOUSE | QS_KEY)]].
	^qs_Input | ##(QS_POSTMESSAGE | QS_TIMER | QS_PAINT | QS_HOTKEY | QS_SENDMESSAGE)!

isSlowMachine
	"Answer true if this machine is judged to be slow."

	^(UserLibrary default getSystemMetrics: SM_SLOWMACHINE) ~~ 0

"
	VMLibrary default isSlowMachine
"!

isUserBreakRequested
	"Private - Answer whether the user has pressed the break key sequence. The key sequence is
	configurable through the Development System option 'interruptHotKey', the default being
	set by SmalltalkSystem>>#initialize."

	<cdecl: bool IsUserBreakRequested>
	^self invalidCall!

isWindows10OrGreater
	^self
		isWindowsVersionOrGreater: 10
		wMinorVersion: 0
		wServicePackMajor: 0!

isWindows7OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 1
		wServicePackMajor: 0!

isWindows7SP1OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 1
		wServicePackMajor: 1!

isWindows8OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 2
		wServicePackMajor: 0!

isWindows8Point1OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 3
		wServicePackMajor: 0!

isWindowsServer
	"Answers whether the current OS is a Windows Server release."

	"Implementation Note: This is the equivalent of the IsWindowsServer() version helper
	function, which is provided as an inline function in VersionHelpers.h in the Windows SDK."

	| osvi |
	osvi := OSVERSIONINFOEXW new
				wProductType: VER_NT_WORKSTATION;
				yourself.
	^(KernelLibrary default
		verifyVersionInfo: osvi
		dwTypeMask: VER_PRODUCT_TYPE
		dwlConditionMask: (KernelLibrary default
				verSetConditionMask: 0
				typeMask: VER_PRODUCT_TYPE
				condition: VER_EQUAL))
			not!

isWindowsVersionOrGreater: wMajorVersion wMinorVersion: wMinorVersion wServicePackMajor: wServicePackMajor
	"Answers whether the current OS version matches, or is greater than, the provided version information."

	"Implementation Note: This is the equivalent of the IsWindowsVersionOrGreater() version
	helper function, which is provided as an inline function in VersionHelpers.h in the Windows
	SDK."

	| osvi |
	osvi := (OSVERSIONINFOEXW new)
				dwMajorVersion: wMajorVersion;
				dwMinorVersion: wMinorVersion;
				wServicePackMajor: wServicePackMajor;
				yourself.
	^KernelLibrary default
		verifyVersionInfo: osvi
		dwTypeMask: ##(VER_MAJORVERSION | VER_MINORVERSION | VER_SERVICEPACKMAJOR)
		dwlConditionMask: (WinVerOrGreaterMask
				ifNil: 
					[WinVerOrGreaterMask := KernelLibrary default
								verSetConditionMask: (KernelLibrary default
										verSetConditionMask: (KernelLibrary default
												verSetConditionMask: 0
												typeMask: VER_MAJORVERSION
												condition: VER_GREATER_EQUAL)
										typeMask: VER_MINORVERSION
										condition: VER_GREATER_EQUAL)
								typeMask: VER_SERVICEPACKMAJOR
								condition: VER_GREATER_EQUAL])!

isWindowsVistaOrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 0
		wServicePackMajor: 0!

isWindowsVistaSP1OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 0
		wServicePackMajor: 1!

isWindowsVistaSP2OrGreater
	^self
		isWindowsVersionOrGreater: 6
		wMinorVersion: 0
		wServicePackMajor: 2!

isWindowsXPOrGreater
	^self
		isWindowsVersionOrGreater: 5
		wMinorVersion: 1
		wServicePackMajor: 0!

kernelHandle
	"Private - Answer the handle of the KernelLibrary. This cannot be obtained in the normal way
	because there is a bit of a chicken and egg problem."

	^self registryAt: #KernelHandle!

largeSignedFromUnsigned: anInteger
	"Private - Answer a 64-bit signed integer value instantiated from the unsigned integer
	argument. Use the VM's external call primitive to perform the conversion very quickly."

	<stdcall: sqword AnswerQWORD qword>
	^self invalidCall!

largeUnsignedFromSigned: anInteger
	"Private - Answer a 64-bit signed integer value instantiated from the signed integer
	argument. Use the VM's external call primitive to perform the conversion very quickly."

	<stdcall: qword AnswerQWORD sqword>
	^self invalidCall!

makeLargeSigned: aLARGE_INTEGER
	"Private - Answer an Integer (a SmallInteger or a LargeInteger, whichever is the minimum
	representation) instantiated from the 64-bit signed integer argument.
	This routine is used by the external call primitives, and is exported from the VM
	for reuse from Smalltalk or external primitives."

	<stdcall: sqword AnswerQWORD qword>
	^self invalidCall!

makeLargeSigned: highSDWORD highPart: lowSDWORD
	"Private - Answer an Integer of up to 64 bits, as necessary, to represent the signed
	integer formed from the high and low order DWORD arguments. The result will be zero
	if highSDWORD has its high bit set.
	This routine is an example of a function returing a signed 8-byte integer (sqword)."

	<stdcall: sqword AnswerQWORD sdword dword>
	^self invalidCall!

makeLargeUnsigned: eightBytes
	"Private - Answer a positive Integer (i.e. a SmallInteger or a LargeInteger)
	instantiated from the 64-bit argument."

	<stdcall: qword AnswerQWORD qword>
	^self invalidCall!

makeLargeUnsigned: lowDWORD highPart: highDWORD
	"Private - Answer an Integer of up to 64 bits, as necessary, to represent the unsigned
	integer formed from the high and low order DWORD arguments.
	This routine is an example of a qword (8-byte Integer) return type."

	<stdcall: qword AnswerQWORD dword dword>
	^self invalidCall!

onStartup
	"Initialize the receiver immediately following system startup.
	THIS MUST BE DONE FIRST."

	handle := Registry at: 122.
	specialSelectorStart := RegistryKeys at: #arithmeticSelectors.
	wndProc := dlgProc := vtable := genericCallback := nil.
	WinVerOrGreaterMask := nil!

primRegistryAt:  anInteger put: anObject
	"Private - Generic VM object registering primitive. Used to register cookies, Semaphores,
	the Corpse object, etc.

	Equivalent to 'Registry at: anInteger put: anObject', but allows the VM to reload any
	information it caches.

	Primitive failure reasons:
		0 -	anInteger is not a SmallInteger
		1 -	anInteger is out of the bounds of the registry
		2 -	anObject is not of the appropriate class for the object being registered."

	<primitive: 93>
	^self primitiveFailed!

productName
	"Answer the localised name for Dolphin."

	^self versionInfo productName
!

registerEventSource: aString
	<stdcall: handle RegisterAsEventSource lpwstr>
	^self invalidCall
!

registry
	"Private - Answer the VM registry of objects."

	^Registry!

registryAt: aSymbol 
	"Private - Answer the VM registered object with the name, aSymbol."

	^Registry at: (RegistryKeys at: aSymbol)!

registryAt: aSymbol put: anObject 
	"Private - Register the argument, anObject, as the VM registered object with the name,
	aSymbol."

	self primRegistryAt: (RegistryKeys at: aSymbol) put: anObject.
	^anObject!

selectorOfSpecialSend: anInteger
	^Registry at: specialSelectorStart + anInteger!

selectorOfSpecialSendEx: anInteger
	^Registry at: 71 + anInteger!

shortName
	"Answer the localised short name for Dolphin."

	^String fromId: 129 in: self!

signedFromUnsigned: anInteger
	"Private - Answer a 32-bit signed integer value instantiated from the unsigned 32-bit integer
	argument. Use the VM's external call primitive to perform the conversion very quickly."

	<stdcall: sdword AnswerDWORD dword>
	^anInteger isInteger
		ifTrue: [self errorIntegerMoreThan32Bits: anInteger]
		ifFalse: [self invalidCall]!

specialSelectors
	"Private - Answer all special messages that have their own individual bytecodes.
		VMLibrary default specialSelectors
	"

	| selectors |
	selectors := IdentitySet new: 36.
	specialSelectorStart to: specialSelectorStart + 31 do: [:i | selectors add: (Registry at: i)].
	71 to: 74 do: [:i | selectors add: (Registry at: i)].
	^selectors!

stderr
	"Private - Answer the handle of the CRT stdio standard error stream"

	<cdecl: handle StdErr>
	^self invalidCall!

stdin
	"Private - Answer the handle of the CRT stdio standard input stream"

	<cdecl: handle StdIn>
	^self invalidCall!

stdout
	"Private - Answer the handle of the CRT stdio standard output stream"

	<cdecl: handle StdOut>
	^self invalidCall!

stringFromAddress: pointer 
	"Private - Answer a new String instantiated from the null-terminated String pointed 
	at by the argument.
	Implementation Note: AnswerDWORD() is a simple function which returns its 32-bit argument.
	By appropriately specifying the argument and return types, we can use external call
	primitive's argument coercion and return object instantiation, to perform useful type
	conversions very quickly."

	| addr len |
	<stdcall: lpstr AnswerDWORD lpvoid>
	addr := pointer isInteger ifTrue: [pointer asExternalAddress] ifFalse: [pointer].
	len := addr indexOf: 0.
	^addr copyStringFrom: 1 to: len - 1!

unregisterObject: anObject 
	| i |
	i := self registry identityIndexOf: anObject.
	i > 0 ifFalse: [^self].
	Notification signal: 'Unregistering VM ref ' , anObject printString.
	self primRegistryAt: i put: nil!

unsignedFromSigned: anInteger
	"Private - Answer a 32-bit unsigned integer value instantiated from the signed 32-bit integer
	argument.
	Implementation Note: AnswerDWORD() is a simple function which returns its 32-bit argument.
	By appropriately specifying the argument and return types, we can use external call
	primitive's argument coercion and return object instantiation, to perform useful type
	conversions very quickly."

	<stdcall: dword AnswerDWORD sdword>
	^anInteger isInteger
		ifTrue: [self errorIntegerMoreThan32Bits: anInteger]
		ifFalse: [self invalidCall]!

versionFormatString
	"Private - Answer a String containing the version format used by the receiver."

	^'%3!!d!!.%4!!d!!%5!!d!!'! !
!VMLibrary categoriesFor: #_snprintf_s:bufferSize:count:format:with:!helpers!private! !
!VMLibrary categoriesFor: #_snprintf_s:bufferSize:count:format:with:with:!helpers!private! !
!VMLibrary categoriesFor: #addressFromInteger:!helpers!private! !
!VMLibrary categoriesFor: #applicationHandle!accessing-handles!public! !
!VMLibrary categoriesFor: #argc!accessing!private! !
!VMLibrary categoriesFor: #argv!accessing!private! !
!VMLibrary categoriesFor: #basePatchLevel!constants!patching!private! !
!VMLibrary categoriesFor: #bytecodeVersion!accessing-version!public! !
!VMLibrary categoriesFor: #compilerFileName!accessing!private! !
!VMLibrary categoriesFor: #crashDump:!exceptions!private! !
!VMLibrary categoriesFor: #crtHandle!accessing-handles!private! !
!VMLibrary categoriesFor: #debugDump:!exceptions!private! !
!VMLibrary categoriesFor: #defaultProductDetails!accessing!private! !
!VMLibrary categoriesFor: #dump:path:stackDepth:walkbackDepth:!exceptions!private! !
!VMLibrary categoriesFor: #emptyBlock!accessing-handles!private! !
!VMLibrary categoriesFor: #errorIntegerMoreThan32Bits:!exceptions!private! !
!VMLibrary categoriesFor: #fullVersion!accessing-version!public! !
!VMLibrary categoriesFor: #getDlgProc!accessing-callbacks!private! !
!VMLibrary categoriesFor: #getGenericCallback!accessing-callbacks!private! !
!VMLibrary categoriesFor: #getVTable!accessing-callbacks!private! !
!VMLibrary categoriesFor: #getWndProc!accessing-callbacks!public! !
!VMLibrary categoriesFor: #handleFromInteger:!helpers!private! !
!VMLibrary categoriesFor: #hashBytes:count:!hash algorithms!helpers!private! !
!VMLibrary categoriesFor: #highBit:!arithmetic!public! !
!VMLibrary categoriesFor: #indexOfSpecialSelector:ifAbsent:!accessing-registry!private! !
!VMLibrary categoriesFor: #inputQueueMask!constants!private! !
!VMLibrary categoriesFor: #isSlowMachine!environment!public! !
!VMLibrary categoriesFor: #isUserBreakRequested!accessing!helpers!private! !
!VMLibrary categoriesFor: #isWindows10OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindows7OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindows7SP1OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindows8OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindows8Point1OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsServer!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsVersionOrGreater:wMinorVersion:wServicePackMajor:!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsVistaOrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsVistaSP1OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsVistaSP2OrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #isWindowsXPOrGreater!public!win32 functions-version helpers! !
!VMLibrary categoriesFor: #kernelHandle!accessing-handles!private! !
!VMLibrary categoriesFor: #largeSignedFromUnsigned:!helpers!private! !
!VMLibrary categoriesFor: #largeUnsignedFromSigned:!helpers!private! !
!VMLibrary categoriesFor: #makeLargeSigned:!helpers!private! !
!VMLibrary categoriesFor: #makeLargeSigned:highPart:!helpers!private! !
!VMLibrary categoriesFor: #makeLargeUnsigned:!helpers!private! !
!VMLibrary categoriesFor: #makeLargeUnsigned:highPart:!helpers!private! !
!VMLibrary categoriesFor: #onStartup!event handling!public! !
!VMLibrary categoriesFor: #primRegistryAt:put:!accessing-registry!private! !
!VMLibrary categoriesFor: #productName!accessing!public! !
!VMLibrary categoriesFor: #registerEventSource:!arithmetic!public! !
!VMLibrary categoriesFor: #registry!accessing!private! !
!VMLibrary categoriesFor: #registryAt:!accessing-registry!private! !
!VMLibrary categoriesFor: #registryAt:put:!accessing-registry!private! !
!VMLibrary categoriesFor: #selectorOfSpecialSend:!enquiries!private! !
!VMLibrary categoriesFor: #selectorOfSpecialSendEx:!enquiries!private! !
!VMLibrary categoriesFor: #shortName!accessing!public! !
!VMLibrary categoriesFor: #signedFromUnsigned:!helpers!private! !
!VMLibrary categoriesFor: #specialSelectors!accessing-registry!private! !
!VMLibrary categoriesFor: #stderr!accessing-handles!private! !
!VMLibrary categoriesFor: #stdin!accessing-handles!private! !
!VMLibrary categoriesFor: #stdout!accessing-handles!private! !
!VMLibrary categoriesFor: #stringFromAddress:!helpers!private! !
!VMLibrary categoriesFor: #unregisterObject:!accessing-registry!private! !
!VMLibrary categoriesFor: #unsignedFromSigned:!helpers!private! !
!VMLibrary categoriesFor: #versionFormatString!constants!private! !

!VMLibrary class methodsFor!

fileName
	"Answer the host system file name of the library. This may vary."

	^self shouldNotImplement!

hasBytecodeRepresentation: anObject
	"Private - Answer whether the specified object has a special instruction or instructions that when
	executed will push an identical object on the on the stack, e.g. nil, true, false,
	SmallIntegers, byte Characters."

	^anObject isImmediate or: 
			[anObject isNil or: 
					[anObject == true
						or: [anObject == false or: [anObject class == Character and: [anObject codePoint <= 127]]]]]!

initialize
	"Private - Initialize the receiver's class variables - see class comment for further details.

		VMLibrary initialize
	"

	"Registry := DO NOT ASSIGN ME."

	##(RegistryKeys := (IdentityDictionary new)
				at: #Smalltalk put: 9;
				at: #Processor put: 10;
				at: #arithmeticSelectors put: 16;
				at: #commonSelectors put: 31;
				at: #Metaclass put: 81;
				at: #Character put: 82;
				at: #Array put: 83;
				at: #AnsiString put: 84;
				at: #Symbol put: 85;
				at: #SmallInteger put: 86;
				at: #Process put: 87;
				at: #CompiledMethod put: 88;
				at: #Context put: 89;
				at: #BlockClosure put: 90;
				at: #Message put: 91;
				at: #ByteArray put: 92;
				at: #Utf16String put: 93;
				at: #CompiledExpression put: 94;
				at: #ExternalMethod put: 95;
				at: #Float put: 96;
				at: #UndefinedObject put: 97;
				at: #VariableBinding put: 98;
				at: #Semaphore put: 99;
				at: #ExternalAddress put: 100;
				at: #ExternalHandle put: 101;
				at: #Dispatcher put: 102;
				at: #LPVOID put: 103;
				at: #Utf8String put: 104;
				at: #LargeInteger put: 107;
				at: #VARIANT put: 108;
				at: #BSTR put: 109;
				at: #DATE put: 110;
				at: #Corpse put: 111;
				at: #InputSemaphore put: 112;
				at: #FinalizeSemaphore put: 113;
				at: #BereavementSemaphore put: 114;
				at: #FinalizeQueue put: 118;
				at: #BereavementQueue put: 119;
				at: #GUID put: 120;
				at: #KernelHandle put: 121;
				at: #VMHandle put: 122;
				at: #DolphinHandle put: 123;
				at: #IUnknown put: 124;
				at: #WakeupEvent put: 125;
				at: #MsgWndHandle put: 127;
				at: #IDispatch put: 128;
				at: #ImageVersionMajor put: 129;
				at: #ImageVersionMinor put: 130;
				at: #interruptHotKey put: 131;
				at: #CRTHandle put: 132;
				at: #memoryManager put: 133;
				at: #BYTE put: 134;
				at: #SBYTE put: 135;
				at: #WORD put: 136;
				at: #SWORD put: 137;
				at: #DWORD put: 138;
				at: #SDWORD put: 139;
				at: #FLOAT put: 140;
				at: #DOUBLE put: 141;
				at: #VARIANT_BOOL put: 142;
				at: #CURRENCY put: 143;
				at: #DECIMAL put: 144;
				at: #LPBSTR put: 145;
				at: #ULARGE_INTEGER put: 146;
				at: #LARGE_INTEGER put: 147;
				at: #TimingSemaphore put: 150;
				isImmutable: true;
				shrink;
				yourself)!

maxBlockNesting
	^VMConstants.MaxBlockNesting!

maxLiterals
	^VMConstants.MaxLiterals!

maxMessageArguments
	^VMConstants.MaxMessageArgs!

maxTemps
	^VMConstants.MaxTemps!

open
	"Answer the singleton instance of the receiver (it cannot be re-opened)"

	^default!

registryKeys
	"Private - Answer the map between symbolic names and VM registry indices."

	^RegistryKeys! !
!VMLibrary class categoriesFor: #fileName!constants!public! !
!VMLibrary class categoriesFor: #hasBytecodeRepresentation:!helpers!private! !
!VMLibrary class categoriesFor: #initialize!development!initializing!private! !
!VMLibrary class categoriesFor: #maxBlockNesting!limits!public! !
!VMLibrary class categoriesFor: #maxLiterals!limits!public! !
!VMLibrary class categoriesFor: #maxMessageArguments!limits!public! !
!VMLibrary class categoriesFor: #maxTemps!limits!public! !
!VMLibrary class categoriesFor: #open!instance creation!public! !
!VMLibrary class categoriesFor: #registryKeys!constants!private! !

