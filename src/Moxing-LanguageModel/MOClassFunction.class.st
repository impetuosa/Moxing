Class {
	#name : #MOClassFunction,
	#superclass : #MOFunction,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOClassFunction >> acceptVisitor: aVisitor [

	^ aVisitor visitClassFunction: self
]
