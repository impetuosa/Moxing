Class {
	#name : #MODoUntilWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MODoUntilWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitUntilWriter: self 


]

{ #category : #writing }
MODoUntilWriter >> initializeWriteBuilder [

	writeBuilder := builder loopStatementBuilder.
	writeBuilder forDoUntil
]
