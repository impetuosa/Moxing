Class {
	#name : #MOParameter,
	#superclass : #MOVariable,
	#category : #'Moxing-LanguageModel'
}

{ #category : #visiting }
MOParameter >> acceptVisitor: aJinTypescriptCodeGenerator [
	aJinTypescriptCodeGenerator visitParameter: self
]
