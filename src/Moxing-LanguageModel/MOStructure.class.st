Class {
	#name : #MOStructure,
	#superclass : #MOType,
	#instVars : [
		'#attributes => MOContainmentSlot many'
	],
	#category : #'Moxing-LanguageModel-Declaration'
}

{ #category : #accessing }
MOStructure >> acceptVisitor: aVisitor [

	^ aVisitor visitStructure: self
]

{ #category : #'as yet unclassified' }
MOStructure >> attributes [
	^ attributes
]

{ #category : #accessing }
MOStructure >> attributes: aCollection [ 
	attributes := aCollection
]
