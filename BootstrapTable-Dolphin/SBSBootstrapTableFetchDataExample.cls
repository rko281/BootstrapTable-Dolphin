"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableFetchDataExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableFetchDataExample guid: (GUID fromString: '{7d33a747-513f-4252-975e-928a8e9e3210}')!

SBSBootstrapTableFetchDataExample comment: ''!

!SBSBootstrapTableFetchDataExample categoriesForClass!Base! !

!SBSBootstrapTableFetchDataExample methodsFor!

createTable

	^SBSTable new
		fetchData;
		list: self list;

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
	^20!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'fetchData'.
	html text: ' to have the table data fetched from an automatically-generated URL.'.! !

!SBSBootstrapTableFetchDataExample categoriesForMethods!
createTable!initialize/release!public! !
listSize!accessing!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableFetchDataExample class methodsFor!

exampleName	^'Fetch Data'!

ordering

	^4! !

!SBSBootstrapTableFetchDataExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

