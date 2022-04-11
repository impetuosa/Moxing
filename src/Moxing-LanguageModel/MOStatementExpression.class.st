Class {
	#name : #MOStatementExpression,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOStatementExpression >> acceptVisitor: aVisitor [

	^ aVisitor visitStatementExpression: self
]

{ #category : #accessing }
MOStatementExpression >> candidate: aCandidate [  
	expression candidate: aCandidate  
]

{ #category : #accessing }
MOStatementExpression >> dependencies [

	^ expression dependencies
]

{ #category : #accessing }
MOStatementExpression >> expression [
	^ expression
]

{ #category : #accessing }
MOStatementExpression >> expression: aMOInvocation [ 
	expression := aMOInvocation
]

{ #category : #accessing }
MOStatementExpression >> isLabelledAs: aLabel [

	^ expression isLabelledAs: aLabel
]

{ #category : #accessing }
MOStatementExpression >> isRenamable [
	^ false
]

{ #category : #accessing }
MOStatementExpression >> name [ 
	 ^ 'Expression Statement'
]

{ #category : #accessing }
MOStatementExpression >> printOn: aStream [

	aStream
		nextPutAll: 'Stmt(';
		print: expression;
		nextPutAll: ')'
]
