"Filed out from Dolphin Smalltalk"!

SBSTableColumnComponent subclass: #SBSTableColumnGroup
	instanceVariableNames: 'components'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableColumnGroup guid: (GUID fromString: '{da3cf17d-a9f6-4667-b0cd-343678be4d29}')!

SBSTableColumnGroup comment: ''!

!SBSTableColumnGroup categoriesForClass!Component! !

!SBSTableColumnGroup methodsFor!

addColumn: aSBSTableColumnOrGroup

	aSBSTableColumnOrGroup parentGroup: self.
	self components add: aSBSTableColumnOrGroup!

addToTable: aSBSTable

	self table: aSBSTable.
	self components do: [ :each | each addToTable: aSBSTable]!

applyOptionsTo: aTableHeading

	(self hasOption: #halign) ifFalse: [self option: #halign value: 'center'].

	super applyOptionsTo: aTableHeading!

columnSpan

	^self components inject: 0 into: [ :columnSpan :each | columnSpan + each columnSpan]!

components
	^components!

components: anObject
	components := anObject!

initialize

	super initialize.
	self components: OrderedCollection new!

renderOn: html

	self renderTableHeading: html tableHeading.

	html tableRow: [self components do: [ :each | each renderOn: html]]!

rowSpan

	^1! !

!SBSTableColumnGroup categoriesForMethods!
addColumn:!operations!public! !
addToTable:!operations!private! !
applyOptionsTo:!options!private! !
columnSpan!accessing!private! !
components!accessing!private! !
components:!accessing!private! !
initialize!initialize/release!public! !
renderOn:!public!rendering! !
rowSpan!accessing!private! !
!

