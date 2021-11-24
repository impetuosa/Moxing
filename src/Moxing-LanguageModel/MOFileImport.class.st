Class {
	#name : #MOFileImport,
	#superclass : #MOImport,
	#instVars : [
		'from'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MOFileImport >> from [
	^ from
]

{ #category : #'as yet unclassified' }
MOFileImport >> from: aFileReference [
	(aFileReference isKindOf: FileReference)
		ifTrue: [ self halt ].
	from := aFileReference
]

{ #category : #'as yet unclassified' }
MOFileImport >> fromString [
	^ from ifNil: [ 'ERROR! FROM IS EMPTTY' ] ifNotNil: [ from ]
]