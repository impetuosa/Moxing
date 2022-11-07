Class {
	#name : #MOSynchronizedBlock,
	#superclass : #MOStatement,
	#instVars : [
		'#lockAccessExpression => MOExpressesSlot one',
		'#block => MODeclaresSlot one'
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
