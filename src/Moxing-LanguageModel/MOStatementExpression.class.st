Class {
	#name : #MOStatementExpression,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressesSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOStatementExpression class >> isRenamable [
	^ false
]

{ #category : #visiting }
MOStatementExpression >> acceptVisitor: aVisitor [

	^ aVisitor visitStatementExpression: self
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
MOStatementExpression >> isStatementExpression [
	 ^ true 
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

{ #category : #accessing }
MOStatementExpression >> referee: aCandidate [  
	expression referee: aCandidate  
]
