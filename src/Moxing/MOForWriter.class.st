Class {
	#name : #MOForWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOForWriter >> initializeOperation: anInitBlock [

	writeBuilder initializeOperation: (self writeExpression: anInitBlock)
]

{ #category : #initialization }
MOForWriter >> initializeWriteBuilder [

	writeBuilder := builder forStatementBuilder.

]

{ #category : #initialization }
MOForWriter >> updateOperation: anUpdateBlock [

	writeBuilder updateOperation: (self writeExpression: anUpdateBlock)
]
