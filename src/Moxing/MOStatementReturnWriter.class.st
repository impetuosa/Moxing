Class {
	#name : #MOStatementReturnWriter,
	#superclass : #MOStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #generated }
MOStatementReturnWriter >> expression: aMOVariableReference [

	writeBuilder expression: aMOVariableReference
]

{ #category : #initialization }
MOStatementReturnWriter >> initializeWriteBuilder [

	writeBuilder := builder returnBuilder
]
