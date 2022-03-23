Class {
	#name : #MOWhileWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOWhileWriter >> initializeWriteBuilder [

	writeBuilder := builder loopStatementBuilder.
	writeBuilder forWhile
]
