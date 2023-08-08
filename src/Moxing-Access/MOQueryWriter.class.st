Class {
	#name : #MOQueryWriter,
	#superclass : #MOClassWriter,
	#category : #'Moxing-Access-MicroWriters'
}

{ #category : #visiting }
MOQueryWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitQueryWriter: self 


]

{ #category : #initialization }
MOQueryWriter >> expression: anExpression [

	writeBuilder addExpression: anExpression
]

{ #category : #initialization }
MOQueryWriter >> initializeWriteBuilder [
	writeBuilder := builder queryBuilder
]

{ #category : #initialization }
MOQueryWriter >> sql: anSqlString [

	writeBuilder sql: anSqlString
]

{ #category : #initialization }
MOQueryWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOExpressionWriter.
	^ stmnt
]

{ #category : #initialization }
MOQueryWriter >> writeQueryAttribute: aFullBlockClosure [

	^ self write: aFullBlockClosure inSubWriter: MOQueryAttributeWriter 
]
