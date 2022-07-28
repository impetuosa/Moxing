Class {
	#name : #MOSynchronizedBlock,
	#superclass : #MOStatement,
	#instVars : [
		'#lockAccessExpression => MOExpressionSlot one',
		'#block => MOContainmentSlot one'
	],
	#category : #'Moxing-LanguageModel-Statements'
}

{ #category : #accessing }
MOSynchronizedBlock >> block [

	^ block
]

{ #category : #accessing }
MOSynchronizedBlock >> block: anObject [

	block := anObject
]

{ #category : #accessing }
MOSynchronizedBlock >> lockAccessExpression [

	^ lockAccessExpression
]

{ #category : #accessing }
MOSynchronizedBlock >> lockAccessExpression: anObject [

	lockAccessExpression := anObject
]
