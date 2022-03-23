Class {
	#name : #MOStringLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOStringLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitStringLiteral: self
]
