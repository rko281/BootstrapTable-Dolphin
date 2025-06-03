"Filed out from Dolphin Smalltalk"!

SBSTableSubComponent subclass: #SBSTableExampleDeleteRowComponent
	instanceVariableNames: 'hostApplication'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableExampleDeleteRowComponent guid: (GUID fromString: '{9f3f5ef8-271e-478c-86b8-5bddd37673d3}')!

SBSTableExampleDeleteRowComponent comment: ''!

!SBSTableExampleDeleteRowComponent categoriesForClass!Base! !

!SBSTableExampleDeleteRowComponent methodsFor!

hostApplication
	^hostApplication!

hostApplication: anObject
	hostApplication := anObject!

renderContentOn: html

	html anchor
		url: 'javascript:void(0)';
		onClick: (html jQuery ajax script: [ :script | script << (self hostApplication remove: self model)]);
		with: [html html: '<i class="bi bi-trash3"></i>']! !

!SBSTableExampleDeleteRowComponent categoriesForMethods!
hostApplication!accessing!private! !
hostApplication:!accessing!private! !
renderContentOn:!public!rendering! !
!

