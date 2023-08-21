Class {
	#name : #MOModelConditionalExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'condition',
		'ifTrueExpression',
		'ifFalseExpression'
	],
	#category : #'Moxing-Language-MicroBuilders-Type-reference'
}

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> buildsType [

	^ MOConditionalExpression
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> condition [

	^ condition
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> condition: anObject [

	condition := anObject
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> ifFalseExpression [

	^ ifFalseExpression
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> ifFalseExpression: anObject [

	ifFalseExpression := anObject
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> ifTrueExpression [

	^ ifTrueExpression
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> ifTrueExpression: anObject [

	ifTrueExpression := anObject
]

{ #category : #accessing }
MOModelConditionalExpressionBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  condition: self condition;
		  ifTrueExpression: self ifTrueExpression;
		  ifFalseExpression: self ifFalseExpression;
		  yourself
]
