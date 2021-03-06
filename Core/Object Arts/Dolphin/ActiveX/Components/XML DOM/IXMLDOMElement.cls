﻿"Filed out from Dolphin Smalltalk 7"!

IXMLDOMNode subclass: #IXMLDOMElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: 'MSXMLConstants'
	classInstanceVariableNames: ''!
IXMLDOMElement guid: (IID fromString: '{2933BF86-7B36-11D2-B20E-00C04F983E60}')!
IXMLDOMElement comment: '<IXMLDOMElement> is a wrapper class for the COM interface ''MSXML.IXMLDOMElement'' generated from type information in the ''Microsoft XML, version 2.0'' library. It contains methods to invoke the member functions exposed by that interface.

This is a specialized DOM node to represent elements (i.e. structures).'!
!IXMLDOMElement categoriesForClass!COM-Interfaces!MSXML-Interfaces! !
!IXMLDOMElement methodsFor!

= anObject 
	^super = anObject and: 
			[| myAttribs hisAttribs |
			myAttribs := self attributes.
			hisAttribs := anObject attributes.
			myAttribs size = hisAttribs size 
				and: [(myAttribs associations symmetricDifference: hisAttribs associations) isEmpty]]!

acceptVisitor: anXmlNodeVisitor 
	anXmlNodeVisitor acceptElement: self!

get_tagName: tagName
	"Private - Get the value of the 'tagName' property of the receiver.

		HRESULT __stdcall tagName(
			[out, retval]BSTR* tagName);"

	<virtual stdcall: hresult 44 bstr*>
	^self invalidCall!

getAttribute: name
	"Answer the <VARIANT> result of invoking the getAttribute() method of the COM object.
	Helpstring: look up the string value of an attribute by name"

	| answer |
	answer := VARIANT new.
	self
		GetAttribute: name
		value: answer.
	^answer asObject
!

GetAttribute: name value: value
	"Private - Invoke the getAttribute() method of the COM object.
	Helpstring: look up the string value of an attribute by name

		HRESULT __stdcall getAttribute(
			[in]BSTR name,
			[out, retval]VARIANT* value);"

	<virtual stdcall: hresult 45 bstr variant*>
	^self invalidCall!

getAttributeNode: name
	"Answer the <IXMLDOMAttribute> result of invoking the getAttributeNode() method of the COM object.
	Helpstring: look up the attribute node by name"

	| answer |
	answer := IXMLDOMAttribute newPointer.
	self
		GetAttributeNode: name
		attributeNode: answer.
	^answer asObject
!

GetAttributeNode: name attributeNode: attributeNode
	"Private - Invoke the getAttributeNode() method of the COM object.
	Helpstring: look up the attribute node by name

		HRESULT __stdcall getAttributeNode(
			[in]BSTR name,
			[out, retval]IXMLDOMAttribute** attributeNode);"

	<virtual stdcall: hresult 48 bstr IXMLDOMAttribute**>
	^self invalidCall!

getElementsByTagName: tagName
	"Answer a <sequencedReadableCollection> on the <IXMLDOMNodeList> result 
	of invoking the COM Object's getElementsByTagName() method.
	Helpstring: 'build a list of elements by name'
	Implementation Note: Originally auto-generated, but modified to answer a 
	Smalltalk style <collection>."

	| answer |
	answer := IXMLDOMNodeList newPointer.
	self GetElementsByTagName: tagName resultList: answer.
	^DOMNodeList on: answer!

GetElementsByTagName: tagName resultList: resultList
	"Private - Invoke the getElementsByTagName() method of the COM object.
	Helpstring: build a list of elements by name

		HRESULT __stdcall getElementsByTagName(
			[in]BSTR tagName,
			[out, retval]IXMLDOMNodeList** resultList);"

	<virtual stdcall: hresult 51 bstr IXMLDOMNodeList**>
	^self invalidCall!

namespaceURI: aString
	"Set the namespace of this element.
	Note: Attempting to set the 'xmlns' attribute value once it has been created
	will fail with a 'read-only node' error on MSXML3 (though not earlier versions)."

	self setAttribute: 'xmlns' value: aString!

Normalize
	"Invoke the normalize() method of the COM object.
	Helpstring: collapse all adjacent text nodes in sub-tree

		HRESULT __stdcall normalize();"

	<virtual stdcall: hresult 52>
	^self invalidCall!

RemoveAttribute: name
	"Invoke the removeAttribute() method of the COM object.
	Helpstring: remove an attribute by name

		HRESULT __stdcall removeAttribute(
			[in]BSTR name);"

	<virtual stdcall: hresult 47 bstr>
	^self invalidCall!

removeAttributeNode: domAttribute
	"Answer the <IXMLDOMAttribute> result of invoking the removeAttributeNode() method of the COM object.
	Helpstring: remove the specified attribute"

	| answer |
	answer := IXMLDOMAttribute newPointer.
	self
		RemoveAttributeNode: domAttribute
		attributeNode: answer.
	^answer asObject
