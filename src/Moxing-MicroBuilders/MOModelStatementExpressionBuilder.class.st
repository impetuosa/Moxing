Class {
	#name : #MOModelStatementExpressionBuilder,
	#superclass : #MOModelBuilderDelegate,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-MicroBuilders-statements'
}

{ #category : #'as yet unclassified' }
MOModelStatementExpressionBuilder >> buildsType [

	^ MOStatementExpression
]

{ #category : #accessing }
MOModelStatementExpressionBuilder >> expression [
	^ expression ifNil: [  self error: 'Expression cannot be nil' ]
]

{ #category : #accessing }
MOModelStatementExpressionBuilder >> expression: aMOAssignment [ 
	expression := aMOAssignment
]

{ #category : #accessing }
MOModelStatementExpressionBuilder >> loadBuilderWithEntity: anEntity [ 
	self expression: anEntity expression. 
	
]

{ #category : #accessing }
MOModelStatementExpressionBuilder >> privateBuild [

	^ (self instantiate: MOStatementExpression)
		  expression: self expression;
		  yourself
]
