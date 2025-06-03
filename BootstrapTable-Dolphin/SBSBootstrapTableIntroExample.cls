"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableIntroExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableIntroExample guid: (GUID fromString: '{cfa8aea6-45f3-4609-a483-2a7476609560}')!

SBSBootstrapTableIntroExample comment: ''!

!SBSBootstrapTableIntroExample categoriesForClass!Base! !

!SBSBootstrapTableIntroExample methodsFor!

createTable

	^SBSTable new
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

	html paragraph: 
		[html text: 'A Seaside component wrapping '.
		html anchor url: 'https://bootstrap-table.com'; with: 'Bootstrap Table'].

	html paragraph: 
		[html text: 'Define your table with an instance of '.
		html code with: 'SBSTable'.
		html text: ' adding instances of '.
		html code with: 'SBSTableColumn'.
		html text: ' for each aspect of your object that you want to display.']! !

!SBSBootstrapTableIntroExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableIntroExample class methodsFor!

exampleName	^'Introduction'!

ordering

	^1! !

!SBSBootstrapTableIntroExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

