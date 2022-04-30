Class {
	#name : #MOStCascade,
	#superclass : #MOExpression,
	#instVars : [
		'#invocations => MOExpressionSlot many'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStCascade >> acceptVisitor: aVisitor [
  ^aVisitor visitStCascade: self
]

{ #category : #accessing }
MOStCascade >> invocations [
	^ invocations
]

{ #category : #accessing }
MOStCascade >> invocations: aCollection [ 
	invocations := aCollection
]

{ #category : #accessing }
MOStCascade >> isReference [

	^ true
]
