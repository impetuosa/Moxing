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
	surface setAsParentOf: anEntity .
	surface addStatement: anEntity

]

{ #category : #initialization }
MOAbstractStatementWriter >> writeBlock: aFullBlockClosure [
	^ self immediatelyWrite: aFullBlockClosure withWriter: MOBlockWriter
]

{ #category : #writing }
MOAbstractStatementWriter >> writeExpression: aBlock [

	| stmnt |
	stmnt := self immediatelyWrite: aBlock withWriter: MOExpressionWriter.
	^ stmnt
]
