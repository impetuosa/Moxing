Class {
	#name : #MOForeignRelation,
	#superclass : #MOExpression,
	#instVars : [
		'#tableFrom => MOReferenceSlot one',
		'#tableTo => MOReferenceSlot one',
		'#matches => MOReferenceSlot many'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOForeignRelation >> acceptVisitor: aVisitor [

	aVisitor visitForeignRelation: self
]

{ #category : #accessing }
MOForeignRelation >> matches: aCollection [ 
	matches := aCollection
]

{ #category : #accessing }
MOForeignRelation >> tableFrom: aMOTypeReference [ 
	tableFrom := aMOTypeReference
]

{ #category : #accessing }
MOForeignRelation >> tableTo: aMOTypeReference [ 
	tableTo := aMOTypeReference
]
