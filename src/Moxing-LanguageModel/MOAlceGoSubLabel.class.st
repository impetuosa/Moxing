Class {
	#name : #MOAlceGoSubLabel,
	#superclass : #MOAlceGoToLabel,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceGoSubLabel >> acceptVisitor: aVisitor [

	^ aVisitor visitGoSub: self
]
