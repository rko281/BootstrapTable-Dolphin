"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableSearchableExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableSearchableExample guid: (GUID fromString: '{672a1f36-5973-4b15-a1de-4cbe26a379e8}')!

SBSBootstrapTableSearchableExample comment: ''!

!SBSBootstrapTableSearchableExample categoriesForClass!Base! !

!SBSBootstrapTableSearchableExample methodsFor!

createTable

	^SBSTable new
		list: self list;
		hasSearch: true;
		hasPagination: true;
		option: #height value: 600;

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

listSize
	^100!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'hasSearch: true'.
	html text: ' to add an automatically-managed search box.'! !

!SBSBootstrapTableSearchableExample categoriesForMethods!
createTable!initialize/release!public! !
listSize!accessing!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableSearchableExample class methodsFor!

exampleName	^'Searchable'!

ordering

	^7! !

!SBSBootstrapTableSearchableExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

