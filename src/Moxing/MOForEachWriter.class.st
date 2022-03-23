Class {
	#name : #MOForEachWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOForEachWriter >> initializeWriteBuilder [

	writeBuilder := builder forEachStatementBuilder.

]

{ #category : #initialization }
MOForEachWriter >> writeCollection: anCollectionBlock [

	writeBuilder collection:
		(self writeUnregisteredExpression: anCollectionBlock)
]

{ #category : #initialization }
MOForEachWriter >> writeEach: anEachBlock [

	writeBuilder each: (self writeUnregisteredExpression:  anEachBlock)
]
