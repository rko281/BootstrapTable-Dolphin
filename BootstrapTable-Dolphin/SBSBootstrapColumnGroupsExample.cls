"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapColumnGroupsExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapColumnGroupsExample guid: (GUID fromString: '{58544550-d89c-4c8d-9959-4643f2b9f96b}')!

SBSBootstrapColumnGroupsExample comment: ''!

!SBSBootstrapColumnGroupsExample categoriesForClass!Base! !

!SBSBootstrapColumnGroupsExample methodsFor!

createTable

	^SBSTable new
		list: self list;

		addRowSelector;
		addColumn: 
			(SBSTableColumnGroup new 
				label: 'Product'; 
				addColumn:
					(SBSTableColumn new
						label: 'ID';
						accessor: #id;
						isSortable: true;
						yourself);
				addColumn: 
					(SBSTableColumnGroup new 
						label: 'Details'; 
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
						yourself);
				yourself);
			yourself!

renderDescriptionOn: html

	html text: 'Use '.
	html code with: 'SBSTableColumnGroup'.
	html text: ' to group columns together'! !

!SBSBootstrapColumnGroupsExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapColumnGroupsExample class methodsFor!

exampleName	^'Column Groups'!

ordering

	^11! !

!SBSBootstrapColumnGroupsExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

