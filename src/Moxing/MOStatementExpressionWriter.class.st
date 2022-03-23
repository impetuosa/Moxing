Class {
	#name : #MOStatementExpressionWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #generated }
MOStatementExpressionWriter >> expression: aMOAssignment [ 
	writeBuilder expression: aMOAssignment 
]

{ #category : #writing }
MOStatementExpressionWriter >> initializeWriteBuilder [

	writeBuilder := builder statementBuilder
]
