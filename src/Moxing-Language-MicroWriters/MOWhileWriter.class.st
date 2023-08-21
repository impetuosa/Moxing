Class {
	#name : #MOWhileWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
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
