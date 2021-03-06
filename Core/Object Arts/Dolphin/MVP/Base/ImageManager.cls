﻿"Filed out from Dolphin Smalltalk 7"!

Object subclass: #ImageManager
	instanceVariableNames: 'images imageLists maskcolor backcolor'
	classVariableNames: ''
	poolDictionaries: 'Win32Constants'
	classInstanceVariableNames: ''!
ImageManager guid: (GUID fromString: '{87b4c492-026e-11d3-9fd7-00a0cc3e4a32}')!
ImageManager comment: ''!
!ImageManager categoriesForClass!Graphics-Tools! !
!ImageManager methodsFor!

addImage: anImage
	"Adds the <image>, anImage, to the receiver if it is not already there. All objects to be added
	to an ImageManager must respond to #addToImageList:mask: to actually perform the addition
	(they need not actually be sub-instances of class <Image>).
	The object is added for all formats i.e. to all of the existing image lists in our imageLists
	Dictionary. Answers the index of the object in the manager after converting from
	0 to 1 based."

	^self addImage: anImage maskcolor: maskcolor!

addImage: anImage extent: extent 
	"Adds the <image>, anImage, to the receiver if it is not already there. All objects to be added
	to an ImageManager must respond to #addToImageList:mask: to actually perform the addition
	(they need not actually be sub-instances of class <Image>).
	The object is added for all formats i.e. to all of the existing image lists in our imageLists
	Dictionary. Answers the index of the object in the manager after converting from
	0 to 1 based."

	^self 
		addImage: anImage
		extent: extent
		maskcolor: maskcolor!

addImage: anImage extent: extent maskcolor: aColor
	^(images lookup: anImage)
		ifNil: 
			[self
				basicAddImage: anImage
				extent: extent
				maskcolor: aColor]!

addImage: anImage maskcolor: aColor 
	^self 
		addImage: anImage
		extent: anImage extent
		maskcolor: aColor!

backcolor
	"Answer the <Color> used as the background colour of the receiver's 
	image lists."

	^backcolor!

backcolor: aColor 
	"Set the <Color> used as the background colour of the receiver's image lists."

	backcolor := aColor.
	imageLists do: [:each | each backcolor: aColor]!

basicAddImage: anImage extent: extent maskcolor: aColor 
	| index |
	imageLists isEmpty ifTrue: [imageLists at: extent put: (self newImageListWithExtent: extent)].
	imageLists do: [:each | index := (anImage addToImageList: each mask: aColor) + 1].
	^images at: anImage put: index!

buildImageListWithExtent: aPoint 
	"Private - Build a new image list with the extent specified by the <Point> argument,
	populating it with all existing images."

	| newList |
	newList := self newImageListWithExtent: aPoint.
	self orderedImages do: 
			[:image | 
			(image isNil ifTrue: [Icon question] ifFalse: [image]) addToImageList: newList
				mask: maskcolor].

	"Add the new rendering to our dictionary of those available"
	imageLists at: aPoint put: newList.
	^newList!

imageAt: anInteger 
	"Answers the <Image> at the specified <integer> index in the receiver's
	image lists."

	^images keyAtValue: anInteger!

imageAt: anInteger ifAbsent: exceptionHandler 
	"Answer the <Image> at the specified <integer> index in the receiver's
	image lists, or the result of evaluating the <niladicValuable>, exceptionHandler,
	if there is no image with that key."

	^images keyAtValue: anInteger ifAbsent: exceptionHandler!

imageListWithExtent: aPoint
	"Answer the image list for the receiver that has an extent that
	matches the <Point> argument. If no such list has yet been accessed then a new
	one is created and all of the existing images are added to it."

	| imageList |
	imageList := imageLists lookup: aPoint.
	(imageList isNil or: [imageList isRealized not])
		ifTrue: [imageList := self buildImageListWithExtent: aPoint].
	^imageList!

indexOfImage: anImage 
	"Locates anObject in the receiver and returns the integer index of its image.
	If anObject has not yet been added to the receiver then it is added automatically.
	This method is a synonym for #addImage:"

	^images at: anImage ifAbsent: [self addImage: anImage]!

initialize
	"Private - Initialize the receiver. An ImageManager maintains a Dictionary of
	WinImageLists which can be addressed by the extents of the images that
	they contain. We also construct a Dictionary mapping between objects
	and their indexes in the various image lists. Any object can therefore
	ask for its index which will be identical for all the lists."

	self newImages!

maskcolor
	"Answer the <Color> used as the mask colour when loading bitmaps 
	into the receiver's image lists (i.e. the transparent colour). If the
	answer is nil then there is no mask colour set."

	^maskcolor!

