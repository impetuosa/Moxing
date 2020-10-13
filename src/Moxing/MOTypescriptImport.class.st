Class {
	#name : #MOTypescriptImport,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'types',
		'from'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptImport >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptImport:  self .
]

{ #category : #'as yet unclassified' }
MOTypescriptImport >> from [
	^ from
]

{ #category : #'as yet unclassified' }
MOTypescriptImport >> from: aFileReference [
	from := aFileReference
]

{ #category : #']as yet unclassified' }
MOTypescriptImport >> types [
	^ types
]

{ #category : #'as yet unclassified' }
MOTypescriptImport >> types: aCollection [
	types := aCollection
]
