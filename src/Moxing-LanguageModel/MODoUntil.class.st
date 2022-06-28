Class {
	#name : #MODoUntil,
	#superclass : #MOLoop,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MODoUntil >> acceptVisitor: aVisitor [

	^ aVisitor visitDoUntilTrue:  self
]
