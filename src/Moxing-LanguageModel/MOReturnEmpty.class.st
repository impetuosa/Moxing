Class {
	#name : #MOReturnEmpty,
	#superclass : #MOStatement,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOReturnEmpty >> acceptVisitor: aVisitor [

	^ aVisitor visitReturnEmpty: self
]
