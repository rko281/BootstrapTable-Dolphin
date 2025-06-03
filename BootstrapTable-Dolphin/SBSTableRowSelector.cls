"Filed out from Dolphin Smalltalk"!

SBSTableSingleColumn subclass: #SBSTableRowSelector
	instanceVariableNames: 'enablementBlock'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableRowSelector guid: (GUID fromString: '{dee3173d-9268-4dcf-a7b7-1fb32a72f5f8}')!

SBSTableRowSelector comment: ''!

!SBSTableRowSelector categoriesForClass!Component! !

!SBSTableRowSelector methodsFor!

applyOptionsTo: aTableHeading

	self hasLabel ifTrue: [self option: #showSelectTitle value: true].

	super applyOptionsTo: aTableHeading!

beMultiSelect

	self 
		option: #checkbox value: true;
		option: #radio value: false!

beSingleSelect

	self 
		option: #radio value: true;
		option: #checkbox value: false!

enablementBlock

	"enablementBlock optionally stores a 1-arg block which is evaluated with a row object to determine if the check box should be enabled"

	^enablementBlock!

enablementBlock: anObject

	"enablementBlock optionally stores a 1-arg block which is evaluated with a row object to determine if the check box should be enabled"

	enablementBlock := anObject!

handleFormatterCallbackWith: params

	self requestContext respond: 
		[ :response  || rowId row |
		rowId := Integer readFrom: params readStream.
		row := self table rowWithId: rowId.
		(self enablementBlock value: row)
			ifTrue: [1 displayOn: response]
			ifFalse: [0 displayOn: response]]!

hasSubComponent

	^false!

initialize

	super initialize.

	self beMultiSelect!

needsFormatterCallback

	^self enablementBlock notNil!

renderFormatterScriptOn: html

	| functionName function |
	
	functionName := self option: #formatter.
	function := JSFunction named: functionName arguments: #('value' 'row' 'index' 'field').

	function 
		add: 
			(html jQuery ajax 
				async: false; 
				callback: [ :params | self handleFormatterCallbackWith: params] value: (html javascript alias: 'row.', self table idAccessor);
				onSuccess: ('dis=(result==0)' asFunction: #('result'));
				yourself);
		returnExpression: '{disabled: dis}'.

	html script: function asJavascript! !

!SBSTableRowSelector categoriesForMethods!
applyOptionsTo:!options!private! !
beMultiSelect!configuring!public! !
beSingleSelect!configuring!public! !
enablementBlock!accessing!public! !
enablementBlock:!accessing!public! !
handleFormatterCallbackWith:!callbacks!private! !
hasSubComponent!public!testing! !
initialize!initialize/release!public! !
needsFormatterCallback!public!testing! !
renderFormatterScriptOn:!private!rendering! !
!

