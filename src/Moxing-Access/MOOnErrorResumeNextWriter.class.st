Class {
	#name : #MOOnErrorResumeNextWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Access-MicroWriters'
}

{ #category : #visiting }
MOOnErrorResumeNextWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitNextWriter: self 


]

{ #category : #writing }
MOOnErrorResumeNextWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorResumeNextBuilder 
]
