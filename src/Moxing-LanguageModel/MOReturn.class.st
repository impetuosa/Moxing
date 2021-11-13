Class {
	#name : #MOReturn,
	#superclass : #MOLanguageObject,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-LanguageModel-Model'
}

{ #category : #visiting }
MOReturn >> acceptVisitor: aVisitor [

	aVisitor visitReturn: self
]

{ #category : #accessing }
MOReturn >> expression [
	^ expression
]

{ #category : #accessing }
MOReturn >> expression: aMOVariableRererence [ 
	expression := aMOVariableRererence
]
