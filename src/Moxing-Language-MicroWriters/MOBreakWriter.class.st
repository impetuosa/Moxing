Class {
	#name : #MOBreakWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #writing }
MOBreakWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitBreakWriter: self
]

{ #category : #writing }
MOBreakWriter >> initializeWriteBuilder [

	writeBuilder := builder breakBuilder
]
