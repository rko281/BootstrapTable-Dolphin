"Filed out from Dolphin Smalltalk"!

SBSTableSubComponent subclass: #SBSTableExampleProductEditor
	instanceVariableNames: 'fields'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableExampleProductEditor guid: (GUID fromString: '{a4911e9b-f867-4f43-8080-30ee9661cf53}')!

SBSTableExampleProductEditor comment: ''!

!SBSTableExampleProductEditor categoriesForClass!Component! !

!SBSTableExampleProductEditor methodsFor!

fieldAt: aSymbol

	^fields at: aSymbol!

fieldAt: aSymbol put: aString

	fields at: aSymbol put: aString asSymbol!

loadFieldsWith: script

	script << (script jQuery: (self fieldAt: #name)) value: self model name.
	script << (script jQuery: (self fieldAt: #price)) value: self model price displayString.
	script << (script jQuery: (self fieldAt: #inStockResult)) value: self model inStock displayString.
	script << (script jQuery: (self fieldAt: #inStock)) propertyAt: #checked put: self model inStock.

	script << ((script jQuery: (self fieldAt: #name)) call: 'focus')!

renderContentOn: html

	fields := IdentityDictionary new.

	html form 
		script: (html jQuery ajax script: [ :script | self loadFieldsWith: script]);
		onSubmit: (html javascript return: false);
		with: 
			[html formGroup
					marginBottom: 3;
					with: 
						[html label: 'Item Name:'.
						self fieldAt: #name put: 
							(html textInput 
								formControl;
								required;
								callback: [ :val | self model name: val];
								placeholder: 'Enter Product Name';
								ensureId)].
			html formGroup
					marginBottom: 3;
					with: 
						[html label: 'Price'.
						self fieldAt: #price put: 
							(html textInput
								formControl;
								required;
								callback: [ :val | self model price: (ScaledDecimal newFromNumber: (Number fromString: val) scale: 2)];
								placeholder: '0.00';
								ensureId)].

				html formGroup 
					marginBottom: 3;
					formCheck; 
					with: 
						[| checkbox |
						self fieldAt: #inStockResult put: 
							(html textInput 
								attributeAt: #hidden put: true;
								formControl;
								callback: [ :val | self model inStock: (val = 'true')];
								ensureId).
						checkbox := html formCheckbox.
						self fieldAt: #inStock put: checkbox ensureId.
						checkbox onChange: ('document.getElementById(''',(self fieldAt: #inStockResult),''').value = document.getElementById(''',(self fieldAt: #inStock),''').checked ? ''true'' : ''false''').
						html formCheckLabel 
							for: (self fieldAt: #inStock); 
							with: 'In stock?'].

			html formButton
					beSecondary;
					onClick: (html jQuery ajax script: [ :script | self loadFieldsWith: script]);
					with: 'Cancel'.
			
			html formButton
					bePrimary;
					onClick: (html jQuery ajax serializeForm; script: [ :script | script << (self table updateRow: self model)]);
					with: 'Save']! !

!SBSTableExampleProductEditor categoriesForMethods!
fieldAt:!accessing!public! !
fieldAt:put:!accessing!public! !
loadFieldsWith:!operations!private! !
renderContentOn:!public!rendering! !
!

