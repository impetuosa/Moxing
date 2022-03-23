Class {
	#name : #MOBooleanLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOBooleanLiteral >> acceptVisitor: aJinTypescriptCodeGenerator [

	^ aJinTypescriptCodeGenerator visitBooleanLiteral: self
]
