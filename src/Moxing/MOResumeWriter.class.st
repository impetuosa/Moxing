Class {
	#name : #MOResumeWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOResumeWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitResumeWriter: self 


]

{ #category : #accessing }
MOResumeWriter >> destinations [
	^ writeBuilder destinations 
]

{ #category : #accessing }
MOResumeWriter >> destinations: aCollection [ 
	writeBuilder destinations: aCollection 
]

{ #category : #writing }
MOResumeWriter >> initializeWriteBuilder [

	writeBuilder := builder resumeBuilder
]

{ #category : #accessing }
MOResumeWriter >> writeDestinations: aBlock [

	self destinations: (self writeUnregisteredExpression: aBlock)
]
