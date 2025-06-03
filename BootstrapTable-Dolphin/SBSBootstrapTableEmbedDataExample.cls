"Filed out from Dolphin Smalltalk"!

SBSBootstrapTableExample subclass: #SBSBootstrapTableEmbedDataExample
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableEmbedDataExample guid: (GUID fromString: '{53e236c9-3f65-4a9d-b6eb-8af5593ce8ed}')!

SBSBootstrapTableEmbedDataExample comment: ''!

!SBSBootstrapTableEmbedDataExample categoriesForClass!Base! !

!SBSBootstrapTableEmbedDataExample methodsFor!

createTable

	^SBSTable new
		list: self list;

		addColumn: 
			(SBSTableColumn new
				label: 'ID';
				accessor: #id
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

	html text: 'Use '.
	html code with: 'list:'.
	html text: ' to set the table data to a '.
	html code with: 'Collection'.
	html text: '. The default is to embed the list''s JSON representation in the page.'! !

!SBSBootstrapTableEmbedDataExample categoriesForMethods!
createTable!initialize/release!public! !
renderDescriptionOn:!public!rendering! !
!

!SBSBootstrapTableEmbedDataExample class methodsFor!

exampleName	^'Embed Data'!

ordering

	^2! !

!SBSBootstrapTableEmbedDataExample class categoriesForMethods!
exampleName!accessing!public! !
ordering!accessing!public! !
!

