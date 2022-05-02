Class {
	#name : #MOTableWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOTableWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitTableWriter: self 


]

{ #category : #accessing }
MOTableWriter >> attributes [
	^ writeBuilder attributes 
]

{ #category : #initialization }
MOTableWriter >> expression: anExpression [

	writeBuilder addExpression: anExpression
]

{ #category : #initialization }
MOTableWriter >> indexes: someIndexSet [
	writeBuilder indexes: someIndexSet 
]

{ #category : #initialization }
MOTableWriter >> initializeWriteBuilder [
	writeBuilder := builder tableBuilder
]

{ #category : #initialization }
MOTableWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOExpressionWriter.
	^ stmnt
]
