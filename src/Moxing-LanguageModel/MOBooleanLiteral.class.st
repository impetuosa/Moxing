Class {
	#name : #MOBooleanLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOBooleanLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitBooleanLiteral: self .
]
