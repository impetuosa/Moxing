Class {
	#name : #MOClassProcedure,
	#superclass : #MOProcedure,
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #visiting }
MOClassProcedure >> acceptVisitor: aVisitor [

	^ aVisitor visitClassProcedure: self
]
