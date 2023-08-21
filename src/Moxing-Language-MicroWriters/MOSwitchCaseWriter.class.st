Class {
	#name : #MOSwitchCaseWriter,
	#superclass : #MOAbstractStatementWriter,
	#category : #'Moxing-Language-MicroWriters-Statements'
}

{ #category : #'as yet unclassified' }
MOSwitchCaseWriter >> acceptWritingVisitor: aVisitor [

	^ aVisitor visitSwitchBlockWriter: self
]

{ #category : #initialization }
MOSwitchCaseWriter >> initializeWriteBuilder [

	writeBuilder := builder switchBlockBuilder 
]

{ #category : #initialization }
MOSwitchCaseWriter >> labels [

	^ writeBuilder labels
]

{ #category : #initialization }
MOSwitchCaseWriter >> privateWriteToSurface: anEntity [
	surface addCase: anEntity

]

{ #category : #initialization }
MOSwitchCaseWriter >> writeBlock: aBlock [

	^ self
		  write: aBlock
		  inSubWriter: MOBlockWriter
		  initializeWith: [ :b | b messageToRegisterBlock: #block: ]
]

{ #category : #initialization }
MOSwitchCaseWriter >> writeCaseLabel: aConditionBlock [

	writeBuilder labels:
		(self writeUnregisteredExpression: aConditionBlock)
]
