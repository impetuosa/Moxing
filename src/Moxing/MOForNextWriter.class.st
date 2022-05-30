Class {
	#name : #MOForNextWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOForNextWriter >> counter: aMOVariableReference [

	^ writeBuilder counter: aMOVariableReference
]

{ #category : #generated }
MOForNextWriter >> initialValue: aMOIntegerLiteral [

	^ writeBuilder initialValue: aMOIntegerLiteral
]

{ #category : #initialization }
MOForNextWriter >> initializeWriteBuilder [

	writeBuilder := builder forNextStatementBuilder.

]

{ #category : #'as yet unclassified' }
MOForNextWriter >> limitValue: aMOVariableReference [

	^ writeBuilder limitValue: aMOVariableReference
]

{ #category : #accessing }
MOForNextWriter >> step: aMOIntegerLiteral [

	^ writeBuilder step: aMOIntegerLiteral
]

{ #category : #writing }
MOForNextWriter >> writeCounter: aFullBlockClosure [

	self counter: (self writeUnregisteredExpression: aFullBlockClosure)
]

{ #category : #writing }
MOForNextWriter >> writeInitValue: aFullBlockClosure [

	^ self initialValue:
		  (self writeUnregisteredExpression: aFullBlockClosure)
]

{ #category : #writing }
MOForNextWriter >> writeLimitValue: aFullBlockClosure [

	^ self limitValue:
		  (self writeUnregisteredExpression: aFullBlockClosure)
]

{ #category : #writing }
MOForNextWriter >> writeLoopingBlock: aFullBlockClosure [

	^ self writeBlock: aFullBlockClosure
]

{ #category : #writing }
MOForNextWriter >> writeStep: aFullBlockClosure [

	^ self step: (self writeUnregisteredExpression: aFullBlockClosure)
]
