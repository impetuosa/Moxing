Class {
	#name : #MOOnErrorResumeNextWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOOnErrorResumeNextWriter >> initializeWriteBuilder [
	writeBuilder := builder onErrorResumeNextBuilder 
]
