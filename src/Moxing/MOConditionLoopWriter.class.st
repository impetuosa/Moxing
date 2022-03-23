Class {
	#name : #MOConditionLoopWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOConditionLoopWriter >> condition: aCondition [

	writeBuilder condition: aCondition
]

{ #category : #writing }
MOConditionLoopWriter >> writeCondition: aConditionBlock [
	writeBuilder condition: (self writeUnregisteredExpression: aConditionBlock)
]
