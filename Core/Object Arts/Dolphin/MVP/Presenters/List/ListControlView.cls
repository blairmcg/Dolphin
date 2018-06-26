﻿"Filed out from Dolphin Smalltalk 7"!

ControlView subclass: #ListControlView
	instanceVariableNames: 'getTextBlock'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!
ListControlView guid: (GUID fromString: '{8db728e5-721c-4e56-b449-5fd43d00e1ba}')!
ListControlView isAbstract: true!
ListControlView comment: 'ListControlView is the abstract class of <ControlView>s that display a list of items, for example the standard Windows Listbox, Listview and Treeview controls, each of which has a concrete subclass to represent it.

Instance Variables:
	getTextBlock		<monadicValuable> evaluated to get the text to be displayed for an entry in the list.

'!
!ListControlView categoriesForClass!MVP-Views! !
!ListControlView methodsFor!

addSelections: aCollection 
	"Adds selection to the objects in aCollection in the receiver. If any of the objects in
	aCollection are not present then signal a <NotFoundError>. Note that aCollection should
	contain duplicates. Answer aCollection."

	^self addSelections: aCollection ifAbsent: [:missing | self errorNotFound: missing]!

addSelections: aCollection ifAbsent: exceptionHandler 
	"Adds each of the items in the duplicate-free <collection> of <Object>s, aCollection, to the
	set of current selections in the multi-select list. If any of the objects in the new
	selection are not present then answer the result of evaluating the <monadicValuable>,
	exceptionHandler, with a <collection> of the missing candidate selections as its argument.
	If all selections are successfully made then answer aCollection."

	| missing indices |
	missing := Set new.
	indices := self handlesFromObjects: aCollection whenAbsent: [:absent | missing add: absent].
	self addSelectionsByIndex: indices.
	^missing isEmpty ifTrue: [aCollection] ifFalse: [exceptionHandler value: missing]!

addSelectionsByIndex: aCollection 
	"Add selection to the items in the receiver with the Integer indices
	in collection."

	self selectIndices: aCollection set: true.

	"Windows only sends the change notification
	when the selection is the result of a user action so
	force it here"
	self onSelChanged!

anchorIndex
	"Answer the 1-based <integer> index of the anchor (the item from which a multiple selection
	will start), or 0 if none."

	"N.B. The ListView documentation calls this concept the 'selection mark', while that for the
	older ListBox refers to it as the 'anchor'. Since they behave the same, we standardize on
	what seems like the shorter, clearer name. For subclasses that do not support multiple
	selections, this will always be zero."

	^0!

basicAdd: anObject atIndex: anInteger 
	"Private - Adds an item to the list view at the index given by anInteger"

	^self subclassResponsibility!

basicClear
	"Private - Clears down the associated control(but not its model)"

	^self subclassResponsibility
!

basicRefreshContents
	"Private - Refresh the receiver's contents to match the contents collection, but do not trigger a selection change event."

	^self subclassResponsibility!

basicRemoveAtIndex: anInteger
	"Private - Delete the item with the specified <integer> handle."

	^self subclassResponsibility!

basicResetSelection
	"Private - Clear all selections. Do not issue a selection changed
	notification."

	^self setSingleSelection: 0!

basicSelectionsByIndex: aCollectionOfIntegers 
	"Private - Select the items in the receiver with the one-based <integer> indices
	in the <collection> argument."

	self isMultiSelect 
		ifTrue: 
			[self basicResetSelection.
			self selectIndices: aCollectionOfIntegers set: true]
		ifFalse: 
			[self setSingleSelection: (aCollectionOfIntegers isEmpty 
						ifTrue: [0]
						ifFalse: [aCollectionOfIntegers anyOne])]!

caretIndex
	"Answer the 1-based index of the caret (the item with focus in a multi-selection
	list, or the selected item, if any, in a single-selection list)."

	| selections |
	selections := self selectionsByIndex.
	^selections isEmpty ifTrue: [0] ifFalse: [selections first]!

connectModel
	"Connect the receiver to its model, wiring events, etc."

	self model
		when: #listChanged send: #onListChanged to: self;
		when: #item:addedAtIndex: send: #onItem:addedAtIndex: to: self;
		when: #item:removedAtIndex: send: #onItem:removedAtIndex: to: self;
		when: #item:updatedAtIndex: send: #onItem:updatedAtIndex: to: self.!

