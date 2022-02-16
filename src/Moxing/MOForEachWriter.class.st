Class {
	#name : #MOForEachWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #initialization }
MOForEachWriter >> collection: anCollectionBlock [

	writeBuilder collection: (self writeExpression: anCollectionBlock)
]

{ #category : #initialization }
MOForEachWriter >> each: anEachBlock [

	writeBuilder each: (self writeExpression: anEachBlock)
]

{ #category : #initialization }
MOForEachWriter >> initializeWriteBuilder [

	writeBuilder := builder forEachStatementBuilder.

]
