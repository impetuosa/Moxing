Class {
	#name : #MOTypescriptLiteral,
	#superclass : #MOTypescriptObject,
	#instVars : [
		'literal'
	],
	#category : #'Moxing-Typescript-Model'
}

{ #category : #accessing }
MOTypescriptLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitTypescriptLiteral: self .
]

{ #category : #accessing }
MOTypescriptLiteral >> literal [
	^ literal
]

{ #category : #accessing }
MOTypescriptLiteral >> literal: aLiteral [
	literal := aLiteral
]
