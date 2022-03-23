Class {
	#name : #MOReturnWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOReturnWriter >> expression: anExpression [

	writeBuilder expression: anExpression
]

{ #category : #writing }
MOReturnWriter >> initializeWriteBuilder [

	writeBuilder := builder returnBuilder
]
