Class {
	#name : #MOStCascade,
	#superclass : #MOExpression,
	#instVars : [
		'#invocations => MOExpressionSlot many'
	],
	#category : #'Moxing-Smalltalk-model'
}

{ #category : #accessing }
MOStCascade >> invocations: aCollection [ 
	invocations := aCollection
]

{ #category : #accessing }
MOStCascade >> isReference [

	^ true
]
