Class {
	#name : #MOResumeWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #accessing }
MOResumeWriter >> destinations [
	^ writeBuilder destinations 
]

{ #category : #writing }
MOResumeWriter >> initializeWriteBuilder [

	writeBuilder := builder resumeBuilder
]
