"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableExpandableExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableExpandableExample guid: (GUID fromString: '{26fa6392-0d72-423f-9d46-e11cb97f0586}')!

SBSBootstrapTableExpandableExample comment: ''!

!SBSBootstrapTableExpandableExample categoriesForClass!Base! !

!SBSBootstrapTableExpandableExample methodsFor!

createTable

	^SBSTable new
		list: self list;
		detailComponentClass: SBSBootstrapDetailComponentExample;

		addColumn: 
			(SBSTableColumn new
				label: 'ID';
				accessor: #id;
				yourself);
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

	html text: 'Set a '.
	html code with: 'detailComponentClass'.
	html text: ' to make rows expandable with a detailed UI.'! !

!SBSBootstrapTableExpandableExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableExpandableExample class methodsFor!

exampleName	^'Expandable'!

ordering

	^10! !

!SBSBootstrapTableExpandableExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

