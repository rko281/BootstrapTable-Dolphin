"Filed out from Dolphin Smalltalk"!

SBSTableColumnComponent subclass: #SBSTableSingleColumn
	instanceVariableNames: 'getContentsBlock fieldName sortBlock footerBlock'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableSingleColumn guid: (GUID fromString: '{16aee6cd-3e32-4863-87fa-4be75332c3ef}')!

SBSTableSingleColumn comment: ''!

!SBSTableSingleColumn categoriesForClass!Component! !

!SBSTableSingleColumn methodsFor!

accessAt: aSymbol

	"Configure the receiver to display the value answered by a row object when sent at: aSymbol (e.g. if model objects are Dictionaries)"

	self 
		fieldName: aSymbol;
		getContentsBlock: [ :obj | obj at: aSymbol]
	!

accessor: aSymbol

	"Configure the receiver to display the value answered by a row object to the message aSymbol"

	self 
		fieldName: aSymbol;
		getContentsBlock: [ :obj | obj perform: aSymbol].
	!

addToTable: aSBSTable

	self table: aSBSTable.
	aSBSTable _addColumn: self!

alignCenter

	self option: #align value: 'center'!

alignLeft

	self option: #align value: 'left'!

alignRight

	self option: #align value: 'right'!

applyOptionsTo: aTableHeading

	self 
		option: #field value: self fieldName;
		option: #sortable value: self isSortable.
	self needsFormatterScript ifTrue: [self option: #formatter value: 'columnFormatter', self id].
	self needsSortCallback ifTrue: [self option: #sorter value: 'columnSorter', self id].
	self needsFooterCallback ifTrue: [self option: #footerFormatter value: 'columnFooter', self id].

	super applyOptionsTo: aTableHeading!

clickToSelect: aBoolean

	self option: #clickToSelect value: aBoolean!

columnSpan

	^1!

contentFromRow: anObject

	^getContentsBlock ifNotNil: [getContentsBlock value: anObject]!

defaultSortBlock

	^[ :a :b | (self contentFromRow: a) <= (self contentFromRow: b)]!

fieldName

	"fieldName stores the name/key of the value displayed by this column in the table's json data"

	^fieldName ifNil: ['column', (self table indexOfColumn: self) asString]!

fieldName: anObject

	"fieldName stores the name/key of the value displayed by this column in the table's json data"

	fieldName := anObject!

footerBlock

	"footerBlock optionally stores a zero-arg block which is evaluated to answer the footer of this column"

	^footerBlock!

footerBlock: aBlock

	"footerBlock optionally stores a zero-arg block which is evaluated to answer the footer of this column"

	footerBlock := aBlock!

footerForData

	^self hasFooter
		ifTrue: [self footerBlock value]
		ifFalse: [nil]!

footerText: aString

	self footerBlock: [aString]!

getContentsBlock

	"getContentsBlock stores a 1-arg block which is evaluated with the row object and should answer the item to display (String, Number etc.) in this column for that row.
	Terminology is based on Dolphin's ListViewColumn.
	This can be set directly or for simple cases via #accessor: or: #accessAt: "

	^getContentsBlock!

getContentsBlock: aOneArgBlock

	"getContentsBlock stores a 1-arg block which is evaluated with the row object and should answer the item to display (String, Number etc.) in this column for that row.
	Terminology is based on Dolphin's ListViewColumn.
	This can be set directly or for simple cases via #accessor: or: #accessAt: "

	getContentsBlock := aOneArgBlock!

handleFooterCallback

	self requestContext respond: 
		[ :response  |
		response 
			contentType: self application contentType;
			nextPutAll: 
				(WAHtmlCanvas builder
					fullDocument: false;
					render: 
						[ :html |
						html text: footerBlock value displayString])]!

handleSortCallbackWith:  params

	| stream rowId1 rowId2 row1 row2 result |

	"params format is row id 1, row id 2"
	stream := params readStream.
	rowId1 := (stream upTo: $,) asInteger.
	rowId2 := Integer readFrom: stream.

	row1 := self table rowWithId: rowId1.
	row2 := self table rowWithId: rowId2.

	result := (self sortBlock value: row1 value: row2) ifTrue: [-1] ifFalse: [1].

	self requestContext respond: [ :response  | result displayOn: response]!

hasContent

	^getContentsBlock notNil!

hasCustomSort

	^sortBlock notNil and: [sortBlock ~= self defaultSortBlock]!

hasFooter

	^footerBlock notNil!

hasSorter

	^self hasOption: #sorter!

hasSubComponent

	^self subclassResponsibility!

isCheckBox

	^self isOption: #checkbox!

isCheckButton

	^self isCheckBox or: [self isRadioButton]!

isRadioButton

	^self isOption: #radio!

isSearchable

	^false!

isSortable

	^self sortBlock notNil!

isSortable: aBoolean

	"Convenience method to install a default sortBlock"

	aBoolean 
		ifTrue: [self sortBlock: self defaultSortBlock]
		ifFalse: [self sortBlock: nil]!

needsFooterCallback

	^footerBlock notNil and: [self table hasServerSidePagination not]!

needsFormatterScript

	^self subclassResponsibility!

needsSortCallback

	^self isSortable and: [self hasCustomSort and: [self table hasServerSort not]]!

renderFooterScriptOn: html

	| functionName function statement |
	
	functionName := self option: #footerFormatter.
	function := JSFunction named: functionName arguments: #('args' 'footer').

	statement := 
		html jQuery ajax 
			async: false; 
			yourself.

	statement callback: [self handleFooterCallback].

	statement onSuccess: ('html=result' asFunction: #('result')).

	function 
		add: statement; 
		returnExpression: 'html'.

	html script: function!

renderFormatterScriptOn: html

	self subclassResponsibility!

renderOn: html

	| tableHeading |

	tableHeading := html tableHeading.
	tableHeading id: (self idOn: html).

	self 
		renderTableHeading: tableHeading;
		renderScriptsOn: html!

renderScriptsOn: html

	self needsFormatterScript ifTrue: [self renderFormatterScriptOn: html].
	self needsSortCallback ifTrue: [self renderSortScriptOn: html].
	self needsFooterCallback ifTrue: [self renderFooterScriptOn: html]!

renderSortScriptOn: html

	| functionName function idAccessor |
	
	functionName := self option: #sorter.
	function := JSFunction named: functionName arguments: #('fieldA' 'fieldB' 'rowA' 'rowB').

	idAccessor := self table idAccessor.
	function 
		add: 
			(html jQuery ajax 
				async: false; 
				callback: [ :params | self handleSortCallbackWith: params] value: {html javascript alias: 'rowA.', idAccessor. html javascript alias: 'rowB.', idAccessor};
				onSuccess: ('sortResult=result' asFunction: #('result'));
				yourself);
		returnExpression: 'sortResult'.

	html script: function!

rowSpan

	^(self table columnDepth - self depth) +1!

sortBlock

	"The sort block to use when sorting on this column.
	Note the block is evaluated with the row object, not the field value"

	^sortBlock!

sortBlock: anObject

	"The sort block to use when sorting on this column.
	Note the block is evaluated with the row object, not the field value"

	sortBlock := anObject! !

!SBSTableSingleColumn categoriesForMethods!
accessAt:!accessing!public! !
accessor:!accessing!public! !
addToTable:!operations!private! !
alignCenter!options!public! !
alignLeft!options!public! !
alignRight!options!public! !
applyOptionsTo:!options!private! !
clickToSelect:!options!public! !
columnSpan!accessing!private! !
contentFromRow:!accessing!private! !
defaultSortBlock!constants!private! !
fieldName!accessing!public! !
fieldName:!accessing!public! !
footerBlock!accessing!public! !
footerBlock:!accessing!public! !
footerForData!accessing!private! !
footerText:!accessing!public! !
getContentsBlock!accessing!public! !
getContentsBlock:!accessing!public! !
handleFooterCallback!callbacks!private! !
handleSortCallbackWith:!callbacks!private! !
hasContent!public!testing! !
hasCustomSort!public!testing! !
hasFooter!public!testing! !
hasSorter!public!testing! !
hasSubComponent!public!testing! !
isCheckBox!public!testing! !
isCheckButton!public!testing! !
isRadioButton!public!testing! !
isSearchable!public!testing! !
isSortable!public!testing! !
isSortable:!accessing!public! !
needsFooterCallback!public!testing! !
needsFormatterScript!public!testing! !
needsSortCallback!public!testing! !
renderFooterScriptOn:!private!rendering! !
renderFormatterScriptOn:!private!rendering! !
renderOn:!public!rendering! !
renderScriptsOn:!private!rendering! !
renderSortScriptOn:!private!rendering! !
rowSpan!accessing!private! !
sortBlock!accessing!public! !
sortBlock:!accessing!public! !
!

