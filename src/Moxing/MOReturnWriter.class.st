Class {
	#name : #MOReturnWriter,
	#superclass : #MOAbstractStatementWriter,
	#instVars : [
		'expression'
	],
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOReturnWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitReturnWriter: self 


]

{ #category : #writing }
MOReturnWriter >> expression: anExpression [

	writeBuilder expression: anExpression
]

{ #category : #writing }
MOReturnWriter >> initializeWriteBuilder [

	writeBuilder := builder returnBuilder
]

{ #category : #writing }
MOReturnWriter >> writeBlockClosure: aFullBlockClosure [ 
	 ^ self writeExpression: [ : exp | exp writeBlockClosure: aFullBlockClosure  ]
]
