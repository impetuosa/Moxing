Class {
	#name : #MOForEachWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOForEachWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitEachWriter: self 


]

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
