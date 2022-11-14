Class {
	#name : #MOModelExpressionStatementBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #accessing }
MOModelExpressionStatementBuilder >> buildsType [

	^ MOStatementExpression
]

{ #category : #accessing }
MOModelExpressionStatementBuilder >> expression [
	^ expression ifNil: [ self error: 'Statement cannot be built without an expression! ' ]
]

{ #category : #accessing }
MOModelExpressionStatementBuilder >> expression: aMOInvocation [ 
	expression := aMOInvocation
]

{ #category : #accessing }
MOModelExpressionStatementBuilder >> loadBuilderWithEntity: anEntity [ 
	expression := anEntity expression .
]

{ #category : #accessing }
MOModelExpressionStatementBuilder >> privateBuild [

	^ (self instantiate: MOStatementExpression)
		  expression: self expression;
		  yourself
]
