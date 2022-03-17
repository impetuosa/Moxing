Class {
	#name : #MOForWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOForWriter >> initializeWriteBuilder [

	writeBuilder := builder forStatementBuilder.

]

{ #category : #initialization }
MOForWriter >> writeInitializeOperation: anInitBlock [

	writeBuilder initializeOperation: (self writeUnregisteredExpression:  anInitBlock)
]

{ #category : #initialization }
MOForWriter >> writeUpdateOperation: anUpdateBlock [

	writeBuilder updateOperation: (self writeUnregisteredExpression:  anUpdateBlock)
]