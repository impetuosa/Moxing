Class {
	#name : #MOSwitchWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-MicroWriters'
}

{ #category : #writing }
MOSwitchWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitSwitchWriter: self
]

{ #category : #writing }
MOSwitchWriter >> expression: anExpression [

	writeBuilder expression: anExpression
]

{ #category : #writing }
MOSwitchWriter >> initializeWriteBuilder [

	writeBuilder := builder switchBuilder 
]
