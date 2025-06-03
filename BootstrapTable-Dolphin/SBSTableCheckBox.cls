"Filed out from Dolphin Smalltalk"!

SBSTableSubComponent subclass: #SBSTableCheckBox
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableCheckBox guid: (GUID fromString: '{7d4f3a11-90f7-4203-830f-b8f494f8879b}')!

SBSTableCheckBox comment: ''!

!SBSTableCheckBox categoriesForClass!Component! !

!SBSTableCheckBox methodsFor!

renderContentOn: html

	html checkbox 
		disabled: true;
		value: (self column contentFromRow: self model)! !

!SBSTableCheckBox categoriesForMethods!
renderContentOn:!public!rendering! !
!