defaultGetTextBlock
	"Private - Answer a monadic valuable evaluated to provide the displayable text
	for objects inserted into the receiver."

	^[:item | item displayString]!

ensureSelectionVisible
	"Ensure the selected item is visible, scrolling it into view if necessary.
	Raise an error if there is no selection."

	^self subclassResponsibility!

errorNoSelection
	"Private - Raise an exception to the effect that an attempt was made to
	access the selection in the receiver, and it has none."

	^self error: 'Exactly one object must be selected'!

errorNotMultiSelect
	^self error: 'Not a multi-select list'!

getInfoTipBlock
	"Answer a <monadicValuable>, being the receiver's info. tip block, or
	nil if none."

	^nil!

getInfoTipBlock: monad
	"Set the receiver's info. tip block to the <monadicValuable>, monad.
	The info. tip block is used to calculate the bubble help string for an item which is hovered
	over. At present basic lists do not support bubble help, so this message is a no-op."
!

getMultipleSelections
	"Private - Answer an <Array> of the one based <integer> indices of the selected items in 
	the receiver, in ascending order."

	"Subclasses which support multiple selections must override this method"

	^self errorNotMultiSelect!

getSingleSelection
	"Private - Answer the 'index' of the selected object in the receiver or zero/nil if there is
	none. The 'index' could be an <integer> or some kind of handle, whatever representation is
	used by the control to communicate selections."

	^self subclassResponsibility!

getTextBlock
	"Answer the <monadicValuable> which is evaluated to determine the text to display 
	for each of the receiver's rows/nodes. Note that this is also the text used by the
	incremental search."

	^getTextBlock

!

getTextBlock: aOneArgBlock
	"Set the block to use to find out the text to display for an object that will
	be placed in the receiver"

	getTextBlock := aOneArgBlock.
	self updateAll
!

handleFromObject: anObject
	^self handleFromObject: anObject ifAbsent: []!

handleFromObject: anObject ifAbsent: exceptionHandler
	"Private - Answer the 'handle' or index associated with anObject in the receiver.
	Answers zero or nil if anObject is not present."

	^self model keyAtValue: anObject ifAbsent: exceptionHandler!

handlesFromObjects: aCollection whenAbsent: exceptionHandler 
	"Private - Answer a collection of the handles of the <collection> of <Object>, objects,
	evaluating the <monadicValuable>, exceptionHandler, once for each object which is
	not in the receiver."

	| handles |
	handles := OrderedCollection new: aCollection size.
	aCollection do: 
			[:candidate | 
			| i |
			i := self handleFromObject: candidate
						ifAbsent: 
							[exceptionHandler value: candidate.
							nil].
			i notNil ifTrue: [handles addLast: i]].
	^handles!

hasSelection
	"Answer whether the receiver has a selection."

	^self selectedCount > 0!

hasSingleSelection
	"Answer whether the receiver has a selection."

	^self selectedCount == 1!

initialize
	"Private - Initialise the receiver."

	super initialize.
	getTextBlock := self defaultGetTextBlock.
!

isMultiSelect
	"Answer whether the receiver supports multiple selections."

	^false!

isVirtual
	"Answer whether the receiver calls back to render text and images displayed for the items in
	the list. If true then the list will render the current state of the model whenever it
	repaints. If false then the list will render a static snapshot of the model at the time the
	model's contents were last added to the list."

	^false!

itemCount
	"Answers the count of elements in the view. This may be different from the answer to #size
	if the model has been updated but the change has not yet propaged to the receiver's
	contents"

	^self subclassResponsibility!

itemFromPoint: aPoint 
	"Private - Answer the index of the object in the list under the <Point> argument, or nil if
	none. Note that the answer may be greater than the one-based index of the last item in the
	list. It is the callers responsibilty to interpret appropriately - e.g. to accept drops past
	the last item in the list."

	^self subclassResponsibility!

lastSelIndices
	^#()!

list
	"Answer the collection held by the receiver's model"

	^self model list!

list: aSequenceableCollection
	"Set the collection held by the receiver's model to aSequenceableCollection"

	self model list: aSequenceableCollection!

