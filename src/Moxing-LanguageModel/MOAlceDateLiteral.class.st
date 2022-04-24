Class {
	#name : #MOAlceDateLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MOAlceDateLiteral >> acceptVisitor: aVisitor [
^ 	 aVisitor visitDateLiteral: self
]
