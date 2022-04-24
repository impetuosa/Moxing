Class {
	#name : #MOIntegerLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOIntegerLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitIntegerLiteral: self
]
