Class {
	#name : #MOContinueWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #writing }
MOContinueWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitContinueWriter: self
]

{ #category : #writing }
MOContinueWriter >> initializeWriteBuilder [

	writeBuilder := builder continueBuilder
]
