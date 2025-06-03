"Filed out from Dolphin Smalltalk"!

SBSTableRootComponent subclass: #SBSTableExampleBrowser
	instanceVariableNames: 'currentExample'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableExampleBrowser guid: (GUID fromString: '{5f882b35-e88e-4100-8890-57f27a583df1}')!

SBSTableExampleBrowser comment: ''!

!SBSTableExampleBrowser categoriesForClass!Browser! !

!SBSTableExampleBrowser methodsFor!

allExamples	^(SBSBootstrapTableExample allSubclasses		select: [:ea| ea isAbstract not ])			sort: [:a :b | a ordering = b ordering ifTrue: [a name <= b name] ifFalse: [a ordering < b ordering]]!

children	^Array with: currentExample!

initialize	super initialize.	currentExample := self allExamples first new!

initialRequest: request	| exampleName |	super initialRequest: request.	exampleName := request url path last.	currentExample :=		(self allExamples			detect: [ :each |				each exampleName = exampleName ]			ifNone: [ self allExamples first ]) new!

navigateToExample: example	currentExample := example!

renderContentOn: html
	self renderNavigationBarOn: html.
	html row		with: [		html column: [ self renderNavigationOn: html ] mediumSize: 2.		html column: [ self renderExampleOn: html ] mediumSize: 10	]!

renderExampleOn: html

	currentExample ifNotNil: [
		currentExample renderOn: html.
		html break;break.
		html heading level2; with: 'Smalltalk source code'.
		html horizontalRule.
		html preformatted style: 'width: 100%'; with: [html code dataAttributeAt: 'highlighted' put: 'yes'; with: (currentExample class compiledMethodAt: #createTable) getSource].
	]!

renderNavigationBarOn: html	 html navigationBar 
			lightBackground;			with: 
				[html navigationBarBrand with: [(html tag: 'i') style: 'padding: 5px 30px;'; class: 'bi bi-table'].
				html heading: 'Bootstrap Table for Seaside'.				html navigationBarBrand with: [(html tag: 'i') style: 'padding: 5px 30px;'; class: 'bi bi-table']]!

renderNavigationOn: html	|examples item|	examples := self allExamples.	html form: [	html listGroup: [		examples do: [:ex |			item := html listGroupLinkedItem.			currentExample class = ex ifTrue: [ item beActive ].			item callback: [ self navigateToExample: ex new ];				  with: ex exampleName ]] ]!

style	^currentExample style!

updateRoot: htmlRoot

	super updateRoot: htmlRoot.
	htmlRoot title: 'Bootstrap Table for Seaside' translated!

updateUrl: url	super updateUrl: url.	url addToPath: '/browser'; addToPath: currentExample class exampleName! !

!SBSTableExampleBrowser categoriesForMethods!
allExamples!accessing!public! !
children!accessing!public! !
initialize!initialization!public! !
initialRequest:!hooks!public! !
navigateToExample:!accessing!public! !
renderContentOn:!public!rendering! !
renderExampleOn:!public!rendering! !
renderNavigationBarOn:!public!rendering components! !
renderNavigationOn:!public!rendering! !
style!hooks!public! !
updateRoot:!public!updating! !
updateUrl:!public!updating! !
!

!SBSTableExampleBrowser class methodsFor!

contextRoot	^'bootstrap-table'!

initialize	self register!

openBrowser
	WebBrowser openOn: 'http://localhost:8080/', self contextRoot! !

!SBSTableExampleBrowser class categoriesForMethods!
contextRoot!accessing!public! !
initialize!class initialization!public! !
openBrowser!public!utilities! !
!

