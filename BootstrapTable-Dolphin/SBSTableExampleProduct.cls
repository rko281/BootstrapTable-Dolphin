"Filed out from Dolphin Smalltalk"!

Object subclass: #SBSTableExampleProduct
	instanceVariableNames: 'id name price inStock'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableExampleProduct guid: (GUID fromString: '{f584b127-1acd-4521-8097-f88c10baca4c}')!

SBSTableExampleProduct comment: ''!

!SBSTableExampleProduct categoriesForClass!Kernel-Objects! !

!SBSTableExampleProduct methodsFor!

hasName

	^name notNil and: [name notEmpty]!

hasPrice

	^price notNil!

id
	^id!

id: anObject
	id := anObject!

inStock
	^inStock!

inStock: anObject
	inStock := anObject!

isValid

	^self hasName and: [self hasPrice]!

name
	^name!

name: anObject
	name := anObject!

price
	^price!

price: anObject
	price := anObject! !

!SBSTableExampleProduct categoriesForMethods!
hasName!public!testing! !
hasPrice!public!testing! !
id!accessing!private! !
id:!accessing!private! !
inStock!accessing!private! !
inStock:!accessing!private! !
isValid!public!testing! !
name!accessing!private! !
name:!accessing!private! !
price!accessing!private! !
price:!accessing!private! !
!

!SBSTableExampleProduct class methodsFor!

new

	^super new
		inStock: true;
		yourself! !

!SBSTableExampleProduct class categoriesForMethods!
new!instance creation!public! !
!

