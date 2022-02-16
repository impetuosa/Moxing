Class {
	#name : #MOConditionLoopWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOConditionLoopWriter >> condition: aConditionBlock [
	writeBuilder condition: (self writeExpression: aConditionBlock)
]
