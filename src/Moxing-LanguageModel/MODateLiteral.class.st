Class {
	#name : #MODateLiteral,
	#superclass : #MOLiteral,
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #visiting }
MODateLiteral >> acceptVisitor: aVisitor [
^ 	 aVisitor visitDateLiteral: self
]
