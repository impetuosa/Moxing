Class {
	#name : #MONewExpression,
	#superclass : #MOLanguageObject,
	#instVars : [
		'type',
		'arguments'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #'as yet unclassified' }
MONewExpression >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitNewExpression: self .
]

{ #category : #'as yet unclassified' }
MONewExpression >> arguments [
	^ arguments
]

{ #category : #'as yet unclassified' }
MONewExpression >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MONewExpression >> dependencies [
	^ type dependencies 
]

{ #category : #'as yet unclassified' }
MONewExpression >> type [
	^ type
]

{ #category : #'as yet unclassified' }
MONewExpression >> type: aMOTypescriptImportedTypeReference [
	type := aMOTypescriptImportedTypeReference
]
