Class {
	#name : #MOCasinoPartialModelCreator,
	#superclass : #JinCasinoPartialModelCreator,
	#instVars : [
		'context'
	],
	#category : #'Moxing-CasinoBinding'
}

{ #category : #'as yet unclassified' }
MOCasinoPartialModelCreator class >> createModelOnSpecific: migratingItems inTheContextOf: destination named: aName [
	| importer |
	importer := self new.
	importer
		model:
			(CSNUICWModel new
				name: aName;
				yourself);
		context: destination;
		items: migratingItems.
	importer basicRun.
	^ importer
]

{ #category : #run }
MOCasinoPartialModelCreator >> basicRun [
	| importer contextualizer |
	contextualizer := MOCasinoPartialContextCreator new.
	contextualizer load: context into: model.
	importer := JinCasinoAccessModelPartialImporter new
		import: items
		into: model.
	importedProject := importer importedProject.
	errors := contextualizer errors , importer errors
]

{ #category : #run }
MOCasinoPartialModelCreator >> context: aDestinationProject [
	context := aDestinationProject
]
