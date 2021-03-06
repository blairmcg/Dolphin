﻿"Filed out from Dolphin Smalltalk 7"!

Object subclass: #DBAbstractStatement
	instanceVariableNames: 'handle parent executed cursorType'
	classVariableNames: 'CursorTypes'
	poolDictionaries: 'ODBCConstants ODBCRetCodes'
	classInstanceVariableNames: ''!
DBAbstractStatement guid: (GUID fromString: '{f63fc993-6a18-49de-a8d2-07b192c69097}')!
DBAbstractStatement isAbstract: true!
DBAbstractStatement comment: 'A DBAbstractStatements represent commands that can be executed by against a <DBConnection>. DBAbstractStatement is itself abstract. Its most commonly used concrete subclass is <DBStatement>, which can be used to execute SQL statements. Other subclasses represent individual queries that can be performed against the metadata in the database schema using the specific functions provided for this purpose in ODBC. Whatever the form of the command the subclass of statement represents, all yield a <DBResultSet>.

Instance Variables:
	handle		<ExternalHandle>. ODBC statement handle.
	parent		<DBConnection>. The connection on which the statement was (or will be) executed
	executed		<Boolean>. Indicates if the command has been executed yet.
	cursorType	<Symbol>. The symbolic name of the cursor type, e.g. #forwardOnly'!
!DBAbstractStatement categoriesForClass!ODBC Interface! !
!DBAbstractStatement methodsFor!

allocatedHandle
	"Private - Answer the receiver's ODBC statement handle, which is lazily 
	allocated if necessary."

	handle isNull 
		ifTrue: 
			[executed := false.
			handle := parent allocStmtHandle: self.
			self
				beFinalizable;
				setDefaultAttributes].
	^handle!

asParameter
	"Answer the receiver in a form suitable for passing to an external function
	primitive method (see ExternalLibrary and subclasses)."

	^self executedHandle!

basicFree
	"Private - Free up all ODBC resources."

	parent freeStmtHandle: self!

cancel
	"Cancel any outstanding asynchronous request."

	executed 
		ifTrue: 
			[handle isNull 
				ifTrue: [executed := false]
				ifFalse: [self dbCheckException: (ODBCLibrary default sqlCancel: handle)]]!

close
	"Private - Close the cursor, but keep the handle.
	Implementation Note: Use SQLFreeStmt(,SQL_CLOSE), rather than SQLCloseCursor, since the latter
	treats the cursor not actually being open as an error condition, and we don't care about that."

	executed 
		ifTrue: 
			[executed := false.
			handle isNull 
				ifFalse: 
					[self 
						dbCheckException: (ODBCLibrary default sqlFreeStmt: handle option: SQL_CLOSE)]]!

columnLength: anInteger 
	"Answer the length (bytes) of column number anInteger in the Result Set."

	| ret len |
	len := DWORD new.
	ret := ODBCLibrary default 
				sqlColAttribute: self executedHandle
				columnNumber: anInteger
				fieldIdentifier: SQL_COLUMN_LENGTH	"Note using ODBC 2.x definition of column length"
				characterAttributePtr: nil
				bufferLength: 0
				stringLengthPtr: nil
				numericAttributePtr: len.	
	self dbCheckException: ret.
	^len value!

cursorType
	"Answer the symbolic cursor type name (one of #dynamic, #forwardOnly, #keysetDriven or #static)."

	^cursorType!

cursorType: aSymbol 
	(CursorTypes includesKey: aSymbol) 
		ifFalse: [self error: 'Invalid cursor type ' , aSymbol].
	cursorType := aSymbol.
	"Attempting to change the cursorType once the statement has been executed will raise an error"
	handle isNull ifFalse: [self setCursorType]!

dbCheckException: anIntegerRetCode 
	"Private - Checks anIntegerRetCode to see if a DBError or DBWarning should be 
	signalled. Note that as of Dolphin 4.0, DBWarning is actually a notification, which is a 
	more appropriate level of reporting for SQL_SUCCESS_WITH_INFO."

	^anIntegerRetCode = SQL_SUCCESS 
		ifFalse: 
			["Signal an error or warning - decide which"

			(anIntegerRetCode = SQL_SUCCESS_WITH_INFO
				ifTrue: [DBWarning]
				ifFalse: [DBError]) signalWith: (self exceptionDetails: anIntegerRetCode)]!

