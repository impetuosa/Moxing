Class {
	#name : #MOCharacterLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOCharacterLiteral >> acceptVisitor: aVisitor [

	^ aVisitor visitCharacterLiteral: self
]
