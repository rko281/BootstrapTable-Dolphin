"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTablePaginationExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTablePaginationExample guid: (GUID fromString: '{448e6bad-b7f2-4bc2-b452-9cec6162b616}')!

SBSBootstrapTablePaginationExample comment: ''!

!SBSBootstrapTablePaginationExample categoriesForClass!Base! !

!SBSBootstrapTablePaginationExample methodsFor!

createTable

	^SBSTable new
		list: self list;
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
	^32!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'hasPagination: true'.
	html text: ' to show a pagination toolbar beneath the table.'! !

!SBSBootstrapTablePaginationExample categoriesForMethods!
createTable!initialize/release!public! !
listSize!accessing!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTablePaginationExample class methodsFor!

exampleName	^'Pagination 1'!

ordering

	^3! !

!SBSBootstrapTablePaginationExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

