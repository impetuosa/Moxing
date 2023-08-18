Class {
	#name : #MOBreakWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #writing }
MOBreakWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitBreakWriter: self
]

{ #category : #writing }
MOBreakWriter >> initializeWriteBuilder [

	writeBuilder := builder breakBuilder
]