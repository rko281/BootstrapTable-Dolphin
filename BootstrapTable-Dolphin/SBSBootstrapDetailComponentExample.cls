"Filed out from Dolphin Smalltalk"!

SBSTableSubComponent subclass: #SBSBootstrapDetailComponentExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapDetailComponentExample guid: (GUID fromString: '{6a48cd28-1099-4db2-8bf0-51f4a0d13e7a}')!

SBSBootstrapDetailComponentExample comment: ''!

!SBSBootstrapDetailComponentExample categoriesForClass!Base! !

!SBSBootstrapDetailComponentExample methodsFor!

renderContentOn: html

	html code: 
		[| instVarNames |
		html strong: self model displayString.

		instVarNames := self model class allInstVarNames.
		1 to: instVarNames size do: 
			[ :index |
			html 
				break;
				code: [html strong: (instVarNames at: index); text: ': ', (self model instVarAt: index) displayString]]].

	html break.
	html anchor
		url: 'javascript:void(0)';
		onClick: (html jQuery ajax callback: [self model inspect]);
		with: 'Inspect It'! !

!SBSBootstrapDetailComponentExample categoriesForMethods!
renderContentOn:!public!rendering! !
!

