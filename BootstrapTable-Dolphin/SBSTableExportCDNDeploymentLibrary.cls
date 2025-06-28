"Filed out from Dolphin Smalltalk"!

SBSCDNDeploymentLibrary subclass: #SBSTableExportCDNDeploymentLibrary
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	classInstanceVariableNames: ''!

SBSTableExportCDNDeploymentLibrary guid: (GUID fromString: '{ecf5ff5e-4d1b-44eb-9dd2-debb98b1b00e}')!

SBSTableExportCDNDeploymentLibrary comment: ''!

!SBSTableExportCDNDeploymentLibrary categoriesForClass!Libraries! !

!SBSTableExportCDNDeploymentLibrary class methodsFor!

addLoadScriptTo: html

	super addLoadScriptTo: html.

	html script
			url: self cdnTableExportJSLocation ;
			attributeAt: 'integrity' put: self cdnTableExportJSLocationIntegrity ;
			attributeAt: 'crossorigin' put: 'anonymous'.

	html script
			url: self cdnTableExportFileSaverJSLocation ;
			attributeAt: 'integrity' put: self cdnTableExportFileSaverJSLocationIntegrity ;
			attributeAt: 'crossorigin' put: 'anonymous'.
			
	html script
			url: self cdnTableExportXlsxJSLocation ;
			attributeAt: 'integrity' put: self cdnTableExportXlsxJSLocationIntegrity ;
			attributeAt: 'crossorigin' put: 'anonymous'.
			
	html script
			url: self cdnTableExportJsPdfJSLocation ;
			attributeAt: 'integrity' put: self cdnTableExportJsPdfJSLocationIntegrity ;
			attributeAt: 'crossorigin' put: 'anonymous'.
			
	html script
			url: self cdnTableExportPngJSLocation ;
			attributeAt: 'integrity' put: self cdnTableExportPngJSLocationIntegrity ;
			attributeAt: 'crossorigin' put: 'anonymous'!

bsTableExportVersion

	^ '1.33.0'!

cdnJSLocation

	^'https://cdn.jsdelivr.net/npm/bootstrap-table@<1s>/dist/extensions/export/bootstrap-table-export.min.js' expandMacrosWith: SBSTableCDNDeploymentLibrary bsTableVersion!

cdnJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-7r09ZDpaLqN4L3r6yF8GyAhZewpJIecqz6cN9M100QV+XX6obZ86FsTmXH6J0gc+'!

cdnTableExportFileSaverJSLocation

	^'https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@<1s>/libs/FileSaver/FileSaver.min.js' expandMacrosWith: self bsTableExportVersion!

cdnTableExportFileSaverJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-PamoNBxpunDiGkGPpNOdOldeH2wH+1cMDhuROZWqjMjU5WXTA5jzhOCiyHmr3LAK'!

cdnTableExportJSLocation

	^'https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@<1s>/tableExport.min.js' expandMacrosWith: self bsTableExportVersion!

cdnTableExportJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-3LDdQ3LnyJi2ZVTV1s4dCLCkXmjZ8w9H+nqLrRCByZGg5fphTgzGpQ0bG8wImjIL'!

cdnTableExportJsPdfJSLocation

	^'https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@<1s>/libs/jsPDF/jspdf.umd.min.js' expandMacrosWith: self bsTableExportVersion!

cdnTableExportJsPdfJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-15uoZT5zN6lseew0GeeAygJQoFCwK/ZzDGIsQag3BmLoWPik5wQ/+BW9YduMQhEX'!

cdnTableExportPngJSLocation

	^'https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@<1s>/libs/html2canvas/html2canvas.min.js' expandMacrosWith: self bsTableExportVersion!

cdnTableExportPngJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-ZHqoDSJdE8wpN2damqZOsmgOoQsACQe+po725aR/V69WwwpZoHoJtAChKh1Yg40Y'!

cdnTableExportXlsxJSLocation

	^'https://cdn.jsdelivr.net/npm/tableexport.jquery.plugin@<1s>/libs/js-xlsx/xlsx.core.min.js' expandMacrosWith: self bsTableExportVersion!

cdnTableExportXlsxJSLocationIntegrity
	"Calculated via https://www.srihash.org"

	^ 'sha384-os4CuJl3LYH4Rv9fIPMaMwFD2nj6cCJMkhAnPpcB48I49sYxQ9g63E6aKyxMWFK8'! !

!SBSTableExportCDNDeploymentLibrary class categoriesForMethods!
addLoadScriptTo:!public!updating! !
bsTableExportVersion!accessing / defaults!public! !
cdnJSLocation!accessing / defaults!public! !
cdnJSLocationIntegrity!accessing / defaults!public! !
cdnTableExportFileSaverJSLocation!accessing / defaults!public! !
cdnTableExportFileSaverJSLocationIntegrity!accessing / defaults!public! !
cdnTableExportJSLocation!accessing / defaults!public! !
cdnTableExportJSLocationIntegrity!accessing / defaults!public! !
cdnTableExportJsPdfJSLocation!accessing / defaults!public! !
cdnTableExportJsPdfJSLocationIntegrity!accessing / defaults!public! !
cdnTableExportPngJSLocation!accessing / defaults!public! !
cdnTableExportPngJSLocationIntegrity!accessing / defaults!public! !
cdnTableExportXlsxJSLocation!accessing / defaults!public! !
cdnTableExportXlsxJSLocationIntegrity!accessing / defaults!public! !
!

