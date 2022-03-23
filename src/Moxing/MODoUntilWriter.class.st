Class {
	#name : #MODoUntilWriter,
	#superclass : #MOConditionLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MODoUntilWriter >> initializeWriteBuilder [

	writeBuilder := builder loopStatementBuilder.
	writeBuilder forDoUntil
]
