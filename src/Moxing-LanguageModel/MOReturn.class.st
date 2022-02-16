Class {
	#name : #MOReturn,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressionSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOReturn >> acceptVisitor: aVisitor [

	^ aVisitor visitReturn: self
]

{ #category : #accessing }
MOReturn >> expression [
	^ expression
]

{ #category : #accessing }
MOReturn >> expression: aMOVariableRererence [ 
	expression := aMOVariableRererence
]
