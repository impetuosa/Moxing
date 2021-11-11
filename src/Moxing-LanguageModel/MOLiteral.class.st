Class {
	#name : #MOLiteral,
	#superclass : #MOLanguageObject,
	#instVars : [
		'literal'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #accessing }
MOLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitLiteral: self .
]

{ #category : #accessing }
MOLiteral >> literal [
	^ literal
]

{ #category : #accessing }
MOLiteral >> literal: aLiteral [
	literal := aLiteral
]
