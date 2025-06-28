"Filed out from Dolphin Smalltalk"!

SBSComponent subclass: #SBSBootstrapTableExample
	instanceVariableNames: 'table'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSBootstrapTableExample guid: (GUID fromString: '{38e7a3d4-d1a1-481b-8687-f5bea6512192}')!

SBSBootstrapTableExample comment: ''!

!SBSBootstrapTableExample categoriesForClass!Base! !

!SBSBootstrapTableExample methodsFor!

children

	^{self table}!

createTable

	self subclassResponsibility!

initialize

	super initialize.

	self table: self createTable!

list

	^OrderedCollection withAll: 
		((1 to: self listSize) collect: 
			[ :index | 
			SBSTableExampleProduct new
				id: index;
				name: 'Item ', index displayString;
				price: (ScaledDecimal newFromNumber: index scale: 2);
				inStock: (index \\ 5) > 0;
				yourself])!

listSize
	^10!

renderContentOn: html	html containerFluid: [		html break.		html			heading level2 with: self class exampleName.		self renderExampleOn: html ]!

renderDescriptionOn: html

	self subclassResponsibility!

renderExampleOn: html
	html div
		class: 'header-wrapper';
		with: 
				[html paragraph
					class: 'bd-lead';
					with: [html paragraph with: [self renderDescriptionOn: html]]].
	html div
		class: 'bootstrap-table bootstrap5';
		with: [self renderTableOn: html]!

renderTableOn: html

	table renderContentOn: html!

style	^''!

table
	^table!

table: anObject
	table := anObject! !

!SBSBootstrapTableExample categoriesForMethods!
children!accessing!public! !
createTable!initialize/release!public! !
initialize!initialize/release!public! !
list!accessing!public! !
listSize!accessing!public! !
renderContentOn:!public!rendering! !
renderDescriptionOn:!public!rendering! !
renderExampleOn:!public!rendering! !
renderTableOn:!public!rendering! !
style!hooks!public! !
table!accessing!public! !
table:!accessing!public! !
!

!SBSBootstrapTableExample class methodsFor!

exampleName	^self subclassResponsibility!

isAbstract	^self name = #SBSBootstrapTableExample!

ordering

	^SmallInteger maximum! !

!SBSBootstrapTableExample class categoriesForMethods!
exampleName!accessing!public! !
isAbstract!public!testing! !
ordering!accessing!public! !
!