!

RemoveAttributeNode: domAttribute attributeNode: attributeNode
	"Private - Invoke the removeAttributeNode() method of the COM object.
	Helpstring: remove the specified attribute

		HRESULT __stdcall removeAttributeNode(
			[in]IXMLDOMAttribute* DOMAttribute,
			[out, retval]IXMLDOMAttribute** attributeNode);"

	<virtual stdcall: hresult 50 IXMLDOMAttribute* IXMLDOMAttribute**>
	^self invalidCall!

setAttribute: name value: value
	"Invoke the setAttribute() method of the COM object.
	Helpstring: set the string value of an attribute by name"

	^self
		SetAttribute: name
		value: value asVariant
!

SetAttribute: name value: value
	"Private - Invoke the setAttribute() method of the COM object.
	Helpstring: set the string value of an attribute by name

		HRESULT __stdcall setAttribute(
			[in]BSTR name,
			[in]VARIANT value);"

	<virtual stdcall: hresult 46 bstr variant>
	^self invalidCall!

setAttributeNode: domAttribute
	"Answer the <IXMLDOMAttribute> result of invoking the setAttributeNode() method of the COM object.
	Helpstring: set the specified attribute on the element"

	| answer |
	answer := IXMLDOMAttribute newPointer.
	self
		SetAttributeNode: domAttribute
		attributeNode: answer.
	^answer asObject
!

SetAttributeNode: domAttribute attributeNode: attributeNode
	"Private - Invoke the setAttributeNode() method of the COM object.
	Helpstring: set the specified attribute on the element

		HRESULT __stdcall setAttributeNode(
			[in]IXMLDOMAttribute* DOMAttribute,
			[out, retval]IXMLDOMAttribute** attributeNode);"

	<virtual stdcall: hresult 49 IXMLDOMAttribute* IXMLDOMAttribute**>
	^self invalidCall!

tagName
	"Answer the <bstr> value of the 'tagName' property of the receiver.
	Helpstring: get the tagName of the element"

	| answer |
	answer := BSTR new.
	self get_tagName: answer.
	^answer asObject
! !
!IXMLDOMElement categoriesFor: #=!comparing!public! !
!IXMLDOMElement categoriesFor: #acceptVisitor:!public!visitor! !
!IXMLDOMElement categoriesFor: #get_tagName:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #getAttribute:!**auto generated**!methods!public! !
!IXMLDOMElement categoriesFor: #GetAttribute:value:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #getAttributeNode:!**auto generated**!methods!public! !
!IXMLDOMElement categoriesFor: #GetAttributeNode:attributeNode:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #getElementsByTagName:!methods!public! !
!IXMLDOMElement categoriesFor: #GetElementsByTagName:resultList:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #namespaceURI:!properties!public! !
!IXMLDOMElement categoriesFor: #Normalize!**auto generated**!COM Interfaces-IXMLDOMElement!public! !
!IXMLDOMElement categoriesFor: #RemoveAttribute:!**auto generated**!COM Interfaces-IXMLDOMElement!public! !
!IXMLDOMElement categoriesFor: #removeAttributeNode:!**auto generated**!methods!public! !
!IXMLDOMElement categoriesFor: #RemoveAttributeNode:attributeNode:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #setAttribute:value:!**auto generated**!methods!public! !
!IXMLDOMElement categoriesFor: #SetAttribute:value:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #setAttributeNode:!**auto generated**!methods!public! !
!IXMLDOMElement categoriesFor: #SetAttributeNode:attributeNode:!**auto generated**!COM Interfaces-IXMLDOMElement!private! !
!IXMLDOMElement categoriesFor: #tagName!**auto generated**!properties!public! !

!IXMLDOMElement class methodsFor!

defineFunctions
	"Declare the virtual function table for the COM interface 'MSXML2.IXMLDOMElement'
		IXMLDOMElement defineTemplate"

	self
		defineFunction: #get_tagName:
			argumentTypes: 'bstr*';
		defineFunction: #GetAttribute:value:
			argumentTypes: 'bstr variant*';
		defineFunction: #SetAttribute:value:
			argumentTypes: 'bstr variant';
		defineFunction: #RemoveAttribute:
			argumentTypes: 'bstr';
		defineFunction: #GetAttributeNode:attributeNode:
			argumentTypes: 'bstr IXMLDOMAttribute**';
		defineFunction: #SetAttributeNode:attributeNode:
			argumentTypes: 'IXMLDOMAttribute* IXMLDOMAttribute**';
		defineFunction: #RemoveAttributeNode:attributeNode:
			argumentTypes: 'IXMLDOMAttribute* IXMLDOMAttribute**';
		defineFunction: #GetElementsByTagName:resultList:
			argumentTypes: 'bstr IXMLDOMNodeList**';
		defineFunction: #Normalize
! !
!IXMLDOMElement class categoriesFor: #defineFunctions!**auto generated**!initializing!public! !

