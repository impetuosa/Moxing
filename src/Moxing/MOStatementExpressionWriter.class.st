Class {
	#name : #MOStatementExpressionWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOStatementExpressionWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitExpressionWriter: self 


]

{ #category : #generated }
MOStatementExpressionWriter >> expression: aMOAssignment [ 
	writeBuilder expression: aMOAssignment 
]

{ #category : #writing }
MOStatementExpressionWriter >> initializeWriteBuilder [

	writeBuilder := builder statementBuilder
]

{ #category : #writing }
MOStatementExpressionWriter >> writeBlockClosure: aFullBlockClosure [ 	
	| ret |
	ret := ((self write: aFullBlockClosure inSubWriter: MOBlockClosureWriter)).
	self expression: ret.
	^ret
]

{ #category : #writing }
MOStatementExpressionWriter >> writeLambda: aFullBlockClosure [ 	
	| ret |
	ret := ((self write: aFullBlockClosure inSubWriter: MOLambdaWriter)).
	self expression: ret.
	^ret
]
