"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableFooterExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableFooterExample guid: (GUID fromString: '{0aad97d9-2733-4449-9694-323605344e1d}')!

SBSBootstrapTableFooterExample comment: ''!

!SBSBootstrapTableFooterExample categoriesForClass!Base! !

!SBSBootstrapTableFooterExample methodsFor!

createTable

	^SBSTable new
		list: self list;
		hasFooter: true;

		addColumn: 
			(SBSTableColumn new
				label: 'ID';
				accessor: #id;
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Name';
				accessor: #name;
				footerText: 'Total:';
				yourself);
		addColumn: 
			(SBSTableColumn new
				label: 'Item Price';
				accessor: #price;
				footerIsTotal;
				renderBlock: [ :html :price | html text: ('$', price displayString)];
				yourself);
		yourself!

renderDescriptionOn: html

	html text: 'Set '.
	html code with: 'hasFooter: true'.
	html text: ' to add a footer to the table. On individual columns use '.
	html code with: 'footerBlock: footerText:'.
	html text: ' or '.
	html code with: 'footerIsTotal'.
	html text: ' to define a footer for that column.'! !

!SBSBootstrapTableFooterExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableFooterExample class methodsFor!

exampleName	^'Footers'!

ordering

	^12! !

!SBSBootstrapTableFooterExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

