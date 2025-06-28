"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableApplicationExample subclass: #SBSBootstrapTableApplicationExample2
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableApplicationExample2 guid: (GUID fromString: '{23da58aa-ad79-4421-af4a-01a291a496ba}')!

SBSBootstrapTableApplicationExample2 comment: ''!

!SBSBootstrapTableApplicationExample2 categoriesForClass!Base! !

!SBSBootstrapTableApplicationExample2 methodsFor!

createTable

	^SBSTable new
		id: #table;
		fetchData;
		list: self list;
		hasPagination: true;
		hasSearch: true;
		hasFooter: true;
		clickToSelect: true;
		detailComponentClass: SBSTableExampleProductEditor;
		option: #toolbar value: '#toolbar';
		options: #(#showRefresh #showToggle #showFullscreen #showColumns #showColumnsToggleAll #showExport #showPaginationSwitch) value: true;

		addRowSelector;
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
				sortBlock: [ :a : b | a id <= b  id];
				footerText: 'Total:';
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Price';
				accessor: #price;
				isSortable: true;
				alignRight;
				footerIsTotal;
				formatExpression: 'value.toLocaleString(''en-US'', {style: ''currency'', currency: ''USD''})';
				yourself);
		addColumn: 
			(SBSTableColumn new
				isSortable: true;
				beCheckBox;
				label: 'In Stock?';
				accessor: #inStock;
				width: 120;
				footerBlock: [table data inject: 0 into: [ :count :each | each inStock ifTrue: [count + 1] ifFalse: [count]]];
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: '';
				clickToSelect: false;
				alignCenter;
				componentGenerator: [ :col :row | SBSTableExampleDeleteRowComponent new column: col; model: row; hostApplication: self; yourself];
				yourself);
		yourself!

listSize
	^1000!

renderDescriptionOn: html

	html text: 'Enhanced Demo Application with a larger dataset. Features pagination with incremental data fetching.'! !

!SBSBootstrapTableApplicationExample2 categoriesForMethods!
createTable!initialize/release!public! !
listSize!accessing!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableApplicationExample2 class methodsFor!

exampleName	^'Demo Application 2'!

ordering

	^super ordering + 1! !

!SBSBootstrapTableApplicationExample2 class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