maskcolor: aColorOrNil 
	"Set <Color> used as the mask colour when loading bitmaps 
	into the receiver's image lists (i.e. the transparent colour).
	This must be set before any image lists are created, or they
	will not have the requisite masking capability."

	maskcolor := aColorOrNil asParameter = CLR_NONE ifFalse: [aColorOrNil]!

newImageLists
	imageLists := LookupTable new!

newImageListWithExtent: aPoint 
	"Private - Answer a new <WinImageList> appropriately configured to hold images for the receiver
	of the specified extent."

	| answer |
	(aPoint x <= 0 or: [aPoint y <= 0]) ifTrue: [^self error: 'Image list extent must be at least 1@1'].
	answer := WinImageList 
				newExtent: aPoint
				initialSize: images size
				masked: maskcolor notNil.
	answer backcolor: backcolor.
	^answer!

newImages
	"Private - Initialize the receiver's image data structures."

	self newImageLists.
	images := LookupTable new!

orderedImages
	| ordered max |
	max := 0.
	"#1315: The images may not be contiguous due to some Windows oddity, so we must find the max index"
	images do: [:each | each > max ifTrue: [max := each]].
	ordered := Array new: max.
	images 
		keysAndValuesDo: [:eachKey :eachValue | eachValue == 0 ifFalse: [ordered at: eachValue put: eachKey]].
	^ordered!

purge
	"Empty the receiver of all objects"

	self newImages!

purgeImages
	"Private - Frees up all the image resources"

	Notification signal: 'Purging images from ' , self printString.
	self newImageLists!

purgeImagesWithExtent: aPoint
	"Private - Removes any image list that contains images of extent, aPoint"

	imageLists removeKey: aPoint


!

size
	"Answer the number of objects that have been added to the receiver"

	^images size!

stbSaveOn: anSTBOutFiler
	"Save out a binary representation of the receiver to anSTBOutFiler.
	The WinImageLists held by the receiver cannot be binary filed out. We purge them
	here so that this is not a necessity. The unfortunate side effect is that the images
	will have to be rebuilt next time the receiver is accessed. Perhaps it would be better
	to use a true proxy class to avoid this inefficiency."

	self purgeImages.
	super stbSaveOn: anSTBOutFiler! !
!ImageManager categoriesFor: #addImage:!adding!public! !
!ImageManager categoriesFor: #addImage:extent:!adding!public! !
!ImageManager categoriesFor: #addImage:extent:maskcolor:!adding!private! !
!ImageManager categoriesFor: #addImage:maskcolor:!adding!private! !
!ImageManager categoriesFor: #backcolor!accessing!public! !
!ImageManager categoriesFor: #backcolor:!accessing!public! !
!ImageManager categoriesFor: #basicAddImage:extent:maskcolor:!adding!private! !
!ImageManager categoriesFor: #buildImageListWithExtent:!helpers!private! !
!ImageManager categoriesFor: #imageAt:!accessing!public! !
!ImageManager categoriesFor: #imageAt:ifAbsent:!accessing!public! !
!ImageManager categoriesFor: #imageListWithExtent:!accessing!public! !
!ImageManager categoriesFor: #indexOfImage:!public!searching! !
!ImageManager categoriesFor: #initialize!initializing!private! !
!ImageManager categoriesFor: #maskcolor!accessing!public! !
!ImageManager categoriesFor: #maskcolor:!accessing!public! !
!ImageManager categoriesFor: #newImageLists!private!removing! !
!ImageManager categoriesFor: #newImageListWithExtent:!helpers!private! !
!ImageManager categoriesFor: #newImages!private!removing! !
!ImageManager categoriesFor: #orderedImages!accessing!private! !
!ImageManager categoriesFor: #purge!public!removing! !
!ImageManager categoriesFor: #purgeImages!operations!private! !
!ImageManager categoriesFor: #purgeImagesWithExtent:!operations!private! !
!ImageManager categoriesFor: #size!accessing!public! !
!ImageManager categoriesFor: #stbSaveOn:!binary filing!public! !

!ImageManager class methodsFor!

new
	"Answer a new initialized instance of the receiver."

	^super new initialize!

stbConvertFrom: anSTBClassFormat 
	"Version 1 adds backcolor and maskcolor instance variables."

	^
	[:data | 
	| newInstance |
		newInstance := self basicNew.
		1 to: data size do: [:i | newInstance instVarAt: i put: (data at: i)].
		newInstance]!

stbVersion
	"Answer the current binary filer version number for instances of the receiver."

	^1! !
!ImageManager class categoriesFor: #new!instance creation!public! !
!ImageManager class categoriesFor: #stbConvertFrom:!binary filing!public! !
!ImageManager class categoriesFor: #stbVersion!binary filing!public! !

