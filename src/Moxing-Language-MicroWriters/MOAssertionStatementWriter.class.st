Class {
	#name : #MOAssertionStatementWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters'
}

{ #category : #visiting }
MOAssertionStatementWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitAssertionWriter: self
]

{ #category : #accessing }
MOAssertionStatementWriter >> argument: aMOVariableReference [

	^ writeBuilder argument: aMOVariableReference
]

{ #category : #visiting }
MOAssertionStatementWriter >> initializeWriteBuilder [

	writeBuilder := builder assertionStatementBuilder
]

{ #category : #accessing }
MOAssertionStatementWriter >> message: aMOBinaryArithmeticOperation [

	^ writeBuilder message: aMOBinaryArithmeticOperation
]
