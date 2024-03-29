Class {
	#name : #MOSynchronizedBlock,
	#superclass : #MOStatement,
	#instVars : [
		'#lockAccessExpression => MOExpressesSlot one',
		'#block => MODeclaresSlot one'
	],
	#category : #'Moxing-Java-Statement'
}

{ #category : #visiting }
MOSynchronizedBlock >> acceptVisitor: aMOModelTypeResolver [

	^ aMOModelTypeResolver visitSynchronizedBlock: self
]

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
