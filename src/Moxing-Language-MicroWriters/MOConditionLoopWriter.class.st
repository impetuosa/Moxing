Class {
	#name : #MOConditionLoopWriter,
	#superclass : #MOLoopWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #visiting }
MOConditionLoopWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitLoopWriter: self 


]

{ #category : #writing }
MOConditionLoopWriter >> condition: aCondition [

	writeBuilder condition: aCondition
]

{ #category : #writing }
MOConditionLoopWriter >> writeCondition: aConditionBlock [
	writeBuilder condition: (self writeUnregisteredExpression: aConditionBlock)
]
