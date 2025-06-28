"Filed out from Dolphin Smalltalk"!

SBSTableSingleColumn subclass: #SBSTableColumn
	instanceVariableNames: 'formatterFunction renderBlock componentGenerator'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableColumn guid: (GUID fromString: '{670e3fe6-4f69-47ec-8422-cf216984ab90}')!

SBSTableColumn comment: ''!

!SBSTableColumn categoriesForClass!Kernel-Objects! !

!SBSTableColumn methodsFor!

beCheckBox

	self 
		componentClass: SBSTableCheckBox;
		alignCenter.

	self isSortable ifTrue: [self sortBlock: [ :a :b | self contentFromRow: b]]!

componentClass: aSBSTableSubComponentSubclass

	"Convenience method.
	Argument should be a subclass of SBSTableSubComponent (or compatible class)"

	self componentGenerator: 
		[ :column :row |
		aSBSTableSubComponentSubclass new
			column: self;
			model: row;
			yourself]!

componentGenerator

	"Optional - a 2-arg block which generates a component to use to render the contents of this column.
	Arguments are the receiver and the row object for which the component is being generated"

	^componentGenerator
!

componentGenerator: aBlock

	"Optional - a 2-arg block which generates a component to use to render the contents of this column.
	Arguments are the receiver and the row object for which the component is being generated"

	componentGenerator := aBlock!

footerForData

	self hasFooter ifFalse: [^nil].
	self hasRenderBlock ifFalse: [^super footerForData].

	^WAHtmlCanvas builder
		fullDocument: false;
		render: [ :html |self renderBlock cull: html cull: footerBlock value]!

footerIsTotal

	self footerBlock: [self total]!

formatExpression: aString

	"Simplified interface to formatterFunction.
	aString is a Javascript expression that will be used as the result of the formatterFunction.
	Parameters to the function are value, row, index and field as per the documentation (see link in formatterFunction)"

	self formatterFunction: 
		(JSFunction new
			arguments: #('value' 'row' 'index' 'field');
			returnExpression: aString;
			yourself)!

formatterFunction

	"formatterFunction optionally stores a JSFunction which is used to render the value to be displayed in this column.
	This maps to the formatter option of the column - https://bootstrap-table.com/docs/api/column-options/#formatter

	This represents a client-side alternative to renderBlock for improved performance when displaying large datasets"

	^formatterFunction!

formatterFunction: aJSFunction

	"formatterFunction optionally stores a JSFunction which is used to render the value to be displayed in this column.
	This maps to the formatter option of the column - https://bootstrap-table.com/docs/api/column-options/#formatter

	This represents a client-side alternative to renderBlock for improved performance when displaying large datasets"

	formatterFunction := aJSFunction!

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
						self table initializeSubCanvas: html.
						self hasRenderBlock
							ifTrue: [self renderBlock cull: html cull: footerBlock value]
							ifFalse: [html text: footerBlock value displayString]])]!

handleFormatterCallbackForRowId: anInteger

	(self table rowWithId: anInteger) ifNotNil: 
		[ :row | 
		self requestContext respond: 
			[ :response  |
			response 
				contentType: self application contentType;
				nextPutAll: 
					(WAHtmlCanvas builder
						fullDocument: false;
						render: 
							[ :html |
							self table initializeSubCanvas: html.
							self hasComponent
								ifTrue: [(self componentGenerator value: self value: row) renderContentOn: html]
								ifFalse: [self renderBlock cull: html cull: (self contentFromRow: row) cull: row]])]]!

hasComponent

	^componentGenerator notNil!

hasFormatterFunction

	^formatterFunction notNil!

hasRenderBlock

	^renderBlock notNil!

hasSubComponent

	^self hasRenderBlock or: [self hasComponent]!

isSearchable

	^self isOption: #searchable default: true!

needsFormatterScript

	^self hasFormatterFunction or: [self hasSubComponent]!

renderBlock

	"renderBlock optionally stores a two or three arg block which is evaluated with 
		1) a html canvas
		2) the value to be displayed 
		3) the row object (optional)
	and should deliver the HTML to be displayed in this columns.
	This represents a simpler alternative to componentClass"

	^renderBlock!

renderBlock: anObject

	"renderBlock optionally stores a two or three arg block which is evaluated with 
		1) a html canvas
		2) the value to be displayed 
		3) the row object (optional)
	and should deliver the HTML to be displayed in this columns.
	This represents a simpler alternative to componentClass"

	renderBlock := anObject!

renderFormatterCallbackScriptOn: html

	| functionName function statement |

	functionName := self option: #formatter.
	function := JSFunction named: functionName arguments: #('value' 'row' 'index' 'field').

	statement := 
		html jQuery ajax 
			async: false; 
			yourself.

	statement 
		callback: [ :rowId | self handleFormatterCallbackForRowId: rowId asInteger] value: (html javascript alias: 'row.', self table idAccessor);
		onSuccess: ('html=result' asFunction: #('result')).

	function 
		add: statement; 
		returnExpression: 'html'.

	html script: function!

renderFormatterFunctionOn: html

	| functionName |

	functionName := self option: #formatter.
	html script: (self formatterFunction named: functionName)!

renderFormatterScriptOn: html

	self hasFormatterFunction
		ifTrue: [self renderFormatterFunctionOn: html]
		ifFalse: [self renderFormatterCallbackScriptOn: html]!

total

	"Assume the receiver contains numeric values"

	^self table data inject: 0 into: [ :total :each | total + (self contentFromRow: each)]! !

!SBSTableColumn categoriesForMethods!
beCheckBox!configuring!public! !
componentClass:!accessing!public! !
componentGenerator!accessing!public! !
componentGenerator:!accessing!public! !
footerForData!accessing!private! !
footerIsTotal!accessing!configuring!public! !
formatExpression:!accessing!public! !
formatterFunction!accessing!public! !
formatterFunction:!accessing!public! !
handleFooterCallback!callbacks!private! !
handleFormatterCallbackForRowId:!callbacks!private! !
hasComponent!public!testing! !
hasFormatterFunction!public!testing! !
hasRenderBlock!public!testing! !
hasSubComponent!public!testing! !
isSearchable!public!testing! !
needsFormatterScript!public!testing! !
renderBlock!accessing!public! !
renderBlock:!accessing!public! !
renderFormatterCallbackScriptOn:!private!rendering! !
renderFormatterFunctionOn:!private!rendering! !
renderFormatterScriptOn:!private!rendering! !
total!accessing!public! !
!

