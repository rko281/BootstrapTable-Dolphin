"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableApplicationExample
	instanceVariableNames: 'list'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableApplicationExample guid: (GUID fromString: '{af1e7068-964f-4ff1-8d83-df98d6490b51}')!

SBSBootstrapTableApplicationExample comment: ''!

!SBSBootstrapTableApplicationExample categoriesForClass!Base! !

!SBSBootstrapTableApplicationExample methodsFor!

addProduct

	| id newProduct |

	id := (self list inject: 0 into: [ :max :each | max max: each id]) + 1.
	newProduct := 
		SBSTableExampleProduct new
			id: id;
			name: 'Item ', id asString;
			price: 0s2;
			inStock: true.

	self list addLast: newProduct.

	^newProduct!

addProductWithScript: script

	| product |

	product := self addProduct.

	script
		add: self table collapseAll;
		add: self table unselectAll;
		add: (self table onItemAdded: product);
		add: (self table expand: product)!

createTable

	^SBSTable new
		id: #table;
		list: self list;
		hasSearch: true;
		hasFooter: true;
		clickToSelect: true;
		detailComponentClass: SBSTableExampleProductEditor;
		option: #toolbar value: '#toolbar';
		options: #(#showRefresh #showToggle #showFullscreen #showColumns #showColumnsToggleAll #showExport) value: true;

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
				renderBlock: [ :html :price | html text: ('$', price displayString)];
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

inspectSelectedProduct

	self table selection inspect!

list

	^list ifNil: [list := super list]!

remove: anObject

	^self table onItemRemoved: (self list remove: anObject)!

removeSelectionsWithScript: script

	| removed |

	removed := self list removeAll: table selections.

	script
		add: self table collapseAll;
		add: self table unselectAll;
		add: (self table onItemsRemoved: removed)!

renderDescriptionOn: html

	html text: 'Simple Demo Application with embedded data. Demonstrates selection, sort, detail view, list updating etc.'!

renderTableOn: html

	self renderToolbarOn: html.

	super renderTableOn: html.

	self table 
		whenHasSelectionEnable: (html jQuery: #removeButton) on: html;
		whenHasSingleSelectionEnable: (html jQuery: #inspectButton) on: html!

renderToolbarOn: html

	html buttonToolbar 
		id: 'toolbar';
		with: 
			[html formButton 
					id: #addButton;
					bePrimary;
					onClick: (html jQuery ajax script:  [ :script | self addProductWithScript: script]);
					with: 'Add'.
			html formButton 
					id: #inspectButton;
					beInfo;
					disabled;
					onClick: (html jQuery ajax script:  [ :script | self inspectSelectedProduct]);
					with: 'Inspect'.
			html formButton 
					id: #removeButton;
					beDanger;
					disabled;
					onClick: (html jQuery ajax script: [ :script | self removeSelectionsWithScript: script]);
					with: 'Remove']! !

!SBSBootstrapTableApplicationExample categoriesForMethods!
addProduct!add/remove!public! !
addProductWithScript:!add/remove!private! !
createTable!initialize/release!public! !
inspectSelectedProduct!accessing!public! !
list!accessing!public! !
remove:!add/remove!public! !
removeSelectionsWithScript:!add/remove!private! !
renderDescriptionOn:!public!rendering! !
renderTableOn:!public!rendering! !
renderToolbarOn:!public!rendering! !
!

!SBSBootstrapTableApplicationExample class methodsFor!

exampleName	^'Demo Application 1'!

ordering

	^99! !

!SBSBootstrapTableApplicationExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

