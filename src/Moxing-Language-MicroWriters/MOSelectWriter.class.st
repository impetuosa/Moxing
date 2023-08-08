Class {
	#name : #MOSelectWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOSelectWriter >> acceptWritingVisitor: aVisitor [
	^ aVisitor visitSelectWriter: self 


]

{ #category : #adding }
MOSelectWriter >> addCase: aMOCase [

	writeBuilder addCase: aMOCase
]

{ #category : #generated }
MOSelectWriter >> expression: anExpression [

	writeBuilder expression: anExpression
]

{ #category : #writing }
MOSelectWriter >> initializeWriteBuilder [

	writeBuilder := builder selectBuilder
]

{ #category : #generated }
MOSelectWriter >> writeCase: aBlock [

	^ self write: aBlock inSubWriter: MOCaseWriter
]

{ #category : #generated }
MOSelectWriter >> writeCondition: aConditionBlock [
	writeBuilder expression: (self writeExpression: aConditionBlock)
]
