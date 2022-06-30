Class {
	#name : #MOInfinityLoop,
	#superclass : #MOLoop,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOInfinityLoop >> acceptVisitor: aVisitor [

	^ aVisitor visitInfinityLoop: self
]
