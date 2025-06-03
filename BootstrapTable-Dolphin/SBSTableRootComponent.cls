"Filed out from Dolphin Smalltalk"!

SBSRootComponent subclass: #SBSTableRootComponent
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableRootComponent guid: (GUID fromString: '{6c36cc25-3661-4039-af3b-9bfdf92fbd5f}')!

SBSTableRootComponent comment: ''!

!SBSTableRootComponent categoriesForClass!Component! !

!SBSTableRootComponent methodsFor!

updateRoot: anHtmlRoot

	super updateRoot: anHtmlRoot.

	SBSJQueryCDNDeploymentLibrary addLoadScriptTo: anHtmlRoot.
	SBSCDNDeploymentLibrary addLoadScriptTo: anHtmlRoot.	SBSTableCDNDeploymentLibrary addLoadScriptTo: anHtmlRoot! !

!SBSTableRootComponent categoriesForMethods!
updateRoot:!public!rendering! !
!

!SBSTableRootComponent class methodsFor!

register	^(WAAdmin register: self asApplicationAt: self contextRoot)
		addLibrary: SBSCDNDeploymentLibrary;		addLibrary: SBSIconsCDNDeploymentLibrary;
		addLibrary: SBSTableCDNDeploymentLibrary;
		yourself! !

!SBSTableRootComponent class categoriesForMethods!
register!public!registration! !
!

