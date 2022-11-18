Class {
	#name : #MOStatement,
	#superclass : #MOLanguageConstruct,
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

{ #category : #visiting }
MOStatement >> isStatement [

	^ true
]
