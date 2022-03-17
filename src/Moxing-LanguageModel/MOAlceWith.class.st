Class {
	#name : #MOAlceWith,
	#superclass : #MOStatement,
	#instVars : [
		'#expression => MOExpressionSlot one',
		'#block => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #visiting }
MOAlceWith >> acceptVisitor: aVisitor [

	^ aVisitor visitWith: self
]

{ #category : #visiting }
MOAlceWith >> block [

	^ block
]

{ #category : #visiting }
MOAlceWith >> block: aBlock [ 
	 block := aBlock
]

{ #category : #visiting }
MOAlceWith >> expression [

	^ expression
]

{ #category : #visiting }
MOAlceWith >> expression: anExpression [

	expression := anExpression
]