Class {
	#name : #MODoWhile,
	#superclass : #MOLoop,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MODoWhile >> acceptVisitor: aVisitor [

	^ aVisitor visitDoWhileTrue: self
]
