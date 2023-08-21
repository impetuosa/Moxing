Class {
	#name : #MODoWhileWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MODoWhileWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitDoWhileWriter: self 


]

{ #category : #writing }
MODoWhileWriter >> initializeWriteBuilder [

	writeBuilder := builder loopStatementBuilder.
	writeBuilder forDoWhile
]
