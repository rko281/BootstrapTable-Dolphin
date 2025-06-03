"Filed out from Dolphin Smalltalk"!

SBSComponent subclass: #SBSTableSubComponent
	instanceVariableNames: 'model table column'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableSubComponent guid: (GUID fromString: '{17b73c6e-ccc4-42ff-ab3f-c119836e1782}')!

SBSTableSubComponent comment: ''!

!SBSTableSubComponent categoriesForClass!Component! !

!SBSTableSubComponent methodsFor!

column
	^column!

column: anObject
	column := anObject.
	self table: column table!

model
	^model!

model: anObject
	model := anObject!

table
	^table!

table: anObject
	table := anObject! !

!SBSTableSubComponent categoriesForMethods!
column!accessing!public! !
column:!accessing!public! !
model!accessing!public! !
model:!accessing!public! !
table!accessing!public! !
table:!accessing!public! !
!