defaultCursorType
	"Answer the <Symbol>ic name of the default cursor type to be used for statements
	(one of #dynamic, #forwardOnly, #keysetDriven, #static)."

	^self subclassResponsibility!

describeCol: anInteger
	"Answer a DBColAttr object which describes the column with the specified
	<integer> index in the receiver's result set."

	^(self describeCols: (Array with: anInteger)) first!

describeCols: columnNumbers 
	"Answer an array of <DBColAttr>s describing the each of the columns
	of the receiver with indices in the <sequencedReadableCollection> argument."

	| answer i name columnSize colNameLen dataType decimalDigits nullable nameBufSize hStmt colLen lib |
	nameBufSize := self parent maxColumnNameLength+ 1.
	name := String newFixed: nameBufSize.
	colNameLen := SWORD new.
	dataType := SWORD new.
	columnSize := DWORD new.
	decimalDigits := SWORD new.
	nullable := SWORD new.
	colLen := DWORD new.
	hStmt := self executedHandle.
	lib := ODBCLibrary default.
	answer := Array new: columnNumbers size.
	i := 1.
	columnNumbers do: 
			[:each | 
			| ret |
			ret := lib 
						sqlDescribeCol: hStmt
						columnNumber: each
						columnName: name
						bufferLength: nameBufSize
						nameLengthPtr: colNameLen
						dataTypePtr: dataType
						columnSizePtr: columnSize
						decimalDigitsPtr: decimalDigits
						nullablePtr: nullable.
			self dbCheckException: ret.
			ret := lib 
						sqlColAttribute: hStmt
						columnNumber: each
						fieldIdentifier: SQL_COLUMN_LENGTH
						characterAttributePtr: nil
						bufferLength: nil
						stringLengthPtr: nil
						numericAttributePtr: colLen.	"Note using ODBC 2.x definition of column length"
			self dbCheckException: ret.
			answer at: i
				put: ((DBColAttr new)
						columnNumber: each;
						name: (name leftString: colNameLen value);
						type: dataType value;
						length: colLen value;
						precision: columnSize value;
						scale: decimalDigits value).
			i := i + 1].
	^answer!

driverHStmt
	"Private - Answer the handle to the driver statement"

	^ODBCLibrary default getInfoHandle: SQL_DRIVER_HSTMT for: self!

exceptionDetails: anIntegerRetCode
	"Private - Answer a DBExceptionDetails instance that describes the state of the
	receiver following an exception. This will be available as the tag of a subsequent 
	signalled DBError or DBWarning."

	^(self parent exceptionDetails: anIntegerRetCode)
		hStmt: handle;
		yourself.!

exec
	"Private - Execute the tables query the receiver represents."

	self dbCheckException: self executeStatement.
	executed := true.!

executedHandle
	"Private - Answer the receiver's ODBC statement handle having lazily
	executed the SQL statement associated with the receiver."
	
	| answer |
	answer := self allocatedHandle.
	executed ifFalse: [self exec].
	^answer
!

executeStatement
	"Private - Execute the database command that the receiver represents.
	Answer the <integer> return code."

	^self subclassResponsibility!

finalize
	"Private - Free any external resources held by the receiver. 
	Should any error occur we print it to trace but otherwise ignore it."

	[self free] on: DBError do: [ :e | e toTrace]!

free
	"Free up all resources leaving the receiver in a re-usable state."

	handle isNull ifFalse: [[self basicFree] ensure: [self reset]]!

getStringAttribute: anInteger 
	"Private - Answer a <String> containing the value of the statement 
	attribute identified by the <integer> argument."

	| buffer ret |
	buffer := String new: SQL_MAX_OPTION_STRING_LENGTH + 1.
	ret := ODBCLibrary default 
				sqlGetStmtAttr: self allocatedHandle
				attribute: anInteger
				valuePtr: buffer
				bufferLength: buffer size
				stringLengthPtr: nil.
	self dbCheckException: ret.
	^buffer trimNulls!

handle
	^handle!

initialize
	"Private - Initialize a new instance of the receiver."

	self reset.
	cursorType := self defaultCursorType!

initialize: aDBConnection
	"Private - Initialize the receiver as a new statement of the
	<DBConnection>, aDBConnection."

	parent := aDBConnection.
	self initialize!

moveTo: anIntegerRow 
	"Private - Position the cursor at the specified
	row so that it is read on a subsequent Fetch (requires
	extended fetch)"

	self dbCheckException: (ODBCLibrary default 
				sqlSetPos: self executedHandle
				rowNumber: anIntegerRow
				operation: SQL_POSITION
				lockType: SQL_LOCK_NO_CHANGE)!

numColumns
	"Answer the number of columns in the receiver's result set."

	| ccol ret |
	ccol := SWORD new.
	ret := ODBCLibrary default
		sqlNumResultCols: self executedHandle
		pccol: ccol.
	self dbCheckException: ret.
	^ccol value!

numRows
	"Answer the number of rows affected by an UPDATE, DELETE or INSERT command exec'd on
	the receiver. May also work for some SELECTs, although often the answer will be -1
	indicating that the driver does not know."

	| rowCount ret |
	rowCount := SDWORD new.
	ret := ODBCLibrary default sqlRowCount: self executedHandle
				rowCountPtr: rowCount.
	self dbCheckException: ret.
	^rowCount value!

parent
	"Answer the statement's parent <DBConnection> object."

	^parent!

reset
	handle := nil.
	executed := false!

results
	"Answer a <DBResultSet> that manages the results for the receiver.
	The result set will cause the receiver to be lazily executed when
	any attempt is made to access its contents."

	^(self cursorType == #forwardOnly 
		ifTrue: [DBForwardOnlyResultSet]
		ifFalse: [DBResultSet]) statement: self!

setAttribute: attributeInteger value: anIntegerOrStringOrBytes size: sizeInteger 
	| ret |
	ret := ODBCLibrary default 
				sqlSetStmtAttr: self allocatedHandle
				attribute: attributeInteger
				valuePtr: anIntegerOrStringOrBytes
				stringLength: sizeInteger.
	self dbCheckException: ret!

setCursorType
	"Private - Set the cursor type of the statement to one of: #static, #dynamic, #keysetDriven or #forwardOnly. 
	See the ODBC documentation for details of the different cursor types."

	^self 
		setAttribute: SQL_ATTR_CURSOR_TYPE
		value: (CursorTypes at: self cursorType)
		size: SQL_IS_UINTEGER!

setDefaultAttributes
	"Private - Set the default attributes of the statement that need to be set before the statement is prepared."

	self suppressErrorsDo: [self setCursorType]!

statusArray: anArrayOfWORDs 
	"Private - Set the argument to be the receiver's status array attribute."

	self 
		setAttribute: SQL_ATTR_ROW_STATUS_PTR
		value: anArrayOfWORDs
		size: SQL_IS_POINTER!

suppressErrorsDo: aNiladicBlock 
	aNiladicBlock on: DBError do: [:e | e toTrace]! !
!DBAbstractStatement categoriesFor: #allocatedHandle!accessing!private! !
!DBAbstractStatement categoriesFor: #asParameter!accessing!public! !
!DBAbstractStatement categoriesFor: #basicFree!private!realizing/unrealizing! !
!DBAbstractStatement categoriesFor: #cancel!operations!public! !
!DBAbstractStatement categoriesFor: #close!operations!private! !
!DBAbstractStatement categoriesFor: #columnLength:!accessing!public! !
!DBAbstractStatement categoriesFor: #cursorType!accessing!public! !
!DBAbstractStatement categoriesFor: #cursorType:!accessing!public! !
!DBAbstractStatement categoriesFor: #dbCheckException:!exceptions!private! !
!DBAbstractStatement categoriesFor: #defaultCursorType!constants!public! !
!DBAbstractStatement categoriesFor: #describeCol:!accessing!public! !
!DBAbstractStatement categoriesFor: #describeCols:!accessing!public! !
!DBAbstractStatement categoriesFor: #driverHStmt!accessing!private! !
!DBAbstractStatement categoriesFor: #exceptionDetails:!exceptions!private! !
!DBAbstractStatement categoriesFor: #exec!operations!private! !
!DBAbstractStatement categoriesFor: #executedHandle!accessing!private! !
!DBAbstractStatement categoriesFor: #executeStatement!operations!private! !
!DBAbstractStatement categoriesFor: #finalize!finalizing!private! !
!DBAbstractStatement categoriesFor: #free!public!realizing/unrealizing! !
!DBAbstractStatement categoriesFor: #getStringAttribute:!accessing!private! !
!DBAbstractStatement categoriesFor: #handle!accessing!private! !
!DBAbstractStatement categoriesFor: #initialize!initializing!private! !
!DBAbstractStatement categoriesFor: #initialize:!initializing!private! !
!DBAbstractStatement categoriesFor: #moveTo:!accessing!private! !
!DBAbstractStatement categoriesFor: #numColumns!accessing!public! !
!DBAbstractStatement categoriesFor: #numRows!accessing!public! !
!DBAbstractStatement categoriesFor: #parent!accessing!public! !
!DBAbstractStatement categoriesFor: #reset!initializing!private! !
!DBAbstractStatement categoriesFor: #results!accessing!public! !
!DBAbstractStatement categoriesFor: #setAttribute:value:size:!accessing!private! !
!DBAbstractStatement categoriesFor: #setCursorType!helpers!private! !
!DBAbstractStatement categoriesFor: #setDefaultAttributes!initializing!private! !
!DBAbstractStatement categoriesFor: #statusArray:!accessing!private! !
!DBAbstractStatement categoriesFor: #suppressErrorsDo:!accessing!private! !

!DBAbstractStatement class methodsFor!

initialize
	"
		self initialize
	"

	CursorTypes := IdentityDictionary new.
	CursorTypes
		at: #static put: SQL_CURSOR_STATIC;
		at: #forwardOnly put: SQL_CURSOR_FORWARD_ONLY;
		at: #keysetDriven put: SQL_CURSOR_KEYSET_DRIVEN;
		at: #dynamic put: SQL_CURSOR_DYNAMIC;
		shrink!

new
	"Private - Should not implement. Use #parent:"

	^self shouldNotImplement!

parent: aDBConnection
	"Answer an initialized instance of the receiver."

	^super new
		initialize: aDBConnection;
		yourself!

parent: aDBConnection cursorType: aSymbol 
	"Answer an initialized instance of the receiver."

	^(self parent: aDBConnection)
		cursorType: aSymbol;
		yourself!

stbConvertFrom: anSTBClassFormat 
	"Answer a <monadicValuable> to convert from older STB formats. 
		1: Adds 'executed' inst. var."

	^
	[:data | 
	| converted ver newInstance |
	converted := data.
	ver := anSTBClassFormat version.
	ver < 1 ifTrue: [converted := self stbConvertToVersion1: converted].
	ver < 2 ifTrue: [converted := self stbConvertToVersion2: converted].
	newInstance := self basicNew.
	1 to: converted size
		do: [:i | newInstance instVarAt: i put: (converted at: i)].
	newInstance onStartup.
	newInstance]!

stbConvertToVersion1: data 
	"Private - 1: executed inst. var. added to superclass (which is new for v1 too)"

	| instSize |
	instSize := data size + 1.
	^(Array new: instSize)
		replaceFrom: 1
			to: 2
			with: data
			startingAt: 1;
		replaceFrom: 4
			to: instSize
			with: data
			startingAt: 3;
		yourself!

stbConvertToVersion2: data 
	"Private - 2: cursorType and _reserved inst. vars. added"
	| instSize |
	instSize := data size + 1.
	^(Array new: instSize)
		replaceFrom: 1
			to: 3
			with: data
			startingAt: 1;
		replaceFrom: 5
			to: instSize
			with: data
			startingAt: 4;
		at: 4 put: #keysetDriven;		"4 = cursorType"
		yourself!

stbVersion
	"Answer the current binary filer version number for instances of the receiver."

	^2! !
!DBAbstractStatement class categoriesFor: #initialize!initializing!public! !
!DBAbstractStatement class categoriesFor: #new!instance creation!private! !
!DBAbstractStatement class categoriesFor: #parent:!instance creation!public! !
!DBAbstractStatement class categoriesFor: #parent:cursorType:!instance creation!public! !
!DBAbstractStatement class categoriesFor: #stbConvertFrom:!binary filing!public! !
!DBAbstractStatement class categoriesFor: #stbConvertToVersion1:!binary filing!private! !
!DBAbstractStatement class categoriesFor: #stbConvertToVersion2:!binary filing!private! !
!DBAbstractStatement class categoriesFor: #stbVersion!binary filing!public! !

