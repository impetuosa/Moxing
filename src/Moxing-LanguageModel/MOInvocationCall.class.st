Class {
	#name : #MOInvocationCall,
	#superclass : #MOExpression,
	#instVars : [
		'#invocableExpression => MOExpressesSlot one',
		'#arguments => MOExpressesSlot many'
	],
	#category : #'Moxing-LanguageModel-References'
}

{ #category : #testing }
MOInvocationCall >> acceptVisitor: aVisitor [

	^ aVisitor visitInvocationCall: self
]

{ #category : #accessing }
MOInvocationCall >> arguments: aCollection [ 
	arguments := aCollection
]

{ #category : #accessing }
MOInvocationCall >> invocableExpression: aJSNameExpressionNode [ 
	invocableExpression := aJSNameExpressionNode
]

{ #category : #testing }
MOInvocationCall >> isInvocation [
	^ true 
]

{ #category : #testing }
MOInvocationCall >> isReference [

	^ true
]
