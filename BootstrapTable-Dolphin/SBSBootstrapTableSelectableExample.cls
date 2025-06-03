"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableSelectableExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableSelectableExample guid: (GUID fromString: '{9dcdb556-7420-414b-a2ab-6106a2c393b0}')!

SBSBootstrapTableSelectableExample comment: ''!

!SBSBootstrapTableSelectableExample categoriesForClass!Base! !

!SBSBootstrapTableSelectableExample methodsFor!

createTable

	^SBSTable new
		list: self list;
		clickToSelect: true;

		addRowSelector;
		addColumn: 
			(SBSTableColumn new
				label: 'Item Name';
				accessor: #name;
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Price';
				accessor: #price;
				renderBlock: [ :html :price | html text: ('$', price displayString)];
				yourself);
		yourself!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'addRowSelector'.
	html text: ' to make rows selectable and '.
	html code with: ' clickToSelect: true '.
	html text: ' to select by clicking rows.'!

renderExampleOn: html

	super renderExampleOn: html.

	html span id: #count; with: '0 item(s) selected'.

	self table whenSelectionChangeEvaluate: ((html jQuery: #count) load html: [ :h | h render: (self table selections size asString, ' item(s) selected')]) asFunction on: html! !

!SBSBootstrapTableSelectableExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
renderExampleOn:!public!rendering! !
!

!SBSBootstrapTableSelectableExample class methodsFor!

exampleName	^'Selectable'!

ordering

	^9! !

!SBSBootstrapTableSelectableExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

