"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableServerSidePaginationExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableServerSidePaginationExample guid: (GUID fromString: '{fac0efc0-72e4-4603-a894-af53b32e7875}')!

SBSBootstrapTableServerSidePaginationExample comment: ''!

!SBSBootstrapTableServerSidePaginationExample categoriesForClass!Base! !

!SBSBootstrapTableServerSidePaginationExample methodsFor!

createTable

	^SBSTable new
		fetchData;
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
	^1000!

renderDescriptionOn: html

	html text: 'When '.
	html code: 'fetchData'.
	html text: ' is combined with '.
	html code with: 'hasPagination: true'.
	html text: ' data is incrementally fetched from the server page-by-page.'! !

!SBSBootstrapTableServerSidePaginationExample categoriesForMethods!
createTable!initialize/release!public! !
listSize!accessing!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableServerSidePaginationExample class methodsFor!

exampleName	^'Pagination 2'!

ordering

	^5! !

!SBSBootstrapTableServerSidePaginationExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

