"Filed out from Dolphin Smalltalk"!

SBSCDNDeploymentLibrary subclass: #SBSTableCDNDeploymentLibrary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableCDNDeploymentLibrary guid: (GUID fromString: '{cfecf149-55d7-48d5-b638-36e22dc26aa7}')!

SBSTableCDNDeploymentLibrary comment: ''!

!SBSTableCDNDeploymentLibrary categoriesForClass!Libraries! !

!SBSTableCDNDeploymentLibrary class methodsFor!

bsTableVersion

	^ '1.24.1'!

cdnCSSLocation

	^'https://cdn.jsdelivr.net/npm/bootstrap-table@<1s>/dist/bootstrap-table.min.css' expandMacrosWith: self bsTableVersion!

cdnCSSLocationIntegrity	"Calculated via https://www.srihash.org"	^ 'sha384-tfNXB2/2SVNPdzoqPNMSl0hXmUVBnwOL4odQANKVfu66tA4jFcF+5Ch4nu1LtZAc'!

cdnJSLocation

	^'https://cdn.jsdelivr.net/npm/bootstrap-table@<1s>/dist/bootstrap-table.min.js' expandMacrosWith: self bsTableVersion!

cdnJSLocationIntegrity	"Calculated via https://www.srihash.org"	^ 'sha384-FosO0uRIBBE+YnU4QBFaUk9aMjP2twHyeirpW+jjfqBlKU1Kp576zfju1cWNkx3g'! !

!SBSTableCDNDeploymentLibrary class categoriesForMethods!
bsTableVersion!accessing / defaults!public! !
cdnCSSLocation!accessing / defaults!public! !
cdnCSSLocationIntegrity!accessing / defaults!public! !
cdnJSLocation!accessing / defaults!public! !
cdnJSLocationIntegrity!accessing / defaults!public! !
!

