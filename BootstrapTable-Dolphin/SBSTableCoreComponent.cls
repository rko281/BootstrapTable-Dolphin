"Filed out from Dolphin Smalltalk"!

SBSComponent subclass: #SBSTableCoreComponent
	instanceVariableNames: 'id options'
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableCoreComponent guid: (GUID fromString: '{c4f3c394-758f-4506-98b7-b5a291cfd2f4}')!

SBSTableCoreComponent comment: ''!

!SBSTableCoreComponent categoriesForClass!Component! !

!SBSTableCoreComponent methodsFor!

applyOptionsTo: aTag

	options keysAndValuesDo: [ :option :value | aTag attributeAt: option asHtmlTagDataAttribute put: value displayString].!

columnSpan

	^1!

hasOption: aSymbol

	^options includesKey: aSymbol!

id
	^id!

id: anObject
	id := anObject!

idOn: html
	^id ifNil: [id := html nextId]!

initialize

	super initialize.

	self resetOptions!

isOption: aSymbol

	"Convenience tester for boolean options"

	^self isOption: aSymbol default: false!

isOption: aSymbol default: aBoolean

	"Convenience tester for boolean options"

	^self option: aSymbol default: aBoolean!

option: aSymbol

	^self option: aSymbol default: nil!

option: aSymbol default: defaultValue

	^options at: aSymbol ifAbsent: [defaultValue]!

option: aSymbol value: anObject

	(self validOptions includes: aSymbol) ifFalse: [Notification signal: 'unknown <1s> option <2p>' << {self class name. aSymbol}].

	anObject isNil 
		ifTrue: [options removeKey: aSymbol ifAbsent: []]
		ifFalse: [options at: aSymbol put: anObject]!

options: aCollection value: anObject

	aCollection do: [ :each | self option: each value: anObject]!

resetOptions

	options := IdentityDictionary new.
	self setDefaultOptions!

setDefaultOptions!

validOptions

	^#()! !

!SBSTableCoreComponent categoriesForMethods!
applyOptionsTo:!options!private! !
columnSpan!accessing!private! !
hasOption:!public!testing! !
id!accessing!public! !
id:!accessing!public! !
idOn:!accessing!public! !
initialize!initialize/release!public! !
isOption:!public!testing! !
isOption:default:!public!testing! !
option:!options!public! !
option:default:!options!public! !
option:value:!options!public! !
options:value:!options!public! !
resetOptions!options!private! !
setDefaultOptions!options!private! !
validOptions!options!private! !
!

