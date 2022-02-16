Class {
	#name : #MOJavaImportCatalogTestCase,
	#superclass : #TestCase,
	#instVars : [
		'catalog'
	],
	#category : #'Moxing-Java-Test'
}

{ #category : #initialization }
MOJavaImportCatalogTestCase >> runCaseManaged [
	^ self runCase
]

{ #category : #initialization }
MOJavaImportCatalogTestCase >> setUp [

	| loader |
	loader := MOJavaTarCatalogLoader new.
	catalog := MOCatalog new.
	catalog anchor: (MOAnchor on: #/).
	loader load: loader javaLang into: catalog.
	MOModelLinker new link: catalog
]

{ #category : #initialization }
MOJavaImportCatalogTestCase >> testCatalogIsLinks [
]
