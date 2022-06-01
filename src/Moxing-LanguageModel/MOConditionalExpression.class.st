Class {
	#name : #MOConditionalExpression,
	#superclass : #MOExpression,
	#instVars : [
		'#condition => MOExpressionSlot one',
		'#ifTrueExpression => MOExpressionSlot one',
		'#ifFalseExpression => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Expressions'
}

{ #category : #accessing }
MOConditionalExpression >> condition [

	^ condition
]

{ #category : #accessing }
MOConditionalExpression >> condition: anObject [

	condition := anObject
]

{ #category : #accessing }
MOConditionalExpression >> ifFalseExpression [

	^ ifFalseExpression
]

{ #category : #accessing }
MOConditionalExpression >> ifFalseExpression: anObject [

	ifFalseExpression := anObject
]

{ #category : #accessing }
MOConditionalExpression >> ifTrueExpression [

	^ ifTrueExpression
]

{ #category : #accessing }
MOConditionalExpression >> ifTrueExpression: anObject [

	ifTrueExpression := anObject
]