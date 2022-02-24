Class {
	#name : #MOAbstractStatementWriter,
	#superclass : #MOModelProceduralWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOAbstractStatementWriter >> privateSetAnchor: anEntity [ 
	anEntity anchor: surface anchor / #statements / anEntity name
]

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
