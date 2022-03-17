Class {
	#name : #MOStatement,
	#superclass : #MOLanguageObject,
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOStatement >> acceptVisitor: aVisitor [

	self subclassResponsibility
]

{ #category : #visiting }
MOStatement >> isLabelledAs: aLabel [
 	 ^ false 
]