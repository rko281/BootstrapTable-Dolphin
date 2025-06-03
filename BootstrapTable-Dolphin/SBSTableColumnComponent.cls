"Filed out from Dolphin Smalltalk"!

SBSTableCoreComponent subclass: #SBSTableColumnComponent
	instanceVariableNames: 'parentGroup table label'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableColumnComponent guid: (GUID fromString: '{16e2974e-f062-4aa6-a720-72dcfb06da32}')!

SBSTableColumnComponent comment: ''!

!SBSTableColumnComponent categoriesForClass!Component! !

!SBSTableColumnComponent methodsFor!

addToTable: aSBSTable

	self subclassResponsibility!

applyOptionsTo: aTableHeading

	| rowSpan |

	rowSpan := self rowSpan.
	rowSpan > 1 ifTrue: [self option: #valign value: 'middle'].

	super applyOptionsTo: aTableHeading!

columnSpan

	^self subclassResponsibility!

depth

	^1 + self parentDepth!

hasLabel

	^(label isNil or: [label isEmpty]) not!

label
	^label!

label: anObject
	label := anObject!

parentDepth

	^self parentGroup isNil
		ifTrue: [0]
		ifFalse: [self parentGroup depth]!

parentGroup
	^parentGroup!

parentGroup: anObject
	parentGroup := anObject!

renderTableHeading: aTableHeading

	self applyOptionsTo: aTableHeading.

	aTableHeading
		rowSpan: self rowSpan;
		colSpan: self columnSpan;
		with: self label!

rowSpan

	^self subclassResponsibility!

table
	^table!

table: anObject
	table := anObject!

validOptions

	"https://bootstrap-table.com/docs/api/column-options/"

	^#(
		#align
		#cardVisible
		#cellStyle
		#checkbox
		#checkboxEnabled
		#class
		#clickToSelect
		#colspan
		#detailFormatter
		#escape
		#events
		#falign
		#field
		#footerFormatter
		#footerStyle
		#formatter
		#halign
		#order
		#radio
		#rowspan
		#searchable
		#searchFormatter
		#searchHighlightFormatter
		#showSelectTitle
		#sortable
		#sorter
		#sortName
		#switchable
		#switchableLabel
		#title
		#titleTooltip
		#valign
		#visible
		#width
		#widthUnit
	)!

width: anInteger

	self option: #width value: anInteger! !

!SBSTableColumnComponent categoriesForMethods!
addToTable:!operations!private! !
applyOptionsTo:!options!private! !
columnSpan!accessing!private! !
depth!accessing!private! !
hasLabel!public!testing! !
label!accessing!public! !
label:!accessing!public! !
parentDepth!accessing!private! !
parentGroup!accessing!private! !
parentGroup:!accessing!private! !
renderTableHeading:!private!rendering! !
rowSpan!accessing!private! !
table!accessing!private! !
table:!accessing!private! !
validOptions!options!public! !
width:!accessing!public! !
!

