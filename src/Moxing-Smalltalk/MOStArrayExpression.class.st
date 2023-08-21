Class {
	#name : #MOStArrayExpression,
	#superclass : #MOExpression,
	#instVars : [
		'#elements => MOExpressesSlot many'
	],
	#category : #'Moxing-Smalltalk-Model'
}

{ #category : #accessing }
MOStArrayExpression >> acceptVisitor: aVisitor [

	^ aVisitor visitStArrayExpression: self
]

{ #category : #accessing }
MOStArrayExpression >> elements [

	^ elements
]

{ #category : #accessing }
MOStArrayExpression >> elements: some [

	elements := some
]

{ #category : #accessing }
MOStArrayExpression >> isReference [

	^ true
]
