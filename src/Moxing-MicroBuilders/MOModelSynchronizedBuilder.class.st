Class {
	#name : #MOModelSynchronizedBuilder,
	#superclass : #MOModelControlFlowBuilder,
	#instVars : [
		'lockAccessExpression',
		'block'
	],
	#category : #'Moxing-MicroBuilders-control flow'
}

{ #category : #accessing }
MOModelSynchronizedBuilder >> block [

	^ block
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> block: anObject [

	block := anObject
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> buildsType [

	^ MOSynchronizedBlock
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> loadBuilderWithEntity: anEntity [

	self lockAccessExpression: anEntity lockAccessExpression.
	self block: anEntity block
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> lockAccessExpression [

	^ lockAccessExpression
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> lockAccessExpression: anObject [

	lockAccessExpression := anObject
]

{ #category : #accessing }
MOModelSynchronizedBuilder >> privateBuild [

	^ (self instantiate: self buildsType)
		  lockAccessExpression: self lockAccessExpression;
		  block: self block;
		  yourself
]
