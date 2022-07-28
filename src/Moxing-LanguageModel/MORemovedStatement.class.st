Class {
	#name : #MORemovedStatement,
	#superclass : #MOComment,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MORemovedStatement >> acceptVisitor: aVisitor [

	^ aVisitor visitRemovedStatement: self
]
