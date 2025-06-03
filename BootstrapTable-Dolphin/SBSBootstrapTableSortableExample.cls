"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableSortableExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableSortableExample guid: (GUID fromString: '{245415f1-28b2-4be6-b5f0-2a6cdfc7e7fb}')!

SBSBootstrapTableSortableExample comment: ''!

!SBSBootstrapTableSortableExample categoriesForClass!Base! !

!SBSBootstrapTableSortableExample methodsFor!

createTable

	^SBSTable new
		list: self list;

		addColumn: 
			(SBSTableColumn new
				label: 'ID';
				accessor: #id;
				isSortable: true;
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Name';
				accessor: #name;
				sortBlock: [ :a : b | a id <= b id];
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Price';
				accessor: #price;
				renderBlock: [ :html :price | html text: ('$', price displayString)];
				isSortable: true;
				yourself);
		yourself!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'isSortable: true'.
	html text: ' or set a '.
	html code with: 'sortBlock '.
	html text: 'to make a column sortable.'! !

!SBSBootstrapTableSortableExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableSortableExample class methodsFor!

exampleName	^'Sortable'!

ordering

	^8! !

!SBSBootstrapTableSortableExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