noSelection
	"Private - Answer the receiver's representation of no selection."

	^self isMultiSelect ifTrue: [#()] ifFalse: [0]!

objectFromHandle: anInteger
	"Private - Answer the object in the receiver associated with the <integer> handle,
	anInteger, or signal a NotFoundError if it is not a valid handle."

	^self objectFromHandle: anInteger ifAbsent: [self errorNotFound: anInteger]!

objectFromHandle: anInteger ifAbsent: exceptionHandler
	"Private - Answer the object in the receiver associated with the <integer> handle, 
	anInteger, or the result of evaluating the <niladicValuable>, exceptionHandler."

	^self model at: anInteger ifAbsent: exceptionHandler!

onActionPerformed
	"Only perform an action if we have a selection."

	self hasSelection ifTrue: [super onActionPerformed]!

onItem: anObject addedAtIndex: anInteger 
	"Event received when an <Object> has been added to the receiver's model at the specified
	<integer> index. By default, do nothing."

	!

onItem: anObject removedAtIndex: anInteger 
	"Event received when the <Object>, anObject, has been removed from the receiver's model at
	the <integer> index, anInteger. Remove the appropriate object from the list."

	^self subclassResponsibility!

onItem: anObject updatedAtIndex: anInteger 
	"Updates the item at the specified <integer> index to reflect it's current state."

	self updateItem: anObject atIndex: anInteger	!

onListChanged
	"The model held by the receiver has been changed so refresh the receiver contents here."

	self refreshContents!

onSelChanged
	"Private - Handle a selection change event by forwarding to the presenter."

	| selections |
	selections := self selectionsByIndex.
	selections = self lastSelIndices ifFalse: [self onSelChanged: selections]!

onSelChanged: anArray 
	"Private - Handle a selection change event by forwarding to the presenter."

	"Implementation Note: We must prevent selection notifications being propagated during state
	restoral"

	self isStateRestoring ifFalse: [self presenter onSelectionChanged]!

onSelectionChanged
	"Sent by #onSelChange when the receiver's selection has changed. The default is to trigger
	an #selectionChanged event off the presenter"

	self presenter trigger: #selectionChanged.
	self invalidateUserInterface.!

onSelectionChanging: aSelectionChangingEvent
	"Handler to indicate that the receiver's selection is about to change. To prevent the
	proposed change under cdertain circumstances a handler can set the value of aValueHolder to
	false. The default is to trigger an #selectionChanging: event off the presenter"

	self presenter trigger: #selectionChanging: with: aSelectionChangingEvent!

refreshContents
	"Refresh the receiver's contents to match the contents collection"

	^self subclassResponsibility!

requestDragObjects: session 
	"This is where the receiver specifies which object(s) the <DragDropSession>, session, is to
	drag.The objects are added to the session using DragDropSession>>addDragObject: or
	DragDropSession>>dragObjects:."

	"Implementation Note: Override to make a reasonable suggestion (the current selections)."

	| selected |
	selected := self selections.
	(selected includes: session suggestedSource) 
		ifTrue: [selected do: [:each | session addDragee: each]]
		ifFalse: [session addDragee: session suggestedSource].
	super requestDragObjects: session!

resetSelection
	"Set the receiver to have no selection."

	self selectionsByIndex: #()!

selectedCount
	"Answer the total number of items selected in the receiver."

	^self selectionsByIndex size!

selectIndex: anInteger set: aBoolean 
	"Private - Set/reset the selection state of the object at the specified one-based <integer>
	index within the receiver according to the <boolean> argument."

	"Subclasses that support multiple selections must override this method"

	^self errorNotMultiSelect!

selectIndices: indices set: aBoolean
	"Private - Set/clear selection status of the items in the receiver with the <integer>
	indices in the <collection>, indices."
	
	^self subclassResponsibility!

selection
	"Answer the selected object, or signal an <Error> if there is no selection."

	^self selectionIfNone: [self errorNoSelection]!

selection: newSelection 
	"Select the first occurence of the <Object>, newSelection, in the receiver. If not present
	then signal a <NotFoundError>. Answer newSelection."

	^self selection: newSelection ifAbsent: [self errorNotFound: newSelection]!

selection: newSelection ifAbsent: exceptionHandler 
	"Select the first occurrence of the <Object>, newSelection, in the receiver and answer
	newSelection. If there are no occurrences then answer the result of evaluating the
	<niladicValuable>, exceptionHandler."

	^(self handleFromObject: newSelection ifAbsent: []) 
		ifNil: [exceptionHandler value]
		ifNotNil: 
			[:index | 
			self selectionByIndex: index.
			newSelection]!

selectionByIndex
	"Answer the 1-based <integer> index of the selected item in the view, or zero if there is not exactly one selection."

	| selections |
	selections := self selectionsByIndex.
	^selections size == 1 ifTrue: [selections first] ifFalse: [0]!

selectionByIndex: index
	"Select the object identified by the one-based <integer> index in the receiver. If index is
	zero then all selections are cleared. If index is out of range, then a BoundsError is
	raised. Answer the new selection (which may not be changed if the selection changing request
	is denied)."

	^self selectionByIndex: index ifAbsent: [self errorSubscriptBounds: index]
!

selectionByIndex: anInteger ifAbsent: exceptionHandler 
	"Select the object identified by anIntegerIndex in the receiver. If anIntegerIndex is zero
	then all selections are cleared. Answer the selection index that results."

	^self selectionsByIndex: (anInteger == 0 ifTrue: [#()] ifFalse: [Array with: anInteger])
		ifAbsent: exceptionHandler!

selectionByIndexIfNone: exceptionHandler 
	"Answer the index of the selected item in the list (1 based), or if no item is selected,
	then the result of evaluating the niladic valuable, exceptionHandler."

	^self hasSelection ifTrue: [self selectionByIndex] ifFalse: [exceptionHandler value]!

selectionIfNone: aBlock 
	"Answer the selected element in the receiver, or the result of evaluating the
	<niladicValuable>, exceptionHandler, if there is not exactly one."

	| index |
	index := self selectionByIndex.
	^index == 0 ifTrue: [aBlock value] ifFalse: [self objectFromHandle: index ifAbsent: []]!

selectionOrNil
	"Answer the single selected object, or nil if there is not exactly one selection."

	"Note that for backwards compatibility this method will answer a collection for a
	MultipleSelectionListBox or MultipleSelectionListView. These classes have been deprecated in
	D6, in which the ListBox and ListView classes themselves can be configured to work in either
	single or multi-select mode."

	^self selectionIfNone: []!

selectionOrNil: anObject 
	"Select the first occurence of the <Object> argument, in the receiver. If anObject
	is nil, then simply remove the existing selection. If the new selection is not present then
	signal a <NotFoundError>. Answer the new selection."

	anObject isNil ifTrue: [self resetSelection] ifFalse: [self selection: anObject].
	^anObject!

selections
	"Answer a <sequencedReadableCollection> of the <Object>s selected from the list.
	If there is no selection, then the collection will be empty."

	^self selectionsByIndex collect: [:each | self objectFromHandle: each]!

selections: aSequencedReadableCollection 
	"Set the objects selected in the receiver to be the elements of the <sequencedReadableCollection> argument.
	If any of those elements are not present in the receiver, raise a NotFoundError."

	^self selections: aSequencedReadableCollection
		ifAbsent: [self errorNotFound: aSequencedReadableCollection]!

selections: newSelection ifAbsent: exceptionHandler 
	"Select the first occurrence of the first <Object> in the <sequencedReadableCollection>, 
	newSelection, in the receiver and answer newSelection. If there are no occurrences then 
	answer the result of evaluating the <monadicValuable>, exceptionHandler."

	"Implementation Note: Subclasses that support multiple selections must override this."

	^newSelection isEmpty 
		ifTrue: 
			[self resetSelection.
			newSelection]
		ifFalse: [self selection: newSelection first ifAbsent: exceptionHandler]!

selectionsByIndex
	"Answer an <Array> of the <integer> the indices of the selected items 
	in the receiver in ascending order. The array will be empty if there is
	no selection."

	^self isMultiSelect 
		ifTrue: [self getMultipleSelections]
		ifFalse: 
			[| index |
			index := self getSingleSelection.
			index == 0 ifTrue: [#()] ifFalse: [Array with: index]]!

selectionsByIndex: aCollectionOfIntegers
	^self selectionsByIndex: aCollectionOfIntegers
		ifAbsent: [self errorNotFound: aCollectionOfIntegers]!

selectionsByIndex: aSequencedReadableCollection ifAbsent: exceptionHandler 
	"Select the object whose index is the first in the <collection> of <integer>s, indices, in
	the receiver. If that index is out of bounds, then evaluate the <niladicValuable>
	exceptionHandler."

	"Implementation Note: Subclasses that support multiple selections must override this."

	^self selectionByIndex: (aSequencedReadableCollection isEmpty 
				ifTrue: [0]
				ifFalse: [aSequencedReadableCollection first])
		ifAbsent: exceptionHandler!

selectionState
	^self subclassResponsibility!

setSingleSelection: anIntegerOrHandle 
	"Private - Set the selection to the item with the specified index (1-based), or handle,
	scrolling it into view if necessary. Answer whether the selection change request was
	successful."

	^self subclassResponsibility!

size
	"Answer the number of items currently in the receiver's model."

	^self model size!

state
	"Private - Answer a MessageSequence which, when replayed, will restore the receiver 
	to its current state"

	| messages |
	messages := super state.
	self hasSelection ifTrue: [messages add: self selectionState].
	"Controls in a multi-select mode (if supported) have two additional concepts which we must restore.
	In single-select mode, or if multi-select is not supported, these are both equal to the selected item."
	self isMultiSelect ifTrue: 
			[| caret anchor |
			caret := self caretIndex.
			caret = 0 ifFalse: 
					[messages add: (MessageSend
								receiver: self
								selector: #caretIndex:
								argument: caret)].
			anchor := self anchorIndex.
			anchor = 0 ifFalse: 
					[messages add: (MessageSend
								receiver: self
								selector: #anchorIndex:
								argument: anchor)]].
	^messages.!

updateAll
	"Re-render the model's contents. This is a similar operation to #refreshContents, except
	that it is assumed that the models contents are the same objects, but may have changed
	internally so that their visual representation must be updated. This is typically a very
	cheap operation for virtual (dynamic) lists, since these just need to repaint. For
	non-virtual lists the list entries must be individually updated or (for simpler lists)
	removed and re-added."

	self isVirtual ifTrue: [self updateAllVirtual] ifFalse: [self updateAllNonVirtual]!

updateAllNonVirtual
	| selections |
	selections := self selectionsByIndex.
	self basicRefreshContents.
	self basicSelectionsByIndex: selections!

updateAllVirtual
	self invalidate!

updateItem: anObject atIndex: anInteger 
	"Re-render the specified item, which is at the specified <integer> index in the list."

	!

updateSelectionCache
	"Private - If there is a cached selection, update it."

	! !
!ListControlView categoriesFor: #addSelections:!public!selection! !
!ListControlView categoriesFor: #addSelections:ifAbsent:!public!selection! !
!ListControlView categoriesFor: #addSelectionsByIndex:!public!selection! !
!ListControlView categoriesFor: #anchorIndex!public!selection! !
!ListControlView categoriesFor: #basicAdd:atIndex:!adding!private! !
!ListControlView categoriesFor: #basicClear!private!removing! !
!ListControlView categoriesFor: #basicRefreshContents!private!updating! !
!ListControlView categoriesFor: #basicRemoveAtIndex:!private!removing! !
!ListControlView categoriesFor: #basicResetSelection!private!selection! !
!ListControlView categoriesFor: #basicSelectionsByIndex:!private!selection! !
!ListControlView categoriesFor: #caretIndex!public!selection! !
!ListControlView categoriesFor: #connectModel!models!public! !
!ListControlView categoriesFor: #defaultGetTextBlock!constants!private! !
!ListControlView categoriesFor: #ensureSelectionVisible!public!selection! !
!ListControlView categoriesFor: #errorNoSelection!exceptions!private! !
!ListControlView categoriesFor: #errorNotMultiSelect!private!selection! !
!ListControlView categoriesFor: #getInfoTipBlock!accessing!public! !
!ListControlView categoriesFor: #getInfoTipBlock:!accessing!public! !
!ListControlView categoriesFor: #getMultipleSelections!private!selection! !
!ListControlView categoriesFor: #getSingleSelection!private!selection! !
!ListControlView categoriesFor: #getTextBlock!adapters!public! !
!ListControlView categoriesFor: #getTextBlock:!adapters!public! !
!ListControlView categoriesFor: #handleFromObject:!accessing!private! !
!ListControlView categoriesFor: #handleFromObject:ifAbsent:!accessing!private! !
!ListControlView categoriesFor: #handlesFromObjects:whenAbsent:!helpers!private! !
!ListControlView categoriesFor: #hasSelection!public!selection! !
!ListControlView categoriesFor: #hasSingleSelection!public!selection! !
!ListControlView categoriesFor: #initialize!initializing!private! !
!ListControlView categoriesFor: #isMultiSelect!public!selection!testing! !
!ListControlView categoriesFor: #isVirtual!accessing-styles!public! !
!ListControlView categoriesFor: #itemCount!accessing!public! !
!ListControlView categoriesFor: #itemFromPoint:!enquiries!private! !
!ListControlView categoriesFor: #lastSelIndices!private! !
!ListControlView categoriesFor: #list!accessing!public! !
!ListControlView categoriesFor: #list:!accessing!public! !
!ListControlView categoriesFor: #noSelection!constants!private! !
!ListControlView categoriesFor: #objectFromHandle:!accessing!private! !
!ListControlView categoriesFor: #objectFromHandle:ifAbsent:!accessing!private! !
!ListControlView categoriesFor: #onActionPerformed!event handling!public! !
!ListControlView categoriesFor: #onItem:addedAtIndex:!event handling!public! !
!ListControlView categoriesFor: #onItem:removedAtIndex:!event handling!public! !
!ListControlView categoriesFor: #onItem:updatedAtIndex:!event handling!public! !
!ListControlView categoriesFor: #onListChanged!event handling!public! !
!ListControlView categoriesFor: #onSelChanged!private! !
!ListControlView categoriesFor: #onSelChanged:!event handling!private! !
!ListControlView categoriesFor: #onSelectionChanged!event handling!public! !
!ListControlView categoriesFor: #onSelectionChanging:!event handling!public! !
!ListControlView categoriesFor: #refreshContents!public!updating! !
!ListControlView categoriesFor: #requestDragObjects:!drag & drop!public! !
!ListControlView categoriesFor: #resetSelection!public!selection! !
!ListControlView categoriesFor: #selectedCount!public!selection! !
!ListControlView categoriesFor: #selectIndex:set:!private!selection! !
!ListControlView categoriesFor: #selectIndices:set:!private!selection! !
!ListControlView categoriesFor: #selection!public!selection! !
!ListControlView categoriesFor: #selection:!public!selection! !
!ListControlView categoriesFor: #selection:ifAbsent:!public!selection! !
!ListControlView categoriesFor: #selectionByIndex!public!selection! !
!ListControlView categoriesFor: #selectionByIndex:!public!selection! !
!ListControlView categoriesFor: #selectionByIndex:ifAbsent:!public!selection! !
!ListControlView categoriesFor: #selectionByIndexIfNone:!public!selection! !
!ListControlView categoriesFor: #selectionIfNone:!public!selection! !
!ListControlView categoriesFor: #selectionOrNil!public!selection! !
!ListControlView categoriesFor: #selectionOrNil:!public!selection! !
!ListControlView categoriesFor: #selections!public!selection! !
!ListControlView categoriesFor: #selections:!public!selection! !
!ListControlView categoriesFor: #selections:ifAbsent:!public!selection! !
!ListControlView categoriesFor: #selectionsByIndex!public!selection! !
!ListControlView categoriesFor: #selectionsByIndex:!public!selection! !
!ListControlView categoriesFor: #selectionsByIndex:ifAbsent:!public!selection! !
!ListControlView categoriesFor: #selectionState!accessing!private! !
!ListControlView categoriesFor: #setSingleSelection:!public!selection! !
!ListControlView categoriesFor: #size!accessing!public! !
!ListControlView categoriesFor: #state!accessing!private! !
!ListControlView categoriesFor: #updateAll!public!updating! !
!ListControlView categoriesFor: #updateAllNonVirtual!private!updating! !
!ListControlView categoriesFor: #updateAllVirtual!private!updating! !
!ListControlView categoriesFor: #updateItem:atIndex:!event handling!public! !
!ListControlView categoriesFor: #updateSelectionCache!helpers!private!selection! !

ListControlView methodProtocol: #indexSelectableItems attributes: #(#readOnly) selectors: #(#selectionByIndex #selectionByIndex: #selectionByIndex:ifAbsent: #selectionByIndexIfNone:)!
ListControlView methodProtocol: #listView attributes: #(#readOnly) selectors: #(#list #list: #onItem:addedAtIndex: #onItem:removedAtIndex: #onItem:updatedAtIndex: #onListChanged)!
ListControlView methodProtocol: #selectableItems attributes: #(#readOnly) selectors: #(#hasSelection #onSelectionChanged #onSelectionChanging: #resetSelection #selection #selection: #selection:ifAbsent: #selectionIfNone: #selectionOrNil #selectionOrNil:)!

!ListControlView class methodsFor!

defaultModel
	"Answer a default model to be assigned to the receiver when it is initialized."

	^ListModel new!

icon
	"Answers an Icon that can be used to represent this class"

	^##(self) defaultIcon! !
!ListControlView class categoriesFor: #defaultModel!models!public! !
!ListControlView class categoriesFor: #icon!constants!public! !
