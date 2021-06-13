"Filed out from Dolphin Smalltalk 7"!

Core.Tests.DolphinTest subclass: #'UI.Tests.DialogViewTest'
	instanceVariableNames: 'owner'
	classVariableNames: ''
	imports: #()
	classInstanceVariableNames: ''
	classConstants: {}!
UI.Tests.DialogViewTest guid: (Core.GUID fromString: '{a8b91e26-354f-4420-9358-156da6d19c83}')!
UI.Tests.DialogViewTest comment: ''!
!UI.Tests.DialogViewTest categoriesForClass!Unclassified! !
!UI.Tests.DialogViewTest methodsFor!

dialogExtent
	^250 @ 350!

evaluateInModalDialog: aBlock
	| dialog |
	dialog := DialogView new.
	dialog
		isInitiallyCentered: true;
		create;
		extent: self dialogExtent.
	
	[
	[[dialog isOpen not or: [dialog isModal]] whileFalse: [2 milliseconds wait].
	aBlock value: dialog]
			ensure: [dialog isModal: false]]
			fork.
	"Use an in-proc loop so the test doesn't cause a new main proc to be spawned. It also allows us to easily terminate the dialog just be setting the isModal flag"
	dialog isInProc: true.
	dialog showModalTo: owner!

tearDown
	owner ifNotNil: [owner destroy].
	super tearDown!

testCenteringInParent
	| actualCenter monitors expectedMonitor dialogMonitor expectedCenter |
	owner := ShellView new.
	owner create.
	monitors := DisplayMonitor desktopMonitors.
	expectedMonitor := monitors size > 1
				ifTrue: 
					["If there is more than one monitor, put the shell on a monitor other than the primary monitor (regression test for #1116)"
					monitors detect: [:each | each isPrimary not]]
				ifFalse: [monitors first].
	owner rectangle: (Rectangle origin: expectedMonitor workArea origin + (100 @ 50) extent: 640 @ 480).
	owner show.
	expectedCenter := owner mapPointToScreen: owner clientRectangle center.
	self evaluateInModalDialog: 
			[:dialog |
			actualCenter := dialog mapPointToScreen: dialog clientRectangle center.
			dialogMonitor := dialog displayMonitor].
	self assert: dialogMonitor equals: expectedMonitor.
	"We expect the client area of the dialog to be centred over the client area of the owner. There might be some rounding error causing the centers to be offset by at most 1"
	self assert: (actualCenter - expectedCenter) abs <= 1!

testRemainsOnScreen
	| rect workArea captureRect |
	owner := ShellView new.
	owner show.
	workArea := SystemMetrics current virtualScreenRectangle.
	"Position the (small) owner top-left so the dialog needs to be bumped back to the origin"
	owner rectangle: (Rectangle origin: workArea origin + (25 @ 25) extent: 75 @ 50).
	captureRect := [:dialog | rect := dialog rectangle].
	self evaluateInModalDialog: captureRect.
	self assert: rect origin equals: workArea topLeft.
	"Now bottom-left"
	owner rectangle: (Rectangle origin: workArea bottomLeft + (25 @ -100) extent: 75 @ 50).
	self evaluateInModalDialog: captureRect.
	self assert: rect origin equals: workArea bottomLeft - (0 @ self dialogExtent y).
	"Now bottom-right"
	owner rectangle: (Rectangle origin: workArea bottomRight + (-75 @ -100) extent: 75 @ 50).
	self evaluateInModalDialog: captureRect.
	self assert: rect origin equals: workArea bottomRight - self dialogExtent.
	"Now top-right"
	owner rectangle: (Rectangle origin: workArea topRight + (-75 @ 25) extent: 75 @ 50).
	self evaluateInModalDialog: captureRect.
	self assert: rect origin equals: workArea topRight - (self dialogExtent x @ 0)! !
!UI.Tests.DialogViewTest categoriesFor: #dialogExtent!constants!private! !
!UI.Tests.DialogViewTest categoriesFor: #evaluateInModalDialog:!helpers!private! !
!UI.Tests.DialogViewTest categoriesFor: #tearDown!public!running! !
!UI.Tests.DialogViewTest categoriesFor: #testCenteringInParent!public!unit tests! !
!UI.Tests.DialogViewTest categoriesFor: #testRemainsOnScreen!public!unit tests! !

