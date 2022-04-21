Class {
	#name : #MOWhileWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #visiting }
MOWhileWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitWhileWriter: self 


]

{ #category : #writing }
MOWhileWriter >> initializeWriteBuilder [

	writeBuilder := builder loopStatementBuilder.
	writeBuilder forWhile
]
