Class {
	#name : #MOStringLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOStringLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [ 
	aJinTypescriptCodeGenerator visitStringLiteral: self .
]
