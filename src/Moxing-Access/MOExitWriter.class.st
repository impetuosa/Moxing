Class {
	#name : #MOExitWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Access-MicroWriters'
}

{ #category : #visiting }
MOExitWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitExitWriter: self 


]

{ #category : #initialization }
MOExitWriter >> initializeWriteBuilder [ 
	writeBuilder := builder exitBuilder
]
