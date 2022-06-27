Class {
	#name : #MOOnErrorResumeNextWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOOnErrorResumeNextWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitNextWriter: self 


]

{ #category : #writing }
MOOnErrorResumeNextWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorResumeNextBuilder 
]
