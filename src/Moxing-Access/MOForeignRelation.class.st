Class {
	#name : #MOForeignRelation,
	#superclass : #MOExpression,
	#instVars : [
		'#tableFrom => MORefersSlot one',
		'#tableTo => MORefersSlot one',
		'#matches => MORefersSlot many'
	],
	#category : #'Moxing-Access-Expressions'
}

{ #category : #accessing }
MOForeignRelation >> acceptVisitor: aVisitor [

	^ aVisitor visitForeignRelation: self
]

{ #category : #accessing }
MOForeignRelation >> childrenForTree [

	^ matches
]

{ #category : #accessing }
MOForeignRelation >> matches: aCollection [ 
	matches := aCollection
]

{ #category : #accessing }
MOForeignRelation >> tableFrom [
	^ tableFrom
]

{ #category : #accessing }
MOForeignRelation >> tableFrom: aMOTypeReference [ 
	tableFrom := aMOTypeReference
]

{ #category : #accessing }
MOForeignRelation >> tableTo [
	^ tableTo
]

{ #category : #accessing }
MOForeignRelation >> tableTo: aMOTypeReference [ 
	tableTo := aMOTypeReference
]
