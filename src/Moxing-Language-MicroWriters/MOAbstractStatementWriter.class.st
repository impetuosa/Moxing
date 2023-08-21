Class {
	#name : #MOAbstractStatementWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #writing }
MOAbstractStatementWriter >> privateWriteToSurface: anEntity [

	^ surface addStatement: anEntity
]

{ #category : #initialization }
MOAbstractStatementWriter >> writeBlock: aFullBlockClosure [
	^ self write: aFullBlockClosure inSubWriter: MOBlockWriter
]

{ #category : #writing }
MOAbstractStatementWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self write: aBlock inSubWriter: MOExpressionWriter.
	^ stmnt
]
