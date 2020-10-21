Class {
	#name : #MOTypescriptNewExpression,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'type',
		'arguments'
	],
	#category : #'Moxing-ModelTS'
}

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptNewExpression: self .
]

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> arguments [
	^ arguments
]

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> dependencies [
	^ type dependencies 
]

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> type [
	^ type
]

{ #category : #'as yet unclassified' }
MOTypescriptNewExpression >> type: aMOTypescriptImportedTypeReference [
	type := aMOTypescriptImportedTypeReference
]
